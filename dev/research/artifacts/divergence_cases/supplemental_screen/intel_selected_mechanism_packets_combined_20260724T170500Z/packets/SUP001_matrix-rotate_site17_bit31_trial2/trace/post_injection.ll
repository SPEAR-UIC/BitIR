; ModuleID = '/lus/flare/projects/UIC-HPC/mdunlavy/GPU_FI_supplemental_dumps/intel_selected_mechanism_packets_20260724T154638Z/tmp/matrix-rotate_site17_bit31_trial2/device.injected.bc'
source_filename = "main.cpp"
target datalayout = "e-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-n8:16:32:64-G1"
target triple = "spir64-unknown-unknown"

%class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi1EEEE_ = type { i32, ptr addrspace(4) }
%"class.sycl::_V1::nd_item" = type { i8 }
%"class.sycl::_V1::id" = type { %"class.sycl::_V1::detail::array" }
%"class.sycl::_V1::detail::array" = type { [1 x i64] }
%"class.sycl::_V1::range" = type { %"class.sycl::_V1::detail::array" }
%"class.sycl::_V1::group" = type { %"class.sycl::_V1::range", %"class.sycl::_V1::range", %"class.sycl::_V1::range", %"class.sycl::_V1::id" }
%"class.sycl::_V1::item" = type { %"struct.sycl::_V1::detail::ItemBase" }
%"struct.sycl::_V1::detail::ItemBase" = type { %"class.sycl::_V1::range", %"class.sycl::_V1::id", %"class.sycl::_V1::id" }
%"class.sycl::_V1::item.0" = type { %"struct.sycl::_V1::detail::ItemBase.1" }
%"struct.sycl::_V1::detail::ItemBase.1" = type { %"class.sycl::_V1::range", %"class.sycl::_V1::id" }

$_ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_E13matrix_rotate = comdat any

$_ZN4sycl3_V16detail7Builder10getElementILi1EEEKNS0_7nd_itemIXT_EEEPS5_ = comdat any

$_ZN4sycl3_V16detail7declptrINS0_7nd_itemILi1EEEEEPT_v = comdat any

$_ZNK4sycl3_V17nd_itemILi1EE13get_global_idEv = comdat any

$_ZN4sycl3_V16detail5arrayILi1EEixEi = comdat any

$_ZN7__spirv22initGlobalInvocationIdILi1EN4sycl3_V12idILi1EEEEET0_v = comdat any

$_ZN7__spirv29InitSizesSTGlobalInvocationIdILi1EN4sycl3_V12idILi1EEEE8initSizeEv = comdat any

$_ZN4sycl3_V12idILi1EEC2ILi1EEENSt9enable_ifIXeqT_Li1EEmE4typeE = comdat any

$_Z28__spirv_GlobalInvocationId_xv = comdat any

$_ZN4sycl3_V16detail5arrayILi1EEC2ILi1EEENSt9enable_ifIXeqT_Li1EEmE4typeE = comdat any

$_ZN7__spirv14initGlobalSizeILi1EN4sycl3_V15rangeILi1EEEEET0_v = comdat any

$_ZN7__spirv17initWorkgroupSizeILi1EN4sycl3_V15rangeILi1EEEEET0_v = comdat any

$_ZN7__spirv17initNumWorkgroupsILi1EN4sycl3_V15rangeILi1EEEEET0_v = comdat any

$_ZN7__spirv15initWorkgroupIdILi1EN4sycl3_V12idILi1EEEEET0_v = comdat any

$_ZN7__spirv21initLocalInvocationIdILi1EN4sycl3_V12idILi1EEEEET0_v = comdat any

$_ZN7__spirv16initGlobalOffsetILi1EN4sycl3_V12idILi1EEEEET0_v = comdat any

$_ZN4sycl3_V16detail7Builder11createGroupILi1EEENS0_5groupIXT_EEERKNS0_5rangeIXT_EEES9_S9_RKNS0_2idIXT_EEE = comdat any

$_ZN4sycl3_V16detail7Builder10createItemILi1ELb1EEENSt9enable_ifIXT0_ENS0_4itemIXT_EXT0_EEEE4typeERKNS0_5rangeIXT_EEERKNS0_2idIXT_EEESG_ = comdat any

$_ZN4sycl3_V16detail7Builder10createItemILi1ELb0EEENSt9enable_ifIXntT0_ENS0_4itemIXT_EXT0_EEEE4typeERKNS0_5rangeIXT_EEERKNS0_2idIXT_EEE = comdat any

$_ZN4sycl3_V16detail7Builder12createNDItemILi1EEENS0_7nd_itemIXT_EEERKNS0_4itemIXT_ELb1EEERKNS6_IXT_ELb0EEERKNS0_5groupIXT_EEE = comdat any

$_ZN7__spirv21InitSizesSTGlobalSizeILi1EN4sycl3_V15rangeILi1EEEE8initSizeEv = comdat any

$_ZN4sycl3_V15rangeILi1EEC2ILi1EEENSt9enable_ifIXeqT_Li1EEmE4typeE = comdat any

$_Z20__spirv_GlobalSize_xv = comdat any

$_ZN7__spirv24InitSizesSTWorkgroupSizeILi1EN4sycl3_V15rangeILi1EEEE8initSizeEv = comdat any

$_Z23__spirv_WorkgroupSize_xv = comdat any

$_ZN7__spirv24InitSizesSTNumWorkgroupsILi1EN4sycl3_V15rangeILi1EEEE8initSizeEv = comdat any

$_Z23__spirv_NumWorkgroups_xv = comdat any

$_ZN7__spirv22InitSizesSTWorkgroupIdILi1EN4sycl3_V12idILi1EEEE8initSizeEv = comdat any

$_Z21__spirv_WorkgroupId_xv = comdat any

$_ZN7__spirv28InitSizesSTLocalInvocationIdILi1EN4sycl3_V12idILi1EEEE8initSizeEv = comdat any

$_Z27__spirv_LocalInvocationId_xv = comdat any

$_ZN7__spirv23InitSizesSTGlobalOffsetILi1EN4sycl3_V12idILi1EEEE8initSizeEv = comdat any

$_Z22__spirv_GlobalOffset_xv = comdat any

$_ZN4sycl3_V15groupILi1EEC2ERKNS0_5rangeILi1EEES6_S4_RKNS0_2idILi1EEE = comdat any

$_ZN4sycl3_V14itemILi1ELb1EEC2ILb1EEERNSt9enable_ifIXT_EKNS0_5rangeILi1EEEE4typeERKNS0_2idILi1EEESE_ = comdat any

$_ZN4sycl3_V14itemILi1ELb0EEC2ILb0EEERNSt9enable_ifIXntT_EKNS0_5rangeILi1EEEE4typeERKNS0_2idILi1EEE = comdat any

$_ZN4sycl3_V17nd_itemILi1EEC2ERKNS0_4itemILi1ELb1EEERKNS3_ILi1ELb0EEERKNS0_5groupILi1EEE = comdat any

@__spirv_BuiltInGlobalInvocationId = external dso_local addrspace(1) constant <3 x i64>, align 32
@__spirv_BuiltInGlobalSize = external dso_local addrspace(1) constant <3 x i64>, align 32
@__spirv_BuiltInWorkgroupSize = external dso_local addrspace(1) constant <3 x i64>, align 32
@__spirv_BuiltInNumWorkgroups = external dso_local addrspace(1) constant <3 x i64>, align 32
@__spirv_BuiltInWorkgroupId = external dso_local addrspace(1) constant <3 x i64>, align 32
@__spirv_BuiltInLocalInvocationId = external dso_local addrspace(1) constant <3 x i64>, align 32
@__spirv_BuiltInGlobalOffset = external dso_local addrspace(1) constant <3 x i64>, align 32

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define weak_odr dso_local spir_kernel void @_ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_E13matrix_rotate(i32 noundef %0, ptr addrspace(1) noundef align 4 %1) #0 comdat !srcloc !6 !kernel_arg_buffer_location !7 !sycl_fixed_targets !8 {
  %3 = alloca i32, align 4
  %4 = alloca ptr addrspace(1), align 8
  %5 = alloca %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi1EEEE_, align 8
  %6 = alloca %"class.sycl::_V1::nd_item", align 1
  %7 = addrspacecast ptr %3 to ptr addrspace(4)
  %8 = addrspacecast ptr %4 to ptr addrspace(4)
  %9 = addrspacecast ptr %5 to ptr addrspace(4)
  %10 = addrspacecast ptr %6 to ptr addrspace(4)
  store i32 %0, ptr addrspace(4) %7, align 4
  store ptr addrspace(1) %1, ptr addrspace(4) %8, align 8
  %11 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %9, i32 0, i32 0
  %12 = load i32, ptr addrspace(4) %7, align 4
  store i32 %12, ptr addrspace(4) %11, align 8
  %13 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %9, i32 0, i32 1
  %14 = load ptr addrspace(1), ptr addrspace(4) %8, align 8
  %15 = addrspacecast ptr addrspace(1) %14 to ptr addrspace(4)
  store ptr addrspace(4) %15, ptr addrspace(4) %13, align 8
  %16 = call spir_func noundef ptr addrspace(4) @_ZN4sycl3_V16detail7declptrINS0_7nd_itemILi1EEEEEPT_v() #5
  call spir_func void @_ZN4sycl3_V16detail7Builder10getElementILi1EEEKNS0_7nd_itemIXT_EEEPS5_(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::nd_item") align 1 %10, ptr addrspace(4) noundef %16) #5
  %17 = addrspacecast ptr addrspace(4) %10 to ptr
  call spir_func void @_ZZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_ENKUlNS0_7nd_itemILi1EEEE_clES5_(ptr addrspace(4) noundef align 8 dereferenceable_or_null(16) %9, ptr noundef byval(%"class.sycl::_V1::nd_item") align 1 %17) #5
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define internal spir_func void @_ZZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_ENKUlNS0_7nd_itemILi1EEEE_clES5_(ptr addrspace(4) noundef align 8 dereferenceable_or_null(16) %0, ptr noundef byval(%"class.sycl::_V1::nd_item") align 1 %1) #1 align 2 !srcloc !6 {
  %3 = alloca i64, align 8
  %4 = alloca ptr addrspace(4), align 8
  %5 = alloca i32, align 4
  %6 = alloca i64, align 8
  %7 = alloca %"class.sycl::_V1::id", align 8
  %8 = alloca ptr addrspace(4), align 8
  %9 = alloca ptr addrspace(4), align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca float, align 4
  %16 = addrspacecast ptr %8 to ptr addrspace(4)
  %17 = addrspacecast ptr %9 to ptr addrspace(4)
  %18 = addrspacecast ptr %10 to ptr addrspace(4)
  %19 = addrspacecast ptr %11 to ptr addrspace(4)
  %20 = addrspacecast ptr %12 to ptr addrspace(4)
  %21 = addrspacecast ptr %13 to ptr addrspace(4)
  %22 = addrspacecast ptr %14 to ptr addrspace(4)
  %23 = addrspacecast ptr %15 to ptr addrspace(4)
  store ptr addrspace(4) %0, ptr addrspace(4) %16, align 8
  %24 = addrspacecast ptr %1 to ptr addrspace(4)
  store ptr addrspace(4) %24, ptr addrspace(4) %17, align 8
  %25 = load ptr addrspace(4), ptr addrspace(4) %16, align 8
  %26 = addrspacecast ptr %3 to ptr addrspace(4)
  %27 = addrspacecast ptr %4 to ptr addrspace(4)
  %28 = addrspacecast ptr %5 to ptr addrspace(4)
  %29 = addrspacecast ptr %6 to ptr addrspace(4)
  %30 = addrspacecast ptr %7 to ptr addrspace(4)
  store ptr addrspace(4) %24, ptr addrspace(4) %27, align 8
  store i32 0, ptr addrspace(4) %28, align 4
  %31 = load ptr addrspace(4), ptr addrspace(4) %27, align 8
  call spir_func void @_ZNK4sycl3_V17nd_itemILi1EE13get_global_idEv(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::id") align 8 %30, ptr addrspace(4) noundef align 1 dereferenceable_or_null(1) %31) #5
  %32 = load i32, ptr addrspace(4) %28, align 4
  %33 = call spir_func noundef align 8 dereferenceable(8) ptr addrspace(4) @_ZN4sycl3_V16detail5arrayILi1EEixEi(ptr addrspace(4) noundef align 8 dereferenceable_or_null(8) %30, i32 noundef %32) #5
  %34 = load i64, ptr addrspace(4) %33, align 8
  store i64 %34, ptr addrspace(4) %29, align 8
  %35 = load i64, ptr addrspace(4) %29, align 8
  %36 = icmp ule i64 %35, 2147483647
  call void @llvm.assume(i1 %36)
  %37 = load i64, ptr addrspace(4) %29, align 8
  %38 = trunc i64 %37 to i32
  store i32 %38, ptr addrspace(4) %18, align 4
  %39 = load i32, ptr addrspace(4) %18, align 4
  %40 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %25, i32 0, i32 0
  %41 = load i32, ptr addrspace(4) %40, align 8
  %42 = sdiv i32 %41, 2
  %43 = icmp slt i32 %39, %42
  br i1 %43, label %44, label %157

44:                                               ; preds = %2
  %45 = load i32, ptr addrspace(4) %18, align 4
  store i32 %45, ptr addrspace(4) %19, align 4
  %46 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %25, i32 0, i32 0
  %47 = load i32, ptr addrspace(4) %46, align 8
  %48 = sub nsw i32 %47, 1
  %49 = load i32, ptr addrspace(4) %18, align 4
  %50 = sub nsw i32 %48, %49
  store i32 %50, ptr addrspace(4) %20, align 4
  %51 = load i32, ptr addrspace(4) %19, align 4
  %fi_flip = xor i32 %51, -2147483648
  store i32 %fi_flip, ptr addrspace(4) %21, align 4
  br label %52

52:                                               ; preds = %153, %44
  %53 = load i32, ptr addrspace(4) %21, align 4
  %54 = load i32, ptr addrspace(4) %20, align 4
  %55 = icmp slt i32 %53, %54
  br i1 %55, label %56, label %156

56:                                               ; preds = %52
  %57 = load i32, ptr addrspace(4) %21, align 4
  %58 = load i32, ptr addrspace(4) %19, align 4
  %59 = sub nsw i32 %57, %58
  store i32 %59, ptr addrspace(4) %22, align 4
  %60 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %25, i32 0, i32 1
  %61 = load ptr addrspace(4), ptr addrspace(4) %60, align 8
  %62 = load i32, ptr addrspace(4) %19, align 4
  %63 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %25, i32 0, i32 0
  %64 = load i32, ptr addrspace(4) %63, align 8
  %65 = mul nsw i32 %62, %64
  %66 = load i32, ptr addrspace(4) %21, align 4
  %67 = add nsw i32 %65, %66
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds float, ptr addrspace(4) %61, i64 %68
  %70 = load float, ptr addrspace(4) %69, align 4
  store float %70, ptr addrspace(4) %23, align 4
  %71 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %25, i32 0, i32 1
  %72 = load ptr addrspace(4), ptr addrspace(4) %71, align 8
  %73 = load i32, ptr addrspace(4) %20, align 4
  %74 = load i32, ptr addrspace(4) %22, align 4
  %75 = sub nsw i32 %73, %74
  %76 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %25, i32 0, i32 0
  %77 = load i32, ptr addrspace(4) %76, align 8
  %78 = mul nsw i32 %75, %77
  %79 = load i32, ptr addrspace(4) %19, align 4
  %80 = add nsw i32 %78, %79
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds float, ptr addrspace(4) %72, i64 %81
  %83 = load float, ptr addrspace(4) %82, align 4
  %84 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %25, i32 0, i32 1
  %85 = load ptr addrspace(4), ptr addrspace(4) %84, align 8
  %86 = load i32, ptr addrspace(4) %19, align 4
  %87 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %25, i32 0, i32 0
  %88 = load i32, ptr addrspace(4) %87, align 8
  %89 = mul nsw i32 %86, %88
  %90 = load i32, ptr addrspace(4) %21, align 4
  %91 = add nsw i32 %89, %90
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds float, ptr addrspace(4) %85, i64 %92
  store float %83, ptr addrspace(4) %93, align 4
  %94 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %25, i32 0, i32 1
  %95 = load ptr addrspace(4), ptr addrspace(4) %94, align 8
  %96 = load i32, ptr addrspace(4) %20, align 4
  %97 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %25, i32 0, i32 0
  %98 = load i32, ptr addrspace(4) %97, align 8
  %99 = mul nsw i32 %96, %98
  %100 = load i32, ptr addrspace(4) %20, align 4
  %101 = load i32, ptr addrspace(4) %22, align 4
  %102 = sub nsw i32 %100, %101
  %103 = add nsw i32 %99, %102
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds float, ptr addrspace(4) %95, i64 %104
  %106 = load float, ptr addrspace(4) %105, align 4
  %107 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %25, i32 0, i32 1
  %108 = load ptr addrspace(4), ptr addrspace(4) %107, align 8
  %109 = load i32, ptr addrspace(4) %20, align 4
  %110 = load i32, ptr addrspace(4) %22, align 4
  %111 = sub nsw i32 %109, %110
  %112 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %25, i32 0, i32 0
  %113 = load i32, ptr addrspace(4) %112, align 8
  %114 = mul nsw i32 %111, %113
  %115 = load i32, ptr addrspace(4) %19, align 4
  %116 = add nsw i32 %114, %115
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds float, ptr addrspace(4) %108, i64 %117
  store float %106, ptr addrspace(4) %118, align 4
  %119 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %25, i32 0, i32 1
  %120 = load ptr addrspace(4), ptr addrspace(4) %119, align 8
  %121 = load i32, ptr addrspace(4) %21, align 4
  %122 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %25, i32 0, i32 0
  %123 = load i32, ptr addrspace(4) %122, align 8
  %124 = mul nsw i32 %121, %123
  %125 = load i32, ptr addrspace(4) %20, align 4
  %126 = add nsw i32 %124, %125
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds float, ptr addrspace(4) %120, i64 %127
  %129 = load float, ptr addrspace(4) %128, align 4
  %130 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %25, i32 0, i32 1
  %131 = load ptr addrspace(4), ptr addrspace(4) %130, align 8
  %132 = load i32, ptr addrspace(4) %20, align 4
  %133 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %25, i32 0, i32 0
  %134 = load i32, ptr addrspace(4) %133, align 8
  %135 = mul nsw i32 %132, %134
  %136 = load i32, ptr addrspace(4) %20, align 4
  %137 = load i32, ptr addrspace(4) %22, align 4
  %138 = sub nsw i32 %136, %137
  %139 = add nsw i32 %135, %138
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds float, ptr addrspace(4) %131, i64 %140
  store float %129, ptr addrspace(4) %141, align 4
  %142 = load float, ptr addrspace(4) %23, align 4
  %143 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %25, i32 0, i32 1
  %144 = load ptr addrspace(4), ptr addrspace(4) %143, align 8
  %145 = load i32, ptr addrspace(4) %21, align 4
  %146 = getelementptr inbounds nuw %class._ZTSZZ4mainENKUlRN4sycl3_V17handlerEE_clES2_EUlNS0_7nd_itemILi1EEEE_, ptr addrspace(4) %25, i32 0, i32 0
  %147 = load i32, ptr addrspace(4) %146, align 8
  %148 = mul nsw i32 %145, %147
  %149 = load i32, ptr addrspace(4) %20, align 4
  %150 = add nsw i32 %148, %149
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds float, ptr addrspace(4) %144, i64 %151
  store float %142, ptr addrspace(4) %152, align 4
  br label %153

153:                                              ; preds = %56
  %154 = load i32, ptr addrspace(4) %21, align 4
  %155 = add nsw i32 %154, 1
  store i32 %155, ptr addrspace(4) %21, align 4
  br label %52, !llvm.loop !9

156:                                              ; preds = %52
  br label %157

157:                                              ; preds = %156, %2
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN4sycl3_V16detail7Builder10getElementILi1EEEKNS0_7nd_itemIXT_EEEPS5_(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::nd_item") align 1 %0, ptr addrspace(4) noundef %1) #1 comdat align 2 !srcloc !11 {
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
define linkonce_odr dso_local spir_func noundef ptr addrspace(4) @_ZN4sycl3_V16detail7declptrINS0_7nd_itemILi1EEEEEPT_v() #1 comdat !srcloc !12 {
  %1 = alloca ptr addrspace(4), align 8
  %2 = addrspacecast ptr %1 to ptr addrspace(4)
  ret ptr addrspace(4) null
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZNK4sycl3_V17nd_itemILi1EE13get_global_idEv(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::id") align 8 %0, ptr addrspace(4) noundef align 1 dereferenceable_or_null(1) %1) #1 comdat align 2 !srcloc !13 {
  %3 = alloca ptr addrspace(4), align 8
  %4 = addrspacecast ptr %3 to ptr addrspace(4)
  store ptr addrspace(4) %1, ptr addrspace(4) %4, align 8
  %5 = load ptr addrspace(4), ptr addrspace(4) %4, align 8
  call spir_func void @_ZN7__spirv22initGlobalInvocationIdILi1EN4sycl3_V12idILi1EEEEET0_v(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::id") align 8 %0) #5
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef align 8 dereferenceable(8) ptr addrspace(4) @_ZN4sycl3_V16detail5arrayILi1EEixEi(ptr addrspace(4) noundef align 8 dereferenceable_or_null(8) %0, i32 noundef %1) #1 comdat align 2 !srcloc !14 {
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
define linkonce_odr dso_local spir_func void @_ZN7__spirv22initGlobalInvocationIdILi1EN4sycl3_V12idILi1EEEEET0_v(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::id") align 8 %0) #1 comdat !srcloc !15 {
  call spir_func void @_ZN7__spirv29InitSizesSTGlobalInvocationIdILi1EN4sycl3_V12idILi1EEEE8initSizeEv(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::id") align 8 %0) #5
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN7__spirv29InitSizesSTGlobalInvocationIdILi1EN4sycl3_V12idILi1EEEE8initSizeEv(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::id") align 8 %0) #1 comdat align 2 !srcloc !16 {
  %2 = call spir_func noundef i64 @_ZN7__spirv21getGlobalInvocationIdILi0EEEmv() #5
  call spir_func void @_ZN4sycl3_V12idILi1EEC2ILi1EEENSt9enable_ifIXeqT_Li1EEmE4typeE(ptr addrspace(4) noundef align 8 dereferenceable_or_null(8) %0, i64 noundef %2) #5
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef i64 @_ZN7__spirv21getGlobalInvocationIdILi0EEEmv() #1 !srcloc !17 {
  %1 = alloca i64, align 8
  %2 = addrspacecast ptr %1 to ptr addrspace(4)
  %3 = call spir_func noundef i64 @_Z28__spirv_GlobalInvocationId_xv() #5
  ret i64 %3
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN4sycl3_V12idILi1EEC2ILi1EEENSt9enable_ifIXeqT_Li1EEmE4typeE(ptr addrspace(4) noundef align 8 dereferenceable_or_null(8) %0, i64 noundef %1) unnamed_addr #1 comdat align 2 !srcloc !18 {
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
define linkonce_odr dso_local spir_func noundef i64 @_Z28__spirv_GlobalInvocationId_xv() #3 comdat !srcloc !19 {
  %1 = alloca i64, align 8
  %2 = addrspacecast ptr %1 to ptr addrspace(4)
  %3 = load <3 x i64>, ptr addrspace(4) addrspacecast (ptr addrspace(1) @__spirv_BuiltInGlobalInvocationId to ptr addrspace(4)), align 32
  %4 = extractelement <3 x i64> %3, i64 0
  ret i64 %4
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
define linkonce_odr dso_local spir_func void @_ZN7__spirv14initGlobalSizeILi1EN4sycl3_V15rangeILi1EEEEET0_v(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::range") align 8 %0) #1 comdat !srcloc !21 {
  call spir_func void @_ZN7__spirv21InitSizesSTGlobalSizeILi1EN4sycl3_V15rangeILi1EEEE8initSizeEv(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::range") align 8 %0) #5
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN7__spirv17initWorkgroupSizeILi1EN4sycl3_V15rangeILi1EEEEET0_v(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::range") align 8 %0) #1 comdat !srcloc !22 {
  call spir_func void @_ZN7__spirv24InitSizesSTWorkgroupSizeILi1EN4sycl3_V15rangeILi1EEEE8initSizeEv(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::range") align 8 %0) #5
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN7__spirv17initNumWorkgroupsILi1EN4sycl3_V15rangeILi1EEEEET0_v(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::range") align 8 %0) #1 comdat !srcloc !23 {
  call spir_func void @_ZN7__spirv24InitSizesSTNumWorkgroupsILi1EN4sycl3_V15rangeILi1EEEE8initSizeEv(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::range") align 8 %0) #5
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN7__spirv15initWorkgroupIdILi1EN4sycl3_V12idILi1EEEEET0_v(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::id") align 8 %0) #1 comdat !srcloc !24 {
  call spir_func void @_ZN7__spirv22InitSizesSTWorkgroupIdILi1EN4sycl3_V12idILi1EEEE8initSizeEv(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::id") align 8 %0) #5
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN7__spirv21initLocalInvocationIdILi1EN4sycl3_V12idILi1EEEEET0_v(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::id") align 8 %0) #1 comdat !srcloc !25 {
  call spir_func void @_ZN7__spirv28InitSizesSTLocalInvocationIdILi1EN4sycl3_V12idILi1EEEE8initSizeEv(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::id") align 8 %0) #5
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN7__spirv16initGlobalOffsetILi1EN4sycl3_V12idILi1EEEEET0_v(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::id") align 8 %0) #1 comdat !srcloc !26 {
  call spir_func void @_ZN7__spirv23InitSizesSTGlobalOffsetILi1EN4sycl3_V12idILi1EEEE8initSizeEv(ptr addrspace(4) dead_on_unwind writable sret(%"class.sycl::_V1::id") align 8 %0) #5
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN4sycl3_V16detail7Builder11createGroupILi1EEENS0_5groupIXT_EEERKNS0_5rangeIXT_EEES9_S9_RKNS0_2idIXT_EEE(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::group") align 8 %0, ptr addrspace(4) noundef align 8 dereferenceable(8) %1, ptr addrspace(4) noundef align 8 dereferenceable(8) %2, ptr addrspace(4) noundef align 8 dereferenceable(8) %3, ptr addrspace(4) noundef align 8 dereferenceable(8) %4) #1 comdat align 2 !srcloc !27 {
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
define linkonce_odr dso_local spir_func void @_ZN4sycl3_V16detail7Builder10createItemILi1ELb1EEENSt9enable_ifIXT0_ENS0_4itemIXT_EXT0_EEEE4typeERKNS0_5rangeIXT_EEERKNS0_2idIXT_EEESG_(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::item") align 8 %0, ptr addrspace(4) noundef align 8 dereferenceable(8) %1, ptr addrspace(4) noundef align 8 dereferenceable(8) %2, ptr addrspace(4) noundef align 8 dereferenceable(8) %3) #1 comdat align 2 !srcloc !28 {
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
define linkonce_odr dso_local spir_func void @_ZN4sycl3_V16detail7Builder10createItemILi1ELb0EEENSt9enable_ifIXntT0_ENS0_4itemIXT_EXT0_EEEE4typeERKNS0_5rangeIXT_EEERKNS0_2idIXT_EEE(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::item.0") align 8 %0, ptr addrspace(4) noundef align 8 dereferenceable(8) %1, ptr addrspace(4) noundef align 8 dereferenceable(8) %2) #1 comdat align 2 !srcloc !29 {
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
define linkonce_odr dso_local spir_func void @_ZN4sycl3_V16detail7Builder12createNDItemILi1EEENS0_7nd_itemIXT_EEERKNS0_4itemIXT_ELb1EEERKNS6_IXT_ELb0EEERKNS0_5groupIXT_EEE(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::nd_item") align 1 %0, ptr addrspace(4) noundef align 8 dereferenceable(24) %1, ptr addrspace(4) noundef align 8 dereferenceable(16) %2, ptr addrspace(4) noundef align 8 dereferenceable(32) %3) #1 comdat align 2 !srcloc !30 {
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
define linkonce_odr dso_local spir_func void @_ZN7__spirv21InitSizesSTGlobalSizeILi1EN4sycl3_V15rangeILi1EEEE8initSizeEv(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::range") align 8 %0) #1 comdat align 2 !srcloc !31 {
  %2 = call spir_func noundef i64 @_ZN7__spirv13getGlobalSizeILi0EEEmv() #5
  call spir_func void @_ZN4sycl3_V15rangeILi1EEC2ILi1EEENSt9enable_ifIXeqT_Li1EEmE4typeE(ptr addrspace(4) noundef align 8 dereferenceable_or_null(8) %0, i64 noundef %2) #5
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef i64 @_ZN7__spirv13getGlobalSizeILi0EEEmv() #1 !srcloc !32 {
  %1 = alloca i64, align 8
  %2 = addrspacecast ptr %1 to ptr addrspace(4)
  %3 = call spir_func noundef i64 @_Z20__spirv_GlobalSize_xv() #5
  ret i64 %3
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN4sycl3_V15rangeILi1EEC2ILi1EEENSt9enable_ifIXeqT_Li1EEmE4typeE(ptr addrspace(4) noundef align 8 dereferenceable_or_null(8) %0, i64 noundef %1) unnamed_addr #1 comdat align 2 !srcloc !33 {
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
define linkonce_odr dso_local spir_func noundef i64 @_Z20__spirv_GlobalSize_xv() #3 comdat !srcloc !34 {
  %1 = alloca i64, align 8
  %2 = addrspacecast ptr %1 to ptr addrspace(4)
  %3 = load <3 x i64>, ptr addrspace(4) addrspacecast (ptr addrspace(1) @__spirv_BuiltInGlobalSize to ptr addrspace(4)), align 32
  %4 = extractelement <3 x i64> %3, i64 0
  ret i64 %4
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN7__spirv24InitSizesSTWorkgroupSizeILi1EN4sycl3_V15rangeILi1EEEE8initSizeEv(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::range") align 8 %0) #1 comdat align 2 !srcloc !35 {
  %2 = call spir_func noundef i64 @_ZN7__spirv16getWorkgroupSizeILi0EEEmv() #5
  call spir_func void @_ZN4sycl3_V15rangeILi1EEC2ILi1EEENSt9enable_ifIXeqT_Li1EEmE4typeE(ptr addrspace(4) noundef align 8 dereferenceable_or_null(8) %0, i64 noundef %2) #5
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef i64 @_ZN7__spirv16getWorkgroupSizeILi0EEEmv() #1 !srcloc !36 {
  %1 = alloca i64, align 8
  %2 = addrspacecast ptr %1 to ptr addrspace(4)
  %3 = call spir_func noundef i64 @_Z23__spirv_WorkgroupSize_xv() #5
  ret i64 %3
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef i64 @_Z23__spirv_WorkgroupSize_xv() #3 comdat !srcloc !37 {
  %1 = alloca i64, align 8
  %2 = addrspacecast ptr %1 to ptr addrspace(4)
  %3 = load <3 x i64>, ptr addrspace(4) addrspacecast (ptr addrspace(1) @__spirv_BuiltInWorkgroupSize to ptr addrspace(4)), align 32
  %4 = extractelement <3 x i64> %3, i64 0
  ret i64 %4
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN7__spirv24InitSizesSTNumWorkgroupsILi1EN4sycl3_V15rangeILi1EEEE8initSizeEv(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::range") align 8 %0) #1 comdat align 2 !srcloc !38 {
  %2 = call spir_func noundef i64 @_ZN7__spirv16getNumWorkgroupsILi0EEEmv() #5
  call spir_func void @_ZN4sycl3_V15rangeILi1EEC2ILi1EEENSt9enable_ifIXeqT_Li1EEmE4typeE(ptr addrspace(4) noundef align 8 dereferenceable_or_null(8) %0, i64 noundef %2) #5
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef i64 @_ZN7__spirv16getNumWorkgroupsILi0EEEmv() #1 !srcloc !39 {
  %1 = alloca i64, align 8
  %2 = addrspacecast ptr %1 to ptr addrspace(4)
  %3 = call spir_func noundef i64 @_Z23__spirv_NumWorkgroups_xv() #5
  ret i64 %3
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef i64 @_Z23__spirv_NumWorkgroups_xv() #3 comdat !srcloc !40 {
  %1 = alloca i64, align 8
  %2 = addrspacecast ptr %1 to ptr addrspace(4)
  %3 = load <3 x i64>, ptr addrspace(4) addrspacecast (ptr addrspace(1) @__spirv_BuiltInNumWorkgroups to ptr addrspace(4)), align 32
  %4 = extractelement <3 x i64> %3, i64 0
  ret i64 %4
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN7__spirv22InitSizesSTWorkgroupIdILi1EN4sycl3_V12idILi1EEEE8initSizeEv(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::id") align 8 %0) #1 comdat align 2 !srcloc !41 {
  %2 = call spir_func noundef i64 @_ZN7__spirv14getWorkgroupIdILi0EEEmv() #5
  call spir_func void @_ZN4sycl3_V12idILi1EEC2ILi1EEENSt9enable_ifIXeqT_Li1EEmE4typeE(ptr addrspace(4) noundef align 8 dereferenceable_or_null(8) %0, i64 noundef %2) #5
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef i64 @_ZN7__spirv14getWorkgroupIdILi0EEEmv() #1 !srcloc !42 {
  %1 = alloca i64, align 8
  %2 = addrspacecast ptr %1 to ptr addrspace(4)
  %3 = call spir_func noundef i64 @_Z21__spirv_WorkgroupId_xv() #5
  ret i64 %3
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef i64 @_Z21__spirv_WorkgroupId_xv() #3 comdat !srcloc !43 {
  %1 = alloca i64, align 8
  %2 = addrspacecast ptr %1 to ptr addrspace(4)
  %3 = load <3 x i64>, ptr addrspace(4) addrspacecast (ptr addrspace(1) @__spirv_BuiltInWorkgroupId to ptr addrspace(4)), align 32
  %4 = extractelement <3 x i64> %3, i64 0
  ret i64 %4
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN7__spirv28InitSizesSTLocalInvocationIdILi1EN4sycl3_V12idILi1EEEE8initSizeEv(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::id") align 8 %0) #1 comdat align 2 !srcloc !44 {
  %2 = call spir_func noundef i64 @_ZN7__spirv20getLocalInvocationIdILi0EEEmv() #5
  call spir_func void @_ZN4sycl3_V12idILi1EEC2ILi1EEENSt9enable_ifIXeqT_Li1EEmE4typeE(ptr addrspace(4) noundef align 8 dereferenceable_or_null(8) %0, i64 noundef %2) #5
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef i64 @_ZN7__spirv20getLocalInvocationIdILi0EEEmv() #1 !srcloc !45 {
  %1 = alloca i64, align 8
  %2 = addrspacecast ptr %1 to ptr addrspace(4)
  %3 = call spir_func noundef i64 @_Z27__spirv_LocalInvocationId_xv() #5
  ret i64 %3
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef i64 @_Z27__spirv_LocalInvocationId_xv() #3 comdat !srcloc !46 {
  %1 = alloca i64, align 8
  %2 = addrspacecast ptr %1 to ptr addrspace(4)
  %3 = load <3 x i64>, ptr addrspace(4) addrspacecast (ptr addrspace(1) @__spirv_BuiltInLocalInvocationId to ptr addrspace(4)), align 32
  %4 = extractelement <3 x i64> %3, i64 0
  ret i64 %4
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN7__spirv23InitSizesSTGlobalOffsetILi1EN4sycl3_V12idILi1EEEE8initSizeEv(ptr addrspace(4) dead_on_unwind noalias writable sret(%"class.sycl::_V1::id") align 8 %0) #1 comdat align 2 !srcloc !47 {
  %2 = call spir_func noundef i64 @_ZN7__spirv15getGlobalOffsetILi0EEEmv() #5
  call spir_func void @_ZN4sycl3_V12idILi1EEC2ILi1EEENSt9enable_ifIXeqT_Li1EEmE4typeE(ptr addrspace(4) noundef align 8 dereferenceable_or_null(8) %0, i64 noundef %2) #5
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef i64 @_ZN7__spirv15getGlobalOffsetILi0EEEmv() #1 !srcloc !48 {
  %1 = alloca i64, align 8
  %2 = addrspacecast ptr %1 to ptr addrspace(4)
  %3 = call spir_func noundef i64 @_Z22__spirv_GlobalOffset_xv() #5
  ret i64 %3
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func noundef i64 @_Z22__spirv_GlobalOffset_xv() #3 comdat !srcloc !49 {
  %1 = alloca i64, align 8
  %2 = addrspacecast ptr %1 to ptr addrspace(4)
  %3 = load <3 x i64>, ptr addrspace(4) addrspacecast (ptr addrspace(1) @__spirv_BuiltInGlobalOffset to ptr addrspace(4)), align 32
  %4 = extractelement <3 x i64> %3, i64 0
  ret i64 %4
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p4.p4.i64(ptr addrspace(4) noalias writeonly captures(none), ptr addrspace(4) noalias readonly captures(none), i64, i1 immarg) #4

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define linkonce_odr dso_local spir_func void @_ZN4sycl3_V15groupILi1EEC2ERKNS0_5rangeILi1EEES6_S4_RKNS0_2idILi1EEE(ptr addrspace(4) noundef align 8 dereferenceable_or_null(32) %0, ptr addrspace(4) noundef align 8 dereferenceable(8) %1, ptr addrspace(4) noundef align 8 dereferenceable(8) %2, ptr noundef byval(%"class.sycl::_V1::range") align 8 %3, ptr addrspace(4) noundef align 8 dereferenceable(8) %4) unnamed_addr #1 comdat align 2 !srcloc !50 {
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
define linkonce_odr dso_local spir_func void @_ZN4sycl3_V14itemILi1ELb1EEC2ILb1EEERNSt9enable_ifIXT_EKNS0_5rangeILi1EEEE4typeERKNS0_2idILi1EEESE_(ptr addrspace(4) noundef align 8 dereferenceable_or_null(24) %0, ptr addrspace(4) noundef align 8 dereferenceable(8) %1, ptr addrspace(4) noundef align 8 dereferenceable(8) %2, ptr addrspace(4) noundef align 8 dereferenceable(8) %3) unnamed_addr #1 comdat align 2 !srcloc !51 {
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
define linkonce_odr dso_local spir_func void @_ZN4sycl3_V14itemILi1ELb0EEC2ILb0EEERNSt9enable_ifIXntT_EKNS0_5rangeILi1EEEE4typeERKNS0_2idILi1EEE(ptr addrspace(4) noundef align 8 dereferenceable_or_null(16) %0, ptr addrspace(4) noundef align 8 dereferenceable(8) %1, ptr addrspace(4) noundef align 8 dereferenceable(8) %2) unnamed_addr #1 comdat align 2 !srcloc !52 {
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
define linkonce_odr dso_local spir_func void @_ZN4sycl3_V17nd_itemILi1EEC2ERKNS0_4itemILi1ELb1EEERKNS3_ILi1ELb0EEERKNS0_5groupILi1EEE(ptr addrspace(4) noundef align 1 dereferenceable_or_null(1) %0, ptr addrspace(4) noundef align 8 dereferenceable(24) %1, ptr addrspace(4) noundef align 8 dereferenceable(16) %2, ptr addrspace(4) noundef align 8 dereferenceable(32) %3) unnamed_addr #1 comdat align 2 !srcloc !53 {
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

attributes #0 = { convergent mustprogress noinline norecurse nounwind optnone "approx-func-fp-math"="true" "frame-pointer"="all" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "sycl-module-id"="/home/mdunlavy/GPU_FI/HeCBench/src/matrix-rotate-sycl/main.cpp" "sycl-optlevel"="0" "uniform-work-group-size"="true" "unsafe-fp-math"="true" }
attributes #1 = { convergent mustprogress noinline norecurse nounwind optnone "approx-func-fp-math"="true" "frame-pointer"="all" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "sycl-optlevel"="0" "unsafe-fp-math"="true" }
attributes #2 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }
attributes #3 = { convergent mustprogress noinline norecurse nounwind optnone "approx-func-fp-math"="true" "frame-pointer"="all" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "sycl-module-id"="/home/mdunlavy/GPU_FI/HeCBench/src/matrix-rotate-sycl/main.cpp" "sycl-optlevel"="0" "unsafe-fp-math"="true" }
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
!6 = !{i32 2655}
!7 = !{i32 -1, i32 -1}
!8 = !{}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.mustprogress"}
!11 = !{i32 2555959}
!12 = !{i32 2551685}
!13 = !{i32 7502354}
!14 = !{i32 5486227}
!15 = !{i32 -2144272206}
!16 = !{i32 -2144274197}
!17 = !{i32 -2144272611}
!18 = !{i32 5918990}
!19 = !{i32 3199579}
!20 = !{i32 5485049}
!21 = !{i32 -2144274896}
!22 = !{i32 -2144269680}
!23 = !{i32 -2144267164}
!24 = !{i32 -2144262052}
!25 = !{i32 -2144264504}
!26 = !{i32 -2144259576}
!27 = !{i32 2552142}
!28 = !{i32 2552854}
!29 = !{i32 2553121}
!30 = !{i32 2553284}
!31 = !{i32 -2144276599}
!32 = !{i32 -2144275173}
!33 = !{i32 5932773}
!34 = !{i32 3199931}
!35 = !{i32 -2144271491}
!36 = !{i32 -2144270005}
!37 = !{i32 3200873}
!38 = !{i32 -2144268975}
!39 = !{i32 -2144267489}
!40 = !{i32 3200551}
!41 = !{i32 -2144263791}
!42 = !{i32 -2144262345}
!43 = !{i32 3201195}
!44 = !{i32 -2144266459}
!45 = !{i32 -2144264893}
!46 = !{i32 3201505}
!47 = !{i32 -2144261351}
!48 = !{i32 -2144259885}
!49 = !{i32 3200235}
!50 = !{i32 7463898}
!51 = !{i32 7473767}
!52 = !{i32 7473987}
!53 = !{i32 7522618}
