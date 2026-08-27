#include "llvm/ADT/APInt.h"
#include "llvm/IR/DebugInfoMetadata.h"
#include "llvm/IR/PassManager.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/InstrTypes.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Module.h"
#include "llvm/Config/llvm-config.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include "llvm/Support/CommandLine.h"
#include <cstdlib>
#include <fstream>
#include <map>
#include <string>

using namespace llvm;

static cl::opt<int> FiSite("fi-site", cl::desc("Injection site ID (1-based)"), cl::init(-1));
static cl::opt<int> FiBit("fi-bit", cl::desc("Bit index to flip (0-based)"), cl::init(0));
static cl::opt<bool> FiOnlyIntFloat("fi-int-float-only", cl::desc("Restrict to int/float types"), cl::init(true));
static cl::opt<std::string> FiTarget("fi-target",
                                       cl::desc("Injection target: result|operand|pointer|all; result means the SSA value produced by an instruction"),
                                       cl::init("result"));
static cl::opt<std::string> FiDumpSites("fi-dump-sites", cl::desc("Write injection site list CSV"), cl::init(""));
static cl::opt<std::string> FiDumpSitesRich("fi-dump-sites-rich",
                                            cl::desc("Write rich injection site metadata CSV"),
                                            cl::init(""));
static cl::opt<bool> FiIncludeConstants("fi-include-constants",
                                        cl::desc("Include constant operands when targeting operands/pointers"),
                                        cl::init(false));

namespace {

static std::string envString(const char *Name) {
  const char *Value = std::getenv(Name);
  return Value ? std::string(Value) : std::string();
}

static int envInt(const char *Name, int Default) {
  const char *Value = std::getenv(Name);
  if (!Value || !*Value)
    return Default;
  return std::atoi(Value);
}

static bool envBool(const char *Name, bool Default) {
  const char *Value = std::getenv(Name);
  if (!Value || !*Value)
    return Default;
  return std::atoi(Value) != 0;
}

static int activeSite() {
  return FiSite.getNumOccurrences() ? FiSite : envInt("FI_SITE", FiSite);
}

static int activeBit() {
  return FiBit.getNumOccurrences() ? FiBit : envInt("FI_BIT", FiBit);
}

static bool activeOnlyIntFloat() {
  return FiOnlyIntFloat.getNumOccurrences() ? FiOnlyIntFloat : envBool("FI_INT_FLOAT_ONLY", FiOnlyIntFloat);
}

static bool activeIncludeConstants() {
  return FiIncludeConstants.getNumOccurrences() ? FiIncludeConstants : envBool("FI_INCLUDE_CONSTANTS", FiIncludeConstants);
}

static std::string activeTarget() {
  if (FiTarget.getNumOccurrences())
    return FiTarget;
  std::string fromEnv = envString("FI_TARGET");
  return fromEnv.empty() ? static_cast<std::string>(FiTarget) : fromEnv;
}

struct FiInjectPass : public PassInfoMixin<FiInjectPass> {
  static std::string csvEscape(const std::string &S) {
    if (S.find_first_of(",\"\n\r") == std::string::npos)
      return S;
    std::string Out = "\"";
    for (char C : S) {
      if (C == '"')
        Out += "\"\"";
      else
        Out += C;
    }
    Out += "\"";
    return Out;
  }

  static std::string typeKind(Type *Ty) {
    if (Ty->isIntegerTy())
      return "int";
    if (Ty->isFloatingPointTy())
      return "float";
    if (Ty->isPointerTy())
      return "ptr";
    return "other";
  }

  static unsigned typeBitWidth(Type *Ty, const DataLayout &DL) {
    if (Ty->isIntegerTy())
      return cast<IntegerType>(Ty)->getBitWidth();
    if (Ty->isFloatingPointTy())
      return Ty->getPrimitiveSizeInBits();
    if (Ty->isPointerTy())
      return DL.getPointerTypeSizeInBits(Ty);
    return 0;
  }

  static std::string sourceFileFor(const Function &F, const Instruction &I) {
    std::string FileName;
    std::string DirName;
    if (const DILocation *Loc = I.getDebugLoc().get()) {
      if (auto *Scope = dyn_cast<DIScope>(Loc->getScope())) {
        if (DIFile *File = Scope->getFile()) {
          FileName = File->getFilename().str();
          DirName = File->getDirectory().str();
        }
      }
    }
    if (FileName.empty()) {
      if (DISubprogram *SP = F.getSubprogram()) {
        if (DIFile *File = SP->getFile()) {
          FileName = File->getFilename().str();
          DirName = File->getDirectory().str();
        }
      }
    }
    if (FileName.empty())
      return "";
    if (DirName.empty())
      return FileName;
    return DirName + "/" + FileName;
  }

  PreservedAnalyses run(Module &M, ModuleAnalysisManager &) {
    int selectedSite = activeSite();
    int selectedBit = activeBit();
    bool onlyIntFloat = activeOnlyIntFloat();
    bool includeConstants = activeIncludeConstants();
    std::string targetName = activeTarget();

    bool doDump = !FiDumpSites.empty();
    bool doDumpRich = !FiDumpSitesRich.empty();
    std::ofstream dump;
    std::ofstream dumpRich;
    if (doDump) {
      bool writeHeader = true;
      std::ifstream check(FiDumpSites);
      if (check.good()) {
        char c;
        if (check.get(c)) {
          writeHeader = false;
        }
      }
      dump.open(FiDumpSites, std::ios::app);
      if (!dump.is_open()) {
        return PreservedAnalyses::none();
      }
      if (writeHeader) {
        dump << "site_id,opcode,type_kind,bitwidth,operand_index,function\n";
      }
    }
    if (doDumpRich) {
      bool writeHeader = true;
      std::ifstream check(FiDumpSitesRich);
      if (check.good()) {
        char c;
        if (check.get(c)) {
          writeHeader = false;
        }
      }
      dumpRich.open(FiDumpSitesRich, std::ios::app);
      if (!dumpRich.is_open()) {
        return PreservedAnalyses::none();
      }
      if (writeHeader) {
        dumpRich << "site_id,site_class,opcode,type_kind,bitwidth,operand_index,function,source_file,source_line,"
                    "source_column,signature_ordinal,semantic_key\n";
      }
    }

    int curId = 0;
    const DataLayout &DL = M.getDataLayout();
    bool targetAll = targetName == "all";
    bool targetResult = targetAll || targetName == "result";
    bool targetOperandOnly = targetName == "operand";
    bool targetPointerOnly = targetName == "pointer";
    bool targetAnyOperand = targetAll || targetOperandOnly || targetPointerOnly;
    for (Function &F : M) {
      if (F.isDeclaration())
        continue;
      std::map<std::string, unsigned> signatureOrdinal;
      for (BasicBlock &BB : F) {
        Instruction *insertAfterPhi = nullptr;
        for (Instruction &I : BB) {
          if (isa<PHINode>(&I))
            insertAfterPhi = &I;
        }
        for (Instruction &I : BB) {
          if (isa<DbgInfoIntrinsic>(&I))
            continue;
          if (targetResult) {
            if (I.getType()->isVoidTy())
              continue;
            if (I.isTerminator())
              continue;
            if (onlyIntFloat && !(I.getType()->isIntegerTy() || I.getType()->isFloatingPointTy()))
              continue;

            curId++;
            std::string kind = typeKind(I.getType());
            unsigned width = typeBitWidth(I.getType(), DL);
            std::string siteClass = "result";
            std::string sourceFile = sourceFileFor(F, I);
            unsigned sourceLine = I.getDebugLoc() ? I.getDebugLoc().getLine() : 0;
            unsigned sourceColumn = I.getDebugLoc() ? I.getDebugLoc().getCol() : 0;
            std::string sigKey = siteClass + "|" + I.getOpcodeName() + "|" + kind + "|" + std::to_string(width) +
                                 "|-1";
            unsigned ordinal = ++signatureOrdinal[sigKey];
            std::string semanticKey =
                F.getName().str() + "|" + sigKey + "|" + sourceFile + "|" + std::to_string(sourceLine) + "|" +
                std::to_string(sourceColumn) + "|" + std::to_string(ordinal);
            if (doDump) {
              dump << curId << "," << I.getOpcodeName() << "," << kind << "," << width << ",-1,"
                   << I.getFunction()->getName().str() << "\n";
            }
            if (doDumpRich) {
              dumpRich << curId << "," << csvEscape(siteClass) << "," << csvEscape(I.getOpcodeName()) << ","
                       << csvEscape(kind) << "," << width << ",-1," << csvEscape(I.getFunction()->getName().str())
                       << "," << csvEscape(sourceFile) << "," << sourceLine << "," << sourceColumn << "," << ordinal
                       << "," << csvEscape(semanticKey) << "\n";
            }
            if (curId == selectedSite && selectedSite >= 1) {
              Instruction *insertPt = I.getNextNode();
              if (!insertPt) {
                insertPt = insertAfterPhi ? insertAfterPhi->getNextNode() : nullptr;
              }
              if (!insertPt) {
                return PreservedAnalyses::none();
              }

              IRBuilder<> B(insertPt);
              Value *orig = &I;
              Value *flipVal = nullptr;
              SmallVector<Instruction *, 4> newInsts;

              if (I.getType()->isIntegerTy()) {
                IntegerType *Ty = cast<IntegerType>(I.getType());
                unsigned width = Ty->getBitWidth();
                unsigned bit = (selectedBit < 0) ? 0 : (unsigned)selectedBit;
                if (bit >= width)
                  bit = width - 1;
                APInt maskVal = APInt::getOneBitSet(width, bit);
                Value *mask = ConstantInt::get(Ty, maskVal);
                auto *xorInst = cast<Instruction>(B.CreateXor(orig, mask, "fi_flip"));
                newInsts.push_back(xorInst);
                flipVal = xorInst;
              } else if (I.getType()->isFloatingPointTy()) {
                Type *FTy = I.getType();
                unsigned width = FTy->getPrimitiveSizeInBits();
                if (width == 0)
                  return PreservedAnalyses::none();
                unsigned bit = (selectedBit < 0) ? 0 : (unsigned)selectedBit;
                if (bit >= width)
                  bit = width - 1;
                IntegerType *ITy = IntegerType::get(M.getContext(), width);
                auto *asInt = cast<Instruction>(B.CreateBitCast(orig, ITy, "fi_f2i"));
                APInt maskVal = APInt::getOneBitSet(width, bit);
                Value *mask = ConstantInt::get(ITy, maskVal);
                auto *xored = cast<Instruction>(B.CreateXor(asInt, mask, "fi_fx"));
                auto *flipInst = cast<Instruction>(B.CreateBitCast(xored, FTy, "fi_i2f"));
                newInsts.push_back(asInt);
                newInsts.push_back(xored);
                newInsts.push_back(flipInst);
                flipVal = flipInst;
              } else if (!onlyIntFloat && I.getType()->isPointerTy()) {
                Type *PTy = I.getType();
                unsigned width = typeBitWidth(PTy, DL);
                if (width == 0)
                  return PreservedAnalyses::none();
                unsigned bit = (selectedBit < 0) ? 0 : (unsigned)selectedBit;
                if (bit >= width)
                  bit = width - 1;
                IntegerType *ITy = IntegerType::get(M.getContext(), width);
                auto *asInt = cast<Instruction>(B.CreatePtrToInt(orig, ITy, "fi_p2i"));
                APInt maskVal = APInt::getOneBitSet(width, bit);
                Value *mask = ConstantInt::get(ITy, maskVal);
                auto *xored = cast<Instruction>(B.CreateXor(asInt, mask, "fi_px"));
                auto *flipInst = cast<Instruction>(B.CreateIntToPtr(xored, PTy, "fi_i2p"));
                newInsts.push_back(asInt);
                newInsts.push_back(xored);
                newInsts.push_back(flipInst);
                flipVal = flipInst;
              }

              if (!flipVal)
                return PreservedAnalyses::none();

              SmallVector<Use *, 8> uses;
              for (Use &U : I.uses())
                uses.push_back(&U);
              for (Use *U : uses) {
                Instruction *userI = dyn_cast<Instruction>(U->getUser());
                if (userI) {
                  bool skip = false;
                  for (Instruction *inst : newInsts) {
                    if (userI == inst) {
                      skip = true;
                      break;
                    }
                  }
                  if (skip)
                    continue;
                }
                U->set(flipVal);
              }

              return PreservedAnalyses::none();
            }
          }

          if (targetAnyOperand) {
            if (isa<PHINode>(&I))
              continue;
            for (unsigned opIdx = 0; opIdx < I.getNumOperands(); ++opIdx) {
              Value *Op = I.getOperand(opIdx);
              if (!Op)
                continue;
              if (!includeConstants && isa<Constant>(Op))
                continue;
              Type *Ty = Op->getType();
              bool isPointer = Ty->isPointerTy();
              if (targetPointerOnly && !isPointer)
                continue;
              if (!isPointer && onlyIntFloat &&
                  !(Ty->isIntegerTy() || Ty->isFloatingPointTy()))
                continue;
              if (!isPointer && targetPointerOnly)
                continue;
              if (targetOperandOnly && isPointer)
                continue;

              curId++;
              std::string kind = typeKind(Ty);
              unsigned width = typeBitWidth(Ty, DL);
              std::string siteClass = isPointer ? "pointer" : "operand";
              std::string sourceFile = sourceFileFor(F, I);
              unsigned sourceLine = I.getDebugLoc() ? I.getDebugLoc().getLine() : 0;
              unsigned sourceColumn = I.getDebugLoc() ? I.getDebugLoc().getCol() : 0;
              std::string sigKey = siteClass + "|" + I.getOpcodeName() + "|" + kind + "|" + std::to_string(width) +
                                   "|" + std::to_string(opIdx);
              unsigned ordinal = ++signatureOrdinal[sigKey];
              std::string semanticKey =
                  F.getName().str() + "|" + sigKey + "|" + sourceFile + "|" + std::to_string(sourceLine) + "|" +
                  std::to_string(sourceColumn) + "|" + std::to_string(ordinal);
              if (doDump) {
                dump << curId << "," << I.getOpcodeName() << "," << kind << "," << width << "," << opIdx << ","
                     << I.getFunction()->getName().str() << "\n";
              }
              if (doDumpRich) {
                dumpRich << curId << "," << csvEscape(siteClass) << "," << csvEscape(I.getOpcodeName()) << ","
                         << csvEscape(kind) << "," << width << "," << opIdx << ","
                         << csvEscape(I.getFunction()->getName().str()) << "," << csvEscape(sourceFile) << ","
                         << sourceLine << "," << sourceColumn << "," << ordinal << "," << csvEscape(semanticKey)
                         << "\n";
              }
              if (curId != selectedSite || selectedSite < 1)
                continue;

              Instruction *insertPt = &I;
              IRBuilder<> B(insertPt);
              Value *orig = Op;
              Value *flipVal = nullptr;

              if (Ty->isIntegerTy()) {
                IntegerType *ITy = cast<IntegerType>(Ty);
                unsigned width = ITy->getBitWidth();
                unsigned bit = (selectedBit < 0) ? 0 : (unsigned)selectedBit;
                if (bit >= width)
                  bit = width - 1;
                APInt maskVal = APInt::getOneBitSet(width, bit);
                Value *mask = ConstantInt::get(ITy, maskVal);
                flipVal = B.CreateXor(orig, mask, "fi_op_xor");
              } else if (Ty->isFloatingPointTy()) {
                unsigned width = Ty->getPrimitiveSizeInBits();
                if (width == 0)
                  return PreservedAnalyses::none();
                unsigned bit = (selectedBit < 0) ? 0 : (unsigned)selectedBit;
                if (bit >= width)
                  bit = width - 1;
                IntegerType *ITy = IntegerType::get(M.getContext(), width);
                auto *asInt = B.CreateBitCast(orig, ITy, "fi_op_f2i");
                APInt maskVal = APInt::getOneBitSet(width, bit);
                Value *mask = ConstantInt::get(ITy, maskVal);
                auto *xored = B.CreateXor(asInt, mask, "fi_op_fx");
                flipVal = B.CreateBitCast(xored, Ty, "fi_op_i2f");
              } else if (Ty->isPointerTy()) {
                unsigned width = typeBitWidth(Ty, DL);
                if (width == 0)
                  return PreservedAnalyses::none();
                unsigned bit = (selectedBit < 0) ? 0 : (unsigned)selectedBit;
                if (bit >= width)
                  bit = width - 1;
                IntegerType *ITy = IntegerType::get(M.getContext(), width);
                auto *asInt = B.CreatePtrToInt(orig, ITy, "fi_op_p2i");
                APInt maskVal = APInt::getOneBitSet(width, bit);
                Value *mask = ConstantInt::get(ITy, maskVal);
                auto *xored = B.CreateXor(asInt, mask, "fi_op_px");
                flipVal = B.CreateIntToPtr(xored, Ty, "fi_op_i2p");
              }

              if (!flipVal)
                return PreservedAnalyses::none();

              I.setOperand(opIdx, flipVal);
              return PreservedAnalyses::none();
            }
          }
        }
      }
    }
    return PreservedAnalyses::all();
  }
};

} // namespace

extern "C" LLVM_ATTRIBUTE_WEAK PassPluginLibraryInfo llvmGetPassPluginInfo() {
  return {
      LLVM_PLUGIN_API_VERSION, "fi-inject", LLVM_VERSION_STRING,
      [](PassBuilder &PB) {
        PB.registerPipelineParsingCallback(
            [](StringRef Name, ModulePassManager &MPM,
               ArrayRef<PassBuilder::PipelineElement>) {
              if (Name == "fi-inject") {
                MPM.addPass(FiInjectPass());
                return true;
              }
              return false;
            });
#if LLVM_VERSION_MAJOR >= 18
        PB.registerOptimizerLastEPCallback(
            [](ModulePassManager &MPM, OptimizationLevel, ThinOrFullLTOPhase) {
              if (std::getenv("FI_SITE"))
                MPM.addPass(FiInjectPass());
            });
#else
        PB.registerOptimizerLastEPCallback(
            [](ModulePassManager &MPM, OptimizationLevel) {
              if (std::getenv("FI_SITE"))
                MPM.addPass(FiInjectPass());
            });
#endif
      }};
}
