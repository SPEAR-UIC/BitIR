; ModuleID = '/ccs/home/mdunlavy/GPU_FI/HeCBench/src/pathfinder-hip/main.cu'
source_filename = "/ccs/home/mdunlavy/GPU_FI/HeCBench/src/pathfinder-hip/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8:9"
target triple = "amdgcn-amd-amdhsa"

%0 = type { i64, i64, i32, i32 }
%1 = type { [64 x [8 x i64]] }
%struct.__hip_builtin_blockDim_t = type { i8 }
%struct.__hip_builtin_blockIdx_t = type { i8 }
%struct.__hip_builtin_threadIdx_t = type { i8 }

$_Z13__syncthreadsv = comdat any

@__const.__assert_fail.fmt = private unnamed_addr addrspace(4) constant [47 x i8] c"%s:%u: %s: Device-side assertion `%s' failed.\0A\00", align 16
@blockDim = extern_weak dso_local protected addrspace(1) global %struct.__hip_builtin_blockDim_t, align 1
@blockIdx = extern_weak dso_local protected addrspace(1) global %struct.__hip_builtin_blockIdx_t, align 1
@threadIdx = extern_weak dso_local protected addrspace(1) global %struct.__hip_builtin_threadIdx_t, align 1
@_ZZ10pathfinderPKiS0_PiS1_iiiiiE4prev = internal addrspace(3) global [250 x i32] undef, align 16, !dbg !0
@_ZZ10pathfinderPKiS0_PiS1_iiiiiE6result = internal addrspace(3) global [250 x i32] undef, align 16, !dbg !33
@.str = private unnamed_addr addrspace(4) constant [10 x i8] c"workgroup\00", align 1
@__hip_cuid_d8db255f251c606d = addrspace(1) global i8 0
@llvm.compiler.used = appending addrspace(1) global [1 x ptr] [ptr addrspacecast (ptr addrspace(1) @__hip_cuid_d8db255f251c606d to ptr)], section "llvm.metadata"
@__oclc_ISA_version = internal local_unnamed_addr addrspace(4) constant i32 9010, align 4
@__oclc_ABI_version = weak_odr hidden local_unnamed_addr addrspace(4) constant i32 600

; Function Attrs: convergent mustprogress noinline noreturn nounwind optnone
define weak void @__cxa_pure_virtual() #0 !dbg !1627 {
  call void @llvm.trap(), !dbg !1629
  unreachable, !dbg !1630
}

; Function Attrs: cold noreturn nounwind memory(inaccessiblemem: write)
declare void @llvm.trap() #1

; Function Attrs: convergent mustprogress noinline noreturn nounwind optnone
define weak void @__cxa_deleted_virtual() #0 !dbg !1631 {
  call void @llvm.trap(), !dbg !1632
  unreachable, !dbg !1633
}

; Function Attrs: convergent mustprogress noinline nounwind optnone
define weak hidden void @__assert_fail(ptr noundef %0, ptr noundef %1, i32 noundef %2, ptr noundef %3) #2 !dbg !1634 {
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
    #dbg_declare(ptr addrspace(5) %5, !1639, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(ptr)), !1657)
  store ptr %1, ptr %17, align 8
    #dbg_declare(ptr addrspace(5) %6, !1640, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(ptr)), !1658)
  store i32 %2, ptr %18, align 4
    #dbg_declare(ptr addrspace(5) %7, !1641, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1659)
  store ptr %3, ptr %19, align 8
    #dbg_declare(ptr addrspace(5) %8, !1642, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(ptr)), !1660)
    #dbg_declare(ptr addrspace(5) %9, !1643, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref([47 x i8])), !1661)
  call void @llvm.memcpy.p0.p4.i64(ptr align 16 %20, ptr addrspace(4) align 16 @__const.__assert_fail.fmt, i64 47, i1 false), !dbg !1661
    #dbg_declare(ptr addrspace(5) %10, !1647, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i64)), !1662)
  %27 = call i64 @__ockl_fprintf_stderr_begin() #13, !dbg !1663
  store i64 %27, ptr %21, align 8, !dbg !1662
    #dbg_declare(ptr addrspace(5) %11, !1648, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1664)
  store i32 0, ptr %22, align 4, !dbg !1664
  br label %28, !dbg !1665

28:                                               ; preds = %4
    #dbg_declare(ptr addrspace(5) %12, !1649, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(ptr)), !1666)
  %29 = getelementptr inbounds [47 x i8], ptr %20, i64 0, i64 0, !dbg !1666
  store ptr %29, ptr %23, align 8, !dbg !1666
  br label %30, !dbg !1666

30:                                               ; preds = %35, %28
  %31 = load ptr, ptr %23, align 8, !dbg !1666
  %32 = getelementptr inbounds i8, ptr %31, i32 1, !dbg !1666
  store ptr %32, ptr %23, align 8, !dbg !1666
  %33 = load i8, ptr %31, align 1, !dbg !1666
  %34 = icmp ne i8 %33, 0, !dbg !1666
  br i1 %34, label %35, label %36, !dbg !1666

35:                                               ; preds = %30
  br label %30, !dbg !1666, !llvm.loop !1667

36:                                               ; preds = %30
  %37 = load ptr, ptr %23, align 8, !dbg !1666
  %38 = getelementptr inbounds [47 x i8], ptr %20, i64 0, i64 0, !dbg !1666
  %39 = ptrtoint ptr %37 to i64, !dbg !1666
  %40 = ptrtoint ptr %38 to i64, !dbg !1666
  %41 = sub i64 %39, %40, !dbg !1666
  %42 = trunc i64 %41 to i32, !dbg !1666
  store i32 %42, ptr %22, align 4, !dbg !1666
  br label %43, !dbg !1666

43:                                               ; preds = %36
  %44 = load i64, ptr %21, align 8, !dbg !1669
  %45 = getelementptr inbounds [47 x i8], ptr %20, i64 0, i64 0, !dbg !1670
  %46 = load i32, ptr %22, align 4, !dbg !1671
  %47 = sext i32 %46 to i64, !dbg !1671
  %48 = call i64 @__ockl_fprintf_append_string_n(i64 noundef %44, ptr noundef %45, i64 noundef %47, i32 noundef 0) #13, !dbg !1672
  store i64 %48, ptr %21, align 8, !dbg !1673
  br label %49, !dbg !1674

49:                                               ; preds = %43
    #dbg_declare(ptr addrspace(5) %13, !1651, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(ptr)), !1675)
  %50 = load ptr, ptr %17, align 8, !dbg !1675
  store ptr %50, ptr %24, align 8, !dbg !1675
  br label %51, !dbg !1675

51:                                               ; preds = %56, %49
  %52 = load ptr, ptr %24, align 8, !dbg !1675
  %53 = getelementptr inbounds i8, ptr %52, i32 1, !dbg !1675
  store ptr %53, ptr %24, align 8, !dbg !1675
  %54 = load i8, ptr %52, align 1, !dbg !1675
  %55 = icmp ne i8 %54, 0, !dbg !1675
  br i1 %55, label %56, label %57, !dbg !1675

56:                                               ; preds = %51
  br label %51, !dbg !1675, !llvm.loop !1676

57:                                               ; preds = %51
  %58 = load ptr, ptr %24, align 8, !dbg !1675
  %59 = load ptr, ptr %17, align 8, !dbg !1675
  %60 = ptrtoint ptr %58 to i64, !dbg !1675
  %61 = ptrtoint ptr %59 to i64, !dbg !1675
  %62 = sub i64 %60, %61, !dbg !1675
  %63 = trunc i64 %62 to i32, !dbg !1675
  store i32 %63, ptr %22, align 4, !dbg !1675
  br label %64, !dbg !1675

64:                                               ; preds = %57
  %65 = load i64, ptr %21, align 8, !dbg !1677
  %66 = load ptr, ptr %17, align 8, !dbg !1678
  %67 = load i32, ptr %22, align 4, !dbg !1679
  %68 = sext i32 %67 to i64, !dbg !1679
  %69 = call i64 @__ockl_fprintf_append_string_n(i64 noundef %65, ptr noundef %66, i64 noundef %68, i32 noundef 0) #13, !dbg !1680
  store i64 %69, ptr %21, align 8, !dbg !1681
  %70 = load i64, ptr %21, align 8, !dbg !1682
  %71 = load i32, ptr %18, align 4, !dbg !1683
  %72 = zext i32 %71 to i64, !dbg !1683
  %73 = call i64 @__ockl_fprintf_append_args(i64 noundef %70, i32 noundef 1, i64 noundef %72, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i32 noundef 0) #13, !dbg !1684
  store i64 %73, ptr %21, align 8, !dbg !1685
  br label %74, !dbg !1686

74:                                               ; preds = %64
    #dbg_declare(ptr addrspace(5) %14, !1653, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(ptr)), !1687)
  %75 = load ptr, ptr %19, align 8, !dbg !1687
  store ptr %75, ptr %25, align 8, !dbg !1687
  br label %76, !dbg !1687

76:                                               ; preds = %81, %74
  %77 = load ptr, ptr %25, align 8, !dbg !1687
  %78 = getelementptr inbounds i8, ptr %77, i32 1, !dbg !1687
  store ptr %78, ptr %25, align 8, !dbg !1687
  %79 = load i8, ptr %77, align 1, !dbg !1687
  %80 = icmp ne i8 %79, 0, !dbg !1687
  br i1 %80, label %81, label %82, !dbg !1687

81:                                               ; preds = %76
  br label %76, !dbg !1687, !llvm.loop !1688

82:                                               ; preds = %76
  %83 = load ptr, ptr %25, align 8, !dbg !1687
  %84 = load ptr, ptr %19, align 8, !dbg !1687
  %85 = ptrtoint ptr %83 to i64, !dbg !1687
  %86 = ptrtoint ptr %84 to i64, !dbg !1687
  %87 = sub i64 %85, %86, !dbg !1687
  %88 = trunc i64 %87 to i32, !dbg !1687
  store i32 %88, ptr %22, align 4, !dbg !1687
  br label %89, !dbg !1687

89:                                               ; preds = %82
  %90 = load i64, ptr %21, align 8, !dbg !1689
  %91 = load ptr, ptr %19, align 8, !dbg !1690
  %92 = load i32, ptr %22, align 4, !dbg !1691
  %93 = sext i32 %92 to i64, !dbg !1691
  %94 = call i64 @__ockl_fprintf_append_string_n(i64 noundef %90, ptr noundef %91, i64 noundef %93, i32 noundef 0) #13, !dbg !1692
  store i64 %94, ptr %21, align 8, !dbg !1693
  br label %95, !dbg !1694

95:                                               ; preds = %89
    #dbg_declare(ptr addrspace(5) %15, !1655, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(ptr)), !1695)
  %96 = load ptr, ptr %16, align 8, !dbg !1695
  store ptr %96, ptr %26, align 8, !dbg !1695
  br label %97, !dbg !1695

97:                                               ; preds = %102, %95
  %98 = load ptr, ptr %26, align 8, !dbg !1695
  %99 = getelementptr inbounds i8, ptr %98, i32 1, !dbg !1695
  store ptr %99, ptr %26, align 8, !dbg !1695
  %100 = load i8, ptr %98, align 1, !dbg !1695
  %101 = icmp ne i8 %100, 0, !dbg !1695
  br i1 %101, label %102, label %103, !dbg !1695

102:                                              ; preds = %97
  br label %97, !dbg !1695, !llvm.loop !1696

103:                                              ; preds = %97
  %104 = load ptr, ptr %26, align 8, !dbg !1695
  %105 = load ptr, ptr %16, align 8, !dbg !1695
  %106 = ptrtoint ptr %104 to i64, !dbg !1695
  %107 = ptrtoint ptr %105 to i64, !dbg !1695
  %108 = sub i64 %106, %107, !dbg !1695
  %109 = trunc i64 %108 to i32, !dbg !1695
  store i32 %109, ptr %22, align 4, !dbg !1695
  br label %110, !dbg !1695

110:                                              ; preds = %103
  %111 = load i64, ptr %21, align 8, !dbg !1697
  %112 = load ptr, ptr %16, align 8, !dbg !1698
  %113 = load i32, ptr %22, align 4, !dbg !1699
  %114 = sext i32 %113 to i64, !dbg !1699
  %115 = call i64 @__ockl_fprintf_append_string_n(i64 noundef %111, ptr noundef %112, i64 noundef %114, i32 noundef 1) #13, !dbg !1700
  call void @llvm.trap(), !dbg !1701
  ret void, !dbg !1702
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p4.i64(ptr noalias nocapture writeonly, ptr addrspace(4) noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: convergent mustprogress noinline nounwind optnone
define weak hidden void @__assertfail() #2 !dbg !1703 {
  call void @llvm.trap(), !dbg !1704
  ret void, !dbg !1705
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define protected amdgpu_kernel void @_Z10pathfinderPKiS0_PiS1_iiiii(ptr addrspace(1) noalias noundef %0, ptr addrspace(1) noalias noundef %1, ptr addrspace(1) noalias noundef %2, ptr addrspace(1) noalias noundef %3, i32 noundef %4, i32 noundef %5, i32 noundef %6, i32 noundef %7, i32 noundef %8) #4 !dbg !2 {
  %10 = alloca i32, align 4, addrspace(5)
  %11 = alloca i32, align 4, addrspace(5)
  %12 = alloca i32, align 4, addrspace(5)
  %13 = alloca i32, align 4, addrspace(5)
  %14 = alloca i32, align 4, addrspace(5)
  %15 = alloca i32, align 4, addrspace(5)
  %16 = alloca ptr, align 8, addrspace(5)
  %17 = alloca ptr, align 8, addrspace(5)
  %18 = alloca ptr, align 8, addrspace(5)
  %19 = alloca ptr, align 8, addrspace(5)
  %20 = alloca ptr, align 8, addrspace(5)
  %21 = alloca ptr, align 8, addrspace(5)
  %22 = alloca ptr, align 8, addrspace(5)
  %23 = alloca ptr, align 8, addrspace(5)
  %24 = alloca i32, align 4, addrspace(5)
  %25 = alloca i32, align 4, addrspace(5)
  %26 = alloca i32, align 4, addrspace(5)
  %27 = alloca i32, align 4, addrspace(5)
  %28 = alloca i32, align 4, addrspace(5)
  %29 = alloca i32, align 4, addrspace(5)
  %30 = alloca i32, align 4, addrspace(5)
  %31 = alloca i32, align 4, addrspace(5)
  %32 = alloca i32, align 4, addrspace(5)
  %33 = alloca i32, align 4, addrspace(5)
  %34 = alloca i32, align 4, addrspace(5)
  %35 = alloca i32, align 4, addrspace(5)
  %36 = alloca i32, align 4, addrspace(5)
  %37 = alloca i32, align 4, addrspace(5)
  %38 = alloca i32, align 4, addrspace(5)
  %39 = alloca i32, align 4, addrspace(5)
  %40 = alloca i8, align 1, addrspace(5)
  %41 = alloca i8, align 1, addrspace(5)
  %42 = alloca i32, align 4, addrspace(5)
  %43 = alloca i32, align 4, addrspace(5)
  %44 = alloca i32, align 4, addrspace(5)
  %45 = alloca i32, align 4, addrspace(5)
  %46 = alloca i32, align 4, addrspace(5)
  %47 = alloca i32, align 4, addrspace(5)
  %48 = alloca i32, align 4, addrspace(5)
  %49 = addrspacecast ptr addrspace(5) %16 to ptr
  %50 = addrspacecast ptr addrspace(5) %17 to ptr
  %51 = addrspacecast ptr addrspace(5) %18 to ptr
  %52 = addrspacecast ptr addrspace(5) %19 to ptr
  %53 = addrspacecast ptr addrspace(5) %20 to ptr
  %54 = addrspacecast ptr addrspace(5) %21 to ptr
  %55 = addrspacecast ptr addrspace(5) %22 to ptr
  %56 = addrspacecast ptr addrspace(5) %23 to ptr
  %57 = addrspacecast ptr addrspace(5) %24 to ptr
  %58 = addrspacecast ptr addrspace(5) %25 to ptr
  %59 = addrspacecast ptr addrspace(5) %26 to ptr
  %60 = addrspacecast ptr addrspace(5) %27 to ptr
  %61 = addrspacecast ptr addrspace(5) %28 to ptr
  %62 = addrspacecast ptr addrspace(5) %29 to ptr
  %63 = addrspacecast ptr addrspace(5) %30 to ptr
  %64 = addrspacecast ptr addrspace(5) %31 to ptr
  %65 = addrspacecast ptr addrspace(5) %32 to ptr
  %66 = addrspacecast ptr addrspace(5) %33 to ptr
  %67 = addrspacecast ptr addrspace(5) %34 to ptr
  %68 = addrspacecast ptr addrspace(5) %35 to ptr
  %69 = addrspacecast ptr addrspace(5) %36 to ptr
  %70 = addrspacecast ptr addrspace(5) %37 to ptr
  %71 = addrspacecast ptr addrspace(5) %38 to ptr
  %72 = addrspacecast ptr addrspace(5) %39 to ptr
  %73 = addrspacecast ptr addrspace(5) %40 to ptr
  %74 = addrspacecast ptr addrspace(5) %41 to ptr
  %75 = addrspacecast ptr addrspace(5) %42 to ptr
  %76 = addrspacecast ptr addrspace(5) %43 to ptr
  %77 = addrspacecast ptr addrspace(5) %44 to ptr
  %78 = addrspacecast ptr addrspace(5) %45 to ptr
  %79 = addrspacecast ptr addrspace(5) %46 to ptr
  %80 = addrspacecast ptr addrspace(5) %47 to ptr
  %81 = addrspacecast ptr addrspace(5) %48 to ptr
  %82 = addrspacecast ptr addrspace(1) %0 to ptr
  store ptr %82, ptr %49, align 8
  %83 = load ptr, ptr %49, align 8
  %84 = addrspacecast ptr addrspace(1) %1 to ptr
  store ptr %84, ptr %50, align 8
  %85 = load ptr, ptr %50, align 8
  %86 = addrspacecast ptr addrspace(1) %2 to ptr
  store ptr %86, ptr %51, align 8
  %87 = load ptr, ptr %51, align 8
  %88 = addrspacecast ptr addrspace(1) %3 to ptr
  store ptr %88, ptr %52, align 8
  %89 = load ptr, ptr %52, align 8
  store ptr %83, ptr %53, align 8
    #dbg_declare(ptr addrspace(5) %20, !1582, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(ptr)), !1706)
  store ptr %85, ptr %54, align 8
    #dbg_declare(ptr addrspace(5) %21, !1583, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(ptr)), !1707)
  store ptr %87, ptr %55, align 8
    #dbg_declare(ptr addrspace(5) %22, !1584, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(ptr)), !1708)
  store ptr %89, ptr %56, align 8
    #dbg_declare(ptr addrspace(5) %23, !1585, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(ptr)), !1709)
  store i32 %4, ptr %57, align 4
    #dbg_declare(ptr addrspace(5) %24, !1586, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1710)
  store i32 %5, ptr %58, align 4
    #dbg_declare(ptr addrspace(5) %25, !1587, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1711)
  store i32 %6, ptr %59, align 4
    #dbg_declare(ptr addrspace(5) %26, !1588, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1712)
  store i32 %7, ptr %60, align 4
    #dbg_declare(ptr addrspace(5) %27, !1589, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1713)
  store i32 %8, ptr %61, align 4
    #dbg_declare(ptr addrspace(5) %28, !1590, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1714)
    #dbg_declare(ptr addrspace(5) %29, !1591, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1715)
  %90 = addrspacecast ptr addrspace(5) %15 to ptr
  %91 = addrspacecast ptr addrspace(5) %12 to ptr
  %92 = call i64 @__ockl_get_local_size(i32 noundef 0) #14, !dbg !1716
  %93 = trunc i64 %92 to i32, !dbg !1716
  store i32 %93, ptr %62, align 4, !dbg !1715
    #dbg_declare(ptr addrspace(5) %30, !1592, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1735)
  %94 = addrspacecast ptr addrspace(5) %14 to ptr
  %95 = addrspacecast ptr addrspace(5) %11 to ptr
  %96 = call i64 @__ockl_get_group_id(i32 noundef 0) #14, !dbg !1736
  %97 = trunc i64 %96 to i32, !dbg !1736
  store i32 %97, ptr %63, align 4, !dbg !1735
    #dbg_declare(ptr addrspace(5) %31, !1593, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1751)
  %98 = addrspacecast ptr addrspace(5) %13 to ptr
  %99 = addrspacecast ptr addrspace(5) %10 to ptr
  %100 = call i64 @__ockl_get_local_id(i32 noundef 0) #14, !dbg !1752
  %101 = trunc i64 %100 to i32, !dbg !1752
  store i32 %101, ptr %64, align 4, !dbg !1751
    #dbg_declare(ptr addrspace(5) %32, !1594, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1767)
  %102 = load i32, ptr %62, align 4, !dbg !1768
  %103 = load i32, ptr %57, align 4, !dbg !1769
  %104 = load i32, ptr %58, align 4, !dbg !1770
  %105 = mul nsw i32 %103, %104, !dbg !1771
  %106 = mul nsw i32 %105, 2, !dbg !1772
  %107 = sub nsw i32 %102, %106, !dbg !1773
  store i32 %107, ptr %65, align 4, !dbg !1767
    #dbg_declare(ptr addrspace(5) %33, !1595, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1774)
  %108 = load i32, ptr %65, align 4, !dbg !1775
  %109 = load i32, ptr %63, align 4, !dbg !1776
  %110 = mul nsw i32 %108, %109, !dbg !1777
  %111 = load i32, ptr %59, align 4, !dbg !1778
  %112 = sub nsw i32 %110, %111, !dbg !1779
  store i32 %112, ptr %66, align 4, !dbg !1774
    #dbg_declare(ptr addrspace(5) %34, !1596, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1780)
  %113 = load i32, ptr %66, align 4, !dbg !1781
  %114 = load i32, ptr %62, align 4, !dbg !1782
  %115 = add nsw i32 %113, %114, !dbg !1783
  %116 = sub nsw i32 %115, 1, !dbg !1784
  store i32 %116, ptr %67, align 4, !dbg !1780
    #dbg_declare(ptr addrspace(5) %35, !1597, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1785)
  %117 = load i32, ptr %66, align 4, !dbg !1786
  %118 = load i32, ptr %64, align 4, !dbg !1787
  %119 = add nsw i32 %117, %118, !dbg !1788
  store i32 %119, ptr %68, align 4, !dbg !1785
    #dbg_declare(ptr addrspace(5) %36, !1598, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1789)
  %120 = load i32, ptr %66, align 4, !dbg !1790
  %121 = icmp slt i32 %120, 0, !dbg !1791
  br i1 %121, label %122, label %125, !dbg !1792

122:                                              ; preds = %9
  %123 = load i32, ptr %66, align 4, !dbg !1793
  %124 = sub nsw i32 0, %123, !dbg !1794
  br label %126, !dbg !1792

125:                                              ; preds = %9
  br label %126, !dbg !1792

126:                                              ; preds = %125, %122
  %127 = phi i32 [ %124, %122 ], [ 0, %125 ], !dbg !1792
  store i32 %127, ptr %69, align 4, !dbg !1789
    #dbg_declare(ptr addrspace(5) %37, !1599, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1795)
  %128 = load i32, ptr %67, align 4, !dbg !1796
  %129 = load i32, ptr %60, align 4, !dbg !1797
  %130 = sub nsw i32 %129, 1, !dbg !1798
  %131 = icmp sgt i32 %128, %130, !dbg !1799
  br i1 %131, label %132, label %140, !dbg !1800

132:                                              ; preds = %126
  %133 = load i32, ptr %62, align 4, !dbg !1801
  %134 = sub nsw i32 %133, 1, !dbg !1802
  %135 = load i32, ptr %67, align 4, !dbg !1803
  %136 = load i32, ptr %60, align 4, !dbg !1804
  %137 = sub nsw i32 %135, %136, !dbg !1805
  %138 = add nsw i32 %137, 1, !dbg !1806
  %139 = sub nsw i32 %134, %138, !dbg !1807
  br label %143, !dbg !1800

140:                                              ; preds = %126
  %141 = load i32, ptr %62, align 4, !dbg !1808
  %142 = sub nsw i32 %141, 1, !dbg !1809
  br label %143, !dbg !1800

143:                                              ; preds = %140, %132
  %144 = phi i32 [ %139, %132 ], [ %142, %140 ], !dbg !1800
  store i32 %144, ptr %70, align 4, !dbg !1795
    #dbg_declare(ptr addrspace(5) %38, !1600, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1810)
  %145 = load i32, ptr %64, align 4, !dbg !1811
  %146 = sub nsw i32 %145, 1, !dbg !1812
  store i32 %146, ptr %71, align 4, !dbg !1810
    #dbg_declare(ptr addrspace(5) %39, !1601, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1813)
  %147 = load i32, ptr %64, align 4, !dbg !1814
  %148 = add nsw i32 %147, 1, !dbg !1815
  store i32 %148, ptr %72, align 4, !dbg !1813
  %149 = load i32, ptr %71, align 4, !dbg !1816
  %150 = load i32, ptr %69, align 4, !dbg !1817
  %151 = icmp slt i32 %149, %150, !dbg !1818
  br i1 %151, label %152, label %154, !dbg !1819

152:                                              ; preds = %143
  %153 = load i32, ptr %69, align 4, !dbg !1820
  br label %156, !dbg !1819

154:                                              ; preds = %143
  %155 = load i32, ptr %71, align 4, !dbg !1821
  br label %156, !dbg !1819

156:                                              ; preds = %154, %152
  %157 = phi i32 [ %153, %152 ], [ %155, %154 ], !dbg !1819
  store i32 %157, ptr %71, align 4, !dbg !1822
  %158 = load i32, ptr %72, align 4, !dbg !1823
  %159 = load i32, ptr %70, align 4, !dbg !1824
  %160 = icmp sgt i32 %158, %159, !dbg !1825
  br i1 %160, label %161, label %163, !dbg !1826

161:                                              ; preds = %156
  %162 = load i32, ptr %70, align 4, !dbg !1827
  br label %165, !dbg !1826

163:                                              ; preds = %156
  %164 = load i32, ptr %72, align 4, !dbg !1828
  br label %165, !dbg !1826

165:                                              ; preds = %163, %161
  %166 = phi i32 [ %162, %161 ], [ %164, %163 ], !dbg !1826
  store i32 %166, ptr %72, align 4, !dbg !1829
    #dbg_declare(ptr addrspace(5) %40, !1602, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i8)), !1830)
  %167 = load i32, ptr %64, align 4, !dbg !1831
  %168 = load i32, ptr %69, align 4, !dbg !1831
  %169 = icmp sge i32 %167, %168, !dbg !1831
  br i1 %169, label %170, label %174, !dbg !1831

170:                                              ; preds = %165
  %171 = load i32, ptr %64, align 4, !dbg !1831
  %172 = load i32, ptr %70, align 4, !dbg !1831
  %173 = icmp sle i32 %171, %172, !dbg !1831
  br label %174

174:                                              ; preds = %170, %165
  %175 = phi i1 [ false, %165 ], [ %173, %170 ], !dbg !1832
  %176 = zext i1 %175 to i8, !dbg !1830
  store i8 %176, ptr %73, align 1, !dbg !1830
  %177 = load i32, ptr %68, align 4, !dbg !1833
  %178 = icmp sge i32 %177, 0, !dbg !1833
  br i1 %178, label %179, label %193, !dbg !1833

179:                                              ; preds = %174
  %180 = load i32, ptr %68, align 4, !dbg !1833
  %181 = load i32, ptr %60, align 4, !dbg !1833
  %182 = sub nsw i32 %181, 1, !dbg !1833
  %183 = icmp sle i32 %180, %182, !dbg !1833
  br i1 %183, label %184, label %193, !dbg !1835

184:                                              ; preds = %179
  %185 = load ptr, ptr %54, align 8, !dbg !1836
  %186 = load i32, ptr %68, align 4, !dbg !1838
  %187 = sext i32 %186 to i64, !dbg !1836
  %188 = getelementptr inbounds i32, ptr %185, i64 %187, !dbg !1836
  %189 = load i32, ptr %188, align 4, !dbg !1836
  %190 = load i32, ptr %64, align 4, !dbg !1839
  %191 = sext i32 %190 to i64, !dbg !1840
  %192 = getelementptr inbounds [250 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ10pathfinderPKiS0_PiS1_iiiiiE4prev to ptr), i64 0, i64 %191, !dbg !1840
  store i32 %189, ptr %192, align 4, !dbg !1841
  br label %193, !dbg !1842

193:                                              ; preds = %184, %179, %174
  call void @_Z13__syncthreadsv() #13, !dbg !1843
    #dbg_declare(ptr addrspace(5) %41, !1603, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i8)), !1844)
    #dbg_declare(ptr addrspace(5) %42, !1604, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1845)
  store i32 0, ptr %75, align 4, !dbg !1845
  br label %194, !dbg !1846

194:                                              ; preds = %295, %193
  %195 = load i32, ptr %75, align 4, !dbg !1847
  %196 = load i32, ptr %57, align 4, !dbg !1848
  %197 = icmp slt i32 %195, %196, !dbg !1849
  br i1 %197, label %198, label %298, !dbg !1850

198:                                              ; preds = %194
  store i8 0, ptr %74, align 1, !dbg !1851
  %199 = load i32, ptr %64, align 4, !dbg !1852
  %200 = load i32, ptr %75, align 4, !dbg !1852
  %201 = add nsw i32 %200, 1, !dbg !1852
  %202 = icmp sge i32 %199, %201, !dbg !1852
  br i1 %202, label %203, label %277, !dbg !1852

203:                                              ; preds = %198
  %204 = load i32, ptr %64, align 4, !dbg !1852
  %205 = load i32, ptr %62, align 4, !dbg !1852
  %206 = load i32, ptr %75, align 4, !dbg !1852
  %207 = sub nsw i32 %205, %206, !dbg !1852
  %208 = sub nsw i32 %207, 2, !dbg !1852
  %209 = icmp sle i32 %204, %208, !dbg !1852
  br i1 %209, label %210, label %277, !dbg !1853

210:                                              ; preds = %203
  %211 = load i8, ptr %73, align 1, !dbg !1854
  %212 = trunc i8 %211 to i1, !dbg !1854
  br i1 %212, label %213, label %277, !dbg !1855

213:                                              ; preds = %210
  store i8 1, ptr %74, align 1, !dbg !1856
    #dbg_declare(ptr addrspace(5) %43, !1606, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1857)
  %214 = load i32, ptr %71, align 4, !dbg !1858
  %215 = sext i32 %214 to i64, !dbg !1859
  %216 = getelementptr inbounds [250 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ10pathfinderPKiS0_PiS1_iiiiiE4prev to ptr), i64 0, i64 %215, !dbg !1859
  %217 = load i32, ptr %216, align 4, !dbg !1859
  store i32 %217, ptr %76, align 4, !dbg !1857
    #dbg_declare(ptr addrspace(5) %44, !1611, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1860)
  %218 = load i32, ptr %64, align 4, !dbg !1861
  %219 = sext i32 %218 to i64, !dbg !1862
  %220 = getelementptr inbounds [250 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ10pathfinderPKiS0_PiS1_iiiiiE4prev to ptr), i64 0, i64 %219, !dbg !1862
  %221 = load i32, ptr %220, align 4, !dbg !1862
  store i32 %221, ptr %77, align 4, !dbg !1860
    #dbg_declare(ptr addrspace(5) %45, !1612, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1863)
  %222 = load i32, ptr %72, align 4, !dbg !1864
  %223 = sext i32 %222 to i64, !dbg !1865
  %224 = getelementptr inbounds [250 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ10pathfinderPKiS0_PiS1_iiiiiE4prev to ptr), i64 0, i64 %223, !dbg !1865
  %225 = load i32, ptr %224, align 4, !dbg !1865
  store i32 %225, ptr %78, align 4, !dbg !1863
    #dbg_declare(ptr addrspace(5) %46, !1613, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1866)
  %226 = load i32, ptr %76, align 4, !dbg !1867
  %227 = load i32, ptr %77, align 4, !dbg !1867
  %228 = icmp sle i32 %226, %227, !dbg !1867
  br i1 %228, label %229, label %231, !dbg !1867

229:                                              ; preds = %213
  %230 = load i32, ptr %76, align 4, !dbg !1867
  br label %233, !dbg !1867

231:                                              ; preds = %213
  %232 = load i32, ptr %77, align 4, !dbg !1867
  br label %233, !dbg !1867

233:                                              ; preds = %231, %229
  %234 = phi i32 [ %230, %229 ], [ %232, %231 ], !dbg !1867
  store i32 %234, ptr %79, align 4, !dbg !1866
  %235 = load i32, ptr %79, align 4, !dbg !1868
  %236 = load i32, ptr %78, align 4, !dbg !1868
  %237 = icmp sle i32 %235, %236, !dbg !1868
  br i1 %237, label %238, label %240, !dbg !1868

238:                                              ; preds = %233
  %239 = load i32, ptr %79, align 4, !dbg !1868
  br label %242, !dbg !1868

240:                                              ; preds = %233
  %241 = load i32, ptr %78, align 4, !dbg !1868
  br label %242, !dbg !1868

242:                                              ; preds = %240, %238
  %243 = phi i32 [ %239, %238 ], [ %241, %240 ], !dbg !1868
  store i32 %243, ptr %79, align 4, !dbg !1869
    #dbg_declare(ptr addrspace(5) %47, !1614, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1870)
  %244 = load i32, ptr %60, align 4, !dbg !1871
  %245 = load i32, ptr %61, align 4, !dbg !1872
  %246 = load i32, ptr %75, align 4, !dbg !1873
  %247 = add nsw i32 %245, %246, !dbg !1874
  %248 = mul nsw i32 %244, %247, !dbg !1875
  %249 = load i32, ptr %68, align 4, !dbg !1876
  %250 = add nsw i32 %248, %249, !dbg !1877
  store i32 %250, ptr %80, align 4, !dbg !1870
  %251 = load i32, ptr %79, align 4, !dbg !1878
  %252 = load ptr, ptr %53, align 8, !dbg !1879
  %253 = load i32, ptr %80, align 4, !dbg !1880
  %254 = sext i32 %253 to i64, !dbg !1879
  %255 = getelementptr inbounds i32, ptr %252, i64 %254, !dbg !1879
  %256 = load i32, ptr %255, align 4, !dbg !1879
  %257 = add nsw i32 %251, %256, !dbg !1881
  %258 = load i32, ptr %64, align 4, !dbg !1882
  %259 = sext i32 %258 to i64, !dbg !1883
  %260 = getelementptr inbounds [250 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ10pathfinderPKiS0_PiS1_iiiiiE6result to ptr), i64 0, i64 %259, !dbg !1883
  store i32 %257, ptr %260, align 4, !dbg !1884
  %261 = load i32, ptr %64, align 4, !dbg !1885
  %262 = icmp eq i32 %261, 11, !dbg !1886
  br i1 %262, label %263, label %276, !dbg !1887

263:                                              ; preds = %242
  %264 = load i32, ptr %75, align 4, !dbg !1888
  %265 = icmp eq i32 %264, 0, !dbg !1889
  br i1 %265, label %266, label %276, !dbg !1890

266:                                              ; preds = %263
    #dbg_declare(ptr addrspace(5) %48, !1615, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1891)
  %267 = load ptr, ptr %54, align 8, !dbg !1892
  %268 = load i32, ptr %68, align 4, !dbg !1893
  %269 = sext i32 %268 to i64, !dbg !1892
  %270 = getelementptr inbounds i32, ptr %267, i64 %269, !dbg !1892
  %271 = load i32, ptr %270, align 4, !dbg !1892
  store i32 %271, ptr %81, align 4, !dbg !1891
  %272 = load ptr, ptr %56, align 8, !dbg !1894
  %273 = load i32, ptr %81, align 4, !dbg !1895
  %274 = sext i32 %273 to i64, !dbg !1894
  %275 = getelementptr inbounds i32, ptr %272, i64 %274, !dbg !1894
  store i32 1, ptr %275, align 4, !dbg !1896
  br label %276, !dbg !1897

276:                                              ; preds = %266, %263, %242
  br label %277, !dbg !1898

277:                                              ; preds = %276, %210, %203, %198
  call void @_Z13__syncthreadsv() #13, !dbg !1899
  %278 = load i32, ptr %75, align 4, !dbg !1900
  %279 = load i32, ptr %57, align 4, !dbg !1902
  %280 = sub nsw i32 %279, 1, !dbg !1903
  %281 = icmp eq i32 %278, %280, !dbg !1904
  br i1 %281, label %282, label %283, !dbg !1905

282:                                              ; preds = %277
  br label %298, !dbg !1906

283:                                              ; preds = %277
  %284 = load i8, ptr %74, align 1, !dbg !1908
  %285 = trunc i8 %284 to i1, !dbg !1908
  br i1 %285, label %286, label %294, !dbg !1910

286:                                              ; preds = %283
  %287 = load i32, ptr %64, align 4, !dbg !1911
  %288 = sext i32 %287 to i64, !dbg !1913
  %289 = getelementptr inbounds [250 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ10pathfinderPKiS0_PiS1_iiiiiE6result to ptr), i64 0, i64 %288, !dbg !1913
  %290 = load i32, ptr %289, align 4, !dbg !1913
  %291 = load i32, ptr %64, align 4, !dbg !1914
  %292 = sext i32 %291 to i64, !dbg !1915
  %293 = getelementptr inbounds [250 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ10pathfinderPKiS0_PiS1_iiiiiE4prev to ptr), i64 0, i64 %292, !dbg !1915
  store i32 %290, ptr %293, align 4, !dbg !1916
  br label %294, !dbg !1917

294:                                              ; preds = %286, %283
  call void @_Z13__syncthreadsv() #13, !dbg !1918
  br label %295, !dbg !1919

295:                                              ; preds = %294
  %296 = load i32, ptr %75, align 4, !dbg !1920
  %297 = add nsw i32 %296, 1, !dbg !1920
  store i32 %297, ptr %75, align 4, !dbg !1920
  br label %194, !dbg !1921, !llvm.loop !1922

298:                                              ; preds = %282, %194
  %299 = load i8, ptr %74, align 1, !dbg !1924
  %300 = trunc i8 %299 to i1, !dbg !1924
  br i1 %300, label %301, label %310, !dbg !1926

301:                                              ; preds = %298
  %302 = load i32, ptr %64, align 4, !dbg !1927
  %303 = sext i32 %302 to i64, !dbg !1929
  %304 = getelementptr inbounds [250 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ10pathfinderPKiS0_PiS1_iiiiiE6result to ptr), i64 0, i64 %303, !dbg !1929
  %305 = load i32, ptr %304, align 4, !dbg !1929
  %306 = load ptr, ptr %55, align 8, !dbg !1930
  %307 = load i32, ptr %68, align 4, !dbg !1931
  %308 = sext i32 %307 to i64, !dbg !1930
  %309 = getelementptr inbounds i32, ptr %306, i64 %308, !dbg !1930
  store i32 %305, ptr %309, align 4, !dbg !1932
  br label %310, !dbg !1933

310:                                              ; preds = %301, %298
  ret void, !dbg !1934
}

; Function Attrs: convergent mustprogress noinline nounwind optnone
define linkonce_odr hidden void @_Z13__syncthreadsv() #2 comdat !dbg !1935 {
  call void @_ZL9__barrieri(i32 noundef 1) #13, !dbg !1937
  ret void, !dbg !1938
}

; Function Attrs: convergent mustprogress noinline nounwind optnone
define internal void @_ZL9__barrieri(i32 noundef %0) #2 !dbg !1939 {
  %2 = alloca i32, align 4, addrspace(5)
  %3 = addrspacecast ptr addrspace(5) %2 to ptr
  store i32 %0, ptr %3, align 4
    #dbg_declare(ptr addrspace(5) %2, !1941, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1942)
  %4 = load i32, ptr %3, align 4, !dbg !1943
  call void @_ZL20__work_group_barrierj(i32 noundef %4) #13, !dbg !1944
  ret void, !dbg !1945
}

; Function Attrs: convergent mustprogress noinline nounwind optnone
define internal void @_ZL20__work_group_barrierj(i32 noundef %0) #2 !dbg !1946 {
  %2 = alloca i32, align 4, addrspace(5)
  %3 = addrspacecast ptr addrspace(5) %2 to ptr
  store i32 %0, ptr %3, align 4
    #dbg_declare(ptr addrspace(5) %2, !1950, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1951)
  %4 = load i32, ptr %3, align 4, !dbg !1952
  %5 = icmp ne i32 %4, 0, !dbg !1952
  br i1 %5, label %6, label %7, !dbg !1954

6:                                                ; preds = %1
  fence syncscope("workgroup") release, !dbg !1955
  call void @llvm.amdgcn.s.barrier(), !dbg !1957
  fence syncscope("workgroup") acquire, !dbg !1958
  br label %8, !dbg !1959

7:                                                ; preds = %1
  call void @llvm.amdgcn.s.barrier(), !dbg !1960
  br label %8

8:                                                ; preds = %7, %6
  ret void, !dbg !1962
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
  %10 = load i32, ptr addrspace(4) @__oclc_ABI_version, align 4, !tbaa !1963
  %11 = icmp slt i32 %10, 500
  %12 = tail call ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %13 = select i1 %11, i64 24, i64 80
  %14 = getelementptr inbounds i8, ptr addrspace(4) %12, i64 %13
  %15 = load i64, ptr addrspace(4) %14, align 8, !tbaa !1967
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
  %20 = load ptr addrspace(1), ptr addrspace(1) %14, align 8, !tbaa !1969
  %21 = load i64, ptr addrspace(1) %19, align 8, !tbaa !1973
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
  %30 = load ptr addrspace(1), ptr addrspace(1) %14, align 8, !tbaa !1969
  %31 = load i64, ptr addrspace(1) %19, align 8, !tbaa !1973
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
  %49 = load ptr addrspace(1), ptr addrspace(1) %14, align 8, !tbaa !1969
  %50 = getelementptr i8, ptr addrspace(1) %14, i64 40
  %51 = load i64, ptr addrspace(1) %50, align 8, !tbaa !1973
  %52 = and i64 %48, %51
  %53 = getelementptr inbounds %0, ptr addrspace(1) %49, i64 %52
  %54 = getelementptr i8, ptr addrspace(1) %14, i64 8
  %55 = load ptr addrspace(1), ptr addrspace(1) %54, align 8, !tbaa !1974
  %56 = getelementptr inbounds %1, ptr addrspace(1) %55, i64 %52
  %57 = tail call i64 @llvm.amdgcn.ballot.i64(i1 true)
  br i1 %15, label %58, label %62

58:                                               ; preds = %38
  %59 = getelementptr inbounds i8, ptr addrspace(1) %53, i64 16
  %60 = getelementptr inbounds i8, ptr addrspace(1) %53, i64 8
  %61 = getelementptr inbounds i8, ptr addrspace(1) %53, i64 20
  store i32 %1, ptr addrspace(1) %59, align 8, !tbaa !1975
  store i64 %57, ptr addrspace(1) %60, align 8, !tbaa !1977
  store i32 1, ptr addrspace(1) %61, align 4, !tbaa !1978
  br label %62

62:                                               ; preds = %58, %38
  %63 = zext i32 %12 to i64
  %64 = getelementptr inbounds [64 x [8 x i64]], ptr addrspace(1) %56, i64 0, i64 %63
  store i64 %2, ptr addrspace(1) %64, align 8, !tbaa !1967
  %65 = getelementptr inbounds i8, ptr addrspace(1) %64, i64 8
  store i64 %3, ptr addrspace(1) %65, align 8, !tbaa !1967
  %66 = getelementptr inbounds i8, ptr addrspace(1) %64, i64 16
  store i64 %4, ptr addrspace(1) %66, align 8, !tbaa !1967
  %67 = getelementptr inbounds i8, ptr addrspace(1) %64, i64 24
  store i64 %5, ptr addrspace(1) %67, align 8, !tbaa !1967
  %68 = getelementptr inbounds i8, ptr addrspace(1) %64, i64 32
  store i64 %6, ptr addrspace(1) %68, align 8, !tbaa !1967
  %69 = getelementptr inbounds i8, ptr addrspace(1) %64, i64 40
  store i64 %7, ptr addrspace(1) %69, align 8, !tbaa !1967
  %70 = getelementptr inbounds i8, ptr addrspace(1) %64, i64 48
  store i64 %8, ptr addrspace(1) %70, align 8, !tbaa !1967
  %71 = getelementptr inbounds i8, ptr addrspace(1) %64, i64 56
  store i64 %9, ptr addrspace(1) %71, align 8, !tbaa !1967
  br i1 %15, label %72, label %88

72:                                               ; preds = %62
  %73 = getelementptr inbounds i8, ptr addrspace(1) %14, i64 32
  %74 = load atomic i64, ptr addrspace(1) %73 syncscope("one-as") monotonic, align 8
  %75 = load i64, ptr addrspace(1) %50, align 8, !tbaa !1973
  %76 = and i64 %75, %48
  %77 = getelementptr inbounds %0, ptr addrspace(1) %49, i64 %76
  store i64 %74, ptr addrspace(1) %77, align 8, !tbaa !1979
  %78 = cmpxchg ptr addrspace(1) %73, i64 %74, i64 %48 syncscope("one-as") release monotonic, align 8
  %79 = extractvalue { i64, i1 } %78, 1
  br i1 %79, label %85, label %80

80:                                               ; preds = %80, %72
  %81 = phi { i64, i1 } [ %83, %80 ], [ %78, %72 ]
  %82 = extractvalue { i64, i1 } %81, 0
  tail call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %82, ptr addrspace(1) %77, align 8, !tbaa !1979
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
  %100 = load i64, ptr addrspace(1) %64, align 8, !tbaa !1967
  %101 = load i64, ptr addrspace(1) %65, align 8, !tbaa !1967
  br i1 %15, label %102, label %120

102:                                              ; preds = %99
  %103 = load i64, ptr addrspace(1) %50, align 8, !tbaa !1973
  %104 = add i64 %103, 1
  %105 = add i64 %104, %48
  %106 = icmp eq i64 %105, 0
  %107 = select i1 %106, i64 %104, i64 %105
  %108 = getelementptr inbounds i8, ptr addrspace(1) %14, i64 24
  %109 = load atomic i64, ptr addrspace(1) %108 syncscope("one-as") monotonic, align 8
  %110 = load ptr addrspace(1), ptr addrspace(1) %14, align 8, !tbaa !1969
  %111 = and i64 %107, %103
  %112 = getelementptr inbounds %0, ptr addrspace(1) %110, i64 %111
  store i64 %109, ptr addrspace(1) %112, align 8, !tbaa !1979
  %113 = cmpxchg ptr addrspace(1) %108, i64 %109, i64 %107 syncscope("one-as") release monotonic, align 8
  %114 = extractvalue { i64, i1 } %113, 1
  br i1 %114, label %120, label %115

115:                                              ; preds = %115, %102
  %116 = phi { i64, i1 } [ %118, %115 ], [ %113, %102 ]
  %117 = extractvalue { i64, i1 } %116, 0
  tail call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %117, ptr addrspace(1) %112, align 8, !tbaa !1979
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
  %18 = load i64, ptr addrspace(1) %17, align 16, !tbaa !1980
  %19 = icmp eq i64 %18, 0
  br i1 %19, label %34, label %20

20:                                               ; preds = %16
  %21 = inttoptr i64 %18 to ptr addrspace(1)
  %22 = getelementptr inbounds i8, ptr addrspace(1) %4, i64 24
  %23 = load i32, ptr addrspace(1) %22, align 8, !tbaa !1982
  %24 = zext i32 %23 to i64
  store atomic i64 %24, ptr addrspace(1) %21 syncscope("one-as") release, align 8
  %25 = load i32, ptr addrspace(4) @__oclc_ISA_version, align 4, !tbaa !1963
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
  %33 = load i8, ptr %19, align 1, !tbaa !1983
  %34 = zext i8 %33 to i64
  %35 = getelementptr inbounds i8, ptr %19, i64 1
  %36 = load i8, ptr %35, align 1, !tbaa !1983
  %37 = zext i8 %36 to i64
  %38 = shl nuw nsw i64 %37, 8
  %39 = or disjoint i64 %38, %34
  %40 = getelementptr inbounds i8, ptr %19, i64 2
  %41 = load i8, ptr %40, align 1, !tbaa !1983
  %42 = zext i8 %41 to i64
  %43 = shl nuw nsw i64 %42, 16
  %44 = or disjoint i64 %39, %43
  %45 = getelementptr inbounds i8, ptr %19, i64 3
  %46 = load i8, ptr %45, align 1, !tbaa !1983
  %47 = zext i8 %46 to i64
  %48 = shl nuw nsw i64 %47, 24
  %49 = or disjoint i64 %44, %48
  %50 = getelementptr inbounds i8, ptr %19, i64 4
  %51 = load i8, ptr %50, align 1, !tbaa !1983
  %52 = zext i8 %51 to i64
  %53 = shl nuw nsw i64 %52, 32
  %54 = or disjoint i64 %49, %53
  %55 = getelementptr inbounds i8, ptr %19, i64 5
  %56 = load i8, ptr %55, align 1, !tbaa !1983
  %57 = zext i8 %56 to i64
  %58 = shl nuw nsw i64 %57, 40
  %59 = or i64 %54, %58
  %60 = getelementptr inbounds i8, ptr %19, i64 6
  %61 = load i8, ptr %60, align 1, !tbaa !1983
  %62 = zext i8 %61 to i64
  %63 = shl nuw nsw i64 %62, 48
  %64 = or i64 %59, %63
  %65 = getelementptr inbounds i8, ptr %19, i64 7
  %66 = load i8, ptr %65, align 1, !tbaa !1983
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
  %77 = load i8, ptr %76, align 1, !tbaa !1983
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
  %93 = load i8, ptr %86, align 1, !tbaa !1983
  %94 = zext i8 %93 to i64
  %95 = getelementptr inbounds i8, ptr %86, i64 1
  %96 = load i8, ptr %95, align 1, !tbaa !1983
  %97 = zext i8 %96 to i64
  %98 = shl nuw nsw i64 %97, 8
  %99 = or disjoint i64 %98, %94
  %100 = getelementptr inbounds i8, ptr %86, i64 2
  %101 = load i8, ptr %100, align 1, !tbaa !1983
  %102 = zext i8 %101 to i64
  %103 = shl nuw nsw i64 %102, 16
  %104 = or disjoint i64 %99, %103
  %105 = getelementptr inbounds i8, ptr %86, i64 3
  %106 = load i8, ptr %105, align 1, !tbaa !1983
  %107 = zext i8 %106 to i64
  %108 = shl nuw nsw i64 %107, 24
  %109 = or disjoint i64 %104, %108
  %110 = getelementptr inbounds i8, ptr %86, i64 4
  %111 = load i8, ptr %110, align 1, !tbaa !1983
  %112 = zext i8 %111 to i64
  %113 = shl nuw nsw i64 %112, 32
  %114 = or disjoint i64 %109, %113
  %115 = getelementptr inbounds i8, ptr %86, i64 5
  %116 = load i8, ptr %115, align 1, !tbaa !1983
  %117 = zext i8 %116 to i64
  %118 = shl nuw nsw i64 %117, 40
  %119 = or i64 %114, %118
  %120 = getelementptr inbounds i8, ptr %86, i64 6
  %121 = load i8, ptr %120, align 1, !tbaa !1983
  %122 = zext i8 %121 to i64
  %123 = shl nuw nsw i64 %122, 48
  %124 = or i64 %119, %123
  %125 = getelementptr inbounds i8, ptr %86, i64 7
  %126 = load i8, ptr %125, align 1, !tbaa !1983
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
  %137 = load i8, ptr %136, align 1, !tbaa !1983
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
  %153 = load i8, ptr %146, align 1, !tbaa !1983
  %154 = zext i8 %153 to i64
  %155 = getelementptr inbounds i8, ptr %146, i64 1
  %156 = load i8, ptr %155, align 1, !tbaa !1983
  %157 = zext i8 %156 to i64
  %158 = shl nuw nsw i64 %157, 8
  %159 = or disjoint i64 %158, %154
  %160 = getelementptr inbounds i8, ptr %146, i64 2
  %161 = load i8, ptr %160, align 1, !tbaa !1983
  %162 = zext i8 %161 to i64
  %163 = shl nuw nsw i64 %162, 16
  %164 = or disjoint i64 %159, %163
  %165 = getelementptr inbounds i8, ptr %146, i64 3
  %166 = load i8, ptr %165, align 1, !tbaa !1983
  %167 = zext i8 %166 to i64
  %168 = shl nuw nsw i64 %167, 24
  %169 = or disjoint i64 %164, %168
  %170 = getelementptr inbounds i8, ptr %146, i64 4
  %171 = load i8, ptr %170, align 1, !tbaa !1983
  %172 = zext i8 %171 to i64
  %173 = shl nuw nsw i64 %172, 32
  %174 = or disjoint i64 %169, %173
  %175 = getelementptr inbounds i8, ptr %146, i64 5
  %176 = load i8, ptr %175, align 1, !tbaa !1983
  %177 = zext i8 %176 to i64
  %178 = shl nuw nsw i64 %177, 40
  %179 = or i64 %174, %178
  %180 = getelementptr inbounds i8, ptr %146, i64 6
  %181 = load i8, ptr %180, align 1, !tbaa !1983
  %182 = zext i8 %181 to i64
  %183 = shl nuw nsw i64 %182, 48
  %184 = or i64 %179, %183
  %185 = getelementptr inbounds i8, ptr %146, i64 7
  %186 = load i8, ptr %185, align 1, !tbaa !1983
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
  %197 = load i8, ptr %196, align 1, !tbaa !1983
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
  %213 = load i8, ptr %206, align 1, !tbaa !1983
  %214 = zext i8 %213 to i64
  %215 = getelementptr inbounds i8, ptr %206, i64 1
  %216 = load i8, ptr %215, align 1, !tbaa !1983
  %217 = zext i8 %216 to i64
  %218 = shl nuw nsw i64 %217, 8
  %219 = or disjoint i64 %218, %214
  %220 = getelementptr inbounds i8, ptr %206, i64 2
  %221 = load i8, ptr %220, align 1, !tbaa !1983
  %222 = zext i8 %221 to i64
  %223 = shl nuw nsw i64 %222, 16
  %224 = or disjoint i64 %219, %223
  %225 = getelementptr inbounds i8, ptr %206, i64 3
  %226 = load i8, ptr %225, align 1, !tbaa !1983
  %227 = zext i8 %226 to i64
  %228 = shl nuw nsw i64 %227, 24
  %229 = or disjoint i64 %224, %228
  %230 = getelementptr inbounds i8, ptr %206, i64 4
  %231 = load i8, ptr %230, align 1, !tbaa !1983
  %232 = zext i8 %231 to i64
  %233 = shl nuw nsw i64 %232, 32
  %234 = or disjoint i64 %229, %233
  %235 = getelementptr inbounds i8, ptr %206, i64 5
  %236 = load i8, ptr %235, align 1, !tbaa !1983
  %237 = zext i8 %236 to i64
  %238 = shl nuw nsw i64 %237, 40
  %239 = or i64 %234, %238
  %240 = getelementptr inbounds i8, ptr %206, i64 6
  %241 = load i8, ptr %240, align 1, !tbaa !1983
  %242 = zext i8 %241 to i64
  %243 = shl nuw nsw i64 %242, 48
  %244 = or i64 %239, %243
  %245 = getelementptr inbounds i8, ptr %206, i64 7
  %246 = load i8, ptr %245, align 1, !tbaa !1983
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
  %257 = load i8, ptr %256, align 1, !tbaa !1983
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
  %273 = load i8, ptr %266, align 1, !tbaa !1983
  %274 = zext i8 %273 to i64
  %275 = getelementptr inbounds i8, ptr %266, i64 1
  %276 = load i8, ptr %275, align 1, !tbaa !1983
  %277 = zext i8 %276 to i64
  %278 = shl nuw nsw i64 %277, 8
  %279 = or disjoint i64 %278, %274
  %280 = getelementptr inbounds i8, ptr %266, i64 2
  %281 = load i8, ptr %280, align 1, !tbaa !1983
  %282 = zext i8 %281 to i64
  %283 = shl nuw nsw i64 %282, 16
  %284 = or disjoint i64 %279, %283
  %285 = getelementptr inbounds i8, ptr %266, i64 3
  %286 = load i8, ptr %285, align 1, !tbaa !1983
  %287 = zext i8 %286 to i64
  %288 = shl nuw nsw i64 %287, 24
  %289 = or disjoint i64 %284, %288
  %290 = getelementptr inbounds i8, ptr %266, i64 4
  %291 = load i8, ptr %290, align 1, !tbaa !1983
  %292 = zext i8 %291 to i64
  %293 = shl nuw nsw i64 %292, 32
  %294 = or disjoint i64 %289, %293
  %295 = getelementptr inbounds i8, ptr %266, i64 5
  %296 = load i8, ptr %295, align 1, !tbaa !1983
  %297 = zext i8 %296 to i64
  %298 = shl nuw nsw i64 %297, 40
  %299 = or i64 %294, %298
  %300 = getelementptr inbounds i8, ptr %266, i64 6
  %301 = load i8, ptr %300, align 1, !tbaa !1983
  %302 = zext i8 %301 to i64
  %303 = shl nuw nsw i64 %302, 48
  %304 = or i64 %299, %303
  %305 = getelementptr inbounds i8, ptr %266, i64 7
  %306 = load i8, ptr %305, align 1, !tbaa !1983
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
  %317 = load i8, ptr %316, align 1, !tbaa !1983
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
  %333 = load i8, ptr %326, align 1, !tbaa !1983
  %334 = zext i8 %333 to i64
  %335 = getelementptr inbounds i8, ptr %326, i64 1
  %336 = load i8, ptr %335, align 1, !tbaa !1983
  %337 = zext i8 %336 to i64
  %338 = shl nuw nsw i64 %337, 8
  %339 = or disjoint i64 %338, %334
  %340 = getelementptr inbounds i8, ptr %326, i64 2
  %341 = load i8, ptr %340, align 1, !tbaa !1983
  %342 = zext i8 %341 to i64
  %343 = shl nuw nsw i64 %342, 16
  %344 = or disjoint i64 %339, %343
  %345 = getelementptr inbounds i8, ptr %326, i64 3
  %346 = load i8, ptr %345, align 1, !tbaa !1983
  %347 = zext i8 %346 to i64
  %348 = shl nuw nsw i64 %347, 24
  %349 = or disjoint i64 %344, %348
  %350 = getelementptr inbounds i8, ptr %326, i64 4
  %351 = load i8, ptr %350, align 1, !tbaa !1983
  %352 = zext i8 %351 to i64
  %353 = shl nuw nsw i64 %352, 32
  %354 = or disjoint i64 %349, %353
  %355 = getelementptr inbounds i8, ptr %326, i64 5
  %356 = load i8, ptr %355, align 1, !tbaa !1983
  %357 = zext i8 %356 to i64
  %358 = shl nuw nsw i64 %357, 40
  %359 = or i64 %354, %358
  %360 = getelementptr inbounds i8, ptr %326, i64 6
  %361 = load i8, ptr %360, align 1, !tbaa !1983
  %362 = zext i8 %361 to i64
  %363 = shl nuw nsw i64 %362, 48
  %364 = or i64 %359, %363
  %365 = getelementptr inbounds i8, ptr %326, i64 7
  %366 = load i8, ptr %365, align 1, !tbaa !1983
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
  %377 = load i8, ptr %376, align 1, !tbaa !1983
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
  %393 = load i8, ptr %386, align 1, !tbaa !1983
  %394 = zext i8 %393 to i64
  %395 = getelementptr inbounds i8, ptr %386, i64 1
  %396 = load i8, ptr %395, align 1, !tbaa !1983
  %397 = zext i8 %396 to i64
  %398 = shl nuw nsw i64 %397, 8
  %399 = or disjoint i64 %398, %394
  %400 = getelementptr inbounds i8, ptr %386, i64 2
  %401 = load i8, ptr %400, align 1, !tbaa !1983
  %402 = zext i8 %401 to i64
  %403 = shl nuw nsw i64 %402, 16
  %404 = or disjoint i64 %399, %403
  %405 = getelementptr inbounds i8, ptr %386, i64 3
  %406 = load i8, ptr %405, align 1, !tbaa !1983
  %407 = zext i8 %406 to i64
  %408 = shl nuw nsw i64 %407, 24
  %409 = or disjoint i64 %404, %408
  %410 = getelementptr inbounds i8, ptr %386, i64 4
  %411 = load i8, ptr %410, align 1, !tbaa !1983
  %412 = zext i8 %411 to i64
  %413 = shl nuw nsw i64 %412, 32
  %414 = or disjoint i64 %409, %413
  %415 = getelementptr inbounds i8, ptr %386, i64 5
  %416 = load i8, ptr %415, align 1, !tbaa !1983
  %417 = zext i8 %416 to i64
  %418 = shl nuw nsw i64 %417, 40
  %419 = or i64 %414, %418
  %420 = getelementptr inbounds i8, ptr %386, i64 6
  %421 = load i8, ptr %420, align 1, !tbaa !1983
  %422 = zext i8 %421 to i64
  %423 = shl nuw nsw i64 %422, 48
  %424 = or i64 %419, %423
  %425 = getelementptr inbounds i8, ptr %386, i64 7
  %426 = load i8, ptr %425, align 1, !tbaa !1983
  %427 = zext i8 %426 to i64
  %428 = shl nuw i64 %427, 56
  %429 = or i64 %424, %428
  br label %443

430:                                              ; preds = %430, %390
  %431 = phi i32 [ %441, %430 ], [ 0, %390 ]
  %432 = phi i64 [ %440, %430 ], [ 0, %390 ]
  %433 = zext nneg i32 %431 to i64
  %434 = getelementptr inbounds i8, ptr %386, i64 %433
  %435 = load i8, ptr %434, align 1, !tbaa !1983
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
  %9 = load i16, ptr addrspace(4) %8, align 4, !range !1984, !invariant.load !1985, !noundef !1985
  %10 = zext nneg i16 %9 to i32
  %11 = getelementptr inbounds i8, ptr addrspace(4) %6, i64 12
  %12 = load i32, ptr addrspace(4) %11, align 4, !tbaa !1986
  %13 = mul i32 %7, %10
  %14 = sub i32 %12, %13
  %15 = tail call i32 @llvm.umin.i32(i32 %14, i32 %10)
  %16 = zext nneg i32 %15 to i64
  br label %76

17:                                               ; preds = %2
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %19 = tail call ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %20 = load i32, ptr addrspace(4) %19, align 4, !tbaa !1963
  %21 = icmp ult i32 %18, %20
  %22 = select i1 %21, i64 12, i64 18
  %23 = getelementptr inbounds i8, ptr addrspace(4) %19, i64 %22
  %24 = load i16, ptr addrspace(4) %23, align 2, !tbaa !1989
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
  %33 = load i16, ptr addrspace(4) %32, align 2, !range !1984, !invariant.load !1985, !noundef !1985
  %34 = zext nneg i16 %33 to i32
  %35 = getelementptr inbounds i8, ptr addrspace(4) %30, i64 16
  %36 = load i32, ptr addrspace(4) %35, align 8, !tbaa !1990
  %37 = mul i32 %31, %34
  %38 = sub i32 %36, %37
  %39 = tail call i32 @llvm.umin.i32(i32 %38, i32 %34)
  %40 = zext nneg i32 %39 to i64
  br label %76

41:                                               ; preds = %26
  %42 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %43 = tail call ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %44 = getelementptr inbounds i8, ptr addrspace(4) %43, i64 4
  %45 = load i32, ptr addrspace(4) %44, align 4, !tbaa !1963
  %46 = icmp ult i32 %42, %45
  %47 = select i1 %46, i64 14, i64 20
  %48 = getelementptr inbounds i8, ptr addrspace(4) %43, i64 %47
  %49 = load i16, ptr addrspace(4) %48, align 2, !tbaa !1989
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
  %58 = load i16, ptr addrspace(4) %57, align 4, !range !1984, !invariant.load !1985, !noundef !1985
  %59 = zext nneg i16 %58 to i32
  %60 = getelementptr inbounds i8, ptr addrspace(4) %55, i64 20
  %61 = load i32, ptr addrspace(4) %60, align 4, !tbaa !1991
  %62 = mul i32 %56, %59
  %63 = sub i32 %61, %62
  %64 = tail call i32 @llvm.umin.i32(i32 %63, i32 %59)
  %65 = zext nneg i32 %64 to i64
  br label %76

66:                                               ; preds = %51
  %67 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %68 = tail call ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %69 = getelementptr inbounds i8, ptr addrspace(4) %68, i64 8
  %70 = load i32, ptr addrspace(4) %69, align 4, !tbaa !1963
  %71 = icmp ult i32 %67, %70
  %72 = select i1 %71, i64 16, i64 22
  %73 = getelementptr inbounds i8, ptr addrspace(4) %68, i64 %72
  %74 = load i16, ptr addrspace(4) %73, align 2, !tbaa !1989
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

!llvm.dbg.cu = !{!12}
!llvm.module.flags = !{!1618, !1619, !1620, !1621, !1622, !1623, !1624}
!llvm.ident = !{!1625, !1625, !1625, !1625, !1625, !1625, !1625, !1625, !1625, !1625, !1625}
!opencl.ocl.version = !{!1626, !1626, !1626, !1626, !1626, !1626, !1626, !1626, !1626, !1626}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression(DIOpArg(0, ptr addrspace(3)), DIOpDeref([250 x i32])))
!1 = distinct !DIGlobalVariable(name: "prev", scope: !2, file: !3, line: 57, type: !35, isLocal: true, isDefinition: true, memorySpace: DW_MSPACE_LLVM_group)
!2 = distinct !DISubprogram(name: "pathfinder", linkageName: "_Z10pathfinderPKiS0_PiS1_iiiii", scope: !3, file: !3, line: 43, type: !4, scopeLine: 53, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !1581)
!3 = !DIFile(filename: "HeCBench/src/pathfinder-hip/main.cu", directory: "/ccs/home/mdunlavy/GPU_FI", checksumkind: CSK_MD5, checksum: "5b7535d1e33d7876af7ac58f08b9e134")
!4 = !DISubroutineType(types: !5)
!5 = !{null, !6, !6, !10, !10, !8, !8, !8, !8, !8}
!6 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !7)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !9)
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !11)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!12 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !13, producer: "AMD clang version 19.0.0git (https://github.com/RadeonOpenCompute/llvm-project roc-6.4.2 25224 d366fa84f3fdcbd4b10847ebd5db572ae12a34fb)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !14, globals: !32, imports: !38, splitDebugInlining: false, nameTableKind: None)
!13 = !DIFile(filename: "/ccs/home/mdunlavy/GPU_FI/HeCBench/src/pathfinder-hip/main.cu", directory: "/ccs/home/mdunlavy/GPU_FI", checksumkind: CSK_MD5, checksum: "5b7535d1e33d7876af7ac58f08b9e134")
!14 = !{!15, !18}
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "__cl_mem_fence_flags", file: !16, line: 131, baseType: !17)
!16 = !DIFile(filename: "/opt/rocm-6.4.2/include/hip/amd_detail/device_library_decls.h", directory: "", checksumkind: CSK_MD5, checksum: "61416ae22a8962f94d70fdb29c9fe093")
!17 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!18 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dim3", file: !19, line: 1179, size: 96, flags: DIFlagTypePassByValue | DIFlagNonTrivial, elements: !20, identifier: "_ZTS4dim3")
!19 = !DIFile(filename: "/opt/rocm-6.4.2/include/hip/hip_runtime_api.h", directory: "", checksumkind: CSK_MD5, checksum: "2a1ac901d8db5ef891d901275c66dbab")
!20 = !{!21, !26, !27, !28}
!21 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !18, file: !19, line: 1180, baseType: !22, size: 32)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !23, line: 26, baseType: !24)
!23 = !DIFile(filename: "/usr/include/bits/stdint-uintn.h", directory: "", checksumkind: CSK_MD5, checksum: "4ecee94d7257cd86659727d06a979b60")
!24 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !25, line: 42, baseType: !17)
!25 = !DIFile(filename: "/usr/include/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "4a64d909bcfa62a0a7682c3ac78c6965")
!26 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !18, file: !19, line: 1181, baseType: !22, size: 32, offset: 32)
!27 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !18, file: !19, line: 1182, baseType: !22, size: 32, offset: 64)
!28 = !DISubprogram(name: "dim3", scope: !18, file: !19, line: 1184, type: !29, scopeLine: 1184, flags: DIFlagPrototyped, spFlags: 0)
!29 = !DISubroutineType(types: !30)
!30 = !{null, !31, !22, !22, !22}
!31 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!32 = !{!0, !33}
!33 = !DIGlobalVariableExpression(var: !34, expr: !DIExpression(DIOpArg(0, ptr addrspace(3)), DIOpDeref([250 x i32])))
!34 = distinct !DIGlobalVariable(name: "result", scope: !2, file: !3, line: 58, type: !35, isLocal: true, isDefinition: true, memorySpace: DW_MSPACE_LLVM_group)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 8000, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 250)
!38 = !{!39, !46, !53, !55, !57, !61, !63, !65, !67, !69, !71, !73, !75, !79, !83, !85, !87, !92, !94, !96, !98, !100, !102, !104, !107, !110, !112, !116, !121, !123, !125, !127, !129, !131, !133, !135, !137, !139, !141, !145, !149, !151, !153, !155, !157, !159, !161, !163, !165, !167, !169, !171, !173, !175, !177, !179, !183, !187, !191, !193, !195, !197, !199, !201, !203, !205, !207, !209, !213, !217, !221, !223, !225, !227, !232, !236, !240, !242, !244, !246, !248, !250, !252, !254, !256, !258, !260, !262, !264, !269, !273, !277, !279, !281, !283, !290, !294, !298, !300, !302, !304, !306, !308, !310, !314, !318, !320, !322, !324, !326, !330, !334, !338, !340, !342, !344, !346, !348, !350, !354, !358, !362, !364, !368, !372, !374, !376, !378, !380, !382, !384, !388, !392, !398, !402, !410, !415, !417, !419, !423, !427, !437, !439, !443, !447, !451, !456, !460, !464, !468, !472, !480, !484, !488, !490, !494, !498, !502, !508, !512, !516, !518, !526, !530, !537, !539, !543, !547, !551, !555, !560, !564, !568, !569, !570, !571, !573, !574, !575, !576, !577, !578, !579, !581, !582, !583, !584, !585, !586, !587, !588, !593, !594, !595, !596, !597, !598, !599, !600, !601, !602, !603, !604, !605, !606, !607, !608, !609, !610, !611, !612, !613, !614, !615, !616, !617, !620, !622, !624, !626, !628, !630, !632, !634, !636, !638, !640, !642, !644, !646, !648, !650, !652, !654, !656, !658, !660, !662, !664, !666, !668, !670, !674, !676, !678, !683, !687, !689, !691, !693, !695, !697, !699, !701, !703, !705, !707, !709, !711, !713, !715, !717, !719, !721, !723, !725, !727, !729, !734, !736, !738, !740, !742, !744, !746, !748, !750, !752, !754, !756, !758, !760, !762, !764, !766, !768, !770, !772, !776, !778, !780, !782, !784, !786, !788, !790, !792, !794, !796, !798, !800, !802, !804, !806, !808, !810, !812, !814, !816, !818, !820, !822, !824, !826, !828, !830, !832, !834, !836, !838, !840, !842, !844, !846, !848, !850, !852, !854, !856, !858, !860, !862, !864, !866, !868, !870, !872, !874, !876, !878, !880, !882, !884, !888, !892, !897, !914, !917, !922, !930, !935, !939, !943, !947, !951, !953, !955, !959, !965, !969, !975, !981, !983, !987, !991, !995, !999, !1006, !1008, !1012, !1016, !1020, !1022, !1026, !1030, !1034, !1036, !1038, !1042, !1050, !1054, !1058, !1062, !1064, !1070, !1072, !1078, !1082, !1086, !1090, !1094, !1098, !1102, !1104, !1106, !1110, !1114, !1118, !1120, !1124, !1128, !1130, !1132, !1136, !1140, !1144, !1148, !1149, !1150, !1151, !1152, !1153, !1154, !1155, !1156, !1157, !1158, !1162, !1166, !1171, !1175, !1177, !1179, !1181, !1183, !1185, !1187, !1189, !1191, !1193, !1195, !1197, !1199, !1201, !1205, !1211, !1216, !1220, !1222, !1224, !1226, !1228, !1235, !1239, !1243, !1247, !1251, !1255, !1260, !1264, !1266, !1270, !1276, !1280, !1285, !1287, !1289, !1293, !1297, !1299, !1301, !1303, !1305, !1309, !1311, !1313, !1317, !1321, !1325, !1329, !1333, !1337, !1339, !1343, !1347, !1351, !1355, !1357, !1359, !1363, !1367, !1368, !1369, !1370, !1371, !1372, !1380, !1387, !1390, !1391, !1393, !1395, !1397, !1399, !1403, !1405, !1407, !1409, !1411, !1413, !1415, !1417, !1419, !1423, !1427, !1429, !1433, !1437, !1443, !1447, !1449, !1452, !1455, !1457, !1459, !1461, !1464, !1467, !1470, !1473, !1476, !1478, !1482, !1486, !1487, !1490, !1492, !1494, !1496, !1498, !1501, !1504, !1507, !1510, !1513, !1515, !1520, !1524, !1525, !1530, !1534, !1539, !1544, !1548, !1554, !1558, !1560, !1564, !1571, !1576}
!39 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !41, file: !45, line: 52)
!40 = !DINamespace(name: "std", scope: null)
!41 = !DISubprogram(name: "abs", scope: !42, file: !42, line: 980, type: !43, flags: DIFlagPrototyped, spFlags: 0)
!42 = !DIFile(filename: "/usr/include/stdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "761a239547e58b18c7327eb395f5cc1f")
!43 = !DISubroutineType(types: !44)
!44 = !{!9, !9}
!45 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/bits/std_abs.h", directory: "")
!46 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !47, file: !52, line: 85)
!47 = !DISubprogram(name: "acos", scope: !48, file: !48, line: 53, type: !49, flags: DIFlagPrototyped, spFlags: 0)
!48 = !DIFile(filename: "/usr/include/bits/mathcalls.h", directory: "", checksumkind: CSK_MD5, checksum: "a03d6e5877646e3ad0a8a5735f9e6f62")
!49 = !DISubroutineType(types: !50)
!50 = !{!51, !51}
!51 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!52 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/cmath", directory: "")
!53 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !54, file: !52, line: 104)
!54 = !DISubprogram(name: "asin", scope: !48, file: !48, line: 55, type: !49, flags: DIFlagPrototyped, spFlags: 0)
!55 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !56, file: !52, line: 123)
!56 = !DISubprogram(name: "atan", scope: !48, file: !48, line: 57, type: !49, flags: DIFlagPrototyped, spFlags: 0)
!57 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !58, file: !52, line: 142)
!58 = !DISubprogram(name: "atan2", scope: !48, file: !48, line: 59, type: !59, flags: DIFlagPrototyped, spFlags: 0)
!59 = !DISubroutineType(types: !60)
!60 = !{!51, !51, !51}
!61 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !62, file: !52, line: 154)
!62 = !DISubprogram(name: "ceil", scope: !48, file: !48, line: 159, type: !49, flags: DIFlagPrototyped, spFlags: 0)
!63 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !64, file: !52, line: 173)
!64 = !DISubprogram(name: "cos", scope: !48, file: !48, line: 62, type: !49, flags: DIFlagPrototyped, spFlags: 0)
!65 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !66, file: !52, line: 192)
!66 = !DISubprogram(name: "cosh", scope: !48, file: !48, line: 71, type: !49, flags: DIFlagPrototyped, spFlags: 0)
!67 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !68, file: !52, line: 211)
!68 = !DISubprogram(name: "exp", scope: !48, file: !48, line: 95, type: !49, flags: DIFlagPrototyped, spFlags: 0)
!69 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !70, file: !52, line: 230)
!70 = !DISubprogram(name: "fabs", scope: !48, file: !48, line: 162, type: !49, flags: DIFlagPrototyped, spFlags: 0)
!71 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !72, file: !52, line: 249)
!72 = !DISubprogram(name: "floor", scope: !48, file: !48, line: 165, type: !49, flags: DIFlagPrototyped, spFlags: 0)
!73 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !74, file: !52, line: 268)
!74 = !DISubprogram(name: "fmod", scope: !48, file: !48, line: 168, type: !59, flags: DIFlagPrototyped, spFlags: 0)
!75 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !76, file: !52, line: 280)
!76 = !DISubprogram(name: "frexp", scope: !48, file: !48, line: 98, type: !77, flags: DIFlagPrototyped, spFlags: 0)
!77 = !DISubroutineType(types: !78)
!78 = !{!51, !51, !11}
!79 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !80, file: !52, line: 299)
!80 = !DISubprogram(name: "ldexp", scope: !48, file: !48, line: 101, type: !81, flags: DIFlagPrototyped, spFlags: 0)
!81 = !DISubroutineType(types: !82)
!82 = !{!51, !51, !9}
!83 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !84, file: !52, line: 318)
!84 = !DISubprogram(name: "log", scope: !48, file: !48, line: 104, type: !49, flags: DIFlagPrototyped, spFlags: 0)
!85 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !86, file: !52, line: 337)
!86 = !DISubprogram(name: "log10", scope: !48, file: !48, line: 107, type: !49, flags: DIFlagPrototyped, spFlags: 0)
!87 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !88, file: !52, line: 356)
!88 = !DISubprogram(name: "modf", scope: !48, file: !48, line: 110, type: !89, flags: DIFlagPrototyped, spFlags: 0)
!89 = !DISubroutineType(types: !90)
!90 = !{!51, !51, !91}
!91 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !51, size: 64)
!92 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !93, file: !52, line: 368)
!93 = !DISubprogram(name: "pow", scope: !48, file: !48, line: 140, type: !59, flags: DIFlagPrototyped, spFlags: 0)
!94 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !95, file: !52, line: 396)
!95 = !DISubprogram(name: "sin", scope: !48, file: !48, line: 64, type: !49, flags: DIFlagPrototyped, spFlags: 0)
!96 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !97, file: !52, line: 415)
!97 = !DISubprogram(name: "sinh", scope: !48, file: !48, line: 73, type: !49, flags: DIFlagPrototyped, spFlags: 0)
!98 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !99, file: !52, line: 434)
!99 = !DISubprogram(name: "sqrt", scope: !48, file: !48, line: 143, type: !49, flags: DIFlagPrototyped, spFlags: 0)
!100 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !101, file: !52, line: 453)
!101 = !DISubprogram(name: "tan", scope: !48, file: !48, line: 66, type: !49, flags: DIFlagPrototyped, spFlags: 0)
!102 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !103, file: !52, line: 472)
!103 = !DISubprogram(name: "tanh", scope: !48, file: !48, line: 75, type: !49, flags: DIFlagPrototyped, spFlags: 0)
!104 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !105, file: !52, line: 1881)
!105 = !DIDerivedType(tag: DW_TAG_typedef, name: "double_t", file: !106, line: 164, baseType: !51)
!106 = !DIFile(filename: "/usr/include/math.h", directory: "", checksumkind: CSK_MD5, checksum: "555a51fc91303a79e6e6a7bf2a303f79")
!107 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !108, file: !52, line: 1882)
!108 = !DIDerivedType(tag: DW_TAG_typedef, name: "float_t", file: !106, line: 163, baseType: !109)
!109 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!110 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !111, file: !52, line: 1885)
!111 = !DISubprogram(name: "acosh", scope: !48, file: !48, line: 85, type: !49, flags: DIFlagPrototyped, spFlags: 0)
!112 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !113, file: !52, line: 1886)
!113 = !DISubprogram(name: "acoshf", scope: !48, file: !48, line: 85, type: !114, flags: DIFlagPrototyped, spFlags: 0)
!114 = !DISubroutineType(types: !115)
!115 = !{!109, !109}
!116 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !117, file: !52, line: 1887)
!117 = !DISubprogram(name: "acoshl", scope: !48, file: !48, line: 85, type: !118, flags: DIFlagPrototyped, spFlags: 0)
!118 = !DISubroutineType(types: !119)
!119 = !{!120, !120}
!120 = !DIBasicType(name: "long double", size: 64, encoding: DW_ATE_float)
!121 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !122, file: !52, line: 1889)
!122 = !DISubprogram(name: "asinh", scope: !48, file: !48, line: 87, type: !49, flags: DIFlagPrototyped, spFlags: 0)
!123 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !124, file: !52, line: 1890)
!124 = !DISubprogram(name: "asinhf", scope: !48, file: !48, line: 87, type: !114, flags: DIFlagPrototyped, spFlags: 0)
!125 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !126, file: !52, line: 1891)
!126 = !DISubprogram(name: "asinhl", scope: !48, file: !48, line: 87, type: !118, flags: DIFlagPrototyped, spFlags: 0)
!127 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !128, file: !52, line: 1893)
!128 = !DISubprogram(name: "atanh", scope: !48, file: !48, line: 89, type: !49, flags: DIFlagPrototyped, spFlags: 0)
!129 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !130, file: !52, line: 1894)
!130 = !DISubprogram(name: "atanhf", scope: !48, file: !48, line: 89, type: !114, flags: DIFlagPrototyped, spFlags: 0)
!131 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !132, file: !52, line: 1895)
!132 = !DISubprogram(name: "atanhl", scope: !48, file: !48, line: 89, type: !118, flags: DIFlagPrototyped, spFlags: 0)
!133 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !134, file: !52, line: 1897)
!134 = !DISubprogram(name: "cbrt", scope: !48, file: !48, line: 152, type: !49, flags: DIFlagPrototyped, spFlags: 0)
!135 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !136, file: !52, line: 1898)
!136 = !DISubprogram(name: "cbrtf", scope: !48, file: !48, line: 152, type: !114, flags: DIFlagPrototyped, spFlags: 0)
!137 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !138, file: !52, line: 1899)
!138 = !DISubprogram(name: "cbrtl", scope: !48, file: !48, line: 152, type: !118, flags: DIFlagPrototyped, spFlags: 0)
!139 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !140, file: !52, line: 1901)
!140 = !DISubprogram(name: "copysign", scope: !48, file: !48, line: 198, type: !59, flags: DIFlagPrototyped, spFlags: 0)
!141 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !142, file: !52, line: 1902)
!142 = !DISubprogram(name: "copysignf", scope: !48, file: !48, line: 198, type: !143, flags: DIFlagPrototyped, spFlags: 0)
!143 = !DISubroutineType(types: !144)
!144 = !{!109, !109, !109}
!145 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !146, file: !52, line: 1903)
!146 = !DISubprogram(name: "copysignl", scope: !48, file: !48, line: 198, type: !147, flags: DIFlagPrototyped, spFlags: 0)
!147 = !DISubroutineType(types: !148)
!148 = !{!120, !120, !120}
!149 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !150, file: !52, line: 1905)
!150 = !DISubprogram(name: "erf", scope: !48, file: !48, line: 231, type: !49, flags: DIFlagPrototyped, spFlags: 0)
!151 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !152, file: !52, line: 1906)
!152 = !DISubprogram(name: "erff", scope: !48, file: !48, line: 231, type: !114, flags: DIFlagPrototyped, spFlags: 0)
!153 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !154, file: !52, line: 1907)
!154 = !DISubprogram(name: "erfl", scope: !48, file: !48, line: 231, type: !118, flags: DIFlagPrototyped, spFlags: 0)
!155 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !156, file: !52, line: 1909)
!156 = !DISubprogram(name: "erfc", scope: !48, file: !48, line: 232, type: !49, flags: DIFlagPrototyped, spFlags: 0)
!157 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !158, file: !52, line: 1910)
!158 = !DISubprogram(name: "erfcf", scope: !48, file: !48, line: 232, type: !114, flags: DIFlagPrototyped, spFlags: 0)
!159 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !160, file: !52, line: 1911)
!160 = !DISubprogram(name: "erfcl", scope: !48, file: !48, line: 232, type: !118, flags: DIFlagPrototyped, spFlags: 0)
!161 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !162, file: !52, line: 1913)
!162 = !DISubprogram(name: "exp2", scope: !48, file: !48, line: 130, type: !49, flags: DIFlagPrototyped, spFlags: 0)
!163 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !164, file: !52, line: 1914)
!164 = !DISubprogram(name: "exp2f", scope: !48, file: !48, line: 130, type: !114, flags: DIFlagPrototyped, spFlags: 0)
!165 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !166, file: !52, line: 1915)
!166 = !DISubprogram(name: "exp2l", scope: !48, file: !48, line: 130, type: !118, flags: DIFlagPrototyped, spFlags: 0)
!167 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !168, file: !52, line: 1917)
!168 = !DISubprogram(name: "expm1", scope: !48, file: !48, line: 119, type: !49, flags: DIFlagPrototyped, spFlags: 0)
!169 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !170, file: !52, line: 1918)
!170 = !DISubprogram(name: "expm1f", scope: !48, file: !48, line: 119, type: !114, flags: DIFlagPrototyped, spFlags: 0)
!171 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !172, file: !52, line: 1919)
!172 = !DISubprogram(name: "expm1l", scope: !48, file: !48, line: 119, type: !118, flags: DIFlagPrototyped, spFlags: 0)
!173 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !174, file: !52, line: 1921)
!174 = !DISubprogram(name: "fdim", scope: !48, file: !48, line: 329, type: !59, flags: DIFlagPrototyped, spFlags: 0)
!175 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !176, file: !52, line: 1922)
!176 = !DISubprogram(name: "fdimf", scope: !48, file: !48, line: 329, type: !143, flags: DIFlagPrototyped, spFlags: 0)
!177 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !178, file: !52, line: 1923)
!178 = !DISubprogram(name: "fdiml", scope: !48, file: !48, line: 329, type: !147, flags: DIFlagPrototyped, spFlags: 0)
!179 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !180, file: !52, line: 1925)
!180 = !DISubprogram(name: "fma", scope: !48, file: !48, line: 340, type: !181, flags: DIFlagPrototyped, spFlags: 0)
!181 = !DISubroutineType(types: !182)
!182 = !{!51, !51, !51, !51}
!183 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !184, file: !52, line: 1926)
!184 = !DISubprogram(name: "fmaf", scope: !48, file: !48, line: 340, type: !185, flags: DIFlagPrototyped, spFlags: 0)
!185 = !DISubroutineType(types: !186)
!186 = !{!109, !109, !109, !109}
!187 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !188, file: !52, line: 1927)
!188 = !DISubprogram(name: "fmal", scope: !48, file: !48, line: 340, type: !189, flags: DIFlagPrototyped, spFlags: 0)
!189 = !DISubroutineType(types: !190)
!190 = !{!120, !120, !120, !120}
!191 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !192, file: !52, line: 1929)
!192 = !DISubprogram(name: "fmax", scope: !48, file: !48, line: 333, type: !59, flags: DIFlagPrototyped, spFlags: 0)
!193 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !194, file: !52, line: 1930)
!194 = !DISubprogram(name: "fmaxf", scope: !48, file: !48, line: 333, type: !143, flags: DIFlagPrototyped, spFlags: 0)
!195 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !196, file: !52, line: 1931)
!196 = !DISubprogram(name: "fmaxl", scope: !48, file: !48, line: 333, type: !147, flags: DIFlagPrototyped, spFlags: 0)
!197 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !198, file: !52, line: 1933)
!198 = !DISubprogram(name: "fmin", scope: !48, file: !48, line: 336, type: !59, flags: DIFlagPrototyped, spFlags: 0)
!199 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !200, file: !52, line: 1934)
!200 = !DISubprogram(name: "fminf", scope: !48, file: !48, line: 336, type: !143, flags: DIFlagPrototyped, spFlags: 0)
!201 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !202, file: !52, line: 1935)
!202 = !DISubprogram(name: "fminl", scope: !48, file: !48, line: 336, type: !147, flags: DIFlagPrototyped, spFlags: 0)
!203 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !204, file: !52, line: 1937)
!204 = !DISubprogram(name: "hypot", scope: !48, file: !48, line: 147, type: !59, flags: DIFlagPrototyped, spFlags: 0)
!205 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !206, file: !52, line: 1938)
!206 = !DISubprogram(name: "hypotf", scope: !48, file: !48, line: 147, type: !143, flags: DIFlagPrototyped, spFlags: 0)
!207 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !208, file: !52, line: 1939)
!208 = !DISubprogram(name: "hypotl", scope: !48, file: !48, line: 147, type: !147, flags: DIFlagPrototyped, spFlags: 0)
!209 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !210, file: !52, line: 1941)
!210 = !DISubprogram(name: "ilogb", scope: !48, file: !48, line: 283, type: !211, flags: DIFlagPrototyped, spFlags: 0)
!211 = !DISubroutineType(types: !212)
!212 = !{!9, !51}
!213 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !214, file: !52, line: 1942)
!214 = !DISubprogram(name: "ilogbf", scope: !48, file: !48, line: 283, type: !215, flags: DIFlagPrototyped, spFlags: 0)
!215 = !DISubroutineType(types: !216)
!216 = !{!9, !109}
!217 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !218, file: !52, line: 1943)
!218 = !DISubprogram(name: "ilogbl", scope: !48, file: !48, line: 283, type: !219, flags: DIFlagPrototyped, spFlags: 0)
!219 = !DISubroutineType(types: !220)
!220 = !{!9, !120}
!221 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !222, file: !52, line: 1945)
!222 = !DISubprogram(name: "lgamma", scope: !48, file: !48, line: 233, type: !49, flags: DIFlagPrototyped, spFlags: 0)
!223 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !224, file: !52, line: 1946)
!224 = !DISubprogram(name: "lgammaf", scope: !48, file: !48, line: 233, type: !114, flags: DIFlagPrototyped, spFlags: 0)
!225 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !226, file: !52, line: 1947)
!226 = !DISubprogram(name: "lgammal", scope: !48, file: !48, line: 233, type: !118, flags: DIFlagPrototyped, spFlags: 0)
!227 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !228, file: !52, line: 1950)
!228 = !DISubprogram(name: "llrint", scope: !48, file: !48, line: 319, type: !229, flags: DIFlagPrototyped, spFlags: 0)
!229 = !DISubroutineType(types: !230)
!230 = !{!231, !51}
!231 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!232 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !233, file: !52, line: 1951)
!233 = !DISubprogram(name: "llrintf", scope: !48, file: !48, line: 319, type: !234, flags: DIFlagPrototyped, spFlags: 0)
!234 = !DISubroutineType(types: !235)
!235 = !{!231, !109}
!236 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !237, file: !52, line: 1952)
!237 = !DISubprogram(name: "llrintl", scope: !48, file: !48, line: 319, type: !238, flags: DIFlagPrototyped, spFlags: 0)
!238 = !DISubroutineType(types: !239)
!239 = !{!231, !120}
!240 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !241, file: !52, line: 1954)
!241 = !DISubprogram(name: "llround", scope: !48, file: !48, line: 325, type: !229, flags: DIFlagPrototyped, spFlags: 0)
!242 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !243, file: !52, line: 1955)
!243 = !DISubprogram(name: "llroundf", scope: !48, file: !48, line: 325, type: !234, flags: DIFlagPrototyped, spFlags: 0)
!244 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !245, file: !52, line: 1956)
!245 = !DISubprogram(name: "llroundl", scope: !48, file: !48, line: 325, type: !238, flags: DIFlagPrototyped, spFlags: 0)
!246 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !247, file: !52, line: 1959)
!247 = !DISubprogram(name: "log1p", scope: !48, file: !48, line: 122, type: !49, flags: DIFlagPrototyped, spFlags: 0)
!248 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !249, file: !52, line: 1960)
!249 = !DISubprogram(name: "log1pf", scope: !48, file: !48, line: 122, type: !114, flags: DIFlagPrototyped, spFlags: 0)
!250 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !251, file: !52, line: 1961)
!251 = !DISubprogram(name: "log1pl", scope: !48, file: !48, line: 122, type: !118, flags: DIFlagPrototyped, spFlags: 0)
!252 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !253, file: !52, line: 1963)
!253 = !DISubprogram(name: "log2", scope: !48, file: !48, line: 133, type: !49, flags: DIFlagPrototyped, spFlags: 0)
!254 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !255, file: !52, line: 1964)
!255 = !DISubprogram(name: "log2f", scope: !48, file: !48, line: 133, type: !114, flags: DIFlagPrototyped, spFlags: 0)
!256 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !257, file: !52, line: 1965)
!257 = !DISubprogram(name: "log2l", scope: !48, file: !48, line: 133, type: !118, flags: DIFlagPrototyped, spFlags: 0)
!258 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !259, file: !52, line: 1967)
!259 = !DISubprogram(name: "logb", scope: !48, file: !48, line: 125, type: !49, flags: DIFlagPrototyped, spFlags: 0)
!260 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !261, file: !52, line: 1968)
!261 = !DISubprogram(name: "logbf", scope: !48, file: !48, line: 125, type: !114, flags: DIFlagPrototyped, spFlags: 0)
!262 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !263, file: !52, line: 1969)
!263 = !DISubprogram(name: "logbl", scope: !48, file: !48, line: 125, type: !118, flags: DIFlagPrototyped, spFlags: 0)
!264 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !265, file: !52, line: 1971)
!265 = !DISubprogram(name: "lrint", scope: !48, file: !48, line: 317, type: !266, flags: DIFlagPrototyped, spFlags: 0)
!266 = !DISubroutineType(types: !267)
!267 = !{!268, !51}
!268 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!269 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !270, file: !52, line: 1972)
!270 = !DISubprogram(name: "lrintf", scope: !48, file: !48, line: 317, type: !271, flags: DIFlagPrototyped, spFlags: 0)
!271 = !DISubroutineType(types: !272)
!272 = !{!268, !109}
!273 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !274, file: !52, line: 1973)
!274 = !DISubprogram(name: "lrintl", scope: !48, file: !48, line: 317, type: !275, flags: DIFlagPrototyped, spFlags: 0)
!275 = !DISubroutineType(types: !276)
!276 = !{!268, !120}
!277 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !278, file: !52, line: 1975)
!278 = !DISubprogram(name: "lround", scope: !48, file: !48, line: 323, type: !266, flags: DIFlagPrototyped, spFlags: 0)
!279 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !280, file: !52, line: 1976)
!280 = !DISubprogram(name: "lroundf", scope: !48, file: !48, line: 323, type: !271, flags: DIFlagPrototyped, spFlags: 0)
!281 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !282, file: !52, line: 1977)
!282 = !DISubprogram(name: "lroundl", scope: !48, file: !48, line: 323, type: !275, flags: DIFlagPrototyped, spFlags: 0)
!283 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !284, file: !52, line: 1979)
!284 = !DISubprogram(name: "nan", scope: !48, file: !48, line: 203, type: !285, flags: DIFlagPrototyped, spFlags: 0)
!285 = !DISubroutineType(types: !286)
!286 = !{!51, !287}
!287 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !288, size: 64)
!288 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !289)
!289 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!290 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !291, file: !52, line: 1980)
!291 = !DISubprogram(name: "nanf", scope: !48, file: !48, line: 203, type: !292, flags: DIFlagPrototyped, spFlags: 0)
!292 = !DISubroutineType(types: !293)
!293 = !{!109, !287}
!294 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !295, file: !52, line: 1981)
!295 = !DISubprogram(name: "nanl", scope: !48, file: !48, line: 203, type: !296, flags: DIFlagPrototyped, spFlags: 0)
!296 = !DISubroutineType(types: !297)
!297 = !{!120, !287}
!298 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !299, file: !52, line: 1983)
!299 = !DISubprogram(name: "nearbyint", scope: !48, file: !48, line: 297, type: !49, flags: DIFlagPrototyped, spFlags: 0)
!300 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !301, file: !52, line: 1984)
!301 = !DISubprogram(name: "nearbyintf", scope: !48, file: !48, line: 297, type: !114, flags: DIFlagPrototyped, spFlags: 0)
!302 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !303, file: !52, line: 1985)
!303 = !DISubprogram(name: "nearbyintl", scope: !48, file: !48, line: 297, type: !118, flags: DIFlagPrototyped, spFlags: 0)
!304 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !305, file: !52, line: 1987)
!305 = !DISubprogram(name: "nextafter", scope: !48, file: !48, line: 262, type: !59, flags: DIFlagPrototyped, spFlags: 0)
!306 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !307, file: !52, line: 1988)
!307 = !DISubprogram(name: "nextafterf", scope: !48, file: !48, line: 262, type: !143, flags: DIFlagPrototyped, spFlags: 0)
!308 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !309, file: !52, line: 1989)
!309 = !DISubprogram(name: "nextafterl", scope: !48, file: !48, line: 262, type: !147, flags: DIFlagPrototyped, spFlags: 0)
!310 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !311, file: !52, line: 1991)
!311 = !DISubprogram(name: "nexttoward", scope: !48, file: !48, line: 264, type: !312, flags: DIFlagPrototyped, spFlags: 0)
!312 = !DISubroutineType(types: !313)
!313 = !{!51, !51, !120}
!314 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !315, file: !52, line: 1992)
!315 = !DISubprogram(name: "nexttowardf", scope: !48, file: !48, line: 264, type: !316, flags: DIFlagPrototyped, spFlags: 0)
!316 = !DISubroutineType(types: !317)
!317 = !{!109, !109, !120}
!318 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !319, file: !52, line: 1993)
!319 = !DISubprogram(name: "nexttowardl", scope: !48, file: !48, line: 264, type: !147, flags: DIFlagPrototyped, spFlags: 0)
!320 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !321, file: !52, line: 1995)
!321 = !DISubprogram(name: "remainder", scope: !48, file: !48, line: 275, type: !59, flags: DIFlagPrototyped, spFlags: 0)
!322 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !323, file: !52, line: 1996)
!323 = !DISubprogram(name: "remainderf", scope: !48, file: !48, line: 275, type: !143, flags: DIFlagPrototyped, spFlags: 0)
!324 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !325, file: !52, line: 1997)
!325 = !DISubprogram(name: "remainderl", scope: !48, file: !48, line: 275, type: !147, flags: DIFlagPrototyped, spFlags: 0)
!326 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !327, file: !52, line: 1999)
!327 = !DISubprogram(name: "remquo", scope: !48, file: !48, line: 310, type: !328, flags: DIFlagPrototyped, spFlags: 0)
!328 = !DISubroutineType(types: !329)
!329 = !{!51, !51, !51, !11}
!330 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !331, file: !52, line: 2000)
!331 = !DISubprogram(name: "remquof", scope: !48, file: !48, line: 310, type: !332, flags: DIFlagPrototyped, spFlags: 0)
!332 = !DISubroutineType(types: !333)
!333 = !{!109, !109, !109, !11}
!334 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !335, file: !52, line: 2001)
!335 = !DISubprogram(name: "remquol", scope: !48, file: !48, line: 310, type: !336, flags: DIFlagPrototyped, spFlags: 0)
!336 = !DISubroutineType(types: !337)
!337 = !{!120, !120, !120, !11}
!338 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !339, file: !52, line: 2003)
!339 = !DISubprogram(name: "rint", scope: !48, file: !48, line: 259, type: !49, flags: DIFlagPrototyped, spFlags: 0)
!340 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !341, file: !52, line: 2004)
!341 = !DISubprogram(name: "rintf", scope: !48, file: !48, line: 259, type: !114, flags: DIFlagPrototyped, spFlags: 0)
!342 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !343, file: !52, line: 2005)
!343 = !DISubprogram(name: "rintl", scope: !48, file: !48, line: 259, type: !118, flags: DIFlagPrototyped, spFlags: 0)
!344 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !345, file: !52, line: 2007)
!345 = !DISubprogram(name: "round", scope: !48, file: !48, line: 301, type: !49, flags: DIFlagPrototyped, spFlags: 0)
!346 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !347, file: !52, line: 2008)
!347 = !DISubprogram(name: "roundf", scope: !48, file: !48, line: 301, type: !114, flags: DIFlagPrototyped, spFlags: 0)
!348 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !349, file: !52, line: 2009)
!349 = !DISubprogram(name: "roundl", scope: !48, file: !48, line: 301, type: !118, flags: DIFlagPrototyped, spFlags: 0)
!350 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !351, file: !52, line: 2011)
!351 = !DISubprogram(name: "scalbln", scope: !48, file: !48, line: 293, type: !352, flags: DIFlagPrototyped, spFlags: 0)
!352 = !DISubroutineType(types: !353)
!353 = !{!51, !51, !268}
!354 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !355, file: !52, line: 2012)
!355 = !DISubprogram(name: "scalblnf", scope: !48, file: !48, line: 293, type: !356, flags: DIFlagPrototyped, spFlags: 0)
!356 = !DISubroutineType(types: !357)
!357 = !{!109, !109, !268}
!358 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !359, file: !52, line: 2013)
!359 = !DISubprogram(name: "scalblnl", scope: !48, file: !48, line: 293, type: !360, flags: DIFlagPrototyped, spFlags: 0)
!360 = !DISubroutineType(types: !361)
!361 = !{!120, !120, !268}
!362 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !363, file: !52, line: 2015)
!363 = !DISubprogram(name: "scalbn", scope: !48, file: !48, line: 279, type: !81, flags: DIFlagPrototyped, spFlags: 0)
!364 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !365, file: !52, line: 2016)
!365 = !DISubprogram(name: "scalbnf", scope: !48, file: !48, line: 279, type: !366, flags: DIFlagPrototyped, spFlags: 0)
!366 = !DISubroutineType(types: !367)
!367 = !{!109, !109, !9}
!368 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !369, file: !52, line: 2017)
!369 = !DISubprogram(name: "scalbnl", scope: !48, file: !48, line: 279, type: !370, flags: DIFlagPrototyped, spFlags: 0)
!370 = !DISubroutineType(types: !371)
!371 = !{!120, !120, !9}
!372 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !373, file: !52, line: 2019)
!373 = !DISubprogram(name: "tgamma", scope: !48, file: !48, line: 238, type: !49, flags: DIFlagPrototyped, spFlags: 0)
!374 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !375, file: !52, line: 2020)
!375 = !DISubprogram(name: "tgammaf", scope: !48, file: !48, line: 238, type: !114, flags: DIFlagPrototyped, spFlags: 0)
!376 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !377, file: !52, line: 2021)
!377 = !DISubprogram(name: "tgammal", scope: !48, file: !48, line: 238, type: !118, flags: DIFlagPrototyped, spFlags: 0)
!378 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !379, file: !52, line: 2023)
!379 = !DISubprogram(name: "trunc", scope: !48, file: !48, line: 305, type: !49, flags: DIFlagPrototyped, spFlags: 0)
!380 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !381, file: !52, line: 2024)
!381 = !DISubprogram(name: "truncf", scope: !48, file: !48, line: 305, type: !114, flags: DIFlagPrototyped, spFlags: 0)
!382 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !383, file: !52, line: 2025)
!383 = !DISubprogram(name: "truncl", scope: !48, file: !48, line: 305, type: !118, flags: DIFlagPrototyped, spFlags: 0)
!384 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !385, entity: !386, file: !387, line: 58)
!385 = !DINamespace(name: "__gnu_debug", scope: null)
!386 = !DINamespace(name: "__debug", scope: !40)
!387 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/debug/debug.h", directory: "", checksumkind: CSK_MD5, checksum: "752210a319f5f5d356cc29cd1ce3cdc7")
!388 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !389, file: !391, line: 131)
!389 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !42, line: 63, baseType: !390)
!390 = !DICompositeType(tag: DW_TAG_structure_type, file: !42, line: 59, size: 64, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!391 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/cstdlib", directory: "")
!392 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !393, file: !391, line: 132)
!393 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !42, line: 71, baseType: !394)
!394 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !42, line: 67, size: 128, flags: DIFlagTypePassByValue, elements: !395, identifier: "_ZTS6ldiv_t")
!395 = !{!396, !397}
!396 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !394, file: !42, line: 69, baseType: !268, size: 64)
!397 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !394, file: !42, line: 70, baseType: !268, size: 64, offset: 64)
!398 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !399, file: !391, line: 134)
!399 = !DISubprogram(name: "abort", scope: !42, file: !42, line: 730, type: !400, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!400 = !DISubroutineType(types: !401)
!401 = !{null}
!402 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !403, file: !391, line: 136)
!403 = !DISubprogram(name: "aligned_alloc", scope: !42, file: !42, line: 724, type: !404, flags: DIFlagPrototyped, spFlags: 0)
!404 = !DISubroutineType(types: !405)
!405 = !{!406, !407, !407}
!406 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!407 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !408, line: 18, baseType: !409)
!408 = !DIFile(filename: "/opt/rocm-6.4.2/lib/llvm/lib/clang/19/include/__stddef_size_t.h", directory: "", checksumkind: CSK_MD5, checksum: "2c44e821a2b1951cde2eb0fb2e656867")
!409 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!410 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !411, file: !391, line: 138)
!411 = !DISubprogram(name: "atexit", scope: !42, file: !42, line: 734, type: !412, flags: DIFlagPrototyped, spFlags: 0)
!412 = !DISubroutineType(types: !413)
!413 = !{!9, !414}
!414 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !400, size: 64)
!415 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !416, file: !391, line: 141)
!416 = !DISubprogram(name: "at_quick_exit", scope: !42, file: !42, line: 739, type: !412, flags: DIFlagPrototyped, spFlags: 0)
!417 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !418, file: !391, line: 144)
!418 = !DISubprogram(name: "atof", scope: !42, file: !42, line: 102, type: !285, flags: DIFlagPrototyped, spFlags: 0)
!419 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !420, file: !391, line: 145)
!420 = !DISubprogram(name: "atoi", scope: !42, file: !42, line: 105, type: !421, flags: DIFlagPrototyped, spFlags: 0)
!421 = !DISubroutineType(types: !422)
!422 = !{!9, !287}
!423 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !424, file: !391, line: 146)
!424 = !DISubprogram(name: "atol", scope: !42, file: !42, line: 108, type: !425, flags: DIFlagPrototyped, spFlags: 0)
!425 = !DISubroutineType(types: !426)
!426 = !{!268, !287}
!427 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !428, file: !391, line: 147)
!428 = !DISubprogram(name: "bsearch", scope: !42, file: !42, line: 960, type: !429, flags: DIFlagPrototyped, spFlags: 0)
!429 = !DISubroutineType(types: !430)
!430 = !{!406, !431, !431, !407, !407, !433}
!431 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !432, size: 64)
!432 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!433 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !42, line: 948, baseType: !434)
!434 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !435, size: 64)
!435 = !DISubroutineType(types: !436)
!436 = !{!9, !431, !431}
!437 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !438, file: !391, line: 148)
!438 = !DISubprogram(name: "calloc", scope: !42, file: !42, line: 675, type: !404, flags: DIFlagPrototyped, spFlags: 0)
!439 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !440, file: !391, line: 149)
!440 = !DISubprogram(name: "div", scope: !42, file: !42, line: 992, type: !441, flags: DIFlagPrototyped, spFlags: 0)
!441 = !DISubroutineType(types: !442)
!442 = !{!389, !9, !9}
!443 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !444, file: !391, line: 150)
!444 = !DISubprogram(name: "exit", scope: !42, file: !42, line: 756, type: !445, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!445 = !DISubroutineType(types: !446)
!446 = !{null, !9}
!447 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !448, file: !391, line: 151)
!448 = !DISubprogram(name: "free", scope: !42, file: !42, line: 687, type: !449, flags: DIFlagPrototyped, spFlags: 0)
!449 = !DISubroutineType(types: !450)
!450 = !{null, !406}
!451 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !452, file: !391, line: 152)
!452 = !DISubprogram(name: "getenv", scope: !42, file: !42, line: 773, type: !453, flags: DIFlagPrototyped, spFlags: 0)
!453 = !DISubroutineType(types: !454)
!454 = !{!455, !287}
!455 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !289, size: 64)
!456 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !457, file: !391, line: 153)
!457 = !DISubprogram(name: "labs", scope: !42, file: !42, line: 981, type: !458, flags: DIFlagPrototyped, spFlags: 0)
!458 = !DISubroutineType(types: !459)
!459 = !{!268, !268}
!460 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !461, file: !391, line: 154)
!461 = !DISubprogram(name: "ldiv", scope: !42, file: !42, line: 994, type: !462, flags: DIFlagPrototyped, spFlags: 0)
!462 = !DISubroutineType(types: !463)
!463 = !{!393, !268, !268}
!464 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !465, file: !391, line: 155)
!465 = !DISubprogram(name: "malloc", scope: !42, file: !42, line: 672, type: !466, flags: DIFlagPrototyped, spFlags: 0)
!466 = !DISubroutineType(types: !467)
!467 = !{!406, !407}
!468 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !469, file: !391, line: 157)
!469 = !DISubprogram(name: "mblen", scope: !42, file: !42, line: 1062, type: !470, flags: DIFlagPrototyped, spFlags: 0)
!470 = !DISubroutineType(types: !471)
!471 = !{!9, !287, !407}
!472 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !473, file: !391, line: 158)
!473 = !DISubprogram(name: "mbstowcs", scope: !42, file: !42, line: 1073, type: !474, flags: DIFlagPrototyped, spFlags: 0)
!474 = !DISubroutineType(types: !475)
!475 = !{!407, !476, !479, !407}
!476 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !477)
!477 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !478, size: 64)
!478 = !DIBasicType(name: "wchar_t", size: 32, encoding: DW_ATE_signed)
!479 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !287)
!480 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !481, file: !391, line: 159)
!481 = !DISubprogram(name: "mbtowc", scope: !42, file: !42, line: 1065, type: !482, flags: DIFlagPrototyped, spFlags: 0)
!482 = !DISubroutineType(types: !483)
!483 = !{!9, !476, !479, !407}
!484 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !485, file: !391, line: 161)
!485 = !DISubprogram(name: "qsort", scope: !42, file: !42, line: 970, type: !486, flags: DIFlagPrototyped, spFlags: 0)
!486 = !DISubroutineType(types: !487)
!487 = !{null, !406, !407, !407, !433}
!488 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !489, file: !391, line: 164)
!489 = !DISubprogram(name: "quick_exit", scope: !42, file: !42, line: 762, type: !445, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!490 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !491, file: !391, line: 167)
!491 = !DISubprogram(name: "rand", scope: !42, file: !42, line: 573, type: !492, flags: DIFlagPrototyped, spFlags: 0)
!492 = !DISubroutineType(types: !493)
!493 = !{!9}
!494 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !495, file: !391, line: 168)
!495 = !DISubprogram(name: "realloc", scope: !42, file: !42, line: 683, type: !496, flags: DIFlagPrototyped, spFlags: 0)
!496 = !DISubroutineType(types: !497)
!497 = !{!406, !406, !407}
!498 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !499, file: !391, line: 169)
!499 = !DISubprogram(name: "srand", scope: !42, file: !42, line: 575, type: !500, flags: DIFlagPrototyped, spFlags: 0)
!500 = !DISubroutineType(types: !501)
!501 = !{null, !17}
!502 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !503, file: !391, line: 170)
!503 = !DISubprogram(name: "strtod", scope: !42, file: !42, line: 118, type: !504, flags: DIFlagPrototyped, spFlags: 0)
!504 = !DISubroutineType(types: !505)
!505 = !{!51, !479, !506}
!506 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !507)
!507 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !455, size: 64)
!508 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !509, file: !391, line: 171)
!509 = !DISubprogram(name: "strtol", linkageName: "__isoc23_strtol", scope: !42, file: !42, line: 215, type: !510, flags: DIFlagPrototyped, spFlags: 0)
!510 = !DISubroutineType(types: !511)
!511 = !{!268, !479, !506, !9}
!512 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !513, file: !391, line: 172)
!513 = !DISubprogram(name: "strtoul", linkageName: "__isoc23_strtoul", scope: !42, file: !42, line: 219, type: !514, flags: DIFlagPrototyped, spFlags: 0)
!514 = !DISubroutineType(types: !515)
!515 = !{!409, !479, !506, !9}
!516 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !517, file: !391, line: 173)
!517 = !DISubprogram(name: "system", scope: !42, file: !42, line: 923, type: !421, flags: DIFlagPrototyped, spFlags: 0)
!518 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !519, file: !391, line: 175)
!519 = !DISubprogram(name: "wcstombs", scope: !42, file: !42, line: 1077, type: !520, flags: DIFlagPrototyped, spFlags: 0)
!520 = !DISubroutineType(types: !521)
!521 = !{!407, !522, !523, !407}
!522 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !455)
!523 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !524)
!524 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !525, size: 64)
!525 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !478)
!526 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !527, file: !391, line: 176)
!527 = !DISubprogram(name: "wctomb", scope: !42, file: !42, line: 1069, type: !528, flags: DIFlagPrototyped, spFlags: 0)
!528 = !DISubroutineType(types: !529)
!529 = !{!9, !455, !478}
!530 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !531, entity: !532, file: !391, line: 204)
!531 = !DINamespace(name: "__gnu_cxx", scope: null)
!532 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !42, line: 81, baseType: !533)
!533 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !42, line: 77, size: 128, flags: DIFlagTypePassByValue, elements: !534, identifier: "_ZTS7lldiv_t")
!534 = !{!535, !536}
!535 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !533, file: !42, line: 79, baseType: !231, size: 64)
!536 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !533, file: !42, line: 80, baseType: !231, size: 64, offset: 64)
!537 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !531, entity: !538, file: !391, line: 210)
!538 = !DISubprogram(name: "_Exit", scope: !42, file: !42, line: 768, type: !445, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!539 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !531, entity: !540, file: !391, line: 214)
!540 = !DISubprogram(name: "llabs", scope: !42, file: !42, line: 984, type: !541, flags: DIFlagPrototyped, spFlags: 0)
!541 = !DISubroutineType(types: !542)
!542 = !{!231, !231}
!543 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !531, entity: !544, file: !391, line: 220)
!544 = !DISubprogram(name: "lldiv", scope: !42, file: !42, line: 998, type: !545, flags: DIFlagPrototyped, spFlags: 0)
!545 = !DISubroutineType(types: !546)
!546 = !{!532, !231, !231}
!547 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !531, entity: !548, file: !391, line: 231)
!548 = !DISubprogram(name: "atoll", scope: !42, file: !42, line: 113, type: !549, flags: DIFlagPrototyped, spFlags: 0)
!549 = !DISubroutineType(types: !550)
!550 = !{!231, !287}
!551 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !531, entity: !552, file: !391, line: 232)
!552 = !DISubprogram(name: "strtoll", linkageName: "__isoc23_strtoll", scope: !42, file: !42, line: 238, type: !553, flags: DIFlagPrototyped, spFlags: 0)
!553 = !DISubroutineType(types: !554)
!554 = !{!231, !479, !506, !9}
!555 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !531, entity: !556, file: !391, line: 233)
!556 = !DISubprogram(name: "strtoull", linkageName: "__isoc23_strtoull", scope: !42, file: !42, line: 243, type: !557, flags: DIFlagPrototyped, spFlags: 0)
!557 = !DISubroutineType(types: !558)
!558 = !{!559, !479, !506, !9}
!559 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!560 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !531, entity: !561, file: !391, line: 235)
!561 = !DISubprogram(name: "strtof", scope: !42, file: !42, line: 124, type: !562, flags: DIFlagPrototyped, spFlags: 0)
!562 = !DISubroutineType(types: !563)
!563 = !{!109, !479, !506}
!564 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !531, entity: !565, file: !391, line: 236)
!565 = !DISubprogram(name: "strtold", scope: !42, file: !42, line: 127, type: !566, flags: DIFlagPrototyped, spFlags: 0)
!566 = !DISubroutineType(types: !567)
!567 = !{!120, !479, !506}
!568 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !532, file: !391, line: 244)
!569 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !538, file: !391, line: 246)
!570 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !540, file: !391, line: 248)
!571 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !572, file: !391, line: 249)
!572 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !531, file: !391, line: 217, type: !545, flags: DIFlagPrototyped, spFlags: 0)
!573 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !544, file: !391, line: 250)
!574 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !548, file: !391, line: 252)
!575 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !561, file: !391, line: 253)
!576 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !552, file: !391, line: 254)
!577 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !556, file: !391, line: 255)
!578 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !565, file: !391, line: 256)
!579 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !399, file: !580, line: 38)
!580 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/stdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "3f24ff2a8eef595875da96e5466bd4aa")
!581 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !411, file: !580, line: 39)
!582 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !444, file: !580, line: 40)
!583 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !416, file: !580, line: 43)
!584 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !489, file: !580, line: 46)
!585 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !538, file: !580, line: 49)
!586 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !389, file: !580, line: 54)
!587 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !393, file: !580, line: 55)
!588 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !589, file: !580, line: 57)
!589 = !DISubprogram(name: "abs", linkageName: "_ZSt3absn", scope: !40, file: !45, line: 85, type: !590, flags: DIFlagPrototyped, spFlags: 0)
!590 = !DISubroutineType(types: !591)
!591 = !{!592, !592}
!592 = !DIBasicType(name: "__int128", size: 128, encoding: DW_ATE_signed)
!593 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !418, file: !580, line: 58)
!594 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !420, file: !580, line: 59)
!595 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !424, file: !580, line: 60)
!596 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !428, file: !580, line: 61)
!597 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !438, file: !580, line: 62)
!598 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !572, file: !580, line: 63)
!599 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !448, file: !580, line: 64)
!600 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !452, file: !580, line: 65)
!601 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !457, file: !580, line: 66)
!602 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !461, file: !580, line: 67)
!603 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !465, file: !580, line: 68)
!604 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !469, file: !580, line: 70)
!605 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !473, file: !580, line: 71)
!606 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !481, file: !580, line: 72)
!607 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !485, file: !580, line: 74)
!608 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !491, file: !580, line: 75)
!609 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !495, file: !580, line: 76)
!610 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !499, file: !580, line: 77)
!611 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !503, file: !580, line: 78)
!612 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !509, file: !580, line: 79)
!613 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !513, file: !580, line: 80)
!614 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !517, file: !580, line: 81)
!615 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !519, file: !580, line: 83)
!616 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !12, entity: !527, file: !580, line: 84)
!617 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !618, file: !619, line: 200)
!618 = !DISubprogram(name: "abs", linkageName: "_ZL3absd", scope: !619, file: !619, line: 28, type: !49, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!619 = !DIFile(filename: "/opt/rocm-6.4.2/lib/llvm/lib/clang/19/include/__clang_cuda_math_forward_declares.h", directory: "", checksumkind: CSK_MD5, checksum: "7fcaa66c0bf1529fc7d2359f3dc2dd30")
!620 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !621, file: !619, line: 201)
!621 = !DISubprogram(name: "acos", linkageName: "_ZL4acosf", scope: !619, file: !619, line: 32, type: !114, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!622 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !623, file: !619, line: 202)
!623 = !DISubprogram(name: "acosh", linkageName: "_ZL5acoshf", scope: !619, file: !619, line: 34, type: !114, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!624 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !625, file: !619, line: 203)
!625 = !DISubprogram(name: "asin", linkageName: "_ZL4asinf", scope: !619, file: !619, line: 36, type: !114, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!626 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !627, file: !619, line: 204)
!627 = !DISubprogram(name: "asinh", linkageName: "_ZL5asinhf", scope: !619, file: !619, line: 38, type: !114, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!628 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !629, file: !619, line: 205)
!629 = !DISubprogram(name: "atan", linkageName: "_ZL4atanf", scope: !619, file: !619, line: 42, type: !114, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!630 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !631, file: !619, line: 206)
!631 = !DISubprogram(name: "atan2", linkageName: "_ZL5atan2ff", scope: !619, file: !619, line: 40, type: !143, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!632 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !633, file: !619, line: 207)
!633 = !DISubprogram(name: "atanh", linkageName: "_ZL5atanhf", scope: !619, file: !619, line: 44, type: !114, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!634 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !635, file: !619, line: 208)
!635 = !DISubprogram(name: "cbrt", linkageName: "_ZL4cbrtf", scope: !619, file: !619, line: 46, type: !114, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!636 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !637, file: !619, line: 209)
!637 = !DISubprogram(name: "ceil", linkageName: "_ZL4ceilf", scope: !619, file: !619, line: 48, type: !114, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!638 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !639, file: !619, line: 210)
!639 = !DISubprogram(name: "copysign", linkageName: "_ZL8copysignff", scope: !619, file: !619, line: 50, type: !143, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!640 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !641, file: !619, line: 211)
!641 = !DISubprogram(name: "cos", linkageName: "_ZL3cosf", scope: !619, file: !619, line: 52, type: !114, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!642 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !643, file: !619, line: 212)
!643 = !DISubprogram(name: "cosh", linkageName: "_ZL4coshf", scope: !619, file: !619, line: 54, type: !114, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!644 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !645, file: !619, line: 213)
!645 = !DISubprogram(name: "erf", linkageName: "_ZL3erff", scope: !619, file: !619, line: 58, type: !114, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!646 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !647, file: !619, line: 214)
!647 = !DISubprogram(name: "erfc", linkageName: "_ZL4erfcf", scope: !619, file: !619, line: 56, type: !114, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!648 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !649, file: !619, line: 215)
!649 = !DISubprogram(name: "exp", linkageName: "_ZL3expf", scope: !619, file: !619, line: 62, type: !114, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!650 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !651, file: !619, line: 216)
!651 = !DISubprogram(name: "exp2", linkageName: "_ZL4exp2f", scope: !619, file: !619, line: 60, type: !114, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!652 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !653, file: !619, line: 217)
!653 = !DISubprogram(name: "expm1", linkageName: "_ZL5expm1f", scope: !619, file: !619, line: 64, type: !114, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!654 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !655, file: !619, line: 218)
!655 = !DISubprogram(name: "fabs", linkageName: "_ZL4fabsf", scope: !619, file: !619, line: 66, type: !114, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!656 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !657, file: !619, line: 219)
!657 = !DISubprogram(name: "fdim", linkageName: "_ZL4fdimff", scope: !619, file: !619, line: 68, type: !143, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!658 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !659, file: !619, line: 220)
!659 = !DISubprogram(name: "floor", linkageName: "_ZL5floorf", scope: !619, file: !619, line: 70, type: !114, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!660 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !661, file: !619, line: 221)
!661 = !DISubprogram(name: "fma", linkageName: "_ZL3fmafff", scope: !619, file: !619, line: 72, type: !185, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!662 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !663, file: !619, line: 222)
!663 = !DISubprogram(name: "fmax", linkageName: "_ZL4fmaxff", scope: !619, file: !619, line: 74, type: !143, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!664 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !665, file: !619, line: 223)
!665 = !DISubprogram(name: "fmin", linkageName: "_ZL4fminff", scope: !619, file: !619, line: 76, type: !143, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!666 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !667, file: !619, line: 224)
!667 = !DISubprogram(name: "fmod", linkageName: "_ZL4fmodff", scope: !619, file: !619, line: 78, type: !143, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!668 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !669, file: !619, line: 225)
!669 = !DISubprogram(name: "fpclassify", linkageName: "_ZL10fpclassifyf", scope: !619, file: !619, line: 80, type: !215, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!670 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !671, file: !619, line: 226)
!671 = !DISubprogram(name: "frexp", linkageName: "_ZL5frexpfPi", scope: !619, file: !619, line: 82, type: !672, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!672 = !DISubroutineType(types: !673)
!673 = !{!109, !109, !11}
!674 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !675, file: !619, line: 227)
!675 = !DISubprogram(name: "hypot", linkageName: "_ZL5hypotff", scope: !619, file: !619, line: 84, type: !143, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!676 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !677, file: !619, line: 228)
!677 = !DISubprogram(name: "ilogb", linkageName: "_ZL5ilogbf", scope: !619, file: !619, line: 86, type: !215, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!678 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !679, file: !619, line: 229)
!679 = !DISubprogram(name: "isfinite", linkageName: "_ZL8isfinitef", scope: !619, file: !619, line: 91, type: !680, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!680 = !DISubroutineType(types: !681)
!681 = !{!682, !109}
!682 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!683 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !684, file: !619, line: 230)
!684 = !DISubprogram(name: "isgreater", linkageName: "_ZL9isgreaterff", scope: !619, file: !619, line: 95, type: !685, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!685 = !DISubroutineType(types: !686)
!686 = !{!682, !109, !109}
!687 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !688, file: !619, line: 231)
!688 = !DISubprogram(name: "isgreaterequal", linkageName: "_ZL14isgreaterequalff", scope: !619, file: !619, line: 94, type: !685, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!689 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !690, file: !619, line: 232)
!690 = !DISubprogram(name: "isinf", linkageName: "_ZL5isinff", scope: !619, file: !619, line: 100, type: !680, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!691 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !692, file: !619, line: 233)
!692 = !DISubprogram(name: "isless", linkageName: "_ZL6islessff", scope: !619, file: !619, line: 104, type: !685, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!693 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !694, file: !619, line: 234)
!694 = !DISubprogram(name: "islessequal", linkageName: "_ZL11islessequalff", scope: !619, file: !619, line: 103, type: !685, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!695 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !696, file: !619, line: 235)
!696 = !DISubprogram(name: "islessgreater", linkageName: "_ZL13islessgreaterff", scope: !619, file: !619, line: 106, type: !685, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!697 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !698, file: !619, line: 236)
!698 = !DISubprogram(name: "isnan", linkageName: "_ZL5isnanf", scope: !619, file: !619, line: 111, type: !680, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!699 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !700, file: !619, line: 237)
!700 = !DISubprogram(name: "isnormal", linkageName: "_ZL8isnormalf", scope: !619, file: !619, line: 113, type: !680, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!701 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !702, file: !619, line: 238)
!702 = !DISubprogram(name: "isunordered", linkageName: "_ZL11isunorderedff", scope: !619, file: !619, line: 115, type: !685, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!703 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !704, file: !619, line: 239)
!704 = !DISubprogram(name: "labs", linkageName: "_ZL4labsl", scope: !619, file: !619, line: 116, type: !458, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!705 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !706, file: !619, line: 240)
!706 = !DISubprogram(name: "ldexp", linkageName: "_ZL5ldexpfi", scope: !619, file: !619, line: 118, type: !366, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!707 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !708, file: !619, line: 241)
!708 = !DISubprogram(name: "lgamma", linkageName: "_ZL6lgammaf", scope: !619, file: !619, line: 120, type: !114, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!709 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !710, file: !619, line: 242)
!710 = !DISubprogram(name: "llabs", linkageName: "_ZL5llabsx", scope: !619, file: !619, line: 121, type: !541, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!711 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !712, file: !619, line: 243)
!712 = !DISubprogram(name: "llrint", linkageName: "_ZL6llrintf", scope: !619, file: !619, line: 123, type: !234, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!713 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !714, file: !619, line: 244)
!714 = !DISubprogram(name: "log", linkageName: "_ZL3logf", scope: !619, file: !619, line: 133, type: !114, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!715 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !716, file: !619, line: 245)
!716 = !DISubprogram(name: "log10", linkageName: "_ZL5log10f", scope: !619, file: !619, line: 125, type: !114, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!717 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !718, file: !619, line: 246)
!718 = !DISubprogram(name: "log1p", linkageName: "_ZL5log1pf", scope: !619, file: !619, line: 127, type: !114, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!719 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !720, file: !619, line: 247)
!720 = !DISubprogram(name: "log2", linkageName: "_ZL4log2f", scope: !619, file: !619, line: 129, type: !114, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!721 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !722, file: !619, line: 248)
!722 = !DISubprogram(name: "logb", linkageName: "_ZL4logbf", scope: !619, file: !619, line: 131, type: !114, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!723 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !724, file: !619, line: 249)
!724 = !DISubprogram(name: "lrint", linkageName: "_ZL5lrintf", scope: !619, file: !619, line: 135, type: !271, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!725 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !726, file: !619, line: 250)
!726 = !DISubprogram(name: "lround", linkageName: "_ZL6lroundf", scope: !619, file: !619, line: 137, type: !271, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!727 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !728, file: !619, line: 251)
!728 = !DISubprogram(name: "llround", linkageName: "_ZL7llroundf", scope: !619, file: !619, line: 138, type: !234, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!729 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !730, file: !619, line: 252)
!730 = !DISubprogram(name: "modf", linkageName: "_ZL4modffPf", scope: !619, file: !619, line: 140, type: !731, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!731 = !DISubroutineType(types: !732)
!732 = !{!109, !109, !733}
!733 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !109, size: 64)
!734 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !735, file: !619, line: 253)
!735 = !DISubprogram(name: "nan", linkageName: "_ZL3nanPKc", scope: !619, file: !619, line: 141, type: !285, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!736 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !737, file: !619, line: 254)
!737 = !DISubprogram(name: "nanf", linkageName: "_ZL4nanfPKc", scope: !619, file: !619, line: 142, type: !292, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!738 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !739, file: !619, line: 255)
!739 = !DISubprogram(name: "nearbyint", linkageName: "_ZL9nearbyintf", scope: !619, file: !619, line: 144, type: !114, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!740 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !741, file: !619, line: 256)
!741 = !DISubprogram(name: "nextafter", linkageName: "_ZL9nextafterff", scope: !619, file: !619, line: 146, type: !143, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!742 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !743, file: !619, line: 257)
!743 = !DISubprogram(name: "pow", linkageName: "_ZL3powfi", scope: !619, file: !619, line: 150, type: !366, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!744 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !745, file: !619, line: 258)
!745 = !DISubprogram(name: "remainder", linkageName: "_ZL9remainderff", scope: !619, file: !619, line: 152, type: !143, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!746 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !747, file: !619, line: 259)
!747 = !DISubprogram(name: "remquo", linkageName: "_ZL6remquoffPi", scope: !619, file: !619, line: 154, type: !332, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!748 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !749, file: !619, line: 260)
!749 = !DISubprogram(name: "rint", linkageName: "_ZL4rintf", scope: !619, file: !619, line: 156, type: !114, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!750 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !751, file: !619, line: 261)
!751 = !DISubprogram(name: "round", linkageName: "_ZL5roundf", scope: !619, file: !619, line: 158, type: !114, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!752 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !753, file: !619, line: 262)
!753 = !DISubprogram(name: "scalbln", linkageName: "_ZL7scalblnfl", scope: !619, file: !619, line: 160, type: !356, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!754 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !755, file: !619, line: 263)
!755 = !DISubprogram(name: "scalbn", linkageName: "_ZL6scalbnfi", scope: !619, file: !619, line: 162, type: !366, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!756 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !757, file: !619, line: 264)
!757 = !DISubprogram(name: "signbit", linkageName: "_ZL7signbitf", scope: !619, file: !619, line: 167, type: !680, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!758 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !759, file: !619, line: 265)
!759 = !DISubprogram(name: "sin", linkageName: "_ZL3sinf", scope: !619, file: !619, line: 169, type: !114, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!760 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !761, file: !619, line: 266)
!761 = !DISubprogram(name: "sinh", linkageName: "_ZL4sinhf", scope: !619, file: !619, line: 171, type: !114, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!762 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !763, file: !619, line: 267)
!763 = !DISubprogram(name: "sqrt", linkageName: "_ZL4sqrtf", scope: !619, file: !619, line: 173, type: !114, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!764 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !765, file: !619, line: 268)
!765 = !DISubprogram(name: "tan", linkageName: "_ZL3tanf", scope: !619, file: !619, line: 175, type: !114, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!766 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !767, file: !619, line: 269)
!767 = !DISubprogram(name: "tanh", linkageName: "_ZL4tanhf", scope: !619, file: !619, line: 177, type: !114, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!768 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !769, file: !619, line: 270)
!769 = !DISubprogram(name: "tgamma", linkageName: "_ZL6tgammaf", scope: !619, file: !619, line: 179, type: !114, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!770 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !771, file: !619, line: 271)
!771 = !DISubprogram(name: "trunc", linkageName: "_ZL5truncf", scope: !619, file: !619, line: 181, type: !114, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!772 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !773, file: !775, line: 737)
!773 = !DISubprogram(name: "acosf", linkageName: "_ZL5acosff", scope: !774, file: !774, line: 358, type: !114, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!774 = !DIFile(filename: "/opt/rocm-6.4.2/lib/llvm/lib/clang/19/include/__clang_hip_math.h", directory: "", checksumkind: CSK_MD5, checksum: "1ddc6320be20cc493976d99e6b1c9853")
!775 = !DIFile(filename: "/opt/rocm-6.4.2/lib/llvm/lib/clang/19/include/__clang_hip_cmath.h", directory: "", checksumkind: CSK_MD5, checksum: "dc1ab1a8805dcbc75cbf36b8a1f9305a")
!776 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !777, file: !775, line: 738)
!777 = !DISubprogram(name: "acoshf", linkageName: "_ZL6acoshff", scope: !774, file: !774, line: 361, type: !114, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!778 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !779, file: !775, line: 739)
!779 = !DISubprogram(name: "asinf", linkageName: "_ZL5asinff", scope: !774, file: !774, line: 364, type: !114, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!780 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !781, file: !775, line: 740)
!781 = !DISubprogram(name: "asinhf", linkageName: "_ZL6asinhff", scope: !774, file: !774, line: 367, type: !114, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!782 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !783, file: !775, line: 741)
!783 = !DISubprogram(name: "atan2f", linkageName: "_ZL6atan2fff", scope: !774, file: !774, line: 370, type: !143, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!784 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !785, file: !775, line: 742)
!785 = !DISubprogram(name: "atanf", linkageName: "_ZL5atanff", scope: !774, file: !774, line: 373, type: !114, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!786 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !787, file: !775, line: 743)
!787 = !DISubprogram(name: "atanhf", linkageName: "_ZL6atanhff", scope: !774, file: !774, line: 376, type: !114, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!788 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !789, file: !775, line: 744)
!789 = !DISubprogram(name: "cbrtf", linkageName: "_ZL5cbrtff", scope: !774, file: !774, line: 379, type: !114, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!790 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !791, file: !775, line: 745)
!791 = !DISubprogram(name: "ceilf", linkageName: "_ZL5ceilff", scope: !774, file: !774, line: 382, type: !114, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!792 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !793, file: !775, line: 746)
!793 = !DISubprogram(name: "copysignf", linkageName: "_ZL9copysignfff", scope: !774, file: !774, line: 385, type: !143, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!794 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !795, file: !775, line: 747)
!795 = !DISubprogram(name: "cosf", linkageName: "_ZL4cosff", scope: !774, file: !774, line: 388, type: !114, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!796 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !797, file: !775, line: 748)
!797 = !DISubprogram(name: "coshf", linkageName: "_ZL5coshff", scope: !774, file: !774, line: 391, type: !114, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!798 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !799, file: !775, line: 749)
!799 = !DISubprogram(name: "erfcf", linkageName: "_ZL5erfcff", scope: !774, file: !774, line: 403, type: !114, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!800 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !801, file: !775, line: 750)
!801 = !DISubprogram(name: "erff", linkageName: "_ZL4erfff", scope: !774, file: !774, line: 412, type: !114, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!802 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !803, file: !775, line: 751)
!803 = !DISubprogram(name: "exp2f", linkageName: "_ZL5exp2ff", scope: !774, file: !774, line: 421, type: !114, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!804 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !805, file: !775, line: 752)
!805 = !DISubprogram(name: "expf", linkageName: "_ZL4expff", scope: !774, file: !774, line: 424, type: !114, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!806 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !807, file: !775, line: 753)
!807 = !DISubprogram(name: "expm1f", linkageName: "_ZL6expm1ff", scope: !774, file: !774, line: 427, type: !114, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!808 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !809, file: !775, line: 754)
!809 = !DISubprogram(name: "fabsf", linkageName: "_ZL5fabsff", scope: !774, file: !774, line: 430, type: !114, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!810 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !811, file: !775, line: 755)
!811 = !DISubprogram(name: "fdimf", linkageName: "_ZL5fdimfff", scope: !774, file: !774, line: 433, type: !143, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!812 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !813, file: !775, line: 756)
!813 = !DISubprogram(name: "floorf", linkageName: "_ZL6floorff", scope: !774, file: !774, line: 439, type: !114, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!814 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !815, file: !775, line: 757)
!815 = !DISubprogram(name: "fmaf", linkageName: "_ZL4fmaffff", scope: !774, file: !774, line: 442, type: !185, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!816 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !817, file: !775, line: 758)
!817 = !DISubprogram(name: "fmaxf", linkageName: "_ZL5fmaxfff", scope: !774, file: !774, line: 447, type: !143, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!818 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !819, file: !775, line: 759)
!819 = !DISubprogram(name: "fminf", linkageName: "_ZL5fminfff", scope: !774, file: !774, line: 450, type: !143, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!820 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !821, file: !775, line: 760)
!821 = !DISubprogram(name: "fmodf", linkageName: "_ZL5fmodfff", scope: !774, file: !774, line: 453, type: !143, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!822 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !823, file: !775, line: 761)
!823 = !DISubprogram(name: "frexpf", linkageName: "_ZL6frexpffPi", scope: !774, file: !774, line: 456, type: !672, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!824 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !825, file: !775, line: 762)
!825 = !DISubprogram(name: "hypotf", linkageName: "_ZL6hypotfff", scope: !774, file: !774, line: 461, type: !143, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!826 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !827, file: !775, line: 763)
!827 = !DISubprogram(name: "ilogbf", linkageName: "_ZL6ilogbff", scope: !774, file: !774, line: 464, type: !215, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!828 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !829, file: !775, line: 764)
!829 = !DISubprogram(name: "ldexpf", linkageName: "_ZL6ldexpffi", scope: !774, file: !774, line: 503, type: !366, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!830 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !831, file: !775, line: 765)
!831 = !DISubprogram(name: "lgammaf", linkageName: "_ZL7lgammaff", scope: !774, file: !774, line: 506, type: !114, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!832 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !833, file: !775, line: 766)
!833 = !DISubprogram(name: "llrintf", linkageName: "_ZL7llrintff", scope: !774, file: !774, line: 509, type: !234, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!834 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !835, file: !775, line: 767)
!835 = !DISubprogram(name: "llroundf", linkageName: "_ZL8llroundff", scope: !774, file: !774, line: 512, type: !234, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!836 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !837, file: !775, line: 768)
!837 = !DISubprogram(name: "log10f", linkageName: "_ZL6log10ff", scope: !774, file: !774, line: 515, type: !114, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!838 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !839, file: !775, line: 769)
!839 = !DISubprogram(name: "log1pf", linkageName: "_ZL6log1pff", scope: !774, file: !774, line: 518, type: !114, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!840 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !841, file: !775, line: 770)
!841 = !DISubprogram(name: "log2f", linkageName: "_ZL5log2ff", scope: !774, file: !774, line: 521, type: !114, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!842 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !843, file: !775, line: 771)
!843 = !DISubprogram(name: "logbf", linkageName: "_ZL5logbff", scope: !774, file: !774, line: 524, type: !114, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!844 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !845, file: !775, line: 772)
!845 = !DISubprogram(name: "logf", linkageName: "_ZL4logff", scope: !774, file: !774, line: 527, type: !114, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!846 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !847, file: !775, line: 773)
!847 = !DISubprogram(name: "lrintf", linkageName: "_ZL6lrintff", scope: !774, file: !774, line: 530, type: !271, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!848 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !849, file: !775, line: 774)
!849 = !DISubprogram(name: "lroundf", linkageName: "_ZL7lroundff", scope: !774, file: !774, line: 533, type: !271, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!850 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !851, file: !775, line: 775)
!851 = !DISubprogram(name: "modff", linkageName: "_ZL5modfffPf", scope: !774, file: !774, line: 536, type: !731, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!852 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !853, file: !775, line: 776)
!853 = !DISubprogram(name: "nearbyintf", linkageName: "_ZL10nearbyintff", scope: !774, file: !774, line: 571, type: !114, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!854 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !855, file: !775, line: 777)
!855 = !DISubprogram(name: "nextafterf", linkageName: "_ZL10nextafterfff", scope: !774, file: !774, line: 574, type: !143, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!856 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !857, file: !775, line: 779)
!857 = !DISubprogram(name: "powf", linkageName: "_ZL4powfff", scope: !774, file: !774, line: 607, type: !143, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!858 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !859, file: !775, line: 780)
!859 = !DISubprogram(name: "remainderf", linkageName: "_ZL10remainderfff", scope: !774, file: !774, line: 616, type: !143, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!860 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !861, file: !775, line: 781)
!861 = !DISubprogram(name: "remquof", linkageName: "_ZL7remquofffPi", scope: !774, file: !774, line: 621, type: !332, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!862 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !863, file: !775, line: 782)
!863 = !DISubprogram(name: "rintf", linkageName: "_ZL5rintff", scope: !774, file: !774, line: 636, type: !114, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!864 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !865, file: !775, line: 783)
!865 = !DISubprogram(name: "roundf", linkageName: "_ZL6roundff", scope: !774, file: !774, line: 661, type: !114, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!866 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !867, file: !775, line: 784)
!867 = !DISubprogram(name: "scalblnf", linkageName: "_ZL8scalblnffl", scope: !774, file: !774, line: 667, type: !356, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!868 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !869, file: !775, line: 785)
!869 = !DISubprogram(name: "scalbnf", linkageName: "_ZL7scalbnffi", scope: !774, file: !774, line: 673, type: !366, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!870 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !871, file: !775, line: 786)
!871 = !DISubprogram(name: "sinf", linkageName: "_ZL4sinff", scope: !774, file: !774, line: 703, type: !114, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!872 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !873, file: !775, line: 787)
!873 = !DISubprogram(name: "sinhf", linkageName: "_ZL5sinhff", scope: !774, file: !774, line: 706, type: !114, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!874 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !875, file: !775, line: 788)
!875 = !DISubprogram(name: "sqrtf", linkageName: "_ZL5sqrtff", scope: !774, file: !774, line: 712, type: !114, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!876 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !877, file: !775, line: 789)
!877 = !DISubprogram(name: "tanf", linkageName: "_ZL4tanff", scope: !774, file: !774, line: 715, type: !114, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!878 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !879, file: !775, line: 790)
!879 = !DISubprogram(name: "tanhf", linkageName: "_ZL5tanhff", scope: !774, file: !774, line: 718, type: !114, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!880 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !881, file: !775, line: 791)
!881 = !DISubprogram(name: "tgammaf", linkageName: "_ZL7tgammaff", scope: !774, file: !774, line: 721, type: !114, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!882 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !883, file: !775, line: 792)
!883 = !DISubprogram(name: "truncf", linkageName: "_ZL6truncff", scope: !774, file: !774, line: 724, type: !114, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!884 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !885, file: !886, line: 66)
!885 = !DICompositeType(tag: DW_TAG_class_type, name: "exception_ptr", scope: !887, file: !886, line: 97, size: 64, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSNSt15__exception_ptr13exception_ptrE")
!886 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/bits/exception_ptr.h", directory: "", checksumkind: CSK_MD5, checksum: "314ad14748ccb9ff85c65d17ebb0828b")
!887 = !DINamespace(name: "__exception_ptr", scope: !40)
!888 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !887, entity: !889, file: !886, line: 85)
!889 = !DISubprogram(name: "rethrow_exception", linkageName: "_ZSt17rethrow_exceptionNSt15__exception_ptr13exception_ptrE", scope: !40, file: !886, line: 81, type: !890, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!890 = !DISubroutineType(types: !891)
!891 = !{null, !885}
!892 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !893, file: !886, line: 243)
!893 = !DISubprogram(name: "swap", linkageName: "_ZNSt15__exception_ptr4swapERNS_13exception_ptrES1_", scope: !887, file: !886, line: 230, type: !894, flags: DIFlagPrototyped, spFlags: 0)
!894 = !DISubroutineType(types: !895)
!895 = !{null, !896, !896}
!896 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !885, size: 64)
!897 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !898, file: !913, line: 64)
!898 = !DIDerivedType(tag: DW_TAG_typedef, name: "mbstate_t", file: !899, line: 6, baseType: !900)
!899 = !DIFile(filename: "/usr/include/bits/types/mbstate_t.h", directory: "", checksumkind: CSK_MD5, checksum: "ba8742313715e20e434cf6ccb2db98e3")
!900 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mbstate_t", file: !901, line: 21, baseType: !902)
!901 = !DIFile(filename: "/usr/include/bits/types/__mbstate_t.h", directory: "", checksumkind: CSK_MD5, checksum: "82911a3e689448e3691ded3e0b471a55")
!902 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !901, line: 13, size: 64, flags: DIFlagTypePassByValue, elements: !903, identifier: "_ZTS11__mbstate_t")
!903 = !{!904, !905}
!904 = !DIDerivedType(tag: DW_TAG_member, name: "__count", scope: !902, file: !901, line: 15, baseType: !9, size: 32)
!905 = !DIDerivedType(tag: DW_TAG_member, name: "__value", scope: !902, file: !901, line: 20, baseType: !906, size: 32, offset: 32)
!906 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !902, file: !901, line: 16, size: 32, flags: DIFlagTypePassByValue, elements: !907, identifier: "_ZTSN11__mbstate_tUt_E")
!907 = !{!908, !909}
!908 = !DIDerivedType(tag: DW_TAG_member, name: "__wch", scope: !906, file: !901, line: 18, baseType: !17, size: 32)
!909 = !DIDerivedType(tag: DW_TAG_member, name: "__wchb", scope: !906, file: !901, line: 19, baseType: !910, size: 32)
!910 = !DICompositeType(tag: DW_TAG_array_type, baseType: !289, size: 32, elements: !911)
!911 = !{!912}
!912 = !DISubrange(count: 4)
!913 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/cwchar", directory: "")
!914 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !915, file: !913, line: 141)
!915 = !DIDerivedType(tag: DW_TAG_typedef, name: "wint_t", file: !916, line: 20, baseType: !17)
!916 = !DIFile(filename: "/usr/include/bits/types/wint_t.h", directory: "", checksumkind: CSK_MD5, checksum: "aa31b53ef28dc23152ceb41e2763ded3")
!917 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !918, file: !913, line: 143)
!918 = !DISubprogram(name: "btowc", scope: !919, file: !919, line: 309, type: !920, flags: DIFlagPrototyped, spFlags: 0)
!919 = !DIFile(filename: "/usr/include/wchar.h", directory: "", checksumkind: CSK_MD5, checksum: "c7881b2872d88c3ed71646d8a9e91af3")
!920 = !DISubroutineType(types: !921)
!921 = !{!915, !9}
!922 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !923, file: !913, line: 144)
!923 = !DISubprogram(name: "fgetwc", scope: !919, file: !919, line: 935, type: !924, flags: DIFlagPrototyped, spFlags: 0)
!924 = !DISubroutineType(types: !925)
!925 = !{!915, !926}
!926 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !927, size: 64)
!927 = !DIDerivedType(tag: DW_TAG_typedef, name: "__FILE", file: !928, line: 5, baseType: !929)
!928 = !DIFile(filename: "/usr/include/bits/types/__FILE.h", directory: "", checksumkind: CSK_MD5, checksum: "72a8fe90981f484acae7c6f3dfc5c2b7")
!929 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !928, line: 4, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS8_IO_FILE")
!930 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !931, file: !913, line: 145)
!931 = !DISubprogram(name: "fgetws", scope: !919, file: !919, line: 964, type: !932, flags: DIFlagPrototyped, spFlags: 0)
!932 = !DISubroutineType(types: !933)
!933 = !{!477, !476, !9, !934}
!934 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !926)
!935 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !936, file: !913, line: 146)
!936 = !DISubprogram(name: "fputwc", scope: !919, file: !919, line: 949, type: !937, flags: DIFlagPrototyped, spFlags: 0)
!937 = !DISubroutineType(types: !938)
!938 = !{!915, !478, !926}
!939 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !940, file: !913, line: 147)
!940 = !DISubprogram(name: "fputws", scope: !919, file: !919, line: 971, type: !941, flags: DIFlagPrototyped, spFlags: 0)
!941 = !DISubroutineType(types: !942)
!942 = !{!9, !523, !934}
!943 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !944, file: !913, line: 148)
!944 = !DISubprogram(name: "fwide", scope: !919, file: !919, line: 725, type: !945, flags: DIFlagPrototyped, spFlags: 0)
!945 = !DISubroutineType(types: !946)
!946 = !{!9, !926, !9}
!947 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !948, file: !913, line: 149)
!948 = !DISubprogram(name: "fwprintf", scope: !919, file: !919, line: 732, type: !949, flags: DIFlagPrototyped, spFlags: 0)
!949 = !DISubroutineType(types: !950)
!950 = !{!9, !934, !523, null}
!951 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !952, file: !913, line: 150)
!952 = !DISubprogram(name: "fwscanf", linkageName: "__isoc23_fwscanf", scope: !919, file: !919, line: 795, type: !949, flags: DIFlagPrototyped, spFlags: 0)
!953 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !954, file: !913, line: 151)
!954 = !DISubprogram(name: "getwc", scope: !919, file: !919, line: 936, type: !924, flags: DIFlagPrototyped, spFlags: 0)
!955 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !956, file: !913, line: 152)
!956 = !DISubprogram(name: "getwchar", scope: !919, file: !919, line: 942, type: !957, flags: DIFlagPrototyped, spFlags: 0)
!957 = !DISubroutineType(types: !958)
!958 = !{!915}
!959 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !960, file: !913, line: 153)
!960 = !DISubprogram(name: "mbrlen", scope: !919, file: !919, line: 332, type: !961, flags: DIFlagPrototyped, spFlags: 0)
!961 = !DISubroutineType(types: !962)
!962 = !{!407, !479, !407, !963}
!963 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !964)
!964 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !898, size: 64)
!965 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !966, file: !913, line: 154)
!966 = !DISubprogram(name: "mbrtowc", scope: !919, file: !919, line: 321, type: !967, flags: DIFlagPrototyped, spFlags: 0)
!967 = !DISubroutineType(types: !968)
!968 = !{!407, !476, !479, !407, !963}
!969 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !970, file: !913, line: 155)
!970 = !DISubprogram(name: "mbsinit", scope: !919, file: !919, line: 317, type: !971, flags: DIFlagPrototyped, spFlags: 0)
!971 = !DISubroutineType(types: !972)
!972 = !{!9, !973}
!973 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !974, size: 64)
!974 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !898)
!975 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !976, file: !913, line: 156)
!976 = !DISubprogram(name: "mbsrtowcs", scope: !919, file: !919, line: 362, type: !977, flags: DIFlagPrototyped, spFlags: 0)
!977 = !DISubroutineType(types: !978)
!978 = !{!407, !476, !979, !407, !963}
!979 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !980)
!980 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !287, size: 64)
!981 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !982, file: !913, line: 157)
!982 = !DISubprogram(name: "putwc", scope: !919, file: !919, line: 950, type: !937, flags: DIFlagPrototyped, spFlags: 0)
!983 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !984, file: !913, line: 158)
!984 = !DISubprogram(name: "putwchar", scope: !919, file: !919, line: 956, type: !985, flags: DIFlagPrototyped, spFlags: 0)
!985 = !DISubroutineType(types: !986)
!986 = !{!915, !478}
!987 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !988, file: !913, line: 160)
!988 = !DISubprogram(name: "swprintf", scope: !919, file: !919, line: 742, type: !989, flags: DIFlagPrototyped, spFlags: 0)
!989 = !DISubroutineType(types: !990)
!990 = !{!9, !476, !407, !523, null}
!991 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !992, file: !913, line: 162)
!992 = !DISubprogram(name: "swscanf", linkageName: "__isoc23_swscanf", scope: !919, file: !919, line: 802, type: !993, flags: DIFlagPrototyped, spFlags: 0)
!993 = !DISubroutineType(types: !994)
!994 = !{!9, !523, !523, null}
!995 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !996, file: !913, line: 163)
!996 = !DISubprogram(name: "ungetwc", scope: !919, file: !919, line: 979, type: !997, flags: DIFlagPrototyped, spFlags: 0)
!997 = !DISubroutineType(types: !998)
!998 = !{!915, !915, !926}
!999 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1000, file: !913, line: 164)
!1000 = !DISubprogram(name: "vfwprintf", scope: !919, file: !919, line: 750, type: !1001, flags: DIFlagPrototyped, spFlags: 0)
!1001 = !DISubroutineType(types: !1002)
!1002 = !{!9, !934, !523, !1003}
!1003 = !DIDerivedType(tag: DW_TAG_typedef, name: "__gnuc_va_list", file: !1004, line: 12, baseType: !1005)
!1004 = !DIFile(filename: "/opt/rocm-6.4.2/lib/llvm/lib/clang/19/include/__stdarg___gnuc_va_list.h", directory: "", checksumkind: CSK_MD5, checksum: "edb3f2eab991638e4dc94f6e55e3530f")
!1005 = !DIDerivedType(tag: DW_TAG_typedef, name: "__builtin_va_list", file: !3, baseType: !455)
!1006 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1007, file: !913, line: 166)
!1007 = !DISubprogram(name: "vfwscanf", linkageName: "__isoc23_vfwscanf", scope: !919, file: !919, line: 875, type: !1001, flags: DIFlagPrototyped, spFlags: 0)
!1008 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1009, file: !913, line: 169)
!1009 = !DISubprogram(name: "vswprintf", scope: !919, file: !919, line: 763, type: !1010, flags: DIFlagPrototyped, spFlags: 0)
!1010 = !DISubroutineType(types: !1011)
!1011 = !{!9, !476, !407, !523, !1003}
!1012 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1013, file: !913, line: 172)
!1013 = !DISubprogram(name: "vswscanf", linkageName: "__isoc23_vswscanf", scope: !919, file: !919, line: 882, type: !1014, flags: DIFlagPrototyped, spFlags: 0)
!1014 = !DISubroutineType(types: !1015)
!1015 = !{!9, !523, !523, !1003}
!1016 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1017, file: !913, line: 174)
!1017 = !DISubprogram(name: "vwprintf", scope: !919, file: !919, line: 758, type: !1018, flags: DIFlagPrototyped, spFlags: 0)
!1018 = !DISubroutineType(types: !1019)
!1019 = !{!9, !523, !1003}
!1020 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1021, file: !913, line: 176)
!1021 = !DISubprogram(name: "vwscanf", linkageName: "__isoc23_vwscanf", scope: !919, file: !919, line: 879, type: !1018, flags: DIFlagPrototyped, spFlags: 0)
!1022 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1023, file: !913, line: 178)
!1023 = !DISubprogram(name: "wcrtomb", scope: !919, file: !919, line: 326, type: !1024, flags: DIFlagPrototyped, spFlags: 0)
!1024 = !DISubroutineType(types: !1025)
!1025 = !{!407, !522, !478, !963}
!1026 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1027, file: !913, line: 179)
!1027 = !DISubprogram(name: "wcscat", scope: !919, file: !919, line: 121, type: !1028, flags: DIFlagPrototyped, spFlags: 0)
!1028 = !DISubroutineType(types: !1029)
!1029 = !{!477, !476, !523}
!1030 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1031, file: !913, line: 180)
!1031 = !DISubprogram(name: "wcscmp", scope: !919, file: !919, line: 130, type: !1032, flags: DIFlagPrototyped, spFlags: 0)
!1032 = !DISubroutineType(types: !1033)
!1033 = !{!9, !524, !524}
!1034 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1035, file: !913, line: 181)
!1035 = !DISubprogram(name: "wcscoll", scope: !919, file: !919, line: 155, type: !1032, flags: DIFlagPrototyped, spFlags: 0)
!1036 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1037, file: !913, line: 182)
!1037 = !DISubprogram(name: "wcscpy", scope: !919, file: !919, line: 98, type: !1028, flags: DIFlagPrototyped, spFlags: 0)
!1038 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1039, file: !913, line: 183)
!1039 = !DISubprogram(name: "wcscspn", scope: !919, file: !919, line: 212, type: !1040, flags: DIFlagPrototyped, spFlags: 0)
!1040 = !DISubroutineType(types: !1041)
!1041 = !{!407, !524, !524}
!1042 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1043, file: !913, line: 184)
!1043 = !DISubprogram(name: "wcsftime", scope: !919, file: !919, line: 1043, type: !1044, flags: DIFlagPrototyped, spFlags: 0)
!1044 = !DISubroutineType(types: !1045)
!1045 = !{!407, !476, !407, !523, !1046}
!1046 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1047)
!1047 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1048, size: 64)
!1048 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1049)
!1049 = !DICompositeType(tag: DW_TAG_structure_type, name: "tm", file: !919, line: 94, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS2tm")
!1050 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1051, file: !913, line: 185)
!1051 = !DISubprogram(name: "wcslen", scope: !919, file: !919, line: 247, type: !1052, flags: DIFlagPrototyped, spFlags: 0)
!1052 = !DISubroutineType(types: !1053)
!1053 = !{!407, !524}
!1054 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1055, file: !913, line: 186)
!1055 = !DISubprogram(name: "wcsncat", scope: !919, file: !919, line: 125, type: !1056, flags: DIFlagPrototyped, spFlags: 0)
!1056 = !DISubroutineType(types: !1057)
!1057 = !{!477, !476, !523, !407}
!1058 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1059, file: !913, line: 187)
!1059 = !DISubprogram(name: "wcsncmp", scope: !919, file: !919, line: 133, type: !1060, flags: DIFlagPrototyped, spFlags: 0)
!1060 = !DISubroutineType(types: !1061)
!1061 = !{!9, !524, !524, !407}
!1062 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1063, file: !913, line: 188)
!1063 = !DISubprogram(name: "wcsncpy", scope: !919, file: !919, line: 103, type: !1056, flags: DIFlagPrototyped, spFlags: 0)
!1064 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1065, file: !913, line: 189)
!1065 = !DISubprogram(name: "wcsrtombs", scope: !919, file: !919, line: 368, type: !1066, flags: DIFlagPrototyped, spFlags: 0)
!1066 = !DISubroutineType(types: !1067)
!1067 = !{!407, !522, !1068, !407, !963}
!1068 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1069)
!1069 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !524, size: 64)
!1070 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1071, file: !913, line: 190)
!1071 = !DISubprogram(name: "wcsspn", scope: !919, file: !919, line: 216, type: !1040, flags: DIFlagPrototyped, spFlags: 0)
!1072 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1073, file: !913, line: 191)
!1073 = !DISubprogram(name: "wcstod", scope: !919, file: !919, line: 402, type: !1074, flags: DIFlagPrototyped, spFlags: 0)
!1074 = !DISubroutineType(types: !1075)
!1075 = !{!51, !523, !1076}
!1076 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1077)
!1077 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !477, size: 64)
!1078 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1079, file: !913, line: 193)
!1079 = !DISubprogram(name: "wcstof", scope: !919, file: !919, line: 407, type: !1080, flags: DIFlagPrototyped, spFlags: 0)
!1080 = !DISubroutineType(types: !1081)
!1081 = !{!109, !523, !1076}
!1082 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1083, file: !913, line: 195)
!1083 = !DISubprogram(name: "wcstok", scope: !919, file: !919, line: 242, type: !1084, flags: DIFlagPrototyped, spFlags: 0)
!1084 = !DISubroutineType(types: !1085)
!1085 = !{!477, !476, !523, !1076}
!1086 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1087, file: !913, line: 196)
!1087 = !DISubprogram(name: "wcstol", linkageName: "__isoc23_wcstol", scope: !919, file: !919, line: 500, type: !1088, flags: DIFlagPrototyped, spFlags: 0)
!1088 = !DISubroutineType(types: !1089)
!1089 = !{!268, !523, !1076, !9}
!1090 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1091, file: !913, line: 197)
!1091 = !DISubprogram(name: "wcstoul", linkageName: "__isoc23_wcstoul", scope: !919, file: !919, line: 503, type: !1092, flags: DIFlagPrototyped, spFlags: 0)
!1092 = !DISubroutineType(types: !1093)
!1093 = !{!409, !523, !1076, !9}
!1094 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1095, file: !913, line: 198)
!1095 = !DISubprogram(name: "wcsxfrm", scope: !919, file: !919, line: 159, type: !1096, flags: DIFlagPrototyped, spFlags: 0)
!1096 = !DISubroutineType(types: !1097)
!1097 = !{!407, !476, !523, !407}
!1098 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1099, file: !913, line: 199)
!1099 = !DISubprogram(name: "wctob", scope: !919, file: !919, line: 313, type: !1100, flags: DIFlagPrototyped, spFlags: 0)
!1100 = !DISubroutineType(types: !1101)
!1101 = !{!9, !915}
!1102 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1103, file: !913, line: 200)
!1103 = !DISubprogram(name: "wmemcmp", scope: !919, file: !919, line: 283, type: !1060, flags: DIFlagPrototyped, spFlags: 0)
!1104 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1105, file: !913, line: 201)
!1105 = !DISubprogram(name: "wmemcpy", scope: !919, file: !919, line: 287, type: !1056, flags: DIFlagPrototyped, spFlags: 0)
!1106 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1107, file: !913, line: 202)
!1107 = !DISubprogram(name: "wmemmove", scope: !919, file: !919, line: 292, type: !1108, flags: DIFlagPrototyped, spFlags: 0)
!1108 = !DISubroutineType(types: !1109)
!1109 = !{!477, !477, !524, !407}
!1110 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1111, file: !913, line: 203)
!1111 = !DISubprogram(name: "wmemset", scope: !919, file: !919, line: 296, type: !1112, flags: DIFlagPrototyped, spFlags: 0)
!1112 = !DISubroutineType(types: !1113)
!1113 = !{!477, !477, !478, !407}
!1114 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1115, file: !913, line: 204)
!1115 = !DISubprogram(name: "wprintf", scope: !919, file: !919, line: 739, type: !1116, flags: DIFlagPrototyped, spFlags: 0)
!1116 = !DISubroutineType(types: !1117)
!1117 = !{!9, !523, null}
!1118 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1119, file: !913, line: 205)
!1119 = !DISubprogram(name: "wscanf", linkageName: "__isoc23_wscanf", scope: !919, file: !919, line: 799, type: !1116, flags: DIFlagPrototyped, spFlags: 0)
!1120 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1121, file: !913, line: 206)
!1121 = !DISubprogram(name: "wcschr", scope: !919, file: !919, line: 189, type: !1122, flags: DIFlagPrototyped, spFlags: 0)
!1122 = !DISubroutineType(types: !1123)
!1123 = !{!477, !524, !478}
!1124 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1125, file: !913, line: 207)
!1125 = !DISubprogram(name: "wcspbrk", scope: !919, file: !919, line: 226, type: !1126, flags: DIFlagPrototyped, spFlags: 0)
!1126 = !DISubroutineType(types: !1127)
!1127 = !{!477, !524, !524}
!1128 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1129, file: !913, line: 208)
!1129 = !DISubprogram(name: "wcsrchr", scope: !919, file: !919, line: 199, type: !1122, flags: DIFlagPrototyped, spFlags: 0)
!1130 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1131, file: !913, line: 209)
!1131 = !DISubprogram(name: "wcsstr", scope: !919, file: !919, line: 237, type: !1126, flags: DIFlagPrototyped, spFlags: 0)
!1132 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1133, file: !913, line: 210)
!1133 = !DISubprogram(name: "wmemchr", scope: !919, file: !919, line: 278, type: !1134, flags: DIFlagPrototyped, spFlags: 0)
!1134 = !DISubroutineType(types: !1135)
!1135 = !{!477, !524, !478, !407}
!1136 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !531, entity: !1137, file: !913, line: 251)
!1137 = !DISubprogram(name: "wcstold", scope: !919, file: !919, line: 409, type: !1138, flags: DIFlagPrototyped, spFlags: 0)
!1138 = !DISubroutineType(types: !1139)
!1139 = !{!120, !523, !1076}
!1140 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !531, entity: !1141, file: !913, line: 260)
!1141 = !DISubprogram(name: "wcstoll", linkageName: "__isoc23_wcstoll", scope: !919, file: !919, line: 508, type: !1142, flags: DIFlagPrototyped, spFlags: 0)
!1142 = !DISubroutineType(types: !1143)
!1143 = !{!231, !523, !1076, !9}
!1144 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !531, entity: !1145, file: !913, line: 261)
!1145 = !DISubprogram(name: "wcstoull", linkageName: "__isoc23_wcstoull", scope: !919, file: !919, line: 513, type: !1146, flags: DIFlagPrototyped, spFlags: 0)
!1146 = !DISubroutineType(types: !1147)
!1147 = !{!559, !523, !1076, !9}
!1148 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1137, file: !913, line: 267)
!1149 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1141, file: !913, line: 268)
!1150 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1145, file: !913, line: 269)
!1151 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1079, file: !913, line: 283)
!1152 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1007, file: !913, line: 286)
!1153 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1013, file: !913, line: 289)
!1154 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1021, file: !913, line: 292)
!1155 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1137, file: !913, line: 296)
!1156 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1141, file: !913, line: 297)
!1157 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1145, file: !913, line: 298)
!1158 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1159, file: !1161, line: 53)
!1159 = !DICompositeType(tag: DW_TAG_structure_type, name: "lconv", file: !1160, line: 51, size: 768, flags: DIFlagFwdDecl, identifier: "_ZTS5lconv")
!1160 = !DIFile(filename: "/usr/include/locale.h", directory: "", checksumkind: CSK_MD5, checksum: "9fdf0d24f6e4cc61619b5e3258456dbf")
!1161 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/clocale", directory: "")
!1162 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1163, file: !1161, line: 54)
!1163 = !DISubprogram(name: "setlocale", scope: !1160, file: !1160, line: 122, type: !1164, flags: DIFlagPrototyped, spFlags: 0)
!1164 = !DISubroutineType(types: !1165)
!1165 = !{!455, !9, !287}
!1166 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1167, file: !1161, line: 55)
!1167 = !DISubprogram(name: "localeconv", scope: !1160, file: !1160, line: 125, type: !1168, flags: DIFlagPrototyped, spFlags: 0)
!1168 = !DISubroutineType(types: !1169)
!1169 = !{!1170}
!1170 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1159, size: 64)
!1171 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1172, file: !1174, line: 64)
!1172 = !DISubprogram(name: "isalnum", scope: !1173, file: !1173, line: 108, type: !43, flags: DIFlagPrototyped, spFlags: 0)
!1173 = !DIFile(filename: "/usr/include/ctype.h", directory: "", checksumkind: CSK_MD5, checksum: "04aab4fba8cc4c824a8f09075cc98b20")
!1174 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/cctype", directory: "")
!1175 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1176, file: !1174, line: 65)
!1176 = !DISubprogram(name: "isalpha", scope: !1173, file: !1173, line: 109, type: !43, flags: DIFlagPrototyped, spFlags: 0)
!1177 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1178, file: !1174, line: 66)
!1178 = !DISubprogram(name: "iscntrl", scope: !1173, file: !1173, line: 110, type: !43, flags: DIFlagPrototyped, spFlags: 0)
!1179 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1180, file: !1174, line: 67)
!1180 = !DISubprogram(name: "isdigit", scope: !1173, file: !1173, line: 111, type: !43, flags: DIFlagPrototyped, spFlags: 0)
!1181 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1182, file: !1174, line: 68)
!1182 = !DISubprogram(name: "isgraph", scope: !1173, file: !1173, line: 113, type: !43, flags: DIFlagPrototyped, spFlags: 0)
!1183 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1184, file: !1174, line: 69)
!1184 = !DISubprogram(name: "islower", scope: !1173, file: !1173, line: 112, type: !43, flags: DIFlagPrototyped, spFlags: 0)
!1185 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1186, file: !1174, line: 70)
!1186 = !DISubprogram(name: "isprint", scope: !1173, file: !1173, line: 114, type: !43, flags: DIFlagPrototyped, spFlags: 0)
!1187 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1188, file: !1174, line: 71)
!1188 = !DISubprogram(name: "ispunct", scope: !1173, file: !1173, line: 115, type: !43, flags: DIFlagPrototyped, spFlags: 0)
!1189 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1190, file: !1174, line: 72)
!1190 = !DISubprogram(name: "isspace", scope: !1173, file: !1173, line: 116, type: !43, flags: DIFlagPrototyped, spFlags: 0)
!1191 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1192, file: !1174, line: 73)
!1192 = !DISubprogram(name: "isupper", scope: !1173, file: !1173, line: 117, type: !43, flags: DIFlagPrototyped, spFlags: 0)
!1193 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1194, file: !1174, line: 74)
!1194 = !DISubprogram(name: "isxdigit", scope: !1173, file: !1173, line: 118, type: !43, flags: DIFlagPrototyped, spFlags: 0)
!1195 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1196, file: !1174, line: 75)
!1196 = !DISubprogram(name: "tolower", scope: !1173, file: !1173, line: 122, type: !43, flags: DIFlagPrototyped, spFlags: 0)
!1197 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1198, file: !1174, line: 76)
!1198 = !DISubprogram(name: "toupper", scope: !1173, file: !1173, line: 125, type: !43, flags: DIFlagPrototyped, spFlags: 0)
!1199 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1200, file: !1174, line: 87)
!1200 = !DISubprogram(name: "isblank", scope: !1173, file: !1173, line: 130, type: !43, flags: DIFlagPrototyped, spFlags: 0)
!1201 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1202, file: !1204, line: 98)
!1202 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !1203, line: 7, baseType: !929)
!1203 = !DIFile(filename: "/usr/include/bits/types/FILE.h", directory: "", checksumkind: CSK_MD5, checksum: "571f9fb6223c42439075fdde11a0de5d")
!1204 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/cstdio", directory: "")
!1205 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1206, file: !1204, line: 99)
!1206 = !DIDerivedType(tag: DW_TAG_typedef, name: "fpos_t", file: !1207, line: 84, baseType: !1208)
!1207 = !DIFile(filename: "/usr/include/stdio.h", directory: "", checksumkind: CSK_MD5, checksum: "600479e30522c60809530fc01f232b17")
!1208 = !DIDerivedType(tag: DW_TAG_typedef, name: "__fpos_t", file: !1209, line: 14, baseType: !1210)
!1209 = !DIFile(filename: "/usr/include/bits/types/__fpos_t.h", directory: "", checksumkind: CSK_MD5, checksum: "32de8bdaf3551a6c0a9394f9af4389ce")
!1210 = !DICompositeType(tag: DW_TAG_structure_type, name: "_G_fpos_t", file: !1209, line: 10, size: 128, flags: DIFlagFwdDecl, identifier: "_ZTS9_G_fpos_t")
!1211 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1212, file: !1204, line: 101)
!1212 = !DISubprogram(name: "clearerr", scope: !1207, file: !1207, line: 844, type: !1213, flags: DIFlagPrototyped, spFlags: 0)
!1213 = !DISubroutineType(types: !1214)
!1214 = !{null, !1215}
!1215 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1202, size: 64)
!1216 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1217, file: !1204, line: 102)
!1217 = !DISubprogram(name: "fclose", scope: !1207, file: !1207, line: 183, type: !1218, flags: DIFlagPrototyped, spFlags: 0)
!1218 = !DISubroutineType(types: !1219)
!1219 = !{!9, !1215}
!1220 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1221, file: !1204, line: 103)
!1221 = !DISubprogram(name: "feof", scope: !1207, file: !1207, line: 846, type: !1218, flags: DIFlagPrototyped, spFlags: 0)
!1222 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1223, file: !1204, line: 104)
!1223 = !DISubprogram(name: "ferror", scope: !1207, file: !1207, line: 848, type: !1218, flags: DIFlagPrototyped, spFlags: 0)
!1224 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1225, file: !1204, line: 105)
!1225 = !DISubprogram(name: "fflush", scope: !1207, file: !1207, line: 235, type: !1218, flags: DIFlagPrototyped, spFlags: 0)
!1226 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1227, file: !1204, line: 106)
!1227 = !DISubprogram(name: "fgetc", scope: !1207, file: !1207, line: 571, type: !1218, flags: DIFlagPrototyped, spFlags: 0)
!1228 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1229, file: !1204, line: 107)
!1229 = !DISubprogram(name: "fgetpos", scope: !1207, file: !1207, line: 818, type: !1230, flags: DIFlagPrototyped, spFlags: 0)
!1230 = !DISubroutineType(types: !1231)
!1231 = !{!9, !1232, !1233}
!1232 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1215)
!1233 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1234)
!1234 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1206, size: 64)
!1235 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1236, file: !1204, line: 108)
!1236 = !DISubprogram(name: "fgets", scope: !1207, file: !1207, line: 650, type: !1237, flags: DIFlagPrototyped, spFlags: 0)
!1237 = !DISubroutineType(types: !1238)
!1238 = !{!455, !522, !9, !1232}
!1239 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1240, file: !1204, line: 109)
!1240 = !DISubprogram(name: "fopen", scope: !1207, file: !1207, line: 263, type: !1241, flags: DIFlagPrototyped, spFlags: 0)
!1241 = !DISubroutineType(types: !1242)
!1242 = !{!1215, !479, !479}
!1243 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1244, file: !1204, line: 110)
!1244 = !DISubprogram(name: "fprintf", scope: !1207, file: !1207, line: 355, type: !1245, flags: DIFlagPrototyped, spFlags: 0)
!1245 = !DISubroutineType(types: !1246)
!1246 = !{!9, !1232, !479, null}
!1247 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1248, file: !1204, line: 111)
!1248 = !DISubprogram(name: "fputc", scope: !1207, file: !1207, line: 607, type: !1249, flags: DIFlagPrototyped, spFlags: 0)
!1249 = !DISubroutineType(types: !1250)
!1250 = !{!9, !9, !1215}
!1251 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1252, file: !1204, line: 112)
!1252 = !DISubprogram(name: "fputs", scope: !1207, file: !1207, line: 713, type: !1253, flags: DIFlagPrototyped, spFlags: 0)
!1253 = !DISubroutineType(types: !1254)
!1254 = !{!9, !479, !1232}
!1255 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1256, file: !1204, line: 113)
!1256 = !DISubprogram(name: "fread", scope: !1207, file: !1207, line: 733, type: !1257, flags: DIFlagPrototyped, spFlags: 0)
!1257 = !DISubroutineType(types: !1258)
!1258 = !{!407, !1259, !407, !407, !1232}
!1259 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !406)
!1260 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1261, file: !1204, line: 114)
!1261 = !DISubprogram(name: "freopen", scope: !1207, file: !1207, line: 270, type: !1262, flags: DIFlagPrototyped, spFlags: 0)
!1262 = !DISubroutineType(types: !1263)
!1263 = !{!1215, !479, !479, !1232}
!1264 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1265, file: !1204, line: 115)
!1265 = !DISubprogram(name: "fscanf", linkageName: "__isoc23_fscanf", scope: !1207, file: !1207, line: 440, type: !1245, flags: DIFlagPrototyped, spFlags: 0)
!1266 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1267, file: !1204, line: 116)
!1267 = !DISubprogram(name: "fseek", scope: !1207, file: !1207, line: 771, type: !1268, flags: DIFlagPrototyped, spFlags: 0)
!1268 = !DISubroutineType(types: !1269)
!1269 = !{!9, !1215, !268, !9}
!1270 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1271, file: !1204, line: 117)
!1271 = !DISubprogram(name: "fsetpos", scope: !1207, file: !1207, line: 823, type: !1272, flags: DIFlagPrototyped, spFlags: 0)
!1272 = !DISubroutineType(types: !1273)
!1273 = !{!9, !1215, !1274}
!1274 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1275, size: 64)
!1275 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1206)
!1276 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1277, file: !1204, line: 118)
!1277 = !DISubprogram(name: "ftell", scope: !1207, file: !1207, line: 776, type: !1278, flags: DIFlagPrototyped, spFlags: 0)
!1278 = !DISubroutineType(types: !1279)
!1279 = !{!268, !1215}
!1280 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1281, file: !1204, line: 119)
!1281 = !DISubprogram(name: "fwrite", scope: !1207, file: !1207, line: 739, type: !1282, flags: DIFlagPrototyped, spFlags: 0)
!1282 = !DISubroutineType(types: !1283)
!1283 = !{!407, !1284, !407, !407, !1232}
!1284 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !431)
!1285 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1286, file: !1204, line: 120)
!1286 = !DISubprogram(name: "getc", scope: !1207, file: !1207, line: 572, type: !1218, flags: DIFlagPrototyped, spFlags: 0)
!1287 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1288, file: !1204, line: 121)
!1288 = !DISubprogram(name: "getchar", scope: !1207, file: !1207, line: 578, type: !492, flags: DIFlagPrototyped, spFlags: 0)
!1289 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1290, file: !1204, line: 126)
!1290 = !DISubprogram(name: "perror", scope: !1207, file: !1207, line: 862, type: !1291, flags: DIFlagPrototyped, spFlags: 0)
!1291 = !DISubroutineType(types: !1292)
!1292 = !{null, !287}
!1293 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1294, file: !1204, line: 127)
!1294 = !DISubprogram(name: "printf", scope: !1207, file: !1207, line: 361, type: !1295, flags: DIFlagPrototyped, spFlags: 0)
!1295 = !DISubroutineType(types: !1296)
!1296 = !{!9, !479, null}
!1297 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1298, file: !1204, line: 128)
!1298 = !DISubprogram(name: "putc", scope: !1207, file: !1207, line: 608, type: !1249, flags: DIFlagPrototyped, spFlags: 0)
!1299 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1300, file: !1204, line: 129)
!1300 = !DISubprogram(name: "putchar", scope: !1207, file: !1207, line: 614, type: !43, flags: DIFlagPrototyped, spFlags: 0)
!1301 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1302, file: !1204, line: 130)
!1302 = !DISubprogram(name: "puts", scope: !1207, file: !1207, line: 719, type: !421, flags: DIFlagPrototyped, spFlags: 0)
!1303 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1304, file: !1204, line: 131)
!1304 = !DISubprogram(name: "remove", scope: !1207, file: !1207, line: 157, type: !421, flags: DIFlagPrototyped, spFlags: 0)
!1305 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1306, file: !1204, line: 132)
!1306 = !DISubprogram(name: "rename", scope: !1207, file: !1207, line: 159, type: !1307, flags: DIFlagPrototyped, spFlags: 0)
!1307 = !DISubroutineType(types: !1308)
!1308 = !{!9, !287, !287}
!1309 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1310, file: !1204, line: 133)
!1310 = !DISubprogram(name: "rewind", scope: !1207, file: !1207, line: 781, type: !1213, flags: DIFlagPrototyped, spFlags: 0)
!1311 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1312, file: !1204, line: 134)
!1312 = !DISubprogram(name: "scanf", linkageName: "__isoc23_scanf", scope: !1207, file: !1207, line: 443, type: !1295, flags: DIFlagPrototyped, spFlags: 0)
!1313 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1314, file: !1204, line: 135)
!1314 = !DISubprogram(name: "setbuf", scope: !1207, file: !1207, line: 333, type: !1315, flags: DIFlagPrototyped, spFlags: 0)
!1315 = !DISubroutineType(types: !1316)
!1316 = !{null, !1232, !522}
!1317 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1318, file: !1204, line: 136)
!1318 = !DISubprogram(name: "setvbuf", scope: !1207, file: !1207, line: 337, type: !1319, flags: DIFlagPrototyped, spFlags: 0)
!1319 = !DISubroutineType(types: !1320)
!1320 = !{!9, !1232, !522, !9, !407}
!1321 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1322, file: !1204, line: 137)
!1322 = !DISubprogram(name: "sprintf", scope: !1207, file: !1207, line: 363, type: !1323, flags: DIFlagPrototyped, spFlags: 0)
!1323 = !DISubroutineType(types: !1324)
!1324 = !{!9, !522, !479, null}
!1325 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1326, file: !1204, line: 138)
!1326 = !DISubprogram(name: "sscanf", linkageName: "__isoc23_sscanf", scope: !1207, file: !1207, line: 445, type: !1327, flags: DIFlagPrototyped, spFlags: 0)
!1327 = !DISubroutineType(types: !1328)
!1328 = !{!9, !479, !479, null}
!1329 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1330, file: !1204, line: 139)
!1330 = !DISubprogram(name: "tmpfile", scope: !1207, file: !1207, line: 193, type: !1331, flags: DIFlagPrototyped, spFlags: 0)
!1331 = !DISubroutineType(types: !1332)
!1332 = !{!1215}
!1333 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1334, file: !1204, line: 141)
!1334 = !DISubprogram(name: "tmpnam", scope: !1207, file: !1207, line: 210, type: !1335, flags: DIFlagPrototyped, spFlags: 0)
!1335 = !DISubroutineType(types: !1336)
!1336 = !{!455, !455}
!1337 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1338, file: !1204, line: 143)
!1338 = !DISubprogram(name: "ungetc", scope: !1207, file: !1207, line: 726, type: !1249, flags: DIFlagPrototyped, spFlags: 0)
!1339 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1340, file: !1204, line: 144)
!1340 = !DISubprogram(name: "vfprintf", scope: !1207, file: !1207, line: 370, type: !1341, flags: DIFlagPrototyped, spFlags: 0)
!1341 = !DISubroutineType(types: !1342)
!1342 = !{!9, !1232, !479, !1003}
!1343 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1344, file: !1204, line: 145)
!1344 = !DISubprogram(name: "vprintf", scope: !1207, file: !1207, line: 376, type: !1345, flags: DIFlagPrototyped, spFlags: 0)
!1345 = !DISubroutineType(types: !1346)
!1346 = !{!9, !479, !1003}
!1347 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1348, file: !1204, line: 146)
!1348 = !DISubprogram(name: "vsprintf", scope: !1207, file: !1207, line: 378, type: !1349, flags: DIFlagPrototyped, spFlags: 0)
!1349 = !DISubroutineType(types: !1350)
!1350 = !{!9, !522, !479, !1003}
!1351 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !531, entity: !1352, file: !1204, line: 175)
!1352 = !DISubprogram(name: "snprintf", scope: !1207, file: !1207, line: 383, type: !1353, flags: DIFlagPrototyped, spFlags: 0)
!1353 = !DISubroutineType(types: !1354)
!1354 = !{!9, !522, !407, !479, null}
!1355 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !531, entity: !1356, file: !1204, line: 176)
!1356 = !DISubprogram(name: "vfscanf", linkageName: "__isoc23_vfscanf", scope: !1207, file: !1207, line: 507, type: !1341, flags: DIFlagPrototyped, spFlags: 0)
!1357 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !531, entity: !1358, file: !1204, line: 177)
!1358 = !DISubprogram(name: "vscanf", linkageName: "__isoc23_vscanf", scope: !1207, file: !1207, line: 512, type: !1345, flags: DIFlagPrototyped, spFlags: 0)
!1359 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !531, entity: !1360, file: !1204, line: 178)
!1360 = !DISubprogram(name: "vsnprintf", scope: !1207, file: !1207, line: 387, type: !1361, flags: DIFlagPrototyped, spFlags: 0)
!1361 = !DISubroutineType(types: !1362)
!1362 = !{!9, !522, !407, !479, !1003}
!1363 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !531, entity: !1364, file: !1204, line: 179)
!1364 = !DISubprogram(name: "vsscanf", linkageName: "__isoc23_vsscanf", scope: !1207, file: !1207, line: 515, type: !1365, flags: DIFlagPrototyped, spFlags: 0)
!1365 = !DISubroutineType(types: !1366)
!1366 = !{!9, !479, !479, !1003}
!1367 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1352, file: !1204, line: 185)
!1368 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1356, file: !1204, line: 186)
!1369 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1358, file: !1204, line: 187)
!1370 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1360, file: !1204, line: 188)
!1371 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1364, file: !1204, line: 189)
!1372 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1373, file: !1379, line: 58)
!1373 = !DIDerivedType(tag: DW_TAG_typedef, name: "max_align_t", file: !1374, line: 24, baseType: !1375)
!1374 = !DIFile(filename: "/opt/rocm-6.4.2/lib/llvm/lib/clang/19/include/__stddef_max_align_t.h", directory: "", checksumkind: CSK_MD5, checksum: "3c0a2f19d136d39aa835c737c7105def")
!1375 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1374, line: 19, size: 128, flags: DIFlagTypePassByValue, elements: !1376, identifier: "_ZTS11max_align_t")
!1376 = !{!1377, !1378}
!1377 = !DIDerivedType(tag: DW_TAG_member, name: "__clang_max_align_nonce1", scope: !1375, file: !1374, line: 20, baseType: !231, size: 64, align: 64)
!1378 = !DIDerivedType(tag: DW_TAG_member, name: "__clang_max_align_nonce2", scope: !1375, file: !1374, line: 22, baseType: !120, size: 64, align: 64, offset: 64)
!1379 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/cstddef", directory: "")
!1380 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1381, file: !1386, line: 82)
!1381 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctrans_t", file: !1382, line: 48, baseType: !1383)
!1382 = !DIFile(filename: "/usr/include/wctype.h", directory: "", checksumkind: CSK_MD5, checksum: "93d4b1045b46d132ff5e6d83a26abaee")
!1383 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1384, size: 64)
!1384 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1385)
!1385 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !25, line: 41, baseType: !9)
!1386 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/cwctype", directory: "")
!1387 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1388, file: !1386, line: 83)
!1388 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctype_t", file: !1389, line: 38, baseType: !409)
!1389 = !DIFile(filename: "/usr/include/bits/wctype-wchar.h", directory: "", checksumkind: CSK_MD5, checksum: "65a194b61bfadb7760be04a5640f774f")
!1390 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !915, file: !1386, line: 84)
!1391 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1392, file: !1386, line: 86)
!1392 = !DISubprogram(name: "iswalnum", scope: !1389, file: !1389, line: 95, type: !1100, flags: DIFlagPrototyped, spFlags: 0)
!1393 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1394, file: !1386, line: 87)
!1394 = !DISubprogram(name: "iswalpha", scope: !1389, file: !1389, line: 101, type: !1100, flags: DIFlagPrototyped, spFlags: 0)
!1395 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1396, file: !1386, line: 89)
!1396 = !DISubprogram(name: "iswblank", scope: !1389, file: !1389, line: 146, type: !1100, flags: DIFlagPrototyped, spFlags: 0)
!1397 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1398, file: !1386, line: 91)
!1398 = !DISubprogram(name: "iswcntrl", scope: !1389, file: !1389, line: 104, type: !1100, flags: DIFlagPrototyped, spFlags: 0)
!1399 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1400, file: !1386, line: 92)
!1400 = !DISubprogram(name: "iswctype", scope: !1389, file: !1389, line: 159, type: !1401, flags: DIFlagPrototyped, spFlags: 0)
!1401 = !DISubroutineType(types: !1402)
!1402 = !{!9, !915, !1388}
!1403 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1404, file: !1386, line: 93)
!1404 = !DISubprogram(name: "iswdigit", scope: !1389, file: !1389, line: 108, type: !1100, flags: DIFlagPrototyped, spFlags: 0)
!1405 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1406, file: !1386, line: 94)
!1406 = !DISubprogram(name: "iswgraph", scope: !1389, file: !1389, line: 112, type: !1100, flags: DIFlagPrototyped, spFlags: 0)
!1407 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1408, file: !1386, line: 95)
!1408 = !DISubprogram(name: "iswlower", scope: !1389, file: !1389, line: 117, type: !1100, flags: DIFlagPrototyped, spFlags: 0)
!1409 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1410, file: !1386, line: 96)
!1410 = !DISubprogram(name: "iswprint", scope: !1389, file: !1389, line: 120, type: !1100, flags: DIFlagPrototyped, spFlags: 0)
!1411 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1412, file: !1386, line: 97)
!1412 = !DISubprogram(name: "iswpunct", scope: !1389, file: !1389, line: 125, type: !1100, flags: DIFlagPrototyped, spFlags: 0)
!1413 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1414, file: !1386, line: 98)
!1414 = !DISubprogram(name: "iswspace", scope: !1389, file: !1389, line: 130, type: !1100, flags: DIFlagPrototyped, spFlags: 0)
!1415 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1416, file: !1386, line: 99)
!1416 = !DISubprogram(name: "iswupper", scope: !1389, file: !1389, line: 135, type: !1100, flags: DIFlagPrototyped, spFlags: 0)
!1417 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1418, file: !1386, line: 100)
!1418 = !DISubprogram(name: "iswxdigit", scope: !1389, file: !1389, line: 140, type: !1100, flags: DIFlagPrototyped, spFlags: 0)
!1419 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1420, file: !1386, line: 101)
!1420 = !DISubprogram(name: "towctrans", scope: !1382, file: !1382, line: 55, type: !1421, flags: DIFlagPrototyped, spFlags: 0)
!1421 = !DISubroutineType(types: !1422)
!1422 = !{!915, !915, !1381}
!1423 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1424, file: !1386, line: 102)
!1424 = !DISubprogram(name: "towlower", scope: !1389, file: !1389, line: 166, type: !1425, flags: DIFlagPrototyped, spFlags: 0)
!1425 = !DISubroutineType(types: !1426)
!1426 = !{!915, !915}
!1427 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1428, file: !1386, line: 103)
!1428 = !DISubprogram(name: "towupper", scope: !1389, file: !1389, line: 169, type: !1425, flags: DIFlagPrototyped, spFlags: 0)
!1429 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1430, file: !1386, line: 104)
!1430 = !DISubprogram(name: "wctrans", scope: !1382, file: !1382, line: 52, type: !1431, flags: DIFlagPrototyped, spFlags: 0)
!1431 = !DISubroutineType(types: !1432)
!1432 = !{!1381, !287}
!1433 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1434, file: !1386, line: 105)
!1434 = !DISubprogram(name: "wctype", scope: !1389, file: !1389, line: 155, type: !1435, flags: DIFlagPrototyped, spFlags: 0)
!1435 = !DISubroutineType(types: !1436)
!1436 = !{!1388, !287}
!1437 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1438, file: !1442, line: 51)
!1438 = !DIDerivedType(tag: DW_TAG_typedef, name: "int8_t", file: !1439, line: 24, baseType: !1440)
!1439 = !DIFile(filename: "/usr/include/bits/stdint-intn.h", directory: "", checksumkind: CSK_MD5, checksum: "85f68316edee664d7bd685b977adf677")
!1440 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int8_t", file: !25, line: 37, baseType: !1441)
!1441 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!1442 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/cstdint", directory: "")
!1443 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1444, file: !1442, line: 52)
!1444 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !1439, line: 25, baseType: !1445)
!1445 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int16_t", file: !25, line: 39, baseType: !1446)
!1446 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!1447 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1448, file: !1442, line: 53)
!1448 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !1439, line: 26, baseType: !1385)
!1449 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1450, file: !1442, line: 54)
!1450 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !1439, line: 27, baseType: !1451)
!1451 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !25, line: 44, baseType: !268)
!1452 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1453, file: !1442, line: 56)
!1453 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast8_t", file: !1454, line: 58, baseType: !1441)
!1454 = !DIFile(filename: "/usr/include/stdint.h", directory: "", checksumkind: CSK_MD5, checksum: "e1a448af0fce22a39bc183d2915834c7")
!1455 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1456, file: !1442, line: 57)
!1456 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast16_t", file: !1454, line: 60, baseType: !268)
!1457 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1458, file: !1442, line: 58)
!1458 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast32_t", file: !1454, line: 61, baseType: !268)
!1459 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1460, file: !1442, line: 59)
!1460 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast64_t", file: !1454, line: 62, baseType: !268)
!1461 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1462, file: !1442, line: 61)
!1462 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least8_t", file: !1454, line: 43, baseType: !1463)
!1463 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least8_t", file: !25, line: 52, baseType: !1440)
!1464 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1465, file: !1442, line: 62)
!1465 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least16_t", file: !1454, line: 44, baseType: !1466)
!1466 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least16_t", file: !25, line: 54, baseType: !1445)
!1467 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1468, file: !1442, line: 63)
!1468 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least32_t", file: !1454, line: 45, baseType: !1469)
!1469 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least32_t", file: !25, line: 56, baseType: !1385)
!1470 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1471, file: !1442, line: 64)
!1471 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least64_t", file: !1454, line: 46, baseType: !1472)
!1472 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least64_t", file: !25, line: 58, baseType: !1451)
!1473 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1474, file: !1442, line: 66)
!1474 = !DIDerivedType(tag: DW_TAG_typedef, name: "intmax_t", file: !1454, line: 101, baseType: !1475)
!1475 = !DIDerivedType(tag: DW_TAG_typedef, name: "__intmax_t", file: !25, line: 72, baseType: !268)
!1476 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1477, file: !1442, line: 67)
!1477 = !DIDerivedType(tag: DW_TAG_typedef, name: "intptr_t", file: !1454, line: 87, baseType: !268)
!1478 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1479, file: !1442, line: 69)
!1479 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !23, line: 24, baseType: !1480)
!1480 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !25, line: 38, baseType: !1481)
!1481 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!1482 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1483, file: !1442, line: 70)
!1483 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !23, line: 25, baseType: !1484)
!1484 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !25, line: 40, baseType: !1485)
!1485 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!1486 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !22, file: !1442, line: 71)
!1487 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1488, file: !1442, line: 72)
!1488 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !23, line: 27, baseType: !1489)
!1489 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint64_t", file: !25, line: 45, baseType: !409)
!1490 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1491, file: !1442, line: 74)
!1491 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast8_t", file: !1454, line: 71, baseType: !1481)
!1492 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1493, file: !1442, line: 75)
!1493 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast16_t", file: !1454, line: 73, baseType: !409)
!1494 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1495, file: !1442, line: 76)
!1495 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast32_t", file: !1454, line: 74, baseType: !409)
!1496 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1497, file: !1442, line: 77)
!1497 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast64_t", file: !1454, line: 75, baseType: !409)
!1498 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1499, file: !1442, line: 79)
!1499 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least8_t", file: !1454, line: 49, baseType: !1500)
!1500 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least8_t", file: !25, line: 53, baseType: !1480)
!1501 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1502, file: !1442, line: 80)
!1502 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least16_t", file: !1454, line: 50, baseType: !1503)
!1503 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least16_t", file: !25, line: 55, baseType: !1484)
!1504 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1505, file: !1442, line: 81)
!1505 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least32_t", file: !1454, line: 51, baseType: !1506)
!1506 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least32_t", file: !25, line: 57, baseType: !24)
!1507 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1508, file: !1442, line: 82)
!1508 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least64_t", file: !1454, line: 52, baseType: !1509)
!1509 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least64_t", file: !25, line: 59, baseType: !1489)
!1510 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1511, file: !1442, line: 84)
!1511 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintmax_t", file: !1454, line: 102, baseType: !1512)
!1512 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uintmax_t", file: !25, line: 73, baseType: !409)
!1513 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1514, file: !1442, line: 85)
!1514 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintptr_t", file: !1454, line: 90, baseType: !409)
!1515 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1516, file: !1519, line: 60)
!1516 = !DIDerivedType(tag: DW_TAG_typedef, name: "clock_t", file: !1517, line: 7, baseType: !1518)
!1517 = !DIFile(filename: "/usr/include/bits/types/clock_t.h", directory: "", checksumkind: CSK_MD5, checksum: "1aade99fd778d1551600c7ca1410b9f1")
!1518 = !DIDerivedType(tag: DW_TAG_typedef, name: "__clock_t", file: !25, line: 156, baseType: !268)
!1519 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/ctime", directory: "")
!1520 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1521, file: !1519, line: 61)
!1521 = !DIDerivedType(tag: DW_TAG_typedef, name: "time_t", file: !1522, line: 10, baseType: !1523)
!1522 = !DIFile(filename: "/usr/include/bits/types/time_t.h", directory: "", checksumkind: CSK_MD5, checksum: "5c299a4954617c88bb03645c7864e1b1")
!1523 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !25, line: 160, baseType: !268)
!1524 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1049, file: !1519, line: 62)
!1525 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1526, file: !1519, line: 64)
!1526 = !DISubprogram(name: "clock", scope: !1527, file: !1527, line: 72, type: !1528, flags: DIFlagPrototyped, spFlags: 0)
!1527 = !DIFile(filename: "/usr/include/time.h", directory: "", checksumkind: CSK_MD5, checksum: "19daa87a550fdc2d68d9b199f5473f94")
!1528 = !DISubroutineType(types: !1529)
!1529 = !{!1516}
!1530 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1531, file: !1519, line: 65)
!1531 = !DISubprogram(name: "difftime", scope: !1527, file: !1527, line: 79, type: !1532, flags: DIFlagPrototyped, spFlags: 0)
!1532 = !DISubroutineType(types: !1533)
!1533 = !{!51, !1521, !1521}
!1534 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1535, file: !1519, line: 66)
!1535 = !DISubprogram(name: "mktime", scope: !1527, file: !1527, line: 83, type: !1536, flags: DIFlagPrototyped, spFlags: 0)
!1536 = !DISubroutineType(types: !1537)
!1537 = !{!1521, !1538}
!1538 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1049, size: 64)
!1539 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1540, file: !1519, line: 67)
!1540 = !DISubprogram(name: "time", scope: !1527, file: !1527, line: 76, type: !1541, flags: DIFlagPrototyped, spFlags: 0)
!1541 = !DISubroutineType(types: !1542)
!1542 = !{!1521, !1543}
!1543 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1521, size: 64)
!1544 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1545, file: !1519, line: 68)
!1545 = !DISubprogram(name: "asctime", scope: !1527, file: !1527, line: 180, type: !1546, flags: DIFlagPrototyped, spFlags: 0)
!1546 = !DISubroutineType(types: !1547)
!1547 = !{!455, !1047}
!1548 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1549, file: !1519, line: 69)
!1549 = !DISubprogram(name: "ctime", scope: !1527, file: !1527, line: 184, type: !1550, flags: DIFlagPrototyped, spFlags: 0)
!1550 = !DISubroutineType(types: !1551)
!1551 = !{!455, !1552}
!1552 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1553, size: 64)
!1553 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1521)
!1554 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1555, file: !1519, line: 70)
!1555 = !DISubprogram(name: "gmtime", scope: !1527, file: !1527, line: 133, type: !1556, flags: DIFlagPrototyped, spFlags: 0)
!1556 = !DISubroutineType(types: !1557)
!1557 = !{!1538, !1552}
!1558 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1559, file: !1519, line: 71)
!1559 = !DISubprogram(name: "localtime", scope: !1527, file: !1527, line: 137, type: !1556, flags: DIFlagPrototyped, spFlags: 0)
!1560 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1561, file: !1519, line: 72)
!1561 = !DISubprogram(name: "strftime", scope: !1527, file: !1527, line: 100, type: !1562, flags: DIFlagPrototyped, spFlags: 0)
!1562 = !DISubroutineType(types: !1563)
!1563 = !{!407, !522, !407, !479, !1046}
!1564 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1565, file: !1519, line: 79)
!1565 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timespec", file: !1566, line: 11, size: 128, flags: DIFlagTypePassByValue, elements: !1567, identifier: "_ZTS8timespec")
!1566 = !DIFile(filename: "/usr/include/bits/types/struct_timespec.h", directory: "", checksumkind: CSK_MD5, checksum: "55dc154df3f21a5aa944dcafba9b43f6")
!1567 = !{!1568, !1569}
!1568 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !1565, file: !1566, line: 16, baseType: !1523, size: 64)
!1569 = !DIDerivedType(tag: DW_TAG_member, name: "tv_nsec", scope: !1565, file: !1566, line: 21, baseType: !1570, size: 64, offset: 64)
!1570 = !DIDerivedType(tag: DW_TAG_typedef, name: "__syscall_slong_t", file: !25, line: 197, baseType: !268)
!1571 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !40, entity: !1572, file: !1519, line: 80)
!1572 = !DISubprogram(name: "timespec_get", scope: !1527, file: !1527, line: 384, type: !1573, flags: DIFlagPrototyped, spFlags: 0)
!1573 = !DISubroutineType(types: !1574)
!1574 = !{!9, !1575, !9}
!1575 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1565, size: 64)
!1576 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !1577, entity: !1578, file: !1580, line: 1436)
!1577 = !DINamespace(name: "chrono", scope: !40)
!1578 = !DINamespace(name: "chrono_literals", scope: !1579, exportSymbols: true)
!1579 = !DINamespace(name: "literals", scope: !40, exportSymbols: true)
!1580 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/bits/chrono.h", directory: "")
!1581 = !{!1582, !1583, !1584, !1585, !1586, !1587, !1588, !1589, !1590, !1591, !1592, !1593, !1594, !1595, !1596, !1597, !1598, !1599, !1600, !1601, !1602, !1603, !1604, !1606, !1611, !1612, !1613, !1614, !1615}
!1582 = !DILocalVariable(name: "gpuWall", arg: 1, scope: !2, file: !3, line: 44, type: !6)
!1583 = !DILocalVariable(name: "gpuSrc", arg: 2, scope: !2, file: !3, line: 45, type: !6)
!1584 = !DILocalVariable(name: "gpuResult", arg: 3, scope: !2, file: !3, line: 46, type: !10)
!1585 = !DILocalVariable(name: "outputBuffer", arg: 4, scope: !2, file: !3, line: 47, type: !10)
!1586 = !DILocalVariable(name: "iteration", arg: 5, scope: !2, file: !3, line: 48, type: !8)
!1587 = !DILocalVariable(name: "theHalo", arg: 6, scope: !2, file: !3, line: 49, type: !8)
!1588 = !DILocalVariable(name: "borderCols", arg: 7, scope: !2, file: !3, line: 50, type: !8)
!1589 = !DILocalVariable(name: "cols", arg: 8, scope: !2, file: !3, line: 51, type: !8)
!1590 = !DILocalVariable(name: "t", arg: 9, scope: !2, file: !3, line: 52, type: !8)
!1591 = !DILocalVariable(name: "BLOCK_SIZE", scope: !2, file: !3, line: 54, type: !9)
!1592 = !DILocalVariable(name: "bx", scope: !2, file: !3, line: 55, type: !9)
!1593 = !DILocalVariable(name: "tx", scope: !2, file: !3, line: 56, type: !9)
!1594 = !DILocalVariable(name: "small_block_cols", scope: !2, file: !3, line: 66, type: !9)
!1595 = !DILocalVariable(name: "blkX", scope: !2, file: !3, line: 70, type: !9)
!1596 = !DILocalVariable(name: "blkXmax", scope: !2, file: !3, line: 71, type: !9)
!1597 = !DILocalVariable(name: "xidx", scope: !2, file: !3, line: 74, type: !9)
!1598 = !DILocalVariable(name: "validXmin", scope: !2, file: !3, line: 79, type: !9)
!1599 = !DILocalVariable(name: "validXmax", scope: !2, file: !3, line: 80, type: !9)
!1600 = !DILocalVariable(name: "W", scope: !2, file: !3, line: 82, type: !9)
!1601 = !DILocalVariable(name: "E", scope: !2, file: !3, line: 83, type: !9)
!1602 = !DILocalVariable(name: "isValid", scope: !2, file: !3, line: 88, type: !682)
!1603 = !DILocalVariable(name: "computed", scope: !2, file: !3, line: 97, type: !682)
!1604 = !DILocalVariable(name: "i", scope: !1605, file: !3, line: 98, type: !9)
!1605 = distinct !DILexicalBlock(scope: !2, file: !3, line: 98, column: 3)
!1606 = !DILocalVariable(name: "left", scope: !1607, file: !3, line: 105, type: !9)
!1607 = distinct !DILexicalBlock(scope: !1608, file: !3, line: 103, column: 5)
!1608 = distinct !DILexicalBlock(scope: !1609, file: !3, line: 102, column: 9)
!1609 = distinct !DILexicalBlock(scope: !1610, file: !3, line: 99, column: 3)
!1610 = distinct !DILexicalBlock(scope: !1605, file: !3, line: 98, column: 3)
!1611 = !DILocalVariable(name: "up", scope: !1607, file: !3, line: 106, type: !9)
!1612 = !DILocalVariable(name: "right", scope: !1607, file: !3, line: 107, type: !9)
!1613 = !DILocalVariable(name: "shortest", scope: !1607, file: !3, line: 108, type: !9)
!1614 = !DILocalVariable(name: "index", scope: !1607, file: !3, line: 111, type: !9)
!1615 = !DILocalVariable(name: "bufIndex", scope: !1616, file: !3, line: 119, type: !9)
!1616 = distinct !DILexicalBlock(scope: !1617, file: !3, line: 117, column: 7)
!1617 = distinct !DILexicalBlock(scope: !1607, file: !3, line: 116, column: 11)
!1618 = !{i32 1, !"amdhsa_code_object_version", i32 600}
!1619 = !{i32 1, !"amdgpu_printf_kind", !"hostcall"}
!1620 = !{i32 7, !"Dwarf Version", i32 5}
!1621 = !{i32 2, !"Debug Info Version", i32 3}
!1622 = !{i32 1, !"wchar_size", i32 4}
!1623 = !{i32 8, !"PIC Level", i32 2}
!1624 = !{i32 7, !"frame-pointer", i32 2}
!1625 = !{!"AMD clang version 19.0.0git (https://github.com/RadeonOpenCompute/llvm-project roc-6.4.2 25224 d366fa84f3fdcbd4b10847ebd5db572ae12a34fb)"}
!1626 = !{i32 2, i32 0}
!1627 = distinct !DISubprogram(name: "__cxa_pure_virtual", scope: !1628, file: !1628, line: 37, type: !400, scopeLine: 37, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagDefinition, unit: !12)
!1628 = !DIFile(filename: "/opt/rocm-6.4.2/lib/llvm/lib/clang/19/include/__clang_hip_runtime_wrapper.h", directory: "", checksumkind: CSK_MD5, checksum: "3b4af0bdaa6ccc1fa2b6e310d2157303")
!1629 = !DILocation(line: 38, column: 5, scope: !1627)
!1630 = !DILocation(line: 39, column: 3, scope: !1627)
!1631 = distinct !DISubprogram(name: "__cxa_deleted_virtual", scope: !1628, file: !1628, line: 43, type: !400, scopeLine: 43, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagDefinition, unit: !12)
!1632 = !DILocation(line: 44, column: 5, scope: !1631)
!1633 = !DILocation(line: 45, column: 3, scope: !1631)
!1634 = distinct !DISubprogram(name: "__assert_fail", scope: !1635, file: !1635, line: 44, type: !1636, scopeLine: 48, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !1638)
!1635 = !DIFile(filename: "/opt/rocm-6.4.2/include/hip/amd_detail/hip_assert.h", directory: "", checksumkind: CSK_MD5, checksum: "a705f3fd54b4159bc676e001f217fb77")
!1636 = !DISubroutineType(types: !1637)
!1637 = !{null, !287, !287, !17, !287}
!1638 = !{!1639, !1640, !1641, !1642, !1643, !1647, !1648, !1649, !1651, !1653, !1655}
!1639 = !DILocalVariable(name: "assertion", arg: 1, scope: !1634, file: !1635, line: 44, type: !287)
!1640 = !DILocalVariable(name: "file", arg: 2, scope: !1634, file: !1635, line: 45, type: !287)
!1641 = !DILocalVariable(name: "line", arg: 3, scope: !1634, file: !1635, line: 46, type: !17)
!1642 = !DILocalVariable(name: "function", arg: 4, scope: !1634, file: !1635, line: 47, type: !287)
!1643 = !DILocalVariable(name: "fmt", scope: !1634, file: !1635, line: 49, type: !1644)
!1644 = !DICompositeType(tag: DW_TAG_array_type, baseType: !288, size: 376, elements: !1645)
!1645 = !{!1646}
!1646 = !DISubrange(count: 47)
!1647 = !DILocalVariable(name: "msg", scope: !1634, file: !1635, line: 68, type: !1488)
!1648 = !DILocalVariable(name: "len", scope: !1634, file: !1635, line: 69, type: !9)
!1649 = !DILocalVariable(name: "tmp", scope: !1650, file: !1635, line: 70, type: !287)
!1650 = distinct !DILexicalBlock(scope: !1634, file: !1635, line: 70, column: 3)
!1651 = !DILocalVariable(name: "tmp", scope: !1652, file: !1635, line: 72, type: !287)
!1652 = distinct !DILexicalBlock(scope: !1634, file: !1635, line: 72, column: 3)
!1653 = !DILocalVariable(name: "tmp", scope: !1654, file: !1635, line: 75, type: !287)
!1654 = distinct !DILexicalBlock(scope: !1634, file: !1635, line: 75, column: 3)
!1655 = !DILocalVariable(name: "tmp", scope: !1656, file: !1635, line: 77, type: !287)
!1656 = distinct !DILexicalBlock(scope: !1634, file: !1635, line: 77, column: 3)
!1657 = !DILocation(line: 44, column: 32, scope: !1634)
!1658 = !DILocation(line: 45, column: 32, scope: !1634)
!1659 = !DILocation(line: 46, column: 33, scope: !1634)
!1660 = !DILocation(line: 47, column: 32, scope: !1634)
!1661 = !DILocation(line: 49, column: 14, scope: !1634)
!1662 = !DILocation(line: 68, column: 8, scope: !1634)
!1663 = !DILocation(line: 68, column: 14, scope: !1634)
!1664 = !DILocation(line: 69, column: 7, scope: !1634)
!1665 = !DILocation(line: 70, column: 3, scope: !1634)
!1666 = !DILocation(line: 70, column: 3, scope: !1650)
!1667 = distinct !{!1667, !1666, !1666, !1668}
!1668 = !{!"llvm.loop.mustprogress"}
!1669 = !DILocation(line: 71, column: 40, scope: !1634)
!1670 = !DILocation(line: 71, column: 45, scope: !1634)
!1671 = !DILocation(line: 71, column: 50, scope: !1634)
!1672 = !DILocation(line: 71, column: 9, scope: !1634)
!1673 = !DILocation(line: 71, column: 7, scope: !1634)
!1674 = !DILocation(line: 72, column: 3, scope: !1634)
!1675 = !DILocation(line: 72, column: 3, scope: !1652)
!1676 = distinct !{!1676, !1675, !1675, !1668}
!1677 = !DILocation(line: 73, column: 40, scope: !1634)
!1678 = !DILocation(line: 73, column: 45, scope: !1634)
!1679 = !DILocation(line: 73, column: 51, scope: !1634)
!1680 = !DILocation(line: 73, column: 9, scope: !1634)
!1681 = !DILocation(line: 73, column: 7, scope: !1634)
!1682 = !DILocation(line: 74, column: 36, scope: !1634)
!1683 = !DILocation(line: 74, column: 44, scope: !1634)
!1684 = !DILocation(line: 74, column: 9, scope: !1634)
!1685 = !DILocation(line: 74, column: 7, scope: !1634)
!1686 = !DILocation(line: 75, column: 3, scope: !1634)
!1687 = !DILocation(line: 75, column: 3, scope: !1654)
!1688 = distinct !{!1688, !1687, !1687, !1668}
!1689 = !DILocation(line: 76, column: 40, scope: !1634)
!1690 = !DILocation(line: 76, column: 45, scope: !1634)
!1691 = !DILocation(line: 76, column: 55, scope: !1634)
!1692 = !DILocation(line: 76, column: 9, scope: !1634)
!1693 = !DILocation(line: 76, column: 7, scope: !1634)
!1694 = !DILocation(line: 77, column: 3, scope: !1634)
!1695 = !DILocation(line: 77, column: 3, scope: !1656)
!1696 = distinct !{!1696, !1695, !1695, !1668}
!1697 = !DILocation(line: 78, column: 34, scope: !1634)
!1698 = !DILocation(line: 78, column: 39, scope: !1634)
!1699 = !DILocation(line: 78, column: 50, scope: !1634)
!1700 = !DILocation(line: 78, column: 3, scope: !1634)
!1701 = !DILocation(line: 82, column: 3, scope: !1634)
!1702 = !DILocation(line: 83, column: 1, scope: !1634)
!1703 = distinct !DISubprogram(name: "__assertfail", scope: !1635, file: !1635, line: 86, type: !400, scopeLine: 87, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12)
!1704 = !DILocation(line: 89, column: 5, scope: !1703)
!1705 = !DILocation(line: 90, column: 1, scope: !1703)
!1706 = !DILocation(line: 44, column: 28, scope: !2)
!1707 = !DILocation(line: 45, column: 28, scope: !2)
!1708 = !DILocation(line: 46, column: 28, scope: !2)
!1709 = !DILocation(line: 47, column: 28, scope: !2)
!1710 = !DILocation(line: 48, column: 15, scope: !2)
!1711 = !DILocation(line: 49, column: 15, scope: !2)
!1712 = !DILocation(line: 50, column: 15, scope: !2)
!1713 = !DILocation(line: 51, column: 15, scope: !2)
!1714 = !DILocation(line: 52, column: 15, scope: !2)
!1715 = !DILocation(line: 54, column: 7, scope: !2)
!1716 = !DILocation(line: 275, column: 58, scope: !1717, inlinedAt: !1721)
!1717 = distinct !DISubprogram(name: "__hip_get_block_dim_x", linkageName: "_ZL21__hip_get_block_dim_xv", scope: !1718, file: !1718, line: 275, type: !1719, scopeLine: 275, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !12)
!1718 = !DIFile(filename: "/opt/rocm-6.4.2/include/hip/amd_detail/amd_hip_runtime.h", directory: "", checksumkind: CSK_MD5, checksum: "38097f6211bac4e19f9ae3395b411f76")
!1719 = !DISubroutineType(types: !1720)
!1720 = !{!17}
!1721 = distinct !DILocation(line: 309, column: 3, scope: !1722, inlinedAt: !1734)
!1722 = distinct !DISubprogram(name: "__get_x", linkageName: "_ZN24__hip_builtin_blockDim_t7__get_xEv", scope: !1723, file: !1718, line: 309, type: !1719, scopeLine: 309, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, declaration: !1725)
!1723 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__hip_builtin_blockDim_t", file: !1718, line: 308, size: 8, flags: DIFlagTypePassByValue, elements: !1724, identifier: "_ZTS24__hip_builtin_blockDim_t")
!1724 = !{!1725, !1726, !1727, !1728}
!1725 = !DISubprogram(name: "__get_x", linkageName: "_ZN24__hip_builtin_blockDim_t7__get_xEv", scope: !1723, file: !1718, line: 309, type: !1719, scopeLine: 309, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!1726 = !DISubprogram(name: "__get_y", linkageName: "_ZN24__hip_builtin_blockDim_t7__get_yEv", scope: !1723, file: !1718, line: 310, type: !1719, scopeLine: 310, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!1727 = !DISubprogram(name: "__get_z", linkageName: "_ZN24__hip_builtin_blockDim_t7__get_zEv", scope: !1723, file: !1718, line: 311, type: !1719, scopeLine: 311, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!1728 = !DISubprogram(name: "operator dim3", linkageName: "_ZNK24__hip_builtin_blockDim_tcv4dim3Ev", scope: !1723, file: !1718, line: 313, type: !1729, scopeLine: 313, flags: DIFlagPrototyped, spFlags: 0)
!1729 = !DISubroutineType(types: !1730)
!1730 = !{!1731, !1732}
!1731 = !DIDerivedType(tag: DW_TAG_typedef, name: "dim3", file: !19, line: 1186, baseType: !18)
!1732 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1733, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1733 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1723)
!1734 = distinct !DILocation(line: 54, column: 20, scope: !2)
!1735 = !DILocation(line: 55, column: 7, scope: !2)
!1736 = !DILocation(line: 270, column: 58, scope: !1737, inlinedAt: !1738)
!1737 = distinct !DISubprogram(name: "__hip_get_block_idx_x", linkageName: "_ZL21__hip_get_block_idx_xv", scope: !1718, file: !1718, line: 270, type: !1719, scopeLine: 270, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !12)
!1738 = distinct !DILocation(line: 300, column: 3, scope: !1739, inlinedAt: !1750)
!1739 = distinct !DISubprogram(name: "__get_x", linkageName: "_ZN24__hip_builtin_blockIdx_t7__get_xEv", scope: !1740, file: !1718, line: 300, type: !1719, scopeLine: 300, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, declaration: !1742)
!1740 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__hip_builtin_blockIdx_t", file: !1718, line: 299, size: 8, flags: DIFlagTypePassByValue, elements: !1741, identifier: "_ZTS24__hip_builtin_blockIdx_t")
!1741 = !{!1742, !1743, !1744, !1745}
!1742 = !DISubprogram(name: "__get_x", linkageName: "_ZN24__hip_builtin_blockIdx_t7__get_xEv", scope: !1740, file: !1718, line: 300, type: !1719, scopeLine: 300, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!1743 = !DISubprogram(name: "__get_y", linkageName: "_ZN24__hip_builtin_blockIdx_t7__get_yEv", scope: !1740, file: !1718, line: 301, type: !1719, scopeLine: 301, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!1744 = !DISubprogram(name: "__get_z", linkageName: "_ZN24__hip_builtin_blockIdx_t7__get_zEv", scope: !1740, file: !1718, line: 302, type: !1719, scopeLine: 302, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!1745 = !DISubprogram(name: "operator dim3", linkageName: "_ZNK24__hip_builtin_blockIdx_tcv4dim3Ev", scope: !1740, file: !1718, line: 304, type: !1746, scopeLine: 304, flags: DIFlagPrototyped, spFlags: 0)
!1746 = !DISubroutineType(types: !1747)
!1747 = !{!1731, !1748}
!1748 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1749, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1749 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1740)
!1750 = distinct !DILocation(line: 55, column: 12, scope: !2)
!1751 = !DILocation(line: 56, column: 7, scope: !2)
!1752 = !DILocation(line: 265, column: 59, scope: !1753, inlinedAt: !1754)
!1753 = distinct !DISubprogram(name: "__hip_get_thread_idx_x", linkageName: "_ZL22__hip_get_thread_idx_xv", scope: !1718, file: !1718, line: 265, type: !1719, scopeLine: 265, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !12)
!1754 = distinct !DILocation(line: 291, column: 3, scope: !1755, inlinedAt: !1766)
!1755 = distinct !DISubprogram(name: "__get_x", linkageName: "_ZN25__hip_builtin_threadIdx_t7__get_xEv", scope: !1756, file: !1718, line: 291, type: !1719, scopeLine: 291, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, declaration: !1758)
!1756 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__hip_builtin_threadIdx_t", file: !1718, line: 290, size: 8, flags: DIFlagTypePassByValue, elements: !1757, identifier: "_ZTS25__hip_builtin_threadIdx_t")
!1757 = !{!1758, !1759, !1760, !1761}
!1758 = !DISubprogram(name: "__get_x", linkageName: "_ZN25__hip_builtin_threadIdx_t7__get_xEv", scope: !1756, file: !1718, line: 291, type: !1719, scopeLine: 291, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!1759 = !DISubprogram(name: "__get_y", linkageName: "_ZN25__hip_builtin_threadIdx_t7__get_yEv", scope: !1756, file: !1718, line: 292, type: !1719, scopeLine: 292, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!1760 = !DISubprogram(name: "__get_z", linkageName: "_ZN25__hip_builtin_threadIdx_t7__get_zEv", scope: !1756, file: !1718, line: 293, type: !1719, scopeLine: 293, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!1761 = !DISubprogram(name: "operator dim3", linkageName: "_ZNK25__hip_builtin_threadIdx_tcv4dim3Ev", scope: !1756, file: !1718, line: 295, type: !1762, scopeLine: 295, flags: DIFlagPrototyped, spFlags: 0)
!1762 = !DISubroutineType(types: !1763)
!1763 = !{!1731, !1764}
!1764 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1765, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1765 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1756)
!1766 = distinct !DILocation(line: 56, column: 12, scope: !2)
!1767 = !DILocation(line: 66, column: 7, scope: !2)
!1768 = !DILocation(line: 66, column: 26, scope: !2)
!1769 = !DILocation(line: 66, column: 40, scope: !2)
!1770 = !DILocation(line: 66, column: 50, scope: !2)
!1771 = !DILocation(line: 66, column: 49, scope: !2)
!1772 = !DILocation(line: 66, column: 57, scope: !2)
!1773 = !DILocation(line: 66, column: 37, scope: !2)
!1774 = !DILocation(line: 70, column: 7, scope: !2)
!1775 = !DILocation(line: 70, column: 15, scope: !2)
!1776 = !DILocation(line: 70, column: 32, scope: !2)
!1777 = !DILocation(line: 70, column: 31, scope: !2)
!1778 = !DILocation(line: 70, column: 38, scope: !2)
!1779 = !DILocation(line: 70, column: 36, scope: !2)
!1780 = !DILocation(line: 71, column: 7, scope: !2)
!1781 = !DILocation(line: 71, column: 17, scope: !2)
!1782 = !DILocation(line: 71, column: 22, scope: !2)
!1783 = !DILocation(line: 71, column: 21, scope: !2)
!1784 = !DILocation(line: 71, column: 32, scope: !2)
!1785 = !DILocation(line: 74, column: 7, scope: !2)
!1786 = !DILocation(line: 74, column: 14, scope: !2)
!1787 = !DILocation(line: 74, column: 19, scope: !2)
!1788 = !DILocation(line: 74, column: 18, scope: !2)
!1789 = !DILocation(line: 79, column: 7, scope: !2)
!1790 = !DILocation(line: 79, column: 20, scope: !2)
!1791 = !DILocation(line: 79, column: 25, scope: !2)
!1792 = !DILocation(line: 79, column: 19, scope: !2)
!1793 = !DILocation(line: 79, column: 33, scope: !2)
!1794 = !DILocation(line: 79, column: 32, scope: !2)
!1795 = !DILocation(line: 80, column: 7, scope: !2)
!1796 = !DILocation(line: 80, column: 20, scope: !2)
!1797 = !DILocation(line: 80, column: 30, scope: !2)
!1798 = !DILocation(line: 80, column: 34, scope: !2)
!1799 = !DILocation(line: 80, column: 28, scope: !2)
!1800 = !DILocation(line: 80, column: 19, scope: !2)
!1801 = !DILocation(line: 80, column: 40, scope: !2)
!1802 = !DILocation(line: 80, column: 50, scope: !2)
!1803 = !DILocation(line: 80, column: 54, scope: !2)
!1804 = !DILocation(line: 80, column: 62, scope: !2)
!1805 = !DILocation(line: 80, column: 61, scope: !2)
!1806 = !DILocation(line: 80, column: 66, scope: !2)
!1807 = !DILocation(line: 80, column: 52, scope: !2)
!1808 = !DILocation(line: 80, column: 72, scope: !2)
!1809 = !DILocation(line: 80, column: 82, scope: !2)
!1810 = !DILocation(line: 82, column: 7, scope: !2)
!1811 = !DILocation(line: 82, column: 11, scope: !2)
!1812 = !DILocation(line: 82, column: 13, scope: !2)
!1813 = !DILocation(line: 83, column: 7, scope: !2)
!1814 = !DILocation(line: 83, column: 11, scope: !2)
!1815 = !DILocation(line: 83, column: 13, scope: !2)
!1816 = !DILocation(line: 85, column: 8, scope: !2)
!1817 = !DILocation(line: 85, column: 12, scope: !2)
!1818 = !DILocation(line: 85, column: 10, scope: !2)
!1819 = !DILocation(line: 85, column: 7, scope: !2)
!1820 = !DILocation(line: 85, column: 25, scope: !2)
!1821 = !DILocation(line: 85, column: 37, scope: !2)
!1822 = !DILocation(line: 85, column: 5, scope: !2)
!1823 = !DILocation(line: 86, column: 8, scope: !2)
!1824 = !DILocation(line: 86, column: 12, scope: !2)
!1825 = !DILocation(line: 86, column: 10, scope: !2)
!1826 = !DILocation(line: 86, column: 7, scope: !2)
!1827 = !DILocation(line: 86, column: 25, scope: !2)
!1828 = !DILocation(line: 86, column: 37, scope: !2)
!1829 = !DILocation(line: 86, column: 5, scope: !2)
!1830 = !DILocation(line: 88, column: 8, scope: !2)
!1831 = !DILocation(line: 88, column: 18, scope: !2)
!1832 = !DILocation(line: 0, scope: !2)
!1833 = !DILocation(line: 90, column: 6, scope: !1834)
!1834 = distinct !DILexicalBlock(scope: !2, file: !3, line: 90, column: 6)
!1835 = !DILocation(line: 90, column: 6, scope: !2)
!1836 = !DILocation(line: 92, column: 16, scope: !1837)
!1837 = distinct !DILexicalBlock(scope: !1834, file: !3, line: 91, column: 3)
!1838 = !DILocation(line: 92, column: 23, scope: !1837)
!1839 = !DILocation(line: 92, column: 10, scope: !1837)
!1840 = !DILocation(line: 92, column: 5, scope: !1837)
!1841 = !DILocation(line: 92, column: 14, scope: !1837)
!1842 = !DILocation(line: 93, column: 3, scope: !1837)
!1843 = !DILocation(line: 95, column: 3, scope: !2)
!1844 = !DILocation(line: 97, column: 8, scope: !2)
!1845 = !DILocation(line: 98, column: 12, scope: !1605)
!1846 = !DILocation(line: 98, column: 8, scope: !1605)
!1847 = !DILocation(line: 98, column: 19, scope: !1610)
!1848 = !DILocation(line: 98, column: 23, scope: !1610)
!1849 = !DILocation(line: 98, column: 21, scope: !1610)
!1850 = !DILocation(line: 98, column: 3, scope: !1605)
!1851 = !DILocation(line: 100, column: 14, scope: !1609)
!1852 = !DILocation(line: 102, column: 9, scope: !1608)
!1853 = !DILocation(line: 102, column: 43, scope: !1608)
!1854 = !DILocation(line: 102, column: 46, scope: !1608)
!1855 = !DILocation(line: 102, column: 9, scope: !1609)
!1856 = !DILocation(line: 104, column: 16, scope: !1607)
!1857 = !DILocation(line: 105, column: 11, scope: !1607)
!1858 = !DILocation(line: 105, column: 23, scope: !1607)
!1859 = !DILocation(line: 105, column: 18, scope: !1607)
!1860 = !DILocation(line: 106, column: 11, scope: !1607)
!1861 = !DILocation(line: 106, column: 21, scope: !1607)
!1862 = !DILocation(line: 106, column: 16, scope: !1607)
!1863 = !DILocation(line: 107, column: 11, scope: !1607)
!1864 = !DILocation(line: 107, column: 24, scope: !1607)
!1865 = !DILocation(line: 107, column: 19, scope: !1607)
!1866 = !DILocation(line: 108, column: 11, scope: !1607)
!1867 = !DILocation(line: 108, column: 22, scope: !1607)
!1868 = !DILocation(line: 109, column: 18, scope: !1607)
!1869 = !DILocation(line: 109, column: 16, scope: !1607)
!1870 = !DILocation(line: 111, column: 11, scope: !1607)
!1871 = !DILocation(line: 111, column: 19, scope: !1607)
!1872 = !DILocation(line: 111, column: 25, scope: !1607)
!1873 = !DILocation(line: 111, column: 27, scope: !1607)
!1874 = !DILocation(line: 111, column: 26, scope: !1607)
!1875 = !DILocation(line: 111, column: 23, scope: !1607)
!1876 = !DILocation(line: 111, column: 30, scope: !1607)
!1877 = !DILocation(line: 111, column: 29, scope: !1607)
!1878 = !DILocation(line: 112, column: 20, scope: !1607)
!1879 = !DILocation(line: 112, column: 31, scope: !1607)
!1880 = !DILocation(line: 112, column: 39, scope: !1607)
!1881 = !DILocation(line: 112, column: 29, scope: !1607)
!1882 = !DILocation(line: 112, column: 14, scope: !1607)
!1883 = !DILocation(line: 112, column: 7, scope: !1607)
!1884 = !DILocation(line: 112, column: 18, scope: !1607)
!1885 = !DILocation(line: 116, column: 11, scope: !1617)
!1886 = !DILocation(line: 116, column: 13, scope: !1617)
!1887 = !DILocation(line: 116, column: 18, scope: !1617)
!1888 = !DILocation(line: 116, column: 21, scope: !1617)
!1889 = !DILocation(line: 116, column: 22, scope: !1617)
!1890 = !DILocation(line: 116, column: 11, scope: !1607)
!1891 = !DILocation(line: 119, column: 13, scope: !1616)
!1892 = !DILocation(line: 119, column: 24, scope: !1616)
!1893 = !DILocation(line: 119, column: 31, scope: !1616)
!1894 = !DILocation(line: 121, column: 9, scope: !1616)
!1895 = !DILocation(line: 121, column: 22, scope: !1616)
!1896 = !DILocation(line: 121, column: 32, scope: !1616)
!1897 = !DILocation(line: 122, column: 7, scope: !1616)
!1898 = !DILocation(line: 124, column: 5, scope: !1607)
!1899 = !DILocation(line: 126, column: 5, scope: !1609)
!1900 = !DILocation(line: 128, column: 8, scope: !1901)
!1901 = distinct !DILexicalBlock(scope: !1609, file: !3, line: 128, column: 8)
!1902 = !DILocation(line: 128, column: 11, scope: !1901)
!1903 = !DILocation(line: 128, column: 20, scope: !1901)
!1904 = !DILocation(line: 128, column: 9, scope: !1901)
!1905 = !DILocation(line: 128, column: 8, scope: !1609)
!1906 = !DILocation(line: 132, column: 7, scope: !1907)
!1907 = distinct !DILexicalBlock(scope: !1901, file: !3, line: 129, column: 5)
!1908 = !DILocation(line: 135, column: 8, scope: !1909)
!1909 = distinct !DILexicalBlock(scope: !1609, file: !3, line: 135, column: 8)
!1910 = !DILocation(line: 135, column: 8, scope: !1609)
!1911 = !DILocation(line: 138, column: 25, scope: !1912)
!1912 = distinct !DILexicalBlock(scope: !1909, file: !3, line: 136, column: 5)
!1913 = !DILocation(line: 138, column: 18, scope: !1912)
!1914 = !DILocation(line: 138, column: 12, scope: !1912)
!1915 = !DILocation(line: 138, column: 7, scope: !1912)
!1916 = !DILocation(line: 138, column: 16, scope: !1912)
!1917 = !DILocation(line: 139, column: 5, scope: !1912)
!1918 = !DILocation(line: 140, column: 5, scope: !1609)
!1919 = !DILocation(line: 141, column: 3, scope: !1609)
!1920 = !DILocation(line: 98, column: 35, scope: !1610)
!1921 = !DILocation(line: 98, column: 3, scope: !1610)
!1922 = distinct !{!1922, !1850, !1923, !1668}
!1923 = !DILocation(line: 141, column: 3, scope: !1605)
!1924 = !DILocation(line: 146, column: 7, scope: !1925)
!1925 = distinct !DILexicalBlock(scope: !2, file: !3, line: 146, column: 7)
!1926 = !DILocation(line: 146, column: 7, scope: !2)
!1927 = !DILocation(line: 148, column: 30, scope: !1928)
!1928 = distinct !DILexicalBlock(scope: !1925, file: !3, line: 147, column: 3)
!1929 = !DILocation(line: 148, column: 23, scope: !1928)
!1930 = !DILocation(line: 148, column: 5, scope: !1928)
!1931 = !DILocation(line: 148, column: 15, scope: !1928)
!1932 = !DILocation(line: 148, column: 21, scope: !1928)
!1933 = !DILocation(line: 149, column: 3, scope: !1928)
!1934 = !DILocation(line: 150, column: 1, scope: !2)
!1935 = distinct !DISubprogram(name: "__syncthreads", linkageName: "_Z13__syncthreadsv", scope: !1936, file: !1936, line: 784, type: !400, scopeLine: 785, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12)
!1936 = !DIFile(filename: "/opt/rocm-6.4.2/include/hip/amd_detail/amd_device_functions.h", directory: "", checksumkind: CSK_MD5, checksum: "cf998eaa8f93a277ea6621aa21e4286e")
!1937 = !DILocation(line: 786, column: 3, scope: !1935)
!1938 = !DILocation(line: 787, column: 1, scope: !1935)
!1939 = distinct !DISubprogram(name: "__barrier", linkageName: "_ZL9__barrieri", scope: !1936, file: !1936, line: 776, type: !445, scopeLine: 777, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !12, retainedNodes: !1940)
!1940 = !{!1941}
!1941 = !DILocalVariable(name: "n", arg: 1, scope: !1939, file: !1936, line: 776, type: !9)
!1942 = !DILocation(line: 776, column: 27, scope: !1939)
!1943 = !DILocation(line: 778, column: 46, scope: !1939)
!1944 = !DILocation(line: 778, column: 3, scope: !1939)
!1945 = !DILocation(line: 779, column: 1, scope: !1939)
!1946 = distinct !DISubprogram(name: "__work_group_barrier", linkageName: "_ZL20__work_group_barrierj", scope: !1936, file: !1936, line: 764, type: !1947, scopeLine: 764, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !12, retainedNodes: !1949)
!1947 = !DISubroutineType(types: !1948)
!1948 = !{null, !15}
!1949 = !{!1950}
!1950 = !DILocalVariable(name: "flags", arg: 1, scope: !1946, file: !1936, line: 764, type: !15)
!1951 = !DILocation(line: 764, column: 73, scope: !1946)
!1952 = !DILocation(line: 765, column: 9, scope: !1953)
!1953 = distinct !DILexicalBlock(scope: !1946, file: !1936, line: 765, column: 9)
!1954 = !DILocation(line: 765, column: 9, scope: !1946)
!1955 = !DILocation(line: 766, column: 9, scope: !1956)
!1956 = distinct !DILexicalBlock(scope: !1953, file: !1936, line: 765, column: 16)
!1957 = !DILocation(line: 767, column: 9, scope: !1956)
!1958 = !DILocation(line: 768, column: 9, scope: !1956)
!1959 = !DILocation(line: 769, column: 5, scope: !1956)
!1960 = !DILocation(line: 770, column: 9, scope: !1961)
!1961 = distinct !DILexicalBlock(scope: !1953, file: !1936, line: 769, column: 12)
!1962 = !DILocation(line: 772, column: 1, scope: !1946)
!1963 = !{!1964, !1964, i64 0}
!1964 = !{!"int", !1965, i64 0}
!1965 = !{!"omnipotent char", !1966, i64 0}
!1966 = !{!"Simple C/C++ TBAA"}
!1967 = !{!1968, !1968, i64 0}
!1968 = !{!"long", !1965, i64 0}
!1969 = !{!1970, !1971, i64 0}
!1970 = !{!"", !1971, i64 0, !1971, i64 8, !1972, i64 16, !1968, i64 24, !1968, i64 32, !1968, i64 40}
!1971 = !{!"any pointer", !1965, i64 0}
!1972 = !{!"hsa_signal_s", !1968, i64 0}
!1973 = !{!1970, !1968, i64 40}
!1974 = !{!1970, !1971, i64 8}
!1975 = !{!1976, !1964, i64 16}
!1976 = !{!"", !1968, i64 0, !1968, i64 8, !1964, i64 16, !1964, i64 20}
!1977 = !{!1976, !1968, i64 8}
!1978 = !{!1976, !1964, i64 20}
!1979 = !{!1976, !1968, i64 0}
!1980 = !{!1981, !1968, i64 16}
!1981 = !{!"amd_signal_s", !1968, i64 0, !1965, i64 8, !1968, i64 16, !1964, i64 24, !1964, i64 28, !1968, i64 32, !1968, i64 40, !1965, i64 48, !1965, i64 56}
!1982 = !{!1981, !1964, i64 24}
!1983 = !{!1965, !1965, i64 0}
!1984 = !{i16 1, i16 1025}
!1985 = !{}
!1986 = !{!1987, !1964, i64 12}
!1987 = !{!"hsa_kernel_dispatch_packet_s", !1988, i64 0, !1988, i64 2, !1988, i64 4, !1988, i64 6, !1988, i64 8, !1988, i64 10, !1964, i64 12, !1964, i64 16, !1964, i64 20, !1964, i64 24, !1964, i64 28, !1965, i64 32, !1971, i64 40, !1968, i64 48, !1972, i64 56}
!1988 = !{!"short", !1965, i64 0}
!1989 = !{!1988, !1988, i64 0}
!1990 = !{!1987, !1964, i64 16}
!1991 = !{!1987, !1964, i64 20}
