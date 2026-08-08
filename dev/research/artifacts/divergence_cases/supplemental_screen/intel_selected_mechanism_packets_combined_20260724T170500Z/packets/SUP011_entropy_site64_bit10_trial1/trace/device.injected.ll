; ModuleID = '/lus/flare/projects/UIC-HPC/mdunlavy/GPU_FI_supplemental_dumps/intel_selected_mechanism_packets_continuation_20260724T162511Z/tmp/entropy_site64_bit10_trial1/device.injected.bc'
source_filename = "main.cpp"
target datalayout = "e-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-n8:16:32:64-G1"
target triple = "spir64-unknown-unknown"

%class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi2EEEE_ = type { i32, i32, ptr addrspace(4), ptr addrspace(4) }
%"class.sycl::_V1::nd_item" = type { i8 }
%"class.sycl::_V1::id" = type { %"class.sycl::_V1::detail::array" }
%"class.sycl::_V1::detail::array" = type { [2 x i64] }
%"class.sycl::_V1::range" = type { %"class.sycl::_V1::detail::array" }
%"class.sycl::_V1::group" = type { %"class.sycl::_V1::range", %"class.sycl::_V1::range", %"class.sycl::_V1::range", %"class.sycl::_V1::id" }
%"class.sycl::_V1::item" = type { %"struct.sycl::_V1::detail::ItemBase" }
%"struct.sycl::_V1::detail::ItemBase" = type { %"class.sycl::_V1::range", %"class.sycl::_V1::id", %"class.sycl::_V1::id" }
%"class.sycl::_V1::item.0" = type { %"struct.sycl::_V1::detail::ItemBase.1" }
%"struct.sycl::_V1::detail::ItemBase.1" = type { %"class.sycl::_V1::range", %"class.sycl::_V1::id" }
%class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE0_clES2_EUlNS0_7nd_itemILi2EEEE_ = type { i32, i32, %"class.sycl::_V1::local_accessor", ptr addrspace(4), ptr addrspace(4), ptr addrspace(4) }
%"class.sycl::_V1::local_accessor" = type { %"class.sycl::_V1::local_accessor_base" }
%"class.sycl::_V1::local_accessor_base" = type { %"class.sycl::_V1::detail::LocalAccessorBaseDevice", ptr addrspace(3) }
%"class.sycl::_V1::detail::LocalAccessorBaseDevice" = type { %"class.sycl::_V1::range", %"class.sycl::_V1::range", %"class.sycl::_V1::id" }
%"class.sycl::_V1::detail::accessor_common<int, 2, sycl::_V1::access::mode::read_write, sycl::_V1::access::target::local, sycl::_V1::access::placeholder::false_t>::AccessorSubscript" = type { %"class.sycl::_V1::id", %"class.sycl::_V1::local_accessor_base" }
%class._ZTSZN4sycl3_V119local_accessor_baseIiLi2ELNS0_6access4modeE1026ELNS2_11placeholderE0EE6__initEPU3AS3iNS0_5rangeILi2EEES9_NS0_2idILi2EEEEUlmE_ = type { ptr addrspace(4), ptr addrspace(4) }
%"struct.std::integer_sequence" = type { i8 }
%"struct.std::integral_constant" = type { i8 }
%"struct.std::integral_constant.2" = type { i8 }
%class._ZTSZNK4sycl3_V119local_accessor_baseIiLi2ELNS0_6access4modeE1026ELNS2_11placeholderE0EE14getLinearIndexILi2EEEmNS0_2idIXT_EEEEUlmE_ = type { ptr addrspace(4), ptr addrspace(4), ptr addrspace(4) }

$_ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_E4base = comdat any

$_ZN4sycl3_V16detail7Builder10getElementILi2EEEKNS0_7nd_itemIXT_EEEPS5_ = comdat any

$_ZN4sycl3_V16detail7declptrINS0_7nd_itemILi2EEEEEPT_v = comdat any

$_ZN4sycl3_V16native6divideEff = comdat any

$_ZN4sycl3_V16native4log2Ef = comdat any

$_ZNK4sycl3_V17nd_itemILi2EE13get_global_idEv = comdat any

$_ZN4sycl3_V16detail5arrayILi2EEixEi = comdat any

$_ZN7__spirv22initGlobalInvocationIdILi2EN4sycl3_V12idILi2EEEEET0_v = comdat any

$_ZN7__spirv29InitSizesSTGlobalInvocationIdILi2EN4sycl3_V12idILi2EEEE8initSizeEv = comdat any

$_ZN4sycl3_V12idILi2EEC2ILi2EEENSt9enable_ifIXeqT_Li2EEmE4typeEm = comdat any

$_Z28__spirv_GlobalInvocationId_yv = comdat any

$_Z28__spirv_GlobalInvocationId_xv = comdat any

$_ZN4sycl3_V16detail5arrayILi2EEC2ILi2EEENSt9enable_ifIXeqT_Li2EEmE4typeEm = comdat any

$_ZN7__spirv14initGlobalSizeILi2EN4sycl3_V15rangeILi2EEEEET0_v = comdat any

$_ZN7__spirv17initWorkgroupSizeILi2EN4sycl3_V15rangeILi2EEEEET0_v = comdat any

$_ZN7__spirv17initNumWorkgroupsILi2EN4sycl3_V15rangeILi2EEEEET0_v = comdat any

$_ZN7__spirv15initWorkgroupIdILi2EN4sycl3_V12idILi2EEEEET0_v = comdat any

$_ZN7__spirv21initLocalInvocationIdILi2EN4sycl3_V12idILi2EEEEET0_v = comdat any

$_ZN7__spirv16initGlobalOffsetILi2EN4sycl3_V12idILi2EEEEET0_v = comdat any

$_ZN4sycl3_V16detail7Builder11createGroupILi2EEENS0_5groupIXT_EEERKNS0_5rangeIXT_EEES9_S9_RKNS0_2idIXT_EEE = comdat any

$_ZN4sycl3_V16detail7Builder10createItemILi2ELb1EEENSt9enable_ifIXT0_ENS0_4itemIXT_EXT0_EEEE4typeERKNS0_5rangeIXT_EEERKNS0_2idIXT_EEESG_ = comdat any

$_ZN4sycl3_V16detail7Builder10createItemILi2ELb0EEENSt9enable_ifIXntT0_ENS0_4itemIXT_EXT0_EEEE4typeERKNS0_5rangeIXT_EEERKNS0_2idIXT_EEE = comdat any

$_ZN4sycl3_V16detail7Builder12createNDItemILi2EEENS0_7nd_itemIXT_EEERKNS0_4itemIXT_ELb1EEERKNS6_IXT_ELb0EEERKNS0_5groupIXT_EEE = comdat any

$_ZN7__spirv21InitSizesSTGlobalSizeILi2EN4sycl3_V15rangeILi2EEEE8initSizeEv = comdat any

$_ZN4sycl3_V15rangeILi2EEC2ILi2EEENSt9enable_ifIXeqT_Li2EEmE4typeEm = comdat any

$_Z20__spirv_GlobalSize_yv = comdat any

$_Z20__spirv_GlobalSize_xv = comdat any

$_ZN7__spirv24InitSizesSTWorkgroupSizeILi2EN4sycl3_V15rangeILi2EEEE8initSizeEv = comdat any

$_Z23__spirv_WorkgroupSize_yv = comdat any

$_Z23__spirv_WorkgroupSize_xv = comdat any

$_ZN7__spirv24InitSizesSTNumWorkgroupsILi2EN4sycl3_V15rangeILi2EEEE8initSizeEv = comdat any

$_Z23__spirv_NumWorkgroups_yv = comdat any

$_Z23__spirv_NumWorkgroups_xv = comdat any

$_ZN7__spirv22InitSizesSTWorkgroupIdILi2EN4sycl3_V12idILi2EEEE8initSizeEv = comdat any

$_Z21__spirv_WorkgroupId_yv = comdat any

$_Z21__spirv_WorkgroupId_xv = comdat any

$_ZN7__spirv28InitSizesSTLocalInvocationIdILi2EN4sycl3_V12idILi2EEEE8initSizeEv = comdat any

$_Z27__spirv_LocalInvocationId_yv = comdat any

$_Z27__spirv_LocalInvocationId_xv = comdat any

$_ZN7__spirv23InitSizesSTGlobalOffsetILi2EN4sycl3_V12idILi2EEEE8initSizeEv = comdat any

$_Z22__spirv_GlobalOffset_yv = comdat any

$_Z22__spirv_GlobalOffset_xv = comdat any

$_ZN4sycl3_V15groupILi2EEC2ERKNS0_5rangeILi2EEES6_S4_RKNS0_2idILi2EEE = comdat any

$_ZN4sycl3_V14itemILi2ELb1EEC2ILb1EEERNSt9enable_ifIXT_EKNS0_5rangeILi2EEEE4typeERKNS0_2idILi2EEESE_ = comdat any

$_ZN4sycl3_V14itemILi2ELb0EEC2ILb0EEERNSt9enable_ifIXntT_EKNS0_5rangeILi2EEEE4typeERKNS0_2idILi2EEE = comdat any

$_ZN4sycl3_V17nd_itemILi2EEC2ERKNS0_4itemILi2ELb1EEERKNS3_ILi2ELb0EEERKNS0_5groupILi2EEE = comdat any

$_ZTSZZ4mainENKUlRN4sycl3_V17handlerEE0_clES2_E3opt = comdat any

$_ZN4sycl3_V114local_accessorIiLi2EEC2Ev = comdat any

$_ZN4sycl3_V114local_accessorIiLi2EE6__initEPU3AS3iNS0_5rangeILi2EEES6_NS0_2idILi2EEE = comdat any

$_ZN4sycl3_V119local_accessor_baseIiLi2ELNS0_6access4modeE1026ELNS2_11placeholderE0EEC2Ev = comdat any

$_ZN4sycl3_V16detail14InitializedValILi2ENS0_5rangeEE3getILi0EEENS3_ILi2EEEv = comdat any

$_ZN4sycl3_V16detail23LocalAccessorBaseDeviceILi2EEC2ENS0_5rangeILi2EEE = comdat any

$_ZN4sycl3_V12idILi2EEC2Ev = comdat any

$_ZN4sycl3_V16detail5arrayILi2EEC2ILi2ELm0EEEv = comdat any

$_ZN4sycl3_V119local_accessor_baseIiLi2ELNS0_6access4modeE1026ELNS2_11placeholderE0EE6__initEPU3AS3iNS0_5rangeILi2EEES9_NS0_2idILi2EEE = comdat any

$_ZN4sycl3_V16detail4loopILm2EZNS0_19local_accessor_baseIiLi2ELNS0_6access4modeE1026ELNS4_11placeholderE0EE6__initEPU3AS3iNS0_5rangeILi2EEESB_NS0_2idILi2EEEEUlmE_EEvOT0_ = comdat any

$_ZN4sycl3_V16detail9loop_implIJLm0ELm1EEZNS0_19local_accessor_baseIiLi2ELNS0_6access4modeE1026ELNS4_11placeholderE0EE6__initEPU3AS3iNS0_5rangeILi2EEESB_NS0_2idILi2EEEEUlmE_EEvSt16integer_sequenceImJXspT_EEEOT0_ = comdat any

$_ZZN4sycl3_V119local_accessor_baseIiLi2ELNS0_6access4modeE1026ELNS2_11placeholderE0EE6__initEPU3AS3iNS0_5rangeILi2EEES9_NS0_2idILi2EEEENKUlmE_clEm = comdat any

$_ZNKSt17integral_constantImLm0EEcvmEv = comdat any

$_ZNKSt17integral_constantImLm1EEcvmEv = comdat any

$_ZN4sycl3_V119local_accessor_baseIiLi2ELNS0_6access4modeE1026ELNS2_11placeholderE0EE7getSizeEv = comdat any

$_ZNK4sycl3_V119local_accessor_baseIiLi2ELNS0_6access4modeE1026ELNS2_11placeholderE0EEixILi2EvEENS0_6detail15accessor_commonIiLi2ELS3_1026ELNS2_6targetE2016ELS4_0ENS0_3ext6oneapi22accessor_property_listIJEEEE17AccessorSubscriptIXmiT_Li1EES5_EEm = comdat any

$_ZNK4sycl3_V16detail15accessor_commonIiLi2ELNS0_6access4modeE1026ELNS3_6targetE2016ELNS3_11placeholderE0ENS0_3ext6oneapi22accessor_property_listIJEEEE17AccessorSubscriptILi1ENS0_19local_accessor_baseIiLi2ELS4_1026ELS6_0EEEEixILi1EvEERim = comdat any

$_ZNK4sycl3_V17nd_itemILi2EE12get_local_idEv = comdat any

$_ZN4sycl3_V16detail15accessor_commonIiLi2ELNS0_6access4modeE1026ELNS3_6targetE2016ELNS3_11placeholderE0ENS0_3ext6oneapi22accessor_property_listIJEEEE17AccessorSubscriptILi1ENS0_19local_accessor_baseIiLi2ELS4_1026ELS6_0EEEEC2ESE_m = comdat any

$_ZNK4sycl3_V119local_accessor_baseIiLi2ELNS0_6access4modeE1026ELNS2_11placeholderE0EEixILi2EvEERiNS0_2idILi2EEE = comdat any

$_ZNK4sycl3_V119local_accessor_baseIiLi2ELNS0_6access4modeE1026ELNS2_11placeholderE0EE14getLinearIndexILi2EEEmNS0_2idIXT_EEE = comdat any

$_ZNK4sycl3_V119local_accessor_baseIiLi2ELNS0_6access4modeE1026ELNS2_11placeholderE0EE15getQualifiedPtrEv = comdat any

$_ZN4sycl3_V16detail4loopILm2EZNKS0_19local_accessor_baseIiLi2ELNS0_6access4modeE1026ELNS4_11placeholderE0EE14getLinearIndexILi2EEEmNS0_2idIXT_EEEEUlmE_EEvOT0_ = comdat any

$_ZN4sycl3_V16detail9loop_implIJLm0ELm1EEZNKS0_19local_accessor_baseIiLi2ELNS0_6access4modeE1026ELNS4_11placeholderE0EE14getLinearIndexILi2EEEmNS0_2idIXT_EEEEUlmE_EEvSt16integer_sequenceImJXspT_EEEOT0_ = comdat any

$_ZZNK4sycl3_V119local_accessor_baseIiLi2ELNS0_6access4modeE1026ELNS2_11placeholderE0EE14getLinearIndexILi2EEEmNS0_2idIXT_EEEENKUlmE_clEm = comdat any

$_ZNK4sycl3_V119local_accessor_baseIiLi2ELNS0_6access4modeE1026ELNS2_11placeholderE0EE7getSizeEv = comdat any

$_ZNK4sycl3_V16detail5arrayILi2EEixEi = comdat any

@__spirv_BuiltInGlobalInvocationId = external dso_local addrspace(1) constant <3 x i64>, align 32
@__spirv_BuiltInGlobalSize = external dso_local addrspace(1) constant <3 x i64>, align 32
@__spirv_BuiltInWorkgroupSize = external dso_local addrspace(1) constant <3 x i64>, align 32
@__spirv_BuiltInNumWorkgroups = external dso_local addrspace(1) constant <3 x i64>, align 32
@__spirv_BuiltInWorkgroupId = external dso_local addrspace(1) constant <3 x i64>, align 32
@__spirv_BuiltInLocalInvocationId = external dso_local addrspace(1) constant <3 x i64>, align 32
@__spirv_BuiltInGlobalOffset = external dso_local addrspace(1) constant <3 x i64>, align 32

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define weak_odr dso_local spir_kernel void @_ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_E4base(i32 noundef %0, i32 noundef %1, ptr addrspace(1) noundef align 1 %2, ptr addrspace(1) noundef align 4 %3) #0 comdat !srcloc !6 !kernel_arg_buffer_location !7 !sycl_fixed_targets !8 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca ptr addrspace(1), align 8
  %8 = alloca ptr addrspace(1), align 8
  %9 = alloca %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi2EEEE_, align 8
  %10 = alloca %"class.sycl::_V1::nd_item", align 1
  %11 = addrspacecast ptr %5 to ptr addrspace(4)
  %12 = addrspacecast ptr %6 to ptr addrspace(4)
  %13 = addrspacecast ptr %7 to ptr addrspace(4)
  %14 = addrspacecast ptr %8 to ptr addrspace(4)
  %15 = addrspacecast ptr %9 to ptr addrspace(4)
  %16 = addrspacecast ptr %10 to ptr addrspace(4)
  store i32 %0, ptr addrspace(4) %11, align 4
  store i32 %1, ptr addrspace(4) %12, align 4
  store ptr addrspace(1) %2, ptr addrspace(4) %13, align 8
  store ptr addrspace(1) %3, ptr addrspace(4) %14, align 8
  %17 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi2EEEE_, ptr addrspace(4) %15, i32 0, i32 0
  %18 = load i32, ptr addrspace(4) %11, align 4
  store i32 %18, ptr addrspace(4) %17, align 8
  %19 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi2EEEE_, ptr addrspace(4) %15, i32 0, i32 1
  %20 = load i32, ptr addrspace(4) %12, align 4
  store i32 %20, ptr addrspace(4) %19, align 4
  %21 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi2EEEE_, ptr addrspace(4) %15, i32 0, i32 2
  %22 = load ptr addrspace(1), ptr addrspace(4) %13, align 8
  %23 = addrspacecast ptr addrspace(1) %22 to ptr addrspace(4)
  store ptr addrspace(4) %23, ptr addrspace(4) %21, align 8
  %24 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi2EEEE_, ptr addrspace(4) %15, i32 0, i32 3
  %25 = load ptr addrspace(1), ptr addrspace(4) %14, align 8
  %26 = addrspacecast ptr addrspace(1) %25 to ptr addrspace(4)
  store ptr addrspace(4) %26, ptr addrspace(4) %24, align 8
  %27 = call spir_func noundef ptr addrspace(4) @_ZN4sycl3_V16detail7declptrINS0_7nd_itemILi2EEEEEPT_v() #7
  call spir_func void @_ZN4sycl3_V16detail7Builder10getElementILi2EEEKNS0_7nd_itemIXT_EEEPS5_(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::nd_item") align 1 %16, ptr addrspace(4) noundef %27) #7
  %28 = addrspacecast ptr addrspace(4) %16 to ptr
  call spir_func void @_ZZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_ENKUlNS0_7nd_itemILi2EEEE_clES5_(ptr addrspace(4) noundef align 8 dereferenceable_or_null(24) %15, ptr noundef byval(%"class.sycl::_V1::nd_item") align 1 %28) #7
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define internal spir_func void @_ZZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_ENKUlNS0_7nd_itemILi2EEEE_clES5_(ptr addrspace(4) noundef align 8 dereferenceable_or_null(24) %0, ptr noundef byval(%"class.sycl::_V1::nd_item") align 1 %1) #1 align 2 !srcloc !6 {
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
  %17 = alloca [16 x i8], align 1
  %18 = alloca i32, align 4
  %19 = alloca i8, align 1
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  %23 = alloca i32, align 4
  %24 = alloca float, align 4
  %25 = alloca i32, align 4
  %26 = alloca float, align 4
  %27 = addrspacecast ptr %13 to ptr addrspace(4)
  %28 = addrspacecast ptr %14 to ptr addrspace(4)
  %29 = addrspacecast ptr %15 to ptr addrspace(4)
  %30 = addrspacecast ptr %16 to ptr addrspace(4)
  %31 = addrspacecast ptr %17 to ptr addrspace(4)
  %32 = addrspacecast ptr %18 to ptr addrspace(4)
  %33 = addrspacecast ptr %19 to ptr addrspace(4)
  %34 = addrspacecast ptr %20 to ptr addrspace(4)
  %35 = addrspacecast ptr %21 to ptr addrspace(4)
  %36 = addrspacecast ptr %22 to ptr addrspace(4)
  %37 = addrspacecast ptr %23 to ptr addrspace(4)
  %38 = addrspacecast ptr %24 to ptr addrspace(4)
  %39 = addrspacecast ptr %25 to ptr addrspace(4)
  %40 = addrspacecast ptr %26 to ptr addrspace(4)
  store ptr addrspace(4) %0, ptr addrspace(4) %27, align 8
  %41 = addrspacecast ptr %1 to ptr addrspace(4)
  store ptr addrspace(4) %41, ptr addrspace(4) %28, align 8
  %42 = load ptr addrspace(4), ptr addrspace(4) %27, align 8
  %43 = addrspacecast ptr %3 to ptr addrspace(4)
  %44 = addrspacecast ptr %4 to ptr addrspace(4)
  %45 = addrspacecast ptr %5 to ptr addrspace(4)
  %46 = addrspacecast ptr %6 to ptr addrspace(4)
  %47 = addrspacecast ptr %7 to ptr addrspace(4)
  store ptr addrspace(4) %41, ptr addrspace(4) %44, align 8
  store i32 1, ptr addrspace(4) %45, align 4
  %48 = load ptr addrspace(4), ptr addrspace(4) %44, align 8
  call spir_func void @_ZNK4sycl3_V17nd_itemILi2EE13get_global_idEv(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::id") align 8 %47, ptr addrspace(4) noundef align 1 dereferenceable_or_null(1) %48) #7
  %49 = load i32, ptr addrspace(4) %45, align 4
  %50 = call spir_func noundef align 8 dereferenceable(8) ptr addrspace(4) @_ZN4sycl3_V16detail5arrayILi2EEixEi(ptr addrspace(4) noundef align 8 dereferenceable_or_null(16) %47, i32 noundef %49) #7
  %51 = load i64, ptr addrspace(4) %50, align 8
  store i64 %51, ptr addrspace(4) %46, align 8
  %52 = load i64, ptr addrspace(4) %46, align 8
  %53 = icmp ule i64 %52, 2147483647
  call void @llvm.assume(i1 %53)
  %54 = load i64, ptr addrspace(4) %46, align 8
  %55 = trunc i64 %54 to i32
  store i32 %55, ptr addrspace(4) %29, align 4
  %56 = addrspacecast ptr %8 to ptr addrspace(4)
  %57 = addrspacecast ptr %9 to ptr addrspace(4)
  %58 = addrspacecast ptr %10 to ptr addrspace(4)
  %59 = addrspacecast ptr %11 to ptr addrspace(4)
  %60 = addrspacecast ptr %12 to ptr addrspace(4)
  store ptr addrspace(4) %41, ptr addrspace(4) %57, align 8
  store i32 0, ptr addrspace(4) %58, align 4
  %61 = load ptr addrspace(4), ptr addrspace(4) %57, align 8
  call spir_func void @_ZNK4sycl3_V17nd_itemILi2EE13get_global_idEv(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::id") align 8 %60, ptr addrspace(4) noundef align 1 dereferenceable_or_null(1) %61) #7
  %62 = load i32, ptr addrspace(4) %58, align 4
  %63 = call spir_func noundef align 8 dereferenceable(8) ptr addrspace(4) @_ZN4sycl3_V16detail5arrayILi2EEixEi(ptr addrspace(4) noundef align 8 dereferenceable_or_null(16) %60, i32 noundef %62) #7
  %64 = load i64, ptr addrspace(4) %63, align 8
  store i64 %64, ptr addrspace(4) %59, align 8
  %65 = load i64, ptr addrspace(4) %59, align 8
  %66 = icmp ule i64 %65, 2147483647
  call void @llvm.assume(i1 %66)
  %67 = load i64, ptr addrspace(4) %59, align 8
  %68 = trunc i64 %67 to i32
  store i32 %68, ptr addrspace(4) %30, align 4
  %69 = load i32, ptr addrspace(4) %30, align 4
  %70 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi2EEEE_, ptr addrspace(4) %42, i32 0, i32 0
  %71 = load i32, ptr addrspace(4) %70, align 8
  %72 = icmp sge i32 %69, %71
  br i1 %72, label %78, label %73

73:                                               ; preds = %2
  %74 = load i32, ptr addrspace(4) %29, align 4
  %75 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi2EEEE_, ptr addrspace(4) %42, i32 0, i32 1
  %76 = load i32, ptr addrspace(4) %75, align 4
  %77 = icmp sge i32 %74, %76
  br i1 %77, label %78, label %79

78:                                               ; preds = %73, %2
  br label %186

79:                                               ; preds = %73
  store i32 0, ptr addrspace(4) %32, align 4
  br label %80

80:                                               ; preds = %87, %79
  %81 = load i32, ptr addrspace(4) %32, align 4
  %82 = icmp slt i32 %81, 16
  br i1 %82, label %83, label %90

83:                                               ; preds = %80
  %84 = load i32, ptr addrspace(4) %32, align 4
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds [16 x i8], ptr addrspace(4) %31, i64 0, i64 %85
  store i8 0, ptr addrspace(4) %86, align 1
  br label %87

87:                                               ; preds = %83
  %88 = load i32, ptr addrspace(4) %32, align 4
  %89 = add nsw i32 %88, 1
  store i32 %89, ptr addrspace(4) %32, align 4
  br label %80, !llvm.loop !9

90:                                               ; preds = %80
  store i8 0, ptr addrspace(4) %33, align 1
  store i32 -2, ptr addrspace(4) %34, align 4
  br label %91

91:                                               ; preds = %143, %90
  %92 = load i32, ptr addrspace(4) %34, align 4
  %93 = icmp sle i32 %92, 2
  br i1 %93, label %94, label %146

94:                                               ; preds = %91
  store i32 -2, ptr addrspace(4) %35, align 4
  br label %95

95:                                               ; preds = %139, %94
  %96 = load i32, ptr addrspace(4) %35, align 4
  %97 = icmp sle i32 %96, 2
  br i1 %97, label %98, label %142

98:                                               ; preds = %95
  %99 = load i32, ptr addrspace(4) %29, align 4
  %100 = load i32, ptr addrspace(4) %35, align 4
  %101 = add nsw i32 %99, %100
  store i32 %101, ptr addrspace(4) %36, align 4
  %102 = load i32, ptr addrspace(4) %30, align 4
  %103 = load i32, ptr addrspace(4) %34, align 4
  %104 = add nsw i32 %102, %103
  store i32 %104, ptr addrspace(4) %37, align 4
  %105 = load i32, ptr addrspace(4) %36, align 4
  %106 = icmp sge i32 %105, 0
  br i1 %106, label %107, label %138

107:                                              ; preds = %98
  %108 = load i32, ptr addrspace(4) %37, align 4
  %109 = icmp sge i32 %108, 0
  br i1 %109, label %110, label %138

110:                                              ; preds = %107
  %111 = load i32, ptr addrspace(4) %37, align 4
  %112 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi2EEEE_, ptr addrspace(4) %42, i32 0, i32 0
  %113 = load i32, ptr addrspace(4) %112, align 8
  %114 = icmp slt i32 %111, %113
  br i1 %114, label %115, label %138

115:                                              ; preds = %110
  %116 = load i32, ptr addrspace(4) %36, align 4
  %117 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi2EEEE_, ptr addrspace(4) %42, i32 0, i32 1
  %118 = load i32, ptr addrspace(4) %117, align 4
  %119 = icmp slt i32 %116, %118
  br i1 %119, label %120, label %138

120:                                              ; preds = %115
  %121 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi2EEEE_, ptr addrspace(4) %42, i32 0, i32 2
  %122 = load ptr addrspace(4), ptr addrspace(4) %121, align 8
  %123 = load i32, ptr addrspace(4) %37, align 4
  %124 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi2EEEE_, ptr addrspace(4) %42, i32 0, i32 1
  %125 = load i32, ptr addrspace(4) %124, align 4
  %126 = mul nsw i32 %123, %125
  %127 = load i32, ptr addrspace(4) %36, align 4
  %128 = add nsw i32 %126, %127
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds i8, ptr addrspace(4) %122, i64 %129
  %131 = load i8, ptr addrspace(4) %130, align 1
  %132 = sext i8 %131 to i64
  %133 = getelementptr inbounds [16 x i8], ptr addrspace(4) %31, i64 0, i64 %132
  %134 = load i8, ptr addrspace(4) %133, align 1
  %135 = add i8 %134, 1
  store i8 %135, ptr addrspace(4) %133, align 1
  %136 = load i8, ptr addrspace(4) %33, align 1
  %137 = add i8 %136, 1
  store i8 %137, ptr addrspace(4) %33, align 1
  br label %138

138:                                              ; preds = %120, %115, %110, %107, %98
  br label %139

139:                                              ; preds = %138
  %140 = load i32, ptr addrspace(4) %35, align 4
  %141 = add nsw i32 %140, 1
  store i32 %141, ptr addrspace(4) %35, align 4
  br label %95, !llvm.loop !11

142:                                              ; preds = %95
  br label %143

143:                                              ; preds = %142
  %144 = load i32, ptr addrspace(4) %34, align 4
  %145 = add nsw i32 %144, 1
  store i32 %145, ptr addrspace(4) %34, align 4
  br label %91, !llvm.loop !12

146:                                              ; preds = %91
  store float 0.000000e+00, ptr addrspace(4) %38, align 4
  %147 = load i8, ptr addrspace(4) %33, align 1
  %148 = sext i8 %147 to i32
  %fi_flip = xor i32 %148, 1024
  %149 = icmp slt i32 %fi_flip, 1
  br i1 %149, label %150, label %151

150:                                              ; preds = %146
  store i8 1, ptr addrspace(4) %33, align 1
  br label %174

151:                                              ; preds = %146
  store i32 0, ptr addrspace(4) %39, align 4
  br label %152

152:                                              ; preds = %170, %151
  %153 = load i32, ptr addrspace(4) %39, align 4
  %154 = icmp slt i32 %153, 16
  br i1 %154, label %155, label %173

155:                                              ; preds = %152
  %156 = load i32, ptr addrspace(4) %39, align 4
  %157 = sext i32 %156 to i64
  %158 = getelementptr inbounds [16 x i8], ptr addrspace(4) %31, i64 0, i64 %157
  %159 = load i8, ptr addrspace(4) %158, align 1
  %160 = sitofp i8 %159 to float
  %161 = load i8, ptr addrspace(4) %33, align 1
  %162 = sitofp i8 %161 to float
  %163 = call reassoc nsz arcp contract afn spir_func noundef float @_ZN4sycl3_V16native6divideEff(float noundef %160, float noundef %162) #7
  store float %163, ptr addrspace(4) %40, align 4
  %164 = load float, ptr addrspace(4) %40, align 4
  %165 = load float, ptr addrspace(4) %40, align 4
  %166 = call reassoc nsz arcp contract afn spir_func noundef float @_ZN4sycl3_V16native4log2Ef(float noundef %165) #7
  %167 = fmul reassoc nsz arcp contract afn float %164, %166
  %168 = load float, ptr addrspace(4) %38, align 4
  %169 = fsub reassoc nsz arcp contract afn float %168, %167
  store float %169, ptr addrspace(4) %38, align 4
  br label %170

170:                                              ; preds = %155
  %171 = load i32, ptr addrspace(4) %39, align 4
  %172 = add nsw i32 %171, 1
  store i32 %172, ptr addrspace(4) %39, align 4
  br label %152, !llvm.loop !13

173:                                              ; preds = %152
  br label %174

174:                                              ; preds = %173, %150
  %175 = load float, ptr addrspace(4) %38, align 4
  %176 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi2EEEE_, ptr addrspace(4) %42, i32 0, i32 3
  %177 = load ptr addrspace(4), ptr addrspace(4) %176, align 8
  %178 = load i32, ptr addrspace(4) %30, align 4
  %179 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi2EEEE_, ptr addrspace(4) %42, i32 0, i32 1
  %180 = load i32, ptr addrspace(4) %179, align 4
  %181 = mul nsw i32 %178, %180
  %182 = load i32, ptr addrspace(4) %29, align 4
  %183 = add nsw i32 %181, %182
  %184 = sext i32 %183 to i64
  %185 = getelementptr inbounds float, ptr addrspace(4) %177, i64 %184
  store float %175, ptr addrspace(4) %185, align 4
  br label %186

186:                                              ; preds = %174, %78
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN4sycl3_V16detail7Builder10getElementILi2EEEKNS0_7nd_itemIXT_EEEPS5_(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::nd_item") align 1 %0, ptr addrspace(4) noundef %1) #1 comdat align 2 !srcloc !14 {
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
  call spir_func void @_ZN7__spirv14initGlobalSizeILi2EN4sycl3_V15rangeILi2EEEEET0_v(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::range") align 8 %15) #7
  call spir_func void @_ZN7__spirv17initWorkgroupSizeILi2EN4sycl3_V15rangeILi2EEEEET0_v(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::range") align 8 %16) #7
  call spir_func void @_ZN7__spirv17initNumWorkgroupsILi2EN4sycl3_V15rangeILi2EEEEET0_v(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::range") align 8 %17) #7
  call spir_func void @_ZN7__spirv15initWorkgroupIdILi2EN4sycl3_V12idILi2EEEEET0_v(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::id") align 8 %18) #7
  call spir_func void @_ZN7__spirv22initGlobalInvocationIdILi2EN4sycl3_V12idILi2EEEEET0_v(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::id") align 8 %19) #7
  call spir_func void @_ZN7__spirv21initLocalInvocationIdILi2EN4sycl3_V12idILi2EEEEET0_v(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::id") align 8 %20) #7
  call spir_func void @_ZN7__spirv16initGlobalOffsetILi2EN4sycl3_V12idILi2EEEEET0_v(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::id") align 8 %21) #7
  call spir_func void @_ZN4sycl3_V16detail7Builder11createGroupILi2EEENS0_5groupIXT_EEERKNS0_5rangeIXT_EEES9_S9_RKNS0_2idIXT_EEE(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::group") align 8 %22, ptr addrspace(4) noundef align 8 dereferenceable(16) %15, ptr addrspace(4) noundef align 8 dereferenceable(16) %16, ptr addrspace(4) noundef align 8 dereferenceable(16) %17, ptr addrspace(4) noundef align 8 dereferenceable(16) %18) #7
  call spir_func void @_ZN4sycl3_V16detail7Builder10createItemILi2ELb1EEENSt9enable_ifIXT0_ENS0_4itemIXT_EXT0_EEEE4typeERKNS0_5rangeIXT_EEERKNS0_2idIXT_EEESG_(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::item") align 8 %23, ptr addrspace(4) noundef align 8 dereferenceable(16) %15, ptr addrspace(4) noundef align 8 dereferenceable(16) %19, ptr addrspace(4) noundef align 8 dereferenceable(16) %21) #7
  call spir_func void @_ZN4sycl3_V16detail7Builder10createItemILi2ELb0EEENSt9enable_ifIXntT0_ENS0_4itemIXT_EXT0_EEEE4typeERKNS0_5rangeIXT_EEERKNS0_2idIXT_EEE(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::item.0") align 8 %24, ptr addrspace(4) noundef align 8 dereferenceable(16) %16, ptr addrspace(4) noundef align 8 dereferenceable(16) %20) #7
  call spir_func void @_ZN4sycl3_V16detail7Builder12createNDItemILi2EEENS0_7nd_itemIXT_EEERKNS0_4itemIXT_ELb1EEERKNS6_IXT_ELb0EEERKNS0_5groupIXT_EEE(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::nd_item") align 1 %0, ptr addrspace(4) noundef align 8 dereferenceable(48) %23, ptr addrspace(4) noundef align 8 dereferenceable(32) %24, ptr addrspace(4) noundef align 8 dereferenceable(64) %22) #7
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef ptr addrspace(4) @_ZN4sycl3_V16detail7declptrINS0_7nd_itemILi2EEEEEPT_v() #1 comdat !srcloc !15 {
  %1 = alloca ptr addrspace(4), align 8
  %2 = addrspacecast ptr %1 to ptr addrspace(4)
  ret ptr addrspace(4) null
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef float @_ZN4sycl3_V16native6divideEff(float noundef %0, float noundef %1) #1 comdat !srcloc !16 {
  %3 = alloca float, align 4
  %4 = alloca float, align 4
  %5 = alloca float, align 4
  %6 = addrspacecast ptr %3 to ptr addrspace(4)
  %7 = addrspacecast ptr %4 to ptr addrspace(4)
  %8 = addrspacecast ptr %5 to ptr addrspace(4)
  store float %0, ptr addrspace(4) %7, align 4
  store float %1, ptr addrspace(4) %8, align 4
  %9 = load float, ptr addrspace(4) %7, align 4
  %10 = load float, ptr addrspace(4) %8, align 4
  %11 = call reassoc nsz arcp contract afn spir_func noundef float @_Z25__spirv_ocl_native_divideff(float noundef %9, float noundef %10) #8
  ret float %11
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef float @_ZN4sycl3_V16native4log2Ef(float noundef %0) #1 comdat !srcloc !17 {
  %2 = alloca float, align 4
  %3 = alloca float, align 4
  %4 = addrspacecast ptr %2 to ptr addrspace(4)
  %5 = addrspacecast ptr %3 to ptr addrspace(4)
  store float %0, ptr addrspace(4) %5, align 4
  %6 = load float, ptr addrspace(4) %5, align 4
  %7 = call reassoc nsz arcp contract afn spir_func noundef float @_Z23__spirv_ocl_native_log2f(float noundef %6) #8
  ret float %7
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZNK4sycl3_V17nd_itemILi2EE13get_global_idEv(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::id") align 8 %0, ptr addrspace(4) noundef align 1 dereferenceable_or_null(1) %1) #1 comdat align 2 !srcloc !18 {
  %3 = alloca ptr addrspace(4), align 8
  %4 = addrspacecast ptr %3 to ptr addrspace(4)
  store ptr addrspace(4) %1, ptr addrspace(4) %4, align 8
  %5 = load ptr addrspace(4), ptr addrspace(4) %4, align 8
  call spir_func void @_ZN7__spirv22initGlobalInvocationIdILi2EN4sycl3_V12idILi2EEEEET0_v(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::id") align 8 %0) #7
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef align 8 dereferenceable(8) ptr addrspace(4) @_ZN4sycl3_V16detail5arrayILi2EEixEi(ptr addrspace(4) noundef align 8 dereferenceable_or_null(16) %0, i32 noundef %1) #1 comdat align 2 !srcloc !19 {
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
  %19 = getelementptr inbounds [2 x i64], ptr addrspace(4) %16, i64 0, i64 %18
  ret ptr addrspace(4) %19
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #2

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN7__spirv22initGlobalInvocationIdILi2EN4sycl3_V12idILi2EEEEET0_v(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::id") align 8 %0) #1 comdat !srcloc !20 {
  call spir_func void @_ZN7__spirv29InitSizesSTGlobalInvocationIdILi2EN4sycl3_V12idILi2EEEE8initSizeEv(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::id") align 8 %0) #7
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN7__spirv29InitSizesSTGlobalInvocationIdILi2EN4sycl3_V12idILi2EEEE8initSizeEv(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::id") align 8 %0) #1 comdat align 2 !srcloc !21 {
  %2 = call spir_func noundef i64 @_ZN7__spirv21getGlobalInvocationIdILi1EEEmv() #7
  %3 = call spir_func noundef i64 @_ZN7__spirv21getGlobalInvocationIdILi0EEEmv() #7
  call spir_func void @_ZN4sycl3_V12idILi2EEC2ILi2EEENSt9enable_ifIXeqT_Li2EEmE4typeEm(ptr addrspace(4) noundef align 8 dereferenceable_or_null(16) %0, i64 noundef %2, i64 noundef %3) #7
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef i64 @_ZN7__spirv21getGlobalInvocationIdILi1EEEmv() #1 !srcloc !22 {
  %1 = alloca i64, align 8
  %2 = addrspacecast ptr %1 to ptr addrspace(4)
  %3 = call spir_func noundef i64 @_Z28__spirv_GlobalInvocationId_yv() #7
  ret i64 %3
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef i64 @_ZN7__spirv21getGlobalInvocationIdILi0EEEmv() #1 !srcloc !23 {
  %1 = alloca i64, align 8
  %2 = addrspacecast ptr %1 to ptr addrspace(4)
  %3 = call spir_func noundef i64 @_Z28__spirv_GlobalInvocationId_xv() #7
  ret i64 %3
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN4sycl3_V12idILi2EEC2ILi2EEENSt9enable_ifIXeqT_Li2EEmE4typeEm(ptr addrspace(4) noundef align 8 dereferenceable_or_null(16) %0, i64 noundef %1, i64 noundef %2) unnamed_addr #1 comdat align 2 !srcloc !24 {
  %4 = alloca ptr addrspace(4), align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = addrspacecast ptr %4 to ptr addrspace(4)
  %8 = addrspacecast ptr %5 to ptr addrspace(4)
  %9 = addrspacecast ptr %6 to ptr addrspace(4)
  store ptr addrspace(4) %0, ptr addrspace(4) %7, align 8
  store i64 %1, ptr addrspace(4) %8, align 8
  store i64 %2, ptr addrspace(4) %9, align 8
  %10 = load ptr addrspace(4), ptr addrspace(4) %7, align 8
  %11 = load i64, ptr addrspace(4) %8, align 8
  %12 = load i64, ptr addrspace(4) %9, align 8
  call spir_func void @_ZN4sycl3_V16detail5arrayILi2EEC2ILi2EEENSt9enable_ifIXeqT_Li2EEmE4typeEm(ptr addrspace(4) noundef align 8 dereferenceable_or_null(16) %10, i64 noundef %11, i64 noundef %12) #7
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef i64 @_Z28__spirv_GlobalInvocationId_yv() #3 comdat !srcloc !25 {
  %1 = alloca i64, align 8
  %2 = addrspacecast ptr %1 to ptr addrspace(4)
  %3 = load <3 x i64>, ptr addrspace(4) addrspacecast (ptr addrspace(1) @__spirv_BuiltInGlobalInvocationId to ptr addrspace(4)), align 32
  %4 = extractelement <3 x i64> %3, i64 1
  ret i64 %4
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef i64 @_Z28__spirv_GlobalInvocationId_xv() #3 comdat !srcloc !26 {
  %1 = alloca i64, align 8
  %2 = addrspacecast ptr %1 to ptr addrspace(4)
  %3 = load <3 x i64>, ptr addrspace(4) addrspacecast (ptr addrspace(1) @__spirv_BuiltInGlobalInvocationId to ptr addrspace(4)), align 32
  %4 = extractelement <3 x i64> %3, i64 0
  ret i64 %4
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN4sycl3_V16detail5arrayILi2EEC2ILi2EEENSt9enable_ifIXeqT_Li2EEmE4typeEm(ptr addrspace(4) noundef align 8 dereferenceable_or_null(16) %0, i64 noundef %1, i64 noundef %2) unnamed_addr #1 comdat align 2 !srcloc !27 {
  %4 = alloca ptr addrspace(4), align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = addrspacecast ptr %4 to ptr addrspace(4)
  %8 = addrspacecast ptr %5 to ptr addrspace(4)
  %9 = addrspacecast ptr %6 to ptr addrspace(4)
  store ptr addrspace(4) %0, ptr addrspace(4) %7, align 8
  store i64 %1, ptr addrspace(4) %8, align 8
  store i64 %2, ptr addrspace(4) %9, align 8
  %10 = load ptr addrspace(4), ptr addrspace(4) %7, align 8
  %11 = getelementptr inbounds nuw %"class.sycl::_V1::detail::array", ptr addrspace(4) %10, i32 0, i32 0
  %12 = load i64, ptr addrspace(4) %8, align 8
  store i64 %12, ptr addrspace(4) %11, align 8
  %13 = getelementptr inbounds i64, ptr addrspace(4) %11, i64 1
  %14 = load i64, ptr addrspace(4) %9, align 8
  store i64 %14, ptr addrspace(4) %13, align 8
  ret void
}

; Function Attrs: convergent nounwind willreturn memory(none)
declare dso_local spir_func noundef float @_Z25__spirv_ocl_native_divideff(float noundef, float noundef) #4

; Function Attrs: convergent nounwind willreturn memory(none)
declare dso_local spir_func noundef float @_Z23__spirv_ocl_native_log2f(float noundef) #4

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN7__spirv14initGlobalSizeILi2EN4sycl3_V15rangeILi2EEEEET0_v(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::range") align 8 %0) #1 comdat !srcloc !28 {
  call spir_func void @_ZN7__spirv21InitSizesSTGlobalSizeILi2EN4sycl3_V15rangeILi2EEEE8initSizeEv(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::range") align 8 %0) #7
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN7__spirv17initWorkgroupSizeILi2EN4sycl3_V15rangeILi2EEEEET0_v(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::range") align 8 %0) #1 comdat !srcloc !29 {
  call spir_func void @_ZN7__spirv24InitSizesSTWorkgroupSizeILi2EN4sycl3_V15rangeILi2EEEE8initSizeEv(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::range") align 8 %0) #7
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN7__spirv17initNumWorkgroupsILi2EN4sycl3_V15rangeILi2EEEEET0_v(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::range") align 8 %0) #1 comdat !srcloc !30 {
  call spir_func void @_ZN7__spirv24InitSizesSTNumWorkgroupsILi2EN4sycl3_V15rangeILi2EEEE8initSizeEv(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::range") align 8 %0) #7
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN7__spirv15initWorkgroupIdILi2EN4sycl3_V12idILi2EEEEET0_v(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::id") align 8 %0) #1 comdat !srcloc !31 {
  call spir_func void @_ZN7__spirv22InitSizesSTWorkgroupIdILi2EN4sycl3_V12idILi2EEEE8initSizeEv(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::id") align 8 %0) #7
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN7__spirv21initLocalInvocationIdILi2EN4sycl3_V12idILi2EEEEET0_v(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::id") align 8 %0) #1 comdat !srcloc !32 {
  call spir_func void @_ZN7__spirv28InitSizesSTLocalInvocationIdILi2EN4sycl3_V12idILi2EEEE8initSizeEv(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::id") align 8 %0) #7
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN7__spirv16initGlobalOffsetILi2EN4sycl3_V12idILi2EEEEET0_v(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::id") align 8 %0) #1 comdat !srcloc !33 {
  call spir_func void @_ZN7__spirv23InitSizesSTGlobalOffsetILi2EN4sycl3_V12idILi2EEEE8initSizeEv(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::id") align 8 %0) #7
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN4sycl3_V16detail7Builder11createGroupILi2EEENS0_5groupIXT_EEERKNS0_5rangeIXT_EEES9_S9_RKNS0_2idIXT_EEE(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::group") align 8 %0, ptr addrspace(4) noundef align 8 dereferenceable(16) %1, ptr addrspace(4) noundef align 8 dereferenceable(16) %2, ptr addrspace(4) noundef align 8 dereferenceable(16) %3, ptr addrspace(4) noundef align 8 dereferenceable(16) %4) #1 comdat align 2 !srcloc !34 {
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
  call void @llvm.memcpy.p4.p4.i64(ptr addrspace(4) align 8 %15, ptr addrspace(4) align 8 %18, i64 16, i1 false)
  %19 = load ptr addrspace(4), ptr addrspace(4) %14, align 8
  %20 = addrspacecast ptr addrspace(4) %15 to ptr
  call spir_func void @_ZN4sycl3_V15groupILi2EEC2ERKNS0_5rangeILi2EEES6_S4_RKNS0_2idILi2EEE(ptr addrspace(4) noundef align 8 dereferenceable_or_null(64) %0, ptr addrspace(4) noundef align 8 dereferenceable(16) %16, ptr addrspace(4) noundef align 8 dereferenceable(16) %17, ptr noundef byval(%"class.sycl::_V1::range") align 8 %20, ptr addrspace(4) noundef align 8 dereferenceable(16) %19) #7
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN4sycl3_V16detail7Builder10createItemILi2ELb1EEENSt9enable_ifIXT0_ENS0_4itemIXT_EXT0_EEEE4typeERKNS0_5rangeIXT_EEERKNS0_2idIXT_EEESG_(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::item") align 8 %0, ptr addrspace(4) noundef align 8 dereferenceable(16) %1, ptr addrspace(4) noundef align 8 dereferenceable(16) %2, ptr addrspace(4) noundef align 8 dereferenceable(16) %3) #1 comdat align 2 !srcloc !35 {
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
  call spir_func void @_ZN4sycl3_V14itemILi2ELb1EEC2ILb1EEERNSt9enable_ifIXT_EKNS0_5rangeILi2EEEE4typeERKNS0_2idILi2EEESE_(ptr addrspace(4) noundef align 8 dereferenceable_or_null(48) %0, ptr addrspace(4) noundef align 8 dereferenceable(16) %11, ptr addrspace(4) noundef align 8 dereferenceable(16) %12, ptr addrspace(4) noundef align 8 dereferenceable(16) %13) #7
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN4sycl3_V16detail7Builder10createItemILi2ELb0EEENSt9enable_ifIXntT0_ENS0_4itemIXT_EXT0_EEEE4typeERKNS0_5rangeIXT_EEERKNS0_2idIXT_EEE(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::item.0") align 8 %0, ptr addrspace(4) noundef align 8 dereferenceable(16) %1, ptr addrspace(4) noundef align 8 dereferenceable(16) %2) #1 comdat align 2 !srcloc !36 {
  %4 = alloca ptr addrspace(4), align 8
  %5 = alloca ptr addrspace(4), align 8
  %6 = addrspacecast ptr %4 to ptr addrspace(4)
  %7 = addrspacecast ptr %5 to ptr addrspace(4)
  store ptr addrspace(4) %1, ptr addrspace(4) %6, align 8
  store ptr addrspace(4) %2, ptr addrspace(4) %7, align 8
  %8 = load ptr addrspace(4), ptr addrspace(4) %6, align 8
  %9 = load ptr addrspace(4), ptr addrspace(4) %7, align 8
  call spir_func void @_ZN4sycl3_V14itemILi2ELb0EEC2ILb0EEERNSt9enable_ifIXntT_EKNS0_5rangeILi2EEEE4typeERKNS0_2idILi2EEE(ptr addrspace(4) noundef align 8 dereferenceable_or_null(32) %0, ptr addrspace(4) noundef align 8 dereferenceable(16) %8, ptr addrspace(4) noundef align 8 dereferenceable(16) %9) #7
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN4sycl3_V16detail7Builder12createNDItemILi2EEENS0_7nd_itemIXT_EEERKNS0_4itemIXT_ELb1EEERKNS6_IXT_ELb0EEERKNS0_5groupIXT_EEE(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::nd_item") align 1 %0, ptr addrspace(4) noundef align 8 dereferenceable(48) %1, ptr addrspace(4) noundef align 8 dereferenceable(32) %2, ptr addrspace(4) noundef align 8 dereferenceable(64) %3) #1 comdat align 2 !srcloc !37 {
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
  call spir_func void @_ZN4sycl3_V17nd_itemILi2EEC2ERKNS0_4itemILi2ELb1EEERKNS3_ILi2ELb0EEERKNS0_5groupILi2EEE(ptr addrspace(4) noundef align 1 dereferenceable_or_null(1) %0, ptr addrspace(4) noundef align 8 dereferenceable(48) %11, ptr addrspace(4) noundef align 8 dereferenceable(32) %12, ptr addrspace(4) noundef align 8 dereferenceable(64) %13) #7
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN7__spirv21InitSizesSTGlobalSizeILi2EN4sycl3_V15rangeILi2EEEE8initSizeEv(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::range") align 8 %0) #1 comdat align 2 !srcloc !38 {
  %2 = call spir_func noundef i64 @_ZN7__spirv13getGlobalSizeILi1EEEmv() #7
  %3 = call spir_func noundef i64 @_ZN7__spirv13getGlobalSizeILi0EEEmv() #7
  call spir_func void @_ZN4sycl3_V15rangeILi2EEC2ILi2EEENSt9enable_ifIXeqT_Li2EEmE4typeEm(ptr addrspace(4) noundef align 8 dereferenceable_or_null(16) %0, i64 noundef %2, i64 noundef %3) #7
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef i64 @_ZN7__spirv13getGlobalSizeILi1EEEmv() #1 !srcloc !39 {
  %1 = alloca i64, align 8
  %2 = addrspacecast ptr %1 to ptr addrspace(4)
  %3 = call spir_func noundef i64 @_Z20__spirv_GlobalSize_yv() #7
  ret i64 %3
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef i64 @_ZN7__spirv13getGlobalSizeILi0EEEmv() #1 !srcloc !40 {
  %1 = alloca i64, align 8
  %2 = addrspacecast ptr %1 to ptr addrspace(4)
  %3 = call spir_func noundef i64 @_Z20__spirv_GlobalSize_xv() #7
  ret i64 %3
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN4sycl3_V15rangeILi2EEC2ILi2EEENSt9enable_ifIXeqT_Li2EEmE4typeEm(ptr addrspace(4) noundef align 8 dereferenceable_or_null(16) %0, i64 noundef %1, i64 noundef %2) unnamed_addr #1 comdat align 2 !srcloc !41 {
  %4 = alloca ptr addrspace(4), align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = addrspacecast ptr %4 to ptr addrspace(4)
  %8 = addrspacecast ptr %5 to ptr addrspace(4)
  %9 = addrspacecast ptr %6 to ptr addrspace(4)
  store ptr addrspace(4) %0, ptr addrspace(4) %7, align 8
  store i64 %1, ptr addrspace(4) %8, align 8
  store i64 %2, ptr addrspace(4) %9, align 8
  %10 = load ptr addrspace(4), ptr addrspace(4) %7, align 8
  %11 = load i64, ptr addrspace(4) %8, align 8
  %12 = load i64, ptr addrspace(4) %9, align 8
  call spir_func void @_ZN4sycl3_V16detail5arrayILi2EEC2ILi2EEENSt9enable_ifIXeqT_Li2EEmE4typeEm(ptr addrspace(4) noundef align 8 dereferenceable_or_null(16) %10, i64 noundef %11, i64 noundef %12) #7
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef i64 @_Z20__spirv_GlobalSize_yv() #3 comdat !srcloc !42 {
  %1 = alloca i64, align 8
  %2 = addrspacecast ptr %1 to ptr addrspace(4)
  %3 = load <3 x i64>, ptr addrspace(4) addrspacecast (ptr addrspace(1) @__spirv_BuiltInGlobalSize to ptr addrspace(4)), align 32
  %4 = extractelement <3 x i64> %3, i64 1
  ret i64 %4
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef i64 @_Z20__spirv_GlobalSize_xv() #3 comdat !srcloc !43 {
  %1 = alloca i64, align 8
  %2 = addrspacecast ptr %1 to ptr addrspace(4)
  %3 = load <3 x i64>, ptr addrspace(4) addrspacecast (ptr addrspace(1) @__spirv_BuiltInGlobalSize to ptr addrspace(4)), align 32
  %4 = extractelement <3 x i64> %3, i64 0
  ret i64 %4
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN7__spirv24InitSizesSTWorkgroupSizeILi2EN4sycl3_V15rangeILi2EEEE8initSizeEv(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::range") align 8 %0) #1 comdat align 2 !srcloc !44 {
  %2 = call spir_func noundef i64 @_ZN7__spirv16getWorkgroupSizeILi1EEEmv() #7
  %3 = call spir_func noundef i64 @_ZN7__spirv16getWorkgroupSizeILi0EEEmv() #7
  call spir_func void @_ZN4sycl3_V15rangeILi2EEC2ILi2EEENSt9enable_ifIXeqT_Li2EEmE4typeEm(ptr addrspace(4) noundef align 8 dereferenceable_or_null(16) %0, i64 noundef %2, i64 noundef %3) #7
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef i64 @_ZN7__spirv16getWorkgroupSizeILi1EEEmv() #1 !srcloc !45 {
  %1 = alloca i64, align 8
  %2 = addrspacecast ptr %1 to ptr addrspace(4)
  %3 = call spir_func noundef i64 @_Z23__spirv_WorkgroupSize_yv() #7
  ret i64 %3
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef i64 @_ZN7__spirv16getWorkgroupSizeILi0EEEmv() #1 !srcloc !46 {
  %1 = alloca i64, align 8
  %2 = addrspacecast ptr %1 to ptr addrspace(4)
  %3 = call spir_func noundef i64 @_Z23__spirv_WorkgroupSize_xv() #7
  ret i64 %3
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef i64 @_Z23__spirv_WorkgroupSize_yv() #3 comdat !srcloc !47 {
  %1 = alloca i64, align 8
  %2 = addrspacecast ptr %1 to ptr addrspace(4)
  %3 = load <3 x i64>, ptr addrspace(4) addrspacecast (ptr addrspace(1) @__spirv_BuiltInWorkgroupSize to ptr addrspace(4)), align 32
  %4 = extractelement <3 x i64> %3, i64 1
  ret i64 %4
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef i64 @_Z23__spirv_WorkgroupSize_xv() #3 comdat !srcloc !48 {
  %1 = alloca i64, align 8
  %2 = addrspacecast ptr %1 to ptr addrspace(4)
  %3 = load <3 x i64>, ptr addrspace(4) addrspacecast (ptr addrspace(1) @__spirv_BuiltInWorkgroupSize to ptr addrspace(4)), align 32
  %4 = extractelement <3 x i64> %3, i64 0
  ret i64 %4
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN7__spirv24InitSizesSTNumWorkgroupsILi2EN4sycl3_V15rangeILi2EEEE8initSizeEv(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::range") align 8 %0) #1 comdat align 2 !srcloc !49 {
  %2 = call spir_func noundef i64 @_ZN7__spirv16getNumWorkgroupsILi1EEEmv() #7
  %3 = call spir_func noundef i64 @_ZN7__spirv16getNumWorkgroupsILi0EEEmv() #7
  call spir_func void @_ZN4sycl3_V15rangeILi2EEC2ILi2EEENSt9enable_ifIXeqT_Li2EEmE4typeEm(ptr addrspace(4) noundef align 8 dereferenceable_or_null(16) %0, i64 noundef %2, i64 noundef %3) #7
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef i64 @_ZN7__spirv16getNumWorkgroupsILi1EEEmv() #1 !srcloc !50 {
  %1 = alloca i64, align 8
  %2 = addrspacecast ptr %1 to ptr addrspace(4)
  %3 = call spir_func noundef i64 @_Z23__spirv_NumWorkgroups_yv() #7
  ret i64 %3
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef i64 @_ZN7__spirv16getNumWorkgroupsILi0EEEmv() #1 !srcloc !51 {
  %1 = alloca i64, align 8
  %2 = addrspacecast ptr %1 to ptr addrspace(4)
  %3 = call spir_func noundef i64 @_Z23__spirv_NumWorkgroups_xv() #7
  ret i64 %3
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef i64 @_Z23__spirv_NumWorkgroups_yv() #3 comdat !srcloc !52 {
  %1 = alloca i64, align 8
  %2 = addrspacecast ptr %1 to ptr addrspace(4)
  %3 = load <3 x i64>, ptr addrspace(4) addrspacecast (ptr addrspace(1) @__spirv_BuiltInNumWorkgroups to ptr addrspace(4)), align 32
  %4 = extractelement <3 x i64> %3, i64 1
  ret i64 %4
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef i64 @_Z23__spirv_NumWorkgroups_xv() #3 comdat !srcloc !53 {
  %1 = alloca i64, align 8
  %2 = addrspacecast ptr %1 to ptr addrspace(4)
  %3 = load <3 x i64>, ptr addrspace(4) addrspacecast (ptr addrspace(1) @__spirv_BuiltInNumWorkgroups to ptr addrspace(4)), align 32
  %4 = extractelement <3 x i64> %3, i64 0
  ret i64 %4
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN7__spirv22InitSizesSTWorkgroupIdILi2EN4sycl3_V12idILi2EEEE8initSizeEv(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::id") align 8 %0) #1 comdat align 2 !srcloc !54 {
  %2 = call spir_func noundef i64 @_ZN7__spirv14getWorkgroupIdILi1EEEmv() #7
  %3 = call spir_func noundef i64 @_ZN7__spirv14getWorkgroupIdILi0EEEmv() #7
  call spir_func void @_ZN4sycl3_V12idILi2EEC2ILi2EEENSt9enable_ifIXeqT_Li2EEmE4typeEm(ptr addrspace(4) noundef align 8 dereferenceable_or_null(16) %0, i64 noundef %2, i64 noundef %3) #7
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef i64 @_ZN7__spirv14getWorkgroupIdILi1EEEmv() #1 !srcloc !55 {
  %1 = alloca i64, align 8
  %2 = addrspacecast ptr %1 to ptr addrspace(4)
  %3 = call spir_func noundef i64 @_Z21__spirv_WorkgroupId_yv() #7
  ret i64 %3
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef i64 @_ZN7__spirv14getWorkgroupIdILi0EEEmv() #1 !srcloc !56 {
  %1 = alloca i64, align 8
  %2 = addrspacecast ptr %1 to ptr addrspace(4)
  %3 = call spir_func noundef i64 @_Z21__spirv_WorkgroupId_xv() #7
  ret i64 %3
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef i64 @_Z21__spirv_WorkgroupId_yv() #3 comdat !srcloc !57 {
  %1 = alloca i64, align 8
  %2 = addrspacecast ptr %1 to ptr addrspace(4)
  %3 = load <3 x i64>, ptr addrspace(4) addrspacecast (ptr addrspace(1) @__spirv_BuiltInWorkgroupId to ptr addrspace(4)), align 32
  %4 = extractelement <3 x i64> %3, i64 1
  ret i64 %4
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef i64 @_Z21__spirv_WorkgroupId_xv() #3 comdat !srcloc !58 {
  %1 = alloca i64, align 8
  %2 = addrspacecast ptr %1 to ptr addrspace(4)
  %3 = load <3 x i64>, ptr addrspace(4) addrspacecast (ptr addrspace(1) @__spirv_BuiltInWorkgroupId to ptr addrspace(4)), align 32
  %4 = extractelement <3 x i64> %3, i64 0
  ret i64 %4
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN7__spirv28InitSizesSTLocalInvocationIdILi2EN4sycl3_V12idILi2EEEE8initSizeEv(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::id") align 8 %0) #1 comdat align 2 !srcloc !59 {
  %2 = call spir_func noundef i64 @_ZN7__spirv20getLocalInvocationIdILi1EEEmv() #7
  %3 = call spir_func noundef i64 @_ZN7__spirv20getLocalInvocationIdILi0EEEmv() #7
  call spir_func void @_ZN4sycl3_V12idILi2EEC2ILi2EEENSt9enable_ifIXeqT_Li2EEmE4typeEm(ptr addrspace(4) noundef align 8 dereferenceable_or_null(16) %0, i64 noundef %2, i64 noundef %3) #7
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef i64 @_ZN7__spirv20getLocalInvocationIdILi1EEEmv() #1 !srcloc !60 {
  %1 = alloca i64, align 8
  %2 = addrspacecast ptr %1 to ptr addrspace(4)
  %3 = call spir_func noundef i64 @_Z27__spirv_LocalInvocationId_yv() #7
  ret i64 %3
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef i64 @_ZN7__spirv20getLocalInvocationIdILi0EEEmv() #1 !srcloc !61 {
  %1 = alloca i64, align 8
  %2 = addrspacecast ptr %1 to ptr addrspace(4)
  %3 = call spir_func noundef i64 @_Z27__spirv_LocalInvocationId_xv() #7
  ret i64 %3
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef i64 @_Z27__spirv_LocalInvocationId_yv() #3 comdat !srcloc !62 {
  %1 = alloca i64, align 8
  %2 = addrspacecast ptr %1 to ptr addrspace(4)
  %3 = load <3 x i64>, ptr addrspace(4) addrspacecast (ptr addrspace(1) @__spirv_BuiltInLocalInvocationId to ptr addrspace(4)), align 32
  %4 = extractelement <3 x i64> %3, i64 1
  ret i64 %4
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef i64 @_Z27__spirv_LocalInvocationId_xv() #3 comdat !srcloc !63 {
  %1 = alloca i64, align 8
  %2 = addrspacecast ptr %1 to ptr addrspace(4)
  %3 = load <3 x i64>, ptr addrspace(4) addrspacecast (ptr addrspace(1) @__spirv_BuiltInLocalInvocationId to ptr addrspace(4)), align 32
  %4 = extractelement <3 x i64> %3, i64 0
  ret i64 %4
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN7__spirv23InitSizesSTGlobalOffsetILi2EN4sycl3_V12idILi2EEEE8initSizeEv(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::id") align 8 %0) #1 comdat align 2 !srcloc !64 {
  %2 = call spir_func noundef i64 @_ZN7__spirv15getGlobalOffsetILi1EEEmv() #7
  %3 = call spir_func noundef i64 @_ZN7__spirv15getGlobalOffsetILi0EEEmv() #7
  call spir_func void @_ZN4sycl3_V12idILi2EEC2ILi2EEENSt9enable_ifIXeqT_Li2EEmE4typeEm(ptr addrspace(4) noundef align 8 dereferenceable_or_null(16) %0, i64 noundef %2, i64 noundef %3) #7
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef i64 @_ZN7__spirv15getGlobalOffsetILi1EEEmv() #1 !srcloc !65 {
  %1 = alloca i64, align 8
  %2 = addrspacecast ptr %1 to ptr addrspace(4)
  %3 = call spir_func noundef i64 @_Z22__spirv_GlobalOffset_yv() #7
  ret i64 %3
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef i64 @_ZN7__spirv15getGlobalOffsetILi0EEEmv() #1 !srcloc !66 {
  %1 = alloca i64, align 8
  %2 = addrspacecast ptr %1 to ptr addrspace(4)
  %3 = call spir_func noundef i64 @_Z22__spirv_GlobalOffset_xv() #7
  ret i64 %3
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef i64 @_Z22__spirv_GlobalOffset_yv() #3 comdat !srcloc !67 {
  %1 = alloca i64, align 8
  %2 = addrspacecast ptr %1 to ptr addrspace(4)
  %3 = load <3 x i64>, ptr addrspace(4) addrspacecast (ptr addrspace(1) @__spirv_BuiltInGlobalOffset to ptr addrspace(4)), align 32
  %4 = extractelement <3 x i64> %3, i64 1
  ret i64 %4
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef i64 @_Z22__spirv_GlobalOffset_xv() #3 comdat !srcloc !68 {
  %1 = alloca i64, align 8
  %2 = addrspacecast ptr %1 to ptr addrspace(4)
  %3 = load <3 x i64>, ptr addrspace(4) addrspacecast (ptr addrspace(1) @__spirv_BuiltInGlobalOffset to ptr addrspace(4)), align 32
  %4 = extractelement <3 x i64> %3, i64 0
  ret i64 %4
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p4.p4.i64(ptr addrspace(4) noalias writeonly captures(none), ptr addrspace(4) noalias readonly captures(none), i64, i1 immarg) #5

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN4sycl3_V15groupILi2EEC2ERKNS0_5rangeILi2EEES6_S4_RKNS0_2idILi2EEE(ptr addrspace(4) noundef align 8 dereferenceable_or_null(64) %0, ptr addrspace(4) noundef align 8 dereferenceable(16) %1, ptr addrspace(4) noundef align 8 dereferenceable(16) %2, ptr noundef byval(%"class.sycl::_V1::range") align 8 %3, ptr addrspace(4) noundef align 8 dereferenceable(16) %4) unnamed_addr #1 comdat align 2 !srcloc !69 {
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
  call void @llvm.memcpy.p4.p4.i64(ptr addrspace(4) align 8 %18, ptr addrspace(4) align 8 %19, i64 16, i1 false)
  %20 = getelementptr inbounds nuw %"class.sycl::_V1::group", ptr addrspace(4) %17, i32 0, i32 1
  %21 = load ptr addrspace(4), ptr addrspace(4) %13, align 8
  call void @llvm.memcpy.p4.p4.i64(ptr addrspace(4) align 8 %20, ptr addrspace(4) align 8 %21, i64 16, i1 false)
  %22 = getelementptr inbounds nuw %"class.sycl::_V1::group", ptr addrspace(4) %17, i32 0, i32 2
  call void @llvm.memcpy.p4.p4.i64(ptr addrspace(4) align 8 %22, ptr addrspace(4) align 8 %16, i64 16, i1 false)
  %23 = getelementptr inbounds nuw %"class.sycl::_V1::group", ptr addrspace(4) %17, i32 0, i32 3
  %24 = load ptr addrspace(4), ptr addrspace(4) %15, align 8
  call void @llvm.memcpy.p4.p4.i64(ptr addrspace(4) align 8 %23, ptr addrspace(4) align 8 %24, i64 16, i1 false)
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN4sycl3_V14itemILi2ELb1EEC2ILb1EEERNSt9enable_ifIXT_EKNS0_5rangeILi2EEEE4typeERKNS0_2idILi2EEESE_(ptr addrspace(4) noundef align 8 dereferenceable_or_null(48) %0, ptr addrspace(4) noundef align 8 dereferenceable(16) %1, ptr addrspace(4) noundef align 8 dereferenceable(16) %2, ptr addrspace(4) noundef align 8 dereferenceable(16) %3) unnamed_addr #1 comdat align 2 !srcloc !70 {
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
  call void @llvm.memcpy.p4.p4.i64(ptr addrspace(4) align 8 %15, ptr addrspace(4) align 8 %16, i64 16, i1 false)
  %17 = getelementptr inbounds nuw %"struct.sycl::_V1::detail::ItemBase", ptr addrspace(4) %14, i32 0, i32 1
  %18 = load ptr addrspace(4), ptr addrspace(4) %11, align 8
  call void @llvm.memcpy.p4.p4.i64(ptr addrspace(4) align 8 %17, ptr addrspace(4) align 8 %18, i64 16, i1 false)
  %19 = getelementptr inbounds nuw %"struct.sycl::_V1::detail::ItemBase", ptr addrspace(4) %14, i32 0, i32 2
  %20 = load ptr addrspace(4), ptr addrspace(4) %12, align 8
  call void @llvm.memcpy.p4.p4.i64(ptr addrspace(4) align 8 %19, ptr addrspace(4) align 8 %20, i64 16, i1 false)
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN4sycl3_V14itemILi2ELb0EEC2ILb0EEERNSt9enable_ifIXntT_EKNS0_5rangeILi2EEEE4typeERKNS0_2idILi2EEE(ptr addrspace(4) noundef align 8 dereferenceable_or_null(32) %0, ptr addrspace(4) noundef align 8 dereferenceable(16) %1, ptr addrspace(4) noundef align 8 dereferenceable(16) %2) unnamed_addr #1 comdat align 2 !srcloc !71 {
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
  call void @llvm.memcpy.p4.p4.i64(ptr addrspace(4) align 8 %12, ptr addrspace(4) align 8 %13, i64 16, i1 false)
  %14 = getelementptr inbounds nuw %"struct.sycl::_V1::detail::ItemBase.1", ptr addrspace(4) %11, i32 0, i32 1
  %15 = load ptr addrspace(4), ptr addrspace(4) %9, align 8
  call void @llvm.memcpy.p4.p4.i64(ptr addrspace(4) align 8 %14, ptr addrspace(4) align 8 %15, i64 16, i1 false)
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN4sycl3_V17nd_itemILi2EEC2ERKNS0_4itemILi2ELb1EEERKNS3_ILi2ELb0EEERKNS0_5groupILi2EEE(ptr addrspace(4) noundef align 1 dereferenceable_or_null(1) %0, ptr addrspace(4) noundef align 8 dereferenceable(48) %1, ptr addrspace(4) noundef align 8 dereferenceable(32) %2, ptr addrspace(4) noundef align 8 dereferenceable(64) %3) unnamed_addr #1 comdat align 2 !srcloc !72 {
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

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define weak_odr dso_local spir_kernel void @_ZTSZZ4mainENKUlRN4sycl3_V17handlerEE0_clES2_E3opt(i32 noundef %0, i32 noundef %1, ptr addrspace(3) noundef align 4 %2, ptr noundef byval(%"class.sycl::_V1::range") align 8 %3, ptr noundef byval(%"class.sycl::_V1::range") align 8 %4, ptr noundef byval(%"class.sycl::_V1::id") align 8 %5, ptr addrspace(1) noundef align 1 %6, ptr addrspace(1) noundef align 4 %7, ptr addrspace(1) noundef align 4 %8) #0 comdat !srcloc !73 !kernel_arg_buffer_location !74 !kernel_arg_runtime_aligned !75 !kernel_arg_exclusive_ptr !75 !sycl_fixed_targets !8 {
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca ptr addrspace(3), align 8
  %13 = alloca ptr addrspace(4), align 8
  %14 = alloca ptr addrspace(4), align 8
  %15 = alloca ptr addrspace(4), align 8
  %16 = alloca ptr addrspace(1), align 8
  %17 = alloca ptr addrspace(1), align 8
  %18 = alloca ptr addrspace(1), align 8
  %19 = alloca %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE0_clES2_EUlNS0_7nd_itemILi2EEEE_, align 8
  %20 = alloca %"class.sycl::_V1::range", align 8
  %21 = alloca %"class.sycl::_V1::range", align 8
  %22 = alloca %"class.sycl::_V1::id", align 8
  %23 = alloca %"class.sycl::_V1::nd_item", align 1
  %24 = addrspacecast ptr %10 to ptr addrspace(4)
  %25 = addrspacecast ptr %11 to ptr addrspace(4)
  %26 = addrspacecast ptr %12 to ptr addrspace(4)
  %27 = addrspacecast ptr %13 to ptr addrspace(4)
  %28 = addrspacecast ptr %14 to ptr addrspace(4)
  %29 = addrspacecast ptr %15 to ptr addrspace(4)
  %30 = addrspacecast ptr %16 to ptr addrspace(4)
  %31 = addrspacecast ptr %17 to ptr addrspace(4)
  %32 = addrspacecast ptr %18 to ptr addrspace(4)
  %33 = addrspacecast ptr %19 to ptr addrspace(4)
  %34 = addrspacecast ptr %20 to ptr addrspace(4)
  %35 = addrspacecast ptr %21 to ptr addrspace(4)
  %36 = addrspacecast ptr %22 to ptr addrspace(4)
  %37 = addrspacecast ptr %23 to ptr addrspace(4)
  store i32 %0, ptr addrspace(4) %24, align 4
  store i32 %1, ptr addrspace(4) %25, align 4
  store ptr addrspace(3) %2, ptr addrspace(4) %26, align 8
  %38 = addrspacecast ptr %3 to ptr addrspace(4)
  store ptr addrspace(4) %38, ptr addrspace(4) %27, align 8
  %39 = addrspacecast ptr %4 to ptr addrspace(4)
  store ptr addrspace(4) %39, ptr addrspace(4) %28, align 8
  %40 = addrspacecast ptr %5 to ptr addrspace(4)
  store ptr addrspace(4) %40, ptr addrspace(4) %29, align 8
  store ptr addrspace(1) %6, ptr addrspace(4) %30, align 8
  store ptr addrspace(1) %7, ptr addrspace(4) %31, align 8
  store ptr addrspace(1) %8, ptr addrspace(4) %32, align 8
  %41 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE0_clES2_EUlNS0_7nd_itemILi2EEEE_, ptr addrspace(4) %33, i32 0, i32 0
  %42 = load i32, ptr addrspace(4) %24, align 4
  store i32 %42, ptr addrspace(4) %41, align 8
  %43 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE0_clES2_EUlNS0_7nd_itemILi2EEEE_, ptr addrspace(4) %33, i32 0, i32 1
  %44 = load i32, ptr addrspace(4) %25, align 4
  store i32 %44, ptr addrspace(4) %43, align 4
  %45 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE0_clES2_EUlNS0_7nd_itemILi2EEEE_, ptr addrspace(4) %33, i32 0, i32 2
  call spir_func void @_ZN4sycl3_V114local_accessorIiLi2EEC2Ev(ptr addrspace(4) noundef align 8 dereferenceable_or_null(56) %45) #7
  %46 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE0_clES2_EUlNS0_7nd_itemILi2EEEE_, ptr addrspace(4) %33, i32 0, i32 3
  %47 = load ptr addrspace(1), ptr addrspace(4) %30, align 8
  %48 = addrspacecast ptr addrspace(1) %47 to ptr addrspace(4)
  store ptr addrspace(4) %48, ptr addrspace(4) %46, align 8
  %49 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE0_clES2_EUlNS0_7nd_itemILi2EEEE_, ptr addrspace(4) %33, i32 0, i32 4
  %50 = load ptr addrspace(1), ptr addrspace(4) %31, align 8
  %51 = addrspacecast ptr addrspace(1) %50 to ptr addrspace(4)
  store ptr addrspace(4) %51, ptr addrspace(4) %49, align 8
  %52 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE0_clES2_EUlNS0_7nd_itemILi2EEEE_, ptr addrspace(4) %33, i32 0, i32 5
  %53 = load ptr addrspace(1), ptr addrspace(4) %32, align 8
  %54 = addrspacecast ptr addrspace(1) %53 to ptr addrspace(4)
  store ptr addrspace(4) %54, ptr addrspace(4) %52, align 8
  %55 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE0_clES2_EUlNS0_7nd_itemILi2EEEE_, ptr addrspace(4) %33, i32 0, i32 2
  %56 = load ptr addrspace(3), ptr addrspace(4) %26, align 8
  call void @llvm.memcpy.p4.p4.i64(ptr addrspace(4) align 8 %34, ptr addrspace(4) align 8 %38, i64 16, i1 false)
  call void @llvm.memcpy.p4.p4.i64(ptr addrspace(4) align 8 %35, ptr addrspace(4) align 8 %39, i64 16, i1 false)
  call void @llvm.memcpy.p4.p4.i64(ptr addrspace(4) align 8 %36, ptr addrspace(4) align 8 %40, i64 16, i1 false)
  %57 = addrspacecast ptr addrspace(4) %34 to ptr
  %58 = addrspacecast ptr addrspace(4) %35 to ptr
  %59 = addrspacecast ptr addrspace(4) %36 to ptr
  call spir_func void @_ZN4sycl3_V114local_accessorIiLi2EE6__initEPU3AS3iNS0_5rangeILi2EEES6_NS0_2idILi2EEE(ptr addrspace(4) noundef align 8 dereferenceable_or_null(56) %55, ptr addrspace(3) noundef %56, ptr noundef byval(%"class.sycl::_V1::range") align 8 %57, ptr noundef byval(%"class.sycl::_V1::range") align 8 %58, ptr noundef byval(%"class.sycl::_V1::id") align 8 %59) #7
  %60 = call spir_func noundef ptr addrspace(4) @_ZN4sycl3_V16detail7declptrINS0_7nd_itemILi2EEEEEPT_v() #7
  call spir_func void @_ZN4sycl3_V16detail7Builder10getElementILi2EEEKNS0_7nd_itemIXT_EEEPS5_(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::nd_item") align 1 %37, ptr addrspace(4) noundef %60) #7
  %61 = addrspacecast ptr addrspace(4) %37 to ptr
  call spir_func void @_ZZZ4mainENKUlRN4sycl3_V17handlerEE0_clES2_ENKUlNS0_7nd_itemILi2EEEE_clES5_(ptr addrspace(4) noundef align 8 dereferenceable_or_null(88) %33, ptr noundef byval(%"class.sycl::_V1::nd_item") align 1 %61) #7
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN4sycl3_V114local_accessorIiLi2EEC2Ev(ptr addrspace(4) noundef align 8 dereferenceable_or_null(56) %0) unnamed_addr #1 comdat align 2 !srcloc !76 {
  %2 = alloca ptr addrspace(4), align 8
  %3 = alloca %"class.sycl::_V1::detail::LocalAccessorBaseDevice", align 8
  %4 = alloca %"class.sycl::_V1::range", align 8
  %5 = addrspacecast ptr %2 to ptr addrspace(4)
  %6 = addrspacecast ptr %3 to ptr addrspace(4)
  %7 = addrspacecast ptr %4 to ptr addrspace(4)
  store ptr addrspace(4) %0, ptr addrspace(4) %5, align 8
  %8 = load ptr addrspace(4), ptr addrspace(4) %5, align 8
  call spir_func void @_ZN4sycl3_V119local_accessor_baseIiLi2ELNS0_6access4modeE1026ELNS2_11placeholderE0EEC2Ev(ptr addrspace(4) noundef align 8 dereferenceable_or_null(56) %8) #7
  call spir_func void @_ZN4sycl3_V16detail14InitializedValILi2ENS0_5rangeEE3getILi0EEENS3_ILi2EEEv(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::range") align 8 %7) #7
  %9 = addrspacecast ptr addrspace(4) %7 to ptr
  call spir_func void @_ZN4sycl3_V16detail23LocalAccessorBaseDeviceILi2EEC2ENS0_5rangeILi2EEE(ptr addrspace(4) noundef align 8 dereferenceable_or_null(48) %6, ptr noundef byval(%"class.sycl::_V1::range") align 8 %9) #7
  %10 = getelementptr inbounds nuw %"class.sycl::_V1::local_accessor_base", ptr addrspace(4) %8, i32 0, i32 0
  call void @llvm.memcpy.p4.p4.i64(ptr addrspace(4) align 8 %10, ptr addrspace(4) align 8 %6, i64 48, i1 false)
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN4sycl3_V114local_accessorIiLi2EE6__initEPU3AS3iNS0_5rangeILi2EEES6_NS0_2idILi2EEE(ptr addrspace(4) noundef align 8 dereferenceable_or_null(56) %0, ptr addrspace(3) noundef %1, ptr noundef byval(%"class.sycl::_V1::range") align 8 %2, ptr noundef byval(%"class.sycl::_V1::range") align 8 %3, ptr noundef byval(%"class.sycl::_V1::id") align 8 %4) #1 comdat align 2 !srcloc !77 {
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
  call void @llvm.memcpy.p4.p4.i64(ptr addrspace(4) align 8 %19, ptr addrspace(4) align 8 %22, i64 16, i1 false)
  call void @llvm.memcpy.p4.p4.i64(ptr addrspace(4) align 8 %20, ptr addrspace(4) align 8 %23, i64 16, i1 false)
  call void @llvm.memcpy.p4.p4.i64(ptr addrspace(4) align 8 %21, ptr addrspace(4) align 8 %24, i64 16, i1 false)
  %27 = addrspacecast ptr addrspace(4) %19 to ptr
  %28 = addrspacecast ptr addrspace(4) %20 to ptr
  %29 = addrspacecast ptr addrspace(4) %21 to ptr
  call spir_func void @_ZN4sycl3_V119local_accessor_baseIiLi2ELNS0_6access4modeE1026ELNS2_11placeholderE0EE6__initEPU3AS3iNS0_5rangeILi2EEES9_NS0_2idILi2EEE(ptr addrspace(4) noundef align 8 dereferenceable_or_null(56) %25, ptr addrspace(3) noundef %26, ptr noundef byval(%"class.sycl::_V1::range") align 8 %27, ptr noundef byval(%"class.sycl::_V1::range") align 8 %28, ptr noundef byval(%"class.sycl::_V1::id") align 8 %29) #7
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define internal spir_func void @_ZZZ4mainENKUlRN4sycl3_V17handlerEE0_clES2_ENKUlNS0_7nd_itemILi2EEEE_clES5_(ptr addrspace(4) noundef align 8 dereferenceable_or_null(88) %0, ptr noundef byval(%"class.sycl::_V1::nd_item") align 1 %1) #1 align 2 !srcloc !73 {
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
  %13 = alloca i64, align 8
  %14 = alloca ptr addrspace(4), align 8
  %15 = alloca i32, align 4
  %16 = alloca i64, align 8
  %17 = alloca %"class.sycl::_V1::id", align 8
  %18 = alloca i64, align 8
  %19 = alloca ptr addrspace(4), align 8
  %20 = alloca i32, align 4
  %21 = alloca i64, align 8
  %22 = alloca %"class.sycl::_V1::id", align 8
  %23 = alloca ptr addrspace(4), align 8
  %24 = alloca ptr addrspace(4), align 8
  %25 = alloca i32, align 4
  %26 = alloca i32, align 4
  %27 = alloca i32, align 4
  %28 = alloca i32, align 4
  %29 = alloca %"class.sycl::_V1::detail::accessor_common<int, 2, sycl::_V1::access::mode::read_write, sycl::_V1::access::target::local, sycl::_V1::access::placeholder::false_t>::AccessorSubscript", align 8
  %30 = alloca i8, align 1
  %31 = alloca i32, align 4
  %32 = alloca i32, align 4
  %33 = alloca i32, align 4
  %34 = alloca i32, align 4
  %35 = alloca %"class.sycl::_V1::detail::accessor_common<int, 2, sycl::_V1::access::mode::read_write, sycl::_V1::access::target::local, sycl::_V1::access::placeholder::false_t>::AccessorSubscript", align 8
  %36 = alloca float, align 4
  %37 = alloca i32, align 4
  %38 = alloca %"class.sycl::_V1::detail::accessor_common<int, 2, sycl::_V1::access::mode::read_write, sycl::_V1::access::target::local, sycl::_V1::access::placeholder::false_t>::AccessorSubscript", align 8
  %39 = addrspacecast ptr %23 to ptr addrspace(4)
  %40 = addrspacecast ptr %24 to ptr addrspace(4)
  %41 = addrspacecast ptr %25 to ptr addrspace(4)
  %42 = addrspacecast ptr %26 to ptr addrspace(4)
  %43 = addrspacecast ptr %27 to ptr addrspace(4)
  %44 = addrspacecast ptr %28 to ptr addrspace(4)
  %45 = addrspacecast ptr %29 to ptr addrspace(4)
  %46 = addrspacecast ptr %30 to ptr addrspace(4)
  %47 = addrspacecast ptr %31 to ptr addrspace(4)
  %48 = addrspacecast ptr %32 to ptr addrspace(4)
  %49 = addrspacecast ptr %33 to ptr addrspace(4)
  %50 = addrspacecast ptr %34 to ptr addrspace(4)
  %51 = addrspacecast ptr %35 to ptr addrspace(4)
  %52 = addrspacecast ptr %36 to ptr addrspace(4)
  %53 = addrspacecast ptr %37 to ptr addrspace(4)
  %54 = addrspacecast ptr %38 to ptr addrspace(4)
  store ptr addrspace(4) %0, ptr addrspace(4) %39, align 8
  %55 = addrspacecast ptr %1 to ptr addrspace(4)
  store ptr addrspace(4) %55, ptr addrspace(4) %40, align 8
  %56 = load ptr addrspace(4), ptr addrspace(4) %39, align 8
  %57 = addrspacecast ptr %13 to ptr addrspace(4)
  %58 = addrspacecast ptr %14 to ptr addrspace(4)
  %59 = addrspacecast ptr %15 to ptr addrspace(4)
  %60 = addrspacecast ptr %16 to ptr addrspace(4)
  %61 = addrspacecast ptr %17 to ptr addrspace(4)
  store ptr addrspace(4) %55, ptr addrspace(4) %58, align 8
  store i32 1, ptr addrspace(4) %59, align 4
  %62 = load ptr addrspace(4), ptr addrspace(4) %58, align 8
  call spir_func void @_ZNK4sycl3_V17nd_itemILi2EE13get_global_idEv(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::id") align 8 %61, ptr addrspace(4) noundef align 1 dereferenceable_or_null(1) %62) #7
  %63 = load i32, ptr addrspace(4) %59, align 4
  %64 = call spir_func noundef align 8 dereferenceable(8) ptr addrspace(4) @_ZN4sycl3_V16detail5arrayILi2EEixEi(ptr addrspace(4) noundef align 8 dereferenceable_or_null(16) %61, i32 noundef %63) #7
  %65 = load i64, ptr addrspace(4) %64, align 8
  store i64 %65, ptr addrspace(4) %60, align 8
  %66 = load i64, ptr addrspace(4) %60, align 8
  %67 = icmp ule i64 %66, 2147483647
  call void @llvm.assume(i1 %67)
  %68 = load i64, ptr addrspace(4) %60, align 8
  %69 = trunc i64 %68 to i32
  store i32 %69, ptr addrspace(4) %41, align 4
  %70 = addrspacecast ptr %18 to ptr addrspace(4)
  %71 = addrspacecast ptr %19 to ptr addrspace(4)
  %72 = addrspacecast ptr %20 to ptr addrspace(4)
  %73 = addrspacecast ptr %21 to ptr addrspace(4)
  %74 = addrspacecast ptr %22 to ptr addrspace(4)
  store ptr addrspace(4) %55, ptr addrspace(4) %71, align 8
  store i32 0, ptr addrspace(4) %72, align 4
  %75 = load ptr addrspace(4), ptr addrspace(4) %71, align 8
  call spir_func void @_ZNK4sycl3_V17nd_itemILi2EE13get_global_idEv(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::id") align 8 %74, ptr addrspace(4) noundef align 1 dereferenceable_or_null(1) %75) #7
  %76 = load i32, ptr addrspace(4) %72, align 4
  %77 = call spir_func noundef align 8 dereferenceable(8) ptr addrspace(4) @_ZN4sycl3_V16detail5arrayILi2EEixEi(ptr addrspace(4) noundef align 8 dereferenceable_or_null(16) %74, i32 noundef %76) #7
  %78 = load i64, ptr addrspace(4) %77, align 8
  store i64 %78, ptr addrspace(4) %73, align 8
  %79 = load i64, ptr addrspace(4) %73, align 8
  %80 = icmp ule i64 %79, 2147483647
  call void @llvm.assume(i1 %80)
  %81 = load i64, ptr addrspace(4) %73, align 8
  %82 = trunc i64 %81 to i32
  store i32 %82, ptr addrspace(4) %42, align 4
  %83 = load i32, ptr addrspace(4) %42, align 4
  %84 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE0_clES2_EUlNS0_7nd_itemILi2EEEE_, ptr addrspace(4) %56, i32 0, i32 0
  %85 = load i32, ptr addrspace(4) %84, align 8
  %86 = icmp sge i32 %83, %85
  br i1 %86, label %92, label %87

87:                                               ; preds = %2
  %88 = load i32, ptr addrspace(4) %41, align 4
  %89 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE0_clES2_EUlNS0_7nd_itemILi2EEEE_, ptr addrspace(4) %56, i32 0, i32 1
  %90 = load i32, ptr addrspace(4) %89, align 4
  %91 = icmp sge i32 %88, %90
  br i1 %91, label %92, label %93

92:                                               ; preds = %87, %2
  br label %236

93:                                               ; preds = %87
  %94 = addrspacecast ptr %3 to ptr addrspace(4)
  %95 = addrspacecast ptr %4 to ptr addrspace(4)
  %96 = addrspacecast ptr %5 to ptr addrspace(4)
  %97 = addrspacecast ptr %6 to ptr addrspace(4)
  %98 = addrspacecast ptr %7 to ptr addrspace(4)
  store ptr addrspace(4) %55, ptr addrspace(4) %95, align 8
  store i32 0, ptr addrspace(4) %96, align 4
  %99 = load ptr addrspace(4), ptr addrspace(4) %95, align 8
  call spir_func void @_ZNK4sycl3_V17nd_itemILi2EE12get_local_idEv(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::id") align 8 %98, ptr addrspace(4) noundef align 1 dereferenceable_or_null(1) %99) #7
  %100 = load i32, ptr addrspace(4) %96, align 4
  %101 = call spir_func noundef align 8 dereferenceable(8) ptr addrspace(4) @_ZN4sycl3_V16detail5arrayILi2EEixEi(ptr addrspace(4) noundef align 8 dereferenceable_or_null(16) %98, i32 noundef %100) #7
  %102 = load i64, ptr addrspace(4) %101, align 8
  store i64 %102, ptr addrspace(4) %97, align 8
  %103 = load i64, ptr addrspace(4) %97, align 8
  %104 = icmp ule i64 %103, 2147483647
  call void @llvm.assume(i1 %104)
  %105 = load i64, ptr addrspace(4) %97, align 8
  %106 = mul i64 %105, 16
  %107 = addrspacecast ptr %8 to ptr addrspace(4)
  %108 = addrspacecast ptr %9 to ptr addrspace(4)
  %109 = addrspacecast ptr %10 to ptr addrspace(4)
  %110 = addrspacecast ptr %11 to ptr addrspace(4)
  %111 = addrspacecast ptr %12 to ptr addrspace(4)
  store ptr addrspace(4) %55, ptr addrspace(4) %108, align 8
  store i32 1, ptr addrspace(4) %109, align 4
  %112 = load ptr addrspace(4), ptr addrspace(4) %108, align 8
  call spir_func void @_ZNK4sycl3_V17nd_itemILi2EE12get_local_idEv(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::id") align 8 %111, ptr addrspace(4) noundef align 1 dereferenceable_or_null(1) %112) #7
  %113 = load i32, ptr addrspace(4) %109, align 4
  %114 = call spir_func noundef align 8 dereferenceable(8) ptr addrspace(4) @_ZN4sycl3_V16detail5arrayILi2EEixEi(ptr addrspace(4) noundef align 8 dereferenceable_or_null(16) %111, i32 noundef %113) #7
  %115 = load i64, ptr addrspace(4) %114, align 8
  store i64 %115, ptr addrspace(4) %110, align 8
  %116 = load i64, ptr addrspace(4) %110, align 8
  %117 = icmp ule i64 %116, 2147483647
  call void @llvm.assume(i1 %117)
  %118 = load i64, ptr addrspace(4) %110, align 8
  %119 = add i64 %106, %118
  %120 = trunc i64 %119 to i32
  store i32 %120, ptr addrspace(4) %43, align 4
  store i32 0, ptr addrspace(4) %44, align 4
  br label %121

121:                                              ; preds = %131, %93
  %122 = load i32, ptr addrspace(4) %44, align 4
  %123 = icmp slt i32 %122, 16
  br i1 %123, label %124, label %134

124:                                              ; preds = %121
  %125 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE0_clES2_EUlNS0_7nd_itemILi2EEEE_, ptr addrspace(4) %56, i32 0, i32 2
  %126 = load i32, ptr addrspace(4) %44, align 4
  %127 = sext i32 %126 to i64
  call spir_func void @_ZNK4sycl3_V119local_accessor_baseIiLi2ELNS0_6access4modeE1026ELNS2_11placeholderE0EEixILi2EvEENS0_6detail15accessor_commonIiLi2ELS3_1026ELNS2_6targetE2016ELS4_0ENS0_3ext6oneapi22accessor_property_listIJEEEE17AccessorSubscriptIXmiT_Li1EES5_EEm(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::detail::accessor_common<int, 2, sycl::_V1::access::mode::read_write, sycl::_V1::access::target::local, sycl::_V1::access::placeholder::false_t>::AccessorSubscript") align 8 %45, ptr addrspace(4) noundef align 8 dereferenceable_or_null(56) %125, i64 noundef %127) #7
  %128 = load i32, ptr addrspace(4) %43, align 4
  %129 = sext i32 %128 to i64
  %130 = call spir_func noundef align 4 dereferenceable(4) ptr addrspace(4) @_ZNK4sycl3_V16detail15accessor_commonIiLi2ELNS0_6access4modeE1026ELNS3_6targetE2016ELNS3_11placeholderE0ENS0_3ext6oneapi22accessor_property_listIJEEEE17AccessorSubscriptILi1ENS0_19local_accessor_baseIiLi2ELS4_1026ELS6_0EEEEixILi1EvEERim(ptr addrspace(4) noundef align 8 dereferenceable_or_null(72) %45, i64 noundef %129) #7
  store i32 0, ptr addrspace(4) %130, align 4
  br label %131

131:                                              ; preds = %124
  %132 = load i32, ptr addrspace(4) %44, align 4
  %133 = add nsw i32 %132, 1
  store i32 %133, ptr addrspace(4) %44, align 4
  br label %121, !llvm.loop !78

134:                                              ; preds = %121
  store i8 0, ptr addrspace(4) %46, align 1
  store i32 -2, ptr addrspace(4) %47, align 4
  br label %135

135:                                              ; preds = %190, %134
  %136 = load i32, ptr addrspace(4) %47, align 4
  %137 = icmp sle i32 %136, 2
  br i1 %137, label %138, label %193

138:                                              ; preds = %135
  store i32 -2, ptr addrspace(4) %48, align 4
  br label %139

139:                                              ; preds = %186, %138
  %140 = load i32, ptr addrspace(4) %48, align 4
  %141 = icmp sle i32 %140, 2
  br i1 %141, label %142, label %189

142:                                              ; preds = %139
  %143 = load i32, ptr addrspace(4) %41, align 4
  %144 = load i32, ptr addrspace(4) %48, align 4
  %145 = add nsw i32 %143, %144
  store i32 %145, ptr addrspace(4) %49, align 4
  %146 = load i32, ptr addrspace(4) %42, align 4
  %147 = load i32, ptr addrspace(4) %47, align 4
  %148 = add nsw i32 %146, %147
  store i32 %148, ptr addrspace(4) %50, align 4
  %149 = load i32, ptr addrspace(4) %49, align 4
  %150 = icmp sge i32 %149, 0
  br i1 %150, label %151, label %185

151:                                              ; preds = %142
  %152 = load i32, ptr addrspace(4) %50, align 4
  %153 = icmp sge i32 %152, 0
  br i1 %153, label %154, label %185

154:                                              ; preds = %151
  %155 = load i32, ptr addrspace(4) %50, align 4
  %156 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE0_clES2_EUlNS0_7nd_itemILi2EEEE_, ptr addrspace(4) %56, i32 0, i32 0
  %157 = load i32, ptr addrspace(4) %156, align 8
  %158 = icmp slt i32 %155, %157
  br i1 %158, label %159, label %185

159:                                              ; preds = %154
  %160 = load i32, ptr addrspace(4) %49, align 4
  %161 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE0_clES2_EUlNS0_7nd_itemILi2EEEE_, ptr addrspace(4) %56, i32 0, i32 1
  %162 = load i32, ptr addrspace(4) %161, align 4
  %163 = icmp slt i32 %160, %162
  br i1 %163, label %164, label %185

164:                                              ; preds = %159
  %165 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE0_clES2_EUlNS0_7nd_itemILi2EEEE_, ptr addrspace(4) %56, i32 0, i32 2
  %166 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE0_clES2_EUlNS0_7nd_itemILi2EEEE_, ptr addrspace(4) %56, i32 0, i32 3
  %167 = load ptr addrspace(4), ptr addrspace(4) %166, align 8
  %168 = load i32, ptr addrspace(4) %50, align 4
  %169 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE0_clES2_EUlNS0_7nd_itemILi2EEEE_, ptr addrspace(4) %56, i32 0, i32 1
  %170 = load i32, ptr addrspace(4) %169, align 4
  %171 = mul nsw i32 %168, %170
  %172 = load i32, ptr addrspace(4) %49, align 4
  %173 = add nsw i32 %171, %172
  %174 = sext i32 %173 to i64
  %175 = getelementptr inbounds i8, ptr addrspace(4) %167, i64 %174
  %176 = load i8, ptr addrspace(4) %175, align 1
  %177 = sext i8 %176 to i64
  call spir_func void @_ZNK4sycl3_V119local_accessor_baseIiLi2ELNS0_6access4modeE1026ELNS2_11placeholderE0EEixILi2EvEENS0_6detail15accessor_commonIiLi2ELS3_1026ELNS2_6targetE2016ELS4_0ENS0_3ext6oneapi22accessor_property_listIJEEEE17AccessorSubscriptIXmiT_Li1EES5_EEm(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::detail::accessor_common<int, 2, sycl::_V1::access::mode::read_write, sycl::_V1::access::target::local, sycl::_V1::access::placeholder::false_t>::AccessorSubscript") align 8 %51, ptr addrspace(4) noundef align 8 dereferenceable_or_null(56) %165, i64 noundef %177) #7
  %178 = load i32, ptr addrspace(4) %43, align 4
  %179 = sext i32 %178 to i64
  %180 = call spir_func noundef align 4 dereferenceable(4) ptr addrspace(4) @_ZNK4sycl3_V16detail15accessor_commonIiLi2ELNS0_6access4modeE1026ELNS3_6targetE2016ELNS3_11placeholderE0ENS0_3ext6oneapi22accessor_property_listIJEEEE17AccessorSubscriptILi1ENS0_19local_accessor_baseIiLi2ELS4_1026ELS6_0EEEEixILi1EvEERim(ptr addrspace(4) noundef align 8 dereferenceable_or_null(72) %51, i64 noundef %179) #7
  %181 = load i32, ptr addrspace(4) %180, align 4
  %182 = add nsw i32 %181, 1
  store i32 %182, ptr addrspace(4) %180, align 4
  %183 = load i8, ptr addrspace(4) %46, align 1
  %184 = add i8 %183, 1
  store i8 %184, ptr addrspace(4) %46, align 1
  br label %185

185:                                              ; preds = %164, %159, %154, %151, %142
  br label %186

186:                                              ; preds = %185
  %187 = load i32, ptr addrspace(4) %48, align 4
  %188 = add nsw i32 %187, 1
  store i32 %188, ptr addrspace(4) %48, align 4
  br label %139, !llvm.loop !79

189:                                              ; preds = %139
  br label %190

190:                                              ; preds = %189
  %191 = load i32, ptr addrspace(4) %47, align 4
  %192 = add nsw i32 %191, 1
  store i32 %192, ptr addrspace(4) %47, align 4
  br label %135, !llvm.loop !80

193:                                              ; preds = %135
  store float 0.000000e+00, ptr addrspace(4) %52, align 4
  store i32 0, ptr addrspace(4) %53, align 4
  br label %194

194:                                              ; preds = %212, %193
  %195 = load i32, ptr addrspace(4) %53, align 4
  %196 = icmp slt i32 %195, 16
  br i1 %196, label %197, label %215

197:                                              ; preds = %194
  %198 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE0_clES2_EUlNS0_7nd_itemILi2EEEE_, ptr addrspace(4) %56, i32 0, i32 4
  %199 = load ptr addrspace(4), ptr addrspace(4) %198, align 8
  %200 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE0_clES2_EUlNS0_7nd_itemILi2EEEE_, ptr addrspace(4) %56, i32 0, i32 2
  %201 = load i32, ptr addrspace(4) %53, align 4
  %202 = sext i32 %201 to i64
  call spir_func void @_ZNK4sycl3_V119local_accessor_baseIiLi2ELNS0_6access4modeE1026ELNS2_11placeholderE0EEixILi2EvEENS0_6detail15accessor_commonIiLi2ELS3_1026ELNS2_6targetE2016ELS4_0ENS0_3ext6oneapi22accessor_property_listIJEEEE17AccessorSubscriptIXmiT_Li1EES5_EEm(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::detail::accessor_common<int, 2, sycl::_V1::access::mode::read_write, sycl::_V1::access::target::local, sycl::_V1::access::placeholder::false_t>::AccessorSubscript") align 8 %54, ptr addrspace(4) noundef align 8 dereferenceable_or_null(56) %200, i64 noundef %202) #7
  %203 = load i32, ptr addrspace(4) %43, align 4
  %204 = sext i32 %203 to i64
  %205 = call spir_func noundef align 4 dereferenceable(4) ptr addrspace(4) @_ZNK4sycl3_V16detail15accessor_commonIiLi2ELNS0_6access4modeE1026ELNS3_6targetE2016ELNS3_11placeholderE0ENS0_3ext6oneapi22accessor_property_listIJEEEE17AccessorSubscriptILi1ENS0_19local_accessor_baseIiLi2ELS4_1026ELS6_0EEEEixILi1EvEERim(ptr addrspace(4) noundef align 8 dereferenceable_or_null(72) %54, i64 noundef %204) #7
  %206 = load i32, ptr addrspace(4) %205, align 4
  %207 = sext i32 %206 to i64
  %208 = getelementptr inbounds float, ptr addrspace(4) %199, i64 %207
  %209 = load float, ptr addrspace(4) %208, align 4
  %210 = load float, ptr addrspace(4) %52, align 4
  %211 = fsub reassoc nsz arcp contract afn float %210, %209
  store float %211, ptr addrspace(4) %52, align 4
  br label %212

212:                                              ; preds = %197
  %213 = load i32, ptr addrspace(4) %53, align 4
  %214 = add nsw i32 %213, 1
  store i32 %214, ptr addrspace(4) %53, align 4
  br label %194, !llvm.loop !81

215:                                              ; preds = %194
  %216 = load float, ptr addrspace(4) %52, align 4
  %217 = load i8, ptr addrspace(4) %46, align 1
  %218 = sext i8 %217 to i32
  %219 = sitofp i32 %218 to float
  %220 = call reassoc nsz arcp contract afn float @llvm.fpbuiltin.fdiv.f32(float %216, float %219) #9
  %221 = load i8, ptr addrspace(4) %46, align 1
  %222 = sitofp i8 %221 to float
  %223 = call reassoc nsz arcp contract afn spir_func noundef float @_ZN4sycl3_V16native4log2Ef(float noundef %222) #7
  %224 = fadd reassoc nsz arcp contract afn float %220, %223
  store float %224, ptr addrspace(4) %52, align 4
  %225 = load float, ptr addrspace(4) %52, align 4
  %226 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE0_clES2_EUlNS0_7nd_itemILi2EEEE_, ptr addrspace(4) %56, i32 0, i32 5
  %227 = load ptr addrspace(4), ptr addrspace(4) %226, align 8
  %228 = load i32, ptr addrspace(4) %42, align 4
  %229 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE0_clES2_EUlNS0_7nd_itemILi2EEEE_, ptr addrspace(4) %56, i32 0, i32 1
  %230 = load i32, ptr addrspace(4) %229, align 4
  %231 = mul nsw i32 %228, %230
  %232 = load i32, ptr addrspace(4) %41, align 4
  %233 = add nsw i32 %231, %232
  %234 = sext i32 %233 to i64
  %235 = getelementptr inbounds float, ptr addrspace(4) %227, i64 %234
  store float %225, ptr addrspace(4) %235, align 4
  br label %236

236:                                              ; preds = %215, %92
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN4sycl3_V119local_accessor_baseIiLi2ELNS0_6access4modeE1026ELNS2_11placeholderE0EEC2Ev(ptr addrspace(4) noundef align 8 dereferenceable_or_null(56) %0) unnamed_addr #1 comdat align 2 !srcloc !82 {
  %2 = alloca ptr addrspace(4), align 8
  %3 = alloca %"class.sycl::_V1::range", align 8
  %4 = addrspacecast ptr %2 to ptr addrspace(4)
  %5 = addrspacecast ptr %3 to ptr addrspace(4)
  store ptr addrspace(4) %0, ptr addrspace(4) %4, align 8
  %6 = load ptr addrspace(4), ptr addrspace(4) %4, align 8
  %7 = getelementptr inbounds nuw %"class.sycl::_V1::local_accessor_base", ptr addrspace(4) %6, i32 0, i32 0
  call spir_func void @_ZN4sycl3_V16detail14InitializedValILi2ENS0_5rangeEE3getILi0EEENS3_ILi2EEEv(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::range") align 8 %5) #7
  %8 = addrspacecast ptr addrspace(4) %5 to ptr
  call spir_func void @_ZN4sycl3_V16detail23LocalAccessorBaseDeviceILi2EEC2ENS0_5rangeILi2EEE(ptr addrspace(4) noundef align 8 dereferenceable_or_null(48) %7, ptr noundef byval(%"class.sycl::_V1::range") align 8 %8) #7
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN4sycl3_V16detail14InitializedValILi2ENS0_5rangeEE3getILi0EEENS3_ILi2EEEv(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::range") align 8 %0) #1 comdat align 2 !srcloc !83 {
  call spir_func void @_ZN4sycl3_V15rangeILi2EEC2ILi2EEENSt9enable_ifIXeqT_Li2EEmE4typeEm(ptr addrspace(4) noundef align 8 dereferenceable_or_null(16) %0, i64 noundef 0, i64 noundef 0) #7
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN4sycl3_V16detail23LocalAccessorBaseDeviceILi2EEC2ENS0_5rangeILi2EEE(ptr addrspace(4) noundef align 8 dereferenceable_or_null(48) %0, ptr noundef byval(%"class.sycl::_V1::range") align 8 %1) unnamed_addr #1 comdat align 2 !srcloc !84 {
  %3 = alloca ptr addrspace(4), align 8
  %4 = alloca ptr addrspace(4), align 8
  %5 = addrspacecast ptr %3 to ptr addrspace(4)
  %6 = addrspacecast ptr %4 to ptr addrspace(4)
  store ptr addrspace(4) %0, ptr addrspace(4) %5, align 8
  %7 = addrspacecast ptr %1 to ptr addrspace(4)
  store ptr addrspace(4) %7, ptr addrspace(4) %6, align 8
  %8 = load ptr addrspace(4), ptr addrspace(4) %5, align 8
  %9 = getelementptr inbounds nuw %"class.sycl::_V1::detail::LocalAccessorBaseDevice", ptr addrspace(4) %8, i32 0, i32 0
  call void @llvm.memcpy.p4.p4.i64(ptr addrspace(4) align 8 %9, ptr addrspace(4) align 8 %7, i64 16, i1 false)
  %10 = getelementptr inbounds nuw %"class.sycl::_V1::detail::LocalAccessorBaseDevice", ptr addrspace(4) %8, i32 0, i32 1
  call spir_func void @_ZN4sycl3_V16detail14InitializedValILi2ENS0_5rangeEE3getILi0EEENS3_ILi2EEEv(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::range") align 8 %10) #7
  %11 = getelementptr inbounds nuw %"class.sycl::_V1::detail::LocalAccessorBaseDevice", ptr addrspace(4) %8, i32 0, i32 2
  call spir_func void @_ZN4sycl3_V12idILi2EEC2Ev(ptr addrspace(4) noundef align 8 dereferenceable_or_null(16) %11) #7
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN4sycl3_V12idILi2EEC2Ev(ptr addrspace(4) noundef align 8 dereferenceable_or_null(16) %0) unnamed_addr #1 comdat align 2 !srcloc !85 {
  %2 = alloca ptr addrspace(4), align 8
  %3 = addrspacecast ptr %2 to ptr addrspace(4)
  store ptr addrspace(4) %0, ptr addrspace(4) %3, align 8
  %4 = load ptr addrspace(4), ptr addrspace(4) %3, align 8
  call spir_func void @_ZN4sycl3_V16detail5arrayILi2EEC2ILi2ELm0EEEv(ptr addrspace(4) noundef align 8 dereferenceable_or_null(16) %4) #7
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN4sycl3_V16detail5arrayILi2EEC2ILi2ELm0EEEv(ptr addrspace(4) noundef align 8 dereferenceable_or_null(16) %0) unnamed_addr #1 comdat align 2 !srcloc !86 {
  %2 = alloca ptr addrspace(4), align 8
  %3 = addrspacecast ptr %2 to ptr addrspace(4)
  store ptr addrspace(4) %0, ptr addrspace(4) %3, align 8
  %4 = load ptr addrspace(4), ptr addrspace(4) %3, align 8
  call spir_func void @_ZN4sycl3_V16detail5arrayILi2EEC2ILi2EEENSt9enable_ifIXeqT_Li2EEmE4typeEm(ptr addrspace(4) noundef align 8 dereferenceable_or_null(16) %4, i64 noundef 0, i64 noundef 0) #7
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN4sycl3_V119local_accessor_baseIiLi2ELNS0_6access4modeE1026ELNS2_11placeholderE0EE6__initEPU3AS3iNS0_5rangeILi2EEES9_NS0_2idILi2EEE(ptr addrspace(4) noundef align 8 dereferenceable_or_null(56) %0, ptr addrspace(3) noundef %1, ptr noundef byval(%"class.sycl::_V1::range") align 8 %2, ptr noundef byval(%"class.sycl::_V1::range") align 8 %3, ptr noundef byval(%"class.sycl::_V1::id") align 8 %4) #1 comdat align 2 !srcloc !87 {
  %6 = alloca ptr addrspace(4), align 8
  %7 = alloca ptr addrspace(3), align 8
  %8 = alloca ptr addrspace(4), align 8
  %9 = alloca ptr addrspace(4), align 8
  %10 = alloca ptr addrspace(4), align 8
  %11 = alloca %class._ZTSZN4sycl3_V119local_accessor_baseIiLi2ELNS0_6access4modeE1026ELNS2_11placeholderE0EE6__initEPU3AS3iNS0_5rangeILi2EEES9_NS0_2idILi2EEEEUlmE_, align 8
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
  %24 = getelementptr inbounds nuw %class._ZTSZN4sycl3_V119local_accessor_baseIiLi2ELNS0_6access4modeE1026ELNS2_11placeholderE0EE6__initEPU3AS3iNS0_5rangeILi2EEES9_NS0_2idILi2EEEEUlmE_, ptr addrspace(4) %17, i32 0, i32 0
  store ptr addrspace(4) %21, ptr addrspace(4) %24, align 8
  %25 = getelementptr inbounds nuw %class._ZTSZN4sycl3_V119local_accessor_baseIiLi2ELNS0_6access4modeE1026ELNS2_11placeholderE0EE6__initEPU3AS3iNS0_5rangeILi2EEES9_NS0_2idILi2EEEEUlmE_, ptr addrspace(4) %17, i32 0, i32 1
  store ptr addrspace(4) %18, ptr addrspace(4) %25, align 8
  call spir_func void @_ZN4sycl3_V16detail4loopILm2EZNS0_19local_accessor_baseIiLi2ELNS0_6access4modeE1026ELNS4_11placeholderE0EE6__initEPU3AS3iNS0_5rangeILi2EEESB_NS0_2idILi2EEEEUlmE_EEvOT0_(ptr addrspace(4) noundef align 8 dereferenceable(16) %17) #7
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN4sycl3_V16detail4loopILm2EZNS0_19local_accessor_baseIiLi2ELNS0_6access4modeE1026ELNS4_11placeholderE0EE6__initEPU3AS3iNS0_5rangeILi2EEESB_NS0_2idILi2EEEEUlmE_EEvOT0_(ptr addrspace(4) noundef align 8 dereferenceable(16) %0) #1 comdat !srcloc !88 {
  %2 = alloca ptr addrspace(4), align 8
  %3 = alloca %"struct.std::integer_sequence", align 1
  %4 = addrspacecast ptr %2 to ptr addrspace(4)
  %5 = addrspacecast ptr %3 to ptr addrspace(4)
  store ptr addrspace(4) %0, ptr addrspace(4) %4, align 8
  %6 = load ptr addrspace(4), ptr addrspace(4) %4, align 8
  %7 = addrspacecast ptr addrspace(4) %5 to ptr
  call spir_func void @_ZN4sycl3_V16detail9loop_implIJLm0ELm1EEZNS0_19local_accessor_baseIiLi2ELNS0_6access4modeE1026ELNS4_11placeholderE0EE6__initEPU3AS3iNS0_5rangeILi2EEESB_NS0_2idILi2EEEEUlmE_EEvSt16integer_sequenceImJXspT_EEEOT0_(ptr noundef byval(%"struct.std::integer_sequence") align 1 %7, ptr addrspace(4) noundef align 8 dereferenceable(16) %6) #7
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN4sycl3_V16detail9loop_implIJLm0ELm1EEZNS0_19local_accessor_baseIiLi2ELNS0_6access4modeE1026ELNS4_11placeholderE0EE6__initEPU3AS3iNS0_5rangeILi2EEESB_NS0_2idILi2EEEEUlmE_EEvSt16integer_sequenceImJXspT_EEEOT0_(ptr noundef byval(%"struct.std::integer_sequence") align 1 %0, ptr addrspace(4) noundef align 8 dereferenceable(16) %1) #1 comdat !srcloc !89 {
  %3 = alloca ptr addrspace(4), align 8
  %4 = alloca ptr addrspace(4), align 8
  %5 = alloca %"struct.std::integral_constant", align 1
  %6 = alloca %"struct.std::integral_constant.2", align 1
  %7 = addrspacecast ptr %3 to ptr addrspace(4)
  %8 = addrspacecast ptr %4 to ptr addrspace(4)
  %9 = addrspacecast ptr %5 to ptr addrspace(4)
  %10 = addrspacecast ptr %6 to ptr addrspace(4)
  %11 = addrspacecast ptr %0 to ptr addrspace(4)
  store ptr addrspace(4) %11, ptr addrspace(4) %7, align 8
  store ptr addrspace(4) %1, ptr addrspace(4) %8, align 8
  %12 = load ptr addrspace(4), ptr addrspace(4) %8, align 8
  %13 = call spir_func noundef i64 @_ZNKSt17integral_constantImLm0EEcvmEv(ptr addrspace(4) noundef align 1 dereferenceable_or_null(1) %9) #7
  call spir_func void @_ZZN4sycl3_V119local_accessor_baseIiLi2ELNS0_6access4modeE1026ELNS2_11placeholderE0EE6__initEPU3AS3iNS0_5rangeILi2EEES9_NS0_2idILi2EEEENKUlmE_clEm(ptr addrspace(4) noundef align 8 dereferenceable_or_null(16) %12, i64 noundef %13) #7
  %14 = load ptr addrspace(4), ptr addrspace(4) %8, align 8
  %15 = call spir_func noundef i64 @_ZNKSt17integral_constantImLm1EEcvmEv(ptr addrspace(4) noundef align 1 dereferenceable_or_null(1) %10) #7
  call spir_func void @_ZZN4sycl3_V119local_accessor_baseIiLi2ELNS0_6access4modeE1026ELNS2_11placeholderE0EE6__initEPU3AS3iNS0_5rangeILi2EEES9_NS0_2idILi2EEEENKUlmE_clEm(ptr addrspace(4) noundef align 8 dereferenceable_or_null(16) %14, i64 noundef %15) #7
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZZN4sycl3_V119local_accessor_baseIiLi2ELNS0_6access4modeE1026ELNS2_11placeholderE0EE6__initEPU3AS3iNS0_5rangeILi2EEES9_NS0_2idILi2EEEENKUlmE_clEm(ptr addrspace(4) noundef align 8 dereferenceable_or_null(16) %0, i64 noundef %1) #1 comdat align 2 !srcloc !90 {
  %3 = alloca ptr addrspace(4), align 8
  %4 = alloca i64, align 8
  %5 = addrspacecast ptr %3 to ptr addrspace(4)
  %6 = addrspacecast ptr %4 to ptr addrspace(4)
  store ptr addrspace(4) %0, ptr addrspace(4) %5, align 8
  store i64 %1, ptr addrspace(4) %6, align 8
  %7 = load ptr addrspace(4), ptr addrspace(4) %5, align 8
  %8 = getelementptr inbounds nuw %class._ZTSZN4sycl3_V119local_accessor_baseIiLi2ELNS0_6access4modeE1026ELNS2_11placeholderE0EE6__initEPU3AS3iNS0_5rangeILi2EEES9_NS0_2idILi2EEEEUlmE_, ptr addrspace(4) %7, i32 0, i32 0
  %9 = load ptr addrspace(4), ptr addrspace(4) %8, align 8
  %10 = getelementptr inbounds nuw %class._ZTSZN4sycl3_V119local_accessor_baseIiLi2ELNS0_6access4modeE1026ELNS2_11placeholderE0EE6__initEPU3AS3iNS0_5rangeILi2EEES9_NS0_2idILi2EEEEUlmE_, ptr addrspace(4) %7, i32 0, i32 1
  %11 = load ptr addrspace(4), ptr addrspace(4) %10, align 8
  %12 = load i64, ptr addrspace(4) %6, align 8
  %13 = trunc i64 %12 to i32
  %14 = call spir_func noundef align 8 dereferenceable(8) ptr addrspace(4) @_ZN4sycl3_V16detail5arrayILi2EEixEi(ptr addrspace(4) noundef align 8 dereferenceable_or_null(16) %11, i32 noundef %13) #7
  %15 = load i64, ptr addrspace(4) %14, align 8
  %16 = call spir_func noundef align 8 dereferenceable(16) ptr addrspace(4) @_ZN4sycl3_V119local_accessor_baseIiLi2ELNS0_6access4modeE1026ELNS2_11placeholderE0EE7getSizeEv(ptr addrspace(4) noundef align 8 dereferenceable_or_null(56) %9) #7
  %17 = load i64, ptr addrspace(4) %6, align 8
  %18 = trunc i64 %17 to i32
  %19 = call spir_func noundef align 8 dereferenceable(8) ptr addrspace(4) @_ZN4sycl3_V16detail5arrayILi2EEixEi(ptr addrspace(4) noundef align 8 dereferenceable_or_null(16) %16, i32 noundef %18) #7
  store i64 %15, ptr addrspace(4) %19, align 8
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef i64 @_ZNKSt17integral_constantImLm0EEcvmEv(ptr addrspace(4) noundef align 1 dereferenceable_or_null(1) %0) #1 comdat align 2 !srcloc !91 {
  %2 = alloca i64, align 8
  %3 = alloca ptr addrspace(4), align 8
  %4 = addrspacecast ptr %2 to ptr addrspace(4)
  %5 = addrspacecast ptr %3 to ptr addrspace(4)
  store ptr addrspace(4) %0, ptr addrspace(4) %5, align 8
  %6 = load ptr addrspace(4), ptr addrspace(4) %5, align 8
  ret i64 0
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef i64 @_ZNKSt17integral_constantImLm1EEcvmEv(ptr addrspace(4) noundef align 1 dereferenceable_or_null(1) %0) #1 comdat align 2 !srcloc !91 {
  %2 = alloca i64, align 8
  %3 = alloca ptr addrspace(4), align 8
  %4 = addrspacecast ptr %2 to ptr addrspace(4)
  %5 = addrspacecast ptr %3 to ptr addrspace(4)
  store ptr addrspace(4) %0, ptr addrspace(4) %5, align 8
  %6 = load ptr addrspace(4), ptr addrspace(4) %5, align 8
  ret i64 1
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef align 8 dereferenceable(16) ptr addrspace(4) @_ZN4sycl3_V119local_accessor_baseIiLi2ELNS0_6access4modeE1026ELNS2_11placeholderE0EE7getSizeEv(ptr addrspace(4) noundef align 8 dereferenceable_or_null(56) %0) #1 comdat align 2 !srcloc !92 {
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
define linkonce_odr dso_local spir_func void @_ZNK4sycl3_V119local_accessor_baseIiLi2ELNS0_6access4modeE1026ELNS2_11placeholderE0EEixILi2EvEENS0_6detail15accessor_commonIiLi2ELS3_1026ELNS2_6targetE2016ELS4_0ENS0_3ext6oneapi22accessor_property_listIJEEEE17AccessorSubscriptIXmiT_Li1EES5_EEm(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::detail::accessor_common<int, 2, sycl::_V1::access::mode::read_write, sycl::_V1::access::target::local, sycl::_V1::access::placeholder::false_t>::AccessorSubscript") align 8 %0, ptr addrspace(4) noundef align 8 dereferenceable_or_null(56) %1, i64 noundef %2) #1 comdat align 2 !srcloc !93 {
  %4 = alloca ptr addrspace(4), align 8
  %5 = alloca i64, align 8
  %6 = alloca %"class.sycl::_V1::local_accessor_base", align 8
  %7 = addrspacecast ptr %4 to ptr addrspace(4)
  %8 = addrspacecast ptr %5 to ptr addrspace(4)
  %9 = addrspacecast ptr %6 to ptr addrspace(4)
  store ptr addrspace(4) %1, ptr addrspace(4) %7, align 8
  store i64 %2, ptr addrspace(4) %8, align 8
  %10 = load ptr addrspace(4), ptr addrspace(4) %7, align 8
  call void @llvm.memcpy.p4.p4.i64(ptr addrspace(4) align 8 %9, ptr addrspace(4) align 8 %10, i64 56, i1 false)
  %11 = load i64, ptr addrspace(4) %8, align 8
  %12 = addrspacecast ptr addrspace(4) %9 to ptr
  call spir_func void @_ZN4sycl3_V16detail15accessor_commonIiLi2ELNS0_6access4modeE1026ELNS3_6targetE2016ELNS3_11placeholderE0ENS0_3ext6oneapi22accessor_property_listIJEEEE17AccessorSubscriptILi1ENS0_19local_accessor_baseIiLi2ELS4_1026ELS6_0EEEEC2ESE_m(ptr addrspace(4) noundef align 8 dereferenceable_or_null(72) %0, ptr noundef byval(%"class.sycl::_V1::local_accessor_base") align 8 %12, i64 noundef %11) #7
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef align 4 dereferenceable(4) ptr addrspace(4) @_ZNK4sycl3_V16detail15accessor_commonIiLi2ELNS0_6access4modeE1026ELNS3_6targetE2016ELNS3_11placeholderE0ENS0_3ext6oneapi22accessor_property_listIJEEEE17AccessorSubscriptILi1ENS0_19local_accessor_baseIiLi2ELS4_1026ELS6_0EEEEixILi1EvEERim(ptr addrspace(4) noundef align 8 dereferenceable_or_null(72) %0, i64 noundef %1) #1 comdat align 2 !srcloc !94 {
  %3 = alloca ptr addrspace(4), align 8
  %4 = alloca ptr addrspace(4), align 8
  %5 = alloca i64, align 8
  %6 = alloca %"class.sycl::_V1::id", align 8
  %7 = addrspacecast ptr %3 to ptr addrspace(4)
  %8 = addrspacecast ptr %4 to ptr addrspace(4)
  %9 = addrspacecast ptr %5 to ptr addrspace(4)
  %10 = addrspacecast ptr %6 to ptr addrspace(4)
  store ptr addrspace(4) %0, ptr addrspace(4) %8, align 8
  store i64 %1, ptr addrspace(4) %9, align 8
  %11 = load ptr addrspace(4), ptr addrspace(4) %8, align 8
  %12 = load i64, ptr addrspace(4) %9, align 8
  %13 = getelementptr inbounds nuw %"class.sycl::_V1::detail::accessor_common<int, 2, sycl::_V1::access::mode::read_write, sycl::_V1::access::target::local, sycl::_V1::access::placeholder::false_t>::AccessorSubscript", ptr addrspace(4) %11, i32 0, i32 0
  %14 = call spir_func noundef align 8 dereferenceable(8) ptr addrspace(4) @_ZN4sycl3_V16detail5arrayILi2EEixEi(ptr addrspace(4) noundef align 8 dereferenceable_or_null(16) %13, i32 noundef 1) #7
  store i64 %12, ptr addrspace(4) %14, align 8
  %15 = getelementptr inbounds nuw %"class.sycl::_V1::detail::accessor_common<int, 2, sycl::_V1::access::mode::read_write, sycl::_V1::access::target::local, sycl::_V1::access::placeholder::false_t>::AccessorSubscript", ptr addrspace(4) %11, i32 0, i32 1
  %16 = getelementptr inbounds nuw %"class.sycl::_V1::detail::accessor_common<int, 2, sycl::_V1::access::mode::read_write, sycl::_V1::access::target::local, sycl::_V1::access::placeholder::false_t>::AccessorSubscript", ptr addrspace(4) %11, i32 0, i32 0
  call void @llvm.memcpy.p4.p4.i64(ptr addrspace(4) align 8 %10, ptr addrspace(4) align 8 %16, i64 16, i1 false)
  %17 = addrspacecast ptr addrspace(4) %10 to ptr
  %18 = call spir_func noundef align 4 dereferenceable(4) ptr addrspace(4) @_ZNK4sycl3_V119local_accessor_baseIiLi2ELNS0_6access4modeE1026ELNS2_11placeholderE0EEixILi2EvEERiNS0_2idILi2EEE(ptr addrspace(4) noundef align 8 dereferenceable_or_null(56) %15, ptr noundef byval(%"class.sycl::_V1::id") align 8 %17) #7
  ret ptr addrspace(4) %18
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare float @llvm.fpbuiltin.fdiv.f32(float, float) #6

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZNK4sycl3_V17nd_itemILi2EE12get_local_idEv(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::id") align 8 %0, ptr addrspace(4) noundef align 1 dereferenceable_or_null(1) %1) #1 comdat align 2 !srcloc !95 {
  %3 = alloca ptr addrspace(4), align 8
  %4 = addrspacecast ptr %3 to ptr addrspace(4)
  store ptr addrspace(4) %1, ptr addrspace(4) %4, align 8
  %5 = load ptr addrspace(4), ptr addrspace(4) %4, align 8
  call spir_func void @_ZN7__spirv21initLocalInvocationIdILi2EN4sycl3_V12idILi2EEEEET0_v(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::id") align 8 %0) #7
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN4sycl3_V16detail15accessor_commonIiLi2ELNS0_6access4modeE1026ELNS3_6targetE2016ELNS3_11placeholderE0ENS0_3ext6oneapi22accessor_property_listIJEEEE17AccessorSubscriptILi1ENS0_19local_accessor_baseIiLi2ELS4_1026ELS6_0EEEEC2ESE_m(ptr addrspace(4) noundef align 8 dereferenceable_or_null(72) %0, ptr noundef byval(%"class.sycl::_V1::local_accessor_base") align 8 %1, i64 noundef %2) unnamed_addr #1 comdat align 2 !srcloc !96 {
  %4 = alloca ptr addrspace(4), align 8
  %5 = alloca ptr addrspace(4), align 8
  %6 = alloca i64, align 8
  %7 = addrspacecast ptr %4 to ptr addrspace(4)
  %8 = addrspacecast ptr %5 to ptr addrspace(4)
  %9 = addrspacecast ptr %6 to ptr addrspace(4)
  store ptr addrspace(4) %0, ptr addrspace(4) %7, align 8
  %10 = addrspacecast ptr %1 to ptr addrspace(4)
  store ptr addrspace(4) %10, ptr addrspace(4) %8, align 8
  store i64 %2, ptr addrspace(4) %9, align 8
  %11 = load ptr addrspace(4), ptr addrspace(4) %7, align 8
  %12 = getelementptr inbounds nuw %"class.sycl::_V1::detail::accessor_common<int, 2, sycl::_V1::access::mode::read_write, sycl::_V1::access::target::local, sycl::_V1::access::placeholder::false_t>::AccessorSubscript", ptr addrspace(4) %11, i32 0, i32 0
  call spir_func void @_ZN4sycl3_V12idILi2EEC2Ev(ptr addrspace(4) noundef align 8 dereferenceable_or_null(16) %12) #7
  %13 = getelementptr inbounds nuw %"class.sycl::_V1::detail::accessor_common<int, 2, sycl::_V1::access::mode::read_write, sycl::_V1::access::target::local, sycl::_V1::access::placeholder::false_t>::AccessorSubscript", ptr addrspace(4) %11, i32 0, i32 1
  call void @llvm.memcpy.p4.p4.i64(ptr addrspace(4) align 8 %13, ptr addrspace(4) align 8 %10, i64 56, i1 false)
  %14 = load i64, ptr addrspace(4) %9, align 8
  %15 = getelementptr inbounds nuw %"class.sycl::_V1::detail::accessor_common<int, 2, sycl::_V1::access::mode::read_write, sycl::_V1::access::target::local, sycl::_V1::access::placeholder::false_t>::AccessorSubscript", ptr addrspace(4) %11, i32 0, i32 0
  %16 = call spir_func noundef align 8 dereferenceable(8) ptr addrspace(4) @_ZN4sycl3_V16detail5arrayILi2EEixEi(ptr addrspace(4) noundef align 8 dereferenceable_or_null(16) %15, i32 noundef 0) #7
  store i64 %14, ptr addrspace(4) %16, align 8
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef align 4 dereferenceable(4) ptr addrspace(4) @_ZNK4sycl3_V119local_accessor_baseIiLi2ELNS0_6access4modeE1026ELNS2_11placeholderE0EEixILi2EvEERiNS0_2idILi2EEE(ptr addrspace(4) noundef align 8 dereferenceable_or_null(56) %0, ptr noundef byval(%"class.sycl::_V1::id") align 8 %1) #1 comdat align 2 !srcloc !97 {
  %3 = alloca ptr addrspace(4), align 8
  %4 = alloca ptr addrspace(4), align 8
  %5 = alloca ptr addrspace(4), align 8
  %6 = alloca i64, align 8
  %7 = alloca %"class.sycl::_V1::id", align 8
  %8 = addrspacecast ptr %3 to ptr addrspace(4)
  %9 = addrspacecast ptr %4 to ptr addrspace(4)
  %10 = addrspacecast ptr %5 to ptr addrspace(4)
  %11 = addrspacecast ptr %6 to ptr addrspace(4)
  %12 = addrspacecast ptr %7 to ptr addrspace(4)
  store ptr addrspace(4) %0, ptr addrspace(4) %9, align 8
  %13 = addrspacecast ptr %1 to ptr addrspace(4)
  store ptr addrspace(4) %13, ptr addrspace(4) %10, align 8
  %14 = load ptr addrspace(4), ptr addrspace(4) %9, align 8
  call void @llvm.memcpy.p4.p4.i64(ptr addrspace(4) align 8 %12, ptr addrspace(4) align 8 %13, i64 16, i1 false)
  %15 = addrspacecast ptr addrspace(4) %12 to ptr
  %16 = call spir_func noundef i64 @_ZNK4sycl3_V119local_accessor_baseIiLi2ELNS0_6access4modeE1026ELNS2_11placeholderE0EE14getLinearIndexILi2EEEmNS0_2idIXT_EEE(ptr addrspace(4) noundef align 8 dereferenceable_or_null(56) %14, ptr noundef byval(%"class.sycl::_V1::id") align 8 %15) #7
  store i64 %16, ptr addrspace(4) %11, align 8
  %17 = call spir_func noundef ptr addrspace(3) @_ZNK4sycl3_V119local_accessor_baseIiLi2ELNS0_6access4modeE1026ELNS2_11placeholderE0EE15getQualifiedPtrEv(ptr addrspace(4) noundef align 8 dereferenceable_or_null(56) %14) #7
  %18 = load i64, ptr addrspace(4) %11, align 8
  %19 = getelementptr inbounds nuw i32, ptr addrspace(3) %17, i64 %18
  %20 = addrspacecast ptr addrspace(3) %19 to ptr addrspace(4)
  ret ptr addrspace(4) %20
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef i64 @_ZNK4sycl3_V119local_accessor_baseIiLi2ELNS0_6access4modeE1026ELNS2_11placeholderE0EE14getLinearIndexILi2EEEmNS0_2idIXT_EEE(ptr addrspace(4) noundef align 8 dereferenceable_or_null(56) %0, ptr noundef byval(%"class.sycl::_V1::id") align 8 %1) #1 comdat align 2 !srcloc !98 {
  %3 = alloca i64, align 8
  %4 = alloca ptr addrspace(4), align 8
  %5 = alloca ptr addrspace(4), align 8
  %6 = alloca i64, align 8
  %7 = alloca %class._ZTSZNK4sycl3_V119local_accessor_baseIiLi2ELNS0_6access4modeE1026ELNS2_11placeholderE0EE14getLinearIndexILi2EEEmNS0_2idIXT_EEEEUlmE_, align 8
  %8 = addrspacecast ptr %3 to ptr addrspace(4)
  %9 = addrspacecast ptr %4 to ptr addrspace(4)
  %10 = addrspacecast ptr %5 to ptr addrspace(4)
  %11 = addrspacecast ptr %6 to ptr addrspace(4)
  %12 = addrspacecast ptr %7 to ptr addrspace(4)
  store ptr addrspace(4) %0, ptr addrspace(4) %9, align 8
  %13 = addrspacecast ptr %1 to ptr addrspace(4)
  store ptr addrspace(4) %13, ptr addrspace(4) %10, align 8
  %14 = load ptr addrspace(4), ptr addrspace(4) %9, align 8
  store i64 0, ptr addrspace(4) %11, align 8
  %15 = getelementptr inbounds nuw %class._ZTSZNK4sycl3_V119local_accessor_baseIiLi2ELNS0_6access4modeE1026ELNS2_11placeholderE0EE14getLinearIndexILi2EEEmNS0_2idIXT_EEEEUlmE_, ptr addrspace(4) %12, i32 0, i32 0
  store ptr addrspace(4) %14, ptr addrspace(4) %15, align 8
  %16 = getelementptr inbounds nuw %class._ZTSZNK4sycl3_V119local_accessor_baseIiLi2ELNS0_6access4modeE1026ELNS2_11placeholderE0EE14getLinearIndexILi2EEEmNS0_2idIXT_EEEEUlmE_, ptr addrspace(4) %12, i32 0, i32 1
  store ptr addrspace(4) %11, ptr addrspace(4) %16, align 8
  %17 = getelementptr inbounds nuw %class._ZTSZNK4sycl3_V119local_accessor_baseIiLi2ELNS0_6access4modeE1026ELNS2_11placeholderE0EE14getLinearIndexILi2EEEmNS0_2idIXT_EEEEUlmE_, ptr addrspace(4) %12, i32 0, i32 2
  store ptr addrspace(4) %13, ptr addrspace(4) %17, align 8
  call spir_func void @_ZN4sycl3_V16detail4loopILm2EZNKS0_19local_accessor_baseIiLi2ELNS0_6access4modeE1026ELNS4_11placeholderE0EE14getLinearIndexILi2EEEmNS0_2idIXT_EEEEUlmE_EEvOT0_(ptr addrspace(4) noundef align 8 dereferenceable(24) %12) #7
  %18 = load i64, ptr addrspace(4) %11, align 8
  ret i64 %18
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef ptr addrspace(3) @_ZNK4sycl3_V119local_accessor_baseIiLi2ELNS0_6access4modeE1026ELNS2_11placeholderE0EE15getQualifiedPtrEv(ptr addrspace(4) noundef align 8 dereferenceable_or_null(56) %0) #1 comdat align 2 !srcloc !99 {
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
define linkonce_odr dso_local spir_func void @_ZN4sycl3_V16detail4loopILm2EZNKS0_19local_accessor_baseIiLi2ELNS0_6access4modeE1026ELNS4_11placeholderE0EE14getLinearIndexILi2EEEmNS0_2idIXT_EEEEUlmE_EEvOT0_(ptr addrspace(4) noundef align 8 dereferenceable(24) %0) #1 comdat !srcloc !88 {
  %2 = alloca ptr addrspace(4), align 8
  %3 = alloca %"struct.std::integer_sequence", align 1
  %4 = addrspacecast ptr %2 to ptr addrspace(4)
  %5 = addrspacecast ptr %3 to ptr addrspace(4)
  store ptr addrspace(4) %0, ptr addrspace(4) %4, align 8
  %6 = load ptr addrspace(4), ptr addrspace(4) %4, align 8
  %7 = addrspacecast ptr addrspace(4) %5 to ptr
  call spir_func void @_ZN4sycl3_V16detail9loop_implIJLm0ELm1EEZNKS0_19local_accessor_baseIiLi2ELNS0_6access4modeE1026ELNS4_11placeholderE0EE14getLinearIndexILi2EEEmNS0_2idIXT_EEEEUlmE_EEvSt16integer_sequenceImJXspT_EEEOT0_(ptr noundef byval(%"struct.std::integer_sequence") align 1 %7, ptr addrspace(4) noundef align 8 dereferenceable(24) %6) #7
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN4sycl3_V16detail9loop_implIJLm0ELm1EEZNKS0_19local_accessor_baseIiLi2ELNS0_6access4modeE1026ELNS4_11placeholderE0EE14getLinearIndexILi2EEEmNS0_2idIXT_EEEEUlmE_EEvSt16integer_sequenceImJXspT_EEEOT0_(ptr noundef byval(%"struct.std::integer_sequence") align 1 %0, ptr addrspace(4) noundef align 8 dereferenceable(24) %1) #1 comdat !srcloc !89 {
  %3 = alloca ptr addrspace(4), align 8
  %4 = alloca ptr addrspace(4), align 8
  %5 = alloca %"struct.std::integral_constant", align 1
  %6 = alloca %"struct.std::integral_constant.2", align 1
  %7 = addrspacecast ptr %3 to ptr addrspace(4)
  %8 = addrspacecast ptr %4 to ptr addrspace(4)
  %9 = addrspacecast ptr %5 to ptr addrspace(4)
  %10 = addrspacecast ptr %6 to ptr addrspace(4)
  %11 = addrspacecast ptr %0 to ptr addrspace(4)
  store ptr addrspace(4) %11, ptr addrspace(4) %7, align 8
  store ptr addrspace(4) %1, ptr addrspace(4) %8, align 8
  %12 = load ptr addrspace(4), ptr addrspace(4) %8, align 8
  %13 = call spir_func noundef i64 @_ZNKSt17integral_constantImLm0EEcvmEv(ptr addrspace(4) noundef align 1 dereferenceable_or_null(1) %9) #7
  call spir_func void @_ZZNK4sycl3_V119local_accessor_baseIiLi2ELNS0_6access4modeE1026ELNS2_11placeholderE0EE14getLinearIndexILi2EEEmNS0_2idIXT_EEEENKUlmE_clEm(ptr addrspace(4) noundef align 8 dereferenceable_or_null(24) %12, i64 noundef %13) #7
  %14 = load ptr addrspace(4), ptr addrspace(4) %8, align 8
  %15 = call spir_func noundef i64 @_ZNKSt17integral_constantImLm1EEcvmEv(ptr addrspace(4) noundef align 1 dereferenceable_or_null(1) %10) #7
  call spir_func void @_ZZNK4sycl3_V119local_accessor_baseIiLi2ELNS0_6access4modeE1026ELNS2_11placeholderE0EE14getLinearIndexILi2EEEmNS0_2idIXT_EEEENKUlmE_clEm(ptr addrspace(4) noundef align 8 dereferenceable_or_null(24) %14, i64 noundef %15) #7
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZZNK4sycl3_V119local_accessor_baseIiLi2ELNS0_6access4modeE1026ELNS2_11placeholderE0EE14getLinearIndexILi2EEEmNS0_2idIXT_EEEENKUlmE_clEm(ptr addrspace(4) noundef align 8 dereferenceable_or_null(24) %0, i64 noundef %1) #1 comdat align 2 !srcloc !100 {
  %3 = alloca ptr addrspace(4), align 8
  %4 = alloca i64, align 8
  %5 = addrspacecast ptr %3 to ptr addrspace(4)
  %6 = addrspacecast ptr %4 to ptr addrspace(4)
  store ptr addrspace(4) %0, ptr addrspace(4) %5, align 8
  store i64 %1, ptr addrspace(4) %6, align 8
  %7 = load ptr addrspace(4), ptr addrspace(4) %5, align 8
  %8 = getelementptr inbounds nuw %class._ZTSZNK4sycl3_V119local_accessor_baseIiLi2ELNS0_6access4modeE1026ELNS2_11placeholderE0EE14getLinearIndexILi2EEEmNS0_2idIXT_EEEEUlmE_, ptr addrspace(4) %7, i32 0, i32 0
  %9 = load ptr addrspace(4), ptr addrspace(4) %8, align 8
  %10 = getelementptr inbounds nuw %class._ZTSZNK4sycl3_V119local_accessor_baseIiLi2ELNS0_6access4modeE1026ELNS2_11placeholderE0EE14getLinearIndexILi2EEEmNS0_2idIXT_EEEEUlmE_, ptr addrspace(4) %7, i32 0, i32 1
  %11 = load ptr addrspace(4), ptr addrspace(4) %10, align 8
  %12 = load i64, ptr addrspace(4) %11, align 8
  %13 = call spir_func noundef align 8 dereferenceable(16) ptr addrspace(4) @_ZNK4sycl3_V119local_accessor_baseIiLi2ELNS0_6access4modeE1026ELNS2_11placeholderE0EE7getSizeEv(ptr addrspace(4) noundef align 8 dereferenceable_or_null(56) %9) #7
  %14 = load i64, ptr addrspace(4) %6, align 8
  %15 = trunc i64 %14 to i32
  %16 = call spir_func noundef i64 @_ZNK4sycl3_V16detail5arrayILi2EEixEi(ptr addrspace(4) noundef align 8 dereferenceable_or_null(16) %13, i32 noundef %15) #7
  %17 = mul i64 %12, %16
  %18 = getelementptr inbounds nuw %class._ZTSZNK4sycl3_V119local_accessor_baseIiLi2ELNS0_6access4modeE1026ELNS2_11placeholderE0EE14getLinearIndexILi2EEEmNS0_2idIXT_EEEEUlmE_, ptr addrspace(4) %7, i32 0, i32 2
  %19 = load ptr addrspace(4), ptr addrspace(4) %18, align 8
  %20 = load i64, ptr addrspace(4) %6, align 8
  %21 = trunc i64 %20 to i32
  %22 = call spir_func noundef align 8 dereferenceable(8) ptr addrspace(4) @_ZN4sycl3_V16detail5arrayILi2EEixEi(ptr addrspace(4) noundef align 8 dereferenceable_or_null(16) %19, i32 noundef %21) #7
  %23 = load i64, ptr addrspace(4) %22, align 8
  %24 = add i64 %17, %23
  %25 = getelementptr inbounds nuw %class._ZTSZNK4sycl3_V119local_accessor_baseIiLi2ELNS0_6access4modeE1026ELNS2_11placeholderE0EE14getLinearIndexILi2EEEmNS0_2idIXT_EEEEUlmE_, ptr addrspace(4) %7, i32 0, i32 1
  %26 = load ptr addrspace(4), ptr addrspace(4) %25, align 8
  store i64 %24, ptr addrspace(4) %26, align 8
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef align 8 dereferenceable(16) ptr addrspace(4) @_ZNK4sycl3_V119local_accessor_baseIiLi2ELNS0_6access4modeE1026ELNS2_11placeholderE0EE7getSizeEv(ptr addrspace(4) noundef align 8 dereferenceable_or_null(56) %0) #1 comdat align 2 !srcloc !101 {
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
define linkonce_odr dso_local spir_func noundef i64 @_ZNK4sycl3_V16detail5arrayILi2EEixEi(ptr addrspace(4) noundef align 8 dereferenceable_or_null(16) %0, i32 noundef %1) #1 comdat align 2 !srcloc !102 {
  %3 = alloca ptr addrspace(4), align 8
  %4 = alloca i32, align 4
  %5 = alloca i64, align 8
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
  %19 = getelementptr inbounds [2 x i64], ptr addrspace(4) %16, i64 0, i64 %18
  %20 = load i64, ptr addrspace(4) %19, align 8
  ret i64 %20
}

declare dso_local spir_func i32 @_Z18__spirv_ocl_printfPU3AS2Kcz(ptr addrspace(2), ...)

attributes #0 = { convergent mustprogress noinline norecurse nounwind optnone "approx-func-fp-math"="true" "frame-pointer"="all" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "sycl-module-id"="/home/mdunlavy/GPU_FI/HeCBench/src/entropy-sycl/main.cpp" "sycl-optlevel"="0" "uniform-work-group-size"="true" "unsafe-fp-math"="true" }
attributes #1 = { convergent mustprogress noinline norecurse nounwind optnone "approx-func-fp-math"="true" "frame-pointer"="all" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "sycl-optlevel"="0" "unsafe-fp-math"="true" }
attributes #2 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }
attributes #3 = { convergent mustprogress noinline norecurse nounwind optnone "approx-func-fp-math"="true" "frame-pointer"="all" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "sycl-module-id"="/home/mdunlavy/GPU_FI/HeCBench/src/entropy-sycl/main.cpp" "sycl-optlevel"="0" "unsafe-fp-math"="true" }
attributes #4 = { convergent nounwind willreturn memory(none) "approx-func-fp-math"="true" "frame-pointer"="all" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="true" }
attributes #5 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #6 = { nocallback nofree nosync nounwind willreturn memory(none) }
attributes #7 = { convergent nounwind }
attributes #8 = { convergent nounwind willreturn memory(none) }
attributes #9 = { "fpbuiltin-max-error"="2.5" }

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
!6 = !{i32 2226}
!7 = !{i32 -1, i32 -1, i32 -1, i32 -1}
!8 = !{}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.mustprogress"}
!11 = distinct !{!11, !10}
!12 = distinct !{!12, !10}
!13 = distinct !{!13, !10}
!14 = !{i32 3391302}
!15 = !{i32 3387028}
!16 = !{i32 -2136822275}
!17 = !{i32 -2136832685}
!18 = !{i32 7583991}
!19 = !{i32 5567864}
!20 = !{i32 -2143752319}
!21 = !{i32 -2143753986}
!22 = !{i32 -2143752673}
!23 = !{i32 -2143752724}
!24 = !{i32 6001097}
!25 = !{i32 3719583}
!26 = !{i32 3719466}
!27 = !{i32 5566926}
!28 = !{i32 -2143755009}
!29 = !{i32 -2143749793}
!30 = !{i32 -2143747277}
!31 = !{i32 -2143742165}
!32 = !{i32 -2143744617}
!33 = !{i32 -2143735628}
!34 = !{i32 3387485}
!35 = !{i32 3388197}
!36 = !{i32 3388464}
!37 = !{i32 3388627}
!38 = !{i32 -2143756388}
!39 = !{i32 -2143755251}
!40 = !{i32 -2143755286}
!41 = !{i32 6014626}
!42 = !{i32 3719919}
!43 = !{i32 3719818}
!44 = !{i32 -2143751280}
!45 = !{i32 -2143750077}
!46 = !{i32 -2143750118}
!47 = !{i32 3720867}
!48 = !{i32 3720760}
!49 = !{i32 -2143748764}
!50 = !{i32 -2143747561}
!51 = !{i32 -2143747602}
!52 = !{i32 3720545}
!53 = !{i32 3720438}
!54 = !{i32 -2143743580}
!55 = !{i32 -2143742421}
!56 = !{i32 -2143742458}
!57 = !{i32 3721185}
!58 = !{i32 3721082}
!59 = !{i32 -2143746248}
!60 = !{i32 -2143744957}
!61 = !{i32 -2143745006}
!62 = !{i32 3721507}
!63 = !{i32 3721392}
!64 = !{i32 -2143737079}
!65 = !{i32 -2143735898}
!66 = !{i32 -2143735937}
!67 = !{i32 3720227}
!68 = !{i32 3720122}
!69 = !{i32 7545535}
!70 = !{i32 7555404}
!71 = !{i32 7555624}
!72 = !{i32 7604255}
!73 = !{i32 4022}
!74 = !{i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1}
!75 = !{i1 false, i1 false, i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false}
!76 = !{i32 3042297}
!77 = !{i32 3041663}
!78 = distinct !{!78, !10}
!79 = distinct !{!79, !10}
!80 = distinct !{!80, !10}
!81 = distinct !{!81, !10}
!82 = !{i32 3030998}
!83 = !{i32 5642532}
!84 = !{i32 2957500}
!85 = !{i32 6000468}
!86 = !{i32 5567106}
!87 = !{i32 3030356}
!88 = !{i32 3394946}
!89 = !{i32 3394784}
!90 = !{i32 3030527}
!91 = !{i32 1305832}
!92 = !{i32 3030236}
!93 = !{i32 3038447}
!94 = !{i32 2953327}
!95 = !{i32 7584923}
!96 = !{i32 2952765}
!97 = !{i32 3036864}
!98 = !{i32 3032513}
!99 = !{i32 3031131}
!100 = !{i32 3032604}
!101 = !{i32 3030306}
!102 = !{i32 5567974}
