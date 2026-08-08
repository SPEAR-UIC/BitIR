; ModuleID = '/lus/flare/projects/UIC-HPC/mdunlavy/GPU_FI_supplemental_dumps/intel_selected_mechanism_packets_continuation_20260724T162511Z/tmp/dense-embedding_site18_bit7_trial2/device.injected.bc'
source_filename = "main.cpp"
target datalayout = "e-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-n8:16:32:64-G1"
target triple = "spir64-unknown-unknown"

%class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi1EEEE_ = type { ptr addrspace(4), ptr addrspace(4), ptr addrspace(4), i32, ptr addrspace(4) }
%"class.sycl::_V1::nd_item" = type { i8 }
%"class.sycl::_V1::range" = type { %"class.sycl::_V1::detail::array" }
%"class.sycl::_V1::detail::array" = type { [1 x i64] }
%"class.sycl::_V1::id" = type { %"class.sycl::_V1::detail::array" }
%"class.sycl::_V1::group" = type { %"class.sycl::_V1::range", %"class.sycl::_V1::range", %"class.sycl::_V1::range", %"class.sycl::_V1::id" }
%"class.sycl::_V1::item" = type { %"struct.sycl::_V1::detail::ItemBase" }
%"struct.sycl::_V1::detail::ItemBase" = type { %"class.sycl::_V1::range", %"class.sycl::_V1::id", %"class.sycl::_V1::id" }
%"class.sycl::_V1::item.0" = type { %"struct.sycl::_V1::detail::ItemBase.1" }
%"struct.sycl::_V1::detail::ItemBase.1" = type { %"class.sycl::_V1::range", %"class.sycl::_V1::id" }
%class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE0_clES2_EUlNS0_7nd_itemILi1EEEE_ = type { ptr addrspace(4), ptr addrspace(4), ptr addrspace(4), i32, ptr addrspace(4) }
%class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE1_clES2_EUlNS0_7nd_itemILi1EEEE_ = type { ptr addrspace(4), ptr addrspace(4), ptr addrspace(4), i32, ptr addrspace(4) }

$_ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_E3de1 = comdat any

$_ZN4sycl3_V16detail7Builder10getElementILi1EEEKNS0_7nd_itemIXT_EEEPS5_ = comdat any

$_ZN4sycl3_V16detail7declptrINS0_7nd_itemILi1EEEEEPT_v = comdat any

$_Z11dense_esuhmIfEvRN4sycl3_V17nd_itemILi1EEEPKT_S7_PS5_iPKi = comdat any

$_ZNK4sycl3_V17nd_itemILi1EE15get_local_rangeEi = comdat any

$_ZNK4sycl3_V17nd_itemILi1EE12get_group_idEv = comdat any

$_ZN4sycl3_V16detail5arrayILi1EEixEi = comdat any

$_ZN7__spirv15initWorkgroupIdILi1EN4sycl3_V12idILi1EEEEET0_v = comdat any

$_ZN7__spirv22InitSizesSTWorkgroupIdILi1EN4sycl3_V12idILi1EEEE8initSizeEv = comdat any

$_ZN4sycl3_V12idILi1EEC2ILi1EEENSt9enable_ifIXeqT_Li1EEmE4typeE = comdat any

$_Z21__spirv_WorkgroupId_xv = comdat any

$_ZN4sycl3_V16detail5arrayILi1EEC2ILi1EEENSt9enable_ifIXeqT_Li1EEmE4typeE = comdat any

$_ZNK4sycl3_V17nd_itemILi1EE15get_local_rangeEv = comdat any

$_ZN7__spirv17initWorkgroupSizeILi1EN4sycl3_V15rangeILi1EEEEET0_v = comdat any

$_ZN7__spirv24InitSizesSTWorkgroupSizeILi1EN4sycl3_V15rangeILi1EEEE8initSizeEv = comdat any

$_ZN4sycl3_V15rangeILi1EEC2ILi1EEENSt9enable_ifIXeqT_Li1EEmE4typeE = comdat any

$_Z23__spirv_WorkgroupSize_xv = comdat any

$_ZNK4sycl3_V17nd_itemILi1EE12get_local_idEv = comdat any

$_ZN7__spirv21initLocalInvocationIdILi1EN4sycl3_V12idILi1EEEEET0_v = comdat any

$_ZN7__spirv28InitSizesSTLocalInvocationIdILi1EN4sycl3_V12idILi1EEEE8initSizeEv = comdat any

$_Z27__spirv_LocalInvocationId_xv = comdat any

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

$_ZTSZZ4mainENKUlRN4sycl3_V17handlerEE0_clES2_E3de2 = comdat any

$_Z12dense_esuhm2IfEvRN4sycl3_V17nd_itemILi1EEEPKT_S7_PS5_iPKi = comdat any

$_ZTSZZ4mainENKUlRN4sycl3_V17handlerEE1_clES2_E3de3 = comdat any

$_Z12dense_esuhm3IfEvRN4sycl3_V17nd_itemILi1EEEPKT_S7_PS5_iPKi = comdat any

@__spirv_BuiltInWorkgroupId = external dso_local addrspace(1) constant <3 x i64>, align 32
@__spirv_BuiltInWorkgroupSize = external dso_local addrspace(1) constant <3 x i64>, align 32
@__spirv_BuiltInLocalInvocationId = external dso_local addrspace(1) constant <3 x i64>, align 32
@__spirv_BuiltInGlobalSize = external dso_local addrspace(1) constant <3 x i64>, align 32
@__spirv_BuiltInNumWorkgroups = external dso_local addrspace(1) constant <3 x i64>, align 32
@__spirv_BuiltInGlobalInvocationId = external dso_local addrspace(1) constant <3 x i64>, align 32
@__spirv_BuiltInGlobalOffset = external dso_local addrspace(1) constant <3 x i64>, align 32

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define weak_odr dso_local spir_kernel void @_ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_E3de1(ptr addrspace(1) noundef align 4 %0, ptr addrspace(1) noundef align 4 %1, ptr addrspace(1) noundef align 4 %2, i32 noundef %3, ptr addrspace(1) noundef align 4 %4) #0 comdat !srcloc !6 !kernel_arg_buffer_location !7 !sycl_fixed_targets !8 {
  %6 = alloca ptr addrspace(1), align 8
  %7 = alloca ptr addrspace(1), align 8
  %8 = alloca ptr addrspace(1), align 8
  %9 = alloca i32, align 4
  %10 = alloca ptr addrspace(1), align 8
  %11 = alloca %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi1EEEE_, align 8
  %12 = alloca %"class.sycl::_V1::nd_item", align 1
  %13 = addrspacecast ptr %6 to ptr addrspace(4)
  %14 = addrspacecast ptr %7 to ptr addrspace(4)
  %15 = addrspacecast ptr %8 to ptr addrspace(4)
  %16 = addrspacecast ptr %9 to ptr addrspace(4)
  %17 = addrspacecast ptr %10 to ptr addrspace(4)
  %18 = addrspacecast ptr %11 to ptr addrspace(4)
  %19 = addrspacecast ptr %12 to ptr addrspace(4)
  store ptr addrspace(1) %0, ptr addrspace(4) %13, align 8
  store ptr addrspace(1) %1, ptr addrspace(4) %14, align 8
  store ptr addrspace(1) %2, ptr addrspace(4) %15, align 8
  store i32 %3, ptr addrspace(4) %16, align 4
  store ptr addrspace(1) %4, ptr addrspace(4) %17, align 8
  %20 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %18, i32 0, i32 0
  %21 = load ptr addrspace(1), ptr addrspace(4) %13, align 8
  %22 = addrspacecast ptr addrspace(1) %21 to ptr addrspace(4)
  store ptr addrspace(4) %22, ptr addrspace(4) %20, align 8
  %23 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %18, i32 0, i32 1
  %24 = load ptr addrspace(1), ptr addrspace(4) %14, align 8
  %25 = addrspacecast ptr addrspace(1) %24 to ptr addrspace(4)
  store ptr addrspace(4) %25, ptr addrspace(4) %23, align 8
  %26 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %18, i32 0, i32 2
  %27 = load ptr addrspace(1), ptr addrspace(4) %15, align 8
  %28 = addrspacecast ptr addrspace(1) %27 to ptr addrspace(4)
  store ptr addrspace(4) %28, ptr addrspace(4) %26, align 8
  %29 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %18, i32 0, i32 3
  %30 = load i32, ptr addrspace(4) %16, align 4
  store i32 %30, ptr addrspace(4) %29, align 8
  %31 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %18, i32 0, i32 4
  %32 = load ptr addrspace(1), ptr addrspace(4) %17, align 8
  %33 = addrspacecast ptr addrspace(1) %32 to ptr addrspace(4)
  store ptr addrspace(4) %33, ptr addrspace(4) %31, align 8
  %34 = call spir_func noundef ptr addrspace(4) @_ZN4sycl3_V16detail7declptrINS0_7nd_itemILi1EEEEEPT_v() #5
  call spir_func void @_ZN4sycl3_V16detail7Builder10getElementILi1EEEKNS0_7nd_itemIXT_EEEPS5_(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::nd_item") align 1 %19, ptr addrspace(4) noundef %34) #5
  %35 = addrspacecast ptr addrspace(4) %19 to ptr
  call spir_func void @_ZZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_ENKUlNS0_7nd_itemILi1EEEE_clES5_(ptr addrspace(4) noundef align 8 dereferenceable_or_null(40) %18, ptr noundef byval(%"class.sycl::_V1::nd_item") align 1 %35) #5
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define internal spir_func void @_ZZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_ENKUlNS0_7nd_itemILi1EEEE_clES5_(ptr addrspace(4) noundef align 8 dereferenceable_or_null(40) %0, ptr noundef byval(%"class.sycl::_V1::nd_item") align 1 %1) #1 align 2 !srcloc !6 {
  %3 = alloca ptr addrspace(4), align 8
  %4 = alloca ptr addrspace(4), align 8
  %5 = addrspacecast ptr %3 to ptr addrspace(4)
  %6 = addrspacecast ptr %4 to ptr addrspace(4)
  store ptr addrspace(4) %0, ptr addrspace(4) %5, align 8
  %7 = addrspacecast ptr %1 to ptr addrspace(4)
  store ptr addrspace(4) %7, ptr addrspace(4) %6, align 8
  %8 = load ptr addrspace(4), ptr addrspace(4) %5, align 8
  %9 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %8, i32 0, i32 0
  %10 = load ptr addrspace(4), ptr addrspace(4) %9, align 8
  %11 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %8, i32 0, i32 1
  %12 = load ptr addrspace(4), ptr addrspace(4) %11, align 8
  %13 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %8, i32 0, i32 2
  %14 = load ptr addrspace(4), ptr addrspace(4) %13, align 8
  %15 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %8, i32 0, i32 3
  %16 = load i32, ptr addrspace(4) %15, align 8
  %17 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %8, i32 0, i32 4
  %18 = load ptr addrspace(4), ptr addrspace(4) %17, align 8
  call spir_func void @_Z11dense_esuhmIfEvRN4sycl3_V17nd_itemILi1EEEPKT_S7_PS5_iPKi(ptr addrspace(4) noundef align 1 dereferenceable(1) %7, ptr addrspace(4) noundef %10, ptr addrspace(4) noundef %12, ptr addrspace(4) noundef %14, i32 noundef %16, ptr addrspace(4) noundef %18) #5
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN4sycl3_V16detail7Builder10getElementILi1EEEKNS0_7nd_itemIXT_EEEPS5_(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::nd_item") align 1 %0, ptr addrspace(4) noundef %1) #1 comdat align 2 !srcloc !9 {
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
  call spir_func void @_ZN7__spirv14initGlobalSizeILi1EN4sycl3_V15rangeILi1EEEEET0_v(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::range") align 8 %15) #5
  call spir_func void @_ZN7__spirv17initWorkgroupSizeILi1EN4sycl3_V15rangeILi1EEEEET0_v(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::range") align 8 %16) #5
  call spir_func void @_ZN7__spirv17initNumWorkgroupsILi1EN4sycl3_V15rangeILi1EEEEET0_v(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::range") align 8 %17) #5
  call spir_func void @_ZN7__spirv15initWorkgroupIdILi1EN4sycl3_V12idILi1EEEEET0_v(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::id") align 8 %18) #5
  call spir_func void @_ZN7__spirv22initGlobalInvocationIdILi1EN4sycl3_V12idILi1EEEEET0_v(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::id") align 8 %19) #5
  call spir_func void @_ZN7__spirv21initLocalInvocationIdILi1EN4sycl3_V12idILi1EEEEET0_v(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::id") align 8 %20) #5
  call spir_func void @_ZN7__spirv16initGlobalOffsetILi1EN4sycl3_V12idILi1EEEEET0_v(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::id") align 8 %21) #5
  call spir_func void @_ZN4sycl3_V16detail7Builder11createGroupILi1EEENS0_5groupIXT_EEERKNS0_5rangeIXT_EEES9_S9_RKNS0_2idIXT_EEE(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::group") align 8 %22, ptr addrspace(4) noundef align 8 dereferenceable(8) %15, ptr addrspace(4) noundef align 8 dereferenceable(8) %16, ptr addrspace(4) noundef align 8 dereferenceable(8) %17, ptr addrspace(4) noundef align 8 dereferenceable(8) %18) #5
  call spir_func void @_ZN4sycl3_V16detail7Builder10createItemILi1ELb1EEENSt9enable_ifIXT0_ENS0_4itemIXT_EXT0_EEEE4typeERKNS0_5rangeIXT_EEERKNS0_2idIXT_EEESG_(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::item") align 8 %23, ptr addrspace(4) noundef align 8 dereferenceable(8) %15, ptr addrspace(4) noundef align 8 dereferenceable(8) %19, ptr addrspace(4) noundef align 8 dereferenceable(8) %21) #5
  call spir_func void @_ZN4sycl3_V16detail7Builder10createItemILi1ELb0EEENSt9enable_ifIXntT0_ENS0_4itemIXT_EXT0_EEEE4typeERKNS0_5rangeIXT_EEERKNS0_2idIXT_EEE(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::item.0") align 8 %24, ptr addrspace(4) noundef align 8 dereferenceable(8) %16, ptr addrspace(4) noundef align 8 dereferenceable(8) %20) #5
  call spir_func void @_ZN4sycl3_V16detail7Builder12createNDItemILi1EEENS0_7nd_itemIXT_EEERKNS0_4itemIXT_ELb1EEERKNS6_IXT_ELb0EEERKNS0_5groupIXT_EEE(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::nd_item") align 1 %0, ptr addrspace(4) noundef align 8 dereferenceable(24) %23, ptr addrspace(4) noundef align 8 dereferenceable(16) %24, ptr addrspace(4) noundef align 8 dereferenceable(32) %22) #5
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef ptr addrspace(4) @_ZN4sycl3_V16detail7declptrINS0_7nd_itemILi1EEEEEPT_v() #1 comdat !srcloc !10 {
  %1 = alloca ptr addrspace(4), align 8
  %2 = addrspacecast ptr %1 to ptr addrspace(4)
  ret ptr addrspace(4) null
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_Z11dense_esuhmIfEvRN4sycl3_V17nd_itemILi1EEEPKT_S7_PS5_iPKi(ptr addrspace(4) noundef align 1 dereferenceable(1) %0, ptr addrspace(4) noundef %1, ptr addrspace(4) noundef %2, ptr addrspace(4) noundef %3, i32 noundef %4, ptr addrspace(4) noundef %5) #1 comdat !srcloc !11 {
  %7 = alloca i64, align 8
  %8 = alloca ptr addrspace(4), align 8
  %9 = alloca i32, align 4
  %10 = alloca i64, align 8
  %11 = alloca %"class.sycl::_V1::id", align 8
  %12 = alloca i64, align 8
  %13 = alloca ptr addrspace(4), align 8
  %14 = alloca i32, align 4
  %15 = alloca i64, align 8
  %16 = alloca %"class.sycl::_V1::id", align 8
  %17 = alloca ptr addrspace(4), align 8
  %18 = alloca ptr addrspace(4), align 8
  %19 = alloca ptr addrspace(4), align 8
  %20 = alloca ptr addrspace(4), align 8
  %21 = alloca i32, align 4
  %22 = alloca ptr addrspace(4), align 8
  %23 = alloca i32, align 4
  %24 = alloca i32, align 4
  %25 = alloca i32, align 4
  %26 = alloca i32, align 4
  %27 = alloca i32, align 4
  %28 = alloca float, align 4
  %29 = alloca i32, align 4
  %30 = addrspacecast ptr %17 to ptr addrspace(4)
  %31 = addrspacecast ptr %18 to ptr addrspace(4)
  %32 = addrspacecast ptr %19 to ptr addrspace(4)
  %33 = addrspacecast ptr %20 to ptr addrspace(4)
  %34 = addrspacecast ptr %21 to ptr addrspace(4)
  %35 = addrspacecast ptr %22 to ptr addrspace(4)
  %36 = addrspacecast ptr %23 to ptr addrspace(4)
  %37 = addrspacecast ptr %24 to ptr addrspace(4)
  %38 = addrspacecast ptr %25 to ptr addrspace(4)
  %39 = addrspacecast ptr %26 to ptr addrspace(4)
  %40 = addrspacecast ptr %27 to ptr addrspace(4)
  %41 = addrspacecast ptr %28 to ptr addrspace(4)
  %42 = addrspacecast ptr %29 to ptr addrspace(4)
  store ptr addrspace(4) %0, ptr addrspace(4) %30, align 8
  store ptr addrspace(4) %1, ptr addrspace(4) %31, align 8
  store ptr addrspace(4) %2, ptr addrspace(4) %32, align 8
  store ptr addrspace(4) %3, ptr addrspace(4) %33, align 8
  store i32 %4, ptr addrspace(4) %34, align 4
  store ptr addrspace(4) %5, ptr addrspace(4) %35, align 8
  %43 = load ptr addrspace(4), ptr addrspace(4) %30, align 8
  %44 = addrspacecast ptr %12 to ptr addrspace(4)
  %45 = addrspacecast ptr %13 to ptr addrspace(4)
  %46 = addrspacecast ptr %14 to ptr addrspace(4)
  %47 = addrspacecast ptr %15 to ptr addrspace(4)
  %48 = addrspacecast ptr %16 to ptr addrspace(4)
  store ptr addrspace(4) %43, ptr addrspace(4) %45, align 8
  store i32 0, ptr addrspace(4) %46, align 4
  %49 = load ptr addrspace(4), ptr addrspace(4) %45, align 8
  call spir_func void @_ZNK4sycl3_V17nd_itemILi1EE12get_group_idEv(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::id") align 8 %48, ptr addrspace(4) noundef align 1 dereferenceable_or_null(1) %49) #5
  %50 = load i32, ptr addrspace(4) %46, align 4
  %51 = call spir_func noundef align 8 dereferenceable(8) ptr addrspace(4) @_ZN4sycl3_V16detail5arrayILi1EEixEi(ptr addrspace(4) noundef align 8 dereferenceable_or_null(8) %48, i32 noundef %50) #5
  %52 = load i64, ptr addrspace(4) %51, align 8
  store i64 %52, ptr addrspace(4) %47, align 8
  %53 = load i64, ptr addrspace(4) %47, align 8
  %54 = icmp ule i64 %53, 2147483647
  call void @llvm.assume(i1 %54)
  %55 = load i64, ptr addrspace(4) %47, align 8
  %56 = trunc i64 %55 to i32
  store i32 %56, ptr addrspace(4) %36, align 4
  %57 = load ptr addrspace(4), ptr addrspace(4) %30, align 8
  %58 = call spir_func noundef i64 @_ZNK4sycl3_V17nd_itemILi1EE15get_local_rangeEi(ptr addrspace(4) noundef align 1 dereferenceable_or_null(1) %57, i32 noundef 0) #5
  %59 = trunc i64 %58 to i32
  store i32 %59, ptr addrspace(4) %37, align 4
  %60 = load ptr addrspace(4), ptr addrspace(4) %30, align 8
  %61 = addrspacecast ptr %7 to ptr addrspace(4)
  %62 = addrspacecast ptr %8 to ptr addrspace(4)
  %63 = addrspacecast ptr %9 to ptr addrspace(4)
  %64 = addrspacecast ptr %10 to ptr addrspace(4)
  %65 = addrspacecast ptr %11 to ptr addrspace(4)
  store ptr addrspace(4) %60, ptr addrspace(4) %62, align 8
  store i32 0, ptr addrspace(4) %63, align 4
  %66 = load ptr addrspace(4), ptr addrspace(4) %62, align 8
  call spir_func void @_ZNK4sycl3_V17nd_itemILi1EE12get_local_idEv(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::id") align 8 %65, ptr addrspace(4) noundef align 1 dereferenceable_or_null(1) %66) #5
  %67 = load i32, ptr addrspace(4) %63, align 4
  %68 = call spir_func noundef align 8 dereferenceable(8) ptr addrspace(4) @_ZN4sycl3_V16detail5arrayILi1EEixEi(ptr addrspace(4) noundef align 8 dereferenceable_or_null(8) %65, i32 noundef %67) #5
  %69 = load i64, ptr addrspace(4) %68, align 8
  store i64 %69, ptr addrspace(4) %64, align 8
  %70 = load i64, ptr addrspace(4) %64, align 8
  %71 = icmp ule i64 %70, 2147483647
  call void @llvm.assume(i1 %71)
  %72 = load i64, ptr addrspace(4) %64, align 8
  %73 = trunc i64 %72 to i32
  store i32 %73, ptr addrspace(4) %38, align 4
  %74 = load ptr addrspace(4), ptr addrspace(4) %35, align 8
  %75 = load i32, ptr addrspace(4) %36, align 4
  %76 = add nsw i32 %75, 1
  %fi_flip = xor i32 %76, 128
  %77 = sext i32 %fi_flip to i64
  %78 = getelementptr inbounds i32, ptr addrspace(4) %74, i64 %77
  %79 = load i32, ptr addrspace(4) %78, align 4
  %80 = load ptr addrspace(4), ptr addrspace(4) %35, align 8
  %81 = load i32, ptr addrspace(4) %36, align 4
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds i32, ptr addrspace(4) %80, i64 %82
  %84 = load i32, ptr addrspace(4) %83, align 4
  %85 = sub nsw i32 %79, %84
  store i32 %85, ptr addrspace(4) %39, align 4
  %86 = load i32, ptr addrspace(4) %38, align 4
  store i32 %86, ptr addrspace(4) %40, align 4
  br label %87

87:                                               ; preds = %135, %6
  %88 = load i32, ptr addrspace(4) %40, align 4
  %89 = load i32, ptr addrspace(4) %34, align 4
  %90 = icmp slt i32 %88, %89
  br i1 %90, label %91, label %139

91:                                               ; preds = %87
  %92 = load ptr addrspace(4), ptr addrspace(4) %32, align 8
  %93 = load i32, ptr addrspace(4) %36, align 4
  %94 = load i32, ptr addrspace(4) %34, align 4
  %95 = mul nsw i32 %93, %94
  %96 = load i32, ptr addrspace(4) %40, align 4
  %97 = add nsw i32 %95, %96
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds float, ptr addrspace(4) %92, i64 %98
  %100 = load float, ptr addrspace(4) %99, align 4
  store float %100, ptr addrspace(4) %41, align 4
  %101 = load i32, ptr addrspace(4) %40, align 4
  store i32 %101, ptr addrspace(4) %42, align 4
  br label %102

102:                                              ; preds = %130, %91
  %103 = load i32, ptr addrspace(4) %42, align 4
  %104 = load i32, ptr addrspace(4) %39, align 4
  %105 = icmp slt i32 %103, %104
  br i1 %105, label %106, label %134

106:                                              ; preds = %102
  %107 = load ptr addrspace(4), ptr addrspace(4) %31, align 8
  %108 = load ptr addrspace(4), ptr addrspace(4) %35, align 8
  %109 = load i32, ptr addrspace(4) %36, align 4
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds i32, ptr addrspace(4) %108, i64 %110
  %112 = load i32, ptr addrspace(4) %111, align 4
  %113 = load i32, ptr addrspace(4) %42, align 4
  %114 = add nsw i32 %112, %113
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds float, ptr addrspace(4) %107, i64 %115
  %117 = load float, ptr addrspace(4) %116, align 4
  %118 = load float, ptr addrspace(4) %41, align 4
  %119 = fadd reassoc nsz arcp contract afn float %117, %118
  %120 = load ptr addrspace(4), ptr addrspace(4) %33, align 8
  %121 = load ptr addrspace(4), ptr addrspace(4) %35, align 8
  %122 = load i32, ptr addrspace(4) %36, align 4
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds i32, ptr addrspace(4) %121, i64 %123
  %125 = load i32, ptr addrspace(4) %124, align 4
  %126 = load i32, ptr addrspace(4) %42, align 4
  %127 = add nsw i32 %125, %126
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds float, ptr addrspace(4) %120, i64 %128
  store float %119, ptr addrspace(4) %129, align 4
  br label %130

130:                                              ; preds = %106
  %131 = load i32, ptr addrspace(4) %34, align 4
  %132 = load i32, ptr addrspace(4) %42, align 4
  %133 = add nsw i32 %132, %131
  store i32 %133, ptr addrspace(4) %42, align 4
  br label %102, !llvm.loop !12

134:                                              ; preds = %102
  br label %135

135:                                              ; preds = %134
  %136 = load i32, ptr addrspace(4) %37, align 4
  %137 = load i32, ptr addrspace(4) %40, align 4
  %138 = add nsw i32 %137, %136
  store i32 %138, ptr addrspace(4) %40, align 4
  br label %87, !llvm.loop !14

139:                                              ; preds = %87
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef i64 @_ZNK4sycl3_V17nd_itemILi1EE15get_local_rangeEi(ptr addrspace(4) noundef align 1 dereferenceable_or_null(1) %0, i32 noundef %1) #1 comdat align 2 !srcloc !15 {
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
  call spir_func void @_ZNK4sycl3_V17nd_itemILi1EE15get_local_rangeEv(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::range") align 8 %12, ptr addrspace(4) noundef align 1 dereferenceable_or_null(1) %13) #5
  %14 = load i32, ptr addrspace(4) %10, align 4
  %15 = call spir_func noundef align 8 dereferenceable(8) ptr addrspace(4) @_ZN4sycl3_V16detail5arrayILi1EEixEi(ptr addrspace(4) noundef align 8 dereferenceable_or_null(8) %12, i32 noundef %14) #5
  %16 = load i64, ptr addrspace(4) %15, align 8
  store i64 %16, ptr addrspace(4) %11, align 8
  %17 = load i64, ptr addrspace(4) %11, align 8
  %18 = icmp ule i64 %17, 2147483647
  call void @llvm.assume(i1 %18)
  %19 = load i64, ptr addrspace(4) %11, align 8
  ret i64 %19
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZNK4sycl3_V17nd_itemILi1EE12get_group_idEv(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::id") align 8 %0, ptr addrspace(4) noundef align 1 dereferenceable_or_null(1) %1) #1 comdat align 2 !srcloc !16 {
  %3 = alloca ptr addrspace(4), align 8
  %4 = addrspacecast ptr %3 to ptr addrspace(4)
  store ptr addrspace(4) %1, ptr addrspace(4) %4, align 8
  %5 = load ptr addrspace(4), ptr addrspace(4) %4, align 8
  call spir_func void @_ZN7__spirv15initWorkgroupIdILi1EN4sycl3_V12idILi1EEEEET0_v(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::id") align 8 %0) #5
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef align 8 dereferenceable(8) ptr addrspace(4) @_ZN4sycl3_V16detail5arrayILi1EEixEi(ptr addrspace(4) noundef align 8 dereferenceable_or_null(8) %0, i32 noundef %1) #1 comdat align 2 !srcloc !17 {
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

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #2

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN7__spirv15initWorkgroupIdILi1EN4sycl3_V12idILi1EEEEET0_v(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::id") align 8 %0) #1 comdat !srcloc !18 {
  call spir_func void @_ZN7__spirv22InitSizesSTWorkgroupIdILi1EN4sycl3_V12idILi1EEEE8initSizeEv(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::id") align 8 %0) #5
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN7__spirv22InitSizesSTWorkgroupIdILi1EN4sycl3_V12idILi1EEEE8initSizeEv(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::id") align 8 %0) #1 comdat align 2 !srcloc !19 {
  %2 = call spir_func noundef i64 @_ZN7__spirv14getWorkgroupIdILi0EEEmv() #5
  call spir_func void @_ZN4sycl3_V12idILi1EEC2ILi1EEENSt9enable_ifIXeqT_Li1EEmE4typeE(ptr addrspace(4) noundef align 8 dereferenceable_or_null(8) %0, i64 noundef %2) #5
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef i64 @_ZN7__spirv14getWorkgroupIdILi0EEEmv() #1 !srcloc !20 {
  %1 = alloca i64, align 8
  %2 = addrspacecast ptr %1 to ptr addrspace(4)
  %3 = call spir_func noundef i64 @_Z21__spirv_WorkgroupId_xv() #5
  ret i64 %3
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN4sycl3_V12idILi1EEC2ILi1EEENSt9enable_ifIXeqT_Li1EEmE4typeE(ptr addrspace(4) noundef align 8 dereferenceable_or_null(8) %0, i64 noundef %1) unnamed_addr #1 comdat align 2 !srcloc !21 {
  %3 = alloca ptr addrspace(4), align 8
  %4 = alloca i64, align 8
  %5 = addrspacecast ptr %3 to ptr addrspace(4)
  %6 = addrspacecast ptr %4 to ptr addrspace(4)
  store ptr addrspace(4) %0, ptr addrspace(4) %5, align 8
  store i64 %1, ptr addrspace(4) %6, align 8
  %7 = load ptr addrspace(4), ptr addrspace(4) %5, align 8
  %8 = load i64, ptr addrspace(4) %6, align 8
  call spir_func void @_ZN4sycl3_V16detail5arrayILi1EEC2ILi1EEENSt9enable_ifIXeqT_Li1EEmE4typeE(ptr addrspace(4) noundef align 8 dereferenceable_or_null(8) %7, i64 noundef %8) #5
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef i64 @_Z21__spirv_WorkgroupId_xv() #3 comdat !srcloc !22 {
  %1 = alloca i64, align 8
  %2 = addrspacecast ptr %1 to ptr addrspace(4)
  %3 = load <3 x i64>, ptr addrspace(4) addrspacecast (ptr addrspace(1) @__spirv_BuiltInWorkgroupId to ptr addrspace(4)), align 32
  %4 = extractelement <3 x i64> %3, i64 0
  ret i64 %4
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN4sycl3_V16detail5arrayILi1EEC2ILi1EEENSt9enable_ifIXeqT_Li1EEmE4typeE(ptr addrspace(4) noundef align 8 dereferenceable_or_null(8) %0, i64 noundef %1) unnamed_addr #1 comdat align 2 !srcloc !23 {
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
define linkonce_odr dso_local spir_func void @_ZNK4sycl3_V17nd_itemILi1EE15get_local_rangeEv(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::range") align 8 %0, ptr addrspace(4) noundef align 1 dereferenceable_or_null(1) %1) #1 comdat align 2 !srcloc !24 {
  %3 = alloca ptr addrspace(4), align 8
  %4 = addrspacecast ptr %3 to ptr addrspace(4)
  store ptr addrspace(4) %1, ptr addrspace(4) %4, align 8
  %5 = load ptr addrspace(4), ptr addrspace(4) %4, align 8
  call spir_func void @_ZN7__spirv17initWorkgroupSizeILi1EN4sycl3_V15rangeILi1EEEEET0_v(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::range") align 8 %0) #5
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN7__spirv17initWorkgroupSizeILi1EN4sycl3_V15rangeILi1EEEEET0_v(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::range") align 8 %0) #1 comdat !srcloc !25 {
  call spir_func void @_ZN7__spirv24InitSizesSTWorkgroupSizeILi1EN4sycl3_V15rangeILi1EEEE8initSizeEv(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::range") align 8 %0) #5
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN7__spirv24InitSizesSTWorkgroupSizeILi1EN4sycl3_V15rangeILi1EEEE8initSizeEv(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::range") align 8 %0) #1 comdat align 2 !srcloc !26 {
  %2 = call spir_func noundef i64 @_ZN7__spirv16getWorkgroupSizeILi0EEEmv() #5
  call spir_func void @_ZN4sycl3_V15rangeILi1EEC2ILi1EEENSt9enable_ifIXeqT_Li1EEmE4typeE(ptr addrspace(4) noundef align 8 dereferenceable_or_null(8) %0, i64 noundef %2) #5
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef i64 @_ZN7__spirv16getWorkgroupSizeILi0EEEmv() #1 !srcloc !27 {
  %1 = alloca i64, align 8
  %2 = addrspacecast ptr %1 to ptr addrspace(4)
  %3 = call spir_func noundef i64 @_Z23__spirv_WorkgroupSize_xv() #5
  ret i64 %3
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN4sycl3_V15rangeILi1EEC2ILi1EEENSt9enable_ifIXeqT_Li1EEmE4typeE(ptr addrspace(4) noundef align 8 dereferenceable_or_null(8) %0, i64 noundef %1) unnamed_addr #1 comdat align 2 !srcloc !28 {
  %3 = alloca ptr addrspace(4), align 8
  %4 = alloca i64, align 8
  %5 = addrspacecast ptr %3 to ptr addrspace(4)
  %6 = addrspacecast ptr %4 to ptr addrspace(4)
  store ptr addrspace(4) %0, ptr addrspace(4) %5, align 8
  store i64 %1, ptr addrspace(4) %6, align 8
  %7 = load ptr addrspace(4), ptr addrspace(4) %5, align 8
  %8 = load i64, ptr addrspace(4) %6, align 8
  call spir_func void @_ZN4sycl3_V16detail5arrayILi1EEC2ILi1EEENSt9enable_ifIXeqT_Li1EEmE4typeE(ptr addrspace(4) noundef align 8 dereferenceable_or_null(8) %7, i64 noundef %8) #5
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef i64 @_Z23__spirv_WorkgroupSize_xv() #3 comdat !srcloc !29 {
  %1 = alloca i64, align 8
  %2 = addrspacecast ptr %1 to ptr addrspace(4)
  %3 = load <3 x i64>, ptr addrspace(4) addrspacecast (ptr addrspace(1) @__spirv_BuiltInWorkgroupSize to ptr addrspace(4)), align 32
  %4 = extractelement <3 x i64> %3, i64 0
  ret i64 %4
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZNK4sycl3_V17nd_itemILi1EE12get_local_idEv(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::id") align 8 %0, ptr addrspace(4) noundef align 1 dereferenceable_or_null(1) %1) #1 comdat align 2 !srcloc !30 {
  %3 = alloca ptr addrspace(4), align 8
  %4 = addrspacecast ptr %3 to ptr addrspace(4)
  store ptr addrspace(4) %1, ptr addrspace(4) %4, align 8
  %5 = load ptr addrspace(4), ptr addrspace(4) %4, align 8
  call spir_func void @_ZN7__spirv21initLocalInvocationIdILi1EN4sycl3_V12idILi1EEEEET0_v(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::id") align 8 %0) #5
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN7__spirv21initLocalInvocationIdILi1EN4sycl3_V12idILi1EEEEET0_v(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::id") align 8 %0) #1 comdat !srcloc !31 {
  call spir_func void @_ZN7__spirv28InitSizesSTLocalInvocationIdILi1EN4sycl3_V12idILi1EEEE8initSizeEv(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::id") align 8 %0) #5
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN7__spirv28InitSizesSTLocalInvocationIdILi1EN4sycl3_V12idILi1EEEE8initSizeEv(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::id") align 8 %0) #1 comdat align 2 !srcloc !32 {
  %2 = call spir_func noundef i64 @_ZN7__spirv20getLocalInvocationIdILi0EEEmv() #5
  call spir_func void @_ZN4sycl3_V12idILi1EEC2ILi1EEENSt9enable_ifIXeqT_Li1EEmE4typeE(ptr addrspace(4) noundef align 8 dereferenceable_or_null(8) %0, i64 noundef %2) #5
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef i64 @_ZN7__spirv20getLocalInvocationIdILi0EEEmv() #1 !srcloc !33 {
  %1 = alloca i64, align 8
  %2 = addrspacecast ptr %1 to ptr addrspace(4)
  %3 = call spir_func noundef i64 @_Z27__spirv_LocalInvocationId_xv() #5
  ret i64 %3
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef i64 @_Z27__spirv_LocalInvocationId_xv() #3 comdat !srcloc !34 {
  %1 = alloca i64, align 8
  %2 = addrspacecast ptr %1 to ptr addrspace(4)
  %3 = load <3 x i64>, ptr addrspace(4) addrspacecast (ptr addrspace(1) @__spirv_BuiltInLocalInvocationId to ptr addrspace(4)), align 32
  %4 = extractelement <3 x i64> %3, i64 0
  ret i64 %4
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN7__spirv14initGlobalSizeILi1EN4sycl3_V15rangeILi1EEEEET0_v(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::range") align 8 %0) #1 comdat !srcloc !35 {
  call spir_func void @_ZN7__spirv21InitSizesSTGlobalSizeILi1EN4sycl3_V15rangeILi1EEEE8initSizeEv(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::range") align 8 %0) #5
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN7__spirv17initNumWorkgroupsILi1EN4sycl3_V15rangeILi1EEEEET0_v(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::range") align 8 %0) #1 comdat !srcloc !36 {
  call spir_func void @_ZN7__spirv24InitSizesSTNumWorkgroupsILi1EN4sycl3_V15rangeILi1EEEE8initSizeEv(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::range") align 8 %0) #5
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN7__spirv22initGlobalInvocationIdILi1EN4sycl3_V12idILi1EEEEET0_v(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::id") align 8 %0) #1 comdat !srcloc !37 {
  call spir_func void @_ZN7__spirv29InitSizesSTGlobalInvocationIdILi1EN4sycl3_V12idILi1EEEE8initSizeEv(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::id") align 8 %0) #5
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN7__spirv16initGlobalOffsetILi1EN4sycl3_V12idILi1EEEEET0_v(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::id") align 8 %0) #1 comdat !srcloc !38 {
  call spir_func void @_ZN7__spirv23InitSizesSTGlobalOffsetILi1EN4sycl3_V12idILi1EEEE8initSizeEv(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::id") align 8 %0) #5
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN4sycl3_V16detail7Builder11createGroupILi1EEENS0_5groupIXT_EEERKNS0_5rangeIXT_EEES9_S9_RKNS0_2idIXT_EEE(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::group") align 8 %0, ptr addrspace(4) noundef align 8 dereferenceable(8) %1, ptr addrspace(4) noundef align 8 dereferenceable(8) %2, ptr addrspace(4) noundef align 8 dereferenceable(8) %3, ptr addrspace(4) noundef align 8 dereferenceable(8) %4) #1 comdat align 2 !srcloc !39 {
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
  call spir_func void @_ZN4sycl3_V15groupILi1EEC2ERKNS0_5rangeILi1EEES6_S4_RKNS0_2idILi1EEE(ptr addrspace(4) noundef align 8 dereferenceable_or_null(32) %0, ptr addrspace(4) noundef align 8 dereferenceable(8) %16, ptr addrspace(4) noundef align 8 dereferenceable(8) %17, ptr noundef byval(%"class.sycl::_V1::range") align 8 %20, ptr addrspace(4) noundef align 8 dereferenceable(8) %19) #5
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN4sycl3_V16detail7Builder10createItemILi1ELb1EEENSt9enable_ifIXT0_ENS0_4itemIXT_EXT0_EEEE4typeERKNS0_5rangeIXT_EEERKNS0_2idIXT_EEESG_(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::item") align 8 %0, ptr addrspace(4) noundef align 8 dereferenceable(8) %1, ptr addrspace(4) noundef align 8 dereferenceable(8) %2, ptr addrspace(4) noundef align 8 dereferenceable(8) %3) #1 comdat align 2 !srcloc !40 {
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
  call spir_func void @_ZN4sycl3_V14itemILi1ELb1EEC2ILb1EEERNSt9enable_ifIXT_EKNS0_5rangeILi1EEEE4typeERKNS0_2idILi1EEESE_(ptr addrspace(4) noundef align 8 dereferenceable_or_null(24) %0, ptr addrspace(4) noundef align 8 dereferenceable(8) %11, ptr addrspace(4) noundef align 8 dereferenceable(8) %12, ptr addrspace(4) noundef align 8 dereferenceable(8) %13) #5
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN4sycl3_V16detail7Builder10createItemILi1ELb0EEENSt9enable_ifIXntT0_ENS0_4itemIXT_EXT0_EEEE4typeERKNS0_5rangeIXT_EEERKNS0_2idIXT_EEE(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::item.0") align 8 %0, ptr addrspace(4) noundef align 8 dereferenceable(8) %1, ptr addrspace(4) noundef align 8 dereferenceable(8) %2) #1 comdat align 2 !srcloc !41 {
  %4 = alloca ptr addrspace(4), align 8
  %5 = alloca ptr addrspace(4), align 8
  %6 = addrspacecast ptr %4 to ptr addrspace(4)
  %7 = addrspacecast ptr %5 to ptr addrspace(4)
  store ptr addrspace(4) %1, ptr addrspace(4) %6, align 8
  store ptr addrspace(4) %2, ptr addrspace(4) %7, align 8
  %8 = load ptr addrspace(4), ptr addrspace(4) %6, align 8
  %9 = load ptr addrspace(4), ptr addrspace(4) %7, align 8
  call spir_func void @_ZN4sycl3_V14itemILi1ELb0EEC2ILb0EEERNSt9enable_ifIXntT_EKNS0_5rangeILi1EEEE4typeERKNS0_2idILi1EEE(ptr addrspace(4) noundef align 8 dereferenceable_or_null(16) %0, ptr addrspace(4) noundef align 8 dereferenceable(8) %8, ptr addrspace(4) noundef align 8 dereferenceable(8) %9) #5
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN4sycl3_V16detail7Builder12createNDItemILi1EEENS0_7nd_itemIXT_EEERKNS0_4itemIXT_ELb1EEERKNS6_IXT_ELb0EEERKNS0_5groupIXT_EEE(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::nd_item") align 1 %0, ptr addrspace(4) noundef align 8 dereferenceable(24) %1, ptr addrspace(4) noundef align 8 dereferenceable(16) %2, ptr addrspace(4) noundef align 8 dereferenceable(32) %3) #1 comdat align 2 !srcloc !42 {
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
  call spir_func void @_ZN4sycl3_V17nd_itemILi1EEC2ERKNS0_4itemILi1ELb1EEERKNS3_ILi1ELb0EEERKNS0_5groupILi1EEE(ptr addrspace(4) noundef align 1 dereferenceable_or_null(1) %0, ptr addrspace(4) noundef align 8 dereferenceable(24) %11, ptr addrspace(4) noundef align 8 dereferenceable(16) %12, ptr addrspace(4) noundef align 8 dereferenceable(32) %13) #5
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN7__spirv21InitSizesSTGlobalSizeILi1EN4sycl3_V15rangeILi1EEEE8initSizeEv(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::range") align 8 %0) #1 comdat align 2 !srcloc !43 {
  %2 = call spir_func noundef i64 @_ZN7__spirv13getGlobalSizeILi0EEEmv() #5
  call spir_func void @_ZN4sycl3_V15rangeILi1EEC2ILi1EEENSt9enable_ifIXeqT_Li1EEmE4typeE(ptr addrspace(4) noundef align 8 dereferenceable_or_null(8) %0, i64 noundef %2) #5
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef i64 @_ZN7__spirv13getGlobalSizeILi0EEEmv() #1 !srcloc !44 {
  %1 = alloca i64, align 8
  %2 = addrspacecast ptr %1 to ptr addrspace(4)
  %3 = call spir_func noundef i64 @_Z20__spirv_GlobalSize_xv() #5
  ret i64 %3
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef i64 @_Z20__spirv_GlobalSize_xv() #3 comdat !srcloc !45 {
  %1 = alloca i64, align 8
  %2 = addrspacecast ptr %1 to ptr addrspace(4)
  %3 = load <3 x i64>, ptr addrspace(4) addrspacecast (ptr addrspace(1) @__spirv_BuiltInGlobalSize to ptr addrspace(4)), align 32
  %4 = extractelement <3 x i64> %3, i64 0
  ret i64 %4
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN7__spirv24InitSizesSTNumWorkgroupsILi1EN4sycl3_V15rangeILi1EEEE8initSizeEv(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::range") align 8 %0) #1 comdat align 2 !srcloc !46 {
  %2 = call spir_func noundef i64 @_ZN7__spirv16getNumWorkgroupsILi0EEEmv() #5
  call spir_func void @_ZN4sycl3_V15rangeILi1EEC2ILi1EEENSt9enable_ifIXeqT_Li1EEmE4typeE(ptr addrspace(4) noundef align 8 dereferenceable_or_null(8) %0, i64 noundef %2) #5
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef i64 @_ZN7__spirv16getNumWorkgroupsILi0EEEmv() #1 !srcloc !47 {
  %1 = alloca i64, align 8
  %2 = addrspacecast ptr %1 to ptr addrspace(4)
  %3 = call spir_func noundef i64 @_Z23__spirv_NumWorkgroups_xv() #5
  ret i64 %3
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef i64 @_Z23__spirv_NumWorkgroups_xv() #3 comdat !srcloc !48 {
  %1 = alloca i64, align 8
  %2 = addrspacecast ptr %1 to ptr addrspace(4)
  %3 = load <3 x i64>, ptr addrspace(4) addrspacecast (ptr addrspace(1) @__spirv_BuiltInNumWorkgroups to ptr addrspace(4)), align 32
  %4 = extractelement <3 x i64> %3, i64 0
  ret i64 %4
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN7__spirv29InitSizesSTGlobalInvocationIdILi1EN4sycl3_V12idILi1EEEE8initSizeEv(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::id") align 8 %0) #1 comdat align 2 !srcloc !49 {
  %2 = call spir_func noundef i64 @_ZN7__spirv21getGlobalInvocationIdILi0EEEmv() #5
  call spir_func void @_ZN4sycl3_V12idILi1EEC2ILi1EEENSt9enable_ifIXeqT_Li1EEmE4typeE(ptr addrspace(4) noundef align 8 dereferenceable_or_null(8) %0, i64 noundef %2) #5
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef i64 @_ZN7__spirv21getGlobalInvocationIdILi0EEEmv() #1 !srcloc !50 {
  %1 = alloca i64, align 8
  %2 = addrspacecast ptr %1 to ptr addrspace(4)
  %3 = call spir_func noundef i64 @_Z28__spirv_GlobalInvocationId_xv() #5
  ret i64 %3
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef i64 @_Z28__spirv_GlobalInvocationId_xv() #3 comdat !srcloc !51 {
  %1 = alloca i64, align 8
  %2 = addrspacecast ptr %1 to ptr addrspace(4)
  %3 = load <3 x i64>, ptr addrspace(4) addrspacecast (ptr addrspace(1) @__spirv_BuiltInGlobalInvocationId to ptr addrspace(4)), align 32
  %4 = extractelement <3 x i64> %3, i64 0
  ret i64 %4
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN7__spirv23InitSizesSTGlobalOffsetILi1EN4sycl3_V12idILi1EEEE8initSizeEv(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::id") align 8 %0) #1 comdat align 2 !srcloc !52 {
  %2 = call spir_func noundef i64 @_ZN7__spirv15getGlobalOffsetILi0EEEmv() #5
  call spir_func void @_ZN4sycl3_V12idILi1EEC2ILi1EEENSt9enable_ifIXeqT_Li1EEmE4typeE(ptr addrspace(4) noundef align 8 dereferenceable_or_null(8) %0, i64 noundef %2) #5
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef i64 @_ZN7__spirv15getGlobalOffsetILi0EEEmv() #1 !srcloc !53 {
  %1 = alloca i64, align 8
  %2 = addrspacecast ptr %1 to ptr addrspace(4)
  %3 = call spir_func noundef i64 @_Z22__spirv_GlobalOffset_xv() #5
  ret i64 %3
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef i64 @_Z22__spirv_GlobalOffset_xv() #3 comdat !srcloc !54 {
  %1 = alloca i64, align 8
  %2 = addrspacecast ptr %1 to ptr addrspace(4)
  %3 = load <3 x i64>, ptr addrspace(4) addrspacecast (ptr addrspace(1) @__spirv_BuiltInGlobalOffset to ptr addrspace(4)), align 32
  %4 = extractelement <3 x i64> %3, i64 0
  ret i64 %4
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p4.p4.i64(ptr addrspace(4) noalias writeonly captures(none), ptr addrspace(4) noalias readonly captures(none), i64, i1 immarg) #4

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN4sycl3_V15groupILi1EEC2ERKNS0_5rangeILi1EEES6_S4_RKNS0_2idILi1EEE(ptr addrspace(4) noundef align 8 dereferenceable_or_null(32) %0, ptr addrspace(4) noundef align 8 dereferenceable(8) %1, ptr addrspace(4) noundef align 8 dereferenceable(8) %2, ptr noundef byval(%"class.sycl::_V1::range") align 8 %3, ptr addrspace(4) noundef align 8 dereferenceable(8) %4) unnamed_addr #1 comdat align 2 !srcloc !55 {
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
define linkonce_odr dso_local spir_func void @_ZN4sycl3_V14itemILi1ELb1EEC2ILb1EEERNSt9enable_ifIXT_EKNS0_5rangeILi1EEEE4typeERKNS0_2idILi1EEESE_(ptr addrspace(4) noundef align 8 dereferenceable_or_null(24) %0, ptr addrspace(4) noundef align 8 dereferenceable(8) %1, ptr addrspace(4) noundef align 8 dereferenceable(8) %2, ptr addrspace(4) noundef align 8 dereferenceable(8) %3) unnamed_addr #1 comdat align 2 !srcloc !56 {
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
define linkonce_odr dso_local spir_func void @_ZN4sycl3_V14itemILi1ELb0EEC2ILb0EEERNSt9enable_ifIXntT_EKNS0_5rangeILi1EEEE4typeERKNS0_2idILi1EEE(ptr addrspace(4) noundef align 8 dereferenceable_or_null(16) %0, ptr addrspace(4) noundef align 8 dereferenceable(8) %1, ptr addrspace(4) noundef align 8 dereferenceable(8) %2) unnamed_addr #1 comdat align 2 !srcloc !57 {
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
define linkonce_odr dso_local spir_func void @_ZN4sycl3_V17nd_itemILi1EEC2ERKNS0_4itemILi1ELb1EEERKNS3_ILi1ELb0EEERKNS0_5groupILi1EEE(ptr addrspace(4) noundef align 1 dereferenceable_or_null(1) %0, ptr addrspace(4) noundef align 8 dereferenceable(24) %1, ptr addrspace(4) noundef align 8 dereferenceable(16) %2, ptr addrspace(4) noundef align 8 dereferenceable(32) %3) unnamed_addr #1 comdat align 2 !srcloc !58 {
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
define weak_odr dso_local spir_kernel void @_ZTSZZ4mainENKUlRN4sycl3_V17handlerEE0_clES2_E3de2(ptr addrspace(1) noundef align 4 %0, ptr addrspace(1) noundef align 4 %1, ptr addrspace(1) noundef align 4 %2, i32 noundef %3, ptr addrspace(1) noundef align 4 %4) #0 comdat !srcloc !59 !kernel_arg_buffer_location !7 !sycl_fixed_targets !8 {
  %6 = alloca ptr addrspace(1), align 8
  %7 = alloca ptr addrspace(1), align 8
  %8 = alloca ptr addrspace(1), align 8
  %9 = alloca i32, align 4
  %10 = alloca ptr addrspace(1), align 8
  %11 = alloca %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE0_clES2_EUlNS0_7nd_itemILi1EEEE_, align 8
  %12 = alloca %"class.sycl::_V1::nd_item", align 1
  %13 = addrspacecast ptr %6 to ptr addrspace(4)
  %14 = addrspacecast ptr %7 to ptr addrspace(4)
  %15 = addrspacecast ptr %8 to ptr addrspace(4)
  %16 = addrspacecast ptr %9 to ptr addrspace(4)
  %17 = addrspacecast ptr %10 to ptr addrspace(4)
  %18 = addrspacecast ptr %11 to ptr addrspace(4)
  %19 = addrspacecast ptr %12 to ptr addrspace(4)
  store ptr addrspace(1) %0, ptr addrspace(4) %13, align 8
  store ptr addrspace(1) %1, ptr addrspace(4) %14, align 8
  store ptr addrspace(1) %2, ptr addrspace(4) %15, align 8
  store i32 %3, ptr addrspace(4) %16, align 4
  store ptr addrspace(1) %4, ptr addrspace(4) %17, align 8
  %20 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE0_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %18, i32 0, i32 0
  %21 = load ptr addrspace(1), ptr addrspace(4) %13, align 8
  %22 = addrspacecast ptr addrspace(1) %21 to ptr addrspace(4)
  store ptr addrspace(4) %22, ptr addrspace(4) %20, align 8
  %23 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE0_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %18, i32 0, i32 1
  %24 = load ptr addrspace(1), ptr addrspace(4) %14, align 8
  %25 = addrspacecast ptr addrspace(1) %24 to ptr addrspace(4)
  store ptr addrspace(4) %25, ptr addrspace(4) %23, align 8
  %26 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE0_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %18, i32 0, i32 2
  %27 = load ptr addrspace(1), ptr addrspace(4) %15, align 8
  %28 = addrspacecast ptr addrspace(1) %27 to ptr addrspace(4)
  store ptr addrspace(4) %28, ptr addrspace(4) %26, align 8
  %29 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE0_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %18, i32 0, i32 3
  %30 = load i32, ptr addrspace(4) %16, align 4
  store i32 %30, ptr addrspace(4) %29, align 8
  %31 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE0_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %18, i32 0, i32 4
  %32 = load ptr addrspace(1), ptr addrspace(4) %17, align 8
  %33 = addrspacecast ptr addrspace(1) %32 to ptr addrspace(4)
  store ptr addrspace(4) %33, ptr addrspace(4) %31, align 8
  %34 = call spir_func noundef ptr addrspace(4) @_ZN4sycl3_V16detail7declptrINS0_7nd_itemILi1EEEEEPT_v() #5
  call spir_func void @_ZN4sycl3_V16detail7Builder10getElementILi1EEEKNS0_7nd_itemIXT_EEEPS5_(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::nd_item") align 1 %19, ptr addrspace(4) noundef %34) #5
  %35 = addrspacecast ptr addrspace(4) %19 to ptr
  call spir_func void @_ZZZ4mainENKUlRN4sycl3_V17handlerEE0_clES2_ENKUlNS0_7nd_itemILi1EEEE_clES5_(ptr addrspace(4) noundef align 8 dereferenceable_or_null(40) %18, ptr noundef byval(%"class.sycl::_V1::nd_item") align 1 %35) #5
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define internal spir_func void @_ZZZ4mainENKUlRN4sycl3_V17handlerEE0_clES2_ENKUlNS0_7nd_itemILi1EEEE_clES5_(ptr addrspace(4) noundef align 8 dereferenceable_or_null(40) %0, ptr noundef byval(%"class.sycl::_V1::nd_item") align 1 %1) #1 align 2 !srcloc !59 {
  %3 = alloca ptr addrspace(4), align 8
  %4 = alloca ptr addrspace(4), align 8
  %5 = addrspacecast ptr %3 to ptr addrspace(4)
  %6 = addrspacecast ptr %4 to ptr addrspace(4)
  store ptr addrspace(4) %0, ptr addrspace(4) %5, align 8
  %7 = addrspacecast ptr %1 to ptr addrspace(4)
  store ptr addrspace(4) %7, ptr addrspace(4) %6, align 8
  %8 = load ptr addrspace(4), ptr addrspace(4) %5, align 8
  %9 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE0_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %8, i32 0, i32 0
  %10 = load ptr addrspace(4), ptr addrspace(4) %9, align 8
  %11 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE0_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %8, i32 0, i32 1
  %12 = load ptr addrspace(4), ptr addrspace(4) %11, align 8
  %13 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE0_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %8, i32 0, i32 2
  %14 = load ptr addrspace(4), ptr addrspace(4) %13, align 8
  %15 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE0_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %8, i32 0, i32 3
  %16 = load i32, ptr addrspace(4) %15, align 8
  %17 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE0_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %8, i32 0, i32 4
  %18 = load ptr addrspace(4), ptr addrspace(4) %17, align 8
  call spir_func void @_Z12dense_esuhm2IfEvRN4sycl3_V17nd_itemILi1EEEPKT_S7_PS5_iPKi(ptr addrspace(4) noundef align 1 dereferenceable(1) %7, ptr addrspace(4) noundef %10, ptr addrspace(4) noundef %12, ptr addrspace(4) noundef %14, i32 noundef %16, ptr addrspace(4) noundef %18) #5
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_Z12dense_esuhm2IfEvRN4sycl3_V17nd_itemILi1EEEPKT_S7_PS5_iPKi(ptr addrspace(4) noundef align 1 dereferenceable(1) %0, ptr addrspace(4) noundef %1, ptr addrspace(4) noundef %2, ptr addrspace(4) noundef %3, i32 noundef %4, ptr addrspace(4) noundef %5) #1 comdat !srcloc !60 {
  %7 = alloca i64, align 8
  %8 = alloca ptr addrspace(4), align 8
  %9 = alloca i32, align 4
  %10 = alloca i64, align 8
  %11 = alloca %"class.sycl::_V1::id", align 8
  %12 = alloca i64, align 8
  %13 = alloca ptr addrspace(4), align 8
  %14 = alloca i32, align 4
  %15 = alloca i64, align 8
  %16 = alloca %"class.sycl::_V1::id", align 8
  %17 = alloca ptr addrspace(4), align 8
  %18 = alloca ptr addrspace(4), align 8
  %19 = alloca ptr addrspace(4), align 8
  %20 = alloca ptr addrspace(4), align 8
  %21 = alloca i32, align 4
  %22 = alloca ptr addrspace(4), align 8
  %23 = alloca i32, align 4
  %24 = alloca i32, align 4
  %25 = alloca i32, align 4
  %26 = alloca i32, align 4
  %27 = alloca float, align 4
  %28 = alloca i32, align 4
  %29 = addrspacecast ptr %17 to ptr addrspace(4)
  %30 = addrspacecast ptr %18 to ptr addrspace(4)
  %31 = addrspacecast ptr %19 to ptr addrspace(4)
  %32 = addrspacecast ptr %20 to ptr addrspace(4)
  %33 = addrspacecast ptr %21 to ptr addrspace(4)
  %34 = addrspacecast ptr %22 to ptr addrspace(4)
  %35 = addrspacecast ptr %23 to ptr addrspace(4)
  %36 = addrspacecast ptr %24 to ptr addrspace(4)
  %37 = addrspacecast ptr %25 to ptr addrspace(4)
  %38 = addrspacecast ptr %26 to ptr addrspace(4)
  %39 = addrspacecast ptr %27 to ptr addrspace(4)
  %40 = addrspacecast ptr %28 to ptr addrspace(4)
  store ptr addrspace(4) %0, ptr addrspace(4) %29, align 8
  store ptr addrspace(4) %1, ptr addrspace(4) %30, align 8
  store ptr addrspace(4) %2, ptr addrspace(4) %31, align 8
  store ptr addrspace(4) %3, ptr addrspace(4) %32, align 8
  store i32 %4, ptr addrspace(4) %33, align 4
  store ptr addrspace(4) %5, ptr addrspace(4) %34, align 8
  %41 = load ptr addrspace(4), ptr addrspace(4) %29, align 8
  %42 = addrspacecast ptr %12 to ptr addrspace(4)
  %43 = addrspacecast ptr %13 to ptr addrspace(4)
  %44 = addrspacecast ptr %14 to ptr addrspace(4)
  %45 = addrspacecast ptr %15 to ptr addrspace(4)
  %46 = addrspacecast ptr %16 to ptr addrspace(4)
  store ptr addrspace(4) %41, ptr addrspace(4) %43, align 8
  store i32 0, ptr addrspace(4) %44, align 4
  %47 = load ptr addrspace(4), ptr addrspace(4) %43, align 8
  call spir_func void @_ZNK4sycl3_V17nd_itemILi1EE12get_group_idEv(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::id") align 8 %46, ptr addrspace(4) noundef align 1 dereferenceable_or_null(1) %47) #5
  %48 = load i32, ptr addrspace(4) %44, align 4
  %49 = call spir_func noundef align 8 dereferenceable(8) ptr addrspace(4) @_ZN4sycl3_V16detail5arrayILi1EEixEi(ptr addrspace(4) noundef align 8 dereferenceable_or_null(8) %46, i32 noundef %48) #5
  %50 = load i64, ptr addrspace(4) %49, align 8
  store i64 %50, ptr addrspace(4) %45, align 8
  %51 = load i64, ptr addrspace(4) %45, align 8
  %52 = icmp ule i64 %51, 2147483647
  call void @llvm.assume(i1 %52)
  %53 = load i64, ptr addrspace(4) %45, align 8
  %54 = trunc i64 %53 to i32
  store i32 %54, ptr addrspace(4) %35, align 4
  %55 = load ptr addrspace(4), ptr addrspace(4) %34, align 8
  %56 = load i32, ptr addrspace(4) %35, align 4
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds i32, ptr addrspace(4) %55, i64 %57
  %59 = load i32, ptr addrspace(4) %58, align 4
  store i32 %59, ptr addrspace(4) %36, align 4
  %60 = load ptr addrspace(4), ptr addrspace(4) %34, align 8
  %61 = load i32, ptr addrspace(4) %35, align 4
  %62 = add nsw i32 %61, 1
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds i32, ptr addrspace(4) %60, i64 %63
  %65 = load i32, ptr addrspace(4) %64, align 4
  %66 = load i32, ptr addrspace(4) %36, align 4
  %67 = sub nsw i32 %65, %66
  store i32 %67, ptr addrspace(4) %37, align 4
  %68 = load ptr addrspace(4), ptr addrspace(4) %29, align 8
  %69 = addrspacecast ptr %7 to ptr addrspace(4)
  %70 = addrspacecast ptr %8 to ptr addrspace(4)
  %71 = addrspacecast ptr %9 to ptr addrspace(4)
  %72 = addrspacecast ptr %10 to ptr addrspace(4)
  %73 = addrspacecast ptr %11 to ptr addrspace(4)
  store ptr addrspace(4) %68, ptr addrspace(4) %70, align 8
  store i32 0, ptr addrspace(4) %71, align 4
  %74 = load ptr addrspace(4), ptr addrspace(4) %70, align 8
  call spir_func void @_ZNK4sycl3_V17nd_itemILi1EE12get_local_idEv(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::id") align 8 %73, ptr addrspace(4) noundef align 1 dereferenceable_or_null(1) %74) #5
  %75 = load i32, ptr addrspace(4) %71, align 4
  %76 = call spir_func noundef align 8 dereferenceable(8) ptr addrspace(4) @_ZN4sycl3_V16detail5arrayILi1EEixEi(ptr addrspace(4) noundef align 8 dereferenceable_or_null(8) %73, i32 noundef %75) #5
  %77 = load i64, ptr addrspace(4) %76, align 8
  store i64 %77, ptr addrspace(4) %72, align 8
  %78 = load i64, ptr addrspace(4) %72, align 8
  %79 = icmp ule i64 %78, 2147483647
  call void @llvm.assume(i1 %79)
  %80 = load i64, ptr addrspace(4) %72, align 8
  %81 = trunc i64 %80 to i32
  store i32 %81, ptr addrspace(4) %38, align 4
  br label %82

82:                                               ; preds = %122, %6
  %83 = load i32, ptr addrspace(4) %38, align 4
  %84 = load i32, ptr addrspace(4) %33, align 4
  %85 = icmp slt i32 %83, %84
  br i1 %85, label %86, label %129

86:                                               ; preds = %82
  %87 = load ptr addrspace(4), ptr addrspace(4) %31, align 8
  %88 = load i32, ptr addrspace(4) %35, align 4
  %89 = load i32, ptr addrspace(4) %33, align 4
  %90 = mul nsw i32 %88, %89
  %91 = load i32, ptr addrspace(4) %38, align 4
  %92 = add nsw i32 %90, %91
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds float, ptr addrspace(4) %87, i64 %93
  %95 = load float, ptr addrspace(4) %94, align 4
  store float %95, ptr addrspace(4) %39, align 4
  %96 = load i32, ptr addrspace(4) %38, align 4
  store i32 %96, ptr addrspace(4) %40, align 4
  br label %97

97:                                               ; preds = %117, %86
  %98 = load i32, ptr addrspace(4) %40, align 4
  %99 = load i32, ptr addrspace(4) %37, align 4
  %100 = icmp slt i32 %98, %99
  br i1 %100, label %101, label %121

101:                                              ; preds = %97
  %102 = load ptr addrspace(4), ptr addrspace(4) %30, align 8
  %103 = load i32, ptr addrspace(4) %36, align 4
  %104 = load i32, ptr addrspace(4) %40, align 4
  %105 = add nsw i32 %103, %104
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds float, ptr addrspace(4) %102, i64 %106
  %108 = load float, ptr addrspace(4) %107, align 4
  %109 = load float, ptr addrspace(4) %39, align 4
  %110 = fadd reassoc nsz arcp contract afn float %108, %109
  %111 = load ptr addrspace(4), ptr addrspace(4) %32, align 8
  %112 = load i32, ptr addrspace(4) %36, align 4
  %113 = load i32, ptr addrspace(4) %40, align 4
  %114 = add nsw i32 %112, %113
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds float, ptr addrspace(4) %111, i64 %115
  store float %110, ptr addrspace(4) %116, align 4
  br label %117

117:                                              ; preds = %101
  %118 = load i32, ptr addrspace(4) %33, align 4
  %119 = load i32, ptr addrspace(4) %40, align 4
  %120 = add nsw i32 %119, %118
  store i32 %120, ptr addrspace(4) %40, align 4
  br label %97, !llvm.loop !61

121:                                              ; preds = %97
  br label %122

122:                                              ; preds = %121
  %123 = load ptr addrspace(4), ptr addrspace(4) %29, align 8
  %124 = call spir_func noundef i64 @_ZNK4sycl3_V17nd_itemILi1EE15get_local_rangeEi(ptr addrspace(4) noundef align 1 dereferenceable_or_null(1) %123, i32 noundef 0) #5
  %125 = load i32, ptr addrspace(4) %38, align 4
  %126 = sext i32 %125 to i64
  %127 = add i64 %126, %124
  %128 = trunc i64 %127 to i32
  store i32 %128, ptr addrspace(4) %38, align 4
  br label %82, !llvm.loop !62

129:                                              ; preds = %82
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define weak_odr dso_local spir_kernel void @_ZTSZZ4mainENKUlRN4sycl3_V17handlerEE1_clES2_E3de3(ptr addrspace(1) noundef align 4 %0, ptr addrspace(1) noundef align 4 %1, ptr addrspace(1) noundef align 4 %2, i32 noundef %3, ptr addrspace(1) noundef align 4 %4) #0 comdat !srcloc !63 !kernel_arg_buffer_location !7 !sycl_fixed_targets !8 {
  %6 = alloca ptr addrspace(1), align 8
  %7 = alloca ptr addrspace(1), align 8
  %8 = alloca ptr addrspace(1), align 8
  %9 = alloca i32, align 4
  %10 = alloca ptr addrspace(1), align 8
  %11 = alloca %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE1_clES2_EUlNS0_7nd_itemILi1EEEE_, align 8
  %12 = alloca %"class.sycl::_V1::nd_item", align 1
  %13 = addrspacecast ptr %6 to ptr addrspace(4)
  %14 = addrspacecast ptr %7 to ptr addrspace(4)
  %15 = addrspacecast ptr %8 to ptr addrspace(4)
  %16 = addrspacecast ptr %9 to ptr addrspace(4)
  %17 = addrspacecast ptr %10 to ptr addrspace(4)
  %18 = addrspacecast ptr %11 to ptr addrspace(4)
  %19 = addrspacecast ptr %12 to ptr addrspace(4)
  store ptr addrspace(1) %0, ptr addrspace(4) %13, align 8
  store ptr addrspace(1) %1, ptr addrspace(4) %14, align 8
  store ptr addrspace(1) %2, ptr addrspace(4) %15, align 8
  store i32 %3, ptr addrspace(4) %16, align 4
  store ptr addrspace(1) %4, ptr addrspace(4) %17, align 8
  %20 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE1_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %18, i32 0, i32 0
  %21 = load ptr addrspace(1), ptr addrspace(4) %13, align 8
  %22 = addrspacecast ptr addrspace(1) %21 to ptr addrspace(4)
  store ptr addrspace(4) %22, ptr addrspace(4) %20, align 8
  %23 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE1_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %18, i32 0, i32 1
  %24 = load ptr addrspace(1), ptr addrspace(4) %14, align 8
  %25 = addrspacecast ptr addrspace(1) %24 to ptr addrspace(4)
  store ptr addrspace(4) %25, ptr addrspace(4) %23, align 8
  %26 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE1_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %18, i32 0, i32 2
  %27 = load ptr addrspace(1), ptr addrspace(4) %15, align 8
  %28 = addrspacecast ptr addrspace(1) %27 to ptr addrspace(4)
  store ptr addrspace(4) %28, ptr addrspace(4) %26, align 8
  %29 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE1_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %18, i32 0, i32 3
  %30 = load i32, ptr addrspace(4) %16, align 4
  store i32 %30, ptr addrspace(4) %29, align 8
  %31 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE1_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %18, i32 0, i32 4
  %32 = load ptr addrspace(1), ptr addrspace(4) %17, align 8
  %33 = addrspacecast ptr addrspace(1) %32 to ptr addrspace(4)
  store ptr addrspace(4) %33, ptr addrspace(4) %31, align 8
  %34 = call spir_func noundef ptr addrspace(4) @_ZN4sycl3_V16detail7declptrINS0_7nd_itemILi1EEEEEPT_v() #5
  call spir_func void @_ZN4sycl3_V16detail7Builder10getElementILi1EEEKNS0_7nd_itemIXT_EEEPS5_(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::nd_item") align 1 %19, ptr addrspace(4) noundef %34) #5
  %35 = addrspacecast ptr addrspace(4) %19 to ptr
  call spir_func void @_ZZZ4mainENKUlRN4sycl3_V17handlerEE1_clES2_ENKUlNS0_7nd_itemILi1EEEE_clES5_(ptr addrspace(4) noundef align 8 dereferenceable_or_null(40) %18, ptr noundef byval(%"class.sycl::_V1::nd_item") align 1 %35) #5
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define internal spir_func void @_ZZZ4mainENKUlRN4sycl3_V17handlerEE1_clES2_ENKUlNS0_7nd_itemILi1EEEE_clES5_(ptr addrspace(4) noundef align 8 dereferenceable_or_null(40) %0, ptr noundef byval(%"class.sycl::_V1::nd_item") align 1 %1) #1 align 2 !srcloc !63 {
  %3 = alloca ptr addrspace(4), align 8
  %4 = alloca ptr addrspace(4), align 8
  %5 = addrspacecast ptr %3 to ptr addrspace(4)
  %6 = addrspacecast ptr %4 to ptr addrspace(4)
  store ptr addrspace(4) %0, ptr addrspace(4) %5, align 8
  %7 = addrspacecast ptr %1 to ptr addrspace(4)
  store ptr addrspace(4) %7, ptr addrspace(4) %6, align 8
  %8 = load ptr addrspace(4), ptr addrspace(4) %5, align 8
  %9 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE1_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %8, i32 0, i32 0
  %10 = load ptr addrspace(4), ptr addrspace(4) %9, align 8
  %11 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE1_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %8, i32 0, i32 1
  %12 = load ptr addrspace(4), ptr addrspace(4) %11, align 8
  %13 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE1_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %8, i32 0, i32 2
  %14 = load ptr addrspace(4), ptr addrspace(4) %13, align 8
  %15 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE1_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %8, i32 0, i32 3
  %16 = load i32, ptr addrspace(4) %15, align 8
  %17 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE1_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %8, i32 0, i32 4
  %18 = load ptr addrspace(4), ptr addrspace(4) %17, align 8
  call spir_func void @_Z12dense_esuhm3IfEvRN4sycl3_V17nd_itemILi1EEEPKT_S7_PS5_iPKi(ptr addrspace(4) noundef align 1 dereferenceable(1) %7, ptr addrspace(4) noundef %10, ptr addrspace(4) noundef %12, ptr addrspace(4) noundef %14, i32 noundef %16, ptr addrspace(4) noundef %18) #5
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_Z12dense_esuhm3IfEvRN4sycl3_V17nd_itemILi1EEEPKT_S7_PS5_iPKi(ptr addrspace(4) noundef align 1 dereferenceable(1) %0, ptr addrspace(4) noundef %1, ptr addrspace(4) noundef %2, ptr addrspace(4) noundef %3, i32 noundef %4, ptr addrspace(4) noundef %5) #1 comdat !srcloc !64 {
  %7 = alloca i64, align 8
  %8 = alloca ptr addrspace(4), align 8
  %9 = alloca i32, align 4
  %10 = alloca i64, align 8
  %11 = alloca %"class.sycl::_V1::id", align 8
  %12 = alloca i64, align 8
  %13 = alloca ptr addrspace(4), align 8
  %14 = alloca i32, align 4
  %15 = alloca i64, align 8
  %16 = alloca %"class.sycl::_V1::id", align 8
  %17 = alloca ptr addrspace(4), align 8
  %18 = alloca ptr addrspace(4), align 8
  %19 = alloca ptr addrspace(4), align 8
  %20 = alloca ptr addrspace(4), align 8
  %21 = alloca i32, align 4
  %22 = alloca ptr addrspace(4), align 8
  %23 = alloca i32, align 4
  %24 = alloca i32, align 4
  %25 = alloca i32, align 4
  %26 = alloca i32, align 4
  %27 = alloca i32, align 4
  %28 = alloca float, align 4
  %29 = alloca float, align 4
  %30 = addrspacecast ptr %17 to ptr addrspace(4)
  %31 = addrspacecast ptr %18 to ptr addrspace(4)
  %32 = addrspacecast ptr %19 to ptr addrspace(4)
  %33 = addrspacecast ptr %20 to ptr addrspace(4)
  %34 = addrspacecast ptr %21 to ptr addrspace(4)
  %35 = addrspacecast ptr %22 to ptr addrspace(4)
  %36 = addrspacecast ptr %23 to ptr addrspace(4)
  %37 = addrspacecast ptr %24 to ptr addrspace(4)
  %38 = addrspacecast ptr %25 to ptr addrspace(4)
  %39 = addrspacecast ptr %26 to ptr addrspace(4)
  %40 = addrspacecast ptr %27 to ptr addrspace(4)
  %41 = addrspacecast ptr %28 to ptr addrspace(4)
  %42 = addrspacecast ptr %29 to ptr addrspace(4)
  store ptr addrspace(4) %0, ptr addrspace(4) %30, align 8
  store ptr addrspace(4) %1, ptr addrspace(4) %31, align 8
  store ptr addrspace(4) %2, ptr addrspace(4) %32, align 8
  store ptr addrspace(4) %3, ptr addrspace(4) %33, align 8
  store i32 %4, ptr addrspace(4) %34, align 4
  store ptr addrspace(4) %5, ptr addrspace(4) %35, align 8
  %43 = load ptr addrspace(4), ptr addrspace(4) %30, align 8
  %44 = addrspacecast ptr %12 to ptr addrspace(4)
  %45 = addrspacecast ptr %13 to ptr addrspace(4)
  %46 = addrspacecast ptr %14 to ptr addrspace(4)
  %47 = addrspacecast ptr %15 to ptr addrspace(4)
  %48 = addrspacecast ptr %16 to ptr addrspace(4)
  store ptr addrspace(4) %43, ptr addrspace(4) %45, align 8
  store i32 0, ptr addrspace(4) %46, align 4
  %49 = load ptr addrspace(4), ptr addrspace(4) %45, align 8
  call spir_func void @_ZNK4sycl3_V17nd_itemILi1EE12get_group_idEv(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::id") align 8 %48, ptr addrspace(4) noundef align 1 dereferenceable_or_null(1) %49) #5
  %50 = load i32, ptr addrspace(4) %46, align 4
  %51 = call spir_func noundef align 8 dereferenceable(8) ptr addrspace(4) @_ZN4sycl3_V16detail5arrayILi1EEixEi(ptr addrspace(4) noundef align 8 dereferenceable_or_null(8) %48, i32 noundef %50) #5
  %52 = load i64, ptr addrspace(4) %51, align 8
  store i64 %52, ptr addrspace(4) %47, align 8
  %53 = load i64, ptr addrspace(4) %47, align 8
  %54 = icmp ule i64 %53, 2147483647
  call void @llvm.assume(i1 %54)
  %55 = load i64, ptr addrspace(4) %47, align 8
  %56 = trunc i64 %55 to i32
  store i32 %56, ptr addrspace(4) %36, align 4
  %57 = load ptr addrspace(4), ptr addrspace(4) %35, align 8
  %58 = load i32, ptr addrspace(4) %36, align 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds i32, ptr addrspace(4) %57, i64 %59
  %61 = load i32, ptr addrspace(4) %60, align 4
  store i32 %61, ptr addrspace(4) %37, align 4
  %62 = load ptr addrspace(4), ptr addrspace(4) %35, align 8
  %63 = load i32, ptr addrspace(4) %36, align 4
  %64 = add nsw i32 %63, 1
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds i32, ptr addrspace(4) %62, i64 %65
  %67 = load i32, ptr addrspace(4) %66, align 4
  %68 = load i32, ptr addrspace(4) %37, align 4
  %69 = sub nsw i32 %67, %68
  store i32 %69, ptr addrspace(4) %38, align 4
  store i32 0, ptr addrspace(4) %39, align 4
  br label %70

70:                                               ; preds = %124, %6
  %71 = load i32, ptr addrspace(4) %39, align 4
  %72 = load i32, ptr addrspace(4) %38, align 4
  %73 = icmp slt i32 %71, %72
  br i1 %73, label %74, label %131

74:                                               ; preds = %70
  %75 = load i32, ptr addrspace(4) %39, align 4
  %76 = sext i32 %75 to i64
  %77 = load ptr addrspace(4), ptr addrspace(4) %30, align 8
  %78 = addrspacecast ptr %7 to ptr addrspace(4)
  %79 = addrspacecast ptr %8 to ptr addrspace(4)
  %80 = addrspacecast ptr %9 to ptr addrspace(4)
  %81 = addrspacecast ptr %10 to ptr addrspace(4)
  %82 = addrspacecast ptr %11 to ptr addrspace(4)
  store ptr addrspace(4) %77, ptr addrspace(4) %79, align 8
  store i32 0, ptr addrspace(4) %80, align 4
  %83 = load ptr addrspace(4), ptr addrspace(4) %79, align 8
  call spir_func void @_ZNK4sycl3_V17nd_itemILi1EE12get_local_idEv(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::id") align 8 %82, ptr addrspace(4) noundef align 1 dereferenceable_or_null(1) %83) #5
  %84 = load i32, ptr addrspace(4) %80, align 4
  %85 = call spir_func noundef align 8 dereferenceable(8) ptr addrspace(4) @_ZN4sycl3_V16detail5arrayILi1EEixEi(ptr addrspace(4) noundef align 8 dereferenceable_or_null(8) %82, i32 noundef %84) #5
  %86 = load i64, ptr addrspace(4) %85, align 8
  store i64 %86, ptr addrspace(4) %81, align 8
  %87 = load i64, ptr addrspace(4) %81, align 8
  %88 = icmp ule i64 %87, 2147483647
  call void @llvm.assume(i1 %88)
  %89 = load i64, ptr addrspace(4) %81, align 8
  %90 = add i64 %76, %89
  %91 = trunc i64 %90 to i32
  store i32 %91, ptr addrspace(4) %40, align 4
  %92 = load i32, ptr addrspace(4) %40, align 4
  %93 = load i32, ptr addrspace(4) %38, align 4
  %94 = icmp slt i32 %92, %93
  br i1 %94, label %95, label %123

95:                                               ; preds = %74
  %96 = load ptr addrspace(4), ptr addrspace(4) %31, align 8
  %97 = load i32, ptr addrspace(4) %37, align 4
  %98 = load i32, ptr addrspace(4) %40, align 4
  %99 = add nsw i32 %97, %98
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds float, ptr addrspace(4) %96, i64 %100
  %102 = load float, ptr addrspace(4) %101, align 4
  store float %102, ptr addrspace(4) %41, align 4
  %103 = load ptr addrspace(4), ptr addrspace(4) %32, align 8
  %104 = load i32, ptr addrspace(4) %36, align 4
  %105 = load i32, ptr addrspace(4) %34, align 4
  %106 = mul nsw i32 %104, %105
  %107 = load i32, ptr addrspace(4) %40, align 4
  %108 = load i32, ptr addrspace(4) %34, align 4
  %109 = srem i32 %107, %108
  %110 = add nsw i32 %106, %109
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds float, ptr addrspace(4) %103, i64 %111
  %113 = load float, ptr addrspace(4) %112, align 4
  store float %113, ptr addrspace(4) %42, align 4
  %114 = load float, ptr addrspace(4) %41, align 4
  %115 = load float, ptr addrspace(4) %42, align 4
  %116 = fadd reassoc nsz arcp contract afn float %114, %115
  %117 = load ptr addrspace(4), ptr addrspace(4) %33, align 8
  %118 = load i32, ptr addrspace(4) %37, align 4
  %119 = load i32, ptr addrspace(4) %40, align 4
  %120 = add nsw i32 %118, %119
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds float, ptr addrspace(4) %117, i64 %121
  store float %116, ptr addrspace(4) %122, align 4
  br label %123

123:                                              ; preds = %95, %74
  br label %124

124:                                              ; preds = %123
  %125 = load ptr addrspace(4), ptr addrspace(4) %30, align 8
  %126 = call spir_func noundef i64 @_ZNK4sycl3_V17nd_itemILi1EE15get_local_rangeEi(ptr addrspace(4) noundef align 1 dereferenceable_or_null(1) %125, i32 noundef 0) #5
  %127 = load i32, ptr addrspace(4) %39, align 4
  %128 = sext i32 %127 to i64
  %129 = add i64 %128, %126
  %130 = trunc i64 %129 to i32
  store i32 %130, ptr addrspace(4) %39, align 4
  br label %70, !llvm.loop !65

131:                                              ; preds = %70
  ret void
}

declare dso_local spir_func i32 @_Z18__spirv_ocl_printfPU3AS2Kcz(ptr addrspace(2), ...)

attributes #0 = { convergent mustprogress noinline norecurse nounwind optnone "approx-func-fp-math"="true" "frame-pointer"="all" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "sycl-module-id"="/home/mdunlavy/GPU_FI/HeCBench/src/dense-embedding-sycl/main.cpp" "sycl-optlevel"="0" "uniform-work-group-size"="true" "unsafe-fp-math"="true" }
attributes #1 = { convergent mustprogress noinline norecurse nounwind optnone "approx-func-fp-math"="true" "frame-pointer"="all" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "sycl-optlevel"="0" "unsafe-fp-math"="true" }
attributes #2 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }
attributes #3 = { convergent mustprogress noinline norecurse nounwind optnone "approx-func-fp-math"="true" "frame-pointer"="all" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "sycl-module-id"="/home/mdunlavy/GPU_FI/HeCBench/src/dense-embedding-sycl/main.cpp" "sycl-optlevel"="0" "unsafe-fp-math"="true" }
attributes #4 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #5 = { convergent nounwind }

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
!6 = !{i32 6409}
!7 = !{i32 -1, i32 -1, i32 -1, i32 -1, i32 -1}
!8 = !{}
!9 = !{i32 3916645}
!10 = !{i32 3912371}
!11 = !{i32 776}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
!14 = distinct !{!14, !13}
!15 = !{i32 7869371}
!16 = !{i32 7886438}
!17 = !{i32 5849680}
!18 = !{i32 -2147143903}
!19 = !{i32 -2147145642}
!20 = !{i32 -2147144196}
!21 = !{i32 6282443}
!22 = !{i32 100494}
!23 = !{i32 5848502}
!24 = !{i32 7869203}
!25 = !{i32 -2147151531}
!26 = !{i32 -2147153342}
!27 = !{i32 -2147151856}
!28 = !{i32 6296226}
!29 = !{i32 100172}
!30 = !{i32 7866739}
!31 = !{i32 -2147146355}
!32 = !{i32 -2147148310}
!33 = !{i32 -2147146744}
!34 = !{i32 100804}
!35 = !{i32 -2147156747}
!36 = !{i32 -2147149015}
!37 = !{i32 -2147154057}
!38 = !{i32 -2147141427}
!39 = !{i32 3912828}
!40 = !{i32 3913540}
!41 = !{i32 3913807}
!42 = !{i32 3913970}
!43 = !{i32 -2147158450}
!44 = !{i32 -2147157024}
!45 = !{i32 99230}
!46 = !{i32 -2147150826}
!47 = !{i32 -2147149340}
!48 = !{i32 99850}
!49 = !{i32 -2147156048}
!50 = !{i32 -2147154462}
!51 = !{i32 98878}
!52 = !{i32 -2147143202}
!53 = !{i32 -2147141736}
!54 = !{i32 99534}
!55 = !{i32 7827351}
!56 = !{i32 7837220}
!57 = !{i32 7837440}
!58 = !{i32 7886071}
!59 = !{i32 7245}
!60 = !{i32 1517}
!61 = distinct !{!61, !13}
!62 = distinct !{!62, !13}
!63 = !{i32 8079}
!64 = !{i32 2200}
!65 = distinct !{!65, !13}
