; ModuleID = '/home/mdunlavy/GPU_FI/HeCBench/results/intel_trace029_full_trace_preserved_10m_20260722T003336Z/out_injection/device.injected.bc'
source_filename = "main.cpp"
target datalayout = "e-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-n8:16:32:64-G1"
target triple = "spir64-unknown-unknown"

%"class.sycl::_V1::range" = type { %"class.sycl::_V1::detail::array" }
%"class.sycl::_V1::detail::array" = type { [1 x i64] }
%"class.sycl::_V1::id" = type { %"class.sycl::_V1::detail::array" }
%class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi1EEEE_ = type { i32, i32, i32, i32, %"class.sycl::_V1::local_accessor", ptr addrspace(4), i32, %"class.sycl::_V1::local_accessor", ptr addrspace(4), ptr addrspace(4), ptr addrspace(4) }
%"class.sycl::_V1::local_accessor" = type { %"class.sycl::_V1::local_accessor_base" }
%"class.sycl::_V1::local_accessor_base" = type { %"class.sycl::_V1::detail::LocalAccessorBaseDevice", ptr addrspace(3) }
%"class.sycl::_V1::detail::LocalAccessorBaseDevice" = type { %"class.sycl::_V1::range", %"class.sycl::_V1::range", %"class.sycl::_V1::id" }
%"class.sycl::_V1::nd_item" = type { i8 }
%"class.sycl::_V1::group" = type { %"class.sycl::_V1::range", %"class.sycl::_V1::range", %"class.sycl::_V1::range", %"class.sycl::_V1::id" }
%"class.sycl::_V1::item" = type { %"struct.sycl::_V1::detail::ItemBase" }
%"struct.sycl::_V1::detail::ItemBase" = type { %"class.sycl::_V1::range", %"class.sycl::_V1::id", %"class.sycl::_V1::id" }
%"class.sycl::_V1::item.0" = type { %"struct.sycl::_V1::detail::ItemBase.1" }
%"struct.sycl::_V1::detail::ItemBase.1" = type { %"class.sycl::_V1::range", %"class.sycl::_V1::id" }
%class._ZTSZN4sycl3_V119local_accessor_baseIiLi1ELNS0_6access4modeE1026ELNS2_11placeholderE0EE6__initEPU3AS3iNS0_5rangeILi1EEES9_NS0_2idILi1EEEEUlmE_ = type { ptr addrspace(4), ptr addrspace(4) }
%"struct.std::integer_sequence" = type { i8 }
%"struct.std::integral_constant" = type { i8 }
%"struct.__spv::MemorySemanticsMask" = type { i32 }

$_ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_E14dynproc_kernel = comdat any

$_ZN4sycl3_V114local_accessorIiLi1EEC2Ev = comdat any

$_ZN4sycl3_V114local_accessorIiLi1EE6__initEPU3AS3iNS0_5rangeILi1EEES6_NS0_2idILi1EEE = comdat any

$_ZN4sycl3_V16detail7Builder10getElementILi1EEEKNS0_7nd_itemIXT_EEEPS5_ = comdat any

$_ZN4sycl3_V16detail7declptrINS0_7nd_itemILi1EEEEEPT_v = comdat any

$_ZN4sycl3_V119local_accessor_baseIiLi1ELNS0_6access4modeE1026ELNS2_11placeholderE0EEC2Ev = comdat any

$_ZN4sycl3_V16detail14InitializedValILi1ENS0_5rangeEE3getILi0EEENS3_ILi1EEEv = comdat any

$_ZN4sycl3_V16detail23LocalAccessorBaseDeviceILi1EEC2ENS0_5rangeILi1EEE = comdat any

$_ZN4sycl3_V15rangeILi1EEC2ILi1EEENSt9enable_ifIXeqT_Li1EEmE4typeE = comdat any

$_ZN4sycl3_V16detail5arrayILi1EEC2ILi1EEENSt9enable_ifIXeqT_Li1EEmE4typeE = comdat any

$_ZN4sycl3_V12idILi1EEC2Ev = comdat any

$_ZN4sycl3_V119local_accessor_baseIiLi1ELNS0_6access4modeE1026ELNS2_11placeholderE0EE6__initEPU3AS3iNS0_5rangeILi1EEES9_NS0_2idILi1EEE = comdat any

$_ZN4sycl3_V16detail4loopILm1EZNS0_19local_accessor_baseIiLi1ELNS0_6access4modeE1026ELNS4_11placeholderE0EE6__initEPU3AS3iNS0_5rangeILi1EEESB_NS0_2idILi1EEEEUlmE_EEvOT0_ = comdat any

$_ZN4sycl3_V16detail9loop_implIJLm0EEZNS0_19local_accessor_baseIiLi1ELNS0_6access4modeE1026ELNS4_11placeholderE0EE6__initEPU3AS3iNS0_5rangeILi1EEESB_NS0_2idILi1EEEEUlmE_EEvSt16integer_sequenceImJXspT_EEEOT0_ = comdat any

$_ZZN4sycl3_V119local_accessor_baseIiLi1ELNS0_6access4modeE1026ELNS2_11placeholderE0EE6__initEPU3AS3iNS0_5rangeILi1EEES9_NS0_2idILi1EEEENKUlmE_clEm = comdat any

$_ZNKSt17integral_constantImLm0EEcvmEv = comdat any

$_ZN4sycl3_V16detail5arrayILi1EEixEi = comdat any

$_ZN4sycl3_V119local_accessor_baseIiLi1ELNS0_6access4modeE1026ELNS2_11placeholderE0EE7getSizeEv = comdat any

$_ZNK4sycl3_V17nd_itemILi1EE15get_local_rangeEi = comdat any

$_ZNK4sycl3_V119local_accessor_baseIiLi1ELNS0_6access4modeE1026ELNS2_11placeholderE0EEixILi1EvEERim = comdat any

$_ZNK4sycl3_V17nd_itemILi1EE7barrierENS0_6access11fence_spaceE = comdat any

$_ZNK4sycl3_V17nd_itemILi1EE15get_local_rangeEv = comdat any

$_ZN7__spirv17initWorkgroupSizeILi1EN4sycl3_V15rangeILi1EEEEET0_v = comdat any

$_ZN7__spirv24InitSizesSTWorkgroupSizeILi1EN4sycl3_V15rangeILi1EEEE8initSizeEv = comdat any

$_Z23__spirv_WorkgroupSize_xv = comdat any

$_ZNK4sycl3_V17nd_itemILi1EE12get_group_idEv = comdat any

$_ZN7__spirv15initWorkgroupIdILi1EN4sycl3_V12idILi1EEEEET0_v = comdat any

$_ZN7__spirv22InitSizesSTWorkgroupIdILi1EN4sycl3_V12idILi1EEEE8initSizeEv = comdat any

$_ZN4sycl3_V12idILi1EEC2ILi1EEENSt9enable_ifIXeqT_Li1EEmE4typeE = comdat any

$_Z21__spirv_WorkgroupId_xv = comdat any

$_ZNK4sycl3_V17nd_itemILi1EE12get_local_idEv = comdat any

$_ZN7__spirv21initLocalInvocationIdILi1EN4sycl3_V12idILi1EEEEET0_v = comdat any

$_ZN7__spirv28InitSizesSTLocalInvocationIdILi1EN4sycl3_V12idILi1EEEE8initSizeEv = comdat any

$_Z27__spirv_LocalInvocationId_xv = comdat any

$_ZNK4sycl3_V119local_accessor_baseIiLi1ELNS0_6access4modeE1026ELNS2_11placeholderE0EE15getQualifiedPtrEv = comdat any

$_ZN4sycl3_V16detail27getSPIRVMemorySemanticsMaskENS0_6access11fence_spaceEN5__spv19MemorySemanticsMaskE = comdat any

$_ZN5__spv19MemorySemanticsMaskC2ENS0_4FlagE = comdat any

$_ZNK5__spv19MemorySemanticsMaskcvjEv = comdat any

$_ZN7__spirv14initGlobalSizeILi1EN4sycl3_V15rangeILi1EEEEET0_v = comdat any

$_ZN7__spirv17initNumWorkgroupsILi1EN4sycl3_V15rangeILi1EEEEET0_v = comdat any

$_ZN7__spirv22initGlobalInvocationIdILi1EN4sycl3_V12idILi1EEEEET0_v = comdat any

$_ZN7__spirv16initGlobalOffsetILi1EN4sycl3_V12idILi1EEEEET0_v = comdat any

$_ZN4sycl3_V16detail7Builder11createGroupILi1EEENS0_5groupIXT_EEERKNS0_5rangeIXT_EEES9_S9_RKNS0_2idIXT_EEE = comdat any

$_ZN4sycl3_V16detail7Builder10createItemILi1ELb1EEENSt9enable_ifIXT0_ENS0_4itemIXT_EXT0_EEEE4typeERKNS0_5rangeIXT_EEERKNS0_2idIXT_EEESG_ = comdat any

$_ZN4sycl3_V16detail7Builder10createItemILi1ELb0EEENSt9enable_ifIXntT0_ENS0_4itemIXT_EXT0_EEEE4typeERKNS0_5rangeIXT_EEERKNS0_2idIXT_EEE = comdat any

$_ZN4sycl3_V16detail7Builder12createNDItemILi1EEENS0_7nd_itemIXT_EEERKNS0_4itemIXT_ELb1EEERKNS6_IXT_ELb0EEERKNS0_5groupIXT_EEE = comdat any

$_ZN7__spirv21InitSizesSTGlobalSizeILi1EN4sycl3_V15rangeILi1EEEE8initSizeEv = comdat any

$_Z20__spirv_GlobalSize_xv = comdat any

$_ZN7__spirv24InitSizesSTNumWorkgroupsILi1EN4sycl3_V15rangeILi1EEEE8initSizeEv = comdat any

$_Z23__spirv_NumWorkgroups_xv = comdat any

$_ZN7__spirv29InitSizesSTGlobalInvocationIdILi1EN4sycl3_V12idILi1EEEE8initSizeEv = comdat any

$_Z28__spirv_GlobalInvocationId_xv = comdat any

$_ZN7__spirv23InitSizesSTGlobalOffsetILi1EN4sycl3_V12idILi1EEEE8initSizeEv = comdat any

$_Z22__spirv_GlobalOffset_xv = comdat any

$_ZN4sycl3_V15groupILi1EEC2ERKNS0_5rangeILi1EEES6_S4_RKNS0_2idILi1EEE = comdat any

$_ZN4sycl3_V14itemILi1ELb1EEC2ILb1EEERNSt9enable_ifIXT_EKNS0_5rangeILi1EEEE4typeERKNS0_2idILi1EEESE_ = comdat any

$_ZN4sycl3_V14itemILi1ELb0EEC2ILb0EEERNSt9enable_ifIXntT_EKNS0_5rangeILi1EEEE4typeERKNS0_2idILi1EEE = comdat any

$_ZN4sycl3_V17nd_itemILi1EEC2ERKNS0_4itemILi1ELb1EEERKNS3_ILi1ELb0EEERKNS0_5groupILi1EEE = comdat any

@__spirv_BuiltInWorkgroupSize = external dso_local addrspace(1) constant <3 x i64>, align 32
@__spirv_BuiltInWorkgroupId = external dso_local addrspace(1) constant <3 x i64>, align 32
@__spirv_BuiltInLocalInvocationId = external dso_local addrspace(1) constant <3 x i64>, align 32
@__spirv_BuiltInGlobalSize = external dso_local addrspace(1) constant <3 x i64>, align 32
@__spirv_BuiltInNumWorkgroups = external dso_local addrspace(1) constant <3 x i64>, align 32
@__spirv_BuiltInGlobalInvocationId = external dso_local addrspace(1) constant <3 x i64>, align 32
@__spirv_BuiltInGlobalOffset = external dso_local addrspace(1) constant <3 x i64>, align 32

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define weak_odr dso_local spir_kernel void @_ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_E14dynproc_kernel(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, ptr addrspace(3) noundef align 4 %4, ptr noundef byval(%"class.sycl::_V1::range") align 8 %5, ptr noundef byval(%"class.sycl::_V1::range") align 8 %6, ptr noundef byval(%"class.sycl::_V1::id") align 8 %7, ptr addrspace(1) noundef align 4 %8, i32 noundef %9, ptr addrspace(3) noundef align 4 %10, ptr noundef byval(%"class.sycl::_V1::range") align 8 %11, ptr noundef byval(%"class.sycl::_V1::range") align 8 %12, ptr noundef byval(%"class.sycl::_V1::id") align 8 %13, ptr addrspace(1) noundef align 4 %14, ptr addrspace(1) noundef align 4 %15, ptr addrspace(1) noundef align 4 %16) #0 comdat !srcloc !6 !kernel_arg_buffer_location !7 !kernel_arg_runtime_aligned !8 !kernel_arg_exclusive_ptr !8 !sycl_fixed_targets !9 {
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca ptr addrspace(3), align 8
  %23 = alloca ptr addrspace(4), align 8
  %24 = alloca ptr addrspace(4), align 8
  %25 = alloca ptr addrspace(4), align 8
  %26 = alloca ptr addrspace(1), align 8
  %27 = alloca i32, align 4
  %28 = alloca ptr addrspace(3), align 8
  %29 = alloca ptr addrspace(4), align 8
  %30 = alloca ptr addrspace(4), align 8
  %31 = alloca ptr addrspace(4), align 8
  %32 = alloca ptr addrspace(1), align 8
  %33 = alloca ptr addrspace(1), align 8
  %34 = alloca ptr addrspace(1), align 8
  %35 = alloca %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi1EEEE_, align 8
  %36 = alloca %"class.sycl::_V1::range", align 8
  %37 = alloca %"class.sycl::_V1::range", align 8
  %38 = alloca %"class.sycl::_V1::id", align 8
  %39 = alloca %"class.sycl::_V1::range", align 8
  %40 = alloca %"class.sycl::_V1::range", align 8
  %41 = alloca %"class.sycl::_V1::id", align 8
  %42 = alloca %"class.sycl::_V1::nd_item", align 1
  %43 = addrspacecast ptr %18 to ptr addrspace(4)
  %44 = addrspacecast ptr %19 to ptr addrspace(4)
  %45 = addrspacecast ptr %20 to ptr addrspace(4)
  %46 = addrspacecast ptr %21 to ptr addrspace(4)
  %47 = addrspacecast ptr %22 to ptr addrspace(4)
  %48 = addrspacecast ptr %23 to ptr addrspace(4)
  %49 = addrspacecast ptr %24 to ptr addrspace(4)
  %50 = addrspacecast ptr %25 to ptr addrspace(4)
  %51 = addrspacecast ptr %26 to ptr addrspace(4)
  %52 = addrspacecast ptr %27 to ptr addrspace(4)
  %53 = addrspacecast ptr %28 to ptr addrspace(4)
  %54 = addrspacecast ptr %29 to ptr addrspace(4)
  %55 = addrspacecast ptr %30 to ptr addrspace(4)
  %56 = addrspacecast ptr %31 to ptr addrspace(4)
  %57 = addrspacecast ptr %32 to ptr addrspace(4)
  %58 = addrspacecast ptr %33 to ptr addrspace(4)
  %59 = addrspacecast ptr %34 to ptr addrspace(4)
  %60 = addrspacecast ptr %35 to ptr addrspace(4)
  %61 = addrspacecast ptr %36 to ptr addrspace(4)
  %62 = addrspacecast ptr %37 to ptr addrspace(4)
  %63 = addrspacecast ptr %38 to ptr addrspace(4)
  %64 = addrspacecast ptr %39 to ptr addrspace(4)
  %65 = addrspacecast ptr %40 to ptr addrspace(4)
  %66 = addrspacecast ptr %41 to ptr addrspace(4)
  %67 = addrspacecast ptr %42 to ptr addrspace(4)
  store i32 %0, ptr addrspace(4) %43, align 4
  store i32 %1, ptr addrspace(4) %44, align 4
  store i32 %2, ptr addrspace(4) %45, align 4
  store i32 %3, ptr addrspace(4) %46, align 4
  store ptr addrspace(3) %4, ptr addrspace(4) %47, align 8
  %68 = addrspacecast ptr %5 to ptr addrspace(4)
  store ptr addrspace(4) %68, ptr addrspace(4) %48, align 8
  %69 = addrspacecast ptr %6 to ptr addrspace(4)
  store ptr addrspace(4) %69, ptr addrspace(4) %49, align 8
  %70 = addrspacecast ptr %7 to ptr addrspace(4)
  store ptr addrspace(4) %70, ptr addrspace(4) %50, align 8
  store ptr addrspace(1) %8, ptr addrspace(4) %51, align 8
  store i32 %9, ptr addrspace(4) %52, align 4
  store ptr addrspace(3) %10, ptr addrspace(4) %53, align 8
  %71 = addrspacecast ptr %11 to ptr addrspace(4)
  store ptr addrspace(4) %71, ptr addrspace(4) %54, align 8
  %72 = addrspacecast ptr %12 to ptr addrspace(4)
  store ptr addrspace(4) %72, ptr addrspace(4) %55, align 8
  %73 = addrspacecast ptr %13 to ptr addrspace(4)
  store ptr addrspace(4) %73, ptr addrspace(4) %56, align 8
  store ptr addrspace(1) %14, ptr addrspace(4) %57, align 8
  store ptr addrspace(1) %15, ptr addrspace(4) %58, align 8
  store ptr addrspace(1) %16, ptr addrspace(4) %59, align 8
  %74 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %60, i32 0, i32 0
  %75 = load i32, ptr addrspace(4) %43, align 4
  store i32 %75, ptr addrspace(4) %74, align 8
  %76 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %60, i32 0, i32 1
  %77 = load i32, ptr addrspace(4) %44, align 4
  store i32 %77, ptr addrspace(4) %76, align 4
  %78 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %60, i32 0, i32 2
  %79 = load i32, ptr addrspace(4) %45, align 4
  store i32 %79, ptr addrspace(4) %78, align 8
  %80 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %60, i32 0, i32 3
  %81 = load i32, ptr addrspace(4) %46, align 4
  store i32 %81, ptr addrspace(4) %80, align 4
  %82 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %60, i32 0, i32 4
  call spir_func void @_ZN4sycl3_V114local_accessorIiLi1EEC2Ev(ptr addrspace(4) noundef align 8 dereferenceable_or_null(32) %82) #6
  %83 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %60, i32 0, i32 5
  %84 = load ptr addrspace(1), ptr addrspace(4) %51, align 8
  %85 = addrspacecast ptr addrspace(1) %84 to ptr addrspace(4)
  store ptr addrspace(4) %85, ptr addrspace(4) %83, align 8
  %86 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %60, i32 0, i32 6
  %87 = load i32, ptr addrspace(4) %52, align 4
  store i32 %87, ptr addrspace(4) %86, align 8
  %88 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %60, i32 0, i32 7
  call spir_func void @_ZN4sycl3_V114local_accessorIiLi1EEC2Ev(ptr addrspace(4) noundef align 8 dereferenceable_or_null(32) %88) #6
  %89 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %60, i32 0, i32 8
  %90 = load ptr addrspace(1), ptr addrspace(4) %57, align 8
  %91 = addrspacecast ptr addrspace(1) %90 to ptr addrspace(4)
  store ptr addrspace(4) %91, ptr addrspace(4) %89, align 8
  %92 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %60, i32 0, i32 9
  %93 = load ptr addrspace(1), ptr addrspace(4) %58, align 8
  %94 = addrspacecast ptr addrspace(1) %93 to ptr addrspace(4)
  store ptr addrspace(4) %94, ptr addrspace(4) %92, align 8
  %95 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %60, i32 0, i32 10
  %96 = load ptr addrspace(1), ptr addrspace(4) %59, align 8
  %97 = addrspacecast ptr addrspace(1) %96 to ptr addrspace(4)
  store ptr addrspace(4) %97, ptr addrspace(4) %95, align 8
  %98 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %60, i32 0, i32 4
  %99 = load ptr addrspace(3), ptr addrspace(4) %47, align 8
  call void @llvm.memcpy.p4.p4.i64(ptr addrspace(4) align 8 %61, ptr addrspace(4) align 8 %68, i64 8, i1 false)
  call void @llvm.memcpy.p4.p4.i64(ptr addrspace(4) align 8 %62, ptr addrspace(4) align 8 %69, i64 8, i1 false)
  call void @llvm.memcpy.p4.p4.i64(ptr addrspace(4) align 8 %63, ptr addrspace(4) align 8 %70, i64 8, i1 false)
  %100 = addrspacecast ptr addrspace(4) %61 to ptr
  %101 = addrspacecast ptr addrspace(4) %62 to ptr
  %102 = addrspacecast ptr addrspace(4) %63 to ptr
  call spir_func void @_ZN4sycl3_V114local_accessorIiLi1EE6__initEPU3AS3iNS0_5rangeILi1EEES6_NS0_2idILi1EEE(ptr addrspace(4) noundef align 8 dereferenceable_or_null(32) %98, ptr addrspace(3) noundef %99, ptr noundef byval(%"class.sycl::_V1::range") align 8 %100, ptr noundef byval(%"class.sycl::_V1::range") align 8 %101, ptr noundef byval(%"class.sycl::_V1::id") align 8 %102) #6
  %103 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %60, i32 0, i32 7
  %104 = load ptr addrspace(3), ptr addrspace(4) %53, align 8
  call void @llvm.memcpy.p4.p4.i64(ptr addrspace(4) align 8 %64, ptr addrspace(4) align 8 %71, i64 8, i1 false)
  call void @llvm.memcpy.p4.p4.i64(ptr addrspace(4) align 8 %65, ptr addrspace(4) align 8 %72, i64 8, i1 false)
  call void @llvm.memcpy.p4.p4.i64(ptr addrspace(4) align 8 %66, ptr addrspace(4) align 8 %73, i64 8, i1 false)
  %105 = addrspacecast ptr addrspace(4) %64 to ptr
  %106 = addrspacecast ptr addrspace(4) %65 to ptr
  %107 = addrspacecast ptr addrspace(4) %66 to ptr
  call spir_func void @_ZN4sycl3_V114local_accessorIiLi1EE6__initEPU3AS3iNS0_5rangeILi1EEES6_NS0_2idILi1EEE(ptr addrspace(4) noundef align 8 dereferenceable_or_null(32) %103, ptr addrspace(3) noundef %104, ptr noundef byval(%"class.sycl::_V1::range") align 8 %105, ptr noundef byval(%"class.sycl::_V1::range") align 8 %106, ptr noundef byval(%"class.sycl::_V1::id") align 8 %107) #6
  %108 = call spir_func noundef ptr addrspace(4) @_ZN4sycl3_V16detail7declptrINS0_7nd_itemILi1EEEEEPT_v() #6
  call spir_func void @_ZN4sycl3_V16detail7Builder10getElementILi1EEEKNS0_7nd_itemIXT_EEEPS5_(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::nd_item") align 1 %67, ptr addrspace(4) noundef %108) #6
  %109 = addrspacecast ptr addrspace(4) %67 to ptr
  call spir_func void @_ZZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_ENKUlNS0_7nd_itemILi1EEEE_clES5_(ptr addrspace(4) noundef align 8 dereferenceable_or_null(120) %60, ptr noundef byval(%"class.sycl::_V1::nd_item") align 1 %109) #6
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN4sycl3_V114local_accessorIiLi1EEC2Ev(ptr addrspace(4) noundef align 8 dereferenceable_or_null(32) %0) unnamed_addr #1 comdat align 2 !srcloc !10 {
  %2 = alloca ptr addrspace(4), align 8
  %3 = alloca %"class.sycl::_V1::detail::LocalAccessorBaseDevice", align 8
  %4 = alloca %"class.sycl::_V1::range", align 8
  %5 = addrspacecast ptr %2 to ptr addrspace(4)
  %6 = addrspacecast ptr %3 to ptr addrspace(4)
  %7 = addrspacecast ptr %4 to ptr addrspace(4)
  store ptr addrspace(4) %0, ptr addrspace(4) %5, align 8
  %8 = load ptr addrspace(4), ptr addrspace(4) %5, align 8
  call spir_func void @_ZN4sycl3_V119local_accessor_baseIiLi1ELNS0_6access4modeE1026ELNS2_11placeholderE0EEC2Ev(ptr addrspace(4) noundef align 8 dereferenceable_or_null(32) %8) #6
  call spir_func void @_ZN4sycl3_V16detail14InitializedValILi1ENS0_5rangeEE3getILi0EEENS3_ILi1EEEv(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::range") align 8 %7) #6
  %9 = addrspacecast ptr addrspace(4) %7 to ptr
  call spir_func void @_ZN4sycl3_V16detail23LocalAccessorBaseDeviceILi1EEC2ENS0_5rangeILi1EEE(ptr addrspace(4) noundef align 8 dereferenceable_or_null(24) %6, ptr noundef byval(%"class.sycl::_V1::range") align 8 %9) #6
  %10 = getelementptr inbounds nuw %"class.sycl::_V1::local_accessor_base", ptr addrspace(4) %8, i32 0, i32 0
  call void @llvm.memcpy.p4.p4.i64(ptr addrspace(4) align 8 %10, ptr addrspace(4) align 8 %6, i64 24, i1 false)
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN4sycl3_V114local_accessorIiLi1EE6__initEPU3AS3iNS0_5rangeILi1EEES6_NS0_2idILi1EEE(ptr addrspace(4) noundef align 8 dereferenceable_or_null(32) %0, ptr addrspace(3) noundef %1, ptr noundef byval(%"class.sycl::_V1::range") align 8 %2, ptr noundef byval(%"class.sycl::_V1::range") align 8 %3, ptr noundef byval(%"class.sycl::_V1::id") align 8 %4) #1 comdat align 2 !srcloc !11 {
  %6 = alloca ptr addrspace(4), align 8
  %7 = alloca ptr addrspace(3), align 8
  %8 = alloca ptr addrspace(4), align 8
  %9 = alloca ptr addrspace(4), align 8
  %10 = alloca ptr addrspace(4), align 8
  %11 = alloca %"class.sycl::_V1::range", align 8
  %12 = alloca %"class.sycl::_V1::range", align 8
  %13 = alloca %"class.sycl::_V1::id", align 8
  %14 = addrspacecast ptr %6 to ptr addrspace(4)
  %15 = addrspacecast ptr %7 to ptr addrspace(4)
  %16 = addrspacecast ptr %8 to ptr addrspace(4)
  %17 = addrspacecast ptr %9 to ptr addrspace(4)
  %18 = addrspacecast ptr %10 to ptr addrspace(4)
  %19 = addrspacecast ptr %11 to ptr addrspace(4)
  %20 = addrspacecast ptr %12 to ptr addrspace(4)
  %21 = addrspacecast ptr %13 to ptr addrspace(4)
  store ptr addrspace(4) %0, ptr addrspace(4) %14, align 8
  store ptr addrspace(3) %1, ptr addrspace(4) %15, align 8
  %22 = addrspacecast ptr %2 to ptr addrspace(4)
  store ptr addrspace(4) %22, ptr addrspace(4) %16, align 8
  %23 = addrspacecast ptr %3 to ptr addrspace(4)
  store ptr addrspace(4) %23, ptr addrspace(4) %17, align 8
  %24 = addrspacecast ptr %4 to ptr addrspace(4)
  store ptr addrspace(4) %24, ptr addrspace(4) %18, align 8
  %25 = load ptr addrspace(4), ptr addrspace(4) %14, align 8
  %26 = load ptr addrspace(3), ptr addrspace(4) %15, align 8
  call void @llvm.memcpy.p4.p4.i64(ptr addrspace(4) align 8 %19, ptr addrspace(4) align 8 %22, i64 8, i1 false)
  call void @llvm.memcpy.p4.p4.i64(ptr addrspace(4) align 8 %20, ptr addrspace(4) align 8 %23, i64 8, i1 false)
  call void @llvm.memcpy.p4.p4.i64(ptr addrspace(4) align 8 %21, ptr addrspace(4) align 8 %24, i64 8, i1 false)
  %27 = addrspacecast ptr addrspace(4) %19 to ptr
  %28 = addrspacecast ptr addrspace(4) %20 to ptr
  %29 = addrspacecast ptr addrspace(4) %21 to ptr
  call spir_func void @_ZN4sycl3_V119local_accessor_baseIiLi1ELNS0_6access4modeE1026ELNS2_11placeholderE0EE6__initEPU3AS3iNS0_5rangeILi1EEES9_NS0_2idILi1EEE(ptr addrspace(4) noundef align 8 dereferenceable_or_null(32) %25, ptr addrspace(3) noundef %26, ptr noundef byval(%"class.sycl::_V1::range") align 8 %27, ptr noundef byval(%"class.sycl::_V1::range") align 8 %28, ptr noundef byval(%"class.sycl::_V1::id") align 8 %29) #6
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p4.p4.i64(ptr addrspace(4) noalias writeonly captures(none), ptr addrspace(4) noalias readonly captures(none), i64, i1 immarg) #2

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define internal spir_func void @_ZZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_ENKUlNS0_7nd_itemILi1EEEE_clES5_(ptr addrspace(4) noundef align 8 dereferenceable_or_null(120) %0, ptr noundef byval(%"class.sycl::_V1::nd_item") align 1 %1) #1 align 2 !srcloc !6 {
  %3 = alloca i64, align 8
  %4 = alloca ptr addrspace(4), align 8
  %5 = alloca i32, align 4
  %6 = alloca i64, align 8
  %7 = alloca %"class.sycl::_V1::id", align 8
  %8 = alloca i64, align 8
  %9 = alloca ptr addrspace(4), align 8
  %10 = alloca i32, align 4
  %11 = alloca i64, align 8
  %12 = alloca %"class.sycl::_V1::id", align 8
  %13 = alloca ptr addrspace(4), align 8
  %14 = alloca ptr addrspace(4), align 8
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  %23 = alloca i32, align 4
  %24 = alloca i32, align 4
  %25 = alloca i32, align 4
  %26 = alloca i8, align 1
  %27 = alloca i8, align 1
  %28 = alloca i32, align 4
  %29 = alloca i32, align 4
  %30 = alloca i32, align 4
  %31 = alloca i32, align 4
  %32 = alloca i32, align 4
  %33 = alloca i32, align 4
  %34 = alloca i32, align 4
  %35 = addrspacecast ptr %13 to ptr addrspace(4)
  %36 = addrspacecast ptr %14 to ptr addrspace(4)
  %37 = addrspacecast ptr %15 to ptr addrspace(4)
  %38 = addrspacecast ptr %16 to ptr addrspace(4)
  %39 = addrspacecast ptr %17 to ptr addrspace(4)
  %40 = addrspacecast ptr %18 to ptr addrspace(4)
  %41 = addrspacecast ptr %19 to ptr addrspace(4)
  %42 = addrspacecast ptr %20 to ptr addrspace(4)
  %43 = addrspacecast ptr %21 to ptr addrspace(4)
  %44 = addrspacecast ptr %22 to ptr addrspace(4)
  %45 = addrspacecast ptr %23 to ptr addrspace(4)
  %46 = addrspacecast ptr %24 to ptr addrspace(4)
  %47 = addrspacecast ptr %25 to ptr addrspace(4)
  %48 = addrspacecast ptr %26 to ptr addrspace(4)
  %49 = addrspacecast ptr %27 to ptr addrspace(4)
  %50 = addrspacecast ptr %28 to ptr addrspace(4)
  %51 = addrspacecast ptr %29 to ptr addrspace(4)
  %52 = addrspacecast ptr %30 to ptr addrspace(4)
  %53 = addrspacecast ptr %31 to ptr addrspace(4)
  %54 = addrspacecast ptr %32 to ptr addrspace(4)
  %55 = addrspacecast ptr %33 to ptr addrspace(4)
  %56 = addrspacecast ptr %34 to ptr addrspace(4)
  store ptr addrspace(4) %0, ptr addrspace(4) %35, align 8
  %57 = addrspacecast ptr %1 to ptr addrspace(4)
  store ptr addrspace(4) %57, ptr addrspace(4) %36, align 8
  %58 = load ptr addrspace(4), ptr addrspace(4) %35, align 8
  %59 = call spir_func noundef i64 @_ZNK4sycl3_V17nd_itemILi1EE15get_local_rangeEi(ptr addrspace(4) noundef align 1 dereferenceable_or_null(1) %57, i32 noundef 0) #6
  %60 = trunc i64 %59 to i32
  store i32 %60, ptr addrspace(4) %37, align 4
  %61 = addrspacecast ptr %8 to ptr addrspace(4)
  %62 = addrspacecast ptr %9 to ptr addrspace(4)
  %63 = addrspacecast ptr %10 to ptr addrspace(4)
  %64 = addrspacecast ptr %11 to ptr addrspace(4)
  %65 = addrspacecast ptr %12 to ptr addrspace(4)
  store ptr addrspace(4) %57, ptr addrspace(4) %62, align 8
  store i32 0, ptr addrspace(4) %63, align 4
  %66 = load ptr addrspace(4), ptr addrspace(4) %62, align 8
  call spir_func void @_ZNK4sycl3_V17nd_itemILi1EE12get_group_idEv(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::id") align 8 %65, ptr addrspace(4) noundef align 1 dereferenceable_or_null(1) %66) #6
  %67 = load i32, ptr addrspace(4) %63, align 4
  %68 = call spir_func noundef align 8 dereferenceable(8) ptr addrspace(4) @_ZN4sycl3_V16detail5arrayILi1EEixEi(ptr addrspace(4) noundef align 8 dereferenceable_or_null(8) %65, i32 noundef %67) #6
  %69 = load i64, ptr addrspace(4) %68, align 8
  store i64 %69, ptr addrspace(4) %64, align 8
  %70 = load i64, ptr addrspace(4) %64, align 8
  %71 = icmp ule i64 %70, 2147483647
  call void @llvm.assume(i1 %71)
  %72 = load i64, ptr addrspace(4) %64, align 8
  %73 = trunc i64 %72 to i32
  store i32 %73, ptr addrspace(4) %38, align 4
  %74 = addrspacecast ptr %3 to ptr addrspace(4)
  %75 = addrspacecast ptr %4 to ptr addrspace(4)
  %76 = addrspacecast ptr %5 to ptr addrspace(4)
  %77 = addrspacecast ptr %6 to ptr addrspace(4)
  %78 = addrspacecast ptr %7 to ptr addrspace(4)
  store ptr addrspace(4) %57, ptr addrspace(4) %75, align 8
  store i32 0, ptr addrspace(4) %76, align 4
  %79 = load ptr addrspace(4), ptr addrspace(4) %75, align 8
  call spir_func void @_ZNK4sycl3_V17nd_itemILi1EE12get_local_idEv(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::id") align 8 %78, ptr addrspace(4) noundef align 1 dereferenceable_or_null(1) %79) #6
  %80 = load i32, ptr addrspace(4) %76, align 4
  %81 = call spir_func noundef align 8 dereferenceable(8) ptr addrspace(4) @_ZN4sycl3_V16detail5arrayILi1EEixEi(ptr addrspace(4) noundef align 8 dereferenceable_or_null(8) %78, i32 noundef %80) #6
  %82 = load i64, ptr addrspace(4) %81, align 8
  store i64 %82, ptr addrspace(4) %77, align 8
  %83 = load i64, ptr addrspace(4) %77, align 8
  %84 = icmp ule i64 %83, 2147483647
  call void @llvm.assume(i1 %84)
  %85 = load i64, ptr addrspace(4) %77, align 8
  %86 = trunc i64 %85 to i32
  store i32 %86, ptr addrspace(4) %39, align 4
  %87 = load i32, ptr addrspace(4) %37, align 4
  %88 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %58, i32 0, i32 0
  %89 = load i32, ptr addrspace(4) %88, align 8
  %90 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %58, i32 0, i32 1
  %91 = load i32, ptr addrspace(4) %90, align 4
  %92 = mul nsw i32 %89, %91
  %93 = mul nsw i32 %92, 2
  %94 = sub nsw i32 %87, %93
  %fi_flip = xor i32 %94, -2147483648
  store i32 %fi_flip, ptr addrspace(4) %40, align 4
  %95 = load i32, ptr addrspace(4) %40, align 4
  %96 = load i32, ptr addrspace(4) %38, align 4
  %97 = mul nsw i32 %95, %96
  %98 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %58, i32 0, i32 2
  %99 = load i32, ptr addrspace(4) %98, align 8
  %100 = sub nsw i32 %97, %99
  store i32 %100, ptr addrspace(4) %41, align 4
  %101 = load i32, ptr addrspace(4) %41, align 4
  %102 = load i32, ptr addrspace(4) %37, align 4
  %103 = add nsw i32 %101, %102
  %104 = sub nsw i32 %103, 1
  store i32 %104, ptr addrspace(4) %42, align 4
  %105 = load i32, ptr addrspace(4) %41, align 4
  %106 = load i32, ptr addrspace(4) %39, align 4
  %107 = add nsw i32 %105, %106
  store i32 %107, ptr addrspace(4) %43, align 4
  %108 = load i32, ptr addrspace(4) %41, align 4
  %109 = icmp slt i32 %108, 0
  br i1 %109, label %110, label %113

110:                                              ; preds = %2
  %111 = load i32, ptr addrspace(4) %41, align 4
  %112 = sub nsw i32 0, %111
  br label %114

113:                                              ; preds = %2
  br label %114

114:                                              ; preds = %113, %110
  %115 = phi i32 [ %112, %110 ], [ 0, %113 ]
  store i32 %115, ptr addrspace(4) %44, align 4
  %116 = load i32, ptr addrspace(4) %42, align 4
  %117 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %58, i32 0, i32 3
  %118 = load i32, ptr addrspace(4) %117, align 4
  %119 = sub nsw i32 %118, 1
  %120 = icmp sgt i32 %116, %119
  br i1 %120, label %121, label %130

121:                                              ; preds = %114
  %122 = load i32, ptr addrspace(4) %37, align 4
  %123 = sub nsw i32 %122, 1
  %124 = load i32, ptr addrspace(4) %42, align 4
  %125 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %58, i32 0, i32 3
  %126 = load i32, ptr addrspace(4) %125, align 4
  %127 = sub nsw i32 %124, %126
  %128 = add nsw i32 %127, 1
  %129 = sub nsw i32 %123, %128
  br label %133

130:                                              ; preds = %114
  %131 = load i32, ptr addrspace(4) %37, align 4
  %132 = sub nsw i32 %131, 1
  br label %133

133:                                              ; preds = %130, %121
  %134 = phi i32 [ %129, %121 ], [ %132, %130 ]
  store i32 %134, ptr addrspace(4) %45, align 4
  %135 = load i32, ptr addrspace(4) %39, align 4
  %136 = sub nsw i32 %135, 1
  store i32 %136, ptr addrspace(4) %46, align 4
  %137 = load i32, ptr addrspace(4) %39, align 4
  %138 = add nsw i32 %137, 1
  store i32 %138, ptr addrspace(4) %47, align 4
  %139 = load i32, ptr addrspace(4) %46, align 4
  %140 = load i32, ptr addrspace(4) %44, align 4
  %141 = icmp slt i32 %139, %140
  br i1 %141, label %142, label %144

142:                                              ; preds = %133
  %143 = load i32, ptr addrspace(4) %44, align 4
  br label %146

144:                                              ; preds = %133
  %145 = load i32, ptr addrspace(4) %46, align 4
  br label %146

146:                                              ; preds = %144, %142
  %147 = phi i32 [ %143, %142 ], [ %145, %144 ]
  store i32 %147, ptr addrspace(4) %46, align 4
  %148 = load i32, ptr addrspace(4) %47, align 4
  %149 = load i32, ptr addrspace(4) %45, align 4
  %150 = icmp sgt i32 %148, %149
  br i1 %150, label %151, label %153

151:                                              ; preds = %146
  %152 = load i32, ptr addrspace(4) %45, align 4
  br label %155

153:                                              ; preds = %146
  %154 = load i32, ptr addrspace(4) %47, align 4
  br label %155

155:                                              ; preds = %153, %151
  %156 = phi i32 [ %152, %151 ], [ %154, %153 ]
  store i32 %156, ptr addrspace(4) %47, align 4
  %157 = load i32, ptr addrspace(4) %39, align 4
  %158 = load i32, ptr addrspace(4) %44, align 4
  %159 = icmp sge i32 %157, %158
  br i1 %159, label %160, label %164

160:                                              ; preds = %155
  %161 = load i32, ptr addrspace(4) %39, align 4
  %162 = load i32, ptr addrspace(4) %45, align 4
  %163 = icmp sle i32 %161, %162
  br label %164

164:                                              ; preds = %160, %155
  %165 = phi i1 [ false, %155 ], [ %163, %160 ]
  %166 = zext i1 %165 to i8
  store i8 %166, ptr addrspace(4) %48, align 1
  %167 = load i32, ptr addrspace(4) %43, align 4
  %168 = icmp sge i32 %167, 0
  br i1 %168, label %169, label %186

169:                                              ; preds = %164
  %170 = load i32, ptr addrspace(4) %43, align 4
  %171 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %58, i32 0, i32 3
  %172 = load i32, ptr addrspace(4) %171, align 4
  %173 = sub nsw i32 %172, 1
  %174 = icmp sle i32 %170, %173
  br i1 %174, label %175, label %186

175:                                              ; preds = %169
  %176 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %58, i32 0, i32 5
  %177 = load ptr addrspace(4), ptr addrspace(4) %176, align 8
  %178 = load i32, ptr addrspace(4) %43, align 4
  %179 = sext i32 %178 to i64
  %180 = getelementptr inbounds i32, ptr addrspace(4) %177, i64 %179
  %181 = load i32, ptr addrspace(4) %180, align 4
  %182 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %58, i32 0, i32 4
  %183 = load i32, ptr addrspace(4) %39, align 4
  %184 = sext i32 %183 to i64
  %185 = call spir_func noundef align 4 dereferenceable(4) ptr addrspace(4) @_ZNK4sycl3_V119local_accessor_baseIiLi1ELNS0_6access4modeE1026ELNS2_11placeholderE0EEixILi1EvEERim(ptr addrspace(4) noundef align 8 dereferenceable_or_null(32) %182, i64 noundef %184) #6
  store i32 %181, ptr addrspace(4) %185, align 4
  br label %186

186:                                              ; preds = %175, %169, %164
  call spir_func void @_ZNK4sycl3_V17nd_itemILi1EE7barrierENS0_6access11fence_spaceE(ptr addrspace(4) noundef align 1 dereferenceable_or_null(1) %57, i32 noundef 0) #6
  store i32 0, ptr addrspace(4) %50, align 4
  br label %187

187:                                              ; preds = %301, %186
  %188 = load i32, ptr addrspace(4) %50, align 4
  %189 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %58, i32 0, i32 0
  %190 = load i32, ptr addrspace(4) %189, align 8
  %191 = icmp slt i32 %188, %190
  br i1 %191, label %192, label %304

192:                                              ; preds = %187
  store i8 0, ptr addrspace(4) %49, align 1
  %193 = load i32, ptr addrspace(4) %39, align 4
  %194 = load i32, ptr addrspace(4) %50, align 4
  %195 = add nsw i32 %194, 1
  %196 = icmp sge i32 %193, %195
  br i1 %196, label %197, label %280

197:                                              ; preds = %192
  %198 = load i32, ptr addrspace(4) %39, align 4
  %199 = load i32, ptr addrspace(4) %37, align 4
  %200 = load i32, ptr addrspace(4) %50, align 4
  %201 = sub nsw i32 %199, %200
  %202 = sub nsw i32 %201, 2
  %203 = icmp sle i32 %198, %202
  br i1 %203, label %204, label %280

204:                                              ; preds = %197
  %205 = load i8, ptr addrspace(4) %48, align 1
  %206 = trunc i8 %205 to i1
  br i1 %206, label %207, label %280

207:                                              ; preds = %204
  store i8 1, ptr addrspace(4) %49, align 1
  %208 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %58, i32 0, i32 4
  %209 = load i32, ptr addrspace(4) %46, align 4
  %210 = sext i32 %209 to i64
  %211 = call spir_func noundef align 4 dereferenceable(4) ptr addrspace(4) @_ZNK4sycl3_V119local_accessor_baseIiLi1ELNS0_6access4modeE1026ELNS2_11placeholderE0EEixILi1EvEERim(ptr addrspace(4) noundef align 8 dereferenceable_or_null(32) %208, i64 noundef %210) #6
  %212 = load i32, ptr addrspace(4) %211, align 4
  store i32 %212, ptr addrspace(4) %51, align 4
  %213 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %58, i32 0, i32 4
  %214 = load i32, ptr addrspace(4) %39, align 4
  %215 = sext i32 %214 to i64
  %216 = call spir_func noundef align 4 dereferenceable(4) ptr addrspace(4) @_ZNK4sycl3_V119local_accessor_baseIiLi1ELNS0_6access4modeE1026ELNS2_11placeholderE0EEixILi1EvEERim(ptr addrspace(4) noundef align 8 dereferenceable_or_null(32) %213, i64 noundef %215) #6
  %217 = load i32, ptr addrspace(4) %216, align 4
  store i32 %217, ptr addrspace(4) %52, align 4
  %218 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %58, i32 0, i32 4
  %219 = load i32, ptr addrspace(4) %47, align 4
  %220 = sext i32 %219 to i64
  %221 = call spir_func noundef align 4 dereferenceable(4) ptr addrspace(4) @_ZNK4sycl3_V119local_accessor_baseIiLi1ELNS0_6access4modeE1026ELNS2_11placeholderE0EEixILi1EvEERim(ptr addrspace(4) noundef align 8 dereferenceable_or_null(32) %218, i64 noundef %220) #6
  %222 = load i32, ptr addrspace(4) %221, align 4
  store i32 %222, ptr addrspace(4) %53, align 4
  %223 = load i32, ptr addrspace(4) %51, align 4
  %224 = load i32, ptr addrspace(4) %52, align 4
  %225 = icmp sle i32 %223, %224
  br i1 %225, label %226, label %228

226:                                              ; preds = %207
  %227 = load i32, ptr addrspace(4) %51, align 4
  br label %230

228:                                              ; preds = %207
  %229 = load i32, ptr addrspace(4) %52, align 4
  br label %230

230:                                              ; preds = %228, %226
  %231 = phi i32 [ %227, %226 ], [ %229, %228 ]
  store i32 %231, ptr addrspace(4) %54, align 4
  %232 = load i32, ptr addrspace(4) %54, align 4
  %233 = load i32, ptr addrspace(4) %53, align 4
  %234 = icmp sle i32 %232, %233
  br i1 %234, label %235, label %237

235:                                              ; preds = %230
  %236 = load i32, ptr addrspace(4) %54, align 4
  br label %239

237:                                              ; preds = %230
  %238 = load i32, ptr addrspace(4) %53, align 4
  br label %239

239:                                              ; preds = %237, %235
  %240 = phi i32 [ %236, %235 ], [ %238, %237 ]
  store i32 %240, ptr addrspace(4) %54, align 4
  %241 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %58, i32 0, i32 3
  %242 = load i32, ptr addrspace(4) %241, align 4
  %243 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %58, i32 0, i32 6
  %244 = load i32, ptr addrspace(4) %243, align 8
  %245 = load i32, ptr addrspace(4) %50, align 4
  %246 = add nsw i32 %244, %245
  %247 = mul nsw i32 %242, %246
  %248 = load i32, ptr addrspace(4) %43, align 4
  %249 = add nsw i32 %247, %248
  store i32 %249, ptr addrspace(4) %55, align 4
  %250 = load i32, ptr addrspace(4) %54, align 4
  %251 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %58, i32 0, i32 8
  %252 = load ptr addrspace(4), ptr addrspace(4) %251, align 8
  %253 = load i32, ptr addrspace(4) %55, align 4
  %254 = sext i32 %253 to i64
  %255 = getelementptr inbounds i32, ptr addrspace(4) %252, i64 %254
  %256 = load i32, ptr addrspace(4) %255, align 4
  %257 = add nsw i32 %250, %256
  %258 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %58, i32 0, i32 7
  %259 = load i32, ptr addrspace(4) %39, align 4
  %260 = sext i32 %259 to i64
  %261 = call spir_func noundef align 4 dereferenceable(4) ptr addrspace(4) @_ZNK4sycl3_V119local_accessor_baseIiLi1ELNS0_6access4modeE1026ELNS2_11placeholderE0EEixILi1EvEERim(ptr addrspace(4) noundef align 8 dereferenceable_or_null(32) %258, i64 noundef %260) #6
  store i32 %257, ptr addrspace(4) %261, align 4
  %262 = load i32, ptr addrspace(4) %39, align 4
  %263 = icmp eq i32 %262, 11
  br i1 %263, label %264, label %279

264:                                              ; preds = %239
  %265 = load i32, ptr addrspace(4) %50, align 4
  %266 = icmp eq i32 %265, 0
  br i1 %266, label %267, label %279

267:                                              ; preds = %264
  %268 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %58, i32 0, i32 5
  %269 = load ptr addrspace(4), ptr addrspace(4) %268, align 8
  %270 = load i32, ptr addrspace(4) %43, align 4
  %271 = sext i32 %270 to i64
  %272 = getelementptr inbounds i32, ptr addrspace(4) %269, i64 %271
  %273 = load i32, ptr addrspace(4) %272, align 4
  store i32 %273, ptr addrspace(4) %56, align 4
  %274 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %58, i32 0, i32 9
  %275 = load ptr addrspace(4), ptr addrspace(4) %274, align 8
  %276 = load i32, ptr addrspace(4) %56, align 4
  %277 = sext i32 %276 to i64
  %278 = getelementptr inbounds i32, ptr addrspace(4) %275, i64 %277
  store i32 1, ptr addrspace(4) %278, align 4
  br label %279

279:                                              ; preds = %267, %264, %239
  br label %280

280:                                              ; preds = %279, %204, %197, %192
  call spir_func void @_ZNK4sycl3_V17nd_itemILi1EE7barrierENS0_6access11fence_spaceE(ptr addrspace(4) noundef align 1 dereferenceable_or_null(1) %57, i32 noundef 0) #6
  %281 = load i32, ptr addrspace(4) %50, align 4
  %282 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %58, i32 0, i32 0
  %283 = load i32, ptr addrspace(4) %282, align 8
  %284 = sub nsw i32 %283, 1
  %285 = icmp eq i32 %281, %284
  br i1 %285, label %286, label %287

286:                                              ; preds = %280
  br label %304

287:                                              ; preds = %280
  %288 = load i8, ptr addrspace(4) %49, align 1
  %289 = trunc i8 %288 to i1
  br i1 %289, label %290, label %300

290:                                              ; preds = %287
  %291 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %58, i32 0, i32 7
  %292 = load i32, ptr addrspace(4) %39, align 4
  %293 = sext i32 %292 to i64
  %294 = call spir_func noundef align 4 dereferenceable(4) ptr addrspace(4) @_ZNK4sycl3_V119local_accessor_baseIiLi1ELNS0_6access4modeE1026ELNS2_11placeholderE0EEixILi1EvEERim(ptr addrspace(4) noundef align 8 dereferenceable_or_null(32) %291, i64 noundef %293) #6
  %295 = load i32, ptr addrspace(4) %294, align 4
  %296 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %58, i32 0, i32 4
  %297 = load i32, ptr addrspace(4) %39, align 4
  %298 = sext i32 %297 to i64
  %299 = call spir_func noundef align 4 dereferenceable(4) ptr addrspace(4) @_ZNK4sycl3_V119local_accessor_baseIiLi1ELNS0_6access4modeE1026ELNS2_11placeholderE0EEixILi1EvEERim(ptr addrspace(4) noundef align 8 dereferenceable_or_null(32) %296, i64 noundef %298) #6
  store i32 %295, ptr addrspace(4) %299, align 4
  br label %300

300:                                              ; preds = %290, %287
  call spir_func void @_ZNK4sycl3_V17nd_itemILi1EE7barrierENS0_6access11fence_spaceE(ptr addrspace(4) noundef align 1 dereferenceable_or_null(1) %57, i32 noundef 0) #6
  br label %301

301:                                              ; preds = %300
  %302 = load i32, ptr addrspace(4) %50, align 4
  %303 = add nsw i32 %302, 1
  store i32 %303, ptr addrspace(4) %50, align 4
  br label %187, !llvm.loop !12

304:                                              ; preds = %286, %187
  %305 = load i8, ptr addrspace(4) %49, align 1
  %306 = trunc i8 %305 to i1
  br i1 %306, label %307, label %318

307:                                              ; preds = %304
  %308 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %58, i32 0, i32 7
  %309 = load i32, ptr addrspace(4) %39, align 4
  %310 = sext i32 %309 to i64
  %311 = call spir_func noundef align 4 dereferenceable(4) ptr addrspace(4) @_ZNK4sycl3_V119local_accessor_baseIiLi1ELNS0_6access4modeE1026ELNS2_11placeholderE0EEixILi1EvEERim(ptr addrspace(4) noundef align 8 dereferenceable_or_null(32) %308, i64 noundef %310) #6
  %312 = load i32, ptr addrspace(4) %311, align 4
  %313 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %58, i32 0, i32 10
  %314 = load ptr addrspace(4), ptr addrspace(4) %313, align 8
  %315 = load i32, ptr addrspace(4) %43, align 4
  %316 = sext i32 %315 to i64
  %317 = getelementptr inbounds i32, ptr addrspace(4) %314, i64 %316
  store i32 %312, ptr addrspace(4) %317, align 4
  br label %318

318:                                              ; preds = %307, %304
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN4sycl3_V16detail7Builder10getElementILi1EEEKNS0_7nd_itemIXT_EEEPS5_(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::nd_item") align 1 %0, ptr addrspace(4) noundef %1) #1 comdat align 2 !srcloc !14 {
  %3 = alloca ptr addrspace(4), align 8
  %4 = alloca %"class.sycl::_V1::range", align 8
  %5 = alloca %"class.sycl::_V1::range", align 8
  %6 = alloca %"class.sycl::_V1::range", align 8
  %7 = alloca %"class.sycl::_V1::id", align 8
  %8 = alloca %"class.sycl::_V1::id", align 8
  %9 = alloca %"class.sycl::_V1::id", align 8
  %10 = alloca %"class.sycl::_V1::id", align 8
  %11 = alloca %"class.sycl::_V1::group", align 8
  %12 = alloca %"class.sycl::_V1::item", align 8
  %13 = alloca %"class.sycl::_V1::item.0", align 8
  %14 = addrspacecast ptr %3 to ptr addrspace(4)
  %15 = addrspacecast ptr %4 to ptr addrspace(4)
  %16 = addrspacecast ptr %5 to ptr addrspace(4)
  %17 = addrspacecast ptr %6 to ptr addrspace(4)
  %18 = addrspacecast ptr %7 to ptr addrspace(4)
  %19 = addrspacecast ptr %8 to ptr addrspace(4)
  %20 = addrspacecast ptr %9 to ptr addrspace(4)
  %21 = addrspacecast ptr %10 to ptr addrspace(4)
  %22 = addrspacecast ptr %11 to ptr addrspace(4)
  %23 = addrspacecast ptr %12 to ptr addrspace(4)
  %24 = addrspacecast ptr %13 to ptr addrspace(4)
  store ptr addrspace(4) %1, ptr addrspace(4) %14, align 8
  call spir_func void @_ZN7__spirv14initGlobalSizeILi1EN4sycl3_V15rangeILi1EEEEET0_v(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::range") align 8 %15) #6
  call spir_func void @_ZN7__spirv17initWorkgroupSizeILi1EN4sycl3_V15rangeILi1EEEEET0_v(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::range") align 8 %16) #6
  call spir_func void @_ZN7__spirv17initNumWorkgroupsILi1EN4sycl3_V15rangeILi1EEEEET0_v(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::range") align 8 %17) #6
  call spir_func void @_ZN7__spirv15initWorkgroupIdILi1EN4sycl3_V12idILi1EEEEET0_v(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::id") align 8 %18) #6
  call spir_func void @_ZN7__spirv22initGlobalInvocationIdILi1EN4sycl3_V12idILi1EEEEET0_v(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::id") align 8 %19) #6
  call spir_func void @_ZN7__spirv21initLocalInvocationIdILi1EN4sycl3_V12idILi1EEEEET0_v(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::id") align 8 %20) #6
  call spir_func void @_ZN7__spirv16initGlobalOffsetILi1EN4sycl3_V12idILi1EEEEET0_v(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::id") align 8 %21) #6
  call spir_func void @_ZN4sycl3_V16detail7Builder11createGroupILi1EEENS0_5groupIXT_EEERKNS0_5rangeIXT_EEES9_S9_RKNS0_2idIXT_EEE(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::group") align 8 %22, ptr addrspace(4) noundef align 8 dereferenceable(8) %15, ptr addrspace(4) noundef align 8 dereferenceable(8) %16, ptr addrspace(4) noundef align 8 dereferenceable(8) %17, ptr addrspace(4) noundef align 8 dereferenceable(8) %18) #6
  call spir_func void @_ZN4sycl3_V16detail7Builder10createItemILi1ELb1EEENSt9enable_ifIXT0_ENS0_4itemIXT_EXT0_EEEE4typeERKNS0_5rangeIXT_EEERKNS0_2idIXT_EEESG_(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::item") align 8 %23, ptr addrspace(4) noundef align 8 dereferenceable(8) %15, ptr addrspace(4) noundef align 8 dereferenceable(8) %19, ptr addrspace(4) noundef align 8 dereferenceable(8) %21) #6
  call spir_func void @_ZN4sycl3_V16detail7Builder10createItemILi1ELb0EEENSt9enable_ifIXntT0_ENS0_4itemIXT_EXT0_EEEE4typeERKNS0_5rangeIXT_EEERKNS0_2idIXT_EEE(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::item.0") align 8 %24, ptr addrspace(4) noundef align 8 dereferenceable(8) %16, ptr addrspace(4) noundef align 8 dereferenceable(8) %20) #6
  call spir_func void @_ZN4sycl3_V16detail7Builder12createNDItemILi1EEENS0_7nd_itemIXT_EEERKNS0_4itemIXT_ELb1EEERKNS6_IXT_ELb0EEERKNS0_5groupIXT_EEE(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::nd_item") align 1 %0, ptr addrspace(4) noundef align 8 dereferenceable(24) %23, ptr addrspace(4) noundef align 8 dereferenceable(16) %24, ptr addrspace(4) noundef align 8 dereferenceable(32) %22) #6
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef ptr addrspace(4) @_ZN4sycl3_V16detail7declptrINS0_7nd_itemILi1EEEEEPT_v() #1 comdat !srcloc !15 {
  %1 = alloca ptr addrspace(4), align 8
  %2 = addrspacecast ptr %1 to ptr addrspace(4)
  ret ptr addrspace(4) null
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN4sycl3_V119local_accessor_baseIiLi1ELNS0_6access4modeE1026ELNS2_11placeholderE0EEC2Ev(ptr addrspace(4) noundef align 8 dereferenceable_or_null(32) %0) unnamed_addr #1 comdat align 2 !srcloc !16 {
  %2 = alloca ptr addrspace(4), align 8
  %3 = alloca %"class.sycl::_V1::range", align 8
  %4 = addrspacecast ptr %2 to ptr addrspace(4)
  %5 = addrspacecast ptr %3 to ptr addrspace(4)
  store ptr addrspace(4) %0, ptr addrspace(4) %4, align 8
  %6 = load ptr addrspace(4), ptr addrspace(4) %4, align 8
  %7 = getelementptr inbounds nuw %"class.sycl::_V1::local_accessor_base", ptr addrspace(4) %6, i32 0, i32 0
  call spir_func void @_ZN4sycl3_V16detail14InitializedValILi1ENS0_5rangeEE3getILi0EEENS3_ILi1EEEv(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::range") align 8 %5) #6
  %8 = addrspacecast ptr addrspace(4) %5 to ptr
  call spir_func void @_ZN4sycl3_V16detail23LocalAccessorBaseDeviceILi1EEC2ENS0_5rangeILi1EEE(ptr addrspace(4) noundef align 8 dereferenceable_or_null(24) %7, ptr noundef byval(%"class.sycl::_V1::range") align 8 %8) #6
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN4sycl3_V16detail14InitializedValILi1ENS0_5rangeEE3getILi0EEENS3_ILi1EEEv(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::range") align 8 %0) #1 comdat align 2 !srcloc !17 {
  call spir_func void @_ZN4sycl3_V15rangeILi1EEC2ILi1EEENSt9enable_ifIXeqT_Li1EEmE4typeE(ptr addrspace(4) noundef align 8 dereferenceable_or_null(8) %0, i64 noundef 0) #6
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN4sycl3_V16detail23LocalAccessorBaseDeviceILi1EEC2ENS0_5rangeILi1EEE(ptr addrspace(4) noundef align 8 dereferenceable_or_null(24) %0, ptr noundef byval(%"class.sycl::_V1::range") align 8 %1) unnamed_addr #1 comdat align 2 !srcloc !18 {
  %3 = alloca ptr addrspace(4), align 8
  %4 = alloca ptr addrspace(4), align 8
  %5 = addrspacecast ptr %3 to ptr addrspace(4)
  %6 = addrspacecast ptr %4 to ptr addrspace(4)
  store ptr addrspace(4) %0, ptr addrspace(4) %5, align 8
  %7 = addrspacecast ptr %1 to ptr addrspace(4)
  store ptr addrspace(4) %7, ptr addrspace(4) %6, align 8
  %8 = load ptr addrspace(4), ptr addrspace(4) %5, align 8
  %9 = getelementptr inbounds nuw %"class.sycl::_V1::detail::LocalAccessorBaseDevice", ptr addrspace(4) %8, i32 0, i32 0
  call void @llvm.memcpy.p4.p4.i64(ptr addrspace(4) align 8 %9, ptr addrspace(4) align 8 %7, i64 8, i1 false)
  %10 = getelementptr inbounds nuw %"class.sycl::_V1::detail::LocalAccessorBaseDevice", ptr addrspace(4) %8, i32 0, i32 1
  call spir_func void @_ZN4sycl3_V16detail14InitializedValILi1ENS0_5rangeEE3getILi0EEENS3_ILi1EEEv(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::range") align 8 %10) #6
  %11 = getelementptr inbounds nuw %"class.sycl::_V1::detail::LocalAccessorBaseDevice", ptr addrspace(4) %8, i32 0, i32 2
  call spir_func void @_ZN4sycl3_V12idILi1EEC2Ev(ptr addrspace(4) noundef align 8 dereferenceable_or_null(8) %11) #6
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN4sycl3_V15rangeILi1EEC2ILi1EEENSt9enable_ifIXeqT_Li1EEmE4typeE(ptr addrspace(4) noundef align 8 dereferenceable_or_null(8) %0, i64 noundef %1) unnamed_addr #1 comdat align 2 !srcloc !19 {
  %3 = alloca ptr addrspace(4), align 8
  %4 = alloca i64, align 8
  %5 = addrspacecast ptr %3 to ptr addrspace(4)
  %6 = addrspacecast ptr %4 to ptr addrspace(4)
  store ptr addrspace(4) %0, ptr addrspace(4) %5, align 8
  store i64 %1, ptr addrspace(4) %6, align 8
  %7 = load ptr addrspace(4), ptr addrspace(4) %5, align 8
  %8 = load i64, ptr addrspace(4) %6, align 8
  call spir_func void @_ZN4sycl3_V16detail5arrayILi1EEC2ILi1EEENSt9enable_ifIXeqT_Li1EEmE4typeE(ptr addrspace(4) noundef align 8 dereferenceable_or_null(8) %7, i64 noundef %8) #6
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN4sycl3_V16detail5arrayILi1EEC2ILi1EEENSt9enable_ifIXeqT_Li1EEmE4typeE(ptr addrspace(4) noundef align 8 dereferenceable_or_null(8) %0, i64 noundef %1) unnamed_addr #1 comdat align 2 !srcloc !20 {
  %3 = alloca ptr addrspace(4), align 8
  %4 = alloca i64, align 8
  %5 = addrspacecast ptr %3 to ptr addrspace(4)
  %6 = addrspacecast ptr %4 to ptr addrspace(4)
  store ptr addrspace(4) %0, ptr addrspace(4) %5, align 8
  store i64 %1, ptr addrspace(4) %6, align 8
  %7 = load ptr addrspace(4), ptr addrspace(4) %5, align 8
  %8 = getelementptr inbounds nuw %"class.sycl::_V1::detail::array", ptr addrspace(4) %7, i32 0, i32 0
  %9 = load i64, ptr addrspace(4) %6, align 8
  store i64 %9, ptr addrspace(4) %8, align 8
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN4sycl3_V12idILi1EEC2Ev(ptr addrspace(4) noundef align 8 dereferenceable_or_null(8) %0) unnamed_addr #1 comdat align 2 !srcloc !21 {
  %2 = alloca ptr addrspace(4), align 8
  %3 = addrspacecast ptr %2 to ptr addrspace(4)
  store ptr addrspace(4) %0, ptr addrspace(4) %3, align 8
  %4 = load ptr addrspace(4), ptr addrspace(4) %3, align 8
  call spir_func void @_ZN4sycl3_V16detail5arrayILi1EEC2ILi1EEENSt9enable_ifIXeqT_Li1EEmE4typeE(ptr addrspace(4) noundef align 8 dereferenceable_or_null(8) %4, i64 noundef 0) #6
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN4sycl3_V119local_accessor_baseIiLi1ELNS0_6access4modeE1026ELNS2_11placeholderE0EE6__initEPU3AS3iNS0_5rangeILi1EEES9_NS0_2idILi1EEE(ptr addrspace(4) noundef align 8 dereferenceable_or_null(32) %0, ptr addrspace(3) noundef %1, ptr noundef byval(%"class.sycl::_V1::range") align 8 %2, ptr noundef byval(%"class.sycl::_V1::range") align 8 %3, ptr noundef byval(%"class.sycl::_V1::id") align 8 %4) #1 comdat align 2 !srcloc !22 {
  %6 = alloca ptr addrspace(4), align 8
  %7 = alloca ptr addrspace(3), align 8
  %8 = alloca ptr addrspace(4), align 8
  %9 = alloca ptr addrspace(4), align 8
  %10 = alloca ptr addrspace(4), align 8
  %11 = alloca %class._ZTSZN4sycl3_V119local_accessor_baseIiLi1ELNS0_6access4modeE1026ELNS2_11placeholderE0EE6__initEPU3AS3iNS0_5rangeILi1EEES9_NS0_2idILi1EEEEUlmE_, align 8
  %12 = addrspacecast ptr %6 to ptr addrspace(4)
  %13 = addrspacecast ptr %7 to ptr addrspace(4)
  %14 = addrspacecast ptr %8 to ptr addrspace(4)
  %15 = addrspacecast ptr %9 to ptr addrspace(4)
  %16 = addrspacecast ptr %10 to ptr addrspace(4)
  %17 = addrspacecast ptr %11 to ptr addrspace(4)
  store ptr addrspace(4) %0, ptr addrspace(4) %12, align 8
  store ptr addrspace(3) %1, ptr addrspace(4) %13, align 8
  %18 = addrspacecast ptr %2 to ptr addrspace(4)
  store ptr addrspace(4) %18, ptr addrspace(4) %14, align 8
  %19 = addrspacecast ptr %3 to ptr addrspace(4)
  store ptr addrspace(4) %19, ptr addrspace(4) %15, align 8
  %20 = addrspacecast ptr %4 to ptr addrspace(4)
  store ptr addrspace(4) %20, ptr addrspace(4) %16, align 8
  %21 = load ptr addrspace(4), ptr addrspace(4) %12, align 8
  %22 = load ptr addrspace(3), ptr addrspace(4) %13, align 8
  %23 = getelementptr inbounds nuw %"class.sycl::_V1::local_accessor_base", ptr addrspace(4) %21, i32 0, i32 1
  store ptr addrspace(3) %22, ptr addrspace(4) %23, align 8
  %24 = getelementptr inbounds nuw %class._ZTSZN4sycl3_V119local_accessor_baseIiLi1ELNS0_6access4modeE1026ELNS2_11placeholderE0EE6__initEPU3AS3iNS0_5rangeILi1EEES9_NS0_2idILi1EEEEUlmE_, ptr addrspace(4) %17, i32 0, i32 0
  store ptr addrspace(4) %21, ptr addrspace(4) %24, align 8
  %25 = getelementptr inbounds nuw %class._ZTSZN4sycl3_V119local_accessor_baseIiLi1ELNS0_6access4modeE1026ELNS2_11placeholderE0EE6__initEPU3AS3iNS0_5rangeILi1EEES9_NS0_2idILi1EEEEUlmE_, ptr addrspace(4) %17, i32 0, i32 1
  store ptr addrspace(4) %18, ptr addrspace(4) %25, align 8
  call spir_func void @_ZN4sycl3_V16detail4loopILm1EZNS0_19local_accessor_baseIiLi1ELNS0_6access4modeE1026ELNS4_11placeholderE0EE6__initEPU3AS3iNS0_5rangeILi1EEESB_NS0_2idILi1EEEEUlmE_EEvOT0_(ptr addrspace(4) noundef align 8 dereferenceable(16) %17) #6
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN4sycl3_V16detail4loopILm1EZNS0_19local_accessor_baseIiLi1ELNS0_6access4modeE1026ELNS4_11placeholderE0EE6__initEPU3AS3iNS0_5rangeILi1EEESB_NS0_2idILi1EEEEUlmE_EEvOT0_(ptr addrspace(4) noundef align 8 dereferenceable(16) %0) #1 comdat !srcloc !23 {
  %2 = alloca ptr addrspace(4), align 8
  %3 = alloca %"struct.std::integer_sequence", align 1
  %4 = addrspacecast ptr %2 to ptr addrspace(4)
  %5 = addrspacecast ptr %3 to ptr addrspace(4)
  store ptr addrspace(4) %0, ptr addrspace(4) %4, align 8
  %6 = load ptr addrspace(4), ptr addrspace(4) %4, align 8
  %7 = addrspacecast ptr addrspace(4) %5 to ptr
  call spir_func void @_ZN4sycl3_V16detail9loop_implIJLm0EEZNS0_19local_accessor_baseIiLi1ELNS0_6access4modeE1026ELNS4_11placeholderE0EE6__initEPU3AS3iNS0_5rangeILi1EEESB_NS0_2idILi1EEEEUlmE_EEvSt16integer_sequenceImJXspT_EEEOT0_(ptr noundef byval(%"struct.std::integer_sequence") align 1 %7, ptr addrspace(4) noundef align 8 dereferenceable(16) %6) #6
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN4sycl3_V16detail9loop_implIJLm0EEZNS0_19local_accessor_baseIiLi1ELNS0_6access4modeE1026ELNS4_11placeholderE0EE6__initEPU3AS3iNS0_5rangeILi1EEESB_NS0_2idILi1EEEEUlmE_EEvSt16integer_sequenceImJXspT_EEEOT0_(ptr noundef byval(%"struct.std::integer_sequence") align 1 %0, ptr addrspace(4) noundef align 8 dereferenceable(16) %1) #1 comdat !srcloc !24 {
  %3 = alloca ptr addrspace(4), align 8
  %4 = alloca ptr addrspace(4), align 8
  %5 = alloca %"struct.std::integral_constant", align 1
  %6 = addrspacecast ptr %3 to ptr addrspace(4)
  %7 = addrspacecast ptr %4 to ptr addrspace(4)
  %8 = addrspacecast ptr %5 to ptr addrspace(4)
  %9 = addrspacecast ptr %0 to ptr addrspace(4)
  store ptr addrspace(4) %9, ptr addrspace(4) %6, align 8
  store ptr addrspace(4) %1, ptr addrspace(4) %7, align 8
  %10 = load ptr addrspace(4), ptr addrspace(4) %7, align 8
  %11 = call spir_func noundef i64 @_ZNKSt17integral_constantImLm0EEcvmEv(ptr addrspace(4) noundef align 1 dereferenceable_or_null(1) %8) #6
  call spir_func void @_ZZN4sycl3_V119local_accessor_baseIiLi1ELNS0_6access4modeE1026ELNS2_11placeholderE0EE6__initEPU3AS3iNS0_5rangeILi1EEES9_NS0_2idILi1EEEENKUlmE_clEm(ptr addrspace(4) noundef align 8 dereferenceable_or_null(16) %10, i64 noundef %11) #6
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZZN4sycl3_V119local_accessor_baseIiLi1ELNS0_6access4modeE1026ELNS2_11placeholderE0EE6__initEPU3AS3iNS0_5rangeILi1EEES9_NS0_2idILi1EEEENKUlmE_clEm(ptr addrspace(4) noundef align 8 dereferenceable_or_null(16) %0, i64 noundef %1) #1 comdat align 2 !srcloc !25 {
  %3 = alloca ptr addrspace(4), align 8
  %4 = alloca i64, align 8
  %5 = addrspacecast ptr %3 to ptr addrspace(4)
  %6 = addrspacecast ptr %4 to ptr addrspace(4)
  store ptr addrspace(4) %0, ptr addrspace(4) %5, align 8
  store i64 %1, ptr addrspace(4) %6, align 8
  %7 = load ptr addrspace(4), ptr addrspace(4) %5, align 8
  %8 = getelementptr inbounds nuw %class._ZTSZN4sycl3_V119local_accessor_baseIiLi1ELNS0_6access4modeE1026ELNS2_11placeholderE0EE6__initEPU3AS3iNS0_5rangeILi1EEES9_NS0_2idILi1EEEEUlmE_, ptr addrspace(4) %7, i32 0, i32 0
  %9 = load ptr addrspace(4), ptr addrspace(4) %8, align 8
  %10 = getelementptr inbounds nuw %class._ZTSZN4sycl3_V119local_accessor_baseIiLi1ELNS0_6access4modeE1026ELNS2_11placeholderE0EE6__initEPU3AS3iNS0_5rangeILi1EEES9_NS0_2idILi1EEEEUlmE_, ptr addrspace(4) %7, i32 0, i32 1
  %11 = load ptr addrspace(4), ptr addrspace(4) %10, align 8
  %12 = load i64, ptr addrspace(4) %6, align 8
  %13 = trunc i64 %12 to i32
  %14 = call spir_func noundef align 8 dereferenceable(8) ptr addrspace(4) @_ZN4sycl3_V16detail5arrayILi1EEixEi(ptr addrspace(4) noundef align 8 dereferenceable_or_null(8) %11, i32 noundef %13) #6
  %15 = load i64, ptr addrspace(4) %14, align 8
  %16 = call spir_func noundef align 8 dereferenceable(8) ptr addrspace(4) @_ZN4sycl3_V119local_accessor_baseIiLi1ELNS0_6access4modeE1026ELNS2_11placeholderE0EE7getSizeEv(ptr addrspace(4) noundef align 8 dereferenceable_or_null(32) %9) #6
  %17 = load i64, ptr addrspace(4) %6, align 8
  %18 = trunc i64 %17 to i32
  %19 = call spir_func noundef align 8 dereferenceable(8) ptr addrspace(4) @_ZN4sycl3_V16detail5arrayILi1EEixEi(ptr addrspace(4) noundef align 8 dereferenceable_or_null(8) %16, i32 noundef %18) #6
  store i64 %15, ptr addrspace(4) %19, align 8
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef i64 @_ZNKSt17integral_constantImLm0EEcvmEv(ptr addrspace(4) noundef align 1 dereferenceable_or_null(1) %0) #1 comdat align 2 !srcloc !26 {
  %2 = alloca i64, align 8
  %3 = alloca ptr addrspace(4), align 8
  %4 = addrspacecast ptr %2 to ptr addrspace(4)
  %5 = addrspacecast ptr %3 to ptr addrspace(4)
  store ptr addrspace(4) %0, ptr addrspace(4) %5, align 8
  %6 = load ptr addrspace(4), ptr addrspace(4) %5, align 8
  ret i64 0
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef align 8 dereferenceable(8) ptr addrspace(4) @_ZN4sycl3_V16detail5arrayILi1EEixEi(ptr addrspace(4) noundef align 8 dereferenceable_or_null(8) %0, i32 noundef %1) #1 comdat align 2 !srcloc !27 {
  %3 = alloca ptr addrspace(4), align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr addrspace(4), align 8
  %6 = alloca ptr addrspace(4), align 8
  %7 = alloca i32, align 4
  %8 = addrspacecast ptr %5 to ptr addrspace(4)
  %9 = addrspacecast ptr %6 to ptr addrspace(4)
  %10 = addrspacecast ptr %7 to ptr addrspace(4)
  store ptr addrspace(4) %0, ptr addrspace(4) %9, align 8
  store i32 %1, ptr addrspace(4) %10, align 4
  %11 = load ptr addrspace(4), ptr addrspace(4) %9, align 8
  %12 = load i32, ptr addrspace(4) %10, align 4
  %13 = addrspacecast ptr %3 to ptr addrspace(4)
  %14 = addrspacecast ptr %4 to ptr addrspace(4)
  store ptr addrspace(4) %11, ptr addrspace(4) %13, align 8
  store i32 %12, ptr addrspace(4) %14, align 4
  %15 = load ptr addrspace(4), ptr addrspace(4) %13, align 8
  %16 = getelementptr inbounds nuw %"class.sycl::_V1::detail::array", ptr addrspace(4) %11, i32 0, i32 0
  %17 = load i32, ptr addrspace(4) %10, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds [1 x i64], ptr addrspace(4) %16, i64 0, i64 %18
  ret ptr addrspace(4) %19
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef align 8 dereferenceable(8) ptr addrspace(4) @_ZN4sycl3_V119local_accessor_baseIiLi1ELNS0_6access4modeE1026ELNS2_11placeholderE0EE7getSizeEv(ptr addrspace(4) noundef align 8 dereferenceable_or_null(32) %0) #1 comdat align 2 !srcloc !28 {
  %2 = alloca ptr addrspace(4), align 8
  %3 = alloca ptr addrspace(4), align 8
  %4 = addrspacecast ptr %2 to ptr addrspace(4)
  %5 = addrspacecast ptr %3 to ptr addrspace(4)
  store ptr addrspace(4) %0, ptr addrspace(4) %5, align 8
  %6 = load ptr addrspace(4), ptr addrspace(4) %5, align 8
  %7 = getelementptr inbounds nuw %"class.sycl::_V1::local_accessor_base", ptr addrspace(4) %6, i32 0, i32 0
  %8 = getelementptr inbounds nuw %"class.sycl::_V1::detail::LocalAccessorBaseDevice", ptr addrspace(4) %7, i32 0, i32 1
  ret ptr addrspace(4) %8
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef i64 @_ZNK4sycl3_V17nd_itemILi1EE15get_local_rangeEi(ptr addrspace(4) noundef align 1 dereferenceable_or_null(1) %0, i32 noundef %1) #1 comdat align 2 !srcloc !29 {
  %3 = alloca i64, align 8
  %4 = alloca ptr addrspace(4), align 8
  %5 = alloca i32, align 4
  %6 = alloca i64, align 8
  %7 = alloca %"class.sycl::_V1::range", align 8
  %8 = addrspacecast ptr %3 to ptr addrspace(4)
  %9 = addrspacecast ptr %4 to ptr addrspace(4)
  %10 = addrspacecast ptr %5 to ptr addrspace(4)
  %11 = addrspacecast ptr %6 to ptr addrspace(4)
  %12 = addrspacecast ptr %7 to ptr addrspace(4)
  store ptr addrspace(4) %0, ptr addrspace(4) %9, align 8
  store i32 %1, ptr addrspace(4) %10, align 4
  %13 = load ptr addrspace(4), ptr addrspace(4) %9, align 8
  call spir_func void @_ZNK4sycl3_V17nd_itemILi1EE15get_local_rangeEv(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::range") align 8 %12, ptr addrspace(4) noundef align 1 dereferenceable_or_null(1) %13) #6
  %14 = load i32, ptr addrspace(4) %10, align 4
  %15 = call spir_func noundef align 8 dereferenceable(8) ptr addrspace(4) @_ZN4sycl3_V16detail5arrayILi1EEixEi(ptr addrspace(4) noundef align 8 dereferenceable_or_null(8) %12, i32 noundef %14) #6
  %16 = load i64, ptr addrspace(4) %15, align 8
  store i64 %16, ptr addrspace(4) %11, align 8
  %17 = load i64, ptr addrspace(4) %11, align 8
  %18 = icmp ule i64 %17, 2147483647
  call void @llvm.assume(i1 %18)
  %19 = load i64, ptr addrspace(4) %11, align 8
  ret i64 %19
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef align 4 dereferenceable(4) ptr addrspace(4) @_ZNK4sycl3_V119local_accessor_baseIiLi1ELNS0_6access4modeE1026ELNS2_11placeholderE0EEixILi1EvEERim(ptr addrspace(4) noundef align 8 dereferenceable_or_null(32) %0, i64 noundef %1) #1 comdat align 2 !srcloc !30 {
  %3 = alloca ptr addrspace(4), align 8
  %4 = alloca ptr addrspace(4), align 8
  %5 = alloca i64, align 8
  %6 = addrspacecast ptr %3 to ptr addrspace(4)
  %7 = addrspacecast ptr %4 to ptr addrspace(4)
  %8 = addrspacecast ptr %5 to ptr addrspace(4)
  store ptr addrspace(4) %0, ptr addrspace(4) %7, align 8
  store i64 %1, ptr addrspace(4) %8, align 8
  %9 = load ptr addrspace(4), ptr addrspace(4) %7, align 8
  %10 = call spir_func noundef ptr addrspace(3) @_ZNK4sycl3_V119local_accessor_baseIiLi1ELNS0_6access4modeE1026ELNS2_11placeholderE0EE15getQualifiedPtrEv(ptr addrspace(4) noundef align 8 dereferenceable_or_null(32) %9) #6
  %11 = load i64, ptr addrspace(4) %8, align 8
  %12 = getelementptr inbounds nuw i32, ptr addrspace(3) %10, i64 %11
  %13 = addrspacecast ptr addrspace(3) %12 to ptr addrspace(4)
  ret ptr addrspace(4) %13
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZNK4sycl3_V17nd_itemILi1EE7barrierENS0_6access11fence_spaceE(ptr addrspace(4) noundef align 1 dereferenceable_or_null(1) %0, i32 noundef %1) #1 comdat align 2 !srcloc !31 {
  %3 = alloca ptr addrspace(4), align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca %"struct.__spv::MemorySemanticsMask", align 4
  %7 = addrspacecast ptr %3 to ptr addrspace(4)
  %8 = addrspacecast ptr %4 to ptr addrspace(4)
  %9 = addrspacecast ptr %5 to ptr addrspace(4)
  %10 = addrspacecast ptr %6 to ptr addrspace(4)
  store ptr addrspace(4) %0, ptr addrspace(4) %7, align 8
  store i32 %1, ptr addrspace(4) %8, align 4
  %11 = load ptr addrspace(4), ptr addrspace(4) %7, align 8
  %12 = load i32, ptr addrspace(4) %8, align 4
  call spir_func void @_ZN5__spv19MemorySemanticsMaskC2ENS0_4FlagE(ptr addrspace(4) noundef align 4 dereferenceable_or_null(4) %10, i32 noundef 256) #6
  %13 = addrspacecast ptr addrspace(4) %10 to ptr
  %14 = call spir_func noundef i32 @_ZN4sycl3_V16detail27getSPIRVMemorySemanticsMaskENS0_6access11fence_spaceEN5__spv19MemorySemanticsMaskE(i32 noundef %12, ptr noundef byval(%"struct.__spv::MemorySemanticsMask") align 4 %13) #6
  store i32 %14, ptr addrspace(4) %9, align 4
  %15 = load i32, ptr addrspace(4) %9, align 4
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 noundef 2, i32 noundef 2, i32 noundef %15) #6
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZNK4sycl3_V17nd_itemILi1EE15get_local_rangeEv(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::range") align 8 %0, ptr addrspace(4) noundef align 1 dereferenceable_or_null(1) %1) #1 comdat align 2 !srcloc !32 {
  %3 = alloca ptr addrspace(4), align 8
  %4 = addrspacecast ptr %3 to ptr addrspace(4)
  store ptr addrspace(4) %1, ptr addrspace(4) %4, align 8
  %5 = load ptr addrspace(4), ptr addrspace(4) %4, align 8
  call spir_func void @_ZN7__spirv17initWorkgroupSizeILi1EN4sycl3_V15rangeILi1EEEEET0_v(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::range") align 8 %0) #6
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #3

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN7__spirv17initWorkgroupSizeILi1EN4sycl3_V15rangeILi1EEEEET0_v(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::range") align 8 %0) #1 comdat !srcloc !33 {
  call spir_func void @_ZN7__spirv24InitSizesSTWorkgroupSizeILi1EN4sycl3_V15rangeILi1EEEE8initSizeEv(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::range") align 8 %0) #6
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN7__spirv24InitSizesSTWorkgroupSizeILi1EN4sycl3_V15rangeILi1EEEE8initSizeEv(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::range") align 8 %0) #1 comdat align 2 !srcloc !34 {
  %2 = call spir_func noundef i64 @_ZN7__spirv16getWorkgroupSizeILi0EEEmv() #6
  call spir_func void @_ZN4sycl3_V15rangeILi1EEC2ILi1EEENSt9enable_ifIXeqT_Li1EEmE4typeE(ptr addrspace(4) noundef align 8 dereferenceable_or_null(8) %0, i64 noundef %2) #6
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef i64 @_ZN7__spirv16getWorkgroupSizeILi0EEEmv() #1 !srcloc !35 {
  %1 = alloca i64, align 8
  %2 = addrspacecast ptr %1 to ptr addrspace(4)
  %3 = call spir_func noundef i64 @_Z23__spirv_WorkgroupSize_xv() #6
  ret i64 %3
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef i64 @_Z23__spirv_WorkgroupSize_xv() #4 comdat !srcloc !36 {
  %1 = alloca i64, align 8
  %2 = addrspacecast ptr %1 to ptr addrspace(4)
  %3 = load <3 x i64>, ptr addrspace(4) addrspacecast (ptr addrspace(1) @__spirv_BuiltInWorkgroupSize to ptr addrspace(4)), align 32
  %4 = extractelement <3 x i64> %3, i64 0
  ret i64 %4
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZNK4sycl3_V17nd_itemILi1EE12get_group_idEv(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::id") align 8 %0, ptr addrspace(4) noundef align 1 dereferenceable_or_null(1) %1) #1 comdat align 2 !srcloc !37 {
  %3 = alloca ptr addrspace(4), align 8
  %4 = addrspacecast ptr %3 to ptr addrspace(4)
  store ptr addrspace(4) %1, ptr addrspace(4) %4, align 8
  %5 = load ptr addrspace(4), ptr addrspace(4) %4, align 8
  call spir_func void @_ZN7__spirv15initWorkgroupIdILi1EN4sycl3_V12idILi1EEEEET0_v(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::id") align 8 %0) #6
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN7__spirv15initWorkgroupIdILi1EN4sycl3_V12idILi1EEEEET0_v(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::id") align 8 %0) #1 comdat !srcloc !38 {
  call spir_func void @_ZN7__spirv22InitSizesSTWorkgroupIdILi1EN4sycl3_V12idILi1EEEE8initSizeEv(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::id") align 8 %0) #6
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN7__spirv22InitSizesSTWorkgroupIdILi1EN4sycl3_V12idILi1EEEE8initSizeEv(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::id") align 8 %0) #1 comdat align 2 !srcloc !39 {
  %2 = call spir_func noundef i64 @_ZN7__spirv14getWorkgroupIdILi0EEEmv() #6
  call spir_func void @_ZN4sycl3_V12idILi1EEC2ILi1EEENSt9enable_ifIXeqT_Li1EEmE4typeE(ptr addrspace(4) noundef align 8 dereferenceable_or_null(8) %0, i64 noundef %2) #6
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef i64 @_ZN7__spirv14getWorkgroupIdILi0EEEmv() #1 !srcloc !40 {
  %1 = alloca i64, align 8
  %2 = addrspacecast ptr %1 to ptr addrspace(4)
  %3 = call spir_func noundef i64 @_Z21__spirv_WorkgroupId_xv() #6
  ret i64 %3
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN4sycl3_V12idILi1EEC2ILi1EEENSt9enable_ifIXeqT_Li1EEmE4typeE(ptr addrspace(4) noundef align 8 dereferenceable_or_null(8) %0, i64 noundef %1) unnamed_addr #1 comdat align 2 !srcloc !41 {
  %3 = alloca ptr addrspace(4), align 8
  %4 = alloca i64, align 8
  %5 = addrspacecast ptr %3 to ptr addrspace(4)
  %6 = addrspacecast ptr %4 to ptr addrspace(4)
  store ptr addrspace(4) %0, ptr addrspace(4) %5, align 8
  store i64 %1, ptr addrspace(4) %6, align 8
  %7 = load ptr addrspace(4), ptr addrspace(4) %5, align 8
  %8 = load i64, ptr addrspace(4) %6, align 8
  call spir_func void @_ZN4sycl3_V16detail5arrayILi1EEC2ILi1EEENSt9enable_ifIXeqT_Li1EEmE4typeE(ptr addrspace(4) noundef align 8 dereferenceable_or_null(8) %7, i64 noundef %8) #6
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef i64 @_Z21__spirv_WorkgroupId_xv() #4 comdat !srcloc !42 {
  %1 = alloca i64, align 8
  %2 = addrspacecast ptr %1 to ptr addrspace(4)
  %3 = load <3 x i64>, ptr addrspace(4) addrspacecast (ptr addrspace(1) @__spirv_BuiltInWorkgroupId to ptr addrspace(4)), align 32
  %4 = extractelement <3 x i64> %3, i64 0
  ret i64 %4
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZNK4sycl3_V17nd_itemILi1EE12get_local_idEv(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::id") align 8 %0, ptr addrspace(4) noundef align 1 dereferenceable_or_null(1) %1) #1 comdat align 2 !srcloc !43 {
  %3 = alloca ptr addrspace(4), align 8
  %4 = addrspacecast ptr %3 to ptr addrspace(4)
  store ptr addrspace(4) %1, ptr addrspace(4) %4, align 8
  %5 = load ptr addrspace(4), ptr addrspace(4) %4, align 8
  call spir_func void @_ZN7__spirv21initLocalInvocationIdILi1EN4sycl3_V12idILi1EEEEET0_v(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::id") align 8 %0) #6
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN7__spirv21initLocalInvocationIdILi1EN4sycl3_V12idILi1EEEEET0_v(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::id") align 8 %0) #1 comdat !srcloc !44 {
  call spir_func void @_ZN7__spirv28InitSizesSTLocalInvocationIdILi1EN4sycl3_V12idILi1EEEE8initSizeEv(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::id") align 8 %0) #6
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN7__spirv28InitSizesSTLocalInvocationIdILi1EN4sycl3_V12idILi1EEEE8initSizeEv(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::id") align 8 %0) #1 comdat align 2 !srcloc !45 {
  %2 = call spir_func noundef i64 @_ZN7__spirv20getLocalInvocationIdILi0EEEmv() #6
  call spir_func void @_ZN4sycl3_V12idILi1EEC2ILi1EEENSt9enable_ifIXeqT_Li1EEmE4typeE(ptr addrspace(4) noundef align 8 dereferenceable_or_null(8) %0, i64 noundef %2) #6
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef i64 @_ZN7__spirv20getLocalInvocationIdILi0EEEmv() #1 !srcloc !46 {
  %1 = alloca i64, align 8
  %2 = addrspacecast ptr %1 to ptr addrspace(4)
  %3 = call spir_func noundef i64 @_Z27__spirv_LocalInvocationId_xv() #6
  ret i64 %3
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef i64 @_Z27__spirv_LocalInvocationId_xv() #4 comdat !srcloc !47 {
  %1 = alloca i64, align 8
  %2 = addrspacecast ptr %1 to ptr addrspace(4)
  %3 = load <3 x i64>, ptr addrspace(4) addrspacecast (ptr addrspace(1) @__spirv_BuiltInLocalInvocationId to ptr addrspace(4)), align 32
  %4 = extractelement <3 x i64> %3, i64 0
  ret i64 %4
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef ptr addrspace(3) @_ZNK4sycl3_V119local_accessor_baseIiLi1ELNS0_6access4modeE1026ELNS2_11placeholderE0EE15getQualifiedPtrEv(ptr addrspace(4) noundef align 8 dereferenceable_or_null(32) %0) #1 comdat align 2 !srcloc !48 {
  %2 = alloca ptr addrspace(3), align 8
  %3 = alloca ptr addrspace(4), align 8
  %4 = addrspacecast ptr %2 to ptr addrspace(4)
  %5 = addrspacecast ptr %3 to ptr addrspace(4)
  store ptr addrspace(4) %0, ptr addrspace(4) %5, align 8
  %6 = load ptr addrspace(4), ptr addrspace(4) %5, align 8
  %7 = getelementptr inbounds nuw %"class.sycl::_V1::local_accessor_base", ptr addrspace(4) %6, i32 0, i32 1
  %8 = load ptr addrspace(3), ptr addrspace(4) %7, align 8
  ret ptr addrspace(3) %8
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef i32 @_ZN4sycl3_V16detail27getSPIRVMemorySemanticsMaskENS0_6access11fence_spaceEN5__spv19MemorySemanticsMaskE(i32 noundef %0, ptr noundef byval(%"struct.__spv::MemorySemanticsMask") align 4 %1) #1 comdat !srcloc !49 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr addrspace(4), align 8
  %6 = addrspacecast ptr %3 to ptr addrspace(4)
  %7 = addrspacecast ptr %4 to ptr addrspace(4)
  %8 = addrspacecast ptr %5 to ptr addrspace(4)
  store i32 %0, ptr addrspace(4) %7, align 4
  %9 = addrspacecast ptr %1 to ptr addrspace(4)
  store ptr addrspace(4) %9, ptr addrspace(4) %8, align 8
  %10 = load i32, ptr addrspace(4) %7, align 4
  %11 = icmp eq i32 %10, 1
  br i1 %11, label %12, label %13

12:                                               ; preds = %2
  br label %24

13:                                               ; preds = %2
  %14 = load i32, ptr addrspace(4) %7, align 4
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %19

16:                                               ; preds = %13
  %17 = call spir_func noundef i32 @_ZNK5__spv19MemorySemanticsMaskcvjEv(ptr addrspace(4) noundef align 4 dereferenceable_or_null(4) %9) #6
  %18 = or i32 16, %17
  br label %22

19:                                               ; preds = %13
  %20 = call spir_func noundef i32 @_ZNK5__spv19MemorySemanticsMaskcvjEv(ptr addrspace(4) noundef align 4 dereferenceable_or_null(4) %9) #6
  %21 = or i32 528, %20
  br label %22

22:                                               ; preds = %19, %16
  %23 = phi i32 [ %18, %16 ], [ %21, %19 ]
  br label %24

24:                                               ; preds = %22, %12
  %25 = phi i32 [ 528, %12 ], [ %23, %22 ]
  ret i32 %25
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN5__spv19MemorySemanticsMaskC2ENS0_4FlagE(ptr addrspace(4) noundef align 4 dereferenceable_or_null(4) %0, i32 noundef %1) unnamed_addr #1 comdat align 2 !srcloc !50 {
  %3 = alloca ptr addrspace(4), align 8
  %4 = alloca i32, align 4
  %5 = addrspacecast ptr %3 to ptr addrspace(4)
  %6 = addrspacecast ptr %4 to ptr addrspace(4)
  store ptr addrspace(4) %0, ptr addrspace(4) %5, align 8
  store i32 %1, ptr addrspace(4) %6, align 4
  %7 = load ptr addrspace(4), ptr addrspace(4) %5, align 8
  %8 = getelementptr inbounds nuw %"struct.__spv::MemorySemanticsMask", ptr addrspace(4) %7, i32 0, i32 0
  %9 = load i32, ptr addrspace(4) %6, align 4
  store i32 %9, ptr addrspace(4) %8, align 4
  ret void
}

; Function Attrs: convergent nounwind
declare dso_local spir_func void @_Z22__spirv_ControlBarrieriii(i32 noundef, i32 noundef, i32 noundef) #5

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef i32 @_ZNK5__spv19MemorySemanticsMaskcvjEv(ptr addrspace(4) noundef align 4 dereferenceable_or_null(4) %0) #1 comdat align 2 !srcloc !51 {
  %2 = alloca i32, align 4
  %3 = alloca ptr addrspace(4), align 8
  %4 = addrspacecast ptr %2 to ptr addrspace(4)
  %5 = addrspacecast ptr %3 to ptr addrspace(4)
  store ptr addrspace(4) %0, ptr addrspace(4) %5, align 8
  %6 = load ptr addrspace(4), ptr addrspace(4) %5, align 8
  %7 = getelementptr inbounds nuw %"struct.__spv::MemorySemanticsMask", ptr addrspace(4) %6, i32 0, i32 0
  %8 = load i32, ptr addrspace(4) %7, align 4
  ret i32 %8
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN7__spirv14initGlobalSizeILi1EN4sycl3_V15rangeILi1EEEEET0_v(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::range") align 8 %0) #1 comdat !srcloc !52 {
  call spir_func void @_ZN7__spirv21InitSizesSTGlobalSizeILi1EN4sycl3_V15rangeILi1EEEE8initSizeEv(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::range") align 8 %0) #6
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN7__spirv17initNumWorkgroupsILi1EN4sycl3_V15rangeILi1EEEEET0_v(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::range") align 8 %0) #1 comdat !srcloc !53 {
  call spir_func void @_ZN7__spirv24InitSizesSTNumWorkgroupsILi1EN4sycl3_V15rangeILi1EEEE8initSizeEv(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::range") align 8 %0) #6
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN7__spirv22initGlobalInvocationIdILi1EN4sycl3_V12idILi1EEEEET0_v(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::id") align 8 %0) #1 comdat !srcloc !54 {
  call spir_func void @_ZN7__spirv29InitSizesSTGlobalInvocationIdILi1EN4sycl3_V12idILi1EEEE8initSizeEv(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::id") align 8 %0) #6
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN7__spirv16initGlobalOffsetILi1EN4sycl3_V12idILi1EEEEET0_v(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::id") align 8 %0) #1 comdat !srcloc !55 {
  call spir_func void @_ZN7__spirv23InitSizesSTGlobalOffsetILi1EN4sycl3_V12idILi1EEEE8initSizeEv(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::id") align 8 %0) #6
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN4sycl3_V16detail7Builder11createGroupILi1EEENS0_5groupIXT_EEERKNS0_5rangeIXT_EEES9_S9_RKNS0_2idIXT_EEE(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::group") align 8 %0, ptr addrspace(4) noundef align 8 dereferenceable(8) %1, ptr addrspace(4) noundef align 8 dereferenceable(8) %2, ptr addrspace(4) noundef align 8 dereferenceable(8) %3, ptr addrspace(4) noundef align 8 dereferenceable(8) %4) #1 comdat align 2 !srcloc !56 {
  %6 = alloca ptr addrspace(4), align 8
  %7 = alloca ptr addrspace(4), align 8
  %8 = alloca ptr addrspace(4), align 8
  %9 = alloca ptr addrspace(4), align 8
  %10 = alloca %"class.sycl::_V1::range", align 8
  %11 = addrspacecast ptr %6 to ptr addrspace(4)
  %12 = addrspacecast ptr %7 to ptr addrspace(4)
  %13 = addrspacecast ptr %8 to ptr addrspace(4)
  %14 = addrspacecast ptr %9 to ptr addrspace(4)
  %15 = addrspacecast ptr %10 to ptr addrspace(4)
  store ptr addrspace(4) %1, ptr addrspace(4) %11, align 8
  store ptr addrspace(4) %2, ptr addrspace(4) %12, align 8
  store ptr addrspace(4) %3, ptr addrspace(4) %13, align 8
  store ptr addrspace(4) %4, ptr addrspace(4) %14, align 8
  %16 = load ptr addrspace(4), ptr addrspace(4) %11, align 8
  %17 = load ptr addrspace(4), ptr addrspace(4) %12, align 8
  %18 = load ptr addrspace(4), ptr addrspace(4) %13, align 8
  call void @llvm.memcpy.p4.p4.i64(ptr addrspace(4) align 8 %15, ptr addrspace(4) align 8 %18, i64 8, i1 false)
  %19 = load ptr addrspace(4), ptr addrspace(4) %14, align 8
  %20 = addrspacecast ptr addrspace(4) %15 to ptr
  call spir_func void @_ZN4sycl3_V15groupILi1EEC2ERKNS0_5rangeILi1EEES6_S4_RKNS0_2idILi1EEE(ptr addrspace(4) noundef align 8 dereferenceable_or_null(32) %0, ptr addrspace(4) noundef align 8 dereferenceable(8) %16, ptr addrspace(4) noundef align 8 dereferenceable(8) %17, ptr noundef byval(%"class.sycl::_V1::range") align 8 %20, ptr addrspace(4) noundef align 8 dereferenceable(8) %19) #6
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN4sycl3_V16detail7Builder10createItemILi1ELb1EEENSt9enable_ifIXT0_ENS0_4itemIXT_EXT0_EEEE4typeERKNS0_5rangeIXT_EEERKNS0_2idIXT_EEESG_(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::item") align 8 %0, ptr addrspace(4) noundef align 8 dereferenceable(8) %1, ptr addrspace(4) noundef align 8 dereferenceable(8) %2, ptr addrspace(4) noundef align 8 dereferenceable(8) %3) #1 comdat align 2 !srcloc !57 {
  %5 = alloca ptr addrspace(4), align 8
  %6 = alloca ptr addrspace(4), align 8
  %7 = alloca ptr addrspace(4), align 8
  %8 = addrspacecast ptr %5 to ptr addrspace(4)
  %9 = addrspacecast ptr %6 to ptr addrspace(4)
  %10 = addrspacecast ptr %7 to ptr addrspace(4)
  store ptr addrspace(4) %1, ptr addrspace(4) %8, align 8
  store ptr addrspace(4) %2, ptr addrspace(4) %9, align 8
  store ptr addrspace(4) %3, ptr addrspace(4) %10, align 8
  %11 = load ptr addrspace(4), ptr addrspace(4) %8, align 8
  %12 = load ptr addrspace(4), ptr addrspace(4) %9, align 8
  %13 = load ptr addrspace(4), ptr addrspace(4) %10, align 8
  call spir_func void @_ZN4sycl3_V14itemILi1ELb1EEC2ILb1EEERNSt9enable_ifIXT_EKNS0_5rangeILi1EEEE4typeERKNS0_2idILi1EEESE_(ptr addrspace(4) noundef align 8 dereferenceable_or_null(24) %0, ptr addrspace(4) noundef align 8 dereferenceable(8) %11, ptr addrspace(4) noundef align 8 dereferenceable(8) %12, ptr addrspace(4) noundef align 8 dereferenceable(8) %13) #6
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN4sycl3_V16detail7Builder10createItemILi1ELb0EEENSt9enable_ifIXntT0_ENS0_4itemIXT_EXT0_EEEE4typeERKNS0_5rangeIXT_EEERKNS0_2idIXT_EEE(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::item.0") align 8 %0, ptr addrspace(4) noundef align 8 dereferenceable(8) %1, ptr addrspace(4) noundef align 8 dereferenceable(8) %2) #1 comdat align 2 !srcloc !58 {
  %4 = alloca ptr addrspace(4), align 8
  %5 = alloca ptr addrspace(4), align 8
  %6 = addrspacecast ptr %4 to ptr addrspace(4)
  %7 = addrspacecast ptr %5 to ptr addrspace(4)
  store ptr addrspace(4) %1, ptr addrspace(4) %6, align 8
  store ptr addrspace(4) %2, ptr addrspace(4) %7, align 8
  %8 = load ptr addrspace(4), ptr addrspace(4) %6, align 8
  %9 = load ptr addrspace(4), ptr addrspace(4) %7, align 8
  call spir_func void @_ZN4sycl3_V14itemILi1ELb0EEC2ILb0EEERNSt9enable_ifIXntT_EKNS0_5rangeILi1EEEE4typeERKNS0_2idILi1EEE(ptr addrspace(4) noundef align 8 dereferenceable_or_null(16) %0, ptr addrspace(4) noundef align 8 dereferenceable(8) %8, ptr addrspace(4) noundef align 8 dereferenceable(8) %9) #6
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN4sycl3_V16detail7Builder12createNDItemILi1EEENS0_7nd_itemIXT_EEERKNS0_4itemIXT_ELb1EEERKNS6_IXT_ELb0EEERKNS0_5groupIXT_EEE(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::nd_item") align 1 %0, ptr addrspace(4) noundef align 8 dereferenceable(24) %1, ptr addrspace(4) noundef align 8 dereferenceable(16) %2, ptr addrspace(4) noundef align 8 dereferenceable(32) %3) #1 comdat align 2 !srcloc !59 {
  %5 = alloca ptr addrspace(4), align 8
  %6 = alloca ptr addrspace(4), align 8
  %7 = alloca ptr addrspace(4), align 8
  %8 = addrspacecast ptr %5 to ptr addrspace(4)
  %9 = addrspacecast ptr %6 to ptr addrspace(4)
  %10 = addrspacecast ptr %7 to ptr addrspace(4)
  store ptr addrspace(4) %1, ptr addrspace(4) %8, align 8
  store ptr addrspace(4) %2, ptr addrspace(4) %9, align 8
  store ptr addrspace(4) %3, ptr addrspace(4) %10, align 8
  %11 = load ptr addrspace(4), ptr addrspace(4) %8, align 8
  %12 = load ptr addrspace(4), ptr addrspace(4) %9, align 8
  %13 = load ptr addrspace(4), ptr addrspace(4) %10, align 8
  call spir_func void @_ZN4sycl3_V17nd_itemILi1EEC2ERKNS0_4itemILi1ELb1EEERKNS3_ILi1ELb0EEERKNS0_5groupILi1EEE(ptr addrspace(4) noundef align 1 dereferenceable_or_null(1) %0, ptr addrspace(4) noundef align 8 dereferenceable(24) %11, ptr addrspace(4) noundef align 8 dereferenceable(16) %12, ptr addrspace(4) noundef align 8 dereferenceable(32) %13) #6
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN7__spirv21InitSizesSTGlobalSizeILi1EN4sycl3_V15rangeILi1EEEE8initSizeEv(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::range") align 8 %0) #1 comdat align 2 !srcloc !60 {
  %2 = call spir_func noundef i64 @_ZN7__spirv13getGlobalSizeILi0EEEmv() #6
  call spir_func void @_ZN4sycl3_V15rangeILi1EEC2ILi1EEENSt9enable_ifIXeqT_Li1EEmE4typeE(ptr addrspace(4) noundef align 8 dereferenceable_or_null(8) %0, i64 noundef %2) #6
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef i64 @_ZN7__spirv13getGlobalSizeILi0EEEmv() #1 !srcloc !61 {
  %1 = alloca i64, align 8
  %2 = addrspacecast ptr %1 to ptr addrspace(4)
  %3 = call spir_func noundef i64 @_Z20__spirv_GlobalSize_xv() #6
  ret i64 %3
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef i64 @_Z20__spirv_GlobalSize_xv() #4 comdat !srcloc !62 {
  %1 = alloca i64, align 8
  %2 = addrspacecast ptr %1 to ptr addrspace(4)
  %3 = load <3 x i64>, ptr addrspace(4) addrspacecast (ptr addrspace(1) @__spirv_BuiltInGlobalSize to ptr addrspace(4)), align 32
  %4 = extractelement <3 x i64> %3, i64 0
  ret i64 %4
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN7__spirv24InitSizesSTNumWorkgroupsILi1EN4sycl3_V15rangeILi1EEEE8initSizeEv(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::range") align 8 %0) #1 comdat align 2 !srcloc !63 {
  %2 = call spir_func noundef i64 @_ZN7__spirv16getNumWorkgroupsILi0EEEmv() #6
  call spir_func void @_ZN4sycl3_V15rangeILi1EEC2ILi1EEENSt9enable_ifIXeqT_Li1EEmE4typeE(ptr addrspace(4) noundef align 8 dereferenceable_or_null(8) %0, i64 noundef %2) #6
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef i64 @_ZN7__spirv16getNumWorkgroupsILi0EEEmv() #1 !srcloc !64 {
  %1 = alloca i64, align 8
  %2 = addrspacecast ptr %1 to ptr addrspace(4)
  %3 = call spir_func noundef i64 @_Z23__spirv_NumWorkgroups_xv() #6
  ret i64 %3
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef i64 @_Z23__spirv_NumWorkgroups_xv() #4 comdat !srcloc !65 {
  %1 = alloca i64, align 8
  %2 = addrspacecast ptr %1 to ptr addrspace(4)
  %3 = load <3 x i64>, ptr addrspace(4) addrspacecast (ptr addrspace(1) @__spirv_BuiltInNumWorkgroups to ptr addrspace(4)), align 32
  %4 = extractelement <3 x i64> %3, i64 0
  ret i64 %4
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN7__spirv29InitSizesSTGlobalInvocationIdILi1EN4sycl3_V12idILi1EEEE8initSizeEv(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::id") align 8 %0) #1 comdat align 2 !srcloc !66 {
  %2 = call spir_func noundef i64 @_ZN7__spirv21getGlobalInvocationIdILi0EEEmv() #6
  call spir_func void @_ZN4sycl3_V12idILi1EEC2ILi1EEENSt9enable_ifIXeqT_Li1EEmE4typeE(ptr addrspace(4) noundef align 8 dereferenceable_or_null(8) %0, i64 noundef %2) #6
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef i64 @_ZN7__spirv21getGlobalInvocationIdILi0EEEmv() #1 !srcloc !67 {
  %1 = alloca i64, align 8
  %2 = addrspacecast ptr %1 to ptr addrspace(4)
  %3 = call spir_func noundef i64 @_Z28__spirv_GlobalInvocationId_xv() #6
  ret i64 %3
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef i64 @_Z28__spirv_GlobalInvocationId_xv() #4 comdat !srcloc !68 {
  %1 = alloca i64, align 8
  %2 = addrspacecast ptr %1 to ptr addrspace(4)
  %3 = load <3 x i64>, ptr addrspace(4) addrspacecast (ptr addrspace(1) @__spirv_BuiltInGlobalInvocationId to ptr addrspace(4)), align 32
  %4 = extractelement <3 x i64> %3, i64 0
  ret i64 %4
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN7__spirv23InitSizesSTGlobalOffsetILi1EN4sycl3_V12idILi1EEEE8initSizeEv(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::id") align 8 %0) #1 comdat align 2 !srcloc !69 {
  %2 = call spir_func noundef i64 @_ZN7__spirv15getGlobalOffsetILi0EEEmv() #6
  call spir_func void @_ZN4sycl3_V12idILi1EEC2ILi1EEENSt9enable_ifIXeqT_Li1EEmE4typeE(ptr addrspace(4) noundef align 8 dereferenceable_or_null(8) %0, i64 noundef %2) #6
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef i64 @_ZN7__spirv15getGlobalOffsetILi0EEEmv() #1 !srcloc !70 {
  %1 = alloca i64, align 8
  %2 = addrspacecast ptr %1 to ptr addrspace(4)
  %3 = call spir_func noundef i64 @_Z22__spirv_GlobalOffset_xv() #6
  ret i64 %3
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef i64 @_Z22__spirv_GlobalOffset_xv() #4 comdat !srcloc !71 {
  %1 = alloca i64, align 8
  %2 = addrspacecast ptr %1 to ptr addrspace(4)
  %3 = load <3 x i64>, ptr addrspace(4) addrspacecast (ptr addrspace(1) @__spirv_BuiltInGlobalOffset to ptr addrspace(4)), align 32
  %4 = extractelement <3 x i64> %3, i64 0
  ret i64 %4
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN4sycl3_V15groupILi1EEC2ERKNS0_5rangeILi1EEES6_S4_RKNS0_2idILi1EEE(ptr addrspace(4) noundef align 8 dereferenceable_or_null(32) %0, ptr addrspace(4) noundef align 8 dereferenceable(8) %1, ptr addrspace(4) noundef align 8 dereferenceable(8) %2, ptr noundef byval(%"class.sycl::_V1::range") align 8 %3, ptr addrspace(4) noundef align 8 dereferenceable(8) %4) unnamed_addr #1 comdat align 2 !srcloc !72 {
  %6 = alloca ptr addrspace(4), align 8
  %7 = alloca ptr addrspace(4), align 8
  %8 = alloca ptr addrspace(4), align 8
  %9 = alloca ptr addrspace(4), align 8
  %10 = alloca ptr addrspace(4), align 8
  %11 = addrspacecast ptr %6 to ptr addrspace(4)
  %12 = addrspacecast ptr %7 to ptr addrspace(4)
  %13 = addrspacecast ptr %8 to ptr addrspace(4)
  %14 = addrspacecast ptr %9 to ptr addrspace(4)
  %15 = addrspacecast ptr %10 to ptr addrspace(4)
  store ptr addrspace(4) %0, ptr addrspace(4) %11, align 8
  store ptr addrspace(4) %1, ptr addrspace(4) %12, align 8
  store ptr addrspace(4) %2, ptr addrspace(4) %13, align 8
  %16 = addrspacecast ptr %3 to ptr addrspace(4)
  store ptr addrspace(4) %16, ptr addrspace(4) %14, align 8
  store ptr addrspace(4) %4, ptr addrspace(4) %15, align 8
  %17 = load ptr addrspace(4), ptr addrspace(4) %11, align 8
  %18 = getelementptr inbounds nuw %"class.sycl::_V1::group", ptr addrspace(4) %17, i32 0, i32 0
  %19 = load ptr addrspace(4), ptr addrspace(4) %12, align 8
  call void @llvm.memcpy.p4.p4.i64(ptr addrspace(4) align 8 %18, ptr addrspace(4) align 8 %19, i64 8, i1 false)
  %20 = getelementptr inbounds nuw %"class.sycl::_V1::group", ptr addrspace(4) %17, i32 0, i32 1
  %21 = load ptr addrspace(4), ptr addrspace(4) %13, align 8
  call void @llvm.memcpy.p4.p4.i64(ptr addrspace(4) align 8 %20, ptr addrspace(4) align 8 %21, i64 8, i1 false)
  %22 = getelementptr inbounds nuw %"class.sycl::_V1::group", ptr addrspace(4) %17, i32 0, i32 2
  call void @llvm.memcpy.p4.p4.i64(ptr addrspace(4) align 8 %22, ptr addrspace(4) align 8 %16, i64 8, i1 false)
  %23 = getelementptr inbounds nuw %"class.sycl::_V1::group", ptr addrspace(4) %17, i32 0, i32 3
  %24 = load ptr addrspace(4), ptr addrspace(4) %15, align 8
  call void @llvm.memcpy.p4.p4.i64(ptr addrspace(4) align 8 %23, ptr addrspace(4) align 8 %24, i64 8, i1 false)
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN4sycl3_V14itemILi1ELb1EEC2ILb1EEERNSt9enable_ifIXT_EKNS0_5rangeILi1EEEE4typeERKNS0_2idILi1EEESE_(ptr addrspace(4) noundef align 8 dereferenceable_or_null(24) %0, ptr addrspace(4) noundef align 8 dereferenceable(8) %1, ptr addrspace(4) noundef align 8 dereferenceable(8) %2, ptr addrspace(4) noundef align 8 dereferenceable(8) %3) unnamed_addr #1 comdat align 2 !srcloc !73 {
  %5 = alloca ptr addrspace(4), align 8
  %6 = alloca ptr addrspace(4), align 8
  %7 = alloca ptr addrspace(4), align 8
  %8 = alloca ptr addrspace(4), align 8
  %9 = addrspacecast ptr %5 to ptr addrspace(4)
  %10 = addrspacecast ptr %6 to ptr addrspace(4)
  %11 = addrspacecast ptr %7 to ptr addrspace(4)
  %12 = addrspacecast ptr %8 to ptr addrspace(4)
  store ptr addrspace(4) %0, ptr addrspace(4) %9, align 8
  store ptr addrspace(4) %1, ptr addrspace(4) %10, align 8
  store ptr addrspace(4) %2, ptr addrspace(4) %11, align 8
  store ptr addrspace(4) %3, ptr addrspace(4) %12, align 8
  %13 = load ptr addrspace(4), ptr addrspace(4) %9, align 8
  %14 = getelementptr inbounds nuw %"class.sycl::_V1::item", ptr addrspace(4) %13, i32 0, i32 0
  %15 = getelementptr inbounds nuw %"struct.sycl::_V1::detail::ItemBase", ptr addrspace(4) %14, i32 0, i32 0
  %16 = load ptr addrspace(4), ptr addrspace(4) %10, align 8
  call void @llvm.memcpy.p4.p4.i64(ptr addrspace(4) align 8 %15, ptr addrspace(4) align 8 %16, i64 8, i1 false)
  %17 = getelementptr inbounds nuw %"struct.sycl::_V1::detail::ItemBase", ptr addrspace(4) %14, i32 0, i32 1
  %18 = load ptr addrspace(4), ptr addrspace(4) %11, align 8
  call void @llvm.memcpy.p4.p4.i64(ptr addrspace(4) align 8 %17, ptr addrspace(4) align 8 %18, i64 8, i1 false)
  %19 = getelementptr inbounds nuw %"struct.sycl::_V1::detail::ItemBase", ptr addrspace(4) %14, i32 0, i32 2
  %20 = load ptr addrspace(4), ptr addrspace(4) %12, align 8
  call void @llvm.memcpy.p4.p4.i64(ptr addrspace(4) align 8 %19, ptr addrspace(4) align 8 %20, i64 8, i1 false)
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN4sycl3_V14itemILi1ELb0EEC2ILb0EEERNSt9enable_ifIXntT_EKNS0_5rangeILi1EEEE4typeERKNS0_2idILi1EEE(ptr addrspace(4) noundef align 8 dereferenceable_or_null(16) %0, ptr addrspace(4) noundef align 8 dereferenceable(8) %1, ptr addrspace(4) noundef align 8 dereferenceable(8) %2) unnamed_addr #1 comdat align 2 !srcloc !74 {
  %4 = alloca ptr addrspace(4), align 8
  %5 = alloca ptr addrspace(4), align 8
  %6 = alloca ptr addrspace(4), align 8
  %7 = addrspacecast ptr %4 to ptr addrspace(4)
  %8 = addrspacecast ptr %5 to ptr addrspace(4)
  %9 = addrspacecast ptr %6 to ptr addrspace(4)
  store ptr addrspace(4) %0, ptr addrspace(4) %7, align 8
  store ptr addrspace(4) %1, ptr addrspace(4) %8, align 8
  store ptr addrspace(4) %2, ptr addrspace(4) %9, align 8
  %10 = load ptr addrspace(4), ptr addrspace(4) %7, align 8
  %11 = getelementptr inbounds nuw %"class.sycl::_V1::item.0", ptr addrspace(4) %10, i32 0, i32 0
  %12 = getelementptr inbounds nuw %"struct.sycl::_V1::detail::ItemBase.1", ptr addrspace(4) %11, i32 0, i32 0
  %13 = load ptr addrspace(4), ptr addrspace(4) %8, align 8
  call void @llvm.memcpy.p4.p4.i64(ptr addrspace(4) align 8 %12, ptr addrspace(4) align 8 %13, i64 8, i1 false)
  %14 = getelementptr inbounds nuw %"struct.sycl::_V1::detail::ItemBase.1", ptr addrspace(4) %11, i32 0, i32 1
  %15 = load ptr addrspace(4), ptr addrspace(4) %9, align 8
  call void @llvm.memcpy.p4.p4.i64(ptr addrspace(4) align 8 %14, ptr addrspace(4) align 8 %15, i64 8, i1 false)
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN4sycl3_V17nd_itemILi1EEC2ERKNS0_4itemILi1ELb1EEERKNS3_ILi1ELb0EEERKNS0_5groupILi1EEE(ptr addrspace(4) noundef align 1 dereferenceable_or_null(1) %0, ptr addrspace(4) noundef align 8 dereferenceable(24) %1, ptr addrspace(4) noundef align 8 dereferenceable(16) %2, ptr addrspace(4) noundef align 8 dereferenceable(32) %3) unnamed_addr #1 comdat align 2 !srcloc !75 {
  %5 = alloca ptr addrspace(4), align 8
  %6 = alloca ptr addrspace(4), align 8
  %7 = alloca ptr addrspace(4), align 8
  %8 = alloca ptr addrspace(4), align 8
  %9 = addrspacecast ptr %5 to ptr addrspace(4)
  %10 = addrspacecast ptr %6 to ptr addrspace(4)
  %11 = addrspacecast ptr %7 to ptr addrspace(4)
  %12 = addrspacecast ptr %8 to ptr addrspace(4)
  store ptr addrspace(4) %0, ptr addrspace(4) %9, align 8
  store ptr addrspace(4) %1, ptr addrspace(4) %10, align 8
  store ptr addrspace(4) %2, ptr addrspace(4) %11, align 8
  store ptr addrspace(4) %3, ptr addrspace(4) %12, align 8
  %13 = load ptr addrspace(4), ptr addrspace(4) %9, align 8
  ret void
}

declare dso_local spir_func i32 @_Z18__spirv_ocl_printfPU3AS2Kcz(ptr addrspace(2), ...)

attributes #0 = { convergent mustprogress noinline norecurse nounwind optnone "approx-func-fp-math"="true" "frame-pointer"="all" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "sycl-module-id"="/home/mdunlavy/GPU_FI/HeCBench/src/pathfinder-sycl/main.cpp" "sycl-optlevel"="0" "uniform-work-group-size"="true" "unsafe-fp-math"="true" }
attributes #1 = { convergent mustprogress noinline norecurse nounwind optnone "approx-func-fp-math"="true" "frame-pointer"="all" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "sycl-optlevel"="0" "unsafe-fp-math"="true" }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }
attributes #4 = { convergent mustprogress noinline norecurse nounwind optnone "approx-func-fp-math"="true" "frame-pointer"="all" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "sycl-module-id"="/home/mdunlavy/GPU_FI/HeCBench/src/pathfinder-sycl/main.cpp" "sycl-optlevel"="0" "unsafe-fp-math"="true" }
attributes #5 = { convergent nounwind "approx-func-fp-math"="true" "frame-pointer"="all" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="true" }
attributes #6 = { convergent nounwind }

!llvm.module.flags = !{!0, !1, !2}
!opencl.spir.version = !{!3}
!spirv.Source = !{!4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"sycl-device", i32 1}
!2 = !{i32 7, !"frame-pointer", i32 2}
!3 = !{i32 1, i32 2}
!4 = !{i32 4, i32 100000}
!5 = !{!"Intel(R) oneAPI DPC++/C++ Compiler 2025.2.0 (2025.2.0.20250605)"}
!6 = !{i32 4077}
!7 = !{i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1}
!8 = !{i1 false, i1 false, i1 false, i1 false, i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false}
!9 = !{}
!10 = !{i32 2516168}
!11 = !{i32 2515534}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
!14 = !{i32 2815965}
!15 = !{i32 2811691}
!16 = !{i32 2504869}
!17 = !{i32 4520950}
!18 = !{i32 2431371}
!19 = !{i32 4901048}
!20 = !{i32 4445279}
!21 = !{i32 4887106}
!22 = !{i32 2504227}
!23 = !{i32 2819609}
!24 = !{i32 2819447}
!25 = !{i32 2504398}
!26 = !{i32 741091}
!27 = !{i32 4446457}
!28 = !{i32 2504107}
!29 = !{i32 6546929}
!30 = !{i32 2511057}
!31 = !{i32 6547467}
!32 = !{i32 6546761}
!33 = !{i32 -2146927491}
!34 = !{i32 -2146929302}
!35 = !{i32 -2146927816}
!36 = !{i32 424454}
!37 = !{i32 6563996}
!38 = !{i32 -2146915802}
!39 = !{i32 -2146917541}
!40 = !{i32 -2146916095}
!41 = !{i32 4887265}
!42 = !{i32 424776}
!43 = !{i32 6544297}
!44 = !{i32 -2146918254}
!45 = !{i32 -2146924270}
!46 = !{i32 -2146922704}
!47 = !{i32 425086}
!48 = !{i32 2505002}
!49 = !{i32 2817455}
!50 = !{i32 431684}
!51 = !{i32 431750}
!52 = !{i32 -2146932707}
!53 = !{i32 -2146924975}
!54 = !{i32 -2146930017}
!55 = !{i32 -2146913326}
!56 = !{i32 2812148}
!57 = !{i32 2812860}
!58 = !{i32 2813127}
!59 = !{i32 2813290}
!60 = !{i32 -2146934410}
!61 = !{i32 -2146932984}
!62 = !{i32 423512}
!63 = !{i32 -2146926786}
!64 = !{i32 -2146925300}
!65 = !{i32 424132}
!66 = !{i32 -2146932008}
!67 = !{i32 -2146930422}
!68 = !{i32 423160}
!69 = !{i32 -2146915101}
!70 = !{i32 -2146913635}
!71 = !{i32 423816}
!72 = !{i32 6504909}
!73 = !{i32 6514778}
!74 = !{i32 6514998}
!75 = !{i32 6563629}
