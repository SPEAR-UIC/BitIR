#include "llvm/ADT/APInt.h"
#include "llvm/IR/PassManager.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/InstrTypes.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Module.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include "llvm/Support/CommandLine.h"
#include <fstream>

using namespace llvm;

static cl::opt<int> LlfiSite("llfi-site", cl::desc("Injection site ID (1-based)"), cl::init(-1));
static cl::opt<int> LlfiBit("llfi-bit", cl::desc("Bit index to flip (0-based)"), cl::init(0));
static cl::opt<bool> LlfiOnlyIntFloat("llfi-int-float-only", cl::desc("Inject only into int/float results"), cl::init(true));
static cl::opt<std::string> LlfiDumpSites("llfi-dump-sites", cl::desc("Write injection site list CSV"), cl::init(""));

namespace {

struct LlfiInjectPass : public PassInfoMixin<LlfiInjectPass> {
  PreservedAnalyses run(Module &M, ModuleAnalysisManager &) {
    if (M.getTargetTriple().find("nvptx") == std::string::npos) {
      return PreservedAnalyses::all();
    }

    bool doDump = !LlfiDumpSites.empty();
    std::ofstream dump;
    if (doDump) {
      bool writeHeader = true;
      std::ifstream check(LlfiDumpSites);
      if (check.good()) {
        char c;
        if (check.get(c)) {
          writeHeader = false;
        }
      }
      dump.open(LlfiDumpSites, std::ios::app);
      if (!dump.is_open()) {
        return PreservedAnalyses::none();
      }
      if (writeHeader) {
        dump << "site_id,opcode,type_kind,bitwidth\n";
      }
    }

    int curId = 0;
    for (Function &F : M) {
      if (F.isDeclaration())
        continue;
      for (BasicBlock &BB : F) {
        Instruction *insertAfterPhi = nullptr;
        for (Instruction &I : BB) {
          if (isa<PHINode>(&I))
            insertAfterPhi = &I;
        }
        for (Instruction &I : BB) {
          if (isa<DbgInfoIntrinsic>(&I))
            continue;
          if (I.getType()->isVoidTy())
            continue;
          if (I.isTerminator())
            continue;
          if (LlfiOnlyIntFloat && !(I.getType()->isIntegerTy() || I.getType()->isFloatingPointTy()))
            continue;

          curId++;
          if (doDump) {
            std::string kind = "other";
            unsigned width = 0;
            if (I.getType()->isIntegerTy()) {
              kind = "int";
              width = cast<IntegerType>(I.getType())->getBitWidth();
            } else if (I.getType()->isFloatingPointTy()) {
              kind = "float";
              width = I.getType()->getPrimitiveSizeInBits();
            }
            dump << curId << "," << I.getOpcodeName() << "," << kind << "," << width << "\n";
          }
          if (curId != LlfiSite)
            continue;
          if (LlfiSite < 1)
            continue;

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
            unsigned bit = (LlfiBit < 0) ? 0 : (unsigned)LlfiBit;
            if (bit >= width)
              bit = width - 1;
            APInt maskVal = APInt::getOneBitSet(width, bit);
            Value *mask = ConstantInt::get(Ty, maskVal);
            auto *xorInst = cast<Instruction>(B.CreateXor(orig, mask, "llfi_flip"));
            newInsts.push_back(xorInst);
            flipVal = xorInst;
          } else if (I.getType()->isFloatingPointTy()) {
            Type *FTy = I.getType();
            unsigned width = FTy->getPrimitiveSizeInBits();
            if (width == 0)
              return PreservedAnalyses::none();
            unsigned bit = (LlfiBit < 0) ? 0 : (unsigned)LlfiBit;
            if (bit >= width)
              bit = width - 1;
            IntegerType *ITy = IntegerType::get(M.getContext(), width);
            auto *asInt = cast<Instruction>(B.CreateBitCast(orig, ITy, "llfi_f2i"));
            APInt maskVal = APInt::getOneBitSet(width, bit);
            Value *mask = ConstantInt::get(ITy, maskVal);
            auto *xored = cast<Instruction>(B.CreateXor(asInt, mask, "llfi_fx"));
            auto *flipInst = cast<Instruction>(B.CreateBitCast(xored, FTy, "llfi_i2f"));
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
    }
    return PreservedAnalyses::all();
  }
};

} // namespace

extern "C" LLVM_ATTRIBUTE_WEAK PassPluginLibraryInfo llvmGetPassPluginInfo() {
  return {
      LLVM_PLUGIN_API_VERSION, "llfi-inject", LLVM_VERSION_STRING,
      [](PassBuilder &PB) {
        PB.registerPipelineParsingCallback(
            [](StringRef Name, ModulePassManager &MPM,
               ArrayRef<PassBuilder::PipelineElement>) {
              if (Name == "llfi-inject") {
                MPM.addPass(LlfiInjectPass());
                return true;
              }
              return false;
            });
      }};
}
