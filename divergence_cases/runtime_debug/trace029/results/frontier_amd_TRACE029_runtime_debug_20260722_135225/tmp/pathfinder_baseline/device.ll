; ModuleID = '/ccs/home/mdunlavy/GPU_FI/divergence_cases/runtime_debug/trace029/pathfinder-hip_runtime_debug/main.cu'
source_filename = "/ccs/home/mdunlavy/GPU_FI/divergence_cases/runtime_debug/trace029/pathfinder-hip_runtime_debug/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8:9"
target triple = "amdgcn-amd-amdhsa"

%0 = type { i64, i64, i32, i32 }
%1 = type { [64 x [8 x i64]] }
%struct.__hip_builtin_blockDim_t = type { i8 }
%struct.__hip_builtin_blockIdx_t = type { i8 }
%struct.__hip_builtin_threadIdx_t = type { i8 }
%struct.Trace029RuntimeRecord = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }

$_Z13__syncthreadsv = comdat any

$_Z9atomicAddPjj = comdat any

@__const.__assert_fail.fmt = private unnamed_addr addrspace(4) constant [47 x i8] c"%s:%u: %s: Device-side assertion `%s' failed.\0A\00", align 16
@blockDim = extern_weak dso_local protected addrspace(1) global %struct.__hip_builtin_blockDim_t, align 1
@blockIdx = extern_weak dso_local protected addrspace(1) global %struct.__hip_builtin_blockIdx_t, align 1
@threadIdx = extern_weak dso_local protected addrspace(1) global %struct.__hip_builtin_threadIdx_t, align 1
@_ZZ10pathfinderPKiS0_PiS1_P21Trace029RuntimeRecordPjS4_S4_iiiiiE4prev = internal addrspace(3) global [250 x i32] undef, align 16, !dbg !0
@_ZZ10pathfinderPKiS0_PiS1_P21Trace029RuntimeRecordPjS4_S4_iiiiiE6result = internal addrspace(3) global [250 x i32] undef, align 16, !dbg !54
@.str = private unnamed_addr addrspace(4) constant [10 x i8] c"workgroup\00", align 1
@__hip_cuid_97233e4095a168cb = addrspace(1) global i8 0
@llvm.compiler.used = appending addrspace(1) global [1 x ptr] [ptr addrspacecast (ptr addrspace(1) @__hip_cuid_97233e4095a168cb to ptr)], section "llvm.metadata"
@__oclc_ISA_version = internal local_unnamed_addr addrspace(4) constant i32 9010, align 4
@__oclc_ABI_version = weak_odr hidden local_unnamed_addr addrspace(4) constant i32 600

; Function Attrs: convergent mustprogress noinline noreturn nounwind optnone
define weak void @__cxa_pure_virtual() #0 !dbg !1672 {
  call void @llvm.trap(), !dbg !1674
  unreachable, !dbg !1675
}

; Function Attrs: cold noreturn nounwind memory(inaccessiblemem: write)
declare void @llvm.trap() #1

; Function Attrs: convergent mustprogress noinline noreturn nounwind optnone
define weak void @__cxa_deleted_virtual() #0 !dbg !1676 {
  call void @llvm.trap(), !dbg !1677
  unreachable, !dbg !1678
}

; Function Attrs: convergent mustprogress noinline nounwind optnone
define weak hidden void @__assert_fail(ptr noundef %0, ptr noundef %1, i32 noundef %2, ptr noundef %3) #2 !dbg !1679 {
  %5 = alloca ptr, align 8, addrspace(5)
  %6 = alloca ptr, align 8, addrspace(5)
  %7 = alloca i32, align 4, addrspace(5)
  %8 = alloca ptr, align 8, addrspace(5)
  %9 = alloca [47 x i8], align 16, addrspace(5)
  %10 = alloca i64, align 8, addrspace(5)
  %11 = alloca i32, align 4, addrspace(5)
  %12 = alloca ptr, align 8, addrspace(5)
  %13 = alloca ptr, align 8, addrspace(5)
  %14 = alloca ptr, align 8, addrspace(5)
  %15 = alloca ptr, align 8, addrspace(5)
  %16 = addrspacecast ptr addrspace(5) %5 to ptr
  %17 = addrspacecast ptr addrspace(5) %6 to ptr
  %18 = addrspacecast ptr addrspace(5) %7 to ptr
  %19 = addrspacecast ptr addrspace(5) %8 to ptr
  %20 = addrspacecast ptr addrspace(5) %9 to ptr
  %21 = addrspacecast ptr addrspace(5) %10 to ptr
  %22 = addrspacecast ptr addrspace(5) %11 to ptr
  %23 = addrspacecast ptr addrspace(5) %12 to ptr
  %24 = addrspacecast ptr addrspace(5) %13 to ptr
  %25 = addrspacecast ptr addrspace(5) %14 to ptr
  %26 = addrspacecast ptr addrspace(5) %15 to ptr
  store ptr %0, ptr %16, align 8
    #dbg_declare(ptr addrspace(5) %5, !1684, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(ptr)), !1702)
  store ptr %1, ptr %17, align 8
    #dbg_declare(ptr addrspace(5) %6, !1685, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(ptr)), !1703)
  store i32 %2, ptr %18, align 4
    #dbg_declare(ptr addrspace(5) %7, !1686, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1704)
  store ptr %3, ptr %19, align 8
    #dbg_declare(ptr addrspace(5) %8, !1687, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(ptr)), !1705)
    #dbg_declare(ptr addrspace(5) %9, !1688, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref([47 x i8])), !1706)
  call void @llvm.memcpy.p0.p4.i64(ptr align 16 %20, ptr addrspace(4) align 16 @__const.__assert_fail.fmt, i64 47, i1 false), !dbg !1706
    #dbg_declare(ptr addrspace(5) %10, !1692, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i64)), !1707)
  %27 = call i64 @__ockl_fprintf_stderr_begin() #13, !dbg !1708
  store i64 %27, ptr %21, align 8, !dbg !1707
    #dbg_declare(ptr addrspace(5) %11, !1693, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1709)
  store i32 0, ptr %22, align 4, !dbg !1709
  br label %28, !dbg !1710

28:                                               ; preds = %4
    #dbg_declare(ptr addrspace(5) %12, !1694, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(ptr)), !1711)
  %29 = getelementptr inbounds [47 x i8], ptr %20, i64 0, i64 0, !dbg !1711
  store ptr %29, ptr %23, align 8, !dbg !1711
  br label %30, !dbg !1711

30:                                               ; preds = %35, %28
  %31 = load ptr, ptr %23, align 8, !dbg !1711
  %32 = getelementptr inbounds i8, ptr %31, i32 1, !dbg !1711
  store ptr %32, ptr %23, align 8, !dbg !1711
  %33 = load i8, ptr %31, align 1, !dbg !1711
  %34 = icmp ne i8 %33, 0, !dbg !1711
  br i1 %34, label %35, label %36, !dbg !1711

35:                                               ; preds = %30
  br label %30, !dbg !1711, !llvm.loop !1712

36:                                               ; preds = %30
  %37 = load ptr, ptr %23, align 8, !dbg !1711
  %38 = getelementptr inbounds [47 x i8], ptr %20, i64 0, i64 0, !dbg !1711
  %39 = ptrtoint ptr %37 to i64, !dbg !1711
  %40 = ptrtoint ptr %38 to i64, !dbg !1711
  %41 = sub i64 %39, %40, !dbg !1711
  %42 = trunc i64 %41 to i32, !dbg !1711
  store i32 %42, ptr %22, align 4, !dbg !1711
  br label %43, !dbg !1711

43:                                               ; preds = %36
  %44 = load i64, ptr %21, align 8, !dbg !1714
  %45 = getelementptr inbounds [47 x i8], ptr %20, i64 0, i64 0, !dbg !1715
  %46 = load i32, ptr %22, align 4, !dbg !1716
  %47 = sext i32 %46 to i64, !dbg !1716
  %48 = call i64 @__ockl_fprintf_append_string_n(i64 noundef %44, ptr noundef %45, i64 noundef %47, i32 noundef 0) #13, !dbg !1717
  store i64 %48, ptr %21, align 8, !dbg !1718
  br label %49, !dbg !1719

49:                                               ; preds = %43
    #dbg_declare(ptr addrspace(5) %13, !1696, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(ptr)), !1720)
  %50 = load ptr, ptr %17, align 8, !dbg !1720
  store ptr %50, ptr %24, align 8, !dbg !1720
  br label %51, !dbg !1720

51:                                               ; preds = %56, %49
  %52 = load ptr, ptr %24, align 8, !dbg !1720
  %53 = getelementptr inbounds i8, ptr %52, i32 1, !dbg !1720
  store ptr %53, ptr %24, align 8, !dbg !1720
  %54 = load i8, ptr %52, align 1, !dbg !1720
  %55 = icmp ne i8 %54, 0, !dbg !1720
  br i1 %55, label %56, label %57, !dbg !1720

56:                                               ; preds = %51
  br label %51, !dbg !1720, !llvm.loop !1721

57:                                               ; preds = %51
  %58 = load ptr, ptr %24, align 8, !dbg !1720
  %59 = load ptr, ptr %17, align 8, !dbg !1720
  %60 = ptrtoint ptr %58 to i64, !dbg !1720
  %61 = ptrtoint ptr %59 to i64, !dbg !1720
  %62 = sub i64 %60, %61, !dbg !1720
  %63 = trunc i64 %62 to i32, !dbg !1720
  store i32 %63, ptr %22, align 4, !dbg !1720
  br label %64, !dbg !1720

64:                                               ; preds = %57
  %65 = load i64, ptr %21, align 8, !dbg !1722
  %66 = load ptr, ptr %17, align 8, !dbg !1723
  %67 = load i32, ptr %22, align 4, !dbg !1724
  %68 = sext i32 %67 to i64, !dbg !1724
  %69 = call i64 @__ockl_fprintf_append_string_n(i64 noundef %65, ptr noundef %66, i64 noundef %68, i32 noundef 0) #13, !dbg !1725
  store i64 %69, ptr %21, align 8, !dbg !1726
  %70 = load i64, ptr %21, align 8, !dbg !1727
  %71 = load i32, ptr %18, align 4, !dbg !1728
  %72 = zext i32 %71 to i64, !dbg !1728
  %73 = call i64 @__ockl_fprintf_append_args(i64 noundef %70, i32 noundef 1, i64 noundef %72, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i32 noundef 0) #13, !dbg !1729
  store i64 %73, ptr %21, align 8, !dbg !1730
  br label %74, !dbg !1731

74:                                               ; preds = %64
    #dbg_declare(ptr addrspace(5) %14, !1698, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(ptr)), !1732)
  %75 = load ptr, ptr %19, align 8, !dbg !1732
  store ptr %75, ptr %25, align 8, !dbg !1732
  br label %76, !dbg !1732

76:                                               ; preds = %81, %74
  %77 = load ptr, ptr %25, align 8, !dbg !1732
  %78 = getelementptr inbounds i8, ptr %77, i32 1, !dbg !1732
  store ptr %78, ptr %25, align 8, !dbg !1732
  %79 = load i8, ptr %77, align 1, !dbg !1732
  %80 = icmp ne i8 %79, 0, !dbg !1732
  br i1 %80, label %81, label %82, !dbg !1732

81:                                               ; preds = %76
  br label %76, !dbg !1732, !llvm.loop !1733

82:                                               ; preds = %76
  %83 = load ptr, ptr %25, align 8, !dbg !1732
  %84 = load ptr, ptr %19, align 8, !dbg !1732
  %85 = ptrtoint ptr %83 to i64, !dbg !1732
  %86 = ptrtoint ptr %84 to i64, !dbg !1732
  %87 = sub i64 %85, %86, !dbg !1732
  %88 = trunc i64 %87 to i32, !dbg !1732
  store i32 %88, ptr %22, align 4, !dbg !1732
  br label %89, !dbg !1732

89:                                               ; preds = %82
  %90 = load i64, ptr %21, align 8, !dbg !1734
  %91 = load ptr, ptr %19, align 8, !dbg !1735
  %92 = load i32, ptr %22, align 4, !dbg !1736
  %93 = sext i32 %92 to i64, !dbg !1736
  %94 = call i64 @__ockl_fprintf_append_string_n(i64 noundef %90, ptr noundef %91, i64 noundef %93, i32 noundef 0) #13, !dbg !1737
  store i64 %94, ptr %21, align 8, !dbg !1738
  br label %95, !dbg !1739

95:                                               ; preds = %89
    #dbg_declare(ptr addrspace(5) %15, !1700, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(ptr)), !1740)
  %96 = load ptr, ptr %16, align 8, !dbg !1740
  store ptr %96, ptr %26, align 8, !dbg !1740
  br label %97, !dbg !1740

97:                                               ; preds = %102, %95
  %98 = load ptr, ptr %26, align 8, !dbg !1740
  %99 = getelementptr inbounds i8, ptr %98, i32 1, !dbg !1740
  store ptr %99, ptr %26, align 8, !dbg !1740
  %100 = load i8, ptr %98, align 1, !dbg !1740
  %101 = icmp ne i8 %100, 0, !dbg !1740
  br i1 %101, label %102, label %103, !dbg !1740

102:                                              ; preds = %97
  br label %97, !dbg !1740, !llvm.loop !1741

103:                                              ; preds = %97
  %104 = load ptr, ptr %26, align 8, !dbg !1740
  %105 = load ptr, ptr %16, align 8, !dbg !1740
  %106 = ptrtoint ptr %104 to i64, !dbg !1740
  %107 = ptrtoint ptr %105 to i64, !dbg !1740
  %108 = sub i64 %106, %107, !dbg !1740
  %109 = trunc i64 %108 to i32, !dbg !1740
  store i32 %109, ptr %22, align 4, !dbg !1740
  br label %110, !dbg !1740

110:                                              ; preds = %103
  %111 = load i64, ptr %21, align 8, !dbg !1742
  %112 = load ptr, ptr %16, align 8, !dbg !1743
  %113 = load i32, ptr %22, align 4, !dbg !1744
  %114 = sext i32 %113 to i64, !dbg !1744
  %115 = call i64 @__ockl_fprintf_append_string_n(i64 noundef %111, ptr noundef %112, i64 noundef %114, i32 noundef 1) #13, !dbg !1745
  call void @llvm.trap(), !dbg !1746
  ret void, !dbg !1747
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p4.i64(ptr noalias nocapture writeonly, ptr addrspace(4) noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: convergent mustprogress noinline nounwind optnone
define weak hidden void @__assertfail() #2 !dbg !1748 {
  call void @llvm.trap(), !dbg !1749
  ret void, !dbg !1750
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define protected amdgpu_kernel void @_Z10pathfinderPKiS0_PiS1_P21Trace029RuntimeRecordPjS4_S4_iiiii(ptr addrspace(1) noalias noundef %0, ptr addrspace(1) noalias noundef %1, ptr addrspace(1) noalias noundef %2, ptr addrspace(1) noalias noundef %3, ptr addrspace(1) noundef %4, ptr addrspace(1) noundef %5, ptr addrspace(1) noundef %6, ptr addrspace(1) noundef %7, i32 noundef %8, i32 noundef %9, i32 noundef %10, i32 noundef %11, i32 noundef %12) #4 !dbg !2 {
  %14 = alloca i32, align 4, addrspace(5)
  %15 = alloca i32, align 4, addrspace(5)
  %16 = alloca i32, align 4, addrspace(5)
  %17 = alloca i32, align 4, addrspace(5)
  %18 = alloca i32, align 4, addrspace(5)
  %19 = alloca i32, align 4, addrspace(5)
  %20 = alloca ptr, align 8, addrspace(5)
  %21 = alloca ptr, align 8, addrspace(5)
  %22 = alloca ptr, align 8, addrspace(5)
  %23 = alloca ptr, align 8, addrspace(5)
  %24 = alloca ptr, align 8, addrspace(5)
  %25 = alloca ptr, align 8, addrspace(5)
  %26 = alloca ptr, align 8, addrspace(5)
  %27 = alloca ptr, align 8, addrspace(5)
  %28 = alloca ptr, align 8, addrspace(5)
  %29 = alloca ptr, align 8, addrspace(5)
  %30 = alloca ptr, align 8, addrspace(5)
  %31 = alloca ptr, align 8, addrspace(5)
  %32 = alloca ptr, align 8, addrspace(5)
  %33 = alloca ptr, align 8, addrspace(5)
  %34 = alloca ptr, align 8, addrspace(5)
  %35 = alloca ptr, align 8, addrspace(5)
  %36 = alloca i32, align 4, addrspace(5)
  %37 = alloca i32, align 4, addrspace(5)
  %38 = alloca i32, align 4, addrspace(5)
  %39 = alloca i32, align 4, addrspace(5)
  %40 = alloca i32, align 4, addrspace(5)
  %41 = alloca i32, align 4, addrspace(5)
  %42 = alloca i32, align 4, addrspace(5)
  %43 = alloca i32, align 4, addrspace(5)
  %44 = alloca i32, align 4, addrspace(5)
  %45 = alloca i32, align 4, addrspace(5)
  %46 = alloca i32, align 4, addrspace(5)
  %47 = alloca i32, align 4, addrspace(5)
  %48 = alloca i32, align 4, addrspace(5)
  %49 = alloca i32, align 4, addrspace(5)
  %50 = alloca i32, align 4, addrspace(5)
  %51 = alloca i32, align 4, addrspace(5)
  %52 = alloca i32, align 4, addrspace(5)
  %53 = alloca i8, align 1, addrspace(5)
  %54 = alloca i8, align 1, addrspace(5)
  %55 = alloca i32, align 4, addrspace(5)
  %56 = alloca i32, align 4, addrspace(5)
  %57 = alloca i32, align 4, addrspace(5)
  %58 = alloca i32, align 4, addrspace(5)
  %59 = alloca i32, align 4, addrspace(5)
  %60 = alloca i32, align 4, addrspace(5)
  %61 = alloca i32, align 4, addrspace(5)
  %62 = alloca i32, align 4, addrspace(5)
  %63 = alloca i32, align 4, addrspace(5)
  %64 = alloca i32, align 4, addrspace(5)
  %65 = alloca i32, align 4, addrspace(5)
  %66 = alloca %struct.Trace029RuntimeRecord, align 4, addrspace(5)
  %67 = alloca i32, align 4, addrspace(5)
  %68 = alloca i8, align 1, addrspace(5)
  %69 = alloca i32, align 4, addrspace(5)
  %70 = alloca %struct.Trace029RuntimeRecord, align 4, addrspace(5)
  %71 = addrspacecast ptr addrspace(5) %20 to ptr
  %72 = addrspacecast ptr addrspace(5) %21 to ptr
  %73 = addrspacecast ptr addrspace(5) %22 to ptr
  %74 = addrspacecast ptr addrspace(5) %23 to ptr
  %75 = addrspacecast ptr addrspace(5) %24 to ptr
  %76 = addrspacecast ptr addrspace(5) %25 to ptr
  %77 = addrspacecast ptr addrspace(5) %26 to ptr
  %78 = addrspacecast ptr addrspace(5) %27 to ptr
  %79 = addrspacecast ptr addrspace(5) %28 to ptr
  %80 = addrspacecast ptr addrspace(5) %29 to ptr
  %81 = addrspacecast ptr addrspace(5) %30 to ptr
  %82 = addrspacecast ptr addrspace(5) %31 to ptr
  %83 = addrspacecast ptr addrspace(5) %32 to ptr
  %84 = addrspacecast ptr addrspace(5) %33 to ptr
  %85 = addrspacecast ptr addrspace(5) %34 to ptr
  %86 = addrspacecast ptr addrspace(5) %35 to ptr
  %87 = addrspacecast ptr addrspace(5) %36 to ptr
  %88 = addrspacecast ptr addrspace(5) %37 to ptr
  %89 = addrspacecast ptr addrspace(5) %38 to ptr
  %90 = addrspacecast ptr addrspace(5) %39 to ptr
  %91 = addrspacecast ptr addrspace(5) %40 to ptr
  %92 = addrspacecast ptr addrspace(5) %41 to ptr
  %93 = addrspacecast ptr addrspace(5) %42 to ptr
  %94 = addrspacecast ptr addrspace(5) %43 to ptr
  %95 = addrspacecast ptr addrspace(5) %44 to ptr
  %96 = addrspacecast ptr addrspace(5) %45 to ptr
  %97 = addrspacecast ptr addrspace(5) %46 to ptr
  %98 = addrspacecast ptr addrspace(5) %47 to ptr
  %99 = addrspacecast ptr addrspace(5) %48 to ptr
  %100 = addrspacecast ptr addrspace(5) %49 to ptr
  %101 = addrspacecast ptr addrspace(5) %50 to ptr
  %102 = addrspacecast ptr addrspace(5) %51 to ptr
  %103 = addrspacecast ptr addrspace(5) %52 to ptr
  %104 = addrspacecast ptr addrspace(5) %53 to ptr
  %105 = addrspacecast ptr addrspace(5) %54 to ptr
  %106 = addrspacecast ptr addrspace(5) %55 to ptr
  %107 = addrspacecast ptr addrspace(5) %56 to ptr
  %108 = addrspacecast ptr addrspace(5) %57 to ptr
  %109 = addrspacecast ptr addrspace(5) %58 to ptr
  %110 = addrspacecast ptr addrspace(5) %59 to ptr
  %111 = addrspacecast ptr addrspace(5) %60 to ptr
  %112 = addrspacecast ptr addrspace(5) %61 to ptr
  %113 = addrspacecast ptr addrspace(5) %62 to ptr
  %114 = addrspacecast ptr addrspace(5) %63 to ptr
  %115 = addrspacecast ptr addrspace(5) %64 to ptr
  %116 = addrspacecast ptr addrspace(5) %65 to ptr
  %117 = addrspacecast ptr addrspace(5) %66 to ptr
  %118 = addrspacecast ptr addrspace(5) %67 to ptr
  %119 = addrspacecast ptr addrspace(5) %68 to ptr
  %120 = addrspacecast ptr addrspace(5) %69 to ptr
  %121 = addrspacecast ptr addrspace(5) %70 to ptr
  %122 = addrspacecast ptr addrspace(1) %0 to ptr
  store ptr %122, ptr %71, align 8
  %123 = load ptr, ptr %71, align 8
  %124 = addrspacecast ptr addrspace(1) %1 to ptr
  store ptr %124, ptr %72, align 8
  %125 = load ptr, ptr %72, align 8
  %126 = addrspacecast ptr addrspace(1) %2 to ptr
  store ptr %126, ptr %73, align 8
  %127 = load ptr, ptr %73, align 8
  %128 = addrspacecast ptr addrspace(1) %3 to ptr
  store ptr %128, ptr %74, align 8
  %129 = load ptr, ptr %74, align 8
  %130 = addrspacecast ptr addrspace(1) %4 to ptr
  store ptr %130, ptr %75, align 8
  %131 = load ptr, ptr %75, align 8
  %132 = addrspacecast ptr addrspace(1) %5 to ptr
  store ptr %132, ptr %76, align 8
  %133 = load ptr, ptr %76, align 8
  %134 = addrspacecast ptr addrspace(1) %6 to ptr
  store ptr %134, ptr %77, align 8
  %135 = load ptr, ptr %77, align 8
  %136 = addrspacecast ptr addrspace(1) %7 to ptr
  store ptr %136, ptr %78, align 8
  %137 = load ptr, ptr %78, align 8
  store ptr %123, ptr %79, align 8
    #dbg_declare(ptr addrspace(5) %28, !1605, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(ptr)), !1751)
  store ptr %125, ptr %80, align 8
    #dbg_declare(ptr addrspace(5) %29, !1606, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(ptr)), !1752)
  store ptr %127, ptr %81, align 8
    #dbg_declare(ptr addrspace(5) %30, !1607, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(ptr)), !1753)
  store ptr %129, ptr %82, align 8
    #dbg_declare(ptr addrspace(5) %31, !1608, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(ptr)), !1754)
  store ptr %131, ptr %83, align 8
    #dbg_declare(ptr addrspace(5) %32, !1609, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(ptr)), !1755)
  store ptr %133, ptr %84, align 8
    #dbg_declare(ptr addrspace(5) %33, !1610, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(ptr)), !1756)
  store ptr %135, ptr %85, align 8
    #dbg_declare(ptr addrspace(5) %34, !1611, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(ptr)), !1757)
  store ptr %137, ptr %86, align 8
    #dbg_declare(ptr addrspace(5) %35, !1612, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(ptr)), !1758)
  store i32 %8, ptr %87, align 4
    #dbg_declare(ptr addrspace(5) %36, !1613, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1759)
  store i32 %9, ptr %88, align 4
    #dbg_declare(ptr addrspace(5) %37, !1614, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1760)
  store i32 %10, ptr %89, align 4
    #dbg_declare(ptr addrspace(5) %38, !1615, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1761)
  store i32 %11, ptr %90, align 4
    #dbg_declare(ptr addrspace(5) %39, !1616, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1762)
  store i32 %12, ptr %91, align 4
    #dbg_declare(ptr addrspace(5) %40, !1617, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1763)
    #dbg_declare(ptr addrspace(5) %41, !1618, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1764)
  %138 = addrspacecast ptr addrspace(5) %19 to ptr
  %139 = addrspacecast ptr addrspace(5) %16 to ptr
  %140 = call i64 @__ockl_get_local_size(i32 noundef 0) #14, !dbg !1765
  %141 = trunc i64 %140 to i32, !dbg !1765
  store i32 %141, ptr %92, align 4, !dbg !1764
    #dbg_declare(ptr addrspace(5) %42, !1619, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1784)
  %142 = addrspacecast ptr addrspace(5) %18 to ptr
  %143 = addrspacecast ptr addrspace(5) %15 to ptr
  %144 = call i64 @__ockl_get_group_id(i32 noundef 0) #14, !dbg !1785
  %145 = trunc i64 %144 to i32, !dbg !1785
  store i32 %145, ptr %93, align 4, !dbg !1784
    #dbg_declare(ptr addrspace(5) %43, !1620, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1800)
  %146 = addrspacecast ptr addrspace(5) %17 to ptr
  %147 = addrspacecast ptr addrspace(5) %14 to ptr
  %148 = call i64 @__ockl_get_local_id(i32 noundef 0) #14, !dbg !1801
  %149 = trunc i64 %148 to i32, !dbg !1801
  store i32 %149, ptr %94, align 4, !dbg !1800
    #dbg_declare(ptr addrspace(5) %44, !1621, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1816)
  %150 = load i32, ptr %92, align 4, !dbg !1817
  %151 = load i32, ptr %87, align 4, !dbg !1818
  %152 = load i32, ptr %88, align 4, !dbg !1819
  %153 = mul nsw i32 %151, %152, !dbg !1820
  %154 = mul nsw i32 %153, 2, !dbg !1821
  %155 = sub nsw i32 %150, %154, !dbg !1822
  store i32 %155, ptr %95, align 4, !dbg !1816
    #dbg_declare(ptr addrspace(5) %45, !1622, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1823)
  %156 = load i32, ptr %92, align 4, !dbg !1824
  %157 = load i32, ptr %87, align 4, !dbg !1825
  %158 = load i32, ptr %88, align 4, !dbg !1826
  %159 = mul nsw i32 %157, %158, !dbg !1827
  %160 = mul nsw i32 %159, 2, !dbg !1828
  %161 = sub nsw i32 %156, %160, !dbg !1829
  store i32 %161, ptr %96, align 4, !dbg !1823
    #dbg_declare(ptr addrspace(5) %46, !1623, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1816)
  %162 = load i32, ptr %96, align 4, !dbg !1830
  %163 = load i32, ptr %93, align 4, !dbg !1831
  %164 = mul nsw i32 %162, %163, !dbg !1832
  %165 = load i32, ptr %89, align 4, !dbg !1833
  %166 = sub nsw i32 %164, %165, !dbg !1834
  store i32 %166, ptr %97, align 4, !dbg !1816
    #dbg_declare(ptr addrspace(5) %47, !1624, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1835)
  %167 = load i32, ptr %97, align 4, !dbg !1836
  %168 = load i32, ptr %92, align 4, !dbg !1837
  %169 = add nsw i32 %167, %168, !dbg !1838
  %170 = sub nsw i32 %169, 1, !dbg !1839
  store i32 %170, ptr %98, align 4, !dbg !1835
    #dbg_declare(ptr addrspace(5) %48, !1625, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1840)
  %171 = load i32, ptr %97, align 4, !dbg !1841
  %172 = load i32, ptr %94, align 4, !dbg !1842
  %173 = add nsw i32 %171, %172, !dbg !1843
  store i32 %173, ptr %99, align 4, !dbg !1840
    #dbg_declare(ptr addrspace(5) %49, !1626, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1844)
  %174 = load i32, ptr %97, align 4, !dbg !1845
  %175 = icmp slt i32 %174, 0, !dbg !1846
  br i1 %175, label %176, label %179, !dbg !1847

176:                                              ; preds = %13
  %177 = load i32, ptr %97, align 4, !dbg !1848
  %178 = sub nsw i32 0, %177, !dbg !1849
  br label %180, !dbg !1847

179:                                              ; preds = %13
  br label %180, !dbg !1847

180:                                              ; preds = %179, %176
  %181 = phi i32 [ %178, %176 ], [ 0, %179 ], !dbg !1847
  store i32 %181, ptr %100, align 4, !dbg !1844
    #dbg_declare(ptr addrspace(5) %50, !1627, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1850)
  %182 = load i32, ptr %98, align 4, !dbg !1851
  %183 = load i32, ptr %90, align 4, !dbg !1852
  %184 = sub nsw i32 %183, 1, !dbg !1853
  %185 = icmp sgt i32 %182, %184, !dbg !1854
  br i1 %185, label %186, label %194, !dbg !1855

186:                                              ; preds = %180
  %187 = load i32, ptr %92, align 4, !dbg !1856
  %188 = sub nsw i32 %187, 1, !dbg !1857
  %189 = load i32, ptr %98, align 4, !dbg !1858
  %190 = load i32, ptr %90, align 4, !dbg !1859
  %191 = sub nsw i32 %189, %190, !dbg !1860
  %192 = add nsw i32 %191, 1, !dbg !1861
  %193 = sub nsw i32 %188, %192, !dbg !1862
  br label %197, !dbg !1855

194:                                              ; preds = %180
  %195 = load i32, ptr %92, align 4, !dbg !1863
  %196 = sub nsw i32 %195, 1, !dbg !1864
  br label %197, !dbg !1855

197:                                              ; preds = %194, %186
  %198 = phi i32 [ %193, %186 ], [ %196, %194 ], !dbg !1855
  store i32 %198, ptr %101, align 4, !dbg !1850
    #dbg_declare(ptr addrspace(5) %51, !1628, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1865)
  %199 = load i32, ptr %94, align 4, !dbg !1866
  %200 = sub nsw i32 %199, 1, !dbg !1867
  store i32 %200, ptr %102, align 4, !dbg !1865
    #dbg_declare(ptr addrspace(5) %52, !1629, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1868)
  %201 = load i32, ptr %94, align 4, !dbg !1869
  %202 = add nsw i32 %201, 1, !dbg !1870
  store i32 %202, ptr %103, align 4, !dbg !1868
  %203 = load i32, ptr %102, align 4, !dbg !1871
  %204 = load i32, ptr %100, align 4, !dbg !1872
  %205 = icmp slt i32 %203, %204, !dbg !1873
  br i1 %205, label %206, label %208, !dbg !1874

206:                                              ; preds = %197
  %207 = load i32, ptr %100, align 4, !dbg !1875
  br label %210, !dbg !1874

208:                                              ; preds = %197
  %209 = load i32, ptr %102, align 4, !dbg !1876
  br label %210, !dbg !1874

210:                                              ; preds = %208, %206
  %211 = phi i32 [ %207, %206 ], [ %209, %208 ], !dbg !1874
  store i32 %211, ptr %102, align 4, !dbg !1877
  %212 = load i32, ptr %103, align 4, !dbg !1878
  %213 = load i32, ptr %101, align 4, !dbg !1879
  %214 = icmp sgt i32 %212, %213, !dbg !1880
  br i1 %214, label %215, label %217, !dbg !1881

215:                                              ; preds = %210
  %216 = load i32, ptr %101, align 4, !dbg !1882
  br label %219, !dbg !1881

217:                                              ; preds = %210
  %218 = load i32, ptr %103, align 4, !dbg !1883
  br label %219, !dbg !1881

219:                                              ; preds = %217, %215
  %220 = phi i32 [ %216, %215 ], [ %218, %217 ], !dbg !1881
  store i32 %220, ptr %103, align 4, !dbg !1884
    #dbg_declare(ptr addrspace(5) %53, !1630, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i8)), !1885)
  %221 = load i32, ptr %94, align 4, !dbg !1886
  %222 = load i32, ptr %100, align 4, !dbg !1886
  %223 = icmp sge i32 %221, %222, !dbg !1886
  br i1 %223, label %224, label %228, !dbg !1886

224:                                              ; preds = %219
  %225 = load i32, ptr %94, align 4, !dbg !1886
  %226 = load i32, ptr %101, align 4, !dbg !1886
  %227 = icmp sle i32 %225, %226, !dbg !1886
  br label %228

228:                                              ; preds = %224, %219
  %229 = phi i1 [ false, %219 ], [ %227, %224 ], !dbg !1887
  %230 = zext i1 %229 to i8, !dbg !1885
  store i8 %230, ptr %104, align 1, !dbg !1885
  %231 = load i32, ptr %99, align 4, !dbg !1888
  %232 = icmp sge i32 %231, 0, !dbg !1888
  br i1 %232, label %233, label %247, !dbg !1888

233:                                              ; preds = %228
  %234 = load i32, ptr %99, align 4, !dbg !1888
  %235 = load i32, ptr %90, align 4, !dbg !1888
  %236 = sub nsw i32 %235, 1, !dbg !1888
  %237 = icmp sle i32 %234, %236, !dbg !1888
  br i1 %237, label %238, label %247, !dbg !1890

238:                                              ; preds = %233
  %239 = load ptr, ptr %80, align 8, !dbg !1891
  %240 = load i32, ptr %99, align 4, !dbg !1893
  %241 = sext i32 %240 to i64, !dbg !1891
  %242 = getelementptr inbounds i32, ptr %239, i64 %241, !dbg !1891
  %243 = load i32, ptr %242, align 4, !dbg !1891
  %244 = load i32, ptr %94, align 4, !dbg !1894
  %245 = sext i32 %244 to i64, !dbg !1895
  %246 = getelementptr inbounds [250 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ10pathfinderPKiS0_PiS1_P21Trace029RuntimeRecordPjS4_S4_iiiiiE4prev to ptr), i64 0, i64 %245, !dbg !1895
  store i32 %243, ptr %246, align 4, !dbg !1896
  br label %247, !dbg !1897

247:                                              ; preds = %238, %233, %228
  call void @_Z13__syncthreadsv() #13, !dbg !1898
    #dbg_declare(ptr addrspace(5) %54, !1631, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i8)), !1899)
    #dbg_declare(ptr addrspace(5) %55, !1632, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1900)
  store i32 -1, ptr %106, align 4, !dbg !1900
    #dbg_declare(ptr addrspace(5) %56, !1633, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1901)
  store i32 0, ptr %107, align 4, !dbg !1901
    #dbg_declare(ptr addrspace(5) %57, !1634, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1902)
  store i32 0, ptr %108, align 4, !dbg !1902
  br label %248, !dbg !1903

248:                                              ; preds = %405, %247
  %249 = load i32, ptr %108, align 4, !dbg !1904
  %250 = load i32, ptr %87, align 4, !dbg !1905
  %251 = icmp slt i32 %249, %250, !dbg !1906
  br i1 %251, label %252, label %408, !dbg !1907

252:                                              ; preds = %248
  store i8 0, ptr %105, align 1, !dbg !1908
    #dbg_declare(ptr addrspace(5) %58, !1636, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1909)
  store i32 -1, ptr %109, align 4, !dbg !1909
    #dbg_declare(ptr addrspace(5) %59, !1639, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1910)
  store i32 0, ptr %110, align 4, !dbg !1910
  %253 = load i32, ptr %94, align 4, !dbg !1911
  %254 = load i32, ptr %108, align 4, !dbg !1911
  %255 = add nsw i32 %254, 1, !dbg !1911
  %256 = icmp sge i32 %253, %255, !dbg !1911
  br i1 %256, label %257, label %387, !dbg !1911

257:                                              ; preds = %252
  %258 = load i32, ptr %94, align 4, !dbg !1911
  %259 = load i32, ptr %92, align 4, !dbg !1911
  %260 = load i32, ptr %108, align 4, !dbg !1911
  %261 = sub nsw i32 %259, %260, !dbg !1911
  %262 = sub nsw i32 %261, 2, !dbg !1911
  %263 = icmp sle i32 %258, %262, !dbg !1911
  br i1 %263, label %264, label %387, !dbg !1912

264:                                              ; preds = %257
  %265 = load i8, ptr %104, align 1, !dbg !1913
  %266 = trunc i8 %265 to i1, !dbg !1913
  br i1 %266, label %267, label %387, !dbg !1914

267:                                              ; preds = %264
  store i8 1, ptr %105, align 1, !dbg !1915
    #dbg_declare(ptr addrspace(5) %60, !1640, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1916)
  %268 = load i32, ptr %102, align 4, !dbg !1917
  %269 = sext i32 %268 to i64, !dbg !1918
  %270 = getelementptr inbounds [250 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ10pathfinderPKiS0_PiS1_P21Trace029RuntimeRecordPjS4_S4_iiiiiE4prev to ptr), i64 0, i64 %269, !dbg !1918
  %271 = load i32, ptr %270, align 4, !dbg !1918
  store i32 %271, ptr %111, align 4, !dbg !1916
    #dbg_declare(ptr addrspace(5) %61, !1643, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1919)
  %272 = load i32, ptr %94, align 4, !dbg !1920
  %273 = sext i32 %272 to i64, !dbg !1921
  %274 = getelementptr inbounds [250 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ10pathfinderPKiS0_PiS1_P21Trace029RuntimeRecordPjS4_S4_iiiiiE4prev to ptr), i64 0, i64 %273, !dbg !1921
  %275 = load i32, ptr %274, align 4, !dbg !1921
  store i32 %275, ptr %112, align 4, !dbg !1919
    #dbg_declare(ptr addrspace(5) %62, !1644, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1922)
  %276 = load i32, ptr %103, align 4, !dbg !1923
  %277 = sext i32 %276 to i64, !dbg !1924
  %278 = getelementptr inbounds [250 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ10pathfinderPKiS0_PiS1_P21Trace029RuntimeRecordPjS4_S4_iiiiiE4prev to ptr), i64 0, i64 %277, !dbg !1924
  %279 = load i32, ptr %278, align 4, !dbg !1924
  store i32 %279, ptr %113, align 4, !dbg !1922
    #dbg_declare(ptr addrspace(5) %63, !1645, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1925)
  %280 = load i32, ptr %111, align 4, !dbg !1926
  %281 = load i32, ptr %112, align 4, !dbg !1926
  %282 = icmp sle i32 %280, %281, !dbg !1926
  br i1 %282, label %283, label %285, !dbg !1926

283:                                              ; preds = %267
  %284 = load i32, ptr %111, align 4, !dbg !1926
  br label %287, !dbg !1926

285:                                              ; preds = %267
  %286 = load i32, ptr %112, align 4, !dbg !1926
  br label %287, !dbg !1926

287:                                              ; preds = %285, %283
  %288 = phi i32 [ %284, %283 ], [ %286, %285 ], !dbg !1926
  store i32 %288, ptr %114, align 4, !dbg !1925
  %289 = load i32, ptr %114, align 4, !dbg !1927
  %290 = load i32, ptr %113, align 4, !dbg !1927
  %291 = icmp sle i32 %289, %290, !dbg !1927
  br i1 %291, label %292, label %294, !dbg !1927

292:                                              ; preds = %287
  %293 = load i32, ptr %114, align 4, !dbg !1927
  br label %296, !dbg !1927

294:                                              ; preds = %287
  %295 = load i32, ptr %113, align 4, !dbg !1927
  br label %296, !dbg !1927

296:                                              ; preds = %294, %292
  %297 = phi i32 [ %293, %292 ], [ %295, %294 ], !dbg !1927
  store i32 %297, ptr %114, align 4, !dbg !1928
    #dbg_declare(ptr addrspace(5) %64, !1646, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1929)
  %298 = load i32, ptr %90, align 4, !dbg !1930
  %299 = load i32, ptr %91, align 4, !dbg !1931
  %300 = load i32, ptr %108, align 4, !dbg !1932
  %301 = add nsw i32 %299, %300, !dbg !1933
  %302 = mul nsw i32 %298, %301, !dbg !1934
  %303 = load i32, ptr %99, align 4, !dbg !1935
  %304 = add nsw i32 %302, %303, !dbg !1936
  store i32 %304, ptr %115, align 4, !dbg !1929
  %305 = load i32, ptr %114, align 4, !dbg !1937
  %306 = load ptr, ptr %79, align 8, !dbg !1938
  %307 = load i32, ptr %115, align 4, !dbg !1939
  %308 = sext i32 %307 to i64, !dbg !1938
  %309 = getelementptr inbounds i32, ptr %306, i64 %308, !dbg !1938
  %310 = load i32, ptr %309, align 4, !dbg !1938
  %311 = add nsw i32 %305, %310, !dbg !1940
  %312 = load i32, ptr %94, align 4, !dbg !1941
  %313 = sext i32 %312 to i64, !dbg !1942
  %314 = getelementptr inbounds [250 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ10pathfinderPKiS0_PiS1_P21Trace029RuntimeRecordPjS4_S4_iiiiiE6result to ptr), i64 0, i64 %313, !dbg !1942
  store i32 %311, ptr %314, align 4, !dbg !1943
  %315 = load i32, ptr %115, align 4, !dbg !1944
  store i32 %315, ptr %109, align 4, !dbg !1945
  %316 = load i32, ptr %94, align 4, !dbg !1946
  %317 = sext i32 %316 to i64, !dbg !1947
  %318 = getelementptr inbounds [250 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ10pathfinderPKiS0_PiS1_P21Trace029RuntimeRecordPjS4_S4_iiiiiE6result to ptr), i64 0, i64 %317, !dbg !1947
  %319 = load i32, ptr %318, align 4, !dbg !1947
  store i32 %319, ptr %110, align 4, !dbg !1948
  %320 = load i32, ptr %109, align 4, !dbg !1949
  store i32 %320, ptr %106, align 4, !dbg !1950
  %321 = load i32, ptr %110, align 4, !dbg !1951
  store i32 %321, ptr %107, align 4, !dbg !1952
  %322 = load ptr, ptr %85, align 8, !dbg !1953
  %323 = call noundef i32 @_Z9atomicAddPjj(ptr noundef %322, i32 noundef 1) #13, !dbg !1954
  %324 = load ptr, ptr %83, align 8, !dbg !1955
  %325 = icmp ne ptr %324, null, !dbg !1956
  br i1 %325, label %326, label %370, !dbg !1957

326:                                              ; preds = %296
    #dbg_declare(ptr addrspace(5) %65, !1647, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1958)
  %327 = load ptr, ptr %84, align 8, !dbg !1959
  %328 = call noundef i32 @_Z9atomicAddPjj(ptr noundef %327, i32 noundef 1) #13, !dbg !1960
  store i32 %328, ptr %116, align 4, !dbg !1958
  %329 = load i32, ptr %116, align 4, !dbg !1961
  %330 = icmp ult i32 %329, 2048, !dbg !1962
  br i1 %330, label %331, label %369, !dbg !1963

331:                                              ; preds = %326
    #dbg_declare(ptr addrspace(5) %66, !1650, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(%struct.Trace029RuntimeRecord)), !1964)
  %332 = load i32, ptr %91, align 4, !dbg !1965
  %333 = getelementptr inbounds %struct.Trace029RuntimeRecord, ptr %117, i32 0, i32 0, !dbg !1966
  store i32 %332, ptr %333, align 4, !dbg !1967
  %334 = load i32, ptr %108, align 4, !dbg !1968
  %335 = getelementptr inbounds %struct.Trace029RuntimeRecord, ptr %117, i32 0, i32 1, !dbg !1969
  store i32 %334, ptr %335, align 4, !dbg !1970
  %336 = load i32, ptr %93, align 4, !dbg !1971
  %337 = getelementptr inbounds %struct.Trace029RuntimeRecord, ptr %117, i32 0, i32 2, !dbg !1972
  store i32 %336, ptr %337, align 4, !dbg !1973
  %338 = load i32, ptr %94, align 4, !dbg !1974
  %339 = getelementptr inbounds %struct.Trace029RuntimeRecord, ptr %117, i32 0, i32 3, !dbg !1975
  store i32 %338, ptr %339, align 4, !dbg !1976
  %340 = load i32, ptr %95, align 4, !dbg !1977
  %341 = getelementptr inbounds %struct.Trace029RuntimeRecord, ptr %117, i32 0, i32 4, !dbg !1978
  store i32 %340, ptr %341, align 4, !dbg !1979
  %342 = load i32, ptr %96, align 4, !dbg !1980
  %343 = getelementptr inbounds %struct.Trace029RuntimeRecord, ptr %117, i32 0, i32 5, !dbg !1981
  store i32 %342, ptr %343, align 4, !dbg !1982
  %344 = load i32, ptr %97, align 4, !dbg !1983
  %345 = getelementptr inbounds %struct.Trace029RuntimeRecord, ptr %117, i32 0, i32 6, !dbg !1984
  store i32 %344, ptr %345, align 4, !dbg !1985
  %346 = load i32, ptr %98, align 4, !dbg !1986
  %347 = getelementptr inbounds %struct.Trace029RuntimeRecord, ptr %117, i32 0, i32 7, !dbg !1987
  store i32 %346, ptr %347, align 4, !dbg !1988
  %348 = load i32, ptr %99, align 4, !dbg !1989
  %349 = getelementptr inbounds %struct.Trace029RuntimeRecord, ptr %117, i32 0, i32 8, !dbg !1990
  store i32 %348, ptr %349, align 4, !dbg !1991
  %350 = load i32, ptr %100, align 4, !dbg !1992
  %351 = getelementptr inbounds %struct.Trace029RuntimeRecord, ptr %117, i32 0, i32 9, !dbg !1993
  store i32 %350, ptr %351, align 4, !dbg !1994
  %352 = load i32, ptr %101, align 4, !dbg !1995
  %353 = getelementptr inbounds %struct.Trace029RuntimeRecord, ptr %117, i32 0, i32 10, !dbg !1996
  store i32 %352, ptr %353, align 4, !dbg !1997
  %354 = load i8, ptr %104, align 1, !dbg !1998
  %355 = trunc i8 %354 to i1, !dbg !1998
  %356 = zext i1 %355 to i64, !dbg !1998
  %357 = select i1 %355, i32 1, i32 0, !dbg !1998
  %358 = getelementptr inbounds %struct.Trace029RuntimeRecord, ptr %117, i32 0, i32 11, !dbg !1999
  store i32 %357, ptr %358, align 4, !dbg !2000
  %359 = getelementptr inbounds %struct.Trace029RuntimeRecord, ptr %117, i32 0, i32 12, !dbg !2001
  store i32 1, ptr %359, align 4, !dbg !2002
  %360 = getelementptr inbounds %struct.Trace029RuntimeRecord, ptr %117, i32 0, i32 13, !dbg !2003
  store i32 0, ptr %360, align 4, !dbg !2004
  %361 = load i32, ptr %109, align 4, !dbg !2005
  %362 = getelementptr inbounds %struct.Trace029RuntimeRecord, ptr %117, i32 0, i32 14, !dbg !2006
  store i32 %361, ptr %362, align 4, !dbg !2007
  %363 = load i32, ptr %110, align 4, !dbg !2008
  %364 = getelementptr inbounds %struct.Trace029RuntimeRecord, ptr %117, i32 0, i32 15, !dbg !2009
  store i32 %363, ptr %364, align 4, !dbg !2010
  %365 = load ptr, ptr %83, align 8, !dbg !2011
  %366 = load i32, ptr %116, align 4, !dbg !2012
  %367 = zext i32 %366 to i64, !dbg !2011
  %368 = getelementptr inbounds %struct.Trace029RuntimeRecord, ptr %365, i64 %367, !dbg !2011
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %368, ptr align 4 %117, i64 64, i1 false), !dbg !2013
  br label %369, !dbg !2014

369:                                              ; preds = %331, %326
  br label %370, !dbg !2015

370:                                              ; preds = %369, %296
  %371 = load i32, ptr %94, align 4, !dbg !2016
  %372 = icmp eq i32 %371, 11, !dbg !2017
  br i1 %372, label %373, label %386, !dbg !2018

373:                                              ; preds = %370
  %374 = load i32, ptr %108, align 4, !dbg !2019
  %375 = icmp eq i32 %374, 0, !dbg !2020
  br i1 %375, label %376, label %386, !dbg !2021

376:                                              ; preds = %373
    #dbg_declare(ptr addrspace(5) %67, !1653, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !2022)
  %377 = load ptr, ptr %80, align 8, !dbg !2023
  %378 = load i32, ptr %99, align 4, !dbg !2024
  %379 = sext i32 %378 to i64, !dbg !2023
  %380 = getelementptr inbounds i32, ptr %377, i64 %379, !dbg !2023
  %381 = load i32, ptr %380, align 4, !dbg !2023
  store i32 %381, ptr %118, align 4, !dbg !2022
  %382 = load ptr, ptr %82, align 8, !dbg !2025
  %383 = load i32, ptr %118, align 4, !dbg !2026
  %384 = sext i32 %383 to i64, !dbg !2025
  %385 = getelementptr inbounds i32, ptr %382, i64 %384, !dbg !2025
  store i32 1, ptr %385, align 4, !dbg !2027
  br label %386, !dbg !2028

386:                                              ; preds = %376, %373, %370
  br label %387, !dbg !2029

387:                                              ; preds = %386, %264, %257, %252
  call void @_Z13__syncthreadsv() #13, !dbg !2030
  %388 = load i32, ptr %108, align 4, !dbg !2031
  %389 = load i32, ptr %87, align 4, !dbg !2033
  %390 = sub nsw i32 %389, 1, !dbg !2034
  %391 = icmp eq i32 %388, %390, !dbg !2035
  br i1 %391, label %392, label %393, !dbg !2036

392:                                              ; preds = %387
  br label %408, !dbg !2037

393:                                              ; preds = %387
  %394 = load i8, ptr %105, align 1, !dbg !2039
  %395 = trunc i8 %394 to i1, !dbg !2039
  br i1 %395, label %396, label %404, !dbg !2041

396:                                              ; preds = %393
  %397 = load i32, ptr %94, align 4, !dbg !2042
  %398 = sext i32 %397 to i64, !dbg !2044
  %399 = getelementptr inbounds [250 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ10pathfinderPKiS0_PiS1_P21Trace029RuntimeRecordPjS4_S4_iiiiiE6result to ptr), i64 0, i64 %398, !dbg !2044
  %400 = load i32, ptr %399, align 4, !dbg !2044
  %401 = load i32, ptr %94, align 4, !dbg !2045
  %402 = sext i32 %401 to i64, !dbg !2046
  %403 = getelementptr inbounds [250 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ10pathfinderPKiS0_PiS1_P21Trace029RuntimeRecordPjS4_S4_iiiiiE4prev to ptr), i64 0, i64 %402, !dbg !2046
  store i32 %400, ptr %403, align 4, !dbg !2047
  br label %404, !dbg !2048

404:                                              ; preds = %396, %393
  call void @_Z13__syncthreadsv() #13, !dbg !2049
  br label %405, !dbg !2050

405:                                              ; preds = %404
  %406 = load i32, ptr %108, align 4, !dbg !2051
  %407 = add nsw i32 %406, 1, !dbg !2051
  store i32 %407, ptr %108, align 4, !dbg !2051
  br label %248, !dbg !2052, !llvm.loop !2053

408:                                              ; preds = %392, %248
    #dbg_declare(ptr addrspace(5) %68, !1656, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i8)), !2055)
  %409 = load i8, ptr %105, align 1, !dbg !2056
  %410 = trunc i8 %409 to i1, !dbg !2056
  %411 = zext i1 %410 to i8, !dbg !2055
  store i8 %411, ptr %119, align 1, !dbg !2055
  %412 = load i8, ptr %105, align 1, !dbg !2057
  %413 = trunc i8 %412 to i1, !dbg !2057
  br i1 %413, label %414, label %425, !dbg !2059

414:                                              ; preds = %408
  %415 = load i32, ptr %94, align 4, !dbg !2060
  %416 = sext i32 %415 to i64, !dbg !2062
  %417 = getelementptr inbounds [250 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ10pathfinderPKiS0_PiS1_P21Trace029RuntimeRecordPjS4_S4_iiiiiE6result to ptr), i64 0, i64 %416, !dbg !2062
  %418 = load i32, ptr %417, align 4, !dbg !2062
  %419 = load ptr, ptr %81, align 8, !dbg !2063
  %420 = load i32, ptr %99, align 4, !dbg !2064
  %421 = sext i32 %420 to i64, !dbg !2063
  %422 = getelementptr inbounds i32, ptr %419, i64 %421, !dbg !2063
  store i32 %418, ptr %422, align 4, !dbg !2065
  %423 = load ptr, ptr %86, align 8, !dbg !2066
  %424 = call noundef i32 @_Z9atomicAddPjj(ptr noundef %423, i32 noundef 1) #13, !dbg !2067
  br label %425, !dbg !2068

425:                                              ; preds = %414, %408
  %426 = load ptr, ptr %83, align 8, !dbg !2069
  %427 = icmp ne ptr %426, null, !dbg !2070
  br i1 %427, label %428, label %480, !dbg !2071

428:                                              ; preds = %425
  %429 = load i8, ptr %119, align 1, !dbg !2072
  %430 = trunc i8 %429 to i1, !dbg !2072
  br i1 %430, label %431, label %480, !dbg !2073

431:                                              ; preds = %428
    #dbg_declare(ptr addrspace(5) %69, !1657, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !2074)
  %432 = load ptr, ptr %84, align 8, !dbg !2075
  %433 = call noundef i32 @_Z9atomicAddPjj(ptr noundef %432, i32 noundef 1) #13, !dbg !2076
  store i32 %433, ptr %120, align 4, !dbg !2074
  %434 = load i32, ptr %120, align 4, !dbg !2077
  %435 = icmp ult i32 %434, 2048, !dbg !2078
  br i1 %435, label %436, label %479, !dbg !2079

436:                                              ; preds = %431
    #dbg_declare(ptr addrspace(5) %70, !1660, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(%struct.Trace029RuntimeRecord)), !2080)
  %437 = load i32, ptr %91, align 4, !dbg !2081
  %438 = getelementptr inbounds %struct.Trace029RuntimeRecord, ptr %121, i32 0, i32 0, !dbg !2082
  store i32 %437, ptr %438, align 4, !dbg !2083
  %439 = load i32, ptr %87, align 4, !dbg !2084
  %440 = sub nsw i32 %439, 1, !dbg !2085
  %441 = getelementptr inbounds %struct.Trace029RuntimeRecord, ptr %121, i32 0, i32 1, !dbg !2086
  store i32 %440, ptr %441, align 4, !dbg !2087
  %442 = load i32, ptr %93, align 4, !dbg !2088
  %443 = getelementptr inbounds %struct.Trace029RuntimeRecord, ptr %121, i32 0, i32 2, !dbg !2089
  store i32 %442, ptr %443, align 4, !dbg !2090
  %444 = load i32, ptr %94, align 4, !dbg !2091
  %445 = getelementptr inbounds %struct.Trace029RuntimeRecord, ptr %121, i32 0, i32 3, !dbg !2092
  store i32 %444, ptr %445, align 4, !dbg !2093
  %446 = load i32, ptr %95, align 4, !dbg !2094
  %447 = getelementptr inbounds %struct.Trace029RuntimeRecord, ptr %121, i32 0, i32 4, !dbg !2095
  store i32 %446, ptr %447, align 4, !dbg !2096
  %448 = load i32, ptr %96, align 4, !dbg !2097
  %449 = getelementptr inbounds %struct.Trace029RuntimeRecord, ptr %121, i32 0, i32 5, !dbg !2098
  store i32 %448, ptr %449, align 4, !dbg !2099
  %450 = load i32, ptr %97, align 4, !dbg !2100
  %451 = getelementptr inbounds %struct.Trace029RuntimeRecord, ptr %121, i32 0, i32 6, !dbg !2101
  store i32 %450, ptr %451, align 4, !dbg !2102
  %452 = load i32, ptr %98, align 4, !dbg !2103
  %453 = getelementptr inbounds %struct.Trace029RuntimeRecord, ptr %121, i32 0, i32 7, !dbg !2104
  store i32 %452, ptr %453, align 4, !dbg !2105
  %454 = load i32, ptr %99, align 4, !dbg !2106
  %455 = getelementptr inbounds %struct.Trace029RuntimeRecord, ptr %121, i32 0, i32 8, !dbg !2107
  store i32 %454, ptr %455, align 4, !dbg !2108
  %456 = load i32, ptr %100, align 4, !dbg !2109
  %457 = getelementptr inbounds %struct.Trace029RuntimeRecord, ptr %121, i32 0, i32 9, !dbg !2110
  store i32 %456, ptr %457, align 4, !dbg !2111
  %458 = load i32, ptr %101, align 4, !dbg !2112
  %459 = getelementptr inbounds %struct.Trace029RuntimeRecord, ptr %121, i32 0, i32 10, !dbg !2113
  store i32 %458, ptr %459, align 4, !dbg !2114
  %460 = load i8, ptr %104, align 1, !dbg !2115
  %461 = trunc i8 %460 to i1, !dbg !2115
  %462 = zext i1 %461 to i64, !dbg !2115
  %463 = select i1 %461, i32 1, i32 0, !dbg !2115
  %464 = getelementptr inbounds %struct.Trace029RuntimeRecord, ptr %121, i32 0, i32 11, !dbg !2116
  store i32 %463, ptr %464, align 4, !dbg !2117
  %465 = load i8, ptr %105, align 1, !dbg !2118
  %466 = trunc i8 %465 to i1, !dbg !2118
  %467 = zext i1 %466 to i64, !dbg !2118
  %468 = select i1 %466, i32 1, i32 0, !dbg !2118
  %469 = getelementptr inbounds %struct.Trace029RuntimeRecord, ptr %121, i32 0, i32 12, !dbg !2119
  store i32 %468, ptr %469, align 4, !dbg !2120
  %470 = getelementptr inbounds %struct.Trace029RuntimeRecord, ptr %121, i32 0, i32 13, !dbg !2121
  store i32 1, ptr %470, align 4, !dbg !2122
  %471 = load i32, ptr %106, align 4, !dbg !2123
  %472 = getelementptr inbounds %struct.Trace029RuntimeRecord, ptr %121, i32 0, i32 14, !dbg !2124
  store i32 %471, ptr %472, align 4, !dbg !2125
  %473 = load i32, ptr %107, align 4, !dbg !2126
  %474 = getelementptr inbounds %struct.Trace029RuntimeRecord, ptr %121, i32 0, i32 15, !dbg !2127
  store i32 %473, ptr %474, align 4, !dbg !2128
  %475 = load ptr, ptr %83, align 8, !dbg !2129
  %476 = load i32, ptr %120, align 4, !dbg !2130
  %477 = zext i32 %476 to i64, !dbg !2129
  %478 = getelementptr inbounds %struct.Trace029RuntimeRecord, ptr %475, i64 %477, !dbg !2129
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %478, ptr align 4 %121, i64 64, i1 false), !dbg !2131
  br label %479, !dbg !2132

479:                                              ; preds = %436, %431
  br label %480, !dbg !2133

480:                                              ; preds = %479, %428, %425
  ret void, !dbg !2134
}

; Function Attrs: convergent mustprogress noinline nounwind optnone
define linkonce_odr hidden void @_Z13__syncthreadsv() #2 comdat !dbg !2135 {
  call void @_ZL9__barrieri(i32 noundef 1) #13, !dbg !2137
  ret void, !dbg !2138
}

; Function Attrs: convergent mustprogress noinline nounwind optnone
define linkonce_odr hidden noundef i32 @_Z9atomicAddPjj(ptr noundef %0, i32 noundef %1) #2 comdat !dbg !2139 {
  %3 = alloca i32, align 4, addrspace(5)
  %4 = alloca ptr, align 8, addrspace(5)
  %5 = alloca i32, align 4, addrspace(5)
  %6 = alloca i32, align 4, addrspace(5)
  %7 = alloca i32, align 4, addrspace(5)
  %8 = addrspacecast ptr addrspace(5) %3 to ptr
  %9 = addrspacecast ptr addrspace(5) %4 to ptr
  %10 = addrspacecast ptr addrspace(5) %5 to ptr
  %11 = addrspacecast ptr addrspace(5) %6 to ptr
  %12 = addrspacecast ptr addrspace(5) %7 to ptr
  store ptr %0, ptr %9, align 8
    #dbg_declare(ptr addrspace(5) %4, !2144, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(ptr)), !2146)
  store i32 %1, ptr %10, align 4
    #dbg_declare(ptr addrspace(5) %5, !2145, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !2147)
  %13 = load ptr, ptr %9, align 8, !dbg !2148
  %14 = load i32, ptr %10, align 4, !dbg !2149
  store i32 %14, ptr %11, align 4, !dbg !2150
  %15 = load i32, ptr %11, align 4, !dbg !2150
  %16 = atomicrmw add ptr %13, i32 %15 syncscope("agent-one-as") monotonic, align 4, !dbg !2150
  store i32 %16, ptr %12, align 4, !dbg !2150
  %17 = load i32, ptr %12, align 4, !dbg !2150
  ret i32 %17, !dbg !2151
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: convergent mustprogress noinline nounwind optnone
define internal void @_ZL9__barrieri(i32 noundef %0) #2 !dbg !2152 {
  %2 = alloca i32, align 4, addrspace(5)
  %3 = addrspacecast ptr addrspace(5) %2 to ptr
  store i32 %0, ptr %3, align 4
    #dbg_declare(ptr addrspace(5) %2, !2154, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !2155)
  %4 = load i32, ptr %3, align 4, !dbg !2156
  call void @_ZL20__work_group_barrierj(i32 noundef %4) #13, !dbg !2157
  ret void, !dbg !2158
}

; Function Attrs: convergent mustprogress noinline nounwind optnone
define internal void @_ZL20__work_group_barrierj(i32 noundef %0) #2 !dbg !2159 {
  %2 = alloca i32, align 4, addrspace(5)
  %3 = addrspacecast ptr addrspace(5) %2 to ptr
  store i32 %0, ptr %3, align 4
    #dbg_declare(ptr addrspace(5) %2, !2163, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !2164)
  %4 = load i32, ptr %3, align 4, !dbg !2165
  %5 = icmp ne i32 %4, 0, !dbg !2165
  br i1 %5, label %6, label %7, !dbg !2167

6:                                                ; preds = %1
  fence syncscope("workgroup") release, !dbg !2168
  call void @llvm.amdgcn.s.barrier(), !dbg !2170
  fence syncscope("workgroup") acquire, !dbg !2171
  br label %8, !dbg !2172

7:                                                ; preds = %1
  call void @llvm.amdgcn.s.barrier(), !dbg !2173
  br label %8

8:                                                ; preds = %7, %6
  ret void, !dbg !2175
}

; Function Attrs: convergent nocallback nofree nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #5

; Function Attrs: convergent mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal range(i64 0, 1024) i64 @__ockl_get_local_id(i32 noundef %0) #6 {
  switch i32 %0, label %8 [
    i32 0, label %2
    i32 1, label %4
    i32 2, label %6
  ]

2:                                                ; preds = %1
  %3 = tail call noundef range(i32 0, 1024) i32 @llvm.amdgcn.workitem.id.x()
  br label %8

4:                                                ; preds = %1
  %5 = tail call noundef range(i32 0, 1024) i32 @llvm.amdgcn.workitem.id.y()
  br label %8

6:                                                ; preds = %1
  %7 = tail call noundef range(i32 0, 1024) i32 @llvm.amdgcn.workitem.id.z()
  br label %8

8:                                                ; preds = %6, %4, %2, %1
  %9 = phi i32 [ %7, %6 ], [ %5, %4 ], [ %3, %2 ], [ 0, %1 ]
  %10 = zext nneg i32 %9 to i64
  ret i64 %10
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.amdgcn.workitem.id.x() #7

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.amdgcn.workitem.id.y() #7

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.amdgcn.workitem.id.z() #7

; Function Attrs: convergent norecurse nounwind
define internal i64 @__ockl_fprintf_stderr_begin() #8 {
  %1 = tail call <2 x i64> @__ockl_hostcall_preview(i32 noundef 2, i64 noundef 33, i64 noundef 1, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #13
  %2 = extractelement <2 x i64> %1, i64 0
  ret i64 %2
}

; Function Attrs: convergent norecurse nounwind
define internal <2 x i64> @__ockl_hostcall_preview(i32 noundef %0, i64 noundef %1, i64 noundef %2, i64 noundef %3, i64 noundef %4, i64 noundef %5, i64 noundef %6, i64 noundef %7, i64 noundef %8) local_unnamed_addr #8 {
  %10 = load i32, ptr addrspace(4) @__oclc_ABI_version, align 4, !tbaa !2176
  %11 = icmp slt i32 %10, 500
  %12 = tail call ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %13 = select i1 %11, i64 24, i64 80
  %14 = getelementptr inbounds i8, ptr addrspace(4) %12, i64 %13
  %15 = load i64, ptr addrspace(4) %14, align 8, !tbaa !2180
  %16 = inttoptr i64 %15 to ptr addrspace(1)
  %17 = addrspacecast ptr addrspace(1) %16 to ptr
  %18 = tail call <2 x i64> @__ockl_hostcall_internal(ptr noundef %17, i32 noundef %0, i64 noundef %1, i64 noundef %2, i64 noundef %3, i64 noundef %4, i64 noundef %5, i64 noundef %6, i64 noundef %7, i64 noundef %8) #15
  ret <2 x i64> %18
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef align 4 ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr() #7

; Function Attrs: convergent norecurse nounwind
define internal <2 x i64> @__ockl_hostcall_internal(ptr nocapture noundef %0, i32 noundef %1, i64 noundef %2, i64 noundef %3, i64 noundef %4, i64 noundef %5, i64 noundef %6, i64 noundef %7, i64 noundef %8, i64 noundef %9) local_unnamed_addr #8 {
  %11 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0)
  %12 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 -1, i32 %11)
  %13 = tail call i32 @llvm.amdgcn.readfirstlane.i32(i32 %12)
  %14 = addrspacecast ptr %0 to ptr addrspace(1)
  %15 = icmp eq i32 %12, %13
  br i1 %15, label %16, label %38

16:                                               ; preds = %10
  %17 = getelementptr inbounds i8, ptr addrspace(1) %14, i64 24
  %18 = load atomic i64, ptr addrspace(1) %17 syncscope("one-as") acquire, align 8
  %19 = getelementptr i8, ptr addrspace(1) %14, i64 40
  %20 = load ptr addrspace(1), ptr addrspace(1) %14, align 8, !tbaa !2182
  %21 = load i64, ptr addrspace(1) %19, align 8, !tbaa !2186
  %22 = and i64 %21, %18
  %23 = getelementptr inbounds %0, ptr addrspace(1) %20, i64 %22
  %24 = load atomic i64, ptr addrspace(1) %23 syncscope("one-as") monotonic, align 8
  %25 = cmpxchg ptr addrspace(1) %17, i64 %18, i64 %24 syncscope("one-as") acquire monotonic, align 8
  %26 = extractvalue { i64, i1 } %25, 1
  %27 = extractvalue { i64, i1 } %25, 0
  br i1 %26, label %38, label %28

28:                                               ; preds = %28, %16
  %29 = phi i64 [ %37, %28 ], [ %27, %16 ]
  tail call void @llvm.amdgcn.s.sleep(i32 1)
  %30 = load ptr addrspace(1), ptr addrspace(1) %14, align 8, !tbaa !2182
  %31 = load i64, ptr addrspace(1) %19, align 8, !tbaa !2186
  %32 = and i64 %31, %29
  %33 = getelementptr inbounds %0, ptr addrspace(1) %30, i64 %32
  %34 = load atomic i64, ptr addrspace(1) %33 syncscope("one-as") monotonic, align 8
  %35 = cmpxchg ptr addrspace(1) %17, i64 %29, i64 %34 syncscope("one-as") acquire monotonic, align 8
  %36 = extractvalue { i64, i1 } %35, 1
  %37 = extractvalue { i64, i1 } %35, 0
  br i1 %36, label %38, label %28

38:                                               ; preds = %28, %16, %10
  %39 = phi i64 [ 0, %10 ], [ %27, %16 ], [ %37, %28 ]
  %40 = trunc i64 %39 to i32
  %41 = lshr i64 %39, 32
  %42 = trunc nuw i64 %41 to i32
  %43 = tail call i32 @llvm.amdgcn.readfirstlane.i32(i32 %40)
  %44 = tail call i32 @llvm.amdgcn.readfirstlane.i32(i32 %42)
  %45 = zext i32 %44 to i64
  %46 = shl nuw i64 %45, 32
  %47 = zext i32 %43 to i64
  %48 = or disjoint i64 %46, %47
  %49 = load ptr addrspace(1), ptr addrspace(1) %14, align 8, !tbaa !2182
  %50 = getelementptr i8, ptr addrspace(1) %14, i64 40
  %51 = load i64, ptr addrspace(1) %50, align 8, !tbaa !2186
  %52 = and i64 %48, %51
  %53 = getelementptr inbounds %0, ptr addrspace(1) %49, i64 %52
  %54 = getelementptr i8, ptr addrspace(1) %14, i64 8
  %55 = load ptr addrspace(1), ptr addrspace(1) %54, align 8, !tbaa !2187
  %56 = getelementptr inbounds %1, ptr addrspace(1) %55, i64 %52
  %57 = tail call i64 @llvm.amdgcn.ballot.i64(i1 true)
  br i1 %15, label %58, label %62

58:                                               ; preds = %38
  %59 = getelementptr inbounds i8, ptr addrspace(1) %53, i64 16
  %60 = getelementptr inbounds i8, ptr addrspace(1) %53, i64 8
  %61 = getelementptr inbounds i8, ptr addrspace(1) %53, i64 20
  store i32 %1, ptr addrspace(1) %59, align 8, !tbaa !2188
  store i64 %57, ptr addrspace(1) %60, align 8, !tbaa !2190
  store i32 1, ptr addrspace(1) %61, align 4, !tbaa !2191
  br label %62

62:                                               ; preds = %58, %38
  %63 = zext i32 %12 to i64
  %64 = getelementptr inbounds [64 x [8 x i64]], ptr addrspace(1) %56, i64 0, i64 %63
  store i64 %2, ptr addrspace(1) %64, align 8, !tbaa !2180
  %65 = getelementptr inbounds i8, ptr addrspace(1) %64, i64 8
  store i64 %3, ptr addrspace(1) %65, align 8, !tbaa !2180
  %66 = getelementptr inbounds i8, ptr addrspace(1) %64, i64 16
  store i64 %4, ptr addrspace(1) %66, align 8, !tbaa !2180
  %67 = getelementptr inbounds i8, ptr addrspace(1) %64, i64 24
  store i64 %5, ptr addrspace(1) %67, align 8, !tbaa !2180
  %68 = getelementptr inbounds i8, ptr addrspace(1) %64, i64 32
  store i64 %6, ptr addrspace(1) %68, align 8, !tbaa !2180
  %69 = getelementptr inbounds i8, ptr addrspace(1) %64, i64 40
  store i64 %7, ptr addrspace(1) %69, align 8, !tbaa !2180
  %70 = getelementptr inbounds i8, ptr addrspace(1) %64, i64 48
  store i64 %8, ptr addrspace(1) %70, align 8, !tbaa !2180
  %71 = getelementptr inbounds i8, ptr addrspace(1) %64, i64 56
  store i64 %9, ptr addrspace(1) %71, align 8, !tbaa !2180
  br i1 %15, label %72, label %88

72:                                               ; preds = %62
  %73 = getelementptr inbounds i8, ptr addrspace(1) %14, i64 32
  %74 = load atomic i64, ptr addrspace(1) %73 syncscope("one-as") monotonic, align 8
  %75 = load i64, ptr addrspace(1) %50, align 8, !tbaa !2186
  %76 = and i64 %75, %48
  %77 = getelementptr inbounds %0, ptr addrspace(1) %49, i64 %76
  store i64 %74, ptr addrspace(1) %77, align 8, !tbaa !2192
  %78 = cmpxchg ptr addrspace(1) %73, i64 %74, i64 %48 syncscope("one-as") release monotonic, align 8
  %79 = extractvalue { i64, i1 } %78, 1
  br i1 %79, label %85, label %80

80:                                               ; preds = %80, %72
  %81 = phi { i64, i1 } [ %83, %80 ], [ %78, %72 ]
  %82 = extractvalue { i64, i1 } %81, 0
  tail call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %82, ptr addrspace(1) %77, align 8, !tbaa !2192
  %83 = cmpxchg ptr addrspace(1) %73, i64 %82, i64 %48 syncscope("one-as") release monotonic, align 8
  %84 = extractvalue { i64, i1 } %83, 1
  br i1 %84, label %85, label %80

85:                                               ; preds = %80, %72
  %86 = getelementptr inbounds i8, ptr addrspace(1) %14, i64 16
  %87 = load i64, ptr addrspace(1) %86, align 8
  tail call void @__ockl_hsa_signal_add(i64 %87, i64 noundef 1, i32 noundef 3) #13
  br label %88

88:                                               ; preds = %85, %62
  %89 = getelementptr inbounds i8, ptr addrspace(1) %53, i64 20
  br label %90

90:                                               ; preds = %98, %88
  br i1 %15, label %91, label %94

91:                                               ; preds = %90
  %92 = load atomic i32, ptr addrspace(1) %89 syncscope("one-as") acquire, align 4
  %93 = and i32 %92, 1
  br label %94

94:                                               ; preds = %91, %90
  %95 = phi i32 [ %93, %91 ], [ 1, %90 ]
  %96 = tail call i32 @llvm.amdgcn.readfirstlane.i32(i32 %95)
  %97 = icmp eq i32 %96, 0
  br i1 %97, label %99, label %98

98:                                               ; preds = %94
  tail call void @llvm.amdgcn.s.sleep(i32 1)
  br label %90

99:                                               ; preds = %94
  %100 = load i64, ptr addrspace(1) %64, align 8, !tbaa !2180
  %101 = load i64, ptr addrspace(1) %65, align 8, !tbaa !2180
  br i1 %15, label %102, label %120

102:                                              ; preds = %99
  %103 = load i64, ptr addrspace(1) %50, align 8, !tbaa !2186
  %104 = add i64 %103, 1
  %105 = add i64 %104, %48
  %106 = icmp eq i64 %105, 0
  %107 = select i1 %106, i64 %104, i64 %105
  %108 = getelementptr inbounds i8, ptr addrspace(1) %14, i64 24
  %109 = load atomic i64, ptr addrspace(1) %108 syncscope("one-as") monotonic, align 8
  %110 = load ptr addrspace(1), ptr addrspace(1) %14, align 8, !tbaa !2182
  %111 = and i64 %107, %103
  %112 = getelementptr inbounds %0, ptr addrspace(1) %110, i64 %111
  store i64 %109, ptr addrspace(1) %112, align 8, !tbaa !2192
  %113 = cmpxchg ptr addrspace(1) %108, i64 %109, i64 %107 syncscope("one-as") release monotonic, align 8
  %114 = extractvalue { i64, i1 } %113, 1
  br i1 %114, label %120, label %115

115:                                              ; preds = %115, %102
  %116 = phi { i64, i1 } [ %118, %115 ], [ %113, %102 ]
  %117 = extractvalue { i64, i1 } %116, 0
  tail call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %117, ptr addrspace(1) %112, align 8, !tbaa !2192
  %118 = cmpxchg ptr addrspace(1) %108, i64 %117, i64 %107 syncscope("one-as") release monotonic, align 8
  %119 = extractvalue { i64, i1 } %118, 1
  br i1 %119, label %120, label %115

120:                                              ; preds = %115, %102, %99
  %121 = insertelement <2 x i64> poison, i64 %100, i64 0
  %122 = insertelement <2 x i64> %121, i64 %101, i64 1
  ret <2 x i64> %122
}

; Function Attrs: convergent nocallback nofree nounwind willreturn memory(none)
declare i32 @llvm.amdgcn.readfirstlane.i32(i32) #9

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.amdgcn.s.sleep(i32 immarg) #10

; Function Attrs: convergent nocallback nofree nounwind willreturn memory(none)
declare i64 @llvm.amdgcn.ballot.i64(i1) #9

; Function Attrs: convergent norecurse nounwind
define internal void @__ockl_hsa_signal_add(i64 %0, i64 noundef %1, i32 noundef %2) local_unnamed_addr #8 {
  %4 = inttoptr i64 %0 to ptr addrspace(1)
  %5 = getelementptr inbounds i8, ptr addrspace(1) %4, i64 8
  switch i32 %2, label %6 [
    i32 1, label %8
    i32 2, label %8
    i32 3, label %10
    i32 4, label %12
    i32 5, label %14
  ]

6:                                                ; preds = %3
  %7 = atomicrmw add ptr addrspace(1) %5, i64 %1 syncscope("one-as") monotonic, align 8
  br label %16

8:                                                ; preds = %3, %3
  %9 = atomicrmw add ptr addrspace(1) %5, i64 %1 syncscope("one-as") acquire, align 8
  br label %16

10:                                               ; preds = %3
  %11 = atomicrmw add ptr addrspace(1) %5, i64 %1 syncscope("one-as") release, align 8
  br label %16

12:                                               ; preds = %3
  %13 = atomicrmw add ptr addrspace(1) %5, i64 %1 syncscope("one-as") acq_rel, align 8
  br label %16

14:                                               ; preds = %3
  %15 = atomicrmw add ptr addrspace(1) %5, i64 %1 seq_cst, align 8
  br label %16

16:                                               ; preds = %14, %12, %10, %8, %6
  %17 = getelementptr inbounds i8, ptr addrspace(1) %4, i64 16
  %18 = load i64, ptr addrspace(1) %17, align 16, !tbaa !2193
  %19 = icmp eq i64 %18, 0
  br i1 %19, label %34, label %20

20:                                               ; preds = %16
  %21 = inttoptr i64 %18 to ptr addrspace(1)
  %22 = getelementptr inbounds i8, ptr addrspace(1) %4, i64 24
  %23 = load i32, ptr addrspace(1) %22, align 8, !tbaa !2195
  %24 = zext i32 %23 to i64
  store atomic i64 %24, ptr addrspace(1) %21 syncscope("one-as") release, align 8
  %25 = load i32, ptr addrspace(4) @__oclc_ISA_version, align 4, !tbaa !2176
  %26 = icmp slt i32 %25, 9000
  %27 = icmp ult i32 %25, 10000
  %28 = icmp ult i32 %25, 11000
  %29 = select i1 %28, i32 8388607, i32 16777215
  %30 = select i1 %27, i32 16777215, i32 %29
  %31 = select i1 %26, i32 255, i32 %30
  %32 = and i32 %31, %23
  %33 = tail call i32 @llvm.amdgcn.readfirstlane.i32(i32 %32)
  tail call void @llvm.amdgcn.s.sendmsg(i32 1, i32 %33)
  br label %34

34:                                               ; preds = %20, %16
  ret void
}

; Function Attrs: nounwind
declare void @llvm.amdgcn.s.sendmsg(i32 immarg, i32) #11

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare i32 @llvm.amdgcn.mbcnt.lo(i32, i32) #12

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare i32 @llvm.amdgcn.mbcnt.hi(i32, i32) #12

; Function Attrs: convergent norecurse nounwind
define internal i64 @__ockl_fprintf_append_args(i64 noundef %0, i32 noundef %1, i64 noundef %2, i64 noundef %3, i64 noundef %4, i64 noundef %5, i64 noundef %6, i64 noundef %7, i64 noundef %8, i32 noundef %9) #8 {
  %11 = icmp eq i32 %9, 0
  %12 = or i64 %0, 2
  %13 = select i1 %11, i64 %0, i64 %12
  %14 = and i64 %13, -225
  %15 = zext i32 %1 to i64
  %16 = shl nuw nsw i64 %15, 5
  %17 = or i64 %14, %16
  %18 = tail call <2 x i64> @__ockl_hostcall_preview(i32 noundef 2, i64 noundef %17, i64 noundef %2, i64 noundef %3, i64 noundef %4, i64 noundef %5, i64 noundef %6, i64 noundef %7, i64 noundef %8) #13
  %19 = extractelement <2 x i64> %18, i64 0
  ret i64 %19
}

; Function Attrs: convergent norecurse nounwind
define internal i64 @__ockl_fprintf_append_string_n(i64 noundef %0, ptr noundef readonly %1, i64 noundef %2, i32 noundef %3) #8 {
  %5 = icmp eq i32 %3, 0
  %6 = or i64 %0, 2
  %7 = select i1 %5, i64 %0, i64 %6
  %8 = icmp eq ptr %1, null
  br i1 %8, label %9, label %13

9:                                                ; preds = %4
  %10 = and i64 %7, -225
  %11 = or disjoint i64 %10, 32
  %12 = tail call <2 x i64> @__ockl_hostcall_preview(i32 noundef 2, i64 noundef %11, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #13
  br label %454

13:                                               ; preds = %4
  %14 = and i64 %7, 2
  %15 = and i64 %7, -3
  %16 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %15, i64 0
  br label %17

17:                                               ; preds = %443, %13
  %18 = phi i64 [ %2, %13 ], [ %451, %443 ]
  %19 = phi ptr [ %1, %13 ], [ %452, %443 ]
  %20 = phi <2 x i64> [ %16, %13 ], [ %450, %443 ]
  %21 = icmp ugt i64 %18, 56
  %22 = extractelement <2 x i64> %20, i64 0
  %23 = or i64 %22, %14
  %24 = insertelement <2 x i64> poison, i64 %23, i64 0
  %25 = select i1 %21, <2 x i64> %20, <2 x i64> %24
  %26 = tail call i64 @llvm.umin.i64(i64 %18, i64 56)
  %27 = trunc nuw nsw i64 %26 to i32
  %28 = extractelement <2 x i64> %25, i64 0
  %29 = icmp ugt i64 %18, 7
  br i1 %29, label %32, label %30

30:                                               ; preds = %17
  %31 = icmp eq i64 %18, 0
  br i1 %31, label %85, label %72

32:                                               ; preds = %17
  %33 = load i8, ptr %19, align 1, !tbaa !2196
  %34 = zext i8 %33 to i64
  %35 = getelementptr inbounds i8, ptr %19, i64 1
  %36 = load i8, ptr %35, align 1, !tbaa !2196
  %37 = zext i8 %36 to i64
  %38 = shl nuw nsw i64 %37, 8
  %39 = or disjoint i64 %38, %34
  %40 = getelementptr inbounds i8, ptr %19, i64 2
  %41 = load i8, ptr %40, align 1, !tbaa !2196
  %42 = zext i8 %41 to i64
  %43 = shl nuw nsw i64 %42, 16
  %44 = or disjoint i64 %39, %43
  %45 = getelementptr inbounds i8, ptr %19, i64 3
  %46 = load i8, ptr %45, align 1, !tbaa !2196
  %47 = zext i8 %46 to i64
  %48 = shl nuw nsw i64 %47, 24
  %49 = or disjoint i64 %44, %48
  %50 = getelementptr inbounds i8, ptr %19, i64 4
  %51 = load i8, ptr %50, align 1, !tbaa !2196
  %52 = zext i8 %51 to i64
  %53 = shl nuw nsw i64 %52, 32
  %54 = or disjoint i64 %49, %53
  %55 = getelementptr inbounds i8, ptr %19, i64 5
  %56 = load i8, ptr %55, align 1, !tbaa !2196
  %57 = zext i8 %56 to i64
  %58 = shl nuw nsw i64 %57, 40
  %59 = or i64 %54, %58
  %60 = getelementptr inbounds i8, ptr %19, i64 6
  %61 = load i8, ptr %60, align 1, !tbaa !2196
  %62 = zext i8 %61 to i64
  %63 = shl nuw nsw i64 %62, 48
  %64 = or i64 %59, %63
  %65 = getelementptr inbounds i8, ptr %19, i64 7
  %66 = load i8, ptr %65, align 1, !tbaa !2196
  %67 = zext i8 %66 to i64
  %68 = shl nuw i64 %67, 56
  %69 = or i64 %64, %68
  %70 = add nsw i32 %27, -8
  %71 = getelementptr inbounds i8, ptr %19, i64 8
  br label %85

72:                                               ; preds = %72, %30
  %73 = phi i32 [ %83, %72 ], [ 0, %30 ]
  %74 = phi i64 [ %82, %72 ], [ 0, %30 ]
  %75 = zext nneg i32 %73 to i64
  %76 = getelementptr inbounds i8, ptr %19, i64 %75
  %77 = load i8, ptr %76, align 1, !tbaa !2196
  %78 = zext i8 %77 to i64
  %79 = shl i32 %73, 3
  %80 = zext nneg i32 %79 to i64
  %81 = shl nuw i64 %78, %80
  %82 = or i64 %81, %74
  %83 = add nuw nsw i32 %73, 1
  %84 = icmp eq i32 %83, %27
  br i1 %84, label %85, label %72

85:                                               ; preds = %72, %32, %30
  %86 = phi ptr [ %71, %32 ], [ %19, %30 ], [ %19, %72 ]
  %87 = phi i32 [ %70, %32 ], [ 0, %30 ], [ 0, %72 ]
  %88 = phi i64 [ %69, %32 ], [ 0, %30 ], [ %82, %72 ]
  %89 = icmp ugt i32 %87, 7
  br i1 %89, label %92, label %90

90:                                               ; preds = %85
  %91 = icmp eq i32 %87, 0
  br i1 %91, label %145, label %132

92:                                               ; preds = %85
  %93 = load i8, ptr %86, align 1, !tbaa !2196
  %94 = zext i8 %93 to i64
  %95 = getelementptr inbounds i8, ptr %86, i64 1
  %96 = load i8, ptr %95, align 1, !tbaa !2196
  %97 = zext i8 %96 to i64
  %98 = shl nuw nsw i64 %97, 8
  %99 = or disjoint i64 %98, %94
  %100 = getelementptr inbounds i8, ptr %86, i64 2
  %101 = load i8, ptr %100, align 1, !tbaa !2196
  %102 = zext i8 %101 to i64
  %103 = shl nuw nsw i64 %102, 16
  %104 = or disjoint i64 %99, %103
  %105 = getelementptr inbounds i8, ptr %86, i64 3
  %106 = load i8, ptr %105, align 1, !tbaa !2196
  %107 = zext i8 %106 to i64
  %108 = shl nuw nsw i64 %107, 24
  %109 = or disjoint i64 %104, %108
  %110 = getelementptr inbounds i8, ptr %86, i64 4
  %111 = load i8, ptr %110, align 1, !tbaa !2196
  %112 = zext i8 %111 to i64
  %113 = shl nuw nsw i64 %112, 32
  %114 = or disjoint i64 %109, %113
  %115 = getelementptr inbounds i8, ptr %86, i64 5
  %116 = load i8, ptr %115, align 1, !tbaa !2196
  %117 = zext i8 %116 to i64
  %118 = shl nuw nsw i64 %117, 40
  %119 = or i64 %114, %118
  %120 = getelementptr inbounds i8, ptr %86, i64 6
  %121 = load i8, ptr %120, align 1, !tbaa !2196
  %122 = zext i8 %121 to i64
  %123 = shl nuw nsw i64 %122, 48
  %124 = or i64 %119, %123
  %125 = getelementptr inbounds i8, ptr %86, i64 7
  %126 = load i8, ptr %125, align 1, !tbaa !2196
  %127 = zext i8 %126 to i64
  %128 = shl nuw i64 %127, 56
  %129 = or i64 %124, %128
  %130 = add nsw i32 %87, -8
  %131 = getelementptr inbounds i8, ptr %86, i64 8
  br label %145

132:                                              ; preds = %132, %90
  %133 = phi i32 [ %143, %132 ], [ 0, %90 ]
  %134 = phi i64 [ %142, %132 ], [ 0, %90 ]
  %135 = zext nneg i32 %133 to i64
  %136 = getelementptr inbounds i8, ptr %86, i64 %135
  %137 = load i8, ptr %136, align 1, !tbaa !2196
  %138 = zext i8 %137 to i64
  %139 = shl i32 %133, 3
  %140 = zext nneg i32 %139 to i64
  %141 = shl nuw i64 %138, %140
  %142 = or i64 %141, %134
  %143 = add nuw nsw i32 %133, 1
  %144 = icmp eq i32 %143, %87
  br i1 %144, label %145, label %132

145:                                              ; preds = %132, %92, %90
  %146 = phi ptr [ %131, %92 ], [ %86, %90 ], [ %86, %132 ]
  %147 = phi i32 [ %130, %92 ], [ 0, %90 ], [ 0, %132 ]
  %148 = phi i64 [ %129, %92 ], [ 0, %90 ], [ %142, %132 ]
  %149 = icmp ugt i32 %147, 7
  br i1 %149, label %152, label %150

150:                                              ; preds = %145
  %151 = icmp eq i32 %147, 0
  br i1 %151, label %205, label %192

152:                                              ; preds = %145
  %153 = load i8, ptr %146, align 1, !tbaa !2196
  %154 = zext i8 %153 to i64
  %155 = getelementptr inbounds i8, ptr %146, i64 1
  %156 = load i8, ptr %155, align 1, !tbaa !2196
  %157 = zext i8 %156 to i64
  %158 = shl nuw nsw i64 %157, 8
  %159 = or disjoint i64 %158, %154
  %160 = getelementptr inbounds i8, ptr %146, i64 2
  %161 = load i8, ptr %160, align 1, !tbaa !2196
  %162 = zext i8 %161 to i64
  %163 = shl nuw nsw i64 %162, 16
  %164 = or disjoint i64 %159, %163
  %165 = getelementptr inbounds i8, ptr %146, i64 3
  %166 = load i8, ptr %165, align 1, !tbaa !2196
  %167 = zext i8 %166 to i64
  %168 = shl nuw nsw i64 %167, 24
  %169 = or disjoint i64 %164, %168
  %170 = getelementptr inbounds i8, ptr %146, i64 4
  %171 = load i8, ptr %170, align 1, !tbaa !2196
  %172 = zext i8 %171 to i64
  %173 = shl nuw nsw i64 %172, 32
  %174 = or disjoint i64 %169, %173
  %175 = getelementptr inbounds i8, ptr %146, i64 5
  %176 = load i8, ptr %175, align 1, !tbaa !2196
  %177 = zext i8 %176 to i64
  %178 = shl nuw nsw i64 %177, 40
  %179 = or i64 %174, %178
  %180 = getelementptr inbounds i8, ptr %146, i64 6
  %181 = load i8, ptr %180, align 1, !tbaa !2196
  %182 = zext i8 %181 to i64
  %183 = shl nuw nsw i64 %182, 48
  %184 = or i64 %179, %183
  %185 = getelementptr inbounds i8, ptr %146, i64 7
  %186 = load i8, ptr %185, align 1, !tbaa !2196
  %187 = zext i8 %186 to i64
  %188 = shl nuw i64 %187, 56
  %189 = or i64 %184, %188
  %190 = add nsw i32 %147, -8
  %191 = getelementptr inbounds i8, ptr %146, i64 8
  br label %205

192:                                              ; preds = %192, %150
  %193 = phi i32 [ %203, %192 ], [ 0, %150 ]
  %194 = phi i64 [ %202, %192 ], [ 0, %150 ]
  %195 = zext nneg i32 %193 to i64
  %196 = getelementptr inbounds i8, ptr %146, i64 %195
  %197 = load i8, ptr %196, align 1, !tbaa !2196
  %198 = zext i8 %197 to i64
  %199 = shl i32 %193, 3
  %200 = zext nneg i32 %199 to i64
  %201 = shl nuw i64 %198, %200
  %202 = or i64 %201, %194
  %203 = add nuw nsw i32 %193, 1
  %204 = icmp eq i32 %203, %147
  br i1 %204, label %205, label %192

205:                                              ; preds = %192, %152, %150
  %206 = phi ptr [ %191, %152 ], [ %146, %150 ], [ %146, %192 ]
  %207 = phi i32 [ %190, %152 ], [ 0, %150 ], [ 0, %192 ]
  %208 = phi i64 [ %189, %152 ], [ 0, %150 ], [ %202, %192 ]
  %209 = icmp ugt i32 %207, 7
  br i1 %209, label %212, label %210

210:                                              ; preds = %205
  %211 = icmp eq i32 %207, 0
  br i1 %211, label %265, label %252

212:                                              ; preds = %205
  %213 = load i8, ptr %206, align 1, !tbaa !2196
  %214 = zext i8 %213 to i64
  %215 = getelementptr inbounds i8, ptr %206, i64 1
  %216 = load i8, ptr %215, align 1, !tbaa !2196
  %217 = zext i8 %216 to i64
  %218 = shl nuw nsw i64 %217, 8
  %219 = or disjoint i64 %218, %214
  %220 = getelementptr inbounds i8, ptr %206, i64 2
  %221 = load i8, ptr %220, align 1, !tbaa !2196
  %222 = zext i8 %221 to i64
  %223 = shl nuw nsw i64 %222, 16
  %224 = or disjoint i64 %219, %223
  %225 = getelementptr inbounds i8, ptr %206, i64 3
  %226 = load i8, ptr %225, align 1, !tbaa !2196
  %227 = zext i8 %226 to i64
  %228 = shl nuw nsw i64 %227, 24
  %229 = or disjoint i64 %224, %228
  %230 = getelementptr inbounds i8, ptr %206, i64 4
  %231 = load i8, ptr %230, align 1, !tbaa !2196
  %232 = zext i8 %231 to i64
  %233 = shl nuw nsw i64 %232, 32
  %234 = or disjoint i64 %229, %233
  %235 = getelementptr inbounds i8, ptr %206, i64 5
  %236 = load i8, ptr %235, align 1, !tbaa !2196
  %237 = zext i8 %236 to i64
  %238 = shl nuw nsw i64 %237, 40
  %239 = or i64 %234, %238
  %240 = getelementptr inbounds i8, ptr %206, i64 6
  %241 = load i8, ptr %240, align 1, !tbaa !2196
  %242 = zext i8 %241 to i64
  %243 = shl nuw nsw i64 %242, 48
  %244 = or i64 %239, %243
  %245 = getelementptr inbounds i8, ptr %206, i64 7
  %246 = load i8, ptr %245, align 1, !tbaa !2196
  %247 = zext i8 %246 to i64
  %248 = shl nuw i64 %247, 56
  %249 = or i64 %244, %248
  %250 = add nsw i32 %207, -8
  %251 = getelementptr inbounds i8, ptr %206, i64 8
  br label %265

252:                                              ; preds = %252, %210
  %253 = phi i32 [ %263, %252 ], [ 0, %210 ]
  %254 = phi i64 [ %262, %252 ], [ 0, %210 ]
  %255 = zext nneg i32 %253 to i64
  %256 = getelementptr inbounds i8, ptr %206, i64 %255
  %257 = load i8, ptr %256, align 1, !tbaa !2196
  %258 = zext i8 %257 to i64
  %259 = shl i32 %253, 3
  %260 = zext nneg i32 %259 to i64
  %261 = shl nuw i64 %258, %260
  %262 = or i64 %261, %254
  %263 = add nuw nsw i32 %253, 1
  %264 = icmp eq i32 %263, %207
  br i1 %264, label %265, label %252

265:                                              ; preds = %252, %212, %210
  %266 = phi ptr [ %251, %212 ], [ %206, %210 ], [ %206, %252 ]
  %267 = phi i32 [ %250, %212 ], [ 0, %210 ], [ 0, %252 ]
  %268 = phi i64 [ %249, %212 ], [ 0, %210 ], [ %262, %252 ]
  %269 = icmp ugt i32 %267, 7
  br i1 %269, label %272, label %270

270:                                              ; preds = %265
  %271 = icmp eq i32 %267, 0
  br i1 %271, label %325, label %312

272:                                              ; preds = %265
  %273 = load i8, ptr %266, align 1, !tbaa !2196
  %274 = zext i8 %273 to i64
  %275 = getelementptr inbounds i8, ptr %266, i64 1
  %276 = load i8, ptr %275, align 1, !tbaa !2196
  %277 = zext i8 %276 to i64
  %278 = shl nuw nsw i64 %277, 8
  %279 = or disjoint i64 %278, %274
  %280 = getelementptr inbounds i8, ptr %266, i64 2
  %281 = load i8, ptr %280, align 1, !tbaa !2196
  %282 = zext i8 %281 to i64
  %283 = shl nuw nsw i64 %282, 16
  %284 = or disjoint i64 %279, %283
  %285 = getelementptr inbounds i8, ptr %266, i64 3
  %286 = load i8, ptr %285, align 1, !tbaa !2196
  %287 = zext i8 %286 to i64
  %288 = shl nuw nsw i64 %287, 24
  %289 = or disjoint i64 %284, %288
  %290 = getelementptr inbounds i8, ptr %266, i64 4
  %291 = load i8, ptr %290, align 1, !tbaa !2196
  %292 = zext i8 %291 to i64
  %293 = shl nuw nsw i64 %292, 32
  %294 = or disjoint i64 %289, %293
  %295 = getelementptr inbounds i8, ptr %266, i64 5
  %296 = load i8, ptr %295, align 1, !tbaa !2196
  %297 = zext i8 %296 to i64
  %298 = shl nuw nsw i64 %297, 40
  %299 = or i64 %294, %298
  %300 = getelementptr inbounds i8, ptr %266, i64 6
  %301 = load i8, ptr %300, align 1, !tbaa !2196
  %302 = zext i8 %301 to i64
  %303 = shl nuw nsw i64 %302, 48
  %304 = or i64 %299, %303
  %305 = getelementptr inbounds i8, ptr %266, i64 7
  %306 = load i8, ptr %305, align 1, !tbaa !2196
  %307 = zext i8 %306 to i64
  %308 = shl nuw i64 %307, 56
  %309 = or i64 %304, %308
  %310 = add nsw i32 %267, -8
  %311 = getelementptr inbounds i8, ptr %266, i64 8
  br label %325

312:                                              ; preds = %312, %270
  %313 = phi i32 [ %323, %312 ], [ 0, %270 ]
  %314 = phi i64 [ %322, %312 ], [ 0, %270 ]
  %315 = zext nneg i32 %313 to i64
  %316 = getelementptr inbounds i8, ptr %266, i64 %315
  %317 = load i8, ptr %316, align 1, !tbaa !2196
  %318 = zext i8 %317 to i64
  %319 = shl i32 %313, 3
  %320 = zext nneg i32 %319 to i64
  %321 = shl nuw i64 %318, %320
  %322 = or i64 %321, %314
  %323 = add nuw nsw i32 %313, 1
  %324 = icmp eq i32 %323, %267
  br i1 %324, label %325, label %312

325:                                              ; preds = %312, %272, %270
  %326 = phi ptr [ %311, %272 ], [ %266, %270 ], [ %266, %312 ]
  %327 = phi i32 [ %310, %272 ], [ 0, %270 ], [ 0, %312 ]
  %328 = phi i64 [ %309, %272 ], [ 0, %270 ], [ %322, %312 ]
  %329 = icmp ugt i32 %327, 7
  br i1 %329, label %332, label %330

330:                                              ; preds = %325
  %331 = icmp eq i32 %327, 0
  br i1 %331, label %385, label %372

332:                                              ; preds = %325
  %333 = load i8, ptr %326, align 1, !tbaa !2196
  %334 = zext i8 %333 to i64
  %335 = getelementptr inbounds i8, ptr %326, i64 1
  %336 = load i8, ptr %335, align 1, !tbaa !2196
  %337 = zext i8 %336 to i64
  %338 = shl nuw nsw i64 %337, 8
  %339 = or disjoint i64 %338, %334
  %340 = getelementptr inbounds i8, ptr %326, i64 2
  %341 = load i8, ptr %340, align 1, !tbaa !2196
  %342 = zext i8 %341 to i64
  %343 = shl nuw nsw i64 %342, 16
  %344 = or disjoint i64 %339, %343
  %345 = getelementptr inbounds i8, ptr %326, i64 3
  %346 = load i8, ptr %345, align 1, !tbaa !2196
  %347 = zext i8 %346 to i64
  %348 = shl nuw nsw i64 %347, 24
  %349 = or disjoint i64 %344, %348
  %350 = getelementptr inbounds i8, ptr %326, i64 4
  %351 = load i8, ptr %350, align 1, !tbaa !2196
  %352 = zext i8 %351 to i64
  %353 = shl nuw nsw i64 %352, 32
  %354 = or disjoint i64 %349, %353
  %355 = getelementptr inbounds i8, ptr %326, i64 5
  %356 = load i8, ptr %355, align 1, !tbaa !2196
  %357 = zext i8 %356 to i64
  %358 = shl nuw nsw i64 %357, 40
  %359 = or i64 %354, %358
  %360 = getelementptr inbounds i8, ptr %326, i64 6
  %361 = load i8, ptr %360, align 1, !tbaa !2196
  %362 = zext i8 %361 to i64
  %363 = shl nuw nsw i64 %362, 48
  %364 = or i64 %359, %363
  %365 = getelementptr inbounds i8, ptr %326, i64 7
  %366 = load i8, ptr %365, align 1, !tbaa !2196
  %367 = zext i8 %366 to i64
  %368 = shl nuw i64 %367, 56
  %369 = or i64 %364, %368
  %370 = add nsw i32 %327, -8
  %371 = getelementptr inbounds i8, ptr %326, i64 8
  br label %385

372:                                              ; preds = %372, %330
  %373 = phi i32 [ %383, %372 ], [ 0, %330 ]
  %374 = phi i64 [ %382, %372 ], [ 0, %330 ]
  %375 = zext nneg i32 %373 to i64
  %376 = getelementptr inbounds i8, ptr %326, i64 %375
  %377 = load i8, ptr %376, align 1, !tbaa !2196
  %378 = zext i8 %377 to i64
  %379 = shl i32 %373, 3
  %380 = zext nneg i32 %379 to i64
  %381 = shl nuw i64 %378, %380
  %382 = or i64 %381, %374
  %383 = add nuw nsw i32 %373, 1
  %384 = icmp eq i32 %383, %327
  br i1 %384, label %385, label %372

385:                                              ; preds = %372, %332, %330
  %386 = phi ptr [ %371, %332 ], [ %326, %330 ], [ %326, %372 ]
  %387 = phi i32 [ %370, %332 ], [ 0, %330 ], [ 0, %372 ]
  %388 = phi i64 [ %369, %332 ], [ 0, %330 ], [ %382, %372 ]
  %389 = icmp ugt i32 %387, 7
  br i1 %389, label %392, label %390

390:                                              ; preds = %385
  %391 = icmp eq i32 %387, 0
  br i1 %391, label %443, label %430

392:                                              ; preds = %385
  %393 = load i8, ptr %386, align 1, !tbaa !2196
  %394 = zext i8 %393 to i64
  %395 = getelementptr inbounds i8, ptr %386, i64 1
  %396 = load i8, ptr %395, align 1, !tbaa !2196
  %397 = zext i8 %396 to i64
  %398 = shl nuw nsw i64 %397, 8
  %399 = or disjoint i64 %398, %394
  %400 = getelementptr inbounds i8, ptr %386, i64 2
  %401 = load i8, ptr %400, align 1, !tbaa !2196
  %402 = zext i8 %401 to i64
  %403 = shl nuw nsw i64 %402, 16
  %404 = or disjoint i64 %399, %403
  %405 = getelementptr inbounds i8, ptr %386, i64 3
  %406 = load i8, ptr %405, align 1, !tbaa !2196
  %407 = zext i8 %406 to i64
  %408 = shl nuw nsw i64 %407, 24
  %409 = or disjoint i64 %404, %408
  %410 = getelementptr inbounds i8, ptr %386, i64 4
  %411 = load i8, ptr %410, align 1, !tbaa !2196
  %412 = zext i8 %411 to i64
  %413 = shl nuw nsw i64 %412, 32
  %414 = or disjoint i64 %409, %413
  %415 = getelementptr inbounds i8, ptr %386, i64 5
  %416 = load i8, ptr %415, align 1, !tbaa !2196
  %417 = zext i8 %416 to i64
  %418 = shl nuw nsw i64 %417, 40
  %419 = or i64 %414, %418
  %420 = getelementptr inbounds i8, ptr %386, i64 6
  %421 = load i8, ptr %420, align 1, !tbaa !2196
  %422 = zext i8 %421 to i64
  %423 = shl nuw nsw i64 %422, 48
  %424 = or i64 %419, %423
  %425 = getelementptr inbounds i8, ptr %386, i64 7
  %426 = load i8, ptr %425, align 1, !tbaa !2196
  %427 = zext i8 %426 to i64
  %428 = shl nuw i64 %427, 56
  %429 = or i64 %424, %428
  br label %443

430:                                              ; preds = %430, %390
  %431 = phi i32 [ %441, %430 ], [ 0, %390 ]
  %432 = phi i64 [ %440, %430 ], [ 0, %390 ]
  %433 = zext nneg i32 %431 to i64
  %434 = getelementptr inbounds i8, ptr %386, i64 %433
  %435 = load i8, ptr %434, align 1, !tbaa !2196
  %436 = zext i8 %435 to i64
  %437 = shl i32 %431, 3
  %438 = zext nneg i32 %437 to i64
  %439 = shl nuw i64 %436, %438
  %440 = or i64 %439, %432
  %441 = add nuw nsw i32 %431, 1
  %442 = icmp eq i32 %441, %387
  br i1 %442, label %443, label %430

443:                                              ; preds = %430, %392, %390
  %444 = phi i64 [ %429, %392 ], [ 0, %390 ], [ %440, %430 ]
  %445 = shl nuw nsw i64 %26, 2
  %446 = add nuw nsw i64 %445, 28
  %447 = and i64 %446, 480
  %448 = and i64 %28, -225
  %449 = or i64 %448, %447
  %450 = tail call <2 x i64> @__ockl_hostcall_preview(i32 noundef 2, i64 noundef %449, i64 noundef %88, i64 noundef %148, i64 noundef %208, i64 noundef %268, i64 noundef %328, i64 noundef %388, i64 noundef %444) #13
  %451 = sub i64 %18, %26
  %452 = getelementptr inbounds i8, ptr %19, i64 %26
  %453 = icmp eq i64 %451, 0
  br i1 %453, label %454, label %17

454:                                              ; preds = %443, %9
  %455 = phi <2 x i64> [ %12, %9 ], [ %450, %443 ]
  %456 = extractelement <2 x i64> %455, i64 0
  ret i64 %456
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.umin.i64(i64, i64) #7

; Function Attrs: convergent mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal range(i64 0, 4294967296) i64 @__ockl_get_local_size(i32 noundef %0) #6 {
  switch i32 %0, label %76 [
    i32 0, label %2
    i32 1, label %26
    i32 2, label %51
  ]

2:                                                ; preds = %1
  %3 = load i32, ptr addrspace(4) @__oclc_ABI_version, align 4
  %4 = icmp slt i32 %3, 500
  br i1 %4, label %5, label %17

5:                                                ; preds = %2
  %6 = tail call align 4 dereferenceable(64) ptr addrspace(4) @llvm.amdgcn.dispatch.ptr()
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = getelementptr inbounds i8, ptr addrspace(4) %6, i64 4
  %9 = load i16, ptr addrspace(4) %8, align 4, !range !2197, !invariant.load !2198, !noundef !2198
  %10 = zext nneg i16 %9 to i32
  %11 = getelementptr inbounds i8, ptr addrspace(4) %6, i64 12
  %12 = load i32, ptr addrspace(4) %11, align 4, !tbaa !2199
  %13 = mul i32 %7, %10
  %14 = sub i32 %12, %13
  %15 = tail call i32 @llvm.umin.i32(i32 %14, i32 %10)
  %16 = zext nneg i32 %15 to i64
  br label %76

17:                                               ; preds = %2
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %19 = tail call ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %20 = load i32, ptr addrspace(4) %19, align 4, !tbaa !2176
  %21 = icmp ult i32 %18, %20
  %22 = select i1 %21, i64 12, i64 18
  %23 = getelementptr inbounds i8, ptr addrspace(4) %19, i64 %22
  %24 = load i16, ptr addrspace(4) %23, align 2, !tbaa !2202
  %25 = zext i16 %24 to i64
  br label %76

26:                                               ; preds = %1
  %27 = load i32, ptr addrspace(4) @__oclc_ABI_version, align 4
  %28 = icmp slt i32 %27, 500
  br i1 %28, label %29, label %41

29:                                               ; preds = %26
  %30 = tail call align 4 dereferenceable(64) ptr addrspace(4) @llvm.amdgcn.dispatch.ptr()
  %31 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %32 = getelementptr inbounds i8, ptr addrspace(4) %30, i64 6
  %33 = load i16, ptr addrspace(4) %32, align 2, !range !2197, !invariant.load !2198, !noundef !2198
  %34 = zext nneg i16 %33 to i32
  %35 = getelementptr inbounds i8, ptr addrspace(4) %30, i64 16
  %36 = load i32, ptr addrspace(4) %35, align 8, !tbaa !2203
  %37 = mul i32 %31, %34
  %38 = sub i32 %36, %37
  %39 = tail call i32 @llvm.umin.i32(i32 %38, i32 %34)
  %40 = zext nneg i32 %39 to i64
  br label %76

41:                                               ; preds = %26
  %42 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %43 = tail call ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %44 = getelementptr inbounds i8, ptr addrspace(4) %43, i64 4
  %45 = load i32, ptr addrspace(4) %44, align 4, !tbaa !2176
  %46 = icmp ult i32 %42, %45
  %47 = select i1 %46, i64 14, i64 20
  %48 = getelementptr inbounds i8, ptr addrspace(4) %43, i64 %47
  %49 = load i16, ptr addrspace(4) %48, align 2, !tbaa !2202
  %50 = zext i16 %49 to i64
  br label %76

51:                                               ; preds = %1
  %52 = load i32, ptr addrspace(4) @__oclc_ABI_version, align 4
  %53 = icmp slt i32 %52, 500
  br i1 %53, label %54, label %66

54:                                               ; preds = %51
  %55 = tail call align 4 dereferenceable(64) ptr addrspace(4) @llvm.amdgcn.dispatch.ptr()
  %56 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %57 = getelementptr inbounds i8, ptr addrspace(4) %55, i64 8
  %58 = load i16, ptr addrspace(4) %57, align 4, !range !2197, !invariant.load !2198, !noundef !2198
  %59 = zext nneg i16 %58 to i32
  %60 = getelementptr inbounds i8, ptr addrspace(4) %55, i64 20
  %61 = load i32, ptr addrspace(4) %60, align 4, !tbaa !2204
  %62 = mul i32 %56, %59
  %63 = sub i32 %61, %62
  %64 = tail call i32 @llvm.umin.i32(i32 %63, i32 %59)
  %65 = zext nneg i32 %64 to i64
  br label %76

66:                                               ; preds = %51
  %67 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %68 = tail call ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %69 = getelementptr inbounds i8, ptr addrspace(4) %68, i64 8
  %70 = load i32, ptr addrspace(4) %69, align 4, !tbaa !2176
  %71 = icmp ult i32 %67, %70
  %72 = select i1 %71, i64 16, i64 22
  %73 = getelementptr inbounds i8, ptr addrspace(4) %68, i64 %72
  %74 = load i16, ptr addrspace(4) %73, align 2, !tbaa !2202
  %75 = zext i16 %74 to i64
  br label %76

76:                                               ; preds = %66, %54, %41, %29, %17, %5, %1
  %77 = phi i64 [ 1, %1 ], [ %16, %5 ], [ %25, %17 ], [ %40, %29 ], [ %50, %41 ], [ %65, %54 ], [ %75, %66 ]
  ret i64 %77
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef nonnull align 4 ptr addrspace(4) @llvm.amdgcn.dispatch.ptr() #7

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.amdgcn.workgroup.id.x() #7

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.umin.i32(i32, i32) #7

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.amdgcn.workgroup.id.y() #7

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.amdgcn.workgroup.id.z() #7

; Function Attrs: convergent mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal range(i64 0, 4294967296) i64 @__ockl_get_group_id(i32 noundef %0) #6 {
  switch i32 %0, label %8 [
    i32 0, label %2
    i32 1, label %4
    i32 2, label %6
  ]

2:                                                ; preds = %1
  %3 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  br label %8

4:                                                ; preds = %1
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  br label %8

6:                                                ; preds = %1
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  br label %8

8:                                                ; preds = %6, %4, %2, %1
  %9 = phi i32 [ %7, %6 ], [ %5, %4 ], [ %3, %2 ], [ 0, %1 ]
  %10 = zext i32 %9 to i64
  ret i64 %10
}

attributes #0 = { convergent mustprogress noinline noreturn nounwind optnone "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx90a" "target-features"="+16-bit-insts,+atomic-buffer-global-pk-add-f16-insts,+atomic-fadd-rtn-insts,+ci-insts,+dl-insts,+dot1-insts,+dot10-insts,+dot2-insts,+dot3-insts,+dot4-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+gfx8-insts,+gfx9-insts,+gfx90a-insts,+mai-insts,+s-memrealtime,+s-memtime-inst,+wavefrontsize64" }
attributes #1 = { cold noreturn nounwind memory(inaccessiblemem: write) }
attributes #2 = { convergent mustprogress noinline nounwind optnone "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx90a" "target-features"="+16-bit-insts,+atomic-buffer-global-pk-add-f16-insts,+atomic-fadd-rtn-insts,+ci-insts,+dl-insts,+dot1-insts,+dot10-insts,+dot2-insts,+dot3-insts,+dot4-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+gfx8-insts,+gfx9-insts,+gfx90a-insts,+mai-insts,+s-memrealtime,+s-memtime-inst,+wavefrontsize64" }
attributes #3 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #4 = { convergent mustprogress noinline norecurse nounwind optnone "amdgpu-flat-work-group-size"="1,1024" "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx90a" "target-features"="+16-bit-insts,+atomic-buffer-global-pk-add-f16-insts,+atomic-fadd-rtn-insts,+ci-insts,+dl-insts,+dot1-insts,+dot10-insts,+dot2-insts,+dot3-insts,+dot4-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+gfx8-insts,+gfx9-insts,+gfx90a-insts,+mai-insts,+s-memrealtime,+s-memtime-inst,+wavefrontsize64" "uniform-work-group-size"="true" }
attributes #5 = { convergent nocallback nofree nounwind willreturn }
attributes #6 = { convergent mustprogress nofree norecurse nosync nounwind willreturn memory(none) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx90a" "target-features"="+16-bit-insts,+atomic-buffer-global-pk-add-f16-insts,+atomic-fadd-rtn-insts,+ci-insts,+dl-insts,+dot1-insts,+dot10-insts,+dot2-insts,+dot3-insts,+dot4-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+gfx8-insts,+gfx9-insts,+gfx90a-insts,+gws,+image-insts,+mai-insts,+s-memrealtime,+s-memtime-inst,+wavefrontsize64" }
attributes #7 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #8 = { convergent norecurse nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx90a" "target-features"="+16-bit-insts,+atomic-buffer-global-pk-add-f16-insts,+atomic-fadd-rtn-insts,+ci-insts,+dl-insts,+dot1-insts,+dot10-insts,+dot2-insts,+dot3-insts,+dot4-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+gfx8-insts,+gfx9-insts,+gfx90a-insts,+gws,+image-insts,+mai-insts,+s-memrealtime,+s-memtime-inst,+wavefrontsize64" }
attributes #9 = { convergent nocallback nofree nounwind willreturn memory(none) }
attributes #10 = { nocallback nofree nosync nounwind willreturn }
attributes #11 = { nounwind }
attributes #12 = { nocallback nofree nosync nounwind willreturn memory(none) }
attributes #13 = { convergent nounwind }
attributes #14 = { convergent nounwind willreturn memory(none) }
attributes #15 = { cold convergent nounwind }

!llvm.dbg.cu = !{!34}
!llvm.module.flags = !{!1663, !1664, !1665, !1666, !1667, !1668, !1669}
!llvm.ident = !{!1670, !1670, !1670, !1670, !1670, !1670, !1670, !1670, !1670, !1670, !1670}
!opencl.ocl.version = !{!1671, !1671, !1671, !1671, !1671, !1671, !1671, !1671, !1671, !1671}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression(DIOpArg(0, ptr addrspace(3)), DIOpDeref([250 x i32])))
!1 = distinct !DIGlobalVariable(name: "prev", scope: !2, file: !3, line: 62, type: !56, isLocal: true, isDefinition: true, memorySpace: DW_MSPACE_LLVM_group)
!2 = distinct !DISubprogram(name: "pathfinder", linkageName: "_Z10pathfinderPKiS0_PiS1_P21Trace029RuntimeRecordPjS4_S4_iiiii", scope: !3, file: !3, line: 44, type: !4, scopeLine: 58, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !34, retainedNodes: !1604)
!3 = !DIFile(filename: "/ccs/home/mdunlavy/GPU_FI/HeCBench/src/pathfinder-hip/main.cu", directory: "")
!4 = !DISubroutineType(types: !5)
!5 = !{null, !6, !6, !10, !10, !12, !32, !32, !32, !8, !8, !8, !8, !8}
!6 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !7)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !9)
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !11)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!13 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "Trace029RuntimeRecord", file: !14, line: 43, size: 512, flags: DIFlagTypePassByValue, elements: !15, identifier: "_ZTS21Trace029RuntimeRecord")
!14 = !DIFile(filename: "/ccs/home/mdunlavy/GPU_FI/divergence_cases/runtime_debug/trace029/pathfinder-hip_runtime_debug/main.cu", directory: "", checksumkind: CSK_MD5, checksum: "be308229e0ded0b1f28843980d03ddf7")
!15 = !{!16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31}
!16 = !DIDerivedType(tag: DW_TAG_member, name: "t", scope: !13, file: !14, line: 44, baseType: !9, size: 32)
!17 = !DIDerivedType(tag: DW_TAG_member, name: "iteration", scope: !13, file: !14, line: 45, baseType: !9, size: 32, offset: 32)
!18 = !DIDerivedType(tag: DW_TAG_member, name: "bx", scope: !13, file: !14, line: 46, baseType: !9, size: 32, offset: 64)
!19 = !DIDerivedType(tag: DW_TAG_member, name: "tx", scope: !13, file: !14, line: 47, baseType: !9, size: 32, offset: 96)
!20 = !DIDerivedType(tag: DW_TAG_member, name: "expected_small_block_cols", scope: !13, file: !14, line: 48, baseType: !9, size: 32, offset: 128)
!21 = !DIDerivedType(tag: DW_TAG_member, name: "actual_small_block_cols", scope: !13, file: !14, line: 49, baseType: !9, size: 32, offset: 160)
!22 = !DIDerivedType(tag: DW_TAG_member, name: "blkX", scope: !13, file: !14, line: 50, baseType: !9, size: 32, offset: 192)
!23 = !DIDerivedType(tag: DW_TAG_member, name: "blkXmax", scope: !13, file: !14, line: 51, baseType: !9, size: 32, offset: 224)
!24 = !DIDerivedType(tag: DW_TAG_member, name: "xidx", scope: !13, file: !14, line: 52, baseType: !9, size: 32, offset: 256)
!25 = !DIDerivedType(tag: DW_TAG_member, name: "validXmin", scope: !13, file: !14, line: 53, baseType: !9, size: 32, offset: 288)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "validXmax", scope: !13, file: !14, line: 54, baseType: !9, size: 32, offset: 320)
!27 = !DIDerivedType(tag: DW_TAG_member, name: "isValid", scope: !13, file: !14, line: 55, baseType: !9, size: 32, offset: 352)
!28 = !DIDerivedType(tag: DW_TAG_member, name: "computed", scope: !13, file: !14, line: 56, baseType: !9, size: 32, offset: 384)
!29 = !DIDerivedType(tag: DW_TAG_member, name: "final_write", scope: !13, file: !14, line: 57, baseType: !9, size: 32, offset: 416)
!30 = !DIDerivedType(tag: DW_TAG_member, name: "index", scope: !13, file: !14, line: 58, baseType: !9, size: 32, offset: 448)
!31 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !13, file: !14, line: 59, baseType: !9, size: 32, offset: 480)
!32 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !33, size: 64)
!33 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!34 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !35, producer: "AMD clang version 19.0.0git (https://github.com/RadeonOpenCompute/llvm-project roc-6.4.2 25224 d366fa84f3fdcbd4b10847ebd5db572ae12a34fb)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !36, globals: !53, imports: !61, splitDebugInlining: false, nameTableKind: None)
!35 = !DIFile(filename: "/ccs/home/mdunlavy/GPU_FI/divergence_cases/runtime_debug/trace029/pathfinder-hip_runtime_debug/main.cu", directory: "/autofs/nccs-svm1_home2/mdunlavy/GPU_FI", checksumkind: CSK_MD5, checksum: "be308229e0ded0b1f28843980d03ddf7")
!36 = !{!37, !39}
!37 = !DIDerivedType(tag: DW_TAG_typedef, name: "__cl_mem_fence_flags", file: !38, line: 131, baseType: !33)
!38 = !DIFile(filename: "/opt/rocm-6.4.2/include/hip/amd_detail/device_library_decls.h", directory: "", checksumkind: CSK_MD5, checksum: "61416ae22a8962f94d70fdb29c9fe093")
!39 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dim3", file: !40, line: 1179, size: 96, flags: DIFlagTypePassByValue | DIFlagNonTrivial, elements: !41, identifier: "_ZTS4dim3")
!40 = !DIFile(filename: "/opt/rocm-6.4.2/include/hip/hip_runtime_api.h", directory: "", checksumkind: CSK_MD5, checksum: "2a1ac901d8db5ef891d901275c66dbab")
!41 = !{!42, !47, !48, !49}
!42 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !39, file: !40, line: 1180, baseType: !43, size: 32)
!43 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !44, line: 26, baseType: !45)
!44 = !DIFile(filename: "/usr/include/bits/stdint-uintn.h", directory: "", checksumkind: CSK_MD5, checksum: "4ecee94d7257cd86659727d06a979b60")
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !46, line: 42, baseType: !33)
!46 = !DIFile(filename: "/usr/include/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "4a64d909bcfa62a0a7682c3ac78c6965")
!47 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !39, file: !40, line: 1181, baseType: !43, size: 32, offset: 32)
!48 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !39, file: !40, line: 1182, baseType: !43, size: 32, offset: 64)
!49 = !DISubprogram(name: "dim3", scope: !39, file: !40, line: 1184, type: !50, scopeLine: 1184, flags: DIFlagPrototyped, spFlags: 0)
!50 = !DISubroutineType(types: !51)
!51 = !{null, !52, !43, !43, !43}
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !39, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!53 = !{!0, !54, !59}
!54 = !DIGlobalVariableExpression(var: !55, expr: !DIExpression(DIOpArg(0, ptr addrspace(3)), DIOpDeref([250 x i32])))
!55 = distinct !DIGlobalVariable(name: "result", scope: !2, file: !3, line: 63, type: !56, isLocal: true, isDefinition: true, memorySpace: DW_MSPACE_LLVM_group)
!56 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 8000, elements: !57)
!57 = !{!58}
!58 = !DISubrange(count: 250)
!59 = !DIGlobalVariableExpression(var: !60, expr: !DIExpression(DIOpConstant(i32 2048)))
!60 = distinct !DIGlobalVariable(name: "TRACE029_MAX_RUNTIME_RECORDS", scope: !34, file: !14, line: 62, type: !8, isLocal: true, isDefinition: true, memorySpace: DW_MSPACE_LLVM_constant)
!61 = !{!62, !69, !76, !78, !80, !84, !86, !88, !90, !92, !94, !96, !98, !102, !106, !108, !110, !115, !117, !119, !121, !123, !125, !127, !130, !133, !135, !139, !144, !146, !148, !150, !152, !154, !156, !158, !160, !162, !164, !168, !172, !174, !176, !178, !180, !182, !184, !186, !188, !190, !192, !194, !196, !198, !200, !202, !206, !210, !214, !216, !218, !220, !222, !224, !226, !228, !230, !232, !236, !240, !244, !246, !248, !250, !255, !259, !263, !265, !267, !269, !271, !273, !275, !277, !279, !281, !283, !285, !287, !292, !296, !300, !302, !304, !306, !313, !317, !321, !323, !325, !327, !329, !331, !333, !337, !341, !343, !345, !347, !349, !353, !357, !361, !363, !365, !367, !369, !371, !373, !377, !381, !385, !387, !391, !395, !397, !399, !401, !403, !405, !407, !411, !415, !421, !425, !433, !438, !440, !442, !446, !450, !460, !462, !466, !470, !474, !479, !483, !487, !491, !495, !503, !507, !511, !513, !517, !521, !525, !531, !535, !539, !541, !549, !553, !560, !562, !566, !570, !574, !578, !583, !587, !591, !592, !593, !594, !596, !597, !598, !599, !600, !601, !602, !604, !605, !606, !607, !608, !609, !610, !611, !616, !617, !618, !619, !620, !621, !622, !623, !624, !625, !626, !627, !628, !629, !630, !631, !632, !633, !634, !635, !636, !637, !638, !639, !640, !643, !645, !647, !649, !651, !653, !655, !657, !659, !661, !663, !665, !667, !669, !671, !673, !675, !677, !679, !681, !683, !685, !687, !689, !691, !693, !697, !699, !701, !706, !710, !712, !714, !716, !718, !720, !722, !724, !726, !728, !730, !732, !734, !736, !738, !740, !742, !744, !746, !748, !750, !752, !757, !759, !761, !763, !765, !767, !769, !771, !773, !775, !777, !779, !781, !783, !785, !787, !789, !791, !793, !795, !799, !801, !803, !805, !807, !809, !811, !813, !815, !817, !819, !821, !823, !825, !827, !829, !831, !833, !835, !837, !839, !841, !843, !845, !847, !849, !851, !853, !855, !857, !859, !861, !863, !865, !867, !869, !871, !873, !875, !877, !879, !881, !883, !885, !887, !889, !891, !893, !895, !897, !899, !901, !903, !905, !907, !911, !915, !920, !937, !940, !945, !953, !958, !962, !966, !970, !974, !976, !978, !982, !988, !992, !998, !1004, !1006, !1010, !1014, !1018, !1022, !1029, !1031, !1035, !1039, !1043, !1045, !1049, !1053, !1057, !1059, !1061, !1065, !1073, !1077, !1081, !1085, !1087, !1093, !1095, !1101, !1105, !1109, !1113, !1117, !1121, !1125, !1127, !1129, !1133, !1137, !1141, !1143, !1147, !1151, !1153, !1155, !1159, !1163, !1167, !1171, !1172, !1173, !1174, !1175, !1176, !1177, !1178, !1179, !1180, !1181, !1185, !1189, !1194, !1198, !1200, !1202, !1204, !1206, !1208, !1210, !1212, !1214, !1216, !1218, !1220, !1222, !1224, !1228, !1234, !1239, !1243, !1245, !1247, !1249, !1251, !1258, !1262, !1266, !1270, !1274, !1278, !1283, !1287, !1289, !1293, !1299, !1303, !1308, !1310, !1312, !1316, !1320, !1322, !1324, !1326, !1328, !1332, !1334, !1336, !1340, !1344, !1348, !1352, !1356, !1360, !1362, !1366, !1370, !1374, !1378, !1380, !1382, !1386, !1390, !1391, !1392, !1393, !1394, !1395, !1403, !1410, !1413, !1414, !1416, !1418, !1420, !1422, !1426, !1428, !1430, !1432, !1434, !1436, !1438, !1440, !1442, !1446, !1450, !1452, !1456, !1460, !1466, !1470, !1472, !1475, !1478, !1480, !1482, !1484, !1487, !1490, !1493, !1496, !1499, !1501, !1505, !1509, !1510, !1513, !1515, !1517, !1519, !1521, !1524, !1527, !1530, !1533, !1536, !1538, !1543, !1547, !1548, !1553, !1557, !1562, !1567, !1571, !1577, !1581, !1583, !1587, !1594, !1599}
!62 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !64, file: !68, line: 52)
!63 = !DINamespace(name: "std", scope: null)
!64 = !DISubprogram(name: "abs", scope: !65, file: !65, line: 980, type: !66, flags: DIFlagPrototyped, spFlags: 0)
!65 = !DIFile(filename: "/usr/include/stdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "761a239547e58b18c7327eb395f5cc1f")
!66 = !DISubroutineType(types: !67)
!67 = !{!9, !9}
!68 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/bits/std_abs.h", directory: "")
!69 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !70, file: !75, line: 85)
!70 = !DISubprogram(name: "acos", scope: !71, file: !71, line: 53, type: !72, flags: DIFlagPrototyped, spFlags: 0)
!71 = !DIFile(filename: "/usr/include/bits/mathcalls.h", directory: "", checksumkind: CSK_MD5, checksum: "a03d6e5877646e3ad0a8a5735f9e6f62")
!72 = !DISubroutineType(types: !73)
!73 = !{!74, !74}
!74 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!75 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/cmath", directory: "")
!76 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !77, file: !75, line: 104)
!77 = !DISubprogram(name: "asin", scope: !71, file: !71, line: 55, type: !72, flags: DIFlagPrototyped, spFlags: 0)
!78 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !79, file: !75, line: 123)
!79 = !DISubprogram(name: "atan", scope: !71, file: !71, line: 57, type: !72, flags: DIFlagPrototyped, spFlags: 0)
!80 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !81, file: !75, line: 142)
!81 = !DISubprogram(name: "atan2", scope: !71, file: !71, line: 59, type: !82, flags: DIFlagPrototyped, spFlags: 0)
!82 = !DISubroutineType(types: !83)
!83 = !{!74, !74, !74}
!84 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !85, file: !75, line: 154)
!85 = !DISubprogram(name: "ceil", scope: !71, file: !71, line: 159, type: !72, flags: DIFlagPrototyped, spFlags: 0)
!86 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !87, file: !75, line: 173)
!87 = !DISubprogram(name: "cos", scope: !71, file: !71, line: 62, type: !72, flags: DIFlagPrototyped, spFlags: 0)
!88 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !89, file: !75, line: 192)
!89 = !DISubprogram(name: "cosh", scope: !71, file: !71, line: 71, type: !72, flags: DIFlagPrototyped, spFlags: 0)
!90 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !91, file: !75, line: 211)
!91 = !DISubprogram(name: "exp", scope: !71, file: !71, line: 95, type: !72, flags: DIFlagPrototyped, spFlags: 0)
!92 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !93, file: !75, line: 230)
!93 = !DISubprogram(name: "fabs", scope: !71, file: !71, line: 162, type: !72, flags: DIFlagPrototyped, spFlags: 0)
!94 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !95, file: !75, line: 249)
!95 = !DISubprogram(name: "floor", scope: !71, file: !71, line: 165, type: !72, flags: DIFlagPrototyped, spFlags: 0)
!96 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !97, file: !75, line: 268)
!97 = !DISubprogram(name: "fmod", scope: !71, file: !71, line: 168, type: !82, flags: DIFlagPrototyped, spFlags: 0)
!98 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !99, file: !75, line: 280)
!99 = !DISubprogram(name: "frexp", scope: !71, file: !71, line: 98, type: !100, flags: DIFlagPrototyped, spFlags: 0)
!100 = !DISubroutineType(types: !101)
!101 = !{!74, !74, !11}
!102 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !103, file: !75, line: 299)
!103 = !DISubprogram(name: "ldexp", scope: !71, file: !71, line: 101, type: !104, flags: DIFlagPrototyped, spFlags: 0)
!104 = !DISubroutineType(types: !105)
!105 = !{!74, !74, !9}
!106 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !107, file: !75, line: 318)
!107 = !DISubprogram(name: "log", scope: !71, file: !71, line: 104, type: !72, flags: DIFlagPrototyped, spFlags: 0)
!108 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !109, file: !75, line: 337)
!109 = !DISubprogram(name: "log10", scope: !71, file: !71, line: 107, type: !72, flags: DIFlagPrototyped, spFlags: 0)
!110 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !111, file: !75, line: 356)
!111 = !DISubprogram(name: "modf", scope: !71, file: !71, line: 110, type: !112, flags: DIFlagPrototyped, spFlags: 0)
!112 = !DISubroutineType(types: !113)
!113 = !{!74, !74, !114}
!114 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !74, size: 64)
!115 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !116, file: !75, line: 368)
!116 = !DISubprogram(name: "pow", scope: !71, file: !71, line: 140, type: !82, flags: DIFlagPrototyped, spFlags: 0)
!117 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !118, file: !75, line: 396)
!118 = !DISubprogram(name: "sin", scope: !71, file: !71, line: 64, type: !72, flags: DIFlagPrototyped, spFlags: 0)
!119 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !120, file: !75, line: 415)
!120 = !DISubprogram(name: "sinh", scope: !71, file: !71, line: 73, type: !72, flags: DIFlagPrototyped, spFlags: 0)
!121 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !122, file: !75, line: 434)
!122 = !DISubprogram(name: "sqrt", scope: !71, file: !71, line: 143, type: !72, flags: DIFlagPrototyped, spFlags: 0)
!123 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !124, file: !75, line: 453)
!124 = !DISubprogram(name: "tan", scope: !71, file: !71, line: 66, type: !72, flags: DIFlagPrototyped, spFlags: 0)
!125 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !126, file: !75, line: 472)
!126 = !DISubprogram(name: "tanh", scope: !71, file: !71, line: 75, type: !72, flags: DIFlagPrototyped, spFlags: 0)
!127 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !128, file: !75, line: 1881)
!128 = !DIDerivedType(tag: DW_TAG_typedef, name: "double_t", file: !129, line: 164, baseType: !74)
!129 = !DIFile(filename: "/usr/include/math.h", directory: "", checksumkind: CSK_MD5, checksum: "555a51fc91303a79e6e6a7bf2a303f79")
!130 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !131, file: !75, line: 1882)
!131 = !DIDerivedType(tag: DW_TAG_typedef, name: "float_t", file: !129, line: 163, baseType: !132)
!132 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!133 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !134, file: !75, line: 1885)
!134 = !DISubprogram(name: "acosh", scope: !71, file: !71, line: 85, type: !72, flags: DIFlagPrototyped, spFlags: 0)
!135 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !136, file: !75, line: 1886)
!136 = !DISubprogram(name: "acoshf", scope: !71, file: !71, line: 85, type: !137, flags: DIFlagPrototyped, spFlags: 0)
!137 = !DISubroutineType(types: !138)
!138 = !{!132, !132}
!139 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !140, file: !75, line: 1887)
!140 = !DISubprogram(name: "acoshl", scope: !71, file: !71, line: 85, type: !141, flags: DIFlagPrototyped, spFlags: 0)
!141 = !DISubroutineType(types: !142)
!142 = !{!143, !143}
!143 = !DIBasicType(name: "long double", size: 64, encoding: DW_ATE_float)
!144 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !145, file: !75, line: 1889)
!145 = !DISubprogram(name: "asinh", scope: !71, file: !71, line: 87, type: !72, flags: DIFlagPrototyped, spFlags: 0)
!146 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !147, file: !75, line: 1890)
!147 = !DISubprogram(name: "asinhf", scope: !71, file: !71, line: 87, type: !137, flags: DIFlagPrototyped, spFlags: 0)
!148 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !149, file: !75, line: 1891)
!149 = !DISubprogram(name: "asinhl", scope: !71, file: !71, line: 87, type: !141, flags: DIFlagPrototyped, spFlags: 0)
!150 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !151, file: !75, line: 1893)
!151 = !DISubprogram(name: "atanh", scope: !71, file: !71, line: 89, type: !72, flags: DIFlagPrototyped, spFlags: 0)
!152 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !153, file: !75, line: 1894)
!153 = !DISubprogram(name: "atanhf", scope: !71, file: !71, line: 89, type: !137, flags: DIFlagPrototyped, spFlags: 0)
!154 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !155, file: !75, line: 1895)
!155 = !DISubprogram(name: "atanhl", scope: !71, file: !71, line: 89, type: !141, flags: DIFlagPrototyped, spFlags: 0)
!156 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !157, file: !75, line: 1897)
!157 = !DISubprogram(name: "cbrt", scope: !71, file: !71, line: 152, type: !72, flags: DIFlagPrototyped, spFlags: 0)
!158 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !159, file: !75, line: 1898)
!159 = !DISubprogram(name: "cbrtf", scope: !71, file: !71, line: 152, type: !137, flags: DIFlagPrototyped, spFlags: 0)
!160 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !161, file: !75, line: 1899)
!161 = !DISubprogram(name: "cbrtl", scope: !71, file: !71, line: 152, type: !141, flags: DIFlagPrototyped, spFlags: 0)
!162 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !163, file: !75, line: 1901)
!163 = !DISubprogram(name: "copysign", scope: !71, file: !71, line: 198, type: !82, flags: DIFlagPrototyped, spFlags: 0)
!164 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !165, file: !75, line: 1902)
!165 = !DISubprogram(name: "copysignf", scope: !71, file: !71, line: 198, type: !166, flags: DIFlagPrototyped, spFlags: 0)
!166 = !DISubroutineType(types: !167)
!167 = !{!132, !132, !132}
!168 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !169, file: !75, line: 1903)
!169 = !DISubprogram(name: "copysignl", scope: !71, file: !71, line: 198, type: !170, flags: DIFlagPrototyped, spFlags: 0)
!170 = !DISubroutineType(types: !171)
!171 = !{!143, !143, !143}
!172 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !173, file: !75, line: 1905)
!173 = !DISubprogram(name: "erf", scope: !71, file: !71, line: 231, type: !72, flags: DIFlagPrototyped, spFlags: 0)
!174 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !175, file: !75, line: 1906)
!175 = !DISubprogram(name: "erff", scope: !71, file: !71, line: 231, type: !137, flags: DIFlagPrototyped, spFlags: 0)
!176 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !177, file: !75, line: 1907)
!177 = !DISubprogram(name: "erfl", scope: !71, file: !71, line: 231, type: !141, flags: DIFlagPrototyped, spFlags: 0)
!178 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !179, file: !75, line: 1909)
!179 = !DISubprogram(name: "erfc", scope: !71, file: !71, line: 232, type: !72, flags: DIFlagPrototyped, spFlags: 0)
!180 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !181, file: !75, line: 1910)
!181 = !DISubprogram(name: "erfcf", scope: !71, file: !71, line: 232, type: !137, flags: DIFlagPrototyped, spFlags: 0)
!182 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !183, file: !75, line: 1911)
!183 = !DISubprogram(name: "erfcl", scope: !71, file: !71, line: 232, type: !141, flags: DIFlagPrototyped, spFlags: 0)
!184 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !185, file: !75, line: 1913)
!185 = !DISubprogram(name: "exp2", scope: !71, file: !71, line: 130, type: !72, flags: DIFlagPrototyped, spFlags: 0)
!186 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !187, file: !75, line: 1914)
!187 = !DISubprogram(name: "exp2f", scope: !71, file: !71, line: 130, type: !137, flags: DIFlagPrototyped, spFlags: 0)
!188 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !189, file: !75, line: 1915)
!189 = !DISubprogram(name: "exp2l", scope: !71, file: !71, line: 130, type: !141, flags: DIFlagPrototyped, spFlags: 0)
!190 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !191, file: !75, line: 1917)
!191 = !DISubprogram(name: "expm1", scope: !71, file: !71, line: 119, type: !72, flags: DIFlagPrototyped, spFlags: 0)
!192 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !193, file: !75, line: 1918)
!193 = !DISubprogram(name: "expm1f", scope: !71, file: !71, line: 119, type: !137, flags: DIFlagPrototyped, spFlags: 0)
!194 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !195, file: !75, line: 1919)
!195 = !DISubprogram(name: "expm1l", scope: !71, file: !71, line: 119, type: !141, flags: DIFlagPrototyped, spFlags: 0)
!196 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !197, file: !75, line: 1921)
!197 = !DISubprogram(name: "fdim", scope: !71, file: !71, line: 329, type: !82, flags: DIFlagPrototyped, spFlags: 0)
!198 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !199, file: !75, line: 1922)
!199 = !DISubprogram(name: "fdimf", scope: !71, file: !71, line: 329, type: !166, flags: DIFlagPrototyped, spFlags: 0)
!200 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !201, file: !75, line: 1923)
!201 = !DISubprogram(name: "fdiml", scope: !71, file: !71, line: 329, type: !170, flags: DIFlagPrototyped, spFlags: 0)
!202 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !203, file: !75, line: 1925)
!203 = !DISubprogram(name: "fma", scope: !71, file: !71, line: 340, type: !204, flags: DIFlagPrototyped, spFlags: 0)
!204 = !DISubroutineType(types: !205)
!205 = !{!74, !74, !74, !74}
!206 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !207, file: !75, line: 1926)
!207 = !DISubprogram(name: "fmaf", scope: !71, file: !71, line: 340, type: !208, flags: DIFlagPrototyped, spFlags: 0)
!208 = !DISubroutineType(types: !209)
!209 = !{!132, !132, !132, !132}
!210 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !211, file: !75, line: 1927)
!211 = !DISubprogram(name: "fmal", scope: !71, file: !71, line: 340, type: !212, flags: DIFlagPrototyped, spFlags: 0)
!212 = !DISubroutineType(types: !213)
!213 = !{!143, !143, !143, !143}
!214 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !215, file: !75, line: 1929)
!215 = !DISubprogram(name: "fmax", scope: !71, file: !71, line: 333, type: !82, flags: DIFlagPrototyped, spFlags: 0)
!216 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !217, file: !75, line: 1930)
!217 = !DISubprogram(name: "fmaxf", scope: !71, file: !71, line: 333, type: !166, flags: DIFlagPrototyped, spFlags: 0)
!218 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !219, file: !75, line: 1931)
!219 = !DISubprogram(name: "fmaxl", scope: !71, file: !71, line: 333, type: !170, flags: DIFlagPrototyped, spFlags: 0)
!220 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !221, file: !75, line: 1933)
!221 = !DISubprogram(name: "fmin", scope: !71, file: !71, line: 336, type: !82, flags: DIFlagPrototyped, spFlags: 0)
!222 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !223, file: !75, line: 1934)
!223 = !DISubprogram(name: "fminf", scope: !71, file: !71, line: 336, type: !166, flags: DIFlagPrototyped, spFlags: 0)
!224 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !225, file: !75, line: 1935)
!225 = !DISubprogram(name: "fminl", scope: !71, file: !71, line: 336, type: !170, flags: DIFlagPrototyped, spFlags: 0)
!226 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !227, file: !75, line: 1937)
!227 = !DISubprogram(name: "hypot", scope: !71, file: !71, line: 147, type: !82, flags: DIFlagPrototyped, spFlags: 0)
!228 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !229, file: !75, line: 1938)
!229 = !DISubprogram(name: "hypotf", scope: !71, file: !71, line: 147, type: !166, flags: DIFlagPrototyped, spFlags: 0)
!230 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !231, file: !75, line: 1939)
!231 = !DISubprogram(name: "hypotl", scope: !71, file: !71, line: 147, type: !170, flags: DIFlagPrototyped, spFlags: 0)
!232 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !233, file: !75, line: 1941)
!233 = !DISubprogram(name: "ilogb", scope: !71, file: !71, line: 283, type: !234, flags: DIFlagPrototyped, spFlags: 0)
!234 = !DISubroutineType(types: !235)
!235 = !{!9, !74}
!236 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !237, file: !75, line: 1942)
!237 = !DISubprogram(name: "ilogbf", scope: !71, file: !71, line: 283, type: !238, flags: DIFlagPrototyped, spFlags: 0)
!238 = !DISubroutineType(types: !239)
!239 = !{!9, !132}
!240 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !241, file: !75, line: 1943)
!241 = !DISubprogram(name: "ilogbl", scope: !71, file: !71, line: 283, type: !242, flags: DIFlagPrototyped, spFlags: 0)
!242 = !DISubroutineType(types: !243)
!243 = !{!9, !143}
!244 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !245, file: !75, line: 1945)
!245 = !DISubprogram(name: "lgamma", scope: !71, file: !71, line: 233, type: !72, flags: DIFlagPrototyped, spFlags: 0)
!246 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !247, file: !75, line: 1946)
!247 = !DISubprogram(name: "lgammaf", scope: !71, file: !71, line: 233, type: !137, flags: DIFlagPrototyped, spFlags: 0)
!248 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !249, file: !75, line: 1947)
!249 = !DISubprogram(name: "lgammal", scope: !71, file: !71, line: 233, type: !141, flags: DIFlagPrototyped, spFlags: 0)
!250 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !251, file: !75, line: 1950)
!251 = !DISubprogram(name: "llrint", scope: !71, file: !71, line: 319, type: !252, flags: DIFlagPrototyped, spFlags: 0)
!252 = !DISubroutineType(types: !253)
!253 = !{!254, !74}
!254 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!255 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !256, file: !75, line: 1951)
!256 = !DISubprogram(name: "llrintf", scope: !71, file: !71, line: 319, type: !257, flags: DIFlagPrototyped, spFlags: 0)
!257 = !DISubroutineType(types: !258)
!258 = !{!254, !132}
!259 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !260, file: !75, line: 1952)
!260 = !DISubprogram(name: "llrintl", scope: !71, file: !71, line: 319, type: !261, flags: DIFlagPrototyped, spFlags: 0)
!261 = !DISubroutineType(types: !262)
!262 = !{!254, !143}
!263 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !264, file: !75, line: 1954)
!264 = !DISubprogram(name: "llround", scope: !71, file: !71, line: 325, type: !252, flags: DIFlagPrototyped, spFlags: 0)
!265 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !266, file: !75, line: 1955)
!266 = !DISubprogram(name: "llroundf", scope: !71, file: !71, line: 325, type: !257, flags: DIFlagPrototyped, spFlags: 0)
!267 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !268, file: !75, line: 1956)
!268 = !DISubprogram(name: "llroundl", scope: !71, file: !71, line: 325, type: !261, flags: DIFlagPrototyped, spFlags: 0)
!269 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !270, file: !75, line: 1959)
!270 = !DISubprogram(name: "log1p", scope: !71, file: !71, line: 122, type: !72, flags: DIFlagPrototyped, spFlags: 0)
!271 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !272, file: !75, line: 1960)
!272 = !DISubprogram(name: "log1pf", scope: !71, file: !71, line: 122, type: !137, flags: DIFlagPrototyped, spFlags: 0)
!273 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !274, file: !75, line: 1961)
!274 = !DISubprogram(name: "log1pl", scope: !71, file: !71, line: 122, type: !141, flags: DIFlagPrototyped, spFlags: 0)
!275 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !276, file: !75, line: 1963)
!276 = !DISubprogram(name: "log2", scope: !71, file: !71, line: 133, type: !72, flags: DIFlagPrototyped, spFlags: 0)
!277 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !278, file: !75, line: 1964)
!278 = !DISubprogram(name: "log2f", scope: !71, file: !71, line: 133, type: !137, flags: DIFlagPrototyped, spFlags: 0)
!279 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !280, file: !75, line: 1965)
!280 = !DISubprogram(name: "log2l", scope: !71, file: !71, line: 133, type: !141, flags: DIFlagPrototyped, spFlags: 0)
!281 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !282, file: !75, line: 1967)
!282 = !DISubprogram(name: "logb", scope: !71, file: !71, line: 125, type: !72, flags: DIFlagPrototyped, spFlags: 0)
!283 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !284, file: !75, line: 1968)
!284 = !DISubprogram(name: "logbf", scope: !71, file: !71, line: 125, type: !137, flags: DIFlagPrototyped, spFlags: 0)
!285 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !286, file: !75, line: 1969)
!286 = !DISubprogram(name: "logbl", scope: !71, file: !71, line: 125, type: !141, flags: DIFlagPrototyped, spFlags: 0)
!287 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !288, file: !75, line: 1971)
!288 = !DISubprogram(name: "lrint", scope: !71, file: !71, line: 317, type: !289, flags: DIFlagPrototyped, spFlags: 0)
!289 = !DISubroutineType(types: !290)
!290 = !{!291, !74}
!291 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!292 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !293, file: !75, line: 1972)
!293 = !DISubprogram(name: "lrintf", scope: !71, file: !71, line: 317, type: !294, flags: DIFlagPrototyped, spFlags: 0)
!294 = !DISubroutineType(types: !295)
!295 = !{!291, !132}
!296 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !297, file: !75, line: 1973)
!297 = !DISubprogram(name: "lrintl", scope: !71, file: !71, line: 317, type: !298, flags: DIFlagPrototyped, spFlags: 0)
!298 = !DISubroutineType(types: !299)
!299 = !{!291, !143}
!300 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !301, file: !75, line: 1975)
!301 = !DISubprogram(name: "lround", scope: !71, file: !71, line: 323, type: !289, flags: DIFlagPrototyped, spFlags: 0)
!302 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !303, file: !75, line: 1976)
!303 = !DISubprogram(name: "lroundf", scope: !71, file: !71, line: 323, type: !294, flags: DIFlagPrototyped, spFlags: 0)
!304 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !305, file: !75, line: 1977)
!305 = !DISubprogram(name: "lroundl", scope: !71, file: !71, line: 323, type: !298, flags: DIFlagPrototyped, spFlags: 0)
!306 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !307, file: !75, line: 1979)
!307 = !DISubprogram(name: "nan", scope: !71, file: !71, line: 203, type: !308, flags: DIFlagPrototyped, spFlags: 0)
!308 = !DISubroutineType(types: !309)
!309 = !{!74, !310}
!310 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !311, size: 64)
!311 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !312)
!312 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!313 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !314, file: !75, line: 1980)
!314 = !DISubprogram(name: "nanf", scope: !71, file: !71, line: 203, type: !315, flags: DIFlagPrototyped, spFlags: 0)
!315 = !DISubroutineType(types: !316)
!316 = !{!132, !310}
!317 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !318, file: !75, line: 1981)
!318 = !DISubprogram(name: "nanl", scope: !71, file: !71, line: 203, type: !319, flags: DIFlagPrototyped, spFlags: 0)
!319 = !DISubroutineType(types: !320)
!320 = !{!143, !310}
!321 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !322, file: !75, line: 1983)
!322 = !DISubprogram(name: "nearbyint", scope: !71, file: !71, line: 297, type: !72, flags: DIFlagPrototyped, spFlags: 0)
!323 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !324, file: !75, line: 1984)
!324 = !DISubprogram(name: "nearbyintf", scope: !71, file: !71, line: 297, type: !137, flags: DIFlagPrototyped, spFlags: 0)
!325 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !326, file: !75, line: 1985)
!326 = !DISubprogram(name: "nearbyintl", scope: !71, file: !71, line: 297, type: !141, flags: DIFlagPrototyped, spFlags: 0)
!327 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !328, file: !75, line: 1987)
!328 = !DISubprogram(name: "nextafter", scope: !71, file: !71, line: 262, type: !82, flags: DIFlagPrototyped, spFlags: 0)
!329 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !330, file: !75, line: 1988)
!330 = !DISubprogram(name: "nextafterf", scope: !71, file: !71, line: 262, type: !166, flags: DIFlagPrototyped, spFlags: 0)
!331 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !332, file: !75, line: 1989)
!332 = !DISubprogram(name: "nextafterl", scope: !71, file: !71, line: 262, type: !170, flags: DIFlagPrototyped, spFlags: 0)
!333 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !334, file: !75, line: 1991)
!334 = !DISubprogram(name: "nexttoward", scope: !71, file: !71, line: 264, type: !335, flags: DIFlagPrototyped, spFlags: 0)
!335 = !DISubroutineType(types: !336)
!336 = !{!74, !74, !143}
!337 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !338, file: !75, line: 1992)
!338 = !DISubprogram(name: "nexttowardf", scope: !71, file: !71, line: 264, type: !339, flags: DIFlagPrototyped, spFlags: 0)
!339 = !DISubroutineType(types: !340)
!340 = !{!132, !132, !143}
!341 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !342, file: !75, line: 1993)
!342 = !DISubprogram(name: "nexttowardl", scope: !71, file: !71, line: 264, type: !170, flags: DIFlagPrototyped, spFlags: 0)
!343 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !344, file: !75, line: 1995)
!344 = !DISubprogram(name: "remainder", scope: !71, file: !71, line: 275, type: !82, flags: DIFlagPrototyped, spFlags: 0)
!345 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !346, file: !75, line: 1996)
!346 = !DISubprogram(name: "remainderf", scope: !71, file: !71, line: 275, type: !166, flags: DIFlagPrototyped, spFlags: 0)
!347 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !348, file: !75, line: 1997)
!348 = !DISubprogram(name: "remainderl", scope: !71, file: !71, line: 275, type: !170, flags: DIFlagPrototyped, spFlags: 0)
!349 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !350, file: !75, line: 1999)
!350 = !DISubprogram(name: "remquo", scope: !71, file: !71, line: 310, type: !351, flags: DIFlagPrototyped, spFlags: 0)
!351 = !DISubroutineType(types: !352)
!352 = !{!74, !74, !74, !11}
!353 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !354, file: !75, line: 2000)
!354 = !DISubprogram(name: "remquof", scope: !71, file: !71, line: 310, type: !355, flags: DIFlagPrototyped, spFlags: 0)
!355 = !DISubroutineType(types: !356)
!356 = !{!132, !132, !132, !11}
!357 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !358, file: !75, line: 2001)
!358 = !DISubprogram(name: "remquol", scope: !71, file: !71, line: 310, type: !359, flags: DIFlagPrototyped, spFlags: 0)
!359 = !DISubroutineType(types: !360)
!360 = !{!143, !143, !143, !11}
!361 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !362, file: !75, line: 2003)
!362 = !DISubprogram(name: "rint", scope: !71, file: !71, line: 259, type: !72, flags: DIFlagPrototyped, spFlags: 0)
!363 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !364, file: !75, line: 2004)
!364 = !DISubprogram(name: "rintf", scope: !71, file: !71, line: 259, type: !137, flags: DIFlagPrototyped, spFlags: 0)
!365 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !366, file: !75, line: 2005)
!366 = !DISubprogram(name: "rintl", scope: !71, file: !71, line: 259, type: !141, flags: DIFlagPrototyped, spFlags: 0)
!367 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !368, file: !75, line: 2007)
!368 = !DISubprogram(name: "round", scope: !71, file: !71, line: 301, type: !72, flags: DIFlagPrototyped, spFlags: 0)
!369 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !370, file: !75, line: 2008)
!370 = !DISubprogram(name: "roundf", scope: !71, file: !71, line: 301, type: !137, flags: DIFlagPrototyped, spFlags: 0)
!371 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !372, file: !75, line: 2009)
!372 = !DISubprogram(name: "roundl", scope: !71, file: !71, line: 301, type: !141, flags: DIFlagPrototyped, spFlags: 0)
!373 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !374, file: !75, line: 2011)
!374 = !DISubprogram(name: "scalbln", scope: !71, file: !71, line: 293, type: !375, flags: DIFlagPrototyped, spFlags: 0)
!375 = !DISubroutineType(types: !376)
!376 = !{!74, !74, !291}
!377 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !378, file: !75, line: 2012)
!378 = !DISubprogram(name: "scalblnf", scope: !71, file: !71, line: 293, type: !379, flags: DIFlagPrototyped, spFlags: 0)
!379 = !DISubroutineType(types: !380)
!380 = !{!132, !132, !291}
!381 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !382, file: !75, line: 2013)
!382 = !DISubprogram(name: "scalblnl", scope: !71, file: !71, line: 293, type: !383, flags: DIFlagPrototyped, spFlags: 0)
!383 = !DISubroutineType(types: !384)
!384 = !{!143, !143, !291}
!385 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !386, file: !75, line: 2015)
!386 = !DISubprogram(name: "scalbn", scope: !71, file: !71, line: 279, type: !104, flags: DIFlagPrototyped, spFlags: 0)
!387 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !388, file: !75, line: 2016)
!388 = !DISubprogram(name: "scalbnf", scope: !71, file: !71, line: 279, type: !389, flags: DIFlagPrototyped, spFlags: 0)
!389 = !DISubroutineType(types: !390)
!390 = !{!132, !132, !9}
!391 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !392, file: !75, line: 2017)
!392 = !DISubprogram(name: "scalbnl", scope: !71, file: !71, line: 279, type: !393, flags: DIFlagPrototyped, spFlags: 0)
!393 = !DISubroutineType(types: !394)
!394 = !{!143, !143, !9}
!395 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !396, file: !75, line: 2019)
!396 = !DISubprogram(name: "tgamma", scope: !71, file: !71, line: 238, type: !72, flags: DIFlagPrototyped, spFlags: 0)
!397 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !398, file: !75, line: 2020)
!398 = !DISubprogram(name: "tgammaf", scope: !71, file: !71, line: 238, type: !137, flags: DIFlagPrototyped, spFlags: 0)
!399 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !400, file: !75, line: 2021)
!400 = !DISubprogram(name: "tgammal", scope: !71, file: !71, line: 238, type: !141, flags: DIFlagPrototyped, spFlags: 0)
!401 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !402, file: !75, line: 2023)
!402 = !DISubprogram(name: "trunc", scope: !71, file: !71, line: 305, type: !72, flags: DIFlagPrototyped, spFlags: 0)
!403 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !404, file: !75, line: 2024)
!404 = !DISubprogram(name: "truncf", scope: !71, file: !71, line: 305, type: !137, flags: DIFlagPrototyped, spFlags: 0)
!405 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !406, file: !75, line: 2025)
!406 = !DISubprogram(name: "truncl", scope: !71, file: !71, line: 305, type: !141, flags: DIFlagPrototyped, spFlags: 0)
!407 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !408, entity: !409, file: !410, line: 58)
!408 = !DINamespace(name: "__gnu_debug", scope: null)
!409 = !DINamespace(name: "__debug", scope: !63)
!410 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/debug/debug.h", directory: "", checksumkind: CSK_MD5, checksum: "752210a319f5f5d356cc29cd1ce3cdc7")
!411 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !412, file: !414, line: 131)
!412 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !65, line: 63, baseType: !413)
!413 = !DICompositeType(tag: DW_TAG_structure_type, file: !65, line: 59, size: 64, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!414 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/cstdlib", directory: "")
!415 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !416, file: !414, line: 132)
!416 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !65, line: 71, baseType: !417)
!417 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !65, line: 67, size: 128, flags: DIFlagTypePassByValue, elements: !418, identifier: "_ZTS6ldiv_t")
!418 = !{!419, !420}
!419 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !417, file: !65, line: 69, baseType: !291, size: 64)
!420 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !417, file: !65, line: 70, baseType: !291, size: 64, offset: 64)
!421 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !422, file: !414, line: 134)
!422 = !DISubprogram(name: "abort", scope: !65, file: !65, line: 730, type: !423, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!423 = !DISubroutineType(types: !424)
!424 = !{null}
!425 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !426, file: !414, line: 136)
!426 = !DISubprogram(name: "aligned_alloc", scope: !65, file: !65, line: 724, type: !427, flags: DIFlagPrototyped, spFlags: 0)
!427 = !DISubroutineType(types: !428)
!428 = !{!429, !430, !430}
!429 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!430 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !431, line: 18, baseType: !432)
!431 = !DIFile(filename: "/opt/rocm-6.4.2/lib/llvm/lib/clang/19/include/__stddef_size_t.h", directory: "", checksumkind: CSK_MD5, checksum: "2c44e821a2b1951cde2eb0fb2e656867")
!432 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!433 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !434, file: !414, line: 138)
!434 = !DISubprogram(name: "atexit", scope: !65, file: !65, line: 734, type: !435, flags: DIFlagPrototyped, spFlags: 0)
!435 = !DISubroutineType(types: !436)
!436 = !{!9, !437}
!437 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !423, size: 64)
!438 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !439, file: !414, line: 141)
!439 = !DISubprogram(name: "at_quick_exit", scope: !65, file: !65, line: 739, type: !435, flags: DIFlagPrototyped, spFlags: 0)
!440 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !441, file: !414, line: 144)
!441 = !DISubprogram(name: "atof", scope: !65, file: !65, line: 102, type: !308, flags: DIFlagPrototyped, spFlags: 0)
!442 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !443, file: !414, line: 145)
!443 = !DISubprogram(name: "atoi", scope: !65, file: !65, line: 105, type: !444, flags: DIFlagPrototyped, spFlags: 0)
!444 = !DISubroutineType(types: !445)
!445 = !{!9, !310}
!446 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !447, file: !414, line: 146)
!447 = !DISubprogram(name: "atol", scope: !65, file: !65, line: 108, type: !448, flags: DIFlagPrototyped, spFlags: 0)
!448 = !DISubroutineType(types: !449)
!449 = !{!291, !310}
!450 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !451, file: !414, line: 147)
!451 = !DISubprogram(name: "bsearch", scope: !65, file: !65, line: 960, type: !452, flags: DIFlagPrototyped, spFlags: 0)
!452 = !DISubroutineType(types: !453)
!453 = !{!429, !454, !454, !430, !430, !456}
!454 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !455, size: 64)
!455 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!456 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !65, line: 948, baseType: !457)
!457 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !458, size: 64)
!458 = !DISubroutineType(types: !459)
!459 = !{!9, !454, !454}
!460 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !461, file: !414, line: 148)
!461 = !DISubprogram(name: "calloc", scope: !65, file: !65, line: 675, type: !427, flags: DIFlagPrototyped, spFlags: 0)
!462 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !463, file: !414, line: 149)
!463 = !DISubprogram(name: "div", scope: !65, file: !65, line: 992, type: !464, flags: DIFlagPrototyped, spFlags: 0)
!464 = !DISubroutineType(types: !465)
!465 = !{!412, !9, !9}
!466 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !467, file: !414, line: 150)
!467 = !DISubprogram(name: "exit", scope: !65, file: !65, line: 756, type: !468, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!468 = !DISubroutineType(types: !469)
!469 = !{null, !9}
!470 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !471, file: !414, line: 151)
!471 = !DISubprogram(name: "free", scope: !65, file: !65, line: 687, type: !472, flags: DIFlagPrototyped, spFlags: 0)
!472 = !DISubroutineType(types: !473)
!473 = !{null, !429}
!474 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !475, file: !414, line: 152)
!475 = !DISubprogram(name: "getenv", scope: !65, file: !65, line: 773, type: !476, flags: DIFlagPrototyped, spFlags: 0)
!476 = !DISubroutineType(types: !477)
!477 = !{!478, !310}
!478 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !312, size: 64)
!479 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !480, file: !414, line: 153)
!480 = !DISubprogram(name: "labs", scope: !65, file: !65, line: 981, type: !481, flags: DIFlagPrototyped, spFlags: 0)
!481 = !DISubroutineType(types: !482)
!482 = !{!291, !291}
!483 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !484, file: !414, line: 154)
!484 = !DISubprogram(name: "ldiv", scope: !65, file: !65, line: 994, type: !485, flags: DIFlagPrototyped, spFlags: 0)
!485 = !DISubroutineType(types: !486)
!486 = !{!416, !291, !291}
!487 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !488, file: !414, line: 155)
!488 = !DISubprogram(name: "malloc", scope: !65, file: !65, line: 672, type: !489, flags: DIFlagPrototyped, spFlags: 0)
!489 = !DISubroutineType(types: !490)
!490 = !{!429, !430}
!491 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !492, file: !414, line: 157)
!492 = !DISubprogram(name: "mblen", scope: !65, file: !65, line: 1062, type: !493, flags: DIFlagPrototyped, spFlags: 0)
!493 = !DISubroutineType(types: !494)
!494 = !{!9, !310, !430}
!495 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !496, file: !414, line: 158)
!496 = !DISubprogram(name: "mbstowcs", scope: !65, file: !65, line: 1073, type: !497, flags: DIFlagPrototyped, spFlags: 0)
!497 = !DISubroutineType(types: !498)
!498 = !{!430, !499, !502, !430}
!499 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !500)
!500 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !501, size: 64)
!501 = !DIBasicType(name: "wchar_t", size: 32, encoding: DW_ATE_signed)
!502 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !310)
!503 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !504, file: !414, line: 159)
!504 = !DISubprogram(name: "mbtowc", scope: !65, file: !65, line: 1065, type: !505, flags: DIFlagPrototyped, spFlags: 0)
!505 = !DISubroutineType(types: !506)
!506 = !{!9, !499, !502, !430}
!507 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !508, file: !414, line: 161)
!508 = !DISubprogram(name: "qsort", scope: !65, file: !65, line: 970, type: !509, flags: DIFlagPrototyped, spFlags: 0)
!509 = !DISubroutineType(types: !510)
!510 = !{null, !429, !430, !430, !456}
!511 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !512, file: !414, line: 164)
!512 = !DISubprogram(name: "quick_exit", scope: !65, file: !65, line: 762, type: !468, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!513 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !514, file: !414, line: 167)
!514 = !DISubprogram(name: "rand", scope: !65, file: !65, line: 573, type: !515, flags: DIFlagPrototyped, spFlags: 0)
!515 = !DISubroutineType(types: !516)
!516 = !{!9}
!517 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !518, file: !414, line: 168)
!518 = !DISubprogram(name: "realloc", scope: !65, file: !65, line: 683, type: !519, flags: DIFlagPrototyped, spFlags: 0)
!519 = !DISubroutineType(types: !520)
!520 = !{!429, !429, !430}
!521 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !522, file: !414, line: 169)
!522 = !DISubprogram(name: "srand", scope: !65, file: !65, line: 575, type: !523, flags: DIFlagPrototyped, spFlags: 0)
!523 = !DISubroutineType(types: !524)
!524 = !{null, !33}
!525 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !526, file: !414, line: 170)
!526 = !DISubprogram(name: "strtod", scope: !65, file: !65, line: 118, type: !527, flags: DIFlagPrototyped, spFlags: 0)
!527 = !DISubroutineType(types: !528)
!528 = !{!74, !502, !529}
!529 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !530)
!530 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !478, size: 64)
!531 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !532, file: !414, line: 171)
!532 = !DISubprogram(name: "strtol", linkageName: "__isoc23_strtol", scope: !65, file: !65, line: 215, type: !533, flags: DIFlagPrototyped, spFlags: 0)
!533 = !DISubroutineType(types: !534)
!534 = !{!291, !502, !529, !9}
!535 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !536, file: !414, line: 172)
!536 = !DISubprogram(name: "strtoul", linkageName: "__isoc23_strtoul", scope: !65, file: !65, line: 219, type: !537, flags: DIFlagPrototyped, spFlags: 0)
!537 = !DISubroutineType(types: !538)
!538 = !{!432, !502, !529, !9}
!539 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !540, file: !414, line: 173)
!540 = !DISubprogram(name: "system", scope: !65, file: !65, line: 923, type: !444, flags: DIFlagPrototyped, spFlags: 0)
!541 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !542, file: !414, line: 175)
!542 = !DISubprogram(name: "wcstombs", scope: !65, file: !65, line: 1077, type: !543, flags: DIFlagPrototyped, spFlags: 0)
!543 = !DISubroutineType(types: !544)
!544 = !{!430, !545, !546, !430}
!545 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !478)
!546 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !547)
!547 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !548, size: 64)
!548 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !501)
!549 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !550, file: !414, line: 176)
!550 = !DISubprogram(name: "wctomb", scope: !65, file: !65, line: 1069, type: !551, flags: DIFlagPrototyped, spFlags: 0)
!551 = !DISubroutineType(types: !552)
!552 = !{!9, !478, !501}
!553 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !554, entity: !555, file: !414, line: 204)
!554 = !DINamespace(name: "__gnu_cxx", scope: null)
!555 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !65, line: 81, baseType: !556)
!556 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !65, line: 77, size: 128, flags: DIFlagTypePassByValue, elements: !557, identifier: "_ZTS7lldiv_t")
!557 = !{!558, !559}
!558 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !556, file: !65, line: 79, baseType: !254, size: 64)
!559 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !556, file: !65, line: 80, baseType: !254, size: 64, offset: 64)
!560 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !554, entity: !561, file: !414, line: 210)
!561 = !DISubprogram(name: "_Exit", scope: !65, file: !65, line: 768, type: !468, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!562 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !554, entity: !563, file: !414, line: 214)
!563 = !DISubprogram(name: "llabs", scope: !65, file: !65, line: 984, type: !564, flags: DIFlagPrototyped, spFlags: 0)
!564 = !DISubroutineType(types: !565)
!565 = !{!254, !254}
!566 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !554, entity: !567, file: !414, line: 220)
!567 = !DISubprogram(name: "lldiv", scope: !65, file: !65, line: 998, type: !568, flags: DIFlagPrototyped, spFlags: 0)
!568 = !DISubroutineType(types: !569)
!569 = !{!555, !254, !254}
!570 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !554, entity: !571, file: !414, line: 231)
!571 = !DISubprogram(name: "atoll", scope: !65, file: !65, line: 113, type: !572, flags: DIFlagPrototyped, spFlags: 0)
!572 = !DISubroutineType(types: !573)
!573 = !{!254, !310}
!574 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !554, entity: !575, file: !414, line: 232)
!575 = !DISubprogram(name: "strtoll", linkageName: "__isoc23_strtoll", scope: !65, file: !65, line: 238, type: !576, flags: DIFlagPrototyped, spFlags: 0)
!576 = !DISubroutineType(types: !577)
!577 = !{!254, !502, !529, !9}
!578 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !554, entity: !579, file: !414, line: 233)
!579 = !DISubprogram(name: "strtoull", linkageName: "__isoc23_strtoull", scope: !65, file: !65, line: 243, type: !580, flags: DIFlagPrototyped, spFlags: 0)
!580 = !DISubroutineType(types: !581)
!581 = !{!582, !502, !529, !9}
!582 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!583 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !554, entity: !584, file: !414, line: 235)
!584 = !DISubprogram(name: "strtof", scope: !65, file: !65, line: 124, type: !585, flags: DIFlagPrototyped, spFlags: 0)
!585 = !DISubroutineType(types: !586)
!586 = !{!132, !502, !529}
!587 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !554, entity: !588, file: !414, line: 236)
!588 = !DISubprogram(name: "strtold", scope: !65, file: !65, line: 127, type: !589, flags: DIFlagPrototyped, spFlags: 0)
!589 = !DISubroutineType(types: !590)
!590 = !{!143, !502, !529}
!591 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !555, file: !414, line: 244)
!592 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !561, file: !414, line: 246)
!593 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !563, file: !414, line: 248)
!594 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !595, file: !414, line: 249)
!595 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !554, file: !414, line: 217, type: !568, flags: DIFlagPrototyped, spFlags: 0)
!596 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !567, file: !414, line: 250)
!597 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !571, file: !414, line: 252)
!598 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !584, file: !414, line: 253)
!599 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !575, file: !414, line: 254)
!600 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !579, file: !414, line: 255)
!601 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !588, file: !414, line: 256)
!602 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !34, entity: !422, file: !603, line: 38)
!603 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/stdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "3f24ff2a8eef595875da96e5466bd4aa")
!604 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !34, entity: !434, file: !603, line: 39)
!605 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !34, entity: !467, file: !603, line: 40)
!606 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !34, entity: !439, file: !603, line: 43)
!607 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !34, entity: !512, file: !603, line: 46)
!608 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !34, entity: !561, file: !603, line: 49)
!609 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !34, entity: !412, file: !603, line: 54)
!610 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !34, entity: !416, file: !603, line: 55)
!611 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !34, entity: !612, file: !603, line: 57)
!612 = !DISubprogram(name: "abs", linkageName: "_ZSt3absn", scope: !63, file: !68, line: 85, type: !613, flags: DIFlagPrototyped, spFlags: 0)
!613 = !DISubroutineType(types: !614)
!614 = !{!615, !615}
!615 = !DIBasicType(name: "__int128", size: 128, encoding: DW_ATE_signed)
!616 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !34, entity: !441, file: !603, line: 58)
!617 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !34, entity: !443, file: !603, line: 59)
!618 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !34, entity: !447, file: !603, line: 60)
!619 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !34, entity: !451, file: !603, line: 61)
!620 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !34, entity: !461, file: !603, line: 62)
!621 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !34, entity: !595, file: !603, line: 63)
!622 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !34, entity: !471, file: !603, line: 64)
!623 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !34, entity: !475, file: !603, line: 65)
!624 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !34, entity: !480, file: !603, line: 66)
!625 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !34, entity: !484, file: !603, line: 67)
!626 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !34, entity: !488, file: !603, line: 68)
!627 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !34, entity: !492, file: !603, line: 70)
!628 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !34, entity: !496, file: !603, line: 71)
!629 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !34, entity: !504, file: !603, line: 72)
!630 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !34, entity: !508, file: !603, line: 74)
!631 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !34, entity: !514, file: !603, line: 75)
!632 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !34, entity: !518, file: !603, line: 76)
!633 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !34, entity: !522, file: !603, line: 77)
!634 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !34, entity: !526, file: !603, line: 78)
!635 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !34, entity: !532, file: !603, line: 79)
!636 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !34, entity: !536, file: !603, line: 80)
!637 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !34, entity: !540, file: !603, line: 81)
!638 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !34, entity: !542, file: !603, line: 83)
!639 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !34, entity: !550, file: !603, line: 84)
!640 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !641, file: !642, line: 200)
!641 = !DISubprogram(name: "abs", linkageName: "_ZL3absd", scope: !642, file: !642, line: 28, type: !72, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!642 = !DIFile(filename: "/opt/rocm-6.4.2/lib/llvm/lib/clang/19/include/__clang_cuda_math_forward_declares.h", directory: "", checksumkind: CSK_MD5, checksum: "7fcaa66c0bf1529fc7d2359f3dc2dd30")
!643 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !644, file: !642, line: 201)
!644 = !DISubprogram(name: "acos", linkageName: "_ZL4acosf", scope: !642, file: !642, line: 32, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!645 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !646, file: !642, line: 202)
!646 = !DISubprogram(name: "acosh", linkageName: "_ZL5acoshf", scope: !642, file: !642, line: 34, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!647 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !648, file: !642, line: 203)
!648 = !DISubprogram(name: "asin", linkageName: "_ZL4asinf", scope: !642, file: !642, line: 36, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!649 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !650, file: !642, line: 204)
!650 = !DISubprogram(name: "asinh", linkageName: "_ZL5asinhf", scope: !642, file: !642, line: 38, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!651 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !652, file: !642, line: 205)
!652 = !DISubprogram(name: "atan", linkageName: "_ZL4atanf", scope: !642, file: !642, line: 42, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!653 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !654, file: !642, line: 206)
!654 = !DISubprogram(name: "atan2", linkageName: "_ZL5atan2ff", scope: !642, file: !642, line: 40, type: !166, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!655 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !656, file: !642, line: 207)
!656 = !DISubprogram(name: "atanh", linkageName: "_ZL5atanhf", scope: !642, file: !642, line: 44, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!657 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !658, file: !642, line: 208)
!658 = !DISubprogram(name: "cbrt", linkageName: "_ZL4cbrtf", scope: !642, file: !642, line: 46, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!659 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !660, file: !642, line: 209)
!660 = !DISubprogram(name: "ceil", linkageName: "_ZL4ceilf", scope: !642, file: !642, line: 48, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!661 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !662, file: !642, line: 210)
!662 = !DISubprogram(name: "copysign", linkageName: "_ZL8copysignff", scope: !642, file: !642, line: 50, type: !166, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!663 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !664, file: !642, line: 211)
!664 = !DISubprogram(name: "cos", linkageName: "_ZL3cosf", scope: !642, file: !642, line: 52, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!665 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !666, file: !642, line: 212)
!666 = !DISubprogram(name: "cosh", linkageName: "_ZL4coshf", scope: !642, file: !642, line: 54, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!667 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !668, file: !642, line: 213)
!668 = !DISubprogram(name: "erf", linkageName: "_ZL3erff", scope: !642, file: !642, line: 58, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!669 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !670, file: !642, line: 214)
!670 = !DISubprogram(name: "erfc", linkageName: "_ZL4erfcf", scope: !642, file: !642, line: 56, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!671 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !672, file: !642, line: 215)
!672 = !DISubprogram(name: "exp", linkageName: "_ZL3expf", scope: !642, file: !642, line: 62, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!673 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !674, file: !642, line: 216)
!674 = !DISubprogram(name: "exp2", linkageName: "_ZL4exp2f", scope: !642, file: !642, line: 60, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!675 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !676, file: !642, line: 217)
!676 = !DISubprogram(name: "expm1", linkageName: "_ZL5expm1f", scope: !642, file: !642, line: 64, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!677 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !678, file: !642, line: 218)
!678 = !DISubprogram(name: "fabs", linkageName: "_ZL4fabsf", scope: !642, file: !642, line: 66, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!679 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !680, file: !642, line: 219)
!680 = !DISubprogram(name: "fdim", linkageName: "_ZL4fdimff", scope: !642, file: !642, line: 68, type: !166, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!681 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !682, file: !642, line: 220)
!682 = !DISubprogram(name: "floor", linkageName: "_ZL5floorf", scope: !642, file: !642, line: 70, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!683 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !684, file: !642, line: 221)
!684 = !DISubprogram(name: "fma", linkageName: "_ZL3fmafff", scope: !642, file: !642, line: 72, type: !208, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!685 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !686, file: !642, line: 222)
!686 = !DISubprogram(name: "fmax", linkageName: "_ZL4fmaxff", scope: !642, file: !642, line: 74, type: !166, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!687 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !688, file: !642, line: 223)
!688 = !DISubprogram(name: "fmin", linkageName: "_ZL4fminff", scope: !642, file: !642, line: 76, type: !166, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!689 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !690, file: !642, line: 224)
!690 = !DISubprogram(name: "fmod", linkageName: "_ZL4fmodff", scope: !642, file: !642, line: 78, type: !166, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!691 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !692, file: !642, line: 225)
!692 = !DISubprogram(name: "fpclassify", linkageName: "_ZL10fpclassifyf", scope: !642, file: !642, line: 80, type: !238, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!693 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !694, file: !642, line: 226)
!694 = !DISubprogram(name: "frexp", linkageName: "_ZL5frexpfPi", scope: !642, file: !642, line: 82, type: !695, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!695 = !DISubroutineType(types: !696)
!696 = !{!132, !132, !11}
!697 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !698, file: !642, line: 227)
!698 = !DISubprogram(name: "hypot", linkageName: "_ZL5hypotff", scope: !642, file: !642, line: 84, type: !166, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!699 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !700, file: !642, line: 228)
!700 = !DISubprogram(name: "ilogb", linkageName: "_ZL5ilogbf", scope: !642, file: !642, line: 86, type: !238, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!701 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !702, file: !642, line: 229)
!702 = !DISubprogram(name: "isfinite", linkageName: "_ZL8isfinitef", scope: !642, file: !642, line: 91, type: !703, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!703 = !DISubroutineType(types: !704)
!704 = !{!705, !132}
!705 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!706 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !707, file: !642, line: 230)
!707 = !DISubprogram(name: "isgreater", linkageName: "_ZL9isgreaterff", scope: !642, file: !642, line: 95, type: !708, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!708 = !DISubroutineType(types: !709)
!709 = !{!705, !132, !132}
!710 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !711, file: !642, line: 231)
!711 = !DISubprogram(name: "isgreaterequal", linkageName: "_ZL14isgreaterequalff", scope: !642, file: !642, line: 94, type: !708, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!712 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !713, file: !642, line: 232)
!713 = !DISubprogram(name: "isinf", linkageName: "_ZL5isinff", scope: !642, file: !642, line: 100, type: !703, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!714 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !715, file: !642, line: 233)
!715 = !DISubprogram(name: "isless", linkageName: "_ZL6islessff", scope: !642, file: !642, line: 104, type: !708, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!716 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !717, file: !642, line: 234)
!717 = !DISubprogram(name: "islessequal", linkageName: "_ZL11islessequalff", scope: !642, file: !642, line: 103, type: !708, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!718 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !719, file: !642, line: 235)
!719 = !DISubprogram(name: "islessgreater", linkageName: "_ZL13islessgreaterff", scope: !642, file: !642, line: 106, type: !708, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!720 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !721, file: !642, line: 236)
!721 = !DISubprogram(name: "isnan", linkageName: "_ZL5isnanf", scope: !642, file: !642, line: 111, type: !703, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!722 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !723, file: !642, line: 237)
!723 = !DISubprogram(name: "isnormal", linkageName: "_ZL8isnormalf", scope: !642, file: !642, line: 113, type: !703, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!724 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !725, file: !642, line: 238)
!725 = !DISubprogram(name: "isunordered", linkageName: "_ZL11isunorderedff", scope: !642, file: !642, line: 115, type: !708, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!726 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !727, file: !642, line: 239)
!727 = !DISubprogram(name: "labs", linkageName: "_ZL4labsl", scope: !642, file: !642, line: 116, type: !481, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!728 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !729, file: !642, line: 240)
!729 = !DISubprogram(name: "ldexp", linkageName: "_ZL5ldexpfi", scope: !642, file: !642, line: 118, type: !389, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!730 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !731, file: !642, line: 241)
!731 = !DISubprogram(name: "lgamma", linkageName: "_ZL6lgammaf", scope: !642, file: !642, line: 120, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!732 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !733, file: !642, line: 242)
!733 = !DISubprogram(name: "llabs", linkageName: "_ZL5llabsx", scope: !642, file: !642, line: 121, type: !564, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!734 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !735, file: !642, line: 243)
!735 = !DISubprogram(name: "llrint", linkageName: "_ZL6llrintf", scope: !642, file: !642, line: 123, type: !257, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!736 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !737, file: !642, line: 244)
!737 = !DISubprogram(name: "log", linkageName: "_ZL3logf", scope: !642, file: !642, line: 133, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!738 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !739, file: !642, line: 245)
!739 = !DISubprogram(name: "log10", linkageName: "_ZL5log10f", scope: !642, file: !642, line: 125, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!740 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !741, file: !642, line: 246)
!741 = !DISubprogram(name: "log1p", linkageName: "_ZL5log1pf", scope: !642, file: !642, line: 127, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!742 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !743, file: !642, line: 247)
!743 = !DISubprogram(name: "log2", linkageName: "_ZL4log2f", scope: !642, file: !642, line: 129, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!744 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !745, file: !642, line: 248)
!745 = !DISubprogram(name: "logb", linkageName: "_ZL4logbf", scope: !642, file: !642, line: 131, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!746 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !747, file: !642, line: 249)
!747 = !DISubprogram(name: "lrint", linkageName: "_ZL5lrintf", scope: !642, file: !642, line: 135, type: !294, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!748 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !749, file: !642, line: 250)
!749 = !DISubprogram(name: "lround", linkageName: "_ZL6lroundf", scope: !642, file: !642, line: 137, type: !294, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!750 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !751, file: !642, line: 251)
!751 = !DISubprogram(name: "llround", linkageName: "_ZL7llroundf", scope: !642, file: !642, line: 138, type: !257, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!752 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !753, file: !642, line: 252)
!753 = !DISubprogram(name: "modf", linkageName: "_ZL4modffPf", scope: !642, file: !642, line: 140, type: !754, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!754 = !DISubroutineType(types: !755)
!755 = !{!132, !132, !756}
!756 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !132, size: 64)
!757 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !758, file: !642, line: 253)
!758 = !DISubprogram(name: "nan", linkageName: "_ZL3nanPKc", scope: !642, file: !642, line: 141, type: !308, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!759 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !760, file: !642, line: 254)
!760 = !DISubprogram(name: "nanf", linkageName: "_ZL4nanfPKc", scope: !642, file: !642, line: 142, type: !315, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!761 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !762, file: !642, line: 255)
!762 = !DISubprogram(name: "nearbyint", linkageName: "_ZL9nearbyintf", scope: !642, file: !642, line: 144, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!763 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !764, file: !642, line: 256)
!764 = !DISubprogram(name: "nextafter", linkageName: "_ZL9nextafterff", scope: !642, file: !642, line: 146, type: !166, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!765 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !766, file: !642, line: 257)
!766 = !DISubprogram(name: "pow", linkageName: "_ZL3powfi", scope: !642, file: !642, line: 150, type: !389, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!767 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !768, file: !642, line: 258)
!768 = !DISubprogram(name: "remainder", linkageName: "_ZL9remainderff", scope: !642, file: !642, line: 152, type: !166, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!769 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !770, file: !642, line: 259)
!770 = !DISubprogram(name: "remquo", linkageName: "_ZL6remquoffPi", scope: !642, file: !642, line: 154, type: !355, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!771 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !772, file: !642, line: 260)
!772 = !DISubprogram(name: "rint", linkageName: "_ZL4rintf", scope: !642, file: !642, line: 156, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!773 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !774, file: !642, line: 261)
!774 = !DISubprogram(name: "round", linkageName: "_ZL5roundf", scope: !642, file: !642, line: 158, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!775 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !776, file: !642, line: 262)
!776 = !DISubprogram(name: "scalbln", linkageName: "_ZL7scalblnfl", scope: !642, file: !642, line: 160, type: !379, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!777 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !778, file: !642, line: 263)
!778 = !DISubprogram(name: "scalbn", linkageName: "_ZL6scalbnfi", scope: !642, file: !642, line: 162, type: !389, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!779 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !780, file: !642, line: 264)
!780 = !DISubprogram(name: "signbit", linkageName: "_ZL7signbitf", scope: !642, file: !642, line: 167, type: !703, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!781 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !782, file: !642, line: 265)
!782 = !DISubprogram(name: "sin", linkageName: "_ZL3sinf", scope: !642, file: !642, line: 169, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!783 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !784, file: !642, line: 266)
!784 = !DISubprogram(name: "sinh", linkageName: "_ZL4sinhf", scope: !642, file: !642, line: 171, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!785 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !786, file: !642, line: 267)
!786 = !DISubprogram(name: "sqrt", linkageName: "_ZL4sqrtf", scope: !642, file: !642, line: 173, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!787 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !788, file: !642, line: 268)
!788 = !DISubprogram(name: "tan", linkageName: "_ZL3tanf", scope: !642, file: !642, line: 175, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!789 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !790, file: !642, line: 269)
!790 = !DISubprogram(name: "tanh", linkageName: "_ZL4tanhf", scope: !642, file: !642, line: 177, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!791 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !792, file: !642, line: 270)
!792 = !DISubprogram(name: "tgamma", linkageName: "_ZL6tgammaf", scope: !642, file: !642, line: 179, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!793 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !794, file: !642, line: 271)
!794 = !DISubprogram(name: "trunc", linkageName: "_ZL5truncf", scope: !642, file: !642, line: 181, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!795 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !796, file: !798, line: 737)
!796 = !DISubprogram(name: "acosf", linkageName: "_ZL5acosff", scope: !797, file: !797, line: 358, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!797 = !DIFile(filename: "/opt/rocm-6.4.2/lib/llvm/lib/clang/19/include/__clang_hip_math.h", directory: "", checksumkind: CSK_MD5, checksum: "1ddc6320be20cc493976d99e6b1c9853")
!798 = !DIFile(filename: "/opt/rocm-6.4.2/lib/llvm/lib/clang/19/include/__clang_hip_cmath.h", directory: "", checksumkind: CSK_MD5, checksum: "dc1ab1a8805dcbc75cbf36b8a1f9305a")
!799 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !800, file: !798, line: 738)
!800 = !DISubprogram(name: "acoshf", linkageName: "_ZL6acoshff", scope: !797, file: !797, line: 361, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!801 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !802, file: !798, line: 739)
!802 = !DISubprogram(name: "asinf", linkageName: "_ZL5asinff", scope: !797, file: !797, line: 364, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!803 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !804, file: !798, line: 740)
!804 = !DISubprogram(name: "asinhf", linkageName: "_ZL6asinhff", scope: !797, file: !797, line: 367, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!805 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !806, file: !798, line: 741)
!806 = !DISubprogram(name: "atan2f", linkageName: "_ZL6atan2fff", scope: !797, file: !797, line: 370, type: !166, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!807 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !808, file: !798, line: 742)
!808 = !DISubprogram(name: "atanf", linkageName: "_ZL5atanff", scope: !797, file: !797, line: 373, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!809 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !810, file: !798, line: 743)
!810 = !DISubprogram(name: "atanhf", linkageName: "_ZL6atanhff", scope: !797, file: !797, line: 376, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!811 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !812, file: !798, line: 744)
!812 = !DISubprogram(name: "cbrtf", linkageName: "_ZL5cbrtff", scope: !797, file: !797, line: 379, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!813 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !814, file: !798, line: 745)
!814 = !DISubprogram(name: "ceilf", linkageName: "_ZL5ceilff", scope: !797, file: !797, line: 382, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!815 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !816, file: !798, line: 746)
!816 = !DISubprogram(name: "copysignf", linkageName: "_ZL9copysignfff", scope: !797, file: !797, line: 385, type: !166, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!817 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !818, file: !798, line: 747)
!818 = !DISubprogram(name: "cosf", linkageName: "_ZL4cosff", scope: !797, file: !797, line: 388, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!819 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !820, file: !798, line: 748)
!820 = !DISubprogram(name: "coshf", linkageName: "_ZL5coshff", scope: !797, file: !797, line: 391, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!821 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !822, file: !798, line: 749)
!822 = !DISubprogram(name: "erfcf", linkageName: "_ZL5erfcff", scope: !797, file: !797, line: 403, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!823 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !824, file: !798, line: 750)
!824 = !DISubprogram(name: "erff", linkageName: "_ZL4erfff", scope: !797, file: !797, line: 412, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!825 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !826, file: !798, line: 751)
!826 = !DISubprogram(name: "exp2f", linkageName: "_ZL5exp2ff", scope: !797, file: !797, line: 421, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!827 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !828, file: !798, line: 752)
!828 = !DISubprogram(name: "expf", linkageName: "_ZL4expff", scope: !797, file: !797, line: 424, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!829 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !830, file: !798, line: 753)
!830 = !DISubprogram(name: "expm1f", linkageName: "_ZL6expm1ff", scope: !797, file: !797, line: 427, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!831 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !832, file: !798, line: 754)
!832 = !DISubprogram(name: "fabsf", linkageName: "_ZL5fabsff", scope: !797, file: !797, line: 430, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!833 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !834, file: !798, line: 755)
!834 = !DISubprogram(name: "fdimf", linkageName: "_ZL5fdimfff", scope: !797, file: !797, line: 433, type: !166, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!835 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !836, file: !798, line: 756)
!836 = !DISubprogram(name: "floorf", linkageName: "_ZL6floorff", scope: !797, file: !797, line: 439, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!837 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !838, file: !798, line: 757)
!838 = !DISubprogram(name: "fmaf", linkageName: "_ZL4fmaffff", scope: !797, file: !797, line: 442, type: !208, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!839 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !840, file: !798, line: 758)
!840 = !DISubprogram(name: "fmaxf", linkageName: "_ZL5fmaxfff", scope: !797, file: !797, line: 447, type: !166, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!841 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !842, file: !798, line: 759)
!842 = !DISubprogram(name: "fminf", linkageName: "_ZL5fminfff", scope: !797, file: !797, line: 450, type: !166, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!843 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !844, file: !798, line: 760)
!844 = !DISubprogram(name: "fmodf", linkageName: "_ZL5fmodfff", scope: !797, file: !797, line: 453, type: !166, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!845 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !846, file: !798, line: 761)
!846 = !DISubprogram(name: "frexpf", linkageName: "_ZL6frexpffPi", scope: !797, file: !797, line: 456, type: !695, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!847 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !848, file: !798, line: 762)
!848 = !DISubprogram(name: "hypotf", linkageName: "_ZL6hypotfff", scope: !797, file: !797, line: 461, type: !166, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!849 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !850, file: !798, line: 763)
!850 = !DISubprogram(name: "ilogbf", linkageName: "_ZL6ilogbff", scope: !797, file: !797, line: 464, type: !238, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!851 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !852, file: !798, line: 764)
!852 = !DISubprogram(name: "ldexpf", linkageName: "_ZL6ldexpffi", scope: !797, file: !797, line: 503, type: !389, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!853 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !854, file: !798, line: 765)
!854 = !DISubprogram(name: "lgammaf", linkageName: "_ZL7lgammaff", scope: !797, file: !797, line: 506, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!855 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !856, file: !798, line: 766)
!856 = !DISubprogram(name: "llrintf", linkageName: "_ZL7llrintff", scope: !797, file: !797, line: 509, type: !257, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!857 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !858, file: !798, line: 767)
!858 = !DISubprogram(name: "llroundf", linkageName: "_ZL8llroundff", scope: !797, file: !797, line: 512, type: !257, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!859 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !860, file: !798, line: 768)
!860 = !DISubprogram(name: "log10f", linkageName: "_ZL6log10ff", scope: !797, file: !797, line: 515, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!861 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !862, file: !798, line: 769)
!862 = !DISubprogram(name: "log1pf", linkageName: "_ZL6log1pff", scope: !797, file: !797, line: 518, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!863 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !864, file: !798, line: 770)
!864 = !DISubprogram(name: "log2f", linkageName: "_ZL5log2ff", scope: !797, file: !797, line: 521, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!865 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !866, file: !798, line: 771)
!866 = !DISubprogram(name: "logbf", linkageName: "_ZL5logbff", scope: !797, file: !797, line: 524, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!867 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !868, file: !798, line: 772)
!868 = !DISubprogram(name: "logf", linkageName: "_ZL4logff", scope: !797, file: !797, line: 527, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!869 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !870, file: !798, line: 773)
!870 = !DISubprogram(name: "lrintf", linkageName: "_ZL6lrintff", scope: !797, file: !797, line: 530, type: !294, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!871 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !872, file: !798, line: 774)
!872 = !DISubprogram(name: "lroundf", linkageName: "_ZL7lroundff", scope: !797, file: !797, line: 533, type: !294, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!873 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !874, file: !798, line: 775)
!874 = !DISubprogram(name: "modff", linkageName: "_ZL5modfffPf", scope: !797, file: !797, line: 536, type: !754, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!875 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !876, file: !798, line: 776)
!876 = !DISubprogram(name: "nearbyintf", linkageName: "_ZL10nearbyintff", scope: !797, file: !797, line: 571, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!877 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !878, file: !798, line: 777)
!878 = !DISubprogram(name: "nextafterf", linkageName: "_ZL10nextafterfff", scope: !797, file: !797, line: 574, type: !166, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!879 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !880, file: !798, line: 779)
!880 = !DISubprogram(name: "powf", linkageName: "_ZL4powfff", scope: !797, file: !797, line: 607, type: !166, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!881 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !882, file: !798, line: 780)
!882 = !DISubprogram(name: "remainderf", linkageName: "_ZL10remainderfff", scope: !797, file: !797, line: 616, type: !166, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!883 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !884, file: !798, line: 781)
!884 = !DISubprogram(name: "remquof", linkageName: "_ZL7remquofffPi", scope: !797, file: !797, line: 621, type: !355, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!885 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !886, file: !798, line: 782)
!886 = !DISubprogram(name: "rintf", linkageName: "_ZL5rintff", scope: !797, file: !797, line: 636, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!887 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !888, file: !798, line: 783)
!888 = !DISubprogram(name: "roundf", linkageName: "_ZL6roundff", scope: !797, file: !797, line: 661, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!889 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !890, file: !798, line: 784)
!890 = !DISubprogram(name: "scalblnf", linkageName: "_ZL8scalblnffl", scope: !797, file: !797, line: 667, type: !379, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!891 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !892, file: !798, line: 785)
!892 = !DISubprogram(name: "scalbnf", linkageName: "_ZL7scalbnffi", scope: !797, file: !797, line: 673, type: !389, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!893 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !894, file: !798, line: 786)
!894 = !DISubprogram(name: "sinf", linkageName: "_ZL4sinff", scope: !797, file: !797, line: 703, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!895 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !896, file: !798, line: 787)
!896 = !DISubprogram(name: "sinhf", linkageName: "_ZL5sinhff", scope: !797, file: !797, line: 706, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!897 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !898, file: !798, line: 788)
!898 = !DISubprogram(name: "sqrtf", linkageName: "_ZL5sqrtff", scope: !797, file: !797, line: 712, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!899 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !900, file: !798, line: 789)
!900 = !DISubprogram(name: "tanf", linkageName: "_ZL4tanff", scope: !797, file: !797, line: 715, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!901 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !902, file: !798, line: 790)
!902 = !DISubprogram(name: "tanhf", linkageName: "_ZL5tanhff", scope: !797, file: !797, line: 718, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!903 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !904, file: !798, line: 791)
!904 = !DISubprogram(name: "tgammaf", linkageName: "_ZL7tgammaff", scope: !797, file: !797, line: 721, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!905 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !906, file: !798, line: 792)
!906 = !DISubprogram(name: "truncf", linkageName: "_ZL6truncff", scope: !797, file: !797, line: 724, type: !137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!907 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !908, file: !909, line: 66)
!908 = !DICompositeType(tag: DW_TAG_class_type, name: "exception_ptr", scope: !910, file: !909, line: 97, size: 64, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSNSt15__exception_ptr13exception_ptrE")
!909 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/bits/exception_ptr.h", directory: "", checksumkind: CSK_MD5, checksum: "314ad14748ccb9ff85c65d17ebb0828b")
!910 = !DINamespace(name: "__exception_ptr", scope: !63)
!911 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !910, entity: !912, file: !909, line: 85)
!912 = !DISubprogram(name: "rethrow_exception", linkageName: "_ZSt17rethrow_exceptionNSt15__exception_ptr13exception_ptrE", scope: !63, file: !909, line: 81, type: !913, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!913 = !DISubroutineType(types: !914)
!914 = !{null, !908}
!915 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !916, file: !909, line: 243)
!916 = !DISubprogram(name: "swap", linkageName: "_ZNSt15__exception_ptr4swapERNS_13exception_ptrES1_", scope: !910, file: !909, line: 230, type: !917, flags: DIFlagPrototyped, spFlags: 0)
!917 = !DISubroutineType(types: !918)
!918 = !{null, !919, !919}
!919 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !908, size: 64)
!920 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !921, file: !936, line: 64)
!921 = !DIDerivedType(tag: DW_TAG_typedef, name: "mbstate_t", file: !922, line: 6, baseType: !923)
!922 = !DIFile(filename: "/usr/include/bits/types/mbstate_t.h", directory: "", checksumkind: CSK_MD5, checksum: "ba8742313715e20e434cf6ccb2db98e3")
!923 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mbstate_t", file: !924, line: 21, baseType: !925)
!924 = !DIFile(filename: "/usr/include/bits/types/__mbstate_t.h", directory: "", checksumkind: CSK_MD5, checksum: "82911a3e689448e3691ded3e0b471a55")
!925 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !924, line: 13, size: 64, flags: DIFlagTypePassByValue, elements: !926, identifier: "_ZTS11__mbstate_t")
!926 = !{!927, !928}
!927 = !DIDerivedType(tag: DW_TAG_member, name: "__count", scope: !925, file: !924, line: 15, baseType: !9, size: 32)
!928 = !DIDerivedType(tag: DW_TAG_member, name: "__value", scope: !925, file: !924, line: 20, baseType: !929, size: 32, offset: 32)
!929 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !925, file: !924, line: 16, size: 32, flags: DIFlagTypePassByValue, elements: !930, identifier: "_ZTSN11__mbstate_tUt_E")
!930 = !{!931, !932}
!931 = !DIDerivedType(tag: DW_TAG_member, name: "__wch", scope: !929, file: !924, line: 18, baseType: !33, size: 32)
!932 = !DIDerivedType(tag: DW_TAG_member, name: "__wchb", scope: !929, file: !924, line: 19, baseType: !933, size: 32)
!933 = !DICompositeType(tag: DW_TAG_array_type, baseType: !312, size: 32, elements: !934)
!934 = !{!935}
!935 = !DISubrange(count: 4)
!936 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/cwchar", directory: "")
!937 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !938, file: !936, line: 141)
!938 = !DIDerivedType(tag: DW_TAG_typedef, name: "wint_t", file: !939, line: 20, baseType: !33)
!939 = !DIFile(filename: "/usr/include/bits/types/wint_t.h", directory: "", checksumkind: CSK_MD5, checksum: "aa31b53ef28dc23152ceb41e2763ded3")
!940 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !941, file: !936, line: 143)
!941 = !DISubprogram(name: "btowc", scope: !942, file: !942, line: 309, type: !943, flags: DIFlagPrototyped, spFlags: 0)
!942 = !DIFile(filename: "/usr/include/wchar.h", directory: "", checksumkind: CSK_MD5, checksum: "c7881b2872d88c3ed71646d8a9e91af3")
!943 = !DISubroutineType(types: !944)
!944 = !{!938, !9}
!945 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !946, file: !936, line: 144)
!946 = !DISubprogram(name: "fgetwc", scope: !942, file: !942, line: 935, type: !947, flags: DIFlagPrototyped, spFlags: 0)
!947 = !DISubroutineType(types: !948)
!948 = !{!938, !949}
!949 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !950, size: 64)
!950 = !DIDerivedType(tag: DW_TAG_typedef, name: "__FILE", file: !951, line: 5, baseType: !952)
!951 = !DIFile(filename: "/usr/include/bits/types/__FILE.h", directory: "", checksumkind: CSK_MD5, checksum: "72a8fe90981f484acae7c6f3dfc5c2b7")
!952 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !951, line: 4, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS8_IO_FILE")
!953 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !954, file: !936, line: 145)
!954 = !DISubprogram(name: "fgetws", scope: !942, file: !942, line: 964, type: !955, flags: DIFlagPrototyped, spFlags: 0)
!955 = !DISubroutineType(types: !956)
!956 = !{!500, !499, !9, !957}
!957 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !949)
!958 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !959, file: !936, line: 146)
!959 = !DISubprogram(name: "fputwc", scope: !942, file: !942, line: 949, type: !960, flags: DIFlagPrototyped, spFlags: 0)
!960 = !DISubroutineType(types: !961)
!961 = !{!938, !501, !949}
!962 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !963, file: !936, line: 147)
!963 = !DISubprogram(name: "fputws", scope: !942, file: !942, line: 971, type: !964, flags: DIFlagPrototyped, spFlags: 0)
!964 = !DISubroutineType(types: !965)
!965 = !{!9, !546, !957}
!966 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !967, file: !936, line: 148)
!967 = !DISubprogram(name: "fwide", scope: !942, file: !942, line: 725, type: !968, flags: DIFlagPrototyped, spFlags: 0)
!968 = !DISubroutineType(types: !969)
!969 = !{!9, !949, !9}
!970 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !971, file: !936, line: 149)
!971 = !DISubprogram(name: "fwprintf", scope: !942, file: !942, line: 732, type: !972, flags: DIFlagPrototyped, spFlags: 0)
!972 = !DISubroutineType(types: !973)
!973 = !{!9, !957, !546, null}
!974 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !975, file: !936, line: 150)
!975 = !DISubprogram(name: "fwscanf", linkageName: "__isoc23_fwscanf", scope: !942, file: !942, line: 795, type: !972, flags: DIFlagPrototyped, spFlags: 0)
!976 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !977, file: !936, line: 151)
!977 = !DISubprogram(name: "getwc", scope: !942, file: !942, line: 936, type: !947, flags: DIFlagPrototyped, spFlags: 0)
!978 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !979, file: !936, line: 152)
!979 = !DISubprogram(name: "getwchar", scope: !942, file: !942, line: 942, type: !980, flags: DIFlagPrototyped, spFlags: 0)
!980 = !DISubroutineType(types: !981)
!981 = !{!938}
!982 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !983, file: !936, line: 153)
!983 = !DISubprogram(name: "mbrlen", scope: !942, file: !942, line: 332, type: !984, flags: DIFlagPrototyped, spFlags: 0)
!984 = !DISubroutineType(types: !985)
!985 = !{!430, !502, !430, !986}
!986 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !987)
!987 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !921, size: 64)
!988 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !989, file: !936, line: 154)
!989 = !DISubprogram(name: "mbrtowc", scope: !942, file: !942, line: 321, type: !990, flags: DIFlagPrototyped, spFlags: 0)
!990 = !DISubroutineType(types: !991)
!991 = !{!430, !499, !502, !430, !986}
!992 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !993, file: !936, line: 155)
!993 = !DISubprogram(name: "mbsinit", scope: !942, file: !942, line: 317, type: !994, flags: DIFlagPrototyped, spFlags: 0)
!994 = !DISubroutineType(types: !995)
!995 = !{!9, !996}
!996 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !997, size: 64)
!997 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !921)
!998 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !999, file: !936, line: 156)
!999 = !DISubprogram(name: "mbsrtowcs", scope: !942, file: !942, line: 362, type: !1000, flags: DIFlagPrototyped, spFlags: 0)
!1000 = !DISubroutineType(types: !1001)
!1001 = !{!430, !499, !1002, !430, !986}
!1002 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1003)
!1003 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !310, size: 64)
!1004 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1005, file: !936, line: 157)
!1005 = !DISubprogram(name: "putwc", scope: !942, file: !942, line: 950, type: !960, flags: DIFlagPrototyped, spFlags: 0)
!1006 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1007, file: !936, line: 158)
!1007 = !DISubprogram(name: "putwchar", scope: !942, file: !942, line: 956, type: !1008, flags: DIFlagPrototyped, spFlags: 0)
!1008 = !DISubroutineType(types: !1009)
!1009 = !{!938, !501}
!1010 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1011, file: !936, line: 160)
!1011 = !DISubprogram(name: "swprintf", scope: !942, file: !942, line: 742, type: !1012, flags: DIFlagPrototyped, spFlags: 0)
!1012 = !DISubroutineType(types: !1013)
!1013 = !{!9, !499, !430, !546, null}
!1014 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1015, file: !936, line: 162)
!1015 = !DISubprogram(name: "swscanf", linkageName: "__isoc23_swscanf", scope: !942, file: !942, line: 802, type: !1016, flags: DIFlagPrototyped, spFlags: 0)
!1016 = !DISubroutineType(types: !1017)
!1017 = !{!9, !546, !546, null}
!1018 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1019, file: !936, line: 163)
!1019 = !DISubprogram(name: "ungetwc", scope: !942, file: !942, line: 979, type: !1020, flags: DIFlagPrototyped, spFlags: 0)
!1020 = !DISubroutineType(types: !1021)
!1021 = !{!938, !938, !949}
!1022 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1023, file: !936, line: 164)
!1023 = !DISubprogram(name: "vfwprintf", scope: !942, file: !942, line: 750, type: !1024, flags: DIFlagPrototyped, spFlags: 0)
!1024 = !DISubroutineType(types: !1025)
!1025 = !{!9, !957, !546, !1026}
!1026 = !DIDerivedType(tag: DW_TAG_typedef, name: "__gnuc_va_list", file: !1027, line: 12, baseType: !1028)
!1027 = !DIFile(filename: "/opt/rocm-6.4.2/lib/llvm/lib/clang/19/include/__stdarg___gnuc_va_list.h", directory: "", checksumkind: CSK_MD5, checksum: "edb3f2eab991638e4dc94f6e55e3530f")
!1028 = !DIDerivedType(tag: DW_TAG_typedef, name: "__builtin_va_list", file: !14, baseType: !478)
!1029 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1030, file: !936, line: 166)
!1030 = !DISubprogram(name: "vfwscanf", linkageName: "__isoc23_vfwscanf", scope: !942, file: !942, line: 875, type: !1024, flags: DIFlagPrototyped, spFlags: 0)
!1031 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1032, file: !936, line: 169)
!1032 = !DISubprogram(name: "vswprintf", scope: !942, file: !942, line: 763, type: !1033, flags: DIFlagPrototyped, spFlags: 0)
!1033 = !DISubroutineType(types: !1034)
!1034 = !{!9, !499, !430, !546, !1026}
!1035 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1036, file: !936, line: 172)
!1036 = !DISubprogram(name: "vswscanf", linkageName: "__isoc23_vswscanf", scope: !942, file: !942, line: 882, type: !1037, flags: DIFlagPrototyped, spFlags: 0)
!1037 = !DISubroutineType(types: !1038)
!1038 = !{!9, !546, !546, !1026}
!1039 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1040, file: !936, line: 174)
!1040 = !DISubprogram(name: "vwprintf", scope: !942, file: !942, line: 758, type: !1041, flags: DIFlagPrototyped, spFlags: 0)
!1041 = !DISubroutineType(types: !1042)
!1042 = !{!9, !546, !1026}
!1043 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1044, file: !936, line: 176)
!1044 = !DISubprogram(name: "vwscanf", linkageName: "__isoc23_vwscanf", scope: !942, file: !942, line: 879, type: !1041, flags: DIFlagPrototyped, spFlags: 0)
!1045 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1046, file: !936, line: 178)
!1046 = !DISubprogram(name: "wcrtomb", scope: !942, file: !942, line: 326, type: !1047, flags: DIFlagPrototyped, spFlags: 0)
!1047 = !DISubroutineType(types: !1048)
!1048 = !{!430, !545, !501, !986}
!1049 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1050, file: !936, line: 179)
!1050 = !DISubprogram(name: "wcscat", scope: !942, file: !942, line: 121, type: !1051, flags: DIFlagPrototyped, spFlags: 0)
!1051 = !DISubroutineType(types: !1052)
!1052 = !{!500, !499, !546}
!1053 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1054, file: !936, line: 180)
!1054 = !DISubprogram(name: "wcscmp", scope: !942, file: !942, line: 130, type: !1055, flags: DIFlagPrototyped, spFlags: 0)
!1055 = !DISubroutineType(types: !1056)
!1056 = !{!9, !547, !547}
!1057 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1058, file: !936, line: 181)
!1058 = !DISubprogram(name: "wcscoll", scope: !942, file: !942, line: 155, type: !1055, flags: DIFlagPrototyped, spFlags: 0)
!1059 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1060, file: !936, line: 182)
!1060 = !DISubprogram(name: "wcscpy", scope: !942, file: !942, line: 98, type: !1051, flags: DIFlagPrototyped, spFlags: 0)
!1061 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1062, file: !936, line: 183)
!1062 = !DISubprogram(name: "wcscspn", scope: !942, file: !942, line: 212, type: !1063, flags: DIFlagPrototyped, spFlags: 0)
!1063 = !DISubroutineType(types: !1064)
!1064 = !{!430, !547, !547}
!1065 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1066, file: !936, line: 184)
!1066 = !DISubprogram(name: "wcsftime", scope: !942, file: !942, line: 1043, type: !1067, flags: DIFlagPrototyped, spFlags: 0)
!1067 = !DISubroutineType(types: !1068)
!1068 = !{!430, !499, !430, !546, !1069}
!1069 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1070)
!1070 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1071, size: 64)
!1071 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1072)
!1072 = !DICompositeType(tag: DW_TAG_structure_type, name: "tm", file: !942, line: 94, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS2tm")
!1073 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1074, file: !936, line: 185)
!1074 = !DISubprogram(name: "wcslen", scope: !942, file: !942, line: 247, type: !1075, flags: DIFlagPrototyped, spFlags: 0)
!1075 = !DISubroutineType(types: !1076)
!1076 = !{!430, !547}
!1077 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1078, file: !936, line: 186)
!1078 = !DISubprogram(name: "wcsncat", scope: !942, file: !942, line: 125, type: !1079, flags: DIFlagPrototyped, spFlags: 0)
!1079 = !DISubroutineType(types: !1080)
!1080 = !{!500, !499, !546, !430}
!1081 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1082, file: !936, line: 187)
!1082 = !DISubprogram(name: "wcsncmp", scope: !942, file: !942, line: 133, type: !1083, flags: DIFlagPrototyped, spFlags: 0)
!1083 = !DISubroutineType(types: !1084)
!1084 = !{!9, !547, !547, !430}
!1085 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1086, file: !936, line: 188)
!1086 = !DISubprogram(name: "wcsncpy", scope: !942, file: !942, line: 103, type: !1079, flags: DIFlagPrototyped, spFlags: 0)
!1087 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1088, file: !936, line: 189)
!1088 = !DISubprogram(name: "wcsrtombs", scope: !942, file: !942, line: 368, type: !1089, flags: DIFlagPrototyped, spFlags: 0)
!1089 = !DISubroutineType(types: !1090)
!1090 = !{!430, !545, !1091, !430, !986}
!1091 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1092)
!1092 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !547, size: 64)
!1093 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1094, file: !936, line: 190)
!1094 = !DISubprogram(name: "wcsspn", scope: !942, file: !942, line: 216, type: !1063, flags: DIFlagPrototyped, spFlags: 0)
!1095 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1096, file: !936, line: 191)
!1096 = !DISubprogram(name: "wcstod", scope: !942, file: !942, line: 402, type: !1097, flags: DIFlagPrototyped, spFlags: 0)
!1097 = !DISubroutineType(types: !1098)
!1098 = !{!74, !546, !1099}
!1099 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1100)
!1100 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !500, size: 64)
!1101 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1102, file: !936, line: 193)
!1102 = !DISubprogram(name: "wcstof", scope: !942, file: !942, line: 407, type: !1103, flags: DIFlagPrototyped, spFlags: 0)
!1103 = !DISubroutineType(types: !1104)
!1104 = !{!132, !546, !1099}
!1105 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1106, file: !936, line: 195)
!1106 = !DISubprogram(name: "wcstok", scope: !942, file: !942, line: 242, type: !1107, flags: DIFlagPrototyped, spFlags: 0)
!1107 = !DISubroutineType(types: !1108)
!1108 = !{!500, !499, !546, !1099}
!1109 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1110, file: !936, line: 196)
!1110 = !DISubprogram(name: "wcstol", linkageName: "__isoc23_wcstol", scope: !942, file: !942, line: 500, type: !1111, flags: DIFlagPrototyped, spFlags: 0)
!1111 = !DISubroutineType(types: !1112)
!1112 = !{!291, !546, !1099, !9}
!1113 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1114, file: !936, line: 197)
!1114 = !DISubprogram(name: "wcstoul", linkageName: "__isoc23_wcstoul", scope: !942, file: !942, line: 503, type: !1115, flags: DIFlagPrototyped, spFlags: 0)
!1115 = !DISubroutineType(types: !1116)
!1116 = !{!432, !546, !1099, !9}
!1117 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1118, file: !936, line: 198)
!1118 = !DISubprogram(name: "wcsxfrm", scope: !942, file: !942, line: 159, type: !1119, flags: DIFlagPrototyped, spFlags: 0)
!1119 = !DISubroutineType(types: !1120)
!1120 = !{!430, !499, !546, !430}
!1121 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1122, file: !936, line: 199)
!1122 = !DISubprogram(name: "wctob", scope: !942, file: !942, line: 313, type: !1123, flags: DIFlagPrototyped, spFlags: 0)
!1123 = !DISubroutineType(types: !1124)
!1124 = !{!9, !938}
!1125 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1126, file: !936, line: 200)
!1126 = !DISubprogram(name: "wmemcmp", scope: !942, file: !942, line: 283, type: !1083, flags: DIFlagPrototyped, spFlags: 0)
!1127 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1128, file: !936, line: 201)
!1128 = !DISubprogram(name: "wmemcpy", scope: !942, file: !942, line: 287, type: !1079, flags: DIFlagPrototyped, spFlags: 0)
!1129 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1130, file: !936, line: 202)
!1130 = !DISubprogram(name: "wmemmove", scope: !942, file: !942, line: 292, type: !1131, flags: DIFlagPrototyped, spFlags: 0)
!1131 = !DISubroutineType(types: !1132)
!1132 = !{!500, !500, !547, !430}
!1133 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1134, file: !936, line: 203)
!1134 = !DISubprogram(name: "wmemset", scope: !942, file: !942, line: 296, type: !1135, flags: DIFlagPrototyped, spFlags: 0)
!1135 = !DISubroutineType(types: !1136)
!1136 = !{!500, !500, !501, !430}
!1137 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1138, file: !936, line: 204)
!1138 = !DISubprogram(name: "wprintf", scope: !942, file: !942, line: 739, type: !1139, flags: DIFlagPrototyped, spFlags: 0)
!1139 = !DISubroutineType(types: !1140)
!1140 = !{!9, !546, null}
!1141 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1142, file: !936, line: 205)
!1142 = !DISubprogram(name: "wscanf", linkageName: "__isoc23_wscanf", scope: !942, file: !942, line: 799, type: !1139, flags: DIFlagPrototyped, spFlags: 0)
!1143 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1144, file: !936, line: 206)
!1144 = !DISubprogram(name: "wcschr", scope: !942, file: !942, line: 189, type: !1145, flags: DIFlagPrototyped, spFlags: 0)
!1145 = !DISubroutineType(types: !1146)
!1146 = !{!500, !547, !501}
!1147 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1148, file: !936, line: 207)
!1148 = !DISubprogram(name: "wcspbrk", scope: !942, file: !942, line: 226, type: !1149, flags: DIFlagPrototyped, spFlags: 0)
!1149 = !DISubroutineType(types: !1150)
!1150 = !{!500, !547, !547}
!1151 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1152, file: !936, line: 208)
!1152 = !DISubprogram(name: "wcsrchr", scope: !942, file: !942, line: 199, type: !1145, flags: DIFlagPrototyped, spFlags: 0)
!1153 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1154, file: !936, line: 209)
!1154 = !DISubprogram(name: "wcsstr", scope: !942, file: !942, line: 237, type: !1149, flags: DIFlagPrototyped, spFlags: 0)
!1155 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1156, file: !936, line: 210)
!1156 = !DISubprogram(name: "wmemchr", scope: !942, file: !942, line: 278, type: !1157, flags: DIFlagPrototyped, spFlags: 0)
!1157 = !DISubroutineType(types: !1158)
!1158 = !{!500, !547, !501, !430}
!1159 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !554, entity: !1160, file: !936, line: 251)
!1160 = !DISubprogram(name: "wcstold", scope: !942, file: !942, line: 409, type: !1161, flags: DIFlagPrototyped, spFlags: 0)
!1161 = !DISubroutineType(types: !1162)
!1162 = !{!143, !546, !1099}
!1163 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !554, entity: !1164, file: !936, line: 260)
!1164 = !DISubprogram(name: "wcstoll", linkageName: "__isoc23_wcstoll", scope: !942, file: !942, line: 508, type: !1165, flags: DIFlagPrototyped, spFlags: 0)
!1165 = !DISubroutineType(types: !1166)
!1166 = !{!254, !546, !1099, !9}
!1167 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !554, entity: !1168, file: !936, line: 261)
!1168 = !DISubprogram(name: "wcstoull", linkageName: "__isoc23_wcstoull", scope: !942, file: !942, line: 513, type: !1169, flags: DIFlagPrototyped, spFlags: 0)
!1169 = !DISubroutineType(types: !1170)
!1170 = !{!582, !546, !1099, !9}
!1171 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1160, file: !936, line: 267)
!1172 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1164, file: !936, line: 268)
!1173 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1168, file: !936, line: 269)
!1174 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1102, file: !936, line: 283)
!1175 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1030, file: !936, line: 286)
!1176 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1036, file: !936, line: 289)
!1177 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1044, file: !936, line: 292)
!1178 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1160, file: !936, line: 296)
!1179 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1164, file: !936, line: 297)
!1180 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1168, file: !936, line: 298)
!1181 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1182, file: !1184, line: 53)
!1182 = !DICompositeType(tag: DW_TAG_structure_type, name: "lconv", file: !1183, line: 51, size: 768, flags: DIFlagFwdDecl, identifier: "_ZTS5lconv")
!1183 = !DIFile(filename: "/usr/include/locale.h", directory: "", checksumkind: CSK_MD5, checksum: "9fdf0d24f6e4cc61619b5e3258456dbf")
!1184 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/clocale", directory: "")
!1185 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1186, file: !1184, line: 54)
!1186 = !DISubprogram(name: "setlocale", scope: !1183, file: !1183, line: 122, type: !1187, flags: DIFlagPrototyped, spFlags: 0)
!1187 = !DISubroutineType(types: !1188)
!1188 = !{!478, !9, !310}
!1189 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1190, file: !1184, line: 55)
!1190 = !DISubprogram(name: "localeconv", scope: !1183, file: !1183, line: 125, type: !1191, flags: DIFlagPrototyped, spFlags: 0)
!1191 = !DISubroutineType(types: !1192)
!1192 = !{!1193}
!1193 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1182, size: 64)
!1194 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1195, file: !1197, line: 64)
!1195 = !DISubprogram(name: "isalnum", scope: !1196, file: !1196, line: 108, type: !66, flags: DIFlagPrototyped, spFlags: 0)
!1196 = !DIFile(filename: "/usr/include/ctype.h", directory: "", checksumkind: CSK_MD5, checksum: "04aab4fba8cc4c824a8f09075cc98b20")
!1197 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/cctype", directory: "")
!1198 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1199, file: !1197, line: 65)
!1199 = !DISubprogram(name: "isalpha", scope: !1196, file: !1196, line: 109, type: !66, flags: DIFlagPrototyped, spFlags: 0)
!1200 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1201, file: !1197, line: 66)
!1201 = !DISubprogram(name: "iscntrl", scope: !1196, file: !1196, line: 110, type: !66, flags: DIFlagPrototyped, spFlags: 0)
!1202 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1203, file: !1197, line: 67)
!1203 = !DISubprogram(name: "isdigit", scope: !1196, file: !1196, line: 111, type: !66, flags: DIFlagPrototyped, spFlags: 0)
!1204 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1205, file: !1197, line: 68)
!1205 = !DISubprogram(name: "isgraph", scope: !1196, file: !1196, line: 113, type: !66, flags: DIFlagPrototyped, spFlags: 0)
!1206 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1207, file: !1197, line: 69)
!1207 = !DISubprogram(name: "islower", scope: !1196, file: !1196, line: 112, type: !66, flags: DIFlagPrototyped, spFlags: 0)
!1208 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1209, file: !1197, line: 70)
!1209 = !DISubprogram(name: "isprint", scope: !1196, file: !1196, line: 114, type: !66, flags: DIFlagPrototyped, spFlags: 0)
!1210 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1211, file: !1197, line: 71)
!1211 = !DISubprogram(name: "ispunct", scope: !1196, file: !1196, line: 115, type: !66, flags: DIFlagPrototyped, spFlags: 0)
!1212 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1213, file: !1197, line: 72)
!1213 = !DISubprogram(name: "isspace", scope: !1196, file: !1196, line: 116, type: !66, flags: DIFlagPrototyped, spFlags: 0)
!1214 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1215, file: !1197, line: 73)
!1215 = !DISubprogram(name: "isupper", scope: !1196, file: !1196, line: 117, type: !66, flags: DIFlagPrototyped, spFlags: 0)
!1216 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1217, file: !1197, line: 74)
!1217 = !DISubprogram(name: "isxdigit", scope: !1196, file: !1196, line: 118, type: !66, flags: DIFlagPrototyped, spFlags: 0)
!1218 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1219, file: !1197, line: 75)
!1219 = !DISubprogram(name: "tolower", scope: !1196, file: !1196, line: 122, type: !66, flags: DIFlagPrototyped, spFlags: 0)
!1220 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1221, file: !1197, line: 76)
!1221 = !DISubprogram(name: "toupper", scope: !1196, file: !1196, line: 125, type: !66, flags: DIFlagPrototyped, spFlags: 0)
!1222 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1223, file: !1197, line: 87)
!1223 = !DISubprogram(name: "isblank", scope: !1196, file: !1196, line: 130, type: !66, flags: DIFlagPrototyped, spFlags: 0)
!1224 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1225, file: !1227, line: 98)
!1225 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !1226, line: 7, baseType: !952)
!1226 = !DIFile(filename: "/usr/include/bits/types/FILE.h", directory: "", checksumkind: CSK_MD5, checksum: "571f9fb6223c42439075fdde11a0de5d")
!1227 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/cstdio", directory: "")
!1228 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1229, file: !1227, line: 99)
!1229 = !DIDerivedType(tag: DW_TAG_typedef, name: "fpos_t", file: !1230, line: 84, baseType: !1231)
!1230 = !DIFile(filename: "/usr/include/stdio.h", directory: "", checksumkind: CSK_MD5, checksum: "600479e30522c60809530fc01f232b17")
!1231 = !DIDerivedType(tag: DW_TAG_typedef, name: "__fpos_t", file: !1232, line: 14, baseType: !1233)
!1232 = !DIFile(filename: "/usr/include/bits/types/__fpos_t.h", directory: "", checksumkind: CSK_MD5, checksum: "32de8bdaf3551a6c0a9394f9af4389ce")
!1233 = !DICompositeType(tag: DW_TAG_structure_type, name: "_G_fpos_t", file: !1232, line: 10, size: 128, flags: DIFlagFwdDecl, identifier: "_ZTS9_G_fpos_t")
!1234 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1235, file: !1227, line: 101)
!1235 = !DISubprogram(name: "clearerr", scope: !1230, file: !1230, line: 844, type: !1236, flags: DIFlagPrototyped, spFlags: 0)
!1236 = !DISubroutineType(types: !1237)
!1237 = !{null, !1238}
!1238 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1225, size: 64)
!1239 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1240, file: !1227, line: 102)
!1240 = !DISubprogram(name: "fclose", scope: !1230, file: !1230, line: 183, type: !1241, flags: DIFlagPrototyped, spFlags: 0)
!1241 = !DISubroutineType(types: !1242)
!1242 = !{!9, !1238}
!1243 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1244, file: !1227, line: 103)
!1244 = !DISubprogram(name: "feof", scope: !1230, file: !1230, line: 846, type: !1241, flags: DIFlagPrototyped, spFlags: 0)
!1245 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1246, file: !1227, line: 104)
!1246 = !DISubprogram(name: "ferror", scope: !1230, file: !1230, line: 848, type: !1241, flags: DIFlagPrototyped, spFlags: 0)
!1247 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1248, file: !1227, line: 105)
!1248 = !DISubprogram(name: "fflush", scope: !1230, file: !1230, line: 235, type: !1241, flags: DIFlagPrototyped, spFlags: 0)
!1249 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1250, file: !1227, line: 106)
!1250 = !DISubprogram(name: "fgetc", scope: !1230, file: !1230, line: 571, type: !1241, flags: DIFlagPrototyped, spFlags: 0)
!1251 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1252, file: !1227, line: 107)
!1252 = !DISubprogram(name: "fgetpos", scope: !1230, file: !1230, line: 818, type: !1253, flags: DIFlagPrototyped, spFlags: 0)
!1253 = !DISubroutineType(types: !1254)
!1254 = !{!9, !1255, !1256}
!1255 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1238)
!1256 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1257)
!1257 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1229, size: 64)
!1258 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1259, file: !1227, line: 108)
!1259 = !DISubprogram(name: "fgets", scope: !1230, file: !1230, line: 650, type: !1260, flags: DIFlagPrototyped, spFlags: 0)
!1260 = !DISubroutineType(types: !1261)
!1261 = !{!478, !545, !9, !1255}
!1262 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1263, file: !1227, line: 109)
!1263 = !DISubprogram(name: "fopen", scope: !1230, file: !1230, line: 263, type: !1264, flags: DIFlagPrototyped, spFlags: 0)
!1264 = !DISubroutineType(types: !1265)
!1265 = !{!1238, !502, !502}
!1266 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1267, file: !1227, line: 110)
!1267 = !DISubprogram(name: "fprintf", scope: !1230, file: !1230, line: 355, type: !1268, flags: DIFlagPrototyped, spFlags: 0)
!1268 = !DISubroutineType(types: !1269)
!1269 = !{!9, !1255, !502, null}
!1270 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1271, file: !1227, line: 111)
!1271 = !DISubprogram(name: "fputc", scope: !1230, file: !1230, line: 607, type: !1272, flags: DIFlagPrototyped, spFlags: 0)
!1272 = !DISubroutineType(types: !1273)
!1273 = !{!9, !9, !1238}
!1274 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1275, file: !1227, line: 112)
!1275 = !DISubprogram(name: "fputs", scope: !1230, file: !1230, line: 713, type: !1276, flags: DIFlagPrototyped, spFlags: 0)
!1276 = !DISubroutineType(types: !1277)
!1277 = !{!9, !502, !1255}
!1278 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1279, file: !1227, line: 113)
!1279 = !DISubprogram(name: "fread", scope: !1230, file: !1230, line: 733, type: !1280, flags: DIFlagPrototyped, spFlags: 0)
!1280 = !DISubroutineType(types: !1281)
!1281 = !{!430, !1282, !430, !430, !1255}
!1282 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !429)
!1283 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1284, file: !1227, line: 114)
!1284 = !DISubprogram(name: "freopen", scope: !1230, file: !1230, line: 270, type: !1285, flags: DIFlagPrototyped, spFlags: 0)
!1285 = !DISubroutineType(types: !1286)
!1286 = !{!1238, !502, !502, !1255}
!1287 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1288, file: !1227, line: 115)
!1288 = !DISubprogram(name: "fscanf", linkageName: "__isoc23_fscanf", scope: !1230, file: !1230, line: 440, type: !1268, flags: DIFlagPrototyped, spFlags: 0)
!1289 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1290, file: !1227, line: 116)
!1290 = !DISubprogram(name: "fseek", scope: !1230, file: !1230, line: 771, type: !1291, flags: DIFlagPrototyped, spFlags: 0)
!1291 = !DISubroutineType(types: !1292)
!1292 = !{!9, !1238, !291, !9}
!1293 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1294, file: !1227, line: 117)
!1294 = !DISubprogram(name: "fsetpos", scope: !1230, file: !1230, line: 823, type: !1295, flags: DIFlagPrototyped, spFlags: 0)
!1295 = !DISubroutineType(types: !1296)
!1296 = !{!9, !1238, !1297}
!1297 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1298, size: 64)
!1298 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1229)
!1299 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1300, file: !1227, line: 118)
!1300 = !DISubprogram(name: "ftell", scope: !1230, file: !1230, line: 776, type: !1301, flags: DIFlagPrototyped, spFlags: 0)
!1301 = !DISubroutineType(types: !1302)
!1302 = !{!291, !1238}
!1303 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1304, file: !1227, line: 119)
!1304 = !DISubprogram(name: "fwrite", scope: !1230, file: !1230, line: 739, type: !1305, flags: DIFlagPrototyped, spFlags: 0)
!1305 = !DISubroutineType(types: !1306)
!1306 = !{!430, !1307, !430, !430, !1255}
!1307 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !454)
!1308 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1309, file: !1227, line: 120)
!1309 = !DISubprogram(name: "getc", scope: !1230, file: !1230, line: 572, type: !1241, flags: DIFlagPrototyped, spFlags: 0)
!1310 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1311, file: !1227, line: 121)
!1311 = !DISubprogram(name: "getchar", scope: !1230, file: !1230, line: 578, type: !515, flags: DIFlagPrototyped, spFlags: 0)
!1312 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1313, file: !1227, line: 126)
!1313 = !DISubprogram(name: "perror", scope: !1230, file: !1230, line: 862, type: !1314, flags: DIFlagPrototyped, spFlags: 0)
!1314 = !DISubroutineType(types: !1315)
!1315 = !{null, !310}
!1316 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1317, file: !1227, line: 127)
!1317 = !DISubprogram(name: "printf", scope: !1230, file: !1230, line: 361, type: !1318, flags: DIFlagPrototyped, spFlags: 0)
!1318 = !DISubroutineType(types: !1319)
!1319 = !{!9, !502, null}
!1320 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1321, file: !1227, line: 128)
!1321 = !DISubprogram(name: "putc", scope: !1230, file: !1230, line: 608, type: !1272, flags: DIFlagPrototyped, spFlags: 0)
!1322 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1323, file: !1227, line: 129)
!1323 = !DISubprogram(name: "putchar", scope: !1230, file: !1230, line: 614, type: !66, flags: DIFlagPrototyped, spFlags: 0)
!1324 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1325, file: !1227, line: 130)
!1325 = !DISubprogram(name: "puts", scope: !1230, file: !1230, line: 719, type: !444, flags: DIFlagPrototyped, spFlags: 0)
!1326 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1327, file: !1227, line: 131)
!1327 = !DISubprogram(name: "remove", scope: !1230, file: !1230, line: 157, type: !444, flags: DIFlagPrototyped, spFlags: 0)
!1328 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1329, file: !1227, line: 132)
!1329 = !DISubprogram(name: "rename", scope: !1230, file: !1230, line: 159, type: !1330, flags: DIFlagPrototyped, spFlags: 0)
!1330 = !DISubroutineType(types: !1331)
!1331 = !{!9, !310, !310}
!1332 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1333, file: !1227, line: 133)
!1333 = !DISubprogram(name: "rewind", scope: !1230, file: !1230, line: 781, type: !1236, flags: DIFlagPrototyped, spFlags: 0)
!1334 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1335, file: !1227, line: 134)
!1335 = !DISubprogram(name: "scanf", linkageName: "__isoc23_scanf", scope: !1230, file: !1230, line: 443, type: !1318, flags: DIFlagPrototyped, spFlags: 0)
!1336 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1337, file: !1227, line: 135)
!1337 = !DISubprogram(name: "setbuf", scope: !1230, file: !1230, line: 333, type: !1338, flags: DIFlagPrototyped, spFlags: 0)
!1338 = !DISubroutineType(types: !1339)
!1339 = !{null, !1255, !545}
!1340 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1341, file: !1227, line: 136)
!1341 = !DISubprogram(name: "setvbuf", scope: !1230, file: !1230, line: 337, type: !1342, flags: DIFlagPrototyped, spFlags: 0)
!1342 = !DISubroutineType(types: !1343)
!1343 = !{!9, !1255, !545, !9, !430}
!1344 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1345, file: !1227, line: 137)
!1345 = !DISubprogram(name: "sprintf", scope: !1230, file: !1230, line: 363, type: !1346, flags: DIFlagPrototyped, spFlags: 0)
!1346 = !DISubroutineType(types: !1347)
!1347 = !{!9, !545, !502, null}
!1348 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1349, file: !1227, line: 138)
!1349 = !DISubprogram(name: "sscanf", linkageName: "__isoc23_sscanf", scope: !1230, file: !1230, line: 445, type: !1350, flags: DIFlagPrototyped, spFlags: 0)
!1350 = !DISubroutineType(types: !1351)
!1351 = !{!9, !502, !502, null}
!1352 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1353, file: !1227, line: 139)
!1353 = !DISubprogram(name: "tmpfile", scope: !1230, file: !1230, line: 193, type: !1354, flags: DIFlagPrototyped, spFlags: 0)
!1354 = !DISubroutineType(types: !1355)
!1355 = !{!1238}
!1356 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1357, file: !1227, line: 141)
!1357 = !DISubprogram(name: "tmpnam", scope: !1230, file: !1230, line: 210, type: !1358, flags: DIFlagPrototyped, spFlags: 0)
!1358 = !DISubroutineType(types: !1359)
!1359 = !{!478, !478}
!1360 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1361, file: !1227, line: 143)
!1361 = !DISubprogram(name: "ungetc", scope: !1230, file: !1230, line: 726, type: !1272, flags: DIFlagPrototyped, spFlags: 0)
!1362 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1363, file: !1227, line: 144)
!1363 = !DISubprogram(name: "vfprintf", scope: !1230, file: !1230, line: 370, type: !1364, flags: DIFlagPrototyped, spFlags: 0)
!1364 = !DISubroutineType(types: !1365)
!1365 = !{!9, !1255, !502, !1026}
!1366 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1367, file: !1227, line: 145)
!1367 = !DISubprogram(name: "vprintf", scope: !1230, file: !1230, line: 376, type: !1368, flags: DIFlagPrototyped, spFlags: 0)
!1368 = !DISubroutineType(types: !1369)
!1369 = !{!9, !502, !1026}
!1370 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1371, file: !1227, line: 146)
!1371 = !DISubprogram(name: "vsprintf", scope: !1230, file: !1230, line: 378, type: !1372, flags: DIFlagPrototyped, spFlags: 0)
!1372 = !DISubroutineType(types: !1373)
!1373 = !{!9, !545, !502, !1026}
!1374 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !554, entity: !1375, file: !1227, line: 175)
!1375 = !DISubprogram(name: "snprintf", scope: !1230, file: !1230, line: 383, type: !1376, flags: DIFlagPrototyped, spFlags: 0)
!1376 = !DISubroutineType(types: !1377)
!1377 = !{!9, !545, !430, !502, null}
!1378 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !554, entity: !1379, file: !1227, line: 176)
!1379 = !DISubprogram(name: "vfscanf", linkageName: "__isoc23_vfscanf", scope: !1230, file: !1230, line: 507, type: !1364, flags: DIFlagPrototyped, spFlags: 0)
!1380 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !554, entity: !1381, file: !1227, line: 177)
!1381 = !DISubprogram(name: "vscanf", linkageName: "__isoc23_vscanf", scope: !1230, file: !1230, line: 512, type: !1368, flags: DIFlagPrototyped, spFlags: 0)
!1382 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !554, entity: !1383, file: !1227, line: 178)
!1383 = !DISubprogram(name: "vsnprintf", scope: !1230, file: !1230, line: 387, type: !1384, flags: DIFlagPrototyped, spFlags: 0)
!1384 = !DISubroutineType(types: !1385)
!1385 = !{!9, !545, !430, !502, !1026}
!1386 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !554, entity: !1387, file: !1227, line: 179)
!1387 = !DISubprogram(name: "vsscanf", linkageName: "__isoc23_vsscanf", scope: !1230, file: !1230, line: 515, type: !1388, flags: DIFlagPrototyped, spFlags: 0)
!1388 = !DISubroutineType(types: !1389)
!1389 = !{!9, !502, !502, !1026}
!1390 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1375, file: !1227, line: 185)
!1391 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1379, file: !1227, line: 186)
!1392 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1381, file: !1227, line: 187)
!1393 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1383, file: !1227, line: 188)
!1394 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1387, file: !1227, line: 189)
!1395 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1396, file: !1402, line: 58)
!1396 = !DIDerivedType(tag: DW_TAG_typedef, name: "max_align_t", file: !1397, line: 24, baseType: !1398)
!1397 = !DIFile(filename: "/opt/rocm-6.4.2/lib/llvm/lib/clang/19/include/__stddef_max_align_t.h", directory: "", checksumkind: CSK_MD5, checksum: "3c0a2f19d136d39aa835c737c7105def")
!1398 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1397, line: 19, size: 128, flags: DIFlagTypePassByValue, elements: !1399, identifier: "_ZTS11max_align_t")
!1399 = !{!1400, !1401}
!1400 = !DIDerivedType(tag: DW_TAG_member, name: "__clang_max_align_nonce1", scope: !1398, file: !1397, line: 20, baseType: !254, size: 64, align: 64)
!1401 = !DIDerivedType(tag: DW_TAG_member, name: "__clang_max_align_nonce2", scope: !1398, file: !1397, line: 22, baseType: !143, size: 64, align: 64, offset: 64)
!1402 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/cstddef", directory: "")
!1403 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1404, file: !1409, line: 82)
!1404 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctrans_t", file: !1405, line: 48, baseType: !1406)
!1405 = !DIFile(filename: "/usr/include/wctype.h", directory: "", checksumkind: CSK_MD5, checksum: "93d4b1045b46d132ff5e6d83a26abaee")
!1406 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1407, size: 64)
!1407 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1408)
!1408 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !46, line: 41, baseType: !9)
!1409 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/cwctype", directory: "")
!1410 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1411, file: !1409, line: 83)
!1411 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctype_t", file: !1412, line: 38, baseType: !432)
!1412 = !DIFile(filename: "/usr/include/bits/wctype-wchar.h", directory: "", checksumkind: CSK_MD5, checksum: "65a194b61bfadb7760be04a5640f774f")
!1413 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !938, file: !1409, line: 84)
!1414 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1415, file: !1409, line: 86)
!1415 = !DISubprogram(name: "iswalnum", scope: !1412, file: !1412, line: 95, type: !1123, flags: DIFlagPrototyped, spFlags: 0)
!1416 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1417, file: !1409, line: 87)
!1417 = !DISubprogram(name: "iswalpha", scope: !1412, file: !1412, line: 101, type: !1123, flags: DIFlagPrototyped, spFlags: 0)
!1418 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1419, file: !1409, line: 89)
!1419 = !DISubprogram(name: "iswblank", scope: !1412, file: !1412, line: 146, type: !1123, flags: DIFlagPrototyped, spFlags: 0)
!1420 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1421, file: !1409, line: 91)
!1421 = !DISubprogram(name: "iswcntrl", scope: !1412, file: !1412, line: 104, type: !1123, flags: DIFlagPrototyped, spFlags: 0)
!1422 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1423, file: !1409, line: 92)
!1423 = !DISubprogram(name: "iswctype", scope: !1412, file: !1412, line: 159, type: !1424, flags: DIFlagPrototyped, spFlags: 0)
!1424 = !DISubroutineType(types: !1425)
!1425 = !{!9, !938, !1411}
!1426 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1427, file: !1409, line: 93)
!1427 = !DISubprogram(name: "iswdigit", scope: !1412, file: !1412, line: 108, type: !1123, flags: DIFlagPrototyped, spFlags: 0)
!1428 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1429, file: !1409, line: 94)
!1429 = !DISubprogram(name: "iswgraph", scope: !1412, file: !1412, line: 112, type: !1123, flags: DIFlagPrototyped, spFlags: 0)
!1430 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1431, file: !1409, line: 95)
!1431 = !DISubprogram(name: "iswlower", scope: !1412, file: !1412, line: 117, type: !1123, flags: DIFlagPrototyped, spFlags: 0)
!1432 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1433, file: !1409, line: 96)
!1433 = !DISubprogram(name: "iswprint", scope: !1412, file: !1412, line: 120, type: !1123, flags: DIFlagPrototyped, spFlags: 0)
!1434 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1435, file: !1409, line: 97)
!1435 = !DISubprogram(name: "iswpunct", scope: !1412, file: !1412, line: 125, type: !1123, flags: DIFlagPrototyped, spFlags: 0)
!1436 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1437, file: !1409, line: 98)
!1437 = !DISubprogram(name: "iswspace", scope: !1412, file: !1412, line: 130, type: !1123, flags: DIFlagPrototyped, spFlags: 0)
!1438 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1439, file: !1409, line: 99)
!1439 = !DISubprogram(name: "iswupper", scope: !1412, file: !1412, line: 135, type: !1123, flags: DIFlagPrototyped, spFlags: 0)
!1440 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1441, file: !1409, line: 100)
!1441 = !DISubprogram(name: "iswxdigit", scope: !1412, file: !1412, line: 140, type: !1123, flags: DIFlagPrototyped, spFlags: 0)
!1442 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1443, file: !1409, line: 101)
!1443 = !DISubprogram(name: "towctrans", scope: !1405, file: !1405, line: 55, type: !1444, flags: DIFlagPrototyped, spFlags: 0)
!1444 = !DISubroutineType(types: !1445)
!1445 = !{!938, !938, !1404}
!1446 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1447, file: !1409, line: 102)
!1447 = !DISubprogram(name: "towlower", scope: !1412, file: !1412, line: 166, type: !1448, flags: DIFlagPrototyped, spFlags: 0)
!1448 = !DISubroutineType(types: !1449)
!1449 = !{!938, !938}
!1450 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1451, file: !1409, line: 103)
!1451 = !DISubprogram(name: "towupper", scope: !1412, file: !1412, line: 169, type: !1448, flags: DIFlagPrototyped, spFlags: 0)
!1452 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1453, file: !1409, line: 104)
!1453 = !DISubprogram(name: "wctrans", scope: !1405, file: !1405, line: 52, type: !1454, flags: DIFlagPrototyped, spFlags: 0)
!1454 = !DISubroutineType(types: !1455)
!1455 = !{!1404, !310}
!1456 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1457, file: !1409, line: 105)
!1457 = !DISubprogram(name: "wctype", scope: !1412, file: !1412, line: 155, type: !1458, flags: DIFlagPrototyped, spFlags: 0)
!1458 = !DISubroutineType(types: !1459)
!1459 = !{!1411, !310}
!1460 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1461, file: !1465, line: 51)
!1461 = !DIDerivedType(tag: DW_TAG_typedef, name: "int8_t", file: !1462, line: 24, baseType: !1463)
!1462 = !DIFile(filename: "/usr/include/bits/stdint-intn.h", directory: "", checksumkind: CSK_MD5, checksum: "85f68316edee664d7bd685b977adf677")
!1463 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int8_t", file: !46, line: 37, baseType: !1464)
!1464 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!1465 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/cstdint", directory: "")
!1466 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1467, file: !1465, line: 52)
!1467 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !1462, line: 25, baseType: !1468)
!1468 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int16_t", file: !46, line: 39, baseType: !1469)
!1469 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!1470 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1471, file: !1465, line: 53)
!1471 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !1462, line: 26, baseType: !1408)
!1472 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1473, file: !1465, line: 54)
!1473 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !1462, line: 27, baseType: !1474)
!1474 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !46, line: 44, baseType: !291)
!1475 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1476, file: !1465, line: 56)
!1476 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast8_t", file: !1477, line: 58, baseType: !1464)
!1477 = !DIFile(filename: "/usr/include/stdint.h", directory: "", checksumkind: CSK_MD5, checksum: "e1a448af0fce22a39bc183d2915834c7")
!1478 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1479, file: !1465, line: 57)
!1479 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast16_t", file: !1477, line: 60, baseType: !291)
!1480 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1481, file: !1465, line: 58)
!1481 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast32_t", file: !1477, line: 61, baseType: !291)
!1482 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1483, file: !1465, line: 59)
!1483 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast64_t", file: !1477, line: 62, baseType: !291)
!1484 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1485, file: !1465, line: 61)
!1485 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least8_t", file: !1477, line: 43, baseType: !1486)
!1486 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least8_t", file: !46, line: 52, baseType: !1463)
!1487 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1488, file: !1465, line: 62)
!1488 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least16_t", file: !1477, line: 44, baseType: !1489)
!1489 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least16_t", file: !46, line: 54, baseType: !1468)
!1490 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1491, file: !1465, line: 63)
!1491 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least32_t", file: !1477, line: 45, baseType: !1492)
!1492 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least32_t", file: !46, line: 56, baseType: !1408)
!1493 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1494, file: !1465, line: 64)
!1494 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least64_t", file: !1477, line: 46, baseType: !1495)
!1495 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least64_t", file: !46, line: 58, baseType: !1474)
!1496 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1497, file: !1465, line: 66)
!1497 = !DIDerivedType(tag: DW_TAG_typedef, name: "intmax_t", file: !1477, line: 101, baseType: !1498)
!1498 = !DIDerivedType(tag: DW_TAG_typedef, name: "__intmax_t", file: !46, line: 72, baseType: !291)
!1499 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1500, file: !1465, line: 67)
!1500 = !DIDerivedType(tag: DW_TAG_typedef, name: "intptr_t", file: !1477, line: 87, baseType: !291)
!1501 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1502, file: !1465, line: 69)
!1502 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !44, line: 24, baseType: !1503)
!1503 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !46, line: 38, baseType: !1504)
!1504 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!1505 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1506, file: !1465, line: 70)
!1506 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !44, line: 25, baseType: !1507)
!1507 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !46, line: 40, baseType: !1508)
!1508 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!1509 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !43, file: !1465, line: 71)
!1510 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1511, file: !1465, line: 72)
!1511 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !44, line: 27, baseType: !1512)
!1512 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint64_t", file: !46, line: 45, baseType: !432)
!1513 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1514, file: !1465, line: 74)
!1514 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast8_t", file: !1477, line: 71, baseType: !1504)
!1515 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1516, file: !1465, line: 75)
!1516 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast16_t", file: !1477, line: 73, baseType: !432)
!1517 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1518, file: !1465, line: 76)
!1518 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast32_t", file: !1477, line: 74, baseType: !432)
!1519 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1520, file: !1465, line: 77)
!1520 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast64_t", file: !1477, line: 75, baseType: !432)
!1521 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1522, file: !1465, line: 79)
!1522 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least8_t", file: !1477, line: 49, baseType: !1523)
!1523 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least8_t", file: !46, line: 53, baseType: !1503)
!1524 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1525, file: !1465, line: 80)
!1525 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least16_t", file: !1477, line: 50, baseType: !1526)
!1526 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least16_t", file: !46, line: 55, baseType: !1507)
!1527 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1528, file: !1465, line: 81)
!1528 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least32_t", file: !1477, line: 51, baseType: !1529)
!1529 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least32_t", file: !46, line: 57, baseType: !45)
!1530 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1531, file: !1465, line: 82)
!1531 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least64_t", file: !1477, line: 52, baseType: !1532)
!1532 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least64_t", file: !46, line: 59, baseType: !1512)
!1533 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1534, file: !1465, line: 84)
!1534 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintmax_t", file: !1477, line: 102, baseType: !1535)
!1535 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uintmax_t", file: !46, line: 73, baseType: !432)
!1536 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1537, file: !1465, line: 85)
!1537 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintptr_t", file: !1477, line: 90, baseType: !432)
!1538 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1539, file: !1542, line: 60)
!1539 = !DIDerivedType(tag: DW_TAG_typedef, name: "clock_t", file: !1540, line: 7, baseType: !1541)
!1540 = !DIFile(filename: "/usr/include/bits/types/clock_t.h", directory: "", checksumkind: CSK_MD5, checksum: "1aade99fd778d1551600c7ca1410b9f1")
!1541 = !DIDerivedType(tag: DW_TAG_typedef, name: "__clock_t", file: !46, line: 156, baseType: !291)
!1542 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/ctime", directory: "")
!1543 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1544, file: !1542, line: 61)
!1544 = !DIDerivedType(tag: DW_TAG_typedef, name: "time_t", file: !1545, line: 10, baseType: !1546)
!1545 = !DIFile(filename: "/usr/include/bits/types/time_t.h", directory: "", checksumkind: CSK_MD5, checksum: "5c299a4954617c88bb03645c7864e1b1")
!1546 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !46, line: 160, baseType: !291)
!1547 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1072, file: !1542, line: 62)
!1548 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1549, file: !1542, line: 64)
!1549 = !DISubprogram(name: "clock", scope: !1550, file: !1550, line: 72, type: !1551, flags: DIFlagPrototyped, spFlags: 0)
!1550 = !DIFile(filename: "/usr/include/time.h", directory: "", checksumkind: CSK_MD5, checksum: "19daa87a550fdc2d68d9b199f5473f94")
!1551 = !DISubroutineType(types: !1552)
!1552 = !{!1539}
!1553 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1554, file: !1542, line: 65)
!1554 = !DISubprogram(name: "difftime", scope: !1550, file: !1550, line: 79, type: !1555, flags: DIFlagPrototyped, spFlags: 0)
!1555 = !DISubroutineType(types: !1556)
!1556 = !{!74, !1544, !1544}
!1557 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1558, file: !1542, line: 66)
!1558 = !DISubprogram(name: "mktime", scope: !1550, file: !1550, line: 83, type: !1559, flags: DIFlagPrototyped, spFlags: 0)
!1559 = !DISubroutineType(types: !1560)
!1560 = !{!1544, !1561}
!1561 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1072, size: 64)
!1562 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1563, file: !1542, line: 67)
!1563 = !DISubprogram(name: "time", scope: !1550, file: !1550, line: 76, type: !1564, flags: DIFlagPrototyped, spFlags: 0)
!1564 = !DISubroutineType(types: !1565)
!1565 = !{!1544, !1566}
!1566 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1544, size: 64)
!1567 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1568, file: !1542, line: 68)
!1568 = !DISubprogram(name: "asctime", scope: !1550, file: !1550, line: 180, type: !1569, flags: DIFlagPrototyped, spFlags: 0)
!1569 = !DISubroutineType(types: !1570)
!1570 = !{!478, !1070}
!1571 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1572, file: !1542, line: 69)
!1572 = !DISubprogram(name: "ctime", scope: !1550, file: !1550, line: 184, type: !1573, flags: DIFlagPrototyped, spFlags: 0)
!1573 = !DISubroutineType(types: !1574)
!1574 = !{!478, !1575}
!1575 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1576, size: 64)
!1576 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1544)
!1577 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1578, file: !1542, line: 70)
!1578 = !DISubprogram(name: "gmtime", scope: !1550, file: !1550, line: 133, type: !1579, flags: DIFlagPrototyped, spFlags: 0)
!1579 = !DISubroutineType(types: !1580)
!1580 = !{!1561, !1575}
!1581 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1582, file: !1542, line: 71)
!1582 = !DISubprogram(name: "localtime", scope: !1550, file: !1550, line: 137, type: !1579, flags: DIFlagPrototyped, spFlags: 0)
!1583 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1584, file: !1542, line: 72)
!1584 = !DISubprogram(name: "strftime", scope: !1550, file: !1550, line: 100, type: !1585, flags: DIFlagPrototyped, spFlags: 0)
!1585 = !DISubroutineType(types: !1586)
!1586 = !{!430, !545, !430, !502, !1069}
!1587 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1588, file: !1542, line: 79)
!1588 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timespec", file: !1589, line: 11, size: 128, flags: DIFlagTypePassByValue, elements: !1590, identifier: "_ZTS8timespec")
!1589 = !DIFile(filename: "/usr/include/bits/types/struct_timespec.h", directory: "", checksumkind: CSK_MD5, checksum: "55dc154df3f21a5aa944dcafba9b43f6")
!1590 = !{!1591, !1592}
!1591 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !1588, file: !1589, line: 16, baseType: !1546, size: 64)
!1592 = !DIDerivedType(tag: DW_TAG_member, name: "tv_nsec", scope: !1588, file: !1589, line: 21, baseType: !1593, size: 64, offset: 64)
!1593 = !DIDerivedType(tag: DW_TAG_typedef, name: "__syscall_slong_t", file: !46, line: 197, baseType: !291)
!1594 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !63, entity: !1595, file: !1542, line: 80)
!1595 = !DISubprogram(name: "timespec_get", scope: !1550, file: !1550, line: 384, type: !1596, flags: DIFlagPrototyped, spFlags: 0)
!1596 = !DISubroutineType(types: !1597)
!1597 = !{!9, !1598, !9}
!1598 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1588, size: 64)
!1599 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !1600, entity: !1601, file: !1603, line: 1436)
!1600 = !DINamespace(name: "chrono", scope: !63)
!1601 = !DINamespace(name: "chrono_literals", scope: !1602, exportSymbols: true)
!1602 = !DINamespace(name: "literals", scope: !63, exportSymbols: true)
!1603 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/bits/chrono.h", directory: "")
!1604 = !{!1605, !1606, !1607, !1608, !1609, !1610, !1611, !1612, !1613, !1614, !1615, !1616, !1617, !1618, !1619, !1620, !1621, !1622, !1623, !1624, !1625, !1626, !1627, !1628, !1629, !1630, !1631, !1632, !1633, !1634, !1636, !1639, !1640, !1643, !1644, !1645, !1646, !1647, !1650, !1653, !1656, !1657, !1660}
!1605 = !DILocalVariable(name: "gpuWall", arg: 1, scope: !2, file: !3, line: 45, type: !6)
!1606 = !DILocalVariable(name: "gpuSrc", arg: 2, scope: !2, file: !3, line: 46, type: !6)
!1607 = !DILocalVariable(name: "gpuResult", arg: 3, scope: !2, file: !3, line: 47, type: !10)
!1608 = !DILocalVariable(name: "outputBuffer", arg: 4, scope: !2, file: !3, line: 48, type: !10)
!1609 = !DILocalVariable(name: "runtimeRecords", arg: 5, scope: !2, file: !3, line: 49, type: !12)
!1610 = !DILocalVariable(name: "runtimeRecordSlots", arg: 6, scope: !2, file: !3, line: 50, type: !32)
!1611 = !DILocalVariable(name: "totalComputedThreads", arg: 7, scope: !2, file: !3, line: 51, type: !32)
!1612 = !DILocalVariable(name: "totalFinalWrites", arg: 8, scope: !2, file: !3, line: 52, type: !32)
!1613 = !DILocalVariable(name: "iteration", arg: 9, scope: !2, file: !3, line: 53, type: !8)
!1614 = !DILocalVariable(name: "theHalo", arg: 10, scope: !2, file: !3, line: 54, type: !8)
!1615 = !DILocalVariable(name: "borderCols", arg: 11, scope: !2, file: !3, line: 55, type: !8)
!1616 = !DILocalVariable(name: "cols", arg: 12, scope: !2, file: !3, line: 56, type: !8)
!1617 = !DILocalVariable(name: "t", arg: 13, scope: !2, file: !3, line: 57, type: !8)
!1618 = !DILocalVariable(name: "BLOCK_SIZE", scope: !2, file: !3, line: 59, type: !9)
!1619 = !DILocalVariable(name: "bx", scope: !2, file: !3, line: 60, type: !9)
!1620 = !DILocalVariable(name: "tx", scope: !2, file: !3, line: 61, type: !9)
!1621 = !DILocalVariable(name: "expected_small_block_cols", scope: !2, file: !3, line: 71, type: !9)
!1622 = !DILocalVariable(name: "small_block_cols", scope: !2, file: !3, line: 66, type: !9)
!1623 = !DILocalVariable(name: "blkX", scope: !2, file: !3, line: 71, type: !9)
!1624 = !DILocalVariable(name: "blkXmax", scope: !2, file: !3, line: 72, type: !9)
!1625 = !DILocalVariable(name: "xidx", scope: !2, file: !3, line: 75, type: !9)
!1626 = !DILocalVariable(name: "validXmin", scope: !2, file: !3, line: 80, type: !9)
!1627 = !DILocalVariable(name: "validXmax", scope: !2, file: !3, line: 81, type: !9)
!1628 = !DILocalVariable(name: "W", scope: !2, file: !3, line: 83, type: !9)
!1629 = !DILocalVariable(name: "E", scope: !2, file: !3, line: 84, type: !9)
!1630 = !DILocalVariable(name: "isValid", scope: !2, file: !3, line: 89, type: !705)
!1631 = !DILocalVariable(name: "computed", scope: !2, file: !3, line: 98, type: !705)
!1632 = !DILocalVariable(name: "lastDebugIndex", scope: !2, file: !3, line: 99, type: !9)
!1633 = !DILocalVariable(name: "lastDebugValue", scope: !2, file: !3, line: 100, type: !9)
!1634 = !DILocalVariable(name: "i", scope: !1635, file: !3, line: 101, type: !9)
!1635 = distinct !DILexicalBlock(scope: !2, file: !3, line: 101, column: 3)
!1636 = !DILocalVariable(name: "debugIndex", scope: !1637, file: !3, line: 104, type: !9)
!1637 = distinct !DILexicalBlock(scope: !1638, file: !3, line: 102, column: 3)
!1638 = distinct !DILexicalBlock(scope: !1635, file: !3, line: 101, column: 3)
!1639 = !DILocalVariable(name: "debugValue", scope: !1637, file: !3, line: 105, type: !9)
!1640 = !DILocalVariable(name: "left", scope: !1641, file: !3, line: 110, type: !9)
!1641 = distinct !DILexicalBlock(scope: !1642, file: !3, line: 108, column: 5)
!1642 = distinct !DILexicalBlock(scope: !1637, file: !3, line: 107, column: 9)
!1643 = !DILocalVariable(name: "up", scope: !1641, file: !3, line: 111, type: !9)
!1644 = !DILocalVariable(name: "right", scope: !1641, file: !3, line: 112, type: !9)
!1645 = !DILocalVariable(name: "shortest", scope: !1641, file: !3, line: 113, type: !9)
!1646 = !DILocalVariable(name: "index", scope: !1641, file: !3, line: 116, type: !9)
!1647 = !DILocalVariable(name: "slot", scope: !1648, file: !3, line: 126, type: !33)
!1648 = distinct !DILexicalBlock(scope: !1649, file: !3, line: 125, column: 7)
!1649 = distinct !DILexicalBlock(scope: !1641, file: !3, line: 124, column: 11)
!1650 = !DILocalVariable(name: "rec", scope: !1651, file: !3, line: 129, type: !13)
!1651 = distinct !DILexicalBlock(scope: !1652, file: !3, line: 128, column: 9)
!1652 = distinct !DILexicalBlock(scope: !1648, file: !3, line: 127, column: 13)
!1653 = !DILocalVariable(name: "bufIndex", scope: !1654, file: !3, line: 155, type: !9)
!1654 = distinct !DILexicalBlock(scope: !1655, file: !3, line: 153, column: 7)
!1655 = distinct !DILexicalBlock(scope: !1641, file: !3, line: 152, column: 11)
!1656 = !DILocalVariable(name: "final_write", scope: !2, file: !3, line: 182, type: !705)
!1657 = !DILocalVariable(name: "slot", scope: !1658, file: !3, line: 191, type: !33)
!1658 = distinct !DILexicalBlock(scope: !1659, file: !3, line: 190, column: 3)
!1659 = distinct !DILexicalBlock(scope: !2, file: !3, line: 189, column: 7)
!1660 = !DILocalVariable(name: "rec", scope: !1661, file: !3, line: 194, type: !13)
!1661 = distinct !DILexicalBlock(scope: !1662, file: !3, line: 193, column: 5)
!1662 = distinct !DILexicalBlock(scope: !1658, file: !3, line: 192, column: 9)
!1663 = !{i32 1, !"amdhsa_code_object_version", i32 600}
!1664 = !{i32 1, !"amdgpu_printf_kind", !"hostcall"}
!1665 = !{i32 7, !"Dwarf Version", i32 5}
!1666 = !{i32 2, !"Debug Info Version", i32 3}
!1667 = !{i32 1, !"wchar_size", i32 4}
!1668 = !{i32 8, !"PIC Level", i32 2}
!1669 = !{i32 7, !"frame-pointer", i32 2}
!1670 = !{!"AMD clang version 19.0.0git (https://github.com/RadeonOpenCompute/llvm-project roc-6.4.2 25224 d366fa84f3fdcbd4b10847ebd5db572ae12a34fb)"}
!1671 = !{i32 2, i32 0}
!1672 = distinct !DISubprogram(name: "__cxa_pure_virtual", scope: !1673, file: !1673, line: 37, type: !423, scopeLine: 37, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagDefinition, unit: !34)
!1673 = !DIFile(filename: "/opt/rocm-6.4.2/lib/llvm/lib/clang/19/include/__clang_hip_runtime_wrapper.h", directory: "", checksumkind: CSK_MD5, checksum: "3b4af0bdaa6ccc1fa2b6e310d2157303")
!1674 = !DILocation(line: 38, column: 5, scope: !1672)
!1675 = !DILocation(line: 39, column: 3, scope: !1672)
!1676 = distinct !DISubprogram(name: "__cxa_deleted_virtual", scope: !1673, file: !1673, line: 43, type: !423, scopeLine: 43, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagDefinition, unit: !34)
!1677 = !DILocation(line: 44, column: 5, scope: !1676)
!1678 = !DILocation(line: 45, column: 3, scope: !1676)
!1679 = distinct !DISubprogram(name: "__assert_fail", scope: !1680, file: !1680, line: 44, type: !1681, scopeLine: 48, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !34, retainedNodes: !1683)
!1680 = !DIFile(filename: "/opt/rocm-6.4.2/include/hip/amd_detail/hip_assert.h", directory: "", checksumkind: CSK_MD5, checksum: "a705f3fd54b4159bc676e001f217fb77")
!1681 = !DISubroutineType(types: !1682)
!1682 = !{null, !310, !310, !33, !310}
!1683 = !{!1684, !1685, !1686, !1687, !1688, !1692, !1693, !1694, !1696, !1698, !1700}
!1684 = !DILocalVariable(name: "assertion", arg: 1, scope: !1679, file: !1680, line: 44, type: !310)
!1685 = !DILocalVariable(name: "file", arg: 2, scope: !1679, file: !1680, line: 45, type: !310)
!1686 = !DILocalVariable(name: "line", arg: 3, scope: !1679, file: !1680, line: 46, type: !33)
!1687 = !DILocalVariable(name: "function", arg: 4, scope: !1679, file: !1680, line: 47, type: !310)
!1688 = !DILocalVariable(name: "fmt", scope: !1679, file: !1680, line: 49, type: !1689)
!1689 = !DICompositeType(tag: DW_TAG_array_type, baseType: !311, size: 376, elements: !1690)
!1690 = !{!1691}
!1691 = !DISubrange(count: 47)
!1692 = !DILocalVariable(name: "msg", scope: !1679, file: !1680, line: 68, type: !1511)
!1693 = !DILocalVariable(name: "len", scope: !1679, file: !1680, line: 69, type: !9)
!1694 = !DILocalVariable(name: "tmp", scope: !1695, file: !1680, line: 70, type: !310)
!1695 = distinct !DILexicalBlock(scope: !1679, file: !1680, line: 70, column: 3)
!1696 = !DILocalVariable(name: "tmp", scope: !1697, file: !1680, line: 72, type: !310)
!1697 = distinct !DILexicalBlock(scope: !1679, file: !1680, line: 72, column: 3)
!1698 = !DILocalVariable(name: "tmp", scope: !1699, file: !1680, line: 75, type: !310)
!1699 = distinct !DILexicalBlock(scope: !1679, file: !1680, line: 75, column: 3)
!1700 = !DILocalVariable(name: "tmp", scope: !1701, file: !1680, line: 77, type: !310)
!1701 = distinct !DILexicalBlock(scope: !1679, file: !1680, line: 77, column: 3)
!1702 = !DILocation(line: 44, column: 32, scope: !1679)
!1703 = !DILocation(line: 45, column: 32, scope: !1679)
!1704 = !DILocation(line: 46, column: 33, scope: !1679)
!1705 = !DILocation(line: 47, column: 32, scope: !1679)
!1706 = !DILocation(line: 49, column: 14, scope: !1679)
!1707 = !DILocation(line: 68, column: 8, scope: !1679)
!1708 = !DILocation(line: 68, column: 14, scope: !1679)
!1709 = !DILocation(line: 69, column: 7, scope: !1679)
!1710 = !DILocation(line: 70, column: 3, scope: !1679)
!1711 = !DILocation(line: 70, column: 3, scope: !1695)
!1712 = distinct !{!1712, !1711, !1711, !1713}
!1713 = !{!"llvm.loop.mustprogress"}
!1714 = !DILocation(line: 71, column: 40, scope: !1679)
!1715 = !DILocation(line: 71, column: 45, scope: !1679)
!1716 = !DILocation(line: 71, column: 50, scope: !1679)
!1717 = !DILocation(line: 71, column: 9, scope: !1679)
!1718 = !DILocation(line: 71, column: 7, scope: !1679)
!1719 = !DILocation(line: 72, column: 3, scope: !1679)
!1720 = !DILocation(line: 72, column: 3, scope: !1697)
!1721 = distinct !{!1721, !1720, !1720, !1713}
!1722 = !DILocation(line: 73, column: 40, scope: !1679)
!1723 = !DILocation(line: 73, column: 45, scope: !1679)
!1724 = !DILocation(line: 73, column: 51, scope: !1679)
!1725 = !DILocation(line: 73, column: 9, scope: !1679)
!1726 = !DILocation(line: 73, column: 7, scope: !1679)
!1727 = !DILocation(line: 74, column: 36, scope: !1679)
!1728 = !DILocation(line: 74, column: 44, scope: !1679)
!1729 = !DILocation(line: 74, column: 9, scope: !1679)
!1730 = !DILocation(line: 74, column: 7, scope: !1679)
!1731 = !DILocation(line: 75, column: 3, scope: !1679)
!1732 = !DILocation(line: 75, column: 3, scope: !1699)
!1733 = distinct !{!1733, !1732, !1732, !1713}
!1734 = !DILocation(line: 76, column: 40, scope: !1679)
!1735 = !DILocation(line: 76, column: 45, scope: !1679)
!1736 = !DILocation(line: 76, column: 55, scope: !1679)
!1737 = !DILocation(line: 76, column: 9, scope: !1679)
!1738 = !DILocation(line: 76, column: 7, scope: !1679)
!1739 = !DILocation(line: 77, column: 3, scope: !1679)
!1740 = !DILocation(line: 77, column: 3, scope: !1701)
!1741 = distinct !{!1741, !1740, !1740, !1713}
!1742 = !DILocation(line: 78, column: 34, scope: !1679)
!1743 = !DILocation(line: 78, column: 39, scope: !1679)
!1744 = !DILocation(line: 78, column: 50, scope: !1679)
!1745 = !DILocation(line: 78, column: 3, scope: !1679)
!1746 = !DILocation(line: 82, column: 3, scope: !1679)
!1747 = !DILocation(line: 83, column: 1, scope: !1679)
!1748 = distinct !DISubprogram(name: "__assertfail", scope: !1680, file: !1680, line: 86, type: !423, scopeLine: 87, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !34)
!1749 = !DILocation(line: 89, column: 5, scope: !1748)
!1750 = !DILocation(line: 90, column: 1, scope: !1748)
!1751 = !DILocation(line: 45, column: 28, scope: !2)
!1752 = !DILocation(line: 46, column: 28, scope: !2)
!1753 = !DILocation(line: 47, column: 28, scope: !2)
!1754 = !DILocation(line: 48, column: 28, scope: !2)
!1755 = !DILocation(line: 49, column: 34, scope: !2)
!1756 = !DILocation(line: 50, column: 25, scope: !2)
!1757 = !DILocation(line: 51, column: 25, scope: !2)
!1758 = !DILocation(line: 52, column: 25, scope: !2)
!1759 = !DILocation(line: 53, column: 15, scope: !2)
!1760 = !DILocation(line: 54, column: 15, scope: !2)
!1761 = !DILocation(line: 55, column: 15, scope: !2)
!1762 = !DILocation(line: 56, column: 15, scope: !2)
!1763 = !DILocation(line: 57, column: 15, scope: !2)
!1764 = !DILocation(line: 59, column: 7, scope: !2)
!1765 = !DILocation(line: 275, column: 58, scope: !1766, inlinedAt: !1770)
!1766 = distinct !DISubprogram(name: "__hip_get_block_dim_x", linkageName: "_ZL21__hip_get_block_dim_xv", scope: !1767, file: !1767, line: 275, type: !1768, scopeLine: 275, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !34)
!1767 = !DIFile(filename: "/opt/rocm-6.4.2/include/hip/amd_detail/amd_hip_runtime.h", directory: "", checksumkind: CSK_MD5, checksum: "38097f6211bac4e19f9ae3395b411f76")
!1768 = !DISubroutineType(types: !1769)
!1769 = !{!33}
!1770 = distinct !DILocation(line: 309, column: 3, scope: !1771, inlinedAt: !1783)
!1771 = distinct !DISubprogram(name: "__get_x", linkageName: "_ZN24__hip_builtin_blockDim_t7__get_xEv", scope: !1772, file: !1767, line: 309, type: !1768, scopeLine: 309, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !34, declaration: !1774)
!1772 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__hip_builtin_blockDim_t", file: !1767, line: 308, size: 8, flags: DIFlagTypePassByValue, elements: !1773, identifier: "_ZTS24__hip_builtin_blockDim_t")
!1773 = !{!1774, !1775, !1776, !1777}
!1774 = !DISubprogram(name: "__get_x", linkageName: "_ZN24__hip_builtin_blockDim_t7__get_xEv", scope: !1772, file: !1767, line: 309, type: !1768, scopeLine: 309, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!1775 = !DISubprogram(name: "__get_y", linkageName: "_ZN24__hip_builtin_blockDim_t7__get_yEv", scope: !1772, file: !1767, line: 310, type: !1768, scopeLine: 310, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!1776 = !DISubprogram(name: "__get_z", linkageName: "_ZN24__hip_builtin_blockDim_t7__get_zEv", scope: !1772, file: !1767, line: 311, type: !1768, scopeLine: 311, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!1777 = !DISubprogram(name: "operator dim3", linkageName: "_ZNK24__hip_builtin_blockDim_tcv4dim3Ev", scope: !1772, file: !1767, line: 313, type: !1778, scopeLine: 313, flags: DIFlagPrototyped, spFlags: 0)
!1778 = !DISubroutineType(types: !1779)
!1779 = !{!1780, !1781}
!1780 = !DIDerivedType(tag: DW_TAG_typedef, name: "dim3", file: !40, line: 1186, baseType: !39)
!1781 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1782, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1782 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1772)
!1783 = distinct !DILocation(line: 59, column: 20, scope: !2)
!1784 = !DILocation(line: 60, column: 7, scope: !2)
!1785 = !DILocation(line: 270, column: 58, scope: !1786, inlinedAt: !1787)
!1786 = distinct !DISubprogram(name: "__hip_get_block_idx_x", linkageName: "_ZL21__hip_get_block_idx_xv", scope: !1767, file: !1767, line: 270, type: !1768, scopeLine: 270, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !34)
!1787 = distinct !DILocation(line: 300, column: 3, scope: !1788, inlinedAt: !1799)
!1788 = distinct !DISubprogram(name: "__get_x", linkageName: "_ZN24__hip_builtin_blockIdx_t7__get_xEv", scope: !1789, file: !1767, line: 300, type: !1768, scopeLine: 300, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !34, declaration: !1791)
!1789 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__hip_builtin_blockIdx_t", file: !1767, line: 299, size: 8, flags: DIFlagTypePassByValue, elements: !1790, identifier: "_ZTS24__hip_builtin_blockIdx_t")
!1790 = !{!1791, !1792, !1793, !1794}
!1791 = !DISubprogram(name: "__get_x", linkageName: "_ZN24__hip_builtin_blockIdx_t7__get_xEv", scope: !1789, file: !1767, line: 300, type: !1768, scopeLine: 300, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!1792 = !DISubprogram(name: "__get_y", linkageName: "_ZN24__hip_builtin_blockIdx_t7__get_yEv", scope: !1789, file: !1767, line: 301, type: !1768, scopeLine: 301, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!1793 = !DISubprogram(name: "__get_z", linkageName: "_ZN24__hip_builtin_blockIdx_t7__get_zEv", scope: !1789, file: !1767, line: 302, type: !1768, scopeLine: 302, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!1794 = !DISubprogram(name: "operator dim3", linkageName: "_ZNK24__hip_builtin_blockIdx_tcv4dim3Ev", scope: !1789, file: !1767, line: 304, type: !1795, scopeLine: 304, flags: DIFlagPrototyped, spFlags: 0)
!1795 = !DISubroutineType(types: !1796)
!1796 = !{!1780, !1797}
!1797 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1798, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1798 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1789)
!1799 = distinct !DILocation(line: 60, column: 12, scope: !2)
!1800 = !DILocation(line: 61, column: 7, scope: !2)
!1801 = !DILocation(line: 265, column: 59, scope: !1802, inlinedAt: !1803)
!1802 = distinct !DISubprogram(name: "__hip_get_thread_idx_x", linkageName: "_ZL22__hip_get_thread_idx_xv", scope: !1767, file: !1767, line: 265, type: !1768, scopeLine: 265, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !34)
!1803 = distinct !DILocation(line: 291, column: 3, scope: !1804, inlinedAt: !1815)
!1804 = distinct !DISubprogram(name: "__get_x", linkageName: "_ZN25__hip_builtin_threadIdx_t7__get_xEv", scope: !1805, file: !1767, line: 291, type: !1768, scopeLine: 291, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !34, declaration: !1807)
!1805 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__hip_builtin_threadIdx_t", file: !1767, line: 290, size: 8, flags: DIFlagTypePassByValue, elements: !1806, identifier: "_ZTS25__hip_builtin_threadIdx_t")
!1806 = !{!1807, !1808, !1809, !1810}
!1807 = !DISubprogram(name: "__get_x", linkageName: "_ZN25__hip_builtin_threadIdx_t7__get_xEv", scope: !1805, file: !1767, line: 291, type: !1768, scopeLine: 291, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!1808 = !DISubprogram(name: "__get_y", linkageName: "_ZN25__hip_builtin_threadIdx_t7__get_yEv", scope: !1805, file: !1767, line: 292, type: !1768, scopeLine: 292, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!1809 = !DISubprogram(name: "__get_z", linkageName: "_ZN25__hip_builtin_threadIdx_t7__get_zEv", scope: !1805, file: !1767, line: 293, type: !1768, scopeLine: 293, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!1810 = !DISubprogram(name: "operator dim3", linkageName: "_ZNK25__hip_builtin_threadIdx_tcv4dim3Ev", scope: !1805, file: !1767, line: 295, type: !1811, scopeLine: 295, flags: DIFlagPrototyped, spFlags: 0)
!1811 = !DISubroutineType(types: !1812)
!1812 = !{!1780, !1813}
!1813 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1814, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1814 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1805)
!1815 = distinct !DILocation(line: 61, column: 12, scope: !2)
!1816 = !DILocation(line: 71, column: 7, scope: !2)
!1817 = !DILocation(line: 71, column: 35, scope: !2)
!1818 = !DILocation(line: 71, column: 49, scope: !2)
!1819 = !DILocation(line: 71, column: 59, scope: !2)
!1820 = !DILocation(line: 71, column: 58, scope: !2)
!1821 = !DILocation(line: 71, column: 66, scope: !2)
!1822 = !DILocation(line: 71, column: 46, scope: !2)
!1823 = !DILocation(line: 66, column: 7, scope: !2)
!1824 = !DILocation(line: 66, column: 26, scope: !2)
!1825 = !DILocation(line: 66, column: 40, scope: !2)
!1826 = !DILocation(line: 66, column: 50, scope: !2)
!1827 = !DILocation(line: 66, column: 49, scope: !2)
!1828 = !DILocation(line: 66, column: 57, scope: !2)
!1829 = !DILocation(line: 66, column: 37, scope: !2)
!1830 = !DILocation(line: 71, column: 15, scope: !2)
!1831 = !DILocation(line: 71, column: 32, scope: !2)
!1832 = !DILocation(line: 71, column: 31, scope: !2)
!1833 = !DILocation(line: 71, column: 38, scope: !2)
!1834 = !DILocation(line: 71, column: 36, scope: !2)
!1835 = !DILocation(line: 72, column: 7, scope: !2)
!1836 = !DILocation(line: 72, column: 17, scope: !2)
!1837 = !DILocation(line: 72, column: 22, scope: !2)
!1838 = !DILocation(line: 72, column: 21, scope: !2)
!1839 = !DILocation(line: 72, column: 32, scope: !2)
!1840 = !DILocation(line: 75, column: 7, scope: !2)
!1841 = !DILocation(line: 75, column: 14, scope: !2)
!1842 = !DILocation(line: 75, column: 19, scope: !2)
!1843 = !DILocation(line: 75, column: 18, scope: !2)
!1844 = !DILocation(line: 80, column: 7, scope: !2)
!1845 = !DILocation(line: 80, column: 20, scope: !2)
!1846 = !DILocation(line: 80, column: 25, scope: !2)
!1847 = !DILocation(line: 80, column: 19, scope: !2)
!1848 = !DILocation(line: 80, column: 33, scope: !2)
!1849 = !DILocation(line: 80, column: 32, scope: !2)
!1850 = !DILocation(line: 81, column: 7, scope: !2)
!1851 = !DILocation(line: 81, column: 20, scope: !2)
!1852 = !DILocation(line: 81, column: 30, scope: !2)
!1853 = !DILocation(line: 81, column: 34, scope: !2)
!1854 = !DILocation(line: 81, column: 28, scope: !2)
!1855 = !DILocation(line: 81, column: 19, scope: !2)
!1856 = !DILocation(line: 81, column: 40, scope: !2)
!1857 = !DILocation(line: 81, column: 50, scope: !2)
!1858 = !DILocation(line: 81, column: 54, scope: !2)
!1859 = !DILocation(line: 81, column: 62, scope: !2)
!1860 = !DILocation(line: 81, column: 61, scope: !2)
!1861 = !DILocation(line: 81, column: 66, scope: !2)
!1862 = !DILocation(line: 81, column: 52, scope: !2)
!1863 = !DILocation(line: 81, column: 72, scope: !2)
!1864 = !DILocation(line: 81, column: 82, scope: !2)
!1865 = !DILocation(line: 83, column: 7, scope: !2)
!1866 = !DILocation(line: 83, column: 11, scope: !2)
!1867 = !DILocation(line: 83, column: 13, scope: !2)
!1868 = !DILocation(line: 84, column: 7, scope: !2)
!1869 = !DILocation(line: 84, column: 11, scope: !2)
!1870 = !DILocation(line: 84, column: 13, scope: !2)
!1871 = !DILocation(line: 86, column: 8, scope: !2)
!1872 = !DILocation(line: 86, column: 12, scope: !2)
!1873 = !DILocation(line: 86, column: 10, scope: !2)
!1874 = !DILocation(line: 86, column: 7, scope: !2)
!1875 = !DILocation(line: 86, column: 25, scope: !2)
!1876 = !DILocation(line: 86, column: 37, scope: !2)
!1877 = !DILocation(line: 86, column: 5, scope: !2)
!1878 = !DILocation(line: 87, column: 8, scope: !2)
!1879 = !DILocation(line: 87, column: 12, scope: !2)
!1880 = !DILocation(line: 87, column: 10, scope: !2)
!1881 = !DILocation(line: 87, column: 7, scope: !2)
!1882 = !DILocation(line: 87, column: 25, scope: !2)
!1883 = !DILocation(line: 87, column: 37, scope: !2)
!1884 = !DILocation(line: 87, column: 5, scope: !2)
!1885 = !DILocation(line: 89, column: 8, scope: !2)
!1886 = !DILocation(line: 89, column: 18, scope: !2)
!1887 = !DILocation(line: 0, scope: !2)
!1888 = !DILocation(line: 91, column: 6, scope: !1889)
!1889 = distinct !DILexicalBlock(scope: !2, file: !3, line: 91, column: 6)
!1890 = !DILocation(line: 91, column: 6, scope: !2)
!1891 = !DILocation(line: 93, column: 16, scope: !1892)
!1892 = distinct !DILexicalBlock(scope: !1889, file: !3, line: 92, column: 3)
!1893 = !DILocation(line: 93, column: 23, scope: !1892)
!1894 = !DILocation(line: 93, column: 10, scope: !1892)
!1895 = !DILocation(line: 93, column: 5, scope: !1892)
!1896 = !DILocation(line: 93, column: 14, scope: !1892)
!1897 = !DILocation(line: 94, column: 3, scope: !1892)
!1898 = !DILocation(line: 96, column: 3, scope: !2)
!1899 = !DILocation(line: 98, column: 8, scope: !2)
!1900 = !DILocation(line: 99, column: 7, scope: !2)
!1901 = !DILocation(line: 100, column: 7, scope: !2)
!1902 = !DILocation(line: 101, column: 12, scope: !1635)
!1903 = !DILocation(line: 101, column: 8, scope: !1635)
!1904 = !DILocation(line: 101, column: 19, scope: !1638)
!1905 = !DILocation(line: 101, column: 23, scope: !1638)
!1906 = !DILocation(line: 101, column: 21, scope: !1638)
!1907 = !DILocation(line: 101, column: 3, scope: !1635)
!1908 = !DILocation(line: 103, column: 14, scope: !1637)
!1909 = !DILocation(line: 104, column: 9, scope: !1637)
!1910 = !DILocation(line: 105, column: 9, scope: !1637)
!1911 = !DILocation(line: 107, column: 9, scope: !1642)
!1912 = !DILocation(line: 107, column: 43, scope: !1642)
!1913 = !DILocation(line: 107, column: 46, scope: !1642)
!1914 = !DILocation(line: 107, column: 9, scope: !1637)
!1915 = !DILocation(line: 109, column: 16, scope: !1641)
!1916 = !DILocation(line: 110, column: 11, scope: !1641)
!1917 = !DILocation(line: 110, column: 23, scope: !1641)
!1918 = !DILocation(line: 110, column: 18, scope: !1641)
!1919 = !DILocation(line: 111, column: 11, scope: !1641)
!1920 = !DILocation(line: 111, column: 21, scope: !1641)
!1921 = !DILocation(line: 111, column: 16, scope: !1641)
!1922 = !DILocation(line: 112, column: 11, scope: !1641)
!1923 = !DILocation(line: 112, column: 24, scope: !1641)
!1924 = !DILocation(line: 112, column: 19, scope: !1641)
!1925 = !DILocation(line: 113, column: 11, scope: !1641)
!1926 = !DILocation(line: 113, column: 22, scope: !1641)
!1927 = !DILocation(line: 114, column: 18, scope: !1641)
!1928 = !DILocation(line: 114, column: 16, scope: !1641)
!1929 = !DILocation(line: 116, column: 11, scope: !1641)
!1930 = !DILocation(line: 116, column: 19, scope: !1641)
!1931 = !DILocation(line: 116, column: 25, scope: !1641)
!1932 = !DILocation(line: 116, column: 27, scope: !1641)
!1933 = !DILocation(line: 116, column: 26, scope: !1641)
!1934 = !DILocation(line: 116, column: 23, scope: !1641)
!1935 = !DILocation(line: 116, column: 30, scope: !1641)
!1936 = !DILocation(line: 116, column: 29, scope: !1641)
!1937 = !DILocation(line: 117, column: 20, scope: !1641)
!1938 = !DILocation(line: 117, column: 31, scope: !1641)
!1939 = !DILocation(line: 117, column: 39, scope: !1641)
!1940 = !DILocation(line: 117, column: 29, scope: !1641)
!1941 = !DILocation(line: 117, column: 14, scope: !1641)
!1942 = !DILocation(line: 117, column: 7, scope: !1641)
!1943 = !DILocation(line: 117, column: 18, scope: !1641)
!1944 = !DILocation(line: 118, column: 20, scope: !1641)
!1945 = !DILocation(line: 118, column: 18, scope: !1641)
!1946 = !DILocation(line: 119, column: 27, scope: !1641)
!1947 = !DILocation(line: 119, column: 20, scope: !1641)
!1948 = !DILocation(line: 119, column: 18, scope: !1641)
!1949 = !DILocation(line: 120, column: 24, scope: !1641)
!1950 = !DILocation(line: 120, column: 22, scope: !1641)
!1951 = !DILocation(line: 121, column: 24, scope: !1641)
!1952 = !DILocation(line: 121, column: 22, scope: !1641)
!1953 = !DILocation(line: 122, column: 17, scope: !1641)
!1954 = !DILocation(line: 122, column: 7, scope: !1641)
!1955 = !DILocation(line: 124, column: 11, scope: !1649)
!1956 = !DILocation(line: 124, column: 26, scope: !1649)
!1957 = !DILocation(line: 124, column: 11, scope: !1641)
!1958 = !DILocation(line: 126, column: 22, scope: !1648)
!1959 = !DILocation(line: 126, column: 39, scope: !1648)
!1960 = !DILocation(line: 126, column: 29, scope: !1648)
!1961 = !DILocation(line: 127, column: 13, scope: !1652)
!1962 = !DILocation(line: 127, column: 18, scope: !1652)
!1963 = !DILocation(line: 127, column: 13, scope: !1648)
!1964 = !DILocation(line: 129, column: 33, scope: !1651)
!1965 = !DILocation(line: 130, column: 19, scope: !1651)
!1966 = !DILocation(line: 130, column: 15, scope: !1651)
!1967 = !DILocation(line: 130, column: 17, scope: !1651)
!1968 = !DILocation(line: 131, column: 27, scope: !1651)
!1969 = !DILocation(line: 131, column: 15, scope: !1651)
!1970 = !DILocation(line: 131, column: 25, scope: !1651)
!1971 = !DILocation(line: 132, column: 20, scope: !1651)
!1972 = !DILocation(line: 132, column: 15, scope: !1651)
!1973 = !DILocation(line: 132, column: 18, scope: !1651)
!1974 = !DILocation(line: 133, column: 20, scope: !1651)
!1975 = !DILocation(line: 133, column: 15, scope: !1651)
!1976 = !DILocation(line: 133, column: 18, scope: !1651)
!1977 = !DILocation(line: 134, column: 43, scope: !1651)
!1978 = !DILocation(line: 134, column: 15, scope: !1651)
!1979 = !DILocation(line: 134, column: 41, scope: !1651)
!1980 = !DILocation(line: 135, column: 41, scope: !1651)
!1981 = !DILocation(line: 135, column: 15, scope: !1651)
!1982 = !DILocation(line: 135, column: 39, scope: !1651)
!1983 = !DILocation(line: 136, column: 22, scope: !1651)
!1984 = !DILocation(line: 136, column: 15, scope: !1651)
!1985 = !DILocation(line: 136, column: 20, scope: !1651)
!1986 = !DILocation(line: 137, column: 25, scope: !1651)
!1987 = !DILocation(line: 137, column: 15, scope: !1651)
!1988 = !DILocation(line: 137, column: 23, scope: !1651)
!1989 = !DILocation(line: 138, column: 22, scope: !1651)
!1990 = !DILocation(line: 138, column: 15, scope: !1651)
!1991 = !DILocation(line: 138, column: 20, scope: !1651)
!1992 = !DILocation(line: 139, column: 27, scope: !1651)
!1993 = !DILocation(line: 139, column: 15, scope: !1651)
!1994 = !DILocation(line: 139, column: 25, scope: !1651)
!1995 = !DILocation(line: 140, column: 27, scope: !1651)
!1996 = !DILocation(line: 140, column: 15, scope: !1651)
!1997 = !DILocation(line: 140, column: 25, scope: !1651)
!1998 = !DILocation(line: 141, column: 25, scope: !1651)
!1999 = !DILocation(line: 141, column: 15, scope: !1651)
!2000 = !DILocation(line: 141, column: 23, scope: !1651)
!2001 = !DILocation(line: 142, column: 15, scope: !1651)
!2002 = !DILocation(line: 142, column: 24, scope: !1651)
!2003 = !DILocation(line: 143, column: 15, scope: !1651)
!2004 = !DILocation(line: 143, column: 27, scope: !1651)
!2005 = !DILocation(line: 144, column: 23, scope: !1651)
!2006 = !DILocation(line: 144, column: 15, scope: !1651)
!2007 = !DILocation(line: 144, column: 21, scope: !1651)
!2008 = !DILocation(line: 145, column: 23, scope: !1651)
!2009 = !DILocation(line: 145, column: 15, scope: !1651)
!2010 = !DILocation(line: 145, column: 21, scope: !1651)
!2011 = !DILocation(line: 146, column: 11, scope: !1651)
!2012 = !DILocation(line: 146, column: 26, scope: !1651)
!2013 = !DILocation(line: 146, column: 32, scope: !1651)
!2014 = !DILocation(line: 147, column: 9, scope: !1651)
!2015 = !DILocation(line: 148, column: 7, scope: !1648)
!2016 = !DILocation(line: 152, column: 11, scope: !1655)
!2017 = !DILocation(line: 152, column: 13, scope: !1655)
!2018 = !DILocation(line: 152, column: 18, scope: !1655)
!2019 = !DILocation(line: 152, column: 21, scope: !1655)
!2020 = !DILocation(line: 152, column: 22, scope: !1655)
!2021 = !DILocation(line: 152, column: 11, scope: !1641)
!2022 = !DILocation(line: 155, column: 13, scope: !1654)
!2023 = !DILocation(line: 155, column: 24, scope: !1654)
!2024 = !DILocation(line: 155, column: 31, scope: !1654)
!2025 = !DILocation(line: 157, column: 9, scope: !1654)
!2026 = !DILocation(line: 157, column: 22, scope: !1654)
!2027 = !DILocation(line: 157, column: 32, scope: !1654)
!2028 = !DILocation(line: 158, column: 7, scope: !1654)
!2029 = !DILocation(line: 160, column: 5, scope: !1641)
!2030 = !DILocation(line: 162, column: 5, scope: !1637)
!2031 = !DILocation(line: 164, column: 8, scope: !2032)
!2032 = distinct !DILexicalBlock(scope: !1637, file: !3, line: 164, column: 8)
!2033 = !DILocation(line: 164, column: 11, scope: !2032)
!2034 = !DILocation(line: 164, column: 20, scope: !2032)
!2035 = !DILocation(line: 164, column: 9, scope: !2032)
!2036 = !DILocation(line: 164, column: 8, scope: !1637)
!2037 = !DILocation(line: 168, column: 7, scope: !2038)
!2038 = distinct !DILexicalBlock(scope: !2032, file: !3, line: 165, column: 5)
!2039 = !DILocation(line: 171, column: 8, scope: !2040)
!2040 = distinct !DILexicalBlock(scope: !1637, file: !3, line: 171, column: 8)
!2041 = !DILocation(line: 171, column: 8, scope: !1637)
!2042 = !DILocation(line: 174, column: 25, scope: !2043)
!2043 = distinct !DILexicalBlock(scope: !2040, file: !3, line: 172, column: 5)
!2044 = !DILocation(line: 174, column: 18, scope: !2043)
!2045 = !DILocation(line: 174, column: 12, scope: !2043)
!2046 = !DILocation(line: 174, column: 7, scope: !2043)
!2047 = !DILocation(line: 174, column: 16, scope: !2043)
!2048 = !DILocation(line: 175, column: 5, scope: !2043)
!2049 = !DILocation(line: 176, column: 5, scope: !1637)
!2050 = !DILocation(line: 177, column: 3, scope: !1637)
!2051 = !DILocation(line: 101, column: 35, scope: !1638)
!2052 = !DILocation(line: 101, column: 3, scope: !1638)
!2053 = distinct !{!2053, !1907, !2054, !1713}
!2054 = !DILocation(line: 177, column: 3, scope: !1635)
!2055 = !DILocation(line: 182, column: 8, scope: !2)
!2056 = !DILocation(line: 182, column: 22, scope: !2)
!2057 = !DILocation(line: 183, column: 7, scope: !2058)
!2058 = distinct !DILexicalBlock(scope: !2, file: !3, line: 183, column: 7)
!2059 = !DILocation(line: 183, column: 7, scope: !2)
!2060 = !DILocation(line: 185, column: 30, scope: !2061)
!2061 = distinct !DILexicalBlock(scope: !2058, file: !3, line: 184, column: 3)
!2062 = !DILocation(line: 185, column: 23, scope: !2061)
!2063 = !DILocation(line: 185, column: 5, scope: !2061)
!2064 = !DILocation(line: 185, column: 15, scope: !2061)
!2065 = !DILocation(line: 185, column: 21, scope: !2061)
!2066 = !DILocation(line: 186, column: 15, scope: !2061)
!2067 = !DILocation(line: 186, column: 5, scope: !2061)
!2068 = !DILocation(line: 187, column: 3, scope: !2061)
!2069 = !DILocation(line: 189, column: 7, scope: !1659)
!2070 = !DILocation(line: 189, column: 22, scope: !1659)
!2071 = !DILocation(line: 189, column: 33, scope: !1659)
!2072 = !DILocation(line: 189, column: 36, scope: !1659)
!2073 = !DILocation(line: 189, column: 7, scope: !2)
!2074 = !DILocation(line: 191, column: 18, scope: !1658)
!2075 = !DILocation(line: 191, column: 35, scope: !1658)
!2076 = !DILocation(line: 191, column: 25, scope: !1658)
!2077 = !DILocation(line: 192, column: 9, scope: !1662)
!2078 = !DILocation(line: 192, column: 14, scope: !1662)
!2079 = !DILocation(line: 192, column: 9, scope: !1658)
!2080 = !DILocation(line: 194, column: 29, scope: !1661)
!2081 = !DILocation(line: 195, column: 15, scope: !1661)
!2082 = !DILocation(line: 195, column: 11, scope: !1661)
!2083 = !DILocation(line: 195, column: 13, scope: !1661)
!2084 = !DILocation(line: 196, column: 23, scope: !1661)
!2085 = !DILocation(line: 196, column: 33, scope: !1661)
!2086 = !DILocation(line: 196, column: 11, scope: !1661)
!2087 = !DILocation(line: 196, column: 21, scope: !1661)
!2088 = !DILocation(line: 197, column: 16, scope: !1661)
!2089 = !DILocation(line: 197, column: 11, scope: !1661)
!2090 = !DILocation(line: 197, column: 14, scope: !1661)
!2091 = !DILocation(line: 198, column: 16, scope: !1661)
!2092 = !DILocation(line: 198, column: 11, scope: !1661)
!2093 = !DILocation(line: 198, column: 14, scope: !1661)
!2094 = !DILocation(line: 199, column: 39, scope: !1661)
!2095 = !DILocation(line: 199, column: 11, scope: !1661)
!2096 = !DILocation(line: 199, column: 37, scope: !1661)
!2097 = !DILocation(line: 200, column: 37, scope: !1661)
!2098 = !DILocation(line: 200, column: 11, scope: !1661)
!2099 = !DILocation(line: 200, column: 35, scope: !1661)
!2100 = !DILocation(line: 201, column: 18, scope: !1661)
!2101 = !DILocation(line: 201, column: 11, scope: !1661)
!2102 = !DILocation(line: 201, column: 16, scope: !1661)
!2103 = !DILocation(line: 202, column: 21, scope: !1661)
!2104 = !DILocation(line: 202, column: 11, scope: !1661)
!2105 = !DILocation(line: 202, column: 19, scope: !1661)
!2106 = !DILocation(line: 203, column: 18, scope: !1661)
!2107 = !DILocation(line: 203, column: 11, scope: !1661)
!2108 = !DILocation(line: 203, column: 16, scope: !1661)
!2109 = !DILocation(line: 204, column: 23, scope: !1661)
!2110 = !DILocation(line: 204, column: 11, scope: !1661)
!2111 = !DILocation(line: 204, column: 21, scope: !1661)
!2112 = !DILocation(line: 205, column: 23, scope: !1661)
!2113 = !DILocation(line: 205, column: 11, scope: !1661)
!2114 = !DILocation(line: 205, column: 21, scope: !1661)
!2115 = !DILocation(line: 206, column: 21, scope: !1661)
!2116 = !DILocation(line: 206, column: 11, scope: !1661)
!2117 = !DILocation(line: 206, column: 19, scope: !1661)
!2118 = !DILocation(line: 207, column: 22, scope: !1661)
!2119 = !DILocation(line: 207, column: 11, scope: !1661)
!2120 = !DILocation(line: 207, column: 20, scope: !1661)
!2121 = !DILocation(line: 208, column: 11, scope: !1661)
!2122 = !DILocation(line: 208, column: 23, scope: !1661)
!2123 = !DILocation(line: 209, column: 19, scope: !1661)
!2124 = !DILocation(line: 209, column: 11, scope: !1661)
!2125 = !DILocation(line: 209, column: 17, scope: !1661)
!2126 = !DILocation(line: 210, column: 19, scope: !1661)
!2127 = !DILocation(line: 210, column: 11, scope: !1661)
!2128 = !DILocation(line: 210, column: 17, scope: !1661)
!2129 = !DILocation(line: 211, column: 7, scope: !1661)
!2130 = !DILocation(line: 211, column: 22, scope: !1661)
!2131 = !DILocation(line: 211, column: 28, scope: !1661)
!2132 = !DILocation(line: 212, column: 5, scope: !1661)
!2133 = !DILocation(line: 213, column: 3, scope: !1658)
!2134 = !DILocation(line: 214, column: 1, scope: !2)
!2135 = distinct !DISubprogram(name: "__syncthreads", linkageName: "_Z13__syncthreadsv", scope: !2136, file: !2136, line: 784, type: !423, scopeLine: 785, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !34)
!2136 = !DIFile(filename: "/opt/rocm-6.4.2/include/hip/amd_detail/amd_device_functions.h", directory: "", checksumkind: CSK_MD5, checksum: "cf998eaa8f93a277ea6621aa21e4286e")
!2137 = !DILocation(line: 786, column: 3, scope: !2135)
!2138 = !DILocation(line: 787, column: 1, scope: !2135)
!2139 = distinct !DISubprogram(name: "atomicAdd", linkageName: "_Z9atomicAddPjj", scope: !2140, file: !2140, line: 228, type: !2141, scopeLine: 228, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !34, retainedNodes: !2143)
!2140 = !DIFile(filename: "/opt/rocm-6.4.2/include/hip/amd_detail/amd_hip_atomic.h", directory: "", checksumkind: CSK_MD5, checksum: "ebf97c3a66e959f6dd7514927ddb211d")
!2141 = !DISubroutineType(types: !2142)
!2142 = !{!33, !32, !33}
!2143 = !{!2144, !2145}
!2144 = !DILocalVariable(name: "address", arg: 1, scope: !2139, file: !2140, line: 228, type: !32)
!2145 = !DILocalVariable(name: "val", arg: 2, scope: !2139, file: !2140, line: 228, type: !33)
!2146 = !DILocation(line: 228, column: 38, scope: !2139)
!2147 = !DILocation(line: 228, column: 60, scope: !2139)
!2148 = !DILocation(line: 229, column: 33, scope: !2139)
!2149 = !DILocation(line: 229, column: 42, scope: !2139)
!2150 = !DILocation(line: 229, column: 10, scope: !2139)
!2151 = !DILocation(line: 229, column: 3, scope: !2139)
!2152 = distinct !DISubprogram(name: "__barrier", linkageName: "_ZL9__barrieri", scope: !2136, file: !2136, line: 776, type: !468, scopeLine: 777, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !34, retainedNodes: !2153)
!2153 = !{!2154}
!2154 = !DILocalVariable(name: "n", arg: 1, scope: !2152, file: !2136, line: 776, type: !9)
!2155 = !DILocation(line: 776, column: 27, scope: !2152)
!2156 = !DILocation(line: 778, column: 46, scope: !2152)
!2157 = !DILocation(line: 778, column: 3, scope: !2152)
!2158 = !DILocation(line: 779, column: 1, scope: !2152)
!2159 = distinct !DISubprogram(name: "__work_group_barrier", linkageName: "_ZL20__work_group_barrierj", scope: !2136, file: !2136, line: 764, type: !2160, scopeLine: 764, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !34, retainedNodes: !2162)
!2160 = !DISubroutineType(types: !2161)
!2161 = !{null, !37}
!2162 = !{!2163}
!2163 = !DILocalVariable(name: "flags", arg: 1, scope: !2159, file: !2136, line: 764, type: !37)
!2164 = !DILocation(line: 764, column: 73, scope: !2159)
!2165 = !DILocation(line: 765, column: 9, scope: !2166)
!2166 = distinct !DILexicalBlock(scope: !2159, file: !2136, line: 765, column: 9)
!2167 = !DILocation(line: 765, column: 9, scope: !2159)
!2168 = !DILocation(line: 766, column: 9, scope: !2169)
!2169 = distinct !DILexicalBlock(scope: !2166, file: !2136, line: 765, column: 16)
!2170 = !DILocation(line: 767, column: 9, scope: !2169)
!2171 = !DILocation(line: 768, column: 9, scope: !2169)
!2172 = !DILocation(line: 769, column: 5, scope: !2169)
!2173 = !DILocation(line: 770, column: 9, scope: !2174)
!2174 = distinct !DILexicalBlock(scope: !2166, file: !2136, line: 769, column: 12)
!2175 = !DILocation(line: 772, column: 1, scope: !2159)
!2176 = !{!2177, !2177, i64 0}
!2177 = !{!"int", !2178, i64 0}
!2178 = !{!"omnipotent char", !2179, i64 0}
!2179 = !{!"Simple C/C++ TBAA"}
!2180 = !{!2181, !2181, i64 0}
!2181 = !{!"long", !2178, i64 0}
!2182 = !{!2183, !2184, i64 0}
!2183 = !{!"", !2184, i64 0, !2184, i64 8, !2185, i64 16, !2181, i64 24, !2181, i64 32, !2181, i64 40}
!2184 = !{!"any pointer", !2178, i64 0}
!2185 = !{!"hsa_signal_s", !2181, i64 0}
!2186 = !{!2183, !2181, i64 40}
!2187 = !{!2183, !2184, i64 8}
!2188 = !{!2189, !2177, i64 16}
!2189 = !{!"", !2181, i64 0, !2181, i64 8, !2177, i64 16, !2177, i64 20}
!2190 = !{!2189, !2181, i64 8}
!2191 = !{!2189, !2177, i64 20}
!2192 = !{!2189, !2181, i64 0}
!2193 = !{!2194, !2181, i64 16}
!2194 = !{!"amd_signal_s", !2181, i64 0, !2178, i64 8, !2181, i64 16, !2177, i64 24, !2177, i64 28, !2181, i64 32, !2181, i64 40, !2178, i64 48, !2178, i64 56}
!2195 = !{!2194, !2177, i64 24}
!2196 = !{!2178, !2178, i64 0}
!2197 = !{i16 1, i16 1025}
!2198 = !{}
!2199 = !{!2200, !2177, i64 12}
!2200 = !{!"hsa_kernel_dispatch_packet_s", !2201, i64 0, !2201, i64 2, !2201, i64 4, !2201, i64 6, !2201, i64 8, !2201, i64 10, !2177, i64 12, !2177, i64 16, !2177, i64 20, !2177, i64 24, !2177, i64 28, !2178, i64 32, !2184, i64 40, !2181, i64 48, !2185, i64 56}
!2201 = !{!"short", !2178, i64 0}
!2202 = !{!2201, !2201, i64 0}
!2203 = !{!2200, !2177, i64 16}
!2204 = !{!2200, !2177, i64 20}
