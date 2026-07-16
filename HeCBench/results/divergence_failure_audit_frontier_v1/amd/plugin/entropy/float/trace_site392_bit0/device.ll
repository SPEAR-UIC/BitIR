; ModuleID = '/ccs/home/mdunlavy/GPU_Fault_Injection/HeCBench/src/entropy-hip/main.cu'
source_filename = "/ccs/home/mdunlavy/GPU_Fault_Injection/HeCBench/src/entropy-hip/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8:9"
target triple = "amdgcn-amd-amdhsa"

%0 = type { i64, i64, i32, i32 }
%1 = type { [64 x [8 x i64]] }
%struct.__hip_builtin_threadIdx_t = type { i8 }
%struct.__hip_builtin_blockIdx_t = type { i8 }
%struct.__hip_builtin_blockDim_t = type { i8 }

$_Z11entropy_optILi16ELi16EEvPfPKcPKfii = comdat any

$_ZZ11entropy_optILi16ELi16EEvPfPKcPKfiiE8sd_count = comdat any

@__const.__assert_fail.fmt = private unnamed_addr addrspace(4) constant [47 x i8] c"%s:%u: %s: Device-side assertion `%s' failed.\0A\00", align 16
@threadIdx = extern_weak dso_local protected addrspace(1) global %struct.__hip_builtin_threadIdx_t, align 1
@blockIdx = extern_weak dso_local protected addrspace(1) global %struct.__hip_builtin_blockIdx_t, align 1
@blockDim = extern_weak dso_local protected addrspace(1) global %struct.__hip_builtin_blockDim_t, align 1
@_ZZ11entropy_optILi16ELi16EEvPfPKcPKfiiE8sd_count = linkonce_odr hidden addrspace(3) global [16 x [256 x i32]] undef, comdat, align 16, !dbg !0
@__hip_cuid_faabd5077b73b4d3 = addrspace(1) global i8 0
@llvm.compiler.used = appending addrspace(1) global [1 x ptr] [ptr addrspacecast (ptr addrspace(1) @__hip_cuid_faabd5077b73b4d3 to ptr)], section "llvm.metadata"
@__oclc_ISA_version = internal local_unnamed_addr addrspace(4) constant i32 9010, align 4
@__oclc_ABI_version = weak_odr hidden local_unnamed_addr addrspace(4) constant i32 600

; Function Attrs: convergent mustprogress noinline noreturn nounwind optnone
define weak void @__cxa_pure_virtual() #0 !dbg !1622 {
  call void @llvm.trap(), !dbg !1624
  unreachable, !dbg !1625
}

; Function Attrs: cold noreturn nounwind memory(inaccessiblemem: write)
declare void @llvm.trap() #1

; Function Attrs: convergent mustprogress noinline noreturn nounwind optnone
define weak void @__cxa_deleted_virtual() #0 !dbg !1626 {
  call void @llvm.trap(), !dbg !1627
  unreachable, !dbg !1628
}

; Function Attrs: convergent mustprogress noinline nounwind optnone
define weak hidden void @__assert_fail(ptr noundef %0, ptr noundef %1, i32 noundef %2, ptr noundef %3) #2 !dbg !1629 {
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
    #dbg_declare(ptr addrspace(5) %5, !1634, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(ptr)), !1652)
  store ptr %1, ptr %17, align 8
    #dbg_declare(ptr addrspace(5) %6, !1635, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(ptr)), !1653)
  store i32 %2, ptr %18, align 4
    #dbg_declare(ptr addrspace(5) %7, !1636, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1654)
  store ptr %3, ptr %19, align 8
    #dbg_declare(ptr addrspace(5) %8, !1637, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(ptr)), !1655)
    #dbg_declare(ptr addrspace(5) %9, !1638, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref([47 x i8])), !1656)
  call void @llvm.memcpy.p0.p4.i64(ptr align 16 %20, ptr addrspace(4) align 16 @__const.__assert_fail.fmt, i64 47, i1 false), !dbg !1656
    #dbg_declare(ptr addrspace(5) %10, !1642, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i64)), !1657)
  %27 = call i64 @__ockl_fprintf_stderr_begin() #12, !dbg !1658
  store i64 %27, ptr %21, align 8, !dbg !1657
    #dbg_declare(ptr addrspace(5) %11, !1643, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1659)
  store i32 0, ptr %22, align 4, !dbg !1659
  br label %28, !dbg !1660

28:                                               ; preds = %4
    #dbg_declare(ptr addrspace(5) %12, !1644, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(ptr)), !1661)
  %29 = getelementptr inbounds [47 x i8], ptr %20, i64 0, i64 0, !dbg !1661
  store ptr %29, ptr %23, align 8, !dbg !1661
  br label %30, !dbg !1661

30:                                               ; preds = %35, %28
  %31 = load ptr, ptr %23, align 8, !dbg !1661
  %32 = getelementptr inbounds i8, ptr %31, i32 1, !dbg !1661
  store ptr %32, ptr %23, align 8, !dbg !1661
  %33 = load i8, ptr %31, align 1, !dbg !1661
  %34 = icmp ne i8 %33, 0, !dbg !1661
  br i1 %34, label %35, label %36, !dbg !1661

35:                                               ; preds = %30
  br label %30, !dbg !1661, !llvm.loop !1662

36:                                               ; preds = %30
  %37 = load ptr, ptr %23, align 8, !dbg !1661
  %38 = getelementptr inbounds [47 x i8], ptr %20, i64 0, i64 0, !dbg !1661
  %39 = ptrtoint ptr %37 to i64, !dbg !1661
  %40 = ptrtoint ptr %38 to i64, !dbg !1661
  %41 = sub i64 %39, %40, !dbg !1661
  %42 = trunc i64 %41 to i32, !dbg !1661
  store i32 %42, ptr %22, align 4, !dbg !1661
  br label %43, !dbg !1661

43:                                               ; preds = %36
  %44 = load i64, ptr %21, align 8, !dbg !1664
  %45 = getelementptr inbounds [47 x i8], ptr %20, i64 0, i64 0, !dbg !1665
  %46 = load i32, ptr %22, align 4, !dbg !1666
  %47 = sext i32 %46 to i64, !dbg !1666
  %48 = call i64 @__ockl_fprintf_append_string_n(i64 noundef %44, ptr noundef %45, i64 noundef %47, i32 noundef 0) #12, !dbg !1667
  store i64 %48, ptr %21, align 8, !dbg !1668
  br label %49, !dbg !1669

49:                                               ; preds = %43
    #dbg_declare(ptr addrspace(5) %13, !1646, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(ptr)), !1670)
  %50 = load ptr, ptr %17, align 8, !dbg !1670
  store ptr %50, ptr %24, align 8, !dbg !1670
  br label %51, !dbg !1670

51:                                               ; preds = %56, %49
  %52 = load ptr, ptr %24, align 8, !dbg !1670
  %53 = getelementptr inbounds i8, ptr %52, i32 1, !dbg !1670
  store ptr %53, ptr %24, align 8, !dbg !1670
  %54 = load i8, ptr %52, align 1, !dbg !1670
  %55 = icmp ne i8 %54, 0, !dbg !1670
  br i1 %55, label %56, label %57, !dbg !1670

56:                                               ; preds = %51
  br label %51, !dbg !1670, !llvm.loop !1671

57:                                               ; preds = %51
  %58 = load ptr, ptr %24, align 8, !dbg !1670
  %59 = load ptr, ptr %17, align 8, !dbg !1670
  %60 = ptrtoint ptr %58 to i64, !dbg !1670
  %61 = ptrtoint ptr %59 to i64, !dbg !1670
  %62 = sub i64 %60, %61, !dbg !1670
  %63 = trunc i64 %62 to i32, !dbg !1670
  store i32 %63, ptr %22, align 4, !dbg !1670
  br label %64, !dbg !1670

64:                                               ; preds = %57
  %65 = load i64, ptr %21, align 8, !dbg !1672
  %66 = load ptr, ptr %17, align 8, !dbg !1673
  %67 = load i32, ptr %22, align 4, !dbg !1674
  %68 = sext i32 %67 to i64, !dbg !1674
  %69 = call i64 @__ockl_fprintf_append_string_n(i64 noundef %65, ptr noundef %66, i64 noundef %68, i32 noundef 0) #12, !dbg !1675
  store i64 %69, ptr %21, align 8, !dbg !1676
  %70 = load i64, ptr %21, align 8, !dbg !1677
  %71 = load i32, ptr %18, align 4, !dbg !1678
  %72 = zext i32 %71 to i64, !dbg !1678
  %73 = call i64 @__ockl_fprintf_append_args(i64 noundef %70, i32 noundef 1, i64 noundef %72, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i32 noundef 0) #12, !dbg !1679
  store i64 %73, ptr %21, align 8, !dbg !1680
  br label %74, !dbg !1681

74:                                               ; preds = %64
    #dbg_declare(ptr addrspace(5) %14, !1648, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(ptr)), !1682)
  %75 = load ptr, ptr %19, align 8, !dbg !1682
  store ptr %75, ptr %25, align 8, !dbg !1682
  br label %76, !dbg !1682

76:                                               ; preds = %81, %74
  %77 = load ptr, ptr %25, align 8, !dbg !1682
  %78 = getelementptr inbounds i8, ptr %77, i32 1, !dbg !1682
  store ptr %78, ptr %25, align 8, !dbg !1682
  %79 = load i8, ptr %77, align 1, !dbg !1682
  %80 = icmp ne i8 %79, 0, !dbg !1682
  br i1 %80, label %81, label %82, !dbg !1682

81:                                               ; preds = %76
  br label %76, !dbg !1682, !llvm.loop !1683

82:                                               ; preds = %76
  %83 = load ptr, ptr %25, align 8, !dbg !1682
  %84 = load ptr, ptr %19, align 8, !dbg !1682
  %85 = ptrtoint ptr %83 to i64, !dbg !1682
  %86 = ptrtoint ptr %84 to i64, !dbg !1682
  %87 = sub i64 %85, %86, !dbg !1682
  %88 = trunc i64 %87 to i32, !dbg !1682
  store i32 %88, ptr %22, align 4, !dbg !1682
  br label %89, !dbg !1682

89:                                               ; preds = %82
  %90 = load i64, ptr %21, align 8, !dbg !1684
  %91 = load ptr, ptr %19, align 8, !dbg !1685
  %92 = load i32, ptr %22, align 4, !dbg !1686
  %93 = sext i32 %92 to i64, !dbg !1686
  %94 = call i64 @__ockl_fprintf_append_string_n(i64 noundef %90, ptr noundef %91, i64 noundef %93, i32 noundef 0) #12, !dbg !1687
  store i64 %94, ptr %21, align 8, !dbg !1688
  br label %95, !dbg !1689

95:                                               ; preds = %89
    #dbg_declare(ptr addrspace(5) %15, !1650, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(ptr)), !1690)
  %96 = load ptr, ptr %16, align 8, !dbg !1690
  store ptr %96, ptr %26, align 8, !dbg !1690
  br label %97, !dbg !1690

97:                                               ; preds = %102, %95
  %98 = load ptr, ptr %26, align 8, !dbg !1690
  %99 = getelementptr inbounds i8, ptr %98, i32 1, !dbg !1690
  store ptr %99, ptr %26, align 8, !dbg !1690
  %100 = load i8, ptr %98, align 1, !dbg !1690
  %101 = icmp ne i8 %100, 0, !dbg !1690
  br i1 %101, label %102, label %103, !dbg !1690

102:                                              ; preds = %97
  br label %97, !dbg !1690, !llvm.loop !1691

103:                                              ; preds = %97
  %104 = load ptr, ptr %26, align 8, !dbg !1690
  %105 = load ptr, ptr %16, align 8, !dbg !1690
  %106 = ptrtoint ptr %104 to i64, !dbg !1690
  %107 = ptrtoint ptr %105 to i64, !dbg !1690
  %108 = sub i64 %106, %107, !dbg !1690
  %109 = trunc i64 %108 to i32, !dbg !1690
  store i32 %109, ptr %22, align 4, !dbg !1690
  br label %110, !dbg !1690

110:                                              ; preds = %103
  %111 = load i64, ptr %21, align 8, !dbg !1692
  %112 = load ptr, ptr %16, align 8, !dbg !1693
  %113 = load i32, ptr %22, align 4, !dbg !1694
  %114 = sext i32 %113 to i64, !dbg !1694
  %115 = call i64 @__ockl_fprintf_append_string_n(i64 noundef %111, ptr noundef %112, i64 noundef %114, i32 noundef 1) #12, !dbg !1695
  call void @llvm.trap(), !dbg !1696
  ret void, !dbg !1697
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p4.i64(ptr noalias nocapture writeonly, ptr addrspace(4) noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: convergent mustprogress noinline nounwind optnone
define weak hidden void @__assertfail() #2 !dbg !1698 {
  call void @llvm.trap(), !dbg !1699
  ret void, !dbg !1700
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define protected amdgpu_kernel void @_Z7entropyPfPKcii(ptr addrspace(1) noalias noundef %0, ptr addrspace(1) noalias noundef %1, i32 noundef %2, i32 noundef %3) #4 !dbg !1701 {
  %5 = alloca i32, align 4, addrspace(5)
  %6 = alloca i32, align 4, addrspace(5)
  %7 = alloca i32, align 4, addrspace(5)
  %8 = alloca i32, align 4, addrspace(5)
  %9 = alloca i32, align 4, addrspace(5)
  %10 = alloca i32, align 4, addrspace(5)
  %11 = alloca float, align 4, addrspace(5)
  %12 = alloca float, align 4, addrspace(5)
  %13 = alloca float, align 4, addrspace(5)
  %14 = alloca float, align 4, addrspace(5)
  %15 = alloca float, align 4, addrspace(5)
  %16 = alloca i32, align 4, addrspace(5)
  %17 = alloca i32, align 4, addrspace(5)
  %18 = alloca i32, align 4, addrspace(5)
  %19 = alloca i32, align 4, addrspace(5)
  %20 = alloca i32, align 4, addrspace(5)
  %21 = alloca i32, align 4, addrspace(5)
  %22 = alloca ptr, align 8, addrspace(5)
  %23 = alloca ptr, align 8, addrspace(5)
  %24 = alloca ptr, align 8, addrspace(5)
  %25 = alloca ptr, align 8, addrspace(5)
  %26 = alloca i32, align 4, addrspace(5)
  %27 = alloca i32, align 4, addrspace(5)
  %28 = alloca i32, align 4, addrspace(5)
  %29 = alloca i32, align 4, addrspace(5)
  %30 = alloca [16 x i8], align 16, addrspace(5)
  %31 = alloca i32, align 4, addrspace(5)
  %32 = alloca i8, align 1, addrspace(5)
  %33 = alloca i32, align 4, addrspace(5)
  %34 = alloca i32, align 4, addrspace(5)
  %35 = alloca i32, align 4, addrspace(5)
  %36 = alloca i32, align 4, addrspace(5)
  %37 = alloca float, align 4, addrspace(5)
  %38 = alloca i32, align 4, addrspace(5)
  %39 = alloca float, align 4, addrspace(5)
  %40 = addrspacecast ptr addrspace(5) %22 to ptr
  %41 = addrspacecast ptr addrspace(5) %23 to ptr
  %42 = addrspacecast ptr addrspace(5) %24 to ptr
  %43 = addrspacecast ptr addrspace(5) %25 to ptr
  %44 = addrspacecast ptr addrspace(5) %26 to ptr
  %45 = addrspacecast ptr addrspace(5) %27 to ptr
  %46 = addrspacecast ptr addrspace(5) %28 to ptr
  %47 = addrspacecast ptr addrspace(5) %29 to ptr
  %48 = addrspacecast ptr addrspace(5) %30 to ptr
  %49 = addrspacecast ptr addrspace(5) %31 to ptr
  %50 = addrspacecast ptr addrspace(5) %32 to ptr
  %51 = addrspacecast ptr addrspace(5) %33 to ptr
  %52 = addrspacecast ptr addrspace(5) %34 to ptr
  %53 = addrspacecast ptr addrspace(5) %35 to ptr
  %54 = addrspacecast ptr addrspace(5) %36 to ptr
  %55 = addrspacecast ptr addrspace(5) %37 to ptr
  %56 = addrspacecast ptr addrspace(5) %38 to ptr
  %57 = addrspacecast ptr addrspace(5) %39 to ptr
  %58 = addrspacecast ptr addrspace(1) %0 to ptr
  store ptr %58, ptr %40, align 8
  %59 = load ptr, ptr %40, align 8
  %60 = addrspacecast ptr addrspace(1) %1 to ptr
  store ptr %60, ptr %41, align 8
  %61 = load ptr, ptr %41, align 8
  store ptr %59, ptr %42, align 8
    #dbg_declare(ptr addrspace(5) %24, !1705, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(ptr)), !1735)
  store ptr %61, ptr %43, align 8
    #dbg_declare(ptr addrspace(5) %25, !1706, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(ptr)), !1736)
  store i32 %2, ptr %44, align 4
    #dbg_declare(ptr addrspace(5) %26, !1707, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1737)
  store i32 %3, ptr %45, align 4
    #dbg_declare(ptr addrspace(5) %27, !1708, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1738)
    #dbg_declare(ptr addrspace(5) %28, !1709, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1739)
  %62 = addrspacecast ptr addrspace(5) %21 to ptr
  %63 = addrspacecast ptr addrspace(5) %10 to ptr
  %64 = call i64 @__ockl_get_local_id(i32 noundef 0) #13, !dbg !1740
  %65 = trunc i64 %64 to i32, !dbg !1740
  %66 = addrspacecast ptr addrspace(5) %20 to ptr
  %67 = addrspacecast ptr addrspace(5) %9 to ptr
  %68 = call i64 @__ockl_get_group_id(i32 noundef 0) #13, !dbg !1759
  %69 = trunc i64 %68 to i32, !dbg !1759
  %70 = addrspacecast ptr addrspace(5) %19 to ptr
  %71 = addrspacecast ptr addrspace(5) %8 to ptr
  %72 = call i64 @__ockl_get_local_size(i32 noundef 0) #13, !dbg !1774
  %73 = trunc i64 %72 to i32, !dbg !1774
  %74 = mul i32 %69, %73, !dbg !1789
  %75 = add i32 %65, %74, !dbg !1790
  store i32 %75, ptr %46, align 4, !dbg !1739
    #dbg_declare(ptr addrspace(5) %29, !1710, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1791)
  %76 = addrspacecast ptr addrspace(5) %18 to ptr
  %77 = addrspacecast ptr addrspace(5) %7 to ptr
  %78 = call i64 @__ockl_get_local_id(i32 noundef 1) #13, !dbg !1792
  %79 = trunc i64 %78 to i32, !dbg !1792
  %80 = addrspacecast ptr addrspace(5) %17 to ptr
  %81 = addrspacecast ptr addrspace(5) %6 to ptr
  %82 = call i64 @__ockl_get_group_id(i32 noundef 1) #13, !dbg !1797
  %83 = trunc i64 %82 to i32, !dbg !1797
  %84 = addrspacecast ptr addrspace(5) %16 to ptr
  %85 = addrspacecast ptr addrspace(5) %5 to ptr
  %86 = call i64 @__ockl_get_local_size(i32 noundef 1) #13, !dbg !1802
  %87 = trunc i64 %86 to i32, !dbg !1802
  %88 = mul i32 %83, %87, !dbg !1807
  %89 = add i32 %79, %88, !dbg !1808
  store i32 %89, ptr %47, align 4, !dbg !1791
    #dbg_declare(ptr addrspace(5) %30, !1711, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref([16 x i8])), !1809)
    #dbg_declare(ptr addrspace(5) %31, !1714, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1810)
  store i32 0, ptr %49, align 4, !dbg !1810
  br label %90, !dbg !1811

90:                                               ; preds = %97, %4
  %91 = load i32, ptr %49, align 4, !dbg !1812
  %92 = icmp slt i32 %91, 16, !dbg !1814
  br i1 %92, label %93, label %100, !dbg !1815

93:                                               ; preds = %90
  %94 = load i32, ptr %49, align 4, !dbg !1816
  %95 = sext i32 %94 to i64, !dbg !1817
  %96 = getelementptr inbounds [16 x i8], ptr %48, i64 0, i64 %95, !dbg !1817
  store i8 0, ptr %96, align 1, !dbg !1818
  br label %97, !dbg !1817

97:                                               ; preds = %93
  %98 = load i32, ptr %49, align 4, !dbg !1819
  %99 = add nsw i32 %98, 1, !dbg !1819
  store i32 %99, ptr %49, align 4, !dbg !1819
  br label %90, !dbg !1820, !llvm.loop !1821

100:                                              ; preds = %90
    #dbg_declare(ptr addrspace(5) %32, !1716, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i8)), !1823)
  store i8 0, ptr %50, align 1, !dbg !1823
    #dbg_declare(ptr addrspace(5) %33, !1717, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1824)
  store i32 -2, ptr %51, align 4, !dbg !1824
  br label %101, !dbg !1825

101:                                              ; preds = %149, %100
  %102 = load i32, ptr %51, align 4, !dbg !1826
  %103 = icmp sle i32 %102, 2, !dbg !1827
  br i1 %103, label %104, label %152, !dbg !1828

104:                                              ; preds = %101
    #dbg_declare(ptr addrspace(5) %34, !1719, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1829)
  store i32 -2, ptr %52, align 4, !dbg !1829
  br label %105, !dbg !1830

105:                                              ; preds = %145, %104
  %106 = load i32, ptr %52, align 4, !dbg !1831
  %107 = icmp sle i32 %106, 2, !dbg !1832
  br i1 %107, label %108, label %148, !dbg !1833

108:                                              ; preds = %105
    #dbg_declare(ptr addrspace(5) %35, !1723, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1834)
  %109 = load i32, ptr %46, align 4, !dbg !1835
  %110 = load i32, ptr %52, align 4, !dbg !1836
  %111 = add nsw i32 %109, %110, !dbg !1837
  store i32 %111, ptr %53, align 4, !dbg !1834
    #dbg_declare(ptr addrspace(5) %36, !1726, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1838)
  %112 = load i32, ptr %47, align 4, !dbg !1839
  %113 = load i32, ptr %51, align 4, !dbg !1840
  %114 = add nsw i32 %112, %113, !dbg !1841
  store i32 %114, ptr %54, align 4, !dbg !1838
  %115 = load i32, ptr %53, align 4, !dbg !1842
  %116 = icmp sge i32 %115, 0, !dbg !1844
  br i1 %116, label %117, label %144, !dbg !1845

117:                                              ; preds = %108
  %118 = load i32, ptr %54, align 4, !dbg !1846
  %119 = icmp sge i32 %118, 0, !dbg !1847
  br i1 %119, label %120, label %144, !dbg !1848

120:                                              ; preds = %117
  %121 = load i32, ptr %54, align 4, !dbg !1849
  %122 = load i32, ptr %44, align 4, !dbg !1850
  %123 = icmp slt i32 %121, %122, !dbg !1851
  br i1 %123, label %124, label %144, !dbg !1852

124:                                              ; preds = %120
  %125 = load i32, ptr %53, align 4, !dbg !1853
  %126 = load i32, ptr %45, align 4, !dbg !1854
  %127 = icmp slt i32 %125, %126, !dbg !1855
  br i1 %127, label %128, label %144, !dbg !1856

128:                                              ; preds = %124
  %129 = load ptr, ptr %43, align 8, !dbg !1857
  %130 = load i32, ptr %54, align 4, !dbg !1859
  %131 = load i32, ptr %45, align 4, !dbg !1860
  %132 = mul nsw i32 %130, %131, !dbg !1861
  %133 = load i32, ptr %53, align 4, !dbg !1862
  %134 = add nsw i32 %132, %133, !dbg !1863
  %135 = sext i32 %134 to i64, !dbg !1857
  %136 = getelementptr inbounds i8, ptr %129, i64 %135, !dbg !1857
  %137 = load i8, ptr %136, align 1, !dbg !1857
  %138 = sext i8 %137 to i64, !dbg !1864
  %139 = getelementptr inbounds [16 x i8], ptr %48, i64 0, i64 %138, !dbg !1864
  %140 = load i8, ptr %139, align 1, !dbg !1865
  %141 = add i8 %140, 1, !dbg !1865
  store i8 %141, ptr %139, align 1, !dbg !1865
  %142 = load i8, ptr %50, align 1, !dbg !1866
  %143 = add i8 %142, 1, !dbg !1866
  store i8 %143, ptr %50, align 1, !dbg !1866
  br label %144, !dbg !1867

144:                                              ; preds = %128, %124, %120, %117, %108
  br label %145, !dbg !1868

145:                                              ; preds = %144
  %146 = load i32, ptr %52, align 4, !dbg !1869
  %147 = add nsw i32 %146, 1, !dbg !1869
  store i32 %147, ptr %52, align 4, !dbg !1869
  br label %105, !dbg !1870, !llvm.loop !1871

148:                                              ; preds = %105
  br label %149, !dbg !1873

149:                                              ; preds = %148
  %150 = load i32, ptr %51, align 4, !dbg !1874
  %151 = add nsw i32 %150, 1, !dbg !1874
  store i32 %151, ptr %51, align 4, !dbg !1874
  br label %101, !dbg !1875, !llvm.loop !1876

152:                                              ; preds = %101
    #dbg_declare(ptr addrspace(5) %37, !1727, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(float)), !1878)
  store float 0.000000e+00, ptr %55, align 4, !dbg !1878
  %153 = load i8, ptr %50, align 1, !dbg !1879
  %154 = sext i8 %153 to i32, !dbg !1879
  %155 = icmp slt i32 %154, 1, !dbg !1880
  br i1 %155, label %156, label %157, !dbg !1881

156:                                              ; preds = %152
  store i8 1, ptr %50, align 1, !dbg !1882
  br label %188, !dbg !1884

157:                                              ; preds = %152
    #dbg_declare(ptr addrspace(5) %38, !1728, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1885)
  store i32 0, ptr %56, align 4, !dbg !1885
  br label %158, !dbg !1886

158:                                              ; preds = %184, %157
  %159 = load i32, ptr %56, align 4, !dbg !1887
  %160 = icmp slt i32 %159, 16, !dbg !1888
  br i1 %160, label %161, label %187, !dbg !1889

161:                                              ; preds = %158
    #dbg_declare(ptr addrspace(5) %39, !1732, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(float)), !1890)
  %162 = load i32, ptr %56, align 4, !dbg !1891
  %163 = sext i32 %162 to i64, !dbg !1892
  %164 = getelementptr inbounds [16 x i8], ptr %48, i64 0, i64 %163, !dbg !1892
  %165 = load i8, ptr %164, align 1, !dbg !1892
  %166 = sitofp i8 %165 to float, !dbg !1892
  %167 = load i8, ptr %50, align 1, !dbg !1893
  %168 = sitofp i8 %167 to float, !dbg !1893
  %169 = addrspacecast ptr addrspace(5) %13 to ptr
  %170 = addrspacecast ptr addrspace(5) %14 to ptr
  %171 = addrspacecast ptr addrspace(5) %15 to ptr
  store float %166, ptr %170, align 4
    #dbg_declare(ptr addrspace(5) %14, !1894, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(float)), !1898)
  store float %168, ptr %171, align 4
    #dbg_declare(ptr addrspace(5) %15, !1897, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(float)), !1900)
  %172 = load float, ptr %170, align 4, !dbg !1901
  %173 = load float, ptr %171, align 4, !dbg !1902
  %174 = fdiv contract float %172, %173, !dbg !1903
  store float %174, ptr %57, align 4, !dbg !1890
  %175 = load float, ptr %57, align 4, !dbg !1904
  %176 = load float, ptr %57, align 4, !dbg !1905
  %177 = addrspacecast ptr addrspace(5) %11 to ptr
  %178 = addrspacecast ptr addrspace(5) %12 to ptr
  store float %176, ptr %178, align 4
    #dbg_declare(ptr addrspace(5) %12, !836, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(float)), !1906)
  %179 = load float, ptr %178, align 4, !dbg !1908
  %180 = call contract noundef float @__ocml_log2_f32(float noundef %179) #14, !dbg !1909
  %181 = fmul contract float %175, %180, !dbg !1910
  %182 = load float, ptr %55, align 4, !dbg !1911
  %183 = fsub contract float %182, %181, !dbg !1911
  store float %183, ptr %55, align 4, !dbg !1911
  br label %184, !dbg !1912

184:                                              ; preds = %161
  %185 = load i32, ptr %56, align 4, !dbg !1913
  %186 = add nsw i32 %185, 1, !dbg !1913
  store i32 %186, ptr %56, align 4, !dbg !1913
  br label %158, !dbg !1914, !llvm.loop !1915

187:                                              ; preds = %158
  br label %188

188:                                              ; preds = %187, %156
  %189 = load i32, ptr %47, align 4, !dbg !1917
  %190 = load i32, ptr %44, align 4, !dbg !1919
  %191 = icmp slt i32 %189, %190, !dbg !1920
  br i1 %191, label %192, label %206, !dbg !1921

192:                                              ; preds = %188
  %193 = load i32, ptr %46, align 4, !dbg !1922
  %194 = load i32, ptr %45, align 4, !dbg !1923
  %195 = icmp slt i32 %193, %194, !dbg !1924
  br i1 %195, label %196, label %206, !dbg !1925

196:                                              ; preds = %192
  %197 = load float, ptr %55, align 4, !dbg !1926
  %198 = load ptr, ptr %42, align 8, !dbg !1927
  %199 = load i32, ptr %47, align 4, !dbg !1928
  %200 = load i32, ptr %45, align 4, !dbg !1929
  %201 = mul nsw i32 %199, %200, !dbg !1930
  %202 = load i32, ptr %46, align 4, !dbg !1931
  %203 = add nsw i32 %201, %202, !dbg !1932
  %204 = sext i32 %203 to i64, !dbg !1927
  %205 = getelementptr inbounds float, ptr %198, i64 %204, !dbg !1927
  store float %197, ptr %205, align 4, !dbg !1933
  br label %206, !dbg !1927

206:                                              ; preds = %196, %192, %188
  ret void, !dbg !1934
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define protected amdgpu_kernel void @_Z11entropy_optILi16ELi16EEvPfPKcPKfii(ptr addrspace(1) noalias noundef %0, ptr addrspace(1) noalias noundef %1, ptr addrspace(1) noalias noundef %2, i32 noundef %3, i32 noundef %4) #4 comdat !dbg !2 {
  %6 = alloca i32, align 4, addrspace(5)
  %7 = alloca i32, align 4, addrspace(5)
  %8 = alloca i32, align 4, addrspace(5)
  %9 = alloca i32, align 4, addrspace(5)
  %10 = alloca i32, align 4, addrspace(5)
  %11 = alloca i32, align 4, addrspace(5)
  %12 = alloca i32, align 4, addrspace(5)
  %13 = alloca i32, align 4, addrspace(5)
  %14 = alloca float, align 4, addrspace(5)
  %15 = alloca float, align 4, addrspace(5)
  %16 = alloca i32, align 4, addrspace(5)
  %17 = alloca i32, align 4, addrspace(5)
  %18 = alloca i32, align 4, addrspace(5)
  %19 = alloca i32, align 4, addrspace(5)
  %20 = alloca i32, align 4, addrspace(5)
  %21 = alloca i32, align 4, addrspace(5)
  %22 = alloca i32, align 4, addrspace(5)
  %23 = alloca i32, align 4, addrspace(5)
  %24 = alloca ptr, align 8, addrspace(5)
  %25 = alloca ptr, align 8, addrspace(5)
  %26 = alloca ptr, align 8, addrspace(5)
  %27 = alloca ptr, align 8, addrspace(5)
  %28 = alloca ptr, align 8, addrspace(5)
  %29 = alloca ptr, align 8, addrspace(5)
  %30 = alloca i32, align 4, addrspace(5)
  %31 = alloca i32, align 4, addrspace(5)
  %32 = alloca i32, align 4, addrspace(5)
  %33 = alloca i32, align 4, addrspace(5)
  %34 = alloca i32, align 4, addrspace(5)
  %35 = alloca i32, align 4, addrspace(5)
  %36 = alloca i8, align 1, addrspace(5)
  %37 = alloca i32, align 4, addrspace(5)
  %38 = alloca i32, align 4, addrspace(5)
  %39 = alloca i32, align 4, addrspace(5)
  %40 = alloca i32, align 4, addrspace(5)
  %41 = alloca float, align 4, addrspace(5)
  %42 = alloca i32, align 4, addrspace(5)
  %43 = addrspacecast ptr addrspace(5) %24 to ptr
  %44 = addrspacecast ptr addrspace(5) %25 to ptr
  %45 = addrspacecast ptr addrspace(5) %26 to ptr
  %46 = addrspacecast ptr addrspace(5) %27 to ptr
  %47 = addrspacecast ptr addrspace(5) %28 to ptr
  %48 = addrspacecast ptr addrspace(5) %29 to ptr
  %49 = addrspacecast ptr addrspace(5) %30 to ptr
  %50 = addrspacecast ptr addrspace(5) %31 to ptr
  %51 = addrspacecast ptr addrspace(5) %32 to ptr
  %52 = addrspacecast ptr addrspace(5) %33 to ptr
  %53 = addrspacecast ptr addrspace(5) %34 to ptr
  %54 = addrspacecast ptr addrspace(5) %35 to ptr
  %55 = addrspacecast ptr addrspace(5) %36 to ptr
  %56 = addrspacecast ptr addrspace(5) %37 to ptr
  %57 = addrspacecast ptr addrspace(5) %38 to ptr
  %58 = addrspacecast ptr addrspace(5) %39 to ptr
  %59 = addrspacecast ptr addrspace(5) %40 to ptr
  %60 = addrspacecast ptr addrspace(5) %41 to ptr
  %61 = addrspacecast ptr addrspace(5) %42 to ptr
  %62 = addrspacecast ptr addrspace(1) %0 to ptr
  store ptr %62, ptr %43, align 8
  %63 = load ptr, ptr %43, align 8
  %64 = addrspacecast ptr addrspace(1) %1 to ptr
  store ptr %64, ptr %44, align 8
  %65 = load ptr, ptr %44, align 8
  %66 = addrspacecast ptr addrspace(1) %2 to ptr
  store ptr %66, ptr %45, align 8
  %67 = load ptr, ptr %45, align 8
  store ptr %63, ptr %46, align 8
    #dbg_declare(ptr addrspace(5) %27, !1581, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(ptr)), !1935)
  store ptr %65, ptr %47, align 8
    #dbg_declare(ptr addrspace(5) %28, !1582, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(ptr)), !1936)
  store ptr %67, ptr %48, align 8
    #dbg_declare(ptr addrspace(5) %29, !1583, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(ptr)), !1937)
  store i32 %3, ptr %49, align 4
    #dbg_declare(ptr addrspace(5) %30, !1584, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1938)
  store i32 %4, ptr %50, align 4
    #dbg_declare(ptr addrspace(5) %31, !1585, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1939)
    #dbg_declare(ptr addrspace(5) %32, !1586, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1940)
  %68 = addrspacecast ptr addrspace(5) %22 to ptr
  %69 = addrspacecast ptr addrspace(5) %13 to ptr
  %70 = call i64 @__ockl_get_local_id(i32 noundef 0) #13, !dbg !1941
  %71 = trunc i64 %70 to i32, !dbg !1941
  %72 = addrspacecast ptr addrspace(5) %21 to ptr
  %73 = addrspacecast ptr addrspace(5) %11 to ptr
  %74 = call i64 @__ockl_get_group_id(i32 noundef 0) #13, !dbg !1944
  %75 = trunc i64 %74 to i32, !dbg !1944
  %76 = addrspacecast ptr addrspace(5) %20 to ptr
  %77 = addrspacecast ptr addrspace(5) %10 to ptr
  %78 = call i64 @__ockl_get_local_size(i32 noundef 0) #13, !dbg !1947
  %79 = trunc i64 %78 to i32, !dbg !1947
  %80 = mul i32 %75, %79, !dbg !1950
  %81 = add i32 %71, %80, !dbg !1951
  store i32 %81, ptr %51, align 4, !dbg !1940
    #dbg_declare(ptr addrspace(5) %33, !1588, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1952)
  %82 = addrspacecast ptr addrspace(5) %18 to ptr
  %83 = addrspacecast ptr addrspace(5) %9 to ptr
  %84 = call i64 @__ockl_get_local_id(i32 noundef 1) #13, !dbg !1953
  %85 = trunc i64 %84 to i32, !dbg !1953
  %86 = addrspacecast ptr addrspace(5) %17 to ptr
  %87 = addrspacecast ptr addrspace(5) %7 to ptr
  %88 = call i64 @__ockl_get_group_id(i32 noundef 1) #13, !dbg !1956
  %89 = trunc i64 %88 to i32, !dbg !1956
  %90 = addrspacecast ptr addrspace(5) %16 to ptr
  %91 = addrspacecast ptr addrspace(5) %6 to ptr
  %92 = call i64 @__ockl_get_local_size(i32 noundef 1) #13, !dbg !1959
  %93 = trunc i64 %92 to i32, !dbg !1959
  %94 = mul i32 %89, %93, !dbg !1962
  %95 = add i32 %85, %94, !dbg !1963
  store i32 %95, ptr %52, align 4, !dbg !1952
    #dbg_declare(ptr addrspace(5) %34, !1589, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1964)
  %96 = addrspacecast ptr addrspace(5) %19 to ptr
  %97 = addrspacecast ptr addrspace(5) %8 to ptr
  %98 = call i64 @__ockl_get_local_id(i32 noundef 1) #13, !dbg !1965
  %99 = trunc i64 %98 to i32, !dbg !1965
  %100 = mul i32 %99, 16, !dbg !1968
  %101 = addrspacecast ptr addrspace(5) %23 to ptr
  %102 = addrspacecast ptr addrspace(5) %12 to ptr
  %103 = call i64 @__ockl_get_local_id(i32 noundef 0) #13, !dbg !1969
  %104 = trunc i64 %103 to i32, !dbg !1969
  %105 = add i32 %100, %104, !dbg !1972
  store i32 %105, ptr %53, align 4, !dbg !1964
    #dbg_declare(ptr addrspace(5) %35, !1590, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1973)
  store i32 0, ptr %54, align 4, !dbg !1973
  br label %106, !dbg !1974

106:                                              ; preds = %116, %5
  %107 = load i32, ptr %54, align 4, !dbg !1975
  %108 = icmp slt i32 %107, 16, !dbg !1977
  br i1 %108, label %109, label %119, !dbg !1978

109:                                              ; preds = %106
  %110 = load i32, ptr %54, align 4, !dbg !1979
  %111 = sext i32 %110 to i64, !dbg !1980
  %112 = getelementptr inbounds [16 x [256 x i32]], ptr addrspacecast (ptr addrspace(3) @_ZZ11entropy_optILi16ELi16EEvPfPKcPKfiiE8sd_count to ptr), i64 0, i64 %111, !dbg !1980
  %113 = load i32, ptr %53, align 4, !dbg !1981
  %114 = sext i32 %113 to i64, !dbg !1980
  %115 = getelementptr inbounds [256 x i32], ptr %112, i64 0, i64 %114, !dbg !1980
  store i32 0, ptr %115, align 4, !dbg !1982
  br label %116, !dbg !1980

116:                                              ; preds = %109
  %117 = load i32, ptr %54, align 4, !dbg !1983
  %118 = add nsw i32 %117, 1, !dbg !1983
  store i32 %118, ptr %54, align 4, !dbg !1983
  br label %106, !dbg !1984, !llvm.loop !1985

119:                                              ; preds = %106
    #dbg_declare(ptr addrspace(5) %36, !1592, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i8)), !1987)
  store i8 0, ptr %55, align 1, !dbg !1987
    #dbg_declare(ptr addrspace(5) %37, !1593, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1988)
  store i32 -2, ptr %56, align 4, !dbg !1988
  br label %120, !dbg !1989

120:                                              ; preds = %171, %119
  %121 = load i32, ptr %56, align 4, !dbg !1990
  %122 = icmp sle i32 %121, 2, !dbg !1991
  br i1 %122, label %123, label %174, !dbg !1992

123:                                              ; preds = %120
    #dbg_declare(ptr addrspace(5) %38, !1595, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1993)
  store i32 -2, ptr %57, align 4, !dbg !1993
  br label %124, !dbg !1994

124:                                              ; preds = %167, %123
  %125 = load i32, ptr %57, align 4, !dbg !1995
  %126 = icmp sle i32 %125, 2, !dbg !1996
  br i1 %126, label %127, label %170, !dbg !1997

127:                                              ; preds = %124
    #dbg_declare(ptr addrspace(5) %39, !1599, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1998)
  %128 = load i32, ptr %51, align 4, !dbg !1999
  %129 = load i32, ptr %57, align 4, !dbg !2000
  %130 = add nsw i32 %128, %129, !dbg !2001
  store i32 %130, ptr %58, align 4, !dbg !1998
    #dbg_declare(ptr addrspace(5) %40, !1602, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !2002)
  %131 = load i32, ptr %52, align 4, !dbg !2003
  %132 = load i32, ptr %56, align 4, !dbg !2004
  %133 = add nsw i32 %131, %132, !dbg !2005
  store i32 %133, ptr %59, align 4, !dbg !2002
  %134 = load i32, ptr %58, align 4, !dbg !2006
  %135 = icmp sge i32 %134, 0, !dbg !2008
  br i1 %135, label %136, label %166, !dbg !2009

136:                                              ; preds = %127
  %137 = load i32, ptr %59, align 4, !dbg !2010
  %138 = icmp sge i32 %137, 0, !dbg !2011
  br i1 %138, label %139, label %166, !dbg !2012

139:                                              ; preds = %136
  %140 = load i32, ptr %59, align 4, !dbg !2013
  %141 = load i32, ptr %49, align 4, !dbg !2014
  %142 = icmp slt i32 %140, %141, !dbg !2015
  br i1 %142, label %143, label %166, !dbg !2016

143:                                              ; preds = %139
  %144 = load i32, ptr %58, align 4, !dbg !2017
  %145 = load i32, ptr %50, align 4, !dbg !2018
  %146 = icmp slt i32 %144, %145, !dbg !2019
  br i1 %146, label %147, label %166, !dbg !2020

147:                                              ; preds = %143
  %148 = load ptr, ptr %47, align 8, !dbg !2021
  %149 = load i32, ptr %59, align 4, !dbg !2023
  %150 = load i32, ptr %50, align 4, !dbg !2024
  %151 = mul nsw i32 %149, %150, !dbg !2025
  %152 = load i32, ptr %58, align 4, !dbg !2026
  %153 = add nsw i32 %151, %152, !dbg !2027
  %154 = sext i32 %153 to i64, !dbg !2021
  %155 = getelementptr inbounds i8, ptr %148, i64 %154, !dbg !2021
  %156 = load i8, ptr %155, align 1, !dbg !2021
  %157 = sext i8 %156 to i64, !dbg !2028
  %158 = getelementptr inbounds [16 x [256 x i32]], ptr addrspacecast (ptr addrspace(3) @_ZZ11entropy_optILi16ELi16EEvPfPKcPKfiiE8sd_count to ptr), i64 0, i64 %157, !dbg !2028
  %159 = load i32, ptr %53, align 4, !dbg !2029
  %160 = sext i32 %159 to i64, !dbg !2028
  %161 = getelementptr inbounds [256 x i32], ptr %158, i64 0, i64 %160, !dbg !2028
  %162 = load i32, ptr %161, align 4, !dbg !2030
  %163 = add nsw i32 %162, 1, !dbg !2030
  store i32 %163, ptr %161, align 4, !dbg !2030
  %164 = load i8, ptr %55, align 1, !dbg !2031
  %165 = add i8 %164, 1, !dbg !2031
  store i8 %165, ptr %55, align 1, !dbg !2031
  br label %166, !dbg !2032

166:                                              ; preds = %147, %143, %139, %136, %127
  br label %167, !dbg !2033

167:                                              ; preds = %166
  %168 = load i32, ptr %57, align 4, !dbg !2034
  %169 = add nsw i32 %168, 1, !dbg !2034
  store i32 %169, ptr %57, align 4, !dbg !2034
  br label %124, !dbg !2035, !llvm.loop !2036

170:                                              ; preds = %124
  br label %171, !dbg !2038

171:                                              ; preds = %170
  %172 = load i32, ptr %56, align 4, !dbg !2039
  %173 = add nsw i32 %172, 1, !dbg !2039
  store i32 %173, ptr %56, align 4, !dbg !2039
  br label %120, !dbg !2040, !llvm.loop !2041

174:                                              ; preds = %120
    #dbg_declare(ptr addrspace(5) %41, !1603, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(float)), !2043)
  store float 0.000000e+00, ptr %60, align 4, !dbg !2043
    #dbg_declare(ptr addrspace(5) %42, !1604, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !2044)
  store i32 0, ptr %61, align 4, !dbg !2044
  br label %175, !dbg !2045

175:                                              ; preds = %192, %174
  %176 = load i32, ptr %61, align 4, !dbg !2046
  %177 = icmp slt i32 %176, 16, !dbg !2048
  br i1 %177, label %178, label %195, !dbg !2049

178:                                              ; preds = %175
  %179 = load ptr, ptr %48, align 8, !dbg !2050
  %180 = load i32, ptr %61, align 4, !dbg !2051
  %181 = sext i32 %180 to i64, !dbg !2052
  %182 = getelementptr inbounds [16 x [256 x i32]], ptr addrspacecast (ptr addrspace(3) @_ZZ11entropy_optILi16ELi16EEvPfPKcPKfiiE8sd_count to ptr), i64 0, i64 %181, !dbg !2052
  %183 = load i32, ptr %53, align 4, !dbg !2053
  %184 = sext i32 %183 to i64, !dbg !2052
  %185 = getelementptr inbounds [256 x i32], ptr %182, i64 0, i64 %184, !dbg !2052
  %186 = load i32, ptr %185, align 4, !dbg !2052
  %187 = sext i32 %186 to i64, !dbg !2050
  %188 = getelementptr inbounds float, ptr %179, i64 %187, !dbg !2050
  %189 = load float, ptr %188, align 4, !dbg !2050
  %190 = load float, ptr %60, align 4, !dbg !2054
  %191 = fsub contract float %190, %189, !dbg !2054
  store float %191, ptr %60, align 4, !dbg !2054
  br label %192, !dbg !2055

192:                                              ; preds = %178
  %193 = load i32, ptr %61, align 4, !dbg !2056
  %194 = add nsw i32 %193, 1, !dbg !2056
  store i32 %194, ptr %61, align 4, !dbg !2056
  br label %175, !dbg !2057, !llvm.loop !2058

195:                                              ; preds = %175
  %196 = load float, ptr %60, align 4, !dbg !2060
  %197 = load i8, ptr %55, align 1, !dbg !2061
  %198 = sext i8 %197 to i32, !dbg !2061
  %199 = sitofp i32 %198 to float, !dbg !2061
  %200 = fdiv contract float %196, %199, !dbg !2062
  %201 = load i8, ptr %55, align 1, !dbg !2063
  %202 = sitofp i8 %201 to float, !dbg !2063
  %203 = addrspacecast ptr addrspace(5) %14 to ptr
  %204 = addrspacecast ptr addrspace(5) %15 to ptr
  store float %202, ptr %204, align 4
    #dbg_declare(ptr addrspace(5) %15, !836, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(float)), !2064)
  %205 = load float, ptr %204, align 4, !dbg !2066
  %206 = call contract noundef float @__ocml_log2_f32(float noundef %205) #14, !dbg !2067
  %207 = fadd contract float %200, %206, !dbg !2068
  store float %207, ptr %60, align 4, !dbg !2069
  %208 = load i32, ptr %52, align 4, !dbg !2070
  %209 = load i32, ptr %49, align 4, !dbg !2072
  %210 = icmp slt i32 %208, %209, !dbg !2073
  br i1 %210, label %211, label %225, !dbg !2074

211:                                              ; preds = %195
  %212 = load i32, ptr %51, align 4, !dbg !2075
  %213 = load i32, ptr %50, align 4, !dbg !2076
  %214 = icmp slt i32 %212, %213, !dbg !2077
  br i1 %214, label %215, label %225, !dbg !2078

215:                                              ; preds = %211
  %216 = load float, ptr %60, align 4, !dbg !2079
  %217 = load ptr, ptr %46, align 8, !dbg !2080
  %218 = load i32, ptr %52, align 4, !dbg !2081
  %219 = load i32, ptr %50, align 4, !dbg !2082
  %220 = mul nsw i32 %218, %219, !dbg !2083
  %221 = load i32, ptr %51, align 4, !dbg !2084
  %222 = add nsw i32 %220, %221, !dbg !2085
  %223 = sext i32 %222 to i64, !dbg !2080
  %224 = getelementptr inbounds float, ptr %217, i64 %223, !dbg !2080
  store float %216, ptr %224, align 4, !dbg !2086
  br label %225, !dbg !2080

225:                                              ; preds = %215, %211, %195
  ret void, !dbg !2087
}

; Function Attrs: convergent mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal noundef float @__ocml_log2_f32(float noundef %0) #5 {
  %2 = tail call float @llvm.log2.f32(float %0)
  ret float %2
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.log2.f32(float) #6

; Function Attrs: convergent mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal range(i64 0, 1024) i64 @__ockl_get_local_id(i32 noundef %0) #5 {
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
declare noundef i32 @llvm.amdgcn.workitem.id.x() #6

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.amdgcn.workitem.id.y() #6

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.amdgcn.workitem.id.z() #6

; Function Attrs: convergent norecurse nounwind
define internal i64 @__ockl_fprintf_stderr_begin() #7 {
  %1 = tail call <2 x i64> @__ockl_hostcall_preview(i32 noundef 2, i64 noundef 33, i64 noundef 1, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #12
  %2 = extractelement <2 x i64> %1, i64 0
  ret i64 %2
}

; Function Attrs: convergent norecurse nounwind
define internal <2 x i64> @__ockl_hostcall_preview(i32 noundef %0, i64 noundef %1, i64 noundef %2, i64 noundef %3, i64 noundef %4, i64 noundef %5, i64 noundef %6, i64 noundef %7, i64 noundef %8) local_unnamed_addr #7 {
  %10 = load i32, ptr addrspace(4) @__oclc_ABI_version, align 4, !tbaa !2088
  %11 = icmp slt i32 %10, 500
  %12 = tail call ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %13 = select i1 %11, i64 24, i64 80
  %14 = getelementptr inbounds i8, ptr addrspace(4) %12, i64 %13
  %15 = load i64, ptr addrspace(4) %14, align 8, !tbaa !2092
  %16 = inttoptr i64 %15 to ptr addrspace(1)
  %17 = addrspacecast ptr addrspace(1) %16 to ptr
  %18 = tail call <2 x i64> @__ockl_hostcall_internal(ptr noundef %17, i32 noundef %0, i64 noundef %1, i64 noundef %2, i64 noundef %3, i64 noundef %4, i64 noundef %5, i64 noundef %6, i64 noundef %7, i64 noundef %8) #15
  ret <2 x i64> %18
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef align 4 ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr() #6

; Function Attrs: convergent norecurse nounwind
define internal <2 x i64> @__ockl_hostcall_internal(ptr nocapture noundef %0, i32 noundef %1, i64 noundef %2, i64 noundef %3, i64 noundef %4, i64 noundef %5, i64 noundef %6, i64 noundef %7, i64 noundef %8, i64 noundef %9) local_unnamed_addr #7 {
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
  %20 = load ptr addrspace(1), ptr addrspace(1) %14, align 8, !tbaa !2094
  %21 = load i64, ptr addrspace(1) %19, align 8, !tbaa !2098
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
  %30 = load ptr addrspace(1), ptr addrspace(1) %14, align 8, !tbaa !2094
  %31 = load i64, ptr addrspace(1) %19, align 8, !tbaa !2098
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
  %49 = load ptr addrspace(1), ptr addrspace(1) %14, align 8, !tbaa !2094
  %50 = getelementptr i8, ptr addrspace(1) %14, i64 40
  %51 = load i64, ptr addrspace(1) %50, align 8, !tbaa !2098
  %52 = and i64 %48, %51
  %53 = getelementptr inbounds %0, ptr addrspace(1) %49, i64 %52
  %54 = getelementptr i8, ptr addrspace(1) %14, i64 8
  %55 = load ptr addrspace(1), ptr addrspace(1) %54, align 8, !tbaa !2099
  %56 = getelementptr inbounds %1, ptr addrspace(1) %55, i64 %52
  %57 = tail call i64 @llvm.amdgcn.ballot.i64(i1 true)
  br i1 %15, label %58, label %62

58:                                               ; preds = %38
  %59 = getelementptr inbounds i8, ptr addrspace(1) %53, i64 16
  %60 = getelementptr inbounds i8, ptr addrspace(1) %53, i64 8
  %61 = getelementptr inbounds i8, ptr addrspace(1) %53, i64 20
  store i32 %1, ptr addrspace(1) %59, align 8, !tbaa !2100
  store i64 %57, ptr addrspace(1) %60, align 8, !tbaa !2102
  store i32 1, ptr addrspace(1) %61, align 4, !tbaa !2103
  br label %62

62:                                               ; preds = %58, %38
  %63 = zext i32 %12 to i64
  %64 = getelementptr inbounds [64 x [8 x i64]], ptr addrspace(1) %56, i64 0, i64 %63
  store i64 %2, ptr addrspace(1) %64, align 8, !tbaa !2092
  %65 = getelementptr inbounds i8, ptr addrspace(1) %64, i64 8
  store i64 %3, ptr addrspace(1) %65, align 8, !tbaa !2092
  %66 = getelementptr inbounds i8, ptr addrspace(1) %64, i64 16
  store i64 %4, ptr addrspace(1) %66, align 8, !tbaa !2092
  %67 = getelementptr inbounds i8, ptr addrspace(1) %64, i64 24
  store i64 %5, ptr addrspace(1) %67, align 8, !tbaa !2092
  %68 = getelementptr inbounds i8, ptr addrspace(1) %64, i64 32
  store i64 %6, ptr addrspace(1) %68, align 8, !tbaa !2092
  %69 = getelementptr inbounds i8, ptr addrspace(1) %64, i64 40
  store i64 %7, ptr addrspace(1) %69, align 8, !tbaa !2092
  %70 = getelementptr inbounds i8, ptr addrspace(1) %64, i64 48
  store i64 %8, ptr addrspace(1) %70, align 8, !tbaa !2092
  %71 = getelementptr inbounds i8, ptr addrspace(1) %64, i64 56
  store i64 %9, ptr addrspace(1) %71, align 8, !tbaa !2092
  br i1 %15, label %72, label %88

72:                                               ; preds = %62
  %73 = getelementptr inbounds i8, ptr addrspace(1) %14, i64 32
  %74 = load atomic i64, ptr addrspace(1) %73 syncscope("one-as") monotonic, align 8
  %75 = load i64, ptr addrspace(1) %50, align 8, !tbaa !2098
  %76 = and i64 %75, %48
  %77 = getelementptr inbounds %0, ptr addrspace(1) %49, i64 %76
  store i64 %74, ptr addrspace(1) %77, align 8, !tbaa !2104
  %78 = cmpxchg ptr addrspace(1) %73, i64 %74, i64 %48 syncscope("one-as") release monotonic, align 8
  %79 = extractvalue { i64, i1 } %78, 1
  br i1 %79, label %85, label %80

80:                                               ; preds = %80, %72
  %81 = phi { i64, i1 } [ %83, %80 ], [ %78, %72 ]
  %82 = extractvalue { i64, i1 } %81, 0
  tail call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %82, ptr addrspace(1) %77, align 8, !tbaa !2104
  %83 = cmpxchg ptr addrspace(1) %73, i64 %82, i64 %48 syncscope("one-as") release monotonic, align 8
  %84 = extractvalue { i64, i1 } %83, 1
  br i1 %84, label %85, label %80

85:                                               ; preds = %80, %72
  %86 = getelementptr inbounds i8, ptr addrspace(1) %14, i64 16
  %87 = load i64, ptr addrspace(1) %86, align 8
  tail call void @__ockl_hsa_signal_add(i64 %87, i64 noundef 1, i32 noundef 3) #12
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
  %100 = load i64, ptr addrspace(1) %64, align 8, !tbaa !2092
  %101 = load i64, ptr addrspace(1) %65, align 8, !tbaa !2092
  br i1 %15, label %102, label %120

102:                                              ; preds = %99
  %103 = load i64, ptr addrspace(1) %50, align 8, !tbaa !2098
  %104 = add i64 %103, 1
  %105 = add i64 %104, %48
  %106 = icmp eq i64 %105, 0
  %107 = select i1 %106, i64 %104, i64 %105
  %108 = getelementptr inbounds i8, ptr addrspace(1) %14, i64 24
  %109 = load atomic i64, ptr addrspace(1) %108 syncscope("one-as") monotonic, align 8
  %110 = load ptr addrspace(1), ptr addrspace(1) %14, align 8, !tbaa !2094
  %111 = and i64 %107, %103
  %112 = getelementptr inbounds %0, ptr addrspace(1) %110, i64 %111
  store i64 %109, ptr addrspace(1) %112, align 8, !tbaa !2104
  %113 = cmpxchg ptr addrspace(1) %108, i64 %109, i64 %107 syncscope("one-as") release monotonic, align 8
  %114 = extractvalue { i64, i1 } %113, 1
  br i1 %114, label %120, label %115

115:                                              ; preds = %115, %102
  %116 = phi { i64, i1 } [ %118, %115 ], [ %113, %102 ]
  %117 = extractvalue { i64, i1 } %116, 0
  tail call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %117, ptr addrspace(1) %112, align 8, !tbaa !2104
  %118 = cmpxchg ptr addrspace(1) %108, i64 %117, i64 %107 syncscope("one-as") release monotonic, align 8
  %119 = extractvalue { i64, i1 } %118, 1
  br i1 %119, label %120, label %115

120:                                              ; preds = %115, %102, %99
  %121 = insertelement <2 x i64> poison, i64 %100, i64 0
  %122 = insertelement <2 x i64> %121, i64 %101, i64 1
  ret <2 x i64> %122
}

; Function Attrs: convergent nocallback nofree nounwind willreturn memory(none)
declare i32 @llvm.amdgcn.readfirstlane.i32(i32) #8

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.amdgcn.s.sleep(i32 immarg) #9

; Function Attrs: convergent nocallback nofree nounwind willreturn memory(none)
declare i64 @llvm.amdgcn.ballot.i64(i1) #8

; Function Attrs: convergent norecurse nounwind
define internal void @__ockl_hsa_signal_add(i64 %0, i64 noundef %1, i32 noundef %2) local_unnamed_addr #7 {
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
  %18 = load i64, ptr addrspace(1) %17, align 16, !tbaa !2105
  %19 = icmp eq i64 %18, 0
  br i1 %19, label %34, label %20

20:                                               ; preds = %16
  %21 = inttoptr i64 %18 to ptr addrspace(1)
  %22 = getelementptr inbounds i8, ptr addrspace(1) %4, i64 24
  %23 = load i32, ptr addrspace(1) %22, align 8, !tbaa !2107
  %24 = zext i32 %23 to i64
  store atomic i64 %24, ptr addrspace(1) %21 syncscope("one-as") release, align 8
  %25 = load i32, ptr addrspace(4) @__oclc_ISA_version, align 4, !tbaa !2088
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
declare void @llvm.amdgcn.s.sendmsg(i32 immarg, i32) #10

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare i32 @llvm.amdgcn.mbcnt.lo(i32, i32) #11

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare i32 @llvm.amdgcn.mbcnt.hi(i32, i32) #11

; Function Attrs: convergent norecurse nounwind
define internal i64 @__ockl_fprintf_append_args(i64 noundef %0, i32 noundef %1, i64 noundef %2, i64 noundef %3, i64 noundef %4, i64 noundef %5, i64 noundef %6, i64 noundef %7, i64 noundef %8, i32 noundef %9) #7 {
  %11 = icmp eq i32 %9, 0
  %12 = or i64 %0, 2
  %13 = select i1 %11, i64 %0, i64 %12
  %14 = and i64 %13, -225
  %15 = zext i32 %1 to i64
  %16 = shl nuw nsw i64 %15, 5
  %17 = or i64 %14, %16
  %18 = tail call <2 x i64> @__ockl_hostcall_preview(i32 noundef 2, i64 noundef %17, i64 noundef %2, i64 noundef %3, i64 noundef %4, i64 noundef %5, i64 noundef %6, i64 noundef %7, i64 noundef %8) #12
  %19 = extractelement <2 x i64> %18, i64 0
  ret i64 %19
}

; Function Attrs: convergent norecurse nounwind
define internal i64 @__ockl_fprintf_append_string_n(i64 noundef %0, ptr noundef readonly %1, i64 noundef %2, i32 noundef %3) #7 {
  %5 = icmp eq i32 %3, 0
  %6 = or i64 %0, 2
  %7 = select i1 %5, i64 %0, i64 %6
  %8 = icmp eq ptr %1, null
  br i1 %8, label %9, label %13

9:                                                ; preds = %4
  %10 = and i64 %7, -225
  %11 = or disjoint i64 %10, 32
  %12 = tail call <2 x i64> @__ockl_hostcall_preview(i32 noundef 2, i64 noundef %11, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #12
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
  %33 = load i8, ptr %19, align 1, !tbaa !2108
  %34 = zext i8 %33 to i64
  %35 = getelementptr inbounds i8, ptr %19, i64 1
  %36 = load i8, ptr %35, align 1, !tbaa !2108
  %37 = zext i8 %36 to i64
  %38 = shl nuw nsw i64 %37, 8
  %39 = or disjoint i64 %38, %34
  %40 = getelementptr inbounds i8, ptr %19, i64 2
  %41 = load i8, ptr %40, align 1, !tbaa !2108
  %42 = zext i8 %41 to i64
  %43 = shl nuw nsw i64 %42, 16
  %44 = or disjoint i64 %39, %43
  %45 = getelementptr inbounds i8, ptr %19, i64 3
  %46 = load i8, ptr %45, align 1, !tbaa !2108
  %47 = zext i8 %46 to i64
  %48 = shl nuw nsw i64 %47, 24
  %49 = or disjoint i64 %44, %48
  %50 = getelementptr inbounds i8, ptr %19, i64 4
  %51 = load i8, ptr %50, align 1, !tbaa !2108
  %52 = zext i8 %51 to i64
  %53 = shl nuw nsw i64 %52, 32
  %54 = or disjoint i64 %49, %53
  %55 = getelementptr inbounds i8, ptr %19, i64 5
  %56 = load i8, ptr %55, align 1, !tbaa !2108
  %57 = zext i8 %56 to i64
  %58 = shl nuw nsw i64 %57, 40
  %59 = or i64 %54, %58
  %60 = getelementptr inbounds i8, ptr %19, i64 6
  %61 = load i8, ptr %60, align 1, !tbaa !2108
  %62 = zext i8 %61 to i64
  %63 = shl nuw nsw i64 %62, 48
  %64 = or i64 %59, %63
  %65 = getelementptr inbounds i8, ptr %19, i64 7
  %66 = load i8, ptr %65, align 1, !tbaa !2108
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
  %77 = load i8, ptr %76, align 1, !tbaa !2108
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
  %93 = load i8, ptr %86, align 1, !tbaa !2108
  %94 = zext i8 %93 to i64
  %95 = getelementptr inbounds i8, ptr %86, i64 1
  %96 = load i8, ptr %95, align 1, !tbaa !2108
  %97 = zext i8 %96 to i64
  %98 = shl nuw nsw i64 %97, 8
  %99 = or disjoint i64 %98, %94
  %100 = getelementptr inbounds i8, ptr %86, i64 2
  %101 = load i8, ptr %100, align 1, !tbaa !2108
  %102 = zext i8 %101 to i64
  %103 = shl nuw nsw i64 %102, 16
  %104 = or disjoint i64 %99, %103
  %105 = getelementptr inbounds i8, ptr %86, i64 3
  %106 = load i8, ptr %105, align 1, !tbaa !2108
  %107 = zext i8 %106 to i64
  %108 = shl nuw nsw i64 %107, 24
  %109 = or disjoint i64 %104, %108
  %110 = getelementptr inbounds i8, ptr %86, i64 4
  %111 = load i8, ptr %110, align 1, !tbaa !2108
  %112 = zext i8 %111 to i64
  %113 = shl nuw nsw i64 %112, 32
  %114 = or disjoint i64 %109, %113
  %115 = getelementptr inbounds i8, ptr %86, i64 5
  %116 = load i8, ptr %115, align 1, !tbaa !2108
  %117 = zext i8 %116 to i64
  %118 = shl nuw nsw i64 %117, 40
  %119 = or i64 %114, %118
  %120 = getelementptr inbounds i8, ptr %86, i64 6
  %121 = load i8, ptr %120, align 1, !tbaa !2108
  %122 = zext i8 %121 to i64
  %123 = shl nuw nsw i64 %122, 48
  %124 = or i64 %119, %123
  %125 = getelementptr inbounds i8, ptr %86, i64 7
  %126 = load i8, ptr %125, align 1, !tbaa !2108
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
  %137 = load i8, ptr %136, align 1, !tbaa !2108
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
  %153 = load i8, ptr %146, align 1, !tbaa !2108
  %154 = zext i8 %153 to i64
  %155 = getelementptr inbounds i8, ptr %146, i64 1
  %156 = load i8, ptr %155, align 1, !tbaa !2108
  %157 = zext i8 %156 to i64
  %158 = shl nuw nsw i64 %157, 8
  %159 = or disjoint i64 %158, %154
  %160 = getelementptr inbounds i8, ptr %146, i64 2
  %161 = load i8, ptr %160, align 1, !tbaa !2108
  %162 = zext i8 %161 to i64
  %163 = shl nuw nsw i64 %162, 16
  %164 = or disjoint i64 %159, %163
  %165 = getelementptr inbounds i8, ptr %146, i64 3
  %166 = load i8, ptr %165, align 1, !tbaa !2108
  %167 = zext i8 %166 to i64
  %168 = shl nuw nsw i64 %167, 24
  %169 = or disjoint i64 %164, %168
  %170 = getelementptr inbounds i8, ptr %146, i64 4
  %171 = load i8, ptr %170, align 1, !tbaa !2108
  %172 = zext i8 %171 to i64
  %173 = shl nuw nsw i64 %172, 32
  %174 = or disjoint i64 %169, %173
  %175 = getelementptr inbounds i8, ptr %146, i64 5
  %176 = load i8, ptr %175, align 1, !tbaa !2108
  %177 = zext i8 %176 to i64
  %178 = shl nuw nsw i64 %177, 40
  %179 = or i64 %174, %178
  %180 = getelementptr inbounds i8, ptr %146, i64 6
  %181 = load i8, ptr %180, align 1, !tbaa !2108
  %182 = zext i8 %181 to i64
  %183 = shl nuw nsw i64 %182, 48
  %184 = or i64 %179, %183
  %185 = getelementptr inbounds i8, ptr %146, i64 7
  %186 = load i8, ptr %185, align 1, !tbaa !2108
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
  %197 = load i8, ptr %196, align 1, !tbaa !2108
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
  %213 = load i8, ptr %206, align 1, !tbaa !2108
  %214 = zext i8 %213 to i64
  %215 = getelementptr inbounds i8, ptr %206, i64 1
  %216 = load i8, ptr %215, align 1, !tbaa !2108
  %217 = zext i8 %216 to i64
  %218 = shl nuw nsw i64 %217, 8
  %219 = or disjoint i64 %218, %214
  %220 = getelementptr inbounds i8, ptr %206, i64 2
  %221 = load i8, ptr %220, align 1, !tbaa !2108
  %222 = zext i8 %221 to i64
  %223 = shl nuw nsw i64 %222, 16
  %224 = or disjoint i64 %219, %223
  %225 = getelementptr inbounds i8, ptr %206, i64 3
  %226 = load i8, ptr %225, align 1, !tbaa !2108
  %227 = zext i8 %226 to i64
  %228 = shl nuw nsw i64 %227, 24
  %229 = or disjoint i64 %224, %228
  %230 = getelementptr inbounds i8, ptr %206, i64 4
  %231 = load i8, ptr %230, align 1, !tbaa !2108
  %232 = zext i8 %231 to i64
  %233 = shl nuw nsw i64 %232, 32
  %234 = or disjoint i64 %229, %233
  %235 = getelementptr inbounds i8, ptr %206, i64 5
  %236 = load i8, ptr %235, align 1, !tbaa !2108
  %237 = zext i8 %236 to i64
  %238 = shl nuw nsw i64 %237, 40
  %239 = or i64 %234, %238
  %240 = getelementptr inbounds i8, ptr %206, i64 6
  %241 = load i8, ptr %240, align 1, !tbaa !2108
  %242 = zext i8 %241 to i64
  %243 = shl nuw nsw i64 %242, 48
  %244 = or i64 %239, %243
  %245 = getelementptr inbounds i8, ptr %206, i64 7
  %246 = load i8, ptr %245, align 1, !tbaa !2108
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
  %257 = load i8, ptr %256, align 1, !tbaa !2108
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
  %273 = load i8, ptr %266, align 1, !tbaa !2108
  %274 = zext i8 %273 to i64
  %275 = getelementptr inbounds i8, ptr %266, i64 1
  %276 = load i8, ptr %275, align 1, !tbaa !2108
  %277 = zext i8 %276 to i64
  %278 = shl nuw nsw i64 %277, 8
  %279 = or disjoint i64 %278, %274
  %280 = getelementptr inbounds i8, ptr %266, i64 2
  %281 = load i8, ptr %280, align 1, !tbaa !2108
  %282 = zext i8 %281 to i64
  %283 = shl nuw nsw i64 %282, 16
  %284 = or disjoint i64 %279, %283
  %285 = getelementptr inbounds i8, ptr %266, i64 3
  %286 = load i8, ptr %285, align 1, !tbaa !2108
  %287 = zext i8 %286 to i64
  %288 = shl nuw nsw i64 %287, 24
  %289 = or disjoint i64 %284, %288
  %290 = getelementptr inbounds i8, ptr %266, i64 4
  %291 = load i8, ptr %290, align 1, !tbaa !2108
  %292 = zext i8 %291 to i64
  %293 = shl nuw nsw i64 %292, 32
  %294 = or disjoint i64 %289, %293
  %295 = getelementptr inbounds i8, ptr %266, i64 5
  %296 = load i8, ptr %295, align 1, !tbaa !2108
  %297 = zext i8 %296 to i64
  %298 = shl nuw nsw i64 %297, 40
  %299 = or i64 %294, %298
  %300 = getelementptr inbounds i8, ptr %266, i64 6
  %301 = load i8, ptr %300, align 1, !tbaa !2108
  %302 = zext i8 %301 to i64
  %303 = shl nuw nsw i64 %302, 48
  %304 = or i64 %299, %303
  %305 = getelementptr inbounds i8, ptr %266, i64 7
  %306 = load i8, ptr %305, align 1, !tbaa !2108
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
  %317 = load i8, ptr %316, align 1, !tbaa !2108
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
  %333 = load i8, ptr %326, align 1, !tbaa !2108
  %334 = zext i8 %333 to i64
  %335 = getelementptr inbounds i8, ptr %326, i64 1
  %336 = load i8, ptr %335, align 1, !tbaa !2108
  %337 = zext i8 %336 to i64
  %338 = shl nuw nsw i64 %337, 8
  %339 = or disjoint i64 %338, %334
  %340 = getelementptr inbounds i8, ptr %326, i64 2
  %341 = load i8, ptr %340, align 1, !tbaa !2108
  %342 = zext i8 %341 to i64
  %343 = shl nuw nsw i64 %342, 16
  %344 = or disjoint i64 %339, %343
  %345 = getelementptr inbounds i8, ptr %326, i64 3
  %346 = load i8, ptr %345, align 1, !tbaa !2108
  %347 = zext i8 %346 to i64
  %348 = shl nuw nsw i64 %347, 24
  %349 = or disjoint i64 %344, %348
  %350 = getelementptr inbounds i8, ptr %326, i64 4
  %351 = load i8, ptr %350, align 1, !tbaa !2108
  %352 = zext i8 %351 to i64
  %353 = shl nuw nsw i64 %352, 32
  %354 = or disjoint i64 %349, %353
  %355 = getelementptr inbounds i8, ptr %326, i64 5
  %356 = load i8, ptr %355, align 1, !tbaa !2108
  %357 = zext i8 %356 to i64
  %358 = shl nuw nsw i64 %357, 40
  %359 = or i64 %354, %358
  %360 = getelementptr inbounds i8, ptr %326, i64 6
  %361 = load i8, ptr %360, align 1, !tbaa !2108
  %362 = zext i8 %361 to i64
  %363 = shl nuw nsw i64 %362, 48
  %364 = or i64 %359, %363
  %365 = getelementptr inbounds i8, ptr %326, i64 7
  %366 = load i8, ptr %365, align 1, !tbaa !2108
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
  %377 = load i8, ptr %376, align 1, !tbaa !2108
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
  %393 = load i8, ptr %386, align 1, !tbaa !2108
  %394 = zext i8 %393 to i64
  %395 = getelementptr inbounds i8, ptr %386, i64 1
  %396 = load i8, ptr %395, align 1, !tbaa !2108
  %397 = zext i8 %396 to i64
  %398 = shl nuw nsw i64 %397, 8
  %399 = or disjoint i64 %398, %394
  %400 = getelementptr inbounds i8, ptr %386, i64 2
  %401 = load i8, ptr %400, align 1, !tbaa !2108
  %402 = zext i8 %401 to i64
  %403 = shl nuw nsw i64 %402, 16
  %404 = or disjoint i64 %399, %403
  %405 = getelementptr inbounds i8, ptr %386, i64 3
  %406 = load i8, ptr %405, align 1, !tbaa !2108
  %407 = zext i8 %406 to i64
  %408 = shl nuw nsw i64 %407, 24
  %409 = or disjoint i64 %404, %408
  %410 = getelementptr inbounds i8, ptr %386, i64 4
  %411 = load i8, ptr %410, align 1, !tbaa !2108
  %412 = zext i8 %411 to i64
  %413 = shl nuw nsw i64 %412, 32
  %414 = or disjoint i64 %409, %413
  %415 = getelementptr inbounds i8, ptr %386, i64 5
  %416 = load i8, ptr %415, align 1, !tbaa !2108
  %417 = zext i8 %416 to i64
  %418 = shl nuw nsw i64 %417, 40
  %419 = or i64 %414, %418
  %420 = getelementptr inbounds i8, ptr %386, i64 6
  %421 = load i8, ptr %420, align 1, !tbaa !2108
  %422 = zext i8 %421 to i64
  %423 = shl nuw nsw i64 %422, 48
  %424 = or i64 %419, %423
  %425 = getelementptr inbounds i8, ptr %386, i64 7
  %426 = load i8, ptr %425, align 1, !tbaa !2108
  %427 = zext i8 %426 to i64
  %428 = shl nuw i64 %427, 56
  %429 = or i64 %424, %428
  br label %443

430:                                              ; preds = %430, %390
  %431 = phi i32 [ %441, %430 ], [ 0, %390 ]
  %432 = phi i64 [ %440, %430 ], [ 0, %390 ]
  %433 = zext nneg i32 %431 to i64
  %434 = getelementptr inbounds i8, ptr %386, i64 %433
  %435 = load i8, ptr %434, align 1, !tbaa !2108
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
  %450 = tail call <2 x i64> @__ockl_hostcall_preview(i32 noundef 2, i64 noundef %449, i64 noundef %88, i64 noundef %148, i64 noundef %208, i64 noundef %268, i64 noundef %328, i64 noundef %388, i64 noundef %444) #12
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
declare i64 @llvm.umin.i64(i64, i64) #6

; Function Attrs: convergent mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal range(i64 0, 4294967296) i64 @__ockl_get_local_size(i32 noundef %0) #5 {
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
  %9 = load i16, ptr addrspace(4) %8, align 4, !range !2109, !invariant.load !2110, !noundef !2110
  %10 = zext nneg i16 %9 to i32
  %11 = getelementptr inbounds i8, ptr addrspace(4) %6, i64 12
  %12 = load i32, ptr addrspace(4) %11, align 4, !tbaa !2111
  %13 = mul i32 %7, %10
  %14 = sub i32 %12, %13
  %15 = tail call i32 @llvm.umin.i32(i32 %14, i32 %10)
  %16 = zext nneg i32 %15 to i64
  br label %76

17:                                               ; preds = %2
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %19 = tail call ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %20 = load i32, ptr addrspace(4) %19, align 4, !tbaa !2088
  %21 = icmp ult i32 %18, %20
  %22 = select i1 %21, i64 12, i64 18
  %23 = getelementptr inbounds i8, ptr addrspace(4) %19, i64 %22
  %24 = load i16, ptr addrspace(4) %23, align 2, !tbaa !2114
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
  %33 = load i16, ptr addrspace(4) %32, align 2, !range !2109, !invariant.load !2110, !noundef !2110
  %34 = zext nneg i16 %33 to i32
  %35 = getelementptr inbounds i8, ptr addrspace(4) %30, i64 16
  %36 = load i32, ptr addrspace(4) %35, align 8, !tbaa !2115
  %37 = mul i32 %31, %34
  %38 = sub i32 %36, %37
  %39 = tail call i32 @llvm.umin.i32(i32 %38, i32 %34)
  %40 = zext nneg i32 %39 to i64
  br label %76

41:                                               ; preds = %26
  %42 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %43 = tail call ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %44 = getelementptr inbounds i8, ptr addrspace(4) %43, i64 4
  %45 = load i32, ptr addrspace(4) %44, align 4, !tbaa !2088
  %46 = icmp ult i32 %42, %45
  %47 = select i1 %46, i64 14, i64 20
  %48 = getelementptr inbounds i8, ptr addrspace(4) %43, i64 %47
  %49 = load i16, ptr addrspace(4) %48, align 2, !tbaa !2114
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
  %58 = load i16, ptr addrspace(4) %57, align 4, !range !2109, !invariant.load !2110, !noundef !2110
  %59 = zext nneg i16 %58 to i32
  %60 = getelementptr inbounds i8, ptr addrspace(4) %55, i64 20
  %61 = load i32, ptr addrspace(4) %60, align 4, !tbaa !2116
  %62 = mul i32 %56, %59
  %63 = sub i32 %61, %62
  %64 = tail call i32 @llvm.umin.i32(i32 %63, i32 %59)
  %65 = zext nneg i32 %64 to i64
  br label %76

66:                                               ; preds = %51
  %67 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %68 = tail call ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %69 = getelementptr inbounds i8, ptr addrspace(4) %68, i64 8
  %70 = load i32, ptr addrspace(4) %69, align 4, !tbaa !2088
  %71 = icmp ult i32 %67, %70
  %72 = select i1 %71, i64 16, i64 22
  %73 = getelementptr inbounds i8, ptr addrspace(4) %68, i64 %72
  %74 = load i16, ptr addrspace(4) %73, align 2, !tbaa !2114
  %75 = zext i16 %74 to i64
  br label %76

76:                                               ; preds = %66, %54, %41, %29, %17, %5, %1
  %77 = phi i64 [ 1, %1 ], [ %16, %5 ], [ %25, %17 ], [ %40, %29 ], [ %50, %41 ], [ %65, %54 ], [ %75, %66 ]
  ret i64 %77
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef nonnull align 4 ptr addrspace(4) @llvm.amdgcn.dispatch.ptr() #6

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.amdgcn.workgroup.id.x() #6

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.umin.i32(i32, i32) #6

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.amdgcn.workgroup.id.y() #6

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.amdgcn.workgroup.id.z() #6

; Function Attrs: convergent mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal range(i64 0, 4294967296) i64 @__ockl_get_group_id(i32 noundef %0) #5 {
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
attributes #5 = { convergent mustprogress nofree norecurse nosync nounwind willreturn memory(none) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx90a" "target-features"="+16-bit-insts,+atomic-buffer-global-pk-add-f16-insts,+atomic-fadd-rtn-insts,+ci-insts,+dl-insts,+dot1-insts,+dot10-insts,+dot2-insts,+dot3-insts,+dot4-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+gfx8-insts,+gfx9-insts,+gfx90a-insts,+gws,+image-insts,+mai-insts,+s-memrealtime,+s-memtime-inst,+wavefrontsize64" }
attributes #6 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #7 = { convergent norecurse nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx90a" "target-features"="+16-bit-insts,+atomic-buffer-global-pk-add-f16-insts,+atomic-fadd-rtn-insts,+ci-insts,+dl-insts,+dot1-insts,+dot10-insts,+dot2-insts,+dot3-insts,+dot4-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+gfx8-insts,+gfx9-insts,+gfx90a-insts,+gws,+image-insts,+mai-insts,+s-memrealtime,+s-memtime-inst,+wavefrontsize64" }
attributes #8 = { convergent nocallback nofree nounwind willreturn memory(none) }
attributes #9 = { nocallback nofree nosync nounwind willreturn }
attributes #10 = { nounwind }
attributes #11 = { nocallback nofree nosync nounwind willreturn memory(none) }
attributes #12 = { convergent nounwind }
attributes #13 = { convergent nounwind willreturn memory(none) }
attributes #14 = { convergent nounwind willreturn memory(read) }
attributes #15 = { cold convergent nounwind }

!llvm.dbg.cu = !{!17}
!llvm.module.flags = !{!1613, !1614, !1615, !1616, !1617, !1618, !1619}
!llvm.ident = !{!1620, !1620, !1620, !1620, !1620, !1620, !1620, !1620, !1620, !1620, !1620}
!opencl.ocl.version = !{!1621, !1621, !1621, !1621, !1621, !1621, !1621, !1621, !1621, !1621}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression(DIOpArg(0, ptr addrspace(3)), DIOpDeref([16 x [256 x i32]])))
!1 = distinct !DIGlobalVariable(name: "sd_count", scope: !2, file: !3, line: 56, type: !1609, isLocal: false, isDefinition: true, memorySpace: DW_MSPACE_LLVM_group)
!2 = distinct !DISubprogram(name: "entropy_opt<16, 16>", linkageName: "_Z11entropy_optILi16ELi16EEvPfPKcPKfii", scope: !3, file: !3, line: 50, type: !4, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, templateParams: !1606, retainedNodes: !1580)
!3 = !DIFile(filename: "HeCBench/src/entropy-hip/main.cu", directory: "/ccs/home/mdunlavy/GPU_Fault_Injection", checksumkind: CSK_MD5, checksum: "df85ce02bce9bc6c98c85cc1728e109c")
!4 = !DISubroutineType(types: !5)
!5 = !{null, !6, !9, !13, !16, !16}
!6 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !7)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!9 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !10)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!11 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !12)
!12 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!13 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !14)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !8)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !18, producer: "AMD clang version 19.0.0git (https://github.com/RadeonOpenCompute/llvm-project roc-6.4.2 25224 d366fa84f3fdcbd4b10847ebd5db572ae12a34fb)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !19, globals: !35, imports: !36, splitDebugInlining: false, nameTableKind: None)
!18 = !DIFile(filename: "/ccs/home/mdunlavy/GPU_Fault_Injection/HeCBench/src/entropy-hip/main.cu", directory: "/ccs/home/mdunlavy/GPU_Fault_Injection", checksumkind: CSK_MD5, checksum: "df85ce02bce9bc6c98c85cc1728e109c")
!19 = !{!8, !20}
!20 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dim3", file: !21, line: 1179, size: 96, flags: DIFlagTypePassByValue | DIFlagNonTrivial, elements: !22, identifier: "_ZTS4dim3")
!21 = !DIFile(filename: "/opt/rocm-6.4.2/include/hip/hip_runtime_api.h", directory: "", checksumkind: CSK_MD5, checksum: "2a1ac901d8db5ef891d901275c66dbab")
!22 = !{!23, !29, !30, !31}
!23 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !20, file: !21, line: 1180, baseType: !24, size: 32)
!24 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !25, line: 26, baseType: !26)
!25 = !DIFile(filename: "/usr/include/bits/stdint-uintn.h", directory: "", checksumkind: CSK_MD5, checksum: "4ecee94d7257cd86659727d06a979b60")
!26 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !27, line: 42, baseType: !28)
!27 = !DIFile(filename: "/usr/include/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "4a64d909bcfa62a0a7682c3ac78c6965")
!28 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!29 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !20, file: !21, line: 1181, baseType: !24, size: 32, offset: 32)
!30 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !20, file: !21, line: 1182, baseType: !24, size: 32, offset: 64)
!31 = !DISubprogram(name: "dim3", scope: !20, file: !21, line: 1184, type: !32, scopeLine: 1184, flags: DIFlagPrototyped, spFlags: 0)
!32 = !DISubroutineType(types: !33)
!33 = !{null, !34, !24, !24, !24}
!34 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!35 = !{!0}
!36 = !{!37, !44, !51, !53, !55, !59, !61, !63, !65, !67, !69, !71, !73, !78, !82, !84, !86, !91, !93, !95, !97, !99, !101, !103, !106, !108, !110, !114, !119, !121, !123, !125, !127, !129, !131, !133, !135, !137, !139, !143, !147, !149, !151, !153, !155, !157, !159, !161, !163, !165, !167, !169, !171, !173, !175, !177, !181, !185, !189, !191, !193, !195, !197, !199, !201, !203, !205, !207, !211, !215, !219, !221, !223, !225, !230, !234, !238, !240, !242, !244, !246, !248, !250, !252, !254, !256, !258, !260, !262, !267, !271, !275, !277, !279, !281, !285, !289, !293, !295, !297, !299, !301, !303, !305, !309, !313, !315, !317, !319, !321, !325, !329, !333, !335, !337, !339, !341, !343, !345, !349, !353, !357, !359, !363, !367, !369, !371, !373, !375, !377, !379, !383, !387, !393, !397, !405, !410, !412, !414, !418, !422, !432, !434, !438, !442, !446, !451, !455, !459, !463, !467, !474, !478, !482, !484, !488, !492, !496, !502, !506, !510, !512, !520, !524, !531, !533, !537, !541, !545, !549, !554, !558, !562, !563, !564, !565, !567, !568, !569, !570, !571, !572, !573, !575, !576, !577, !578, !579, !580, !581, !582, !587, !588, !589, !590, !591, !592, !593, !594, !595, !596, !597, !598, !599, !600, !601, !602, !603, !604, !605, !606, !607, !608, !609, !610, !611, !614, !616, !618, !620, !622, !624, !626, !628, !630, !632, !634, !636, !638, !640, !642, !644, !646, !648, !650, !652, !654, !656, !658, !660, !662, !664, !668, !670, !672, !677, !681, !683, !685, !687, !689, !691, !693, !695, !697, !699, !701, !703, !705, !707, !709, !711, !713, !715, !717, !719, !721, !723, !727, !729, !731, !733, !735, !737, !739, !741, !743, !745, !747, !749, !751, !753, !755, !757, !759, !761, !763, !765, !769, !771, !773, !775, !777, !779, !781, !783, !785, !787, !789, !791, !793, !795, !797, !799, !801, !803, !805, !807, !809, !811, !813, !815, !817, !819, !821, !823, !825, !827, !829, !831, !833, !837, !839, !841, !843, !845, !847, !849, !851, !853, !855, !857, !859, !861, !863, !865, !867, !869, !871, !873, !875, !877, !879, !883, !887, !892, !909, !912, !917, !925, !930, !934, !938, !942, !946, !948, !950, !954, !960, !964, !970, !976, !978, !982, !986, !990, !994, !1001, !1003, !1007, !1011, !1015, !1017, !1021, !1025, !1029, !1031, !1033, !1037, !1045, !1049, !1053, !1057, !1059, !1065, !1067, !1073, !1077, !1081, !1085, !1089, !1093, !1097, !1099, !1101, !1105, !1109, !1113, !1115, !1119, !1123, !1125, !1127, !1131, !1135, !1139, !1143, !1144, !1145, !1146, !1147, !1148, !1149, !1150, !1151, !1152, !1153, !1157, !1161, !1166, !1170, !1172, !1174, !1176, !1178, !1180, !1182, !1184, !1186, !1188, !1190, !1192, !1194, !1196, !1200, !1206, !1211, !1215, !1217, !1219, !1221, !1223, !1230, !1234, !1238, !1242, !1246, !1250, !1255, !1259, !1261, !1265, !1271, !1275, !1280, !1282, !1284, !1288, !1292, !1294, !1296, !1298, !1300, !1304, !1306, !1308, !1312, !1316, !1320, !1324, !1328, !1332, !1334, !1338, !1342, !1346, !1350, !1352, !1354, !1358, !1362, !1363, !1364, !1365, !1366, !1367, !1375, !1382, !1385, !1386, !1388, !1390, !1392, !1394, !1398, !1400, !1402, !1404, !1406, !1408, !1410, !1412, !1414, !1418, !1422, !1424, !1428, !1432, !1434, !1435, !1436, !1442, !1446, !1448, !1451, !1454, !1456, !1458, !1460, !1463, !1466, !1469, !1472, !1475, !1477, !1481, !1485, !1486, !1489, !1491, !1493, !1495, !1497, !1500, !1503, !1506, !1509, !1512, !1514, !1519, !1523, !1524, !1529, !1533, !1538, !1543, !1547, !1553, !1557, !1559, !1563, !1570, !1575}
!37 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !39, file: !43, line: 52)
!38 = !DINamespace(name: "std", scope: null)
!39 = !DISubprogram(name: "abs", scope: !40, file: !40, line: 980, type: !41, flags: DIFlagPrototyped, spFlags: 0)
!40 = !DIFile(filename: "/usr/include/stdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "761a239547e58b18c7327eb395f5cc1f")
!41 = !DISubroutineType(types: !42)
!42 = !{!16, !16}
!43 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/bits/std_abs.h", directory: "")
!44 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !45, file: !50, line: 85)
!45 = !DISubprogram(name: "acos", scope: !46, file: !46, line: 53, type: !47, flags: DIFlagPrototyped, spFlags: 0)
!46 = !DIFile(filename: "/usr/include/bits/mathcalls.h", directory: "", checksumkind: CSK_MD5, checksum: "a03d6e5877646e3ad0a8a5735f9e6f62")
!47 = !DISubroutineType(types: !48)
!48 = !{!49, !49}
!49 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!50 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/cmath", directory: "")
!51 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !52, file: !50, line: 104)
!52 = !DISubprogram(name: "asin", scope: !46, file: !46, line: 55, type: !47, flags: DIFlagPrototyped, spFlags: 0)
!53 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !54, file: !50, line: 123)
!54 = !DISubprogram(name: "atan", scope: !46, file: !46, line: 57, type: !47, flags: DIFlagPrototyped, spFlags: 0)
!55 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !56, file: !50, line: 142)
!56 = !DISubprogram(name: "atan2", scope: !46, file: !46, line: 59, type: !57, flags: DIFlagPrototyped, spFlags: 0)
!57 = !DISubroutineType(types: !58)
!58 = !{!49, !49, !49}
!59 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !60, file: !50, line: 154)
!60 = !DISubprogram(name: "ceil", scope: !46, file: !46, line: 159, type: !47, flags: DIFlagPrototyped, spFlags: 0)
!61 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !62, file: !50, line: 173)
!62 = !DISubprogram(name: "cos", scope: !46, file: !46, line: 62, type: !47, flags: DIFlagPrototyped, spFlags: 0)
!63 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !64, file: !50, line: 192)
!64 = !DISubprogram(name: "cosh", scope: !46, file: !46, line: 71, type: !47, flags: DIFlagPrototyped, spFlags: 0)
!65 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !66, file: !50, line: 211)
!66 = !DISubprogram(name: "exp", scope: !46, file: !46, line: 95, type: !47, flags: DIFlagPrototyped, spFlags: 0)
!67 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !68, file: !50, line: 230)
!68 = !DISubprogram(name: "fabs", scope: !46, file: !46, line: 162, type: !47, flags: DIFlagPrototyped, spFlags: 0)
!69 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !70, file: !50, line: 249)
!70 = !DISubprogram(name: "floor", scope: !46, file: !46, line: 165, type: !47, flags: DIFlagPrototyped, spFlags: 0)
!71 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !72, file: !50, line: 268)
!72 = !DISubprogram(name: "fmod", scope: !46, file: !46, line: 168, type: !57, flags: DIFlagPrototyped, spFlags: 0)
!73 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !74, file: !50, line: 280)
!74 = !DISubprogram(name: "frexp", scope: !46, file: !46, line: 98, type: !75, flags: DIFlagPrototyped, spFlags: 0)
!75 = !DISubroutineType(types: !76)
!76 = !{!49, !49, !77}
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!78 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !79, file: !50, line: 299)
!79 = !DISubprogram(name: "ldexp", scope: !46, file: !46, line: 101, type: !80, flags: DIFlagPrototyped, spFlags: 0)
!80 = !DISubroutineType(types: !81)
!81 = !{!49, !49, !16}
!82 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !83, file: !50, line: 318)
!83 = !DISubprogram(name: "log", scope: !46, file: !46, line: 104, type: !47, flags: DIFlagPrototyped, spFlags: 0)
!84 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !85, file: !50, line: 337)
!85 = !DISubprogram(name: "log10", scope: !46, file: !46, line: 107, type: !47, flags: DIFlagPrototyped, spFlags: 0)
!86 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !87, file: !50, line: 356)
!87 = !DISubprogram(name: "modf", scope: !46, file: !46, line: 110, type: !88, flags: DIFlagPrototyped, spFlags: 0)
!88 = !DISubroutineType(types: !89)
!89 = !{!49, !49, !90}
!90 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !49, size: 64)
!91 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !92, file: !50, line: 368)
!92 = !DISubprogram(name: "pow", scope: !46, file: !46, line: 140, type: !57, flags: DIFlagPrototyped, spFlags: 0)
!93 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !94, file: !50, line: 396)
!94 = !DISubprogram(name: "sin", scope: !46, file: !46, line: 64, type: !47, flags: DIFlagPrototyped, spFlags: 0)
!95 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !96, file: !50, line: 415)
!96 = !DISubprogram(name: "sinh", scope: !46, file: !46, line: 73, type: !47, flags: DIFlagPrototyped, spFlags: 0)
!97 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !98, file: !50, line: 434)
!98 = !DISubprogram(name: "sqrt", scope: !46, file: !46, line: 143, type: !47, flags: DIFlagPrototyped, spFlags: 0)
!99 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !100, file: !50, line: 453)
!100 = !DISubprogram(name: "tan", scope: !46, file: !46, line: 66, type: !47, flags: DIFlagPrototyped, spFlags: 0)
!101 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !102, file: !50, line: 472)
!102 = !DISubprogram(name: "tanh", scope: !46, file: !46, line: 75, type: !47, flags: DIFlagPrototyped, spFlags: 0)
!103 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !104, file: !50, line: 1881)
!104 = !DIDerivedType(tag: DW_TAG_typedef, name: "double_t", file: !105, line: 164, baseType: !49)
!105 = !DIFile(filename: "/usr/include/math.h", directory: "", checksumkind: CSK_MD5, checksum: "555a51fc91303a79e6e6a7bf2a303f79")
!106 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !107, file: !50, line: 1882)
!107 = !DIDerivedType(tag: DW_TAG_typedef, name: "float_t", file: !105, line: 163, baseType: !8)
!108 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !109, file: !50, line: 1885)
!109 = !DISubprogram(name: "acosh", scope: !46, file: !46, line: 85, type: !47, flags: DIFlagPrototyped, spFlags: 0)
!110 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !111, file: !50, line: 1886)
!111 = !DISubprogram(name: "acoshf", scope: !46, file: !46, line: 85, type: !112, flags: DIFlagPrototyped, spFlags: 0)
!112 = !DISubroutineType(types: !113)
!113 = !{!8, !8}
!114 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !115, file: !50, line: 1887)
!115 = !DISubprogram(name: "acoshl", scope: !46, file: !46, line: 85, type: !116, flags: DIFlagPrototyped, spFlags: 0)
!116 = !DISubroutineType(types: !117)
!117 = !{!118, !118}
!118 = !DIBasicType(name: "long double", size: 64, encoding: DW_ATE_float)
!119 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !120, file: !50, line: 1889)
!120 = !DISubprogram(name: "asinh", scope: !46, file: !46, line: 87, type: !47, flags: DIFlagPrototyped, spFlags: 0)
!121 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !122, file: !50, line: 1890)
!122 = !DISubprogram(name: "asinhf", scope: !46, file: !46, line: 87, type: !112, flags: DIFlagPrototyped, spFlags: 0)
!123 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !124, file: !50, line: 1891)
!124 = !DISubprogram(name: "asinhl", scope: !46, file: !46, line: 87, type: !116, flags: DIFlagPrototyped, spFlags: 0)
!125 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !126, file: !50, line: 1893)
!126 = !DISubprogram(name: "atanh", scope: !46, file: !46, line: 89, type: !47, flags: DIFlagPrototyped, spFlags: 0)
!127 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !128, file: !50, line: 1894)
!128 = !DISubprogram(name: "atanhf", scope: !46, file: !46, line: 89, type: !112, flags: DIFlagPrototyped, spFlags: 0)
!129 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !130, file: !50, line: 1895)
!130 = !DISubprogram(name: "atanhl", scope: !46, file: !46, line: 89, type: !116, flags: DIFlagPrototyped, spFlags: 0)
!131 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !132, file: !50, line: 1897)
!132 = !DISubprogram(name: "cbrt", scope: !46, file: !46, line: 152, type: !47, flags: DIFlagPrototyped, spFlags: 0)
!133 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !134, file: !50, line: 1898)
!134 = !DISubprogram(name: "cbrtf", scope: !46, file: !46, line: 152, type: !112, flags: DIFlagPrototyped, spFlags: 0)
!135 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !136, file: !50, line: 1899)
!136 = !DISubprogram(name: "cbrtl", scope: !46, file: !46, line: 152, type: !116, flags: DIFlagPrototyped, spFlags: 0)
!137 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !138, file: !50, line: 1901)
!138 = !DISubprogram(name: "copysign", scope: !46, file: !46, line: 198, type: !57, flags: DIFlagPrototyped, spFlags: 0)
!139 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !140, file: !50, line: 1902)
!140 = !DISubprogram(name: "copysignf", scope: !46, file: !46, line: 198, type: !141, flags: DIFlagPrototyped, spFlags: 0)
!141 = !DISubroutineType(types: !142)
!142 = !{!8, !8, !8}
!143 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !144, file: !50, line: 1903)
!144 = !DISubprogram(name: "copysignl", scope: !46, file: !46, line: 198, type: !145, flags: DIFlagPrototyped, spFlags: 0)
!145 = !DISubroutineType(types: !146)
!146 = !{!118, !118, !118}
!147 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !148, file: !50, line: 1905)
!148 = !DISubprogram(name: "erf", scope: !46, file: !46, line: 231, type: !47, flags: DIFlagPrototyped, spFlags: 0)
!149 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !150, file: !50, line: 1906)
!150 = !DISubprogram(name: "erff", scope: !46, file: !46, line: 231, type: !112, flags: DIFlagPrototyped, spFlags: 0)
!151 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !152, file: !50, line: 1907)
!152 = !DISubprogram(name: "erfl", scope: !46, file: !46, line: 231, type: !116, flags: DIFlagPrototyped, spFlags: 0)
!153 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !154, file: !50, line: 1909)
!154 = !DISubprogram(name: "erfc", scope: !46, file: !46, line: 232, type: !47, flags: DIFlagPrototyped, spFlags: 0)
!155 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !156, file: !50, line: 1910)
!156 = !DISubprogram(name: "erfcf", scope: !46, file: !46, line: 232, type: !112, flags: DIFlagPrototyped, spFlags: 0)
!157 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !158, file: !50, line: 1911)
!158 = !DISubprogram(name: "erfcl", scope: !46, file: !46, line: 232, type: !116, flags: DIFlagPrototyped, spFlags: 0)
!159 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !160, file: !50, line: 1913)
!160 = !DISubprogram(name: "exp2", scope: !46, file: !46, line: 130, type: !47, flags: DIFlagPrototyped, spFlags: 0)
!161 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !162, file: !50, line: 1914)
!162 = !DISubprogram(name: "exp2f", scope: !46, file: !46, line: 130, type: !112, flags: DIFlagPrototyped, spFlags: 0)
!163 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !164, file: !50, line: 1915)
!164 = !DISubprogram(name: "exp2l", scope: !46, file: !46, line: 130, type: !116, flags: DIFlagPrototyped, spFlags: 0)
!165 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !166, file: !50, line: 1917)
!166 = !DISubprogram(name: "expm1", scope: !46, file: !46, line: 119, type: !47, flags: DIFlagPrototyped, spFlags: 0)
!167 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !168, file: !50, line: 1918)
!168 = !DISubprogram(name: "expm1f", scope: !46, file: !46, line: 119, type: !112, flags: DIFlagPrototyped, spFlags: 0)
!169 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !170, file: !50, line: 1919)
!170 = !DISubprogram(name: "expm1l", scope: !46, file: !46, line: 119, type: !116, flags: DIFlagPrototyped, spFlags: 0)
!171 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !172, file: !50, line: 1921)
!172 = !DISubprogram(name: "fdim", scope: !46, file: !46, line: 329, type: !57, flags: DIFlagPrototyped, spFlags: 0)
!173 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !174, file: !50, line: 1922)
!174 = !DISubprogram(name: "fdimf", scope: !46, file: !46, line: 329, type: !141, flags: DIFlagPrototyped, spFlags: 0)
!175 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !176, file: !50, line: 1923)
!176 = !DISubprogram(name: "fdiml", scope: !46, file: !46, line: 329, type: !145, flags: DIFlagPrototyped, spFlags: 0)
!177 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !178, file: !50, line: 1925)
!178 = !DISubprogram(name: "fma", scope: !46, file: !46, line: 340, type: !179, flags: DIFlagPrototyped, spFlags: 0)
!179 = !DISubroutineType(types: !180)
!180 = !{!49, !49, !49, !49}
!181 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !182, file: !50, line: 1926)
!182 = !DISubprogram(name: "fmaf", scope: !46, file: !46, line: 340, type: !183, flags: DIFlagPrototyped, spFlags: 0)
!183 = !DISubroutineType(types: !184)
!184 = !{!8, !8, !8, !8}
!185 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !186, file: !50, line: 1927)
!186 = !DISubprogram(name: "fmal", scope: !46, file: !46, line: 340, type: !187, flags: DIFlagPrototyped, spFlags: 0)
!187 = !DISubroutineType(types: !188)
!188 = !{!118, !118, !118, !118}
!189 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !190, file: !50, line: 1929)
!190 = !DISubprogram(name: "fmax", scope: !46, file: !46, line: 333, type: !57, flags: DIFlagPrototyped, spFlags: 0)
!191 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !192, file: !50, line: 1930)
!192 = !DISubprogram(name: "fmaxf", scope: !46, file: !46, line: 333, type: !141, flags: DIFlagPrototyped, spFlags: 0)
!193 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !194, file: !50, line: 1931)
!194 = !DISubprogram(name: "fmaxl", scope: !46, file: !46, line: 333, type: !145, flags: DIFlagPrototyped, spFlags: 0)
!195 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !196, file: !50, line: 1933)
!196 = !DISubprogram(name: "fmin", scope: !46, file: !46, line: 336, type: !57, flags: DIFlagPrototyped, spFlags: 0)
!197 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !198, file: !50, line: 1934)
!198 = !DISubprogram(name: "fminf", scope: !46, file: !46, line: 336, type: !141, flags: DIFlagPrototyped, spFlags: 0)
!199 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !200, file: !50, line: 1935)
!200 = !DISubprogram(name: "fminl", scope: !46, file: !46, line: 336, type: !145, flags: DIFlagPrototyped, spFlags: 0)
!201 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !202, file: !50, line: 1937)
!202 = !DISubprogram(name: "hypot", scope: !46, file: !46, line: 147, type: !57, flags: DIFlagPrototyped, spFlags: 0)
!203 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !204, file: !50, line: 1938)
!204 = !DISubprogram(name: "hypotf", scope: !46, file: !46, line: 147, type: !141, flags: DIFlagPrototyped, spFlags: 0)
!205 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !206, file: !50, line: 1939)
!206 = !DISubprogram(name: "hypotl", scope: !46, file: !46, line: 147, type: !145, flags: DIFlagPrototyped, spFlags: 0)
!207 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !208, file: !50, line: 1941)
!208 = !DISubprogram(name: "ilogb", scope: !46, file: !46, line: 283, type: !209, flags: DIFlagPrototyped, spFlags: 0)
!209 = !DISubroutineType(types: !210)
!210 = !{!16, !49}
!211 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !212, file: !50, line: 1942)
!212 = !DISubprogram(name: "ilogbf", scope: !46, file: !46, line: 283, type: !213, flags: DIFlagPrototyped, spFlags: 0)
!213 = !DISubroutineType(types: !214)
!214 = !{!16, !8}
!215 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !216, file: !50, line: 1943)
!216 = !DISubprogram(name: "ilogbl", scope: !46, file: !46, line: 283, type: !217, flags: DIFlagPrototyped, spFlags: 0)
!217 = !DISubroutineType(types: !218)
!218 = !{!16, !118}
!219 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !220, file: !50, line: 1945)
!220 = !DISubprogram(name: "lgamma", scope: !46, file: !46, line: 233, type: !47, flags: DIFlagPrototyped, spFlags: 0)
!221 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !222, file: !50, line: 1946)
!222 = !DISubprogram(name: "lgammaf", scope: !46, file: !46, line: 233, type: !112, flags: DIFlagPrototyped, spFlags: 0)
!223 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !224, file: !50, line: 1947)
!224 = !DISubprogram(name: "lgammal", scope: !46, file: !46, line: 233, type: !116, flags: DIFlagPrototyped, spFlags: 0)
!225 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !226, file: !50, line: 1950)
!226 = !DISubprogram(name: "llrint", scope: !46, file: !46, line: 319, type: !227, flags: DIFlagPrototyped, spFlags: 0)
!227 = !DISubroutineType(types: !228)
!228 = !{!229, !49}
!229 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!230 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !231, file: !50, line: 1951)
!231 = !DISubprogram(name: "llrintf", scope: !46, file: !46, line: 319, type: !232, flags: DIFlagPrototyped, spFlags: 0)
!232 = !DISubroutineType(types: !233)
!233 = !{!229, !8}
!234 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !235, file: !50, line: 1952)
!235 = !DISubprogram(name: "llrintl", scope: !46, file: !46, line: 319, type: !236, flags: DIFlagPrototyped, spFlags: 0)
!236 = !DISubroutineType(types: !237)
!237 = !{!229, !118}
!238 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !239, file: !50, line: 1954)
!239 = !DISubprogram(name: "llround", scope: !46, file: !46, line: 325, type: !227, flags: DIFlagPrototyped, spFlags: 0)
!240 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !241, file: !50, line: 1955)
!241 = !DISubprogram(name: "llroundf", scope: !46, file: !46, line: 325, type: !232, flags: DIFlagPrototyped, spFlags: 0)
!242 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !243, file: !50, line: 1956)
!243 = !DISubprogram(name: "llroundl", scope: !46, file: !46, line: 325, type: !236, flags: DIFlagPrototyped, spFlags: 0)
!244 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !245, file: !50, line: 1959)
!245 = !DISubprogram(name: "log1p", scope: !46, file: !46, line: 122, type: !47, flags: DIFlagPrototyped, spFlags: 0)
!246 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !247, file: !50, line: 1960)
!247 = !DISubprogram(name: "log1pf", scope: !46, file: !46, line: 122, type: !112, flags: DIFlagPrototyped, spFlags: 0)
!248 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !249, file: !50, line: 1961)
!249 = !DISubprogram(name: "log1pl", scope: !46, file: !46, line: 122, type: !116, flags: DIFlagPrototyped, spFlags: 0)
!250 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !251, file: !50, line: 1963)
!251 = !DISubprogram(name: "log2", scope: !46, file: !46, line: 133, type: !47, flags: DIFlagPrototyped, spFlags: 0)
!252 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !253, file: !50, line: 1964)
!253 = !DISubprogram(name: "log2f", scope: !46, file: !46, line: 133, type: !112, flags: DIFlagPrototyped, spFlags: 0)
!254 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !255, file: !50, line: 1965)
!255 = !DISubprogram(name: "log2l", scope: !46, file: !46, line: 133, type: !116, flags: DIFlagPrototyped, spFlags: 0)
!256 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !257, file: !50, line: 1967)
!257 = !DISubprogram(name: "logb", scope: !46, file: !46, line: 125, type: !47, flags: DIFlagPrototyped, spFlags: 0)
!258 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !259, file: !50, line: 1968)
!259 = !DISubprogram(name: "logbf", scope: !46, file: !46, line: 125, type: !112, flags: DIFlagPrototyped, spFlags: 0)
!260 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !261, file: !50, line: 1969)
!261 = !DISubprogram(name: "logbl", scope: !46, file: !46, line: 125, type: !116, flags: DIFlagPrototyped, spFlags: 0)
!262 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !263, file: !50, line: 1971)
!263 = !DISubprogram(name: "lrint", scope: !46, file: !46, line: 317, type: !264, flags: DIFlagPrototyped, spFlags: 0)
!264 = !DISubroutineType(types: !265)
!265 = !{!266, !49}
!266 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!267 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !268, file: !50, line: 1972)
!268 = !DISubprogram(name: "lrintf", scope: !46, file: !46, line: 317, type: !269, flags: DIFlagPrototyped, spFlags: 0)
!269 = !DISubroutineType(types: !270)
!270 = !{!266, !8}
!271 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !272, file: !50, line: 1973)
!272 = !DISubprogram(name: "lrintl", scope: !46, file: !46, line: 317, type: !273, flags: DIFlagPrototyped, spFlags: 0)
!273 = !DISubroutineType(types: !274)
!274 = !{!266, !118}
!275 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !276, file: !50, line: 1975)
!276 = !DISubprogram(name: "lround", scope: !46, file: !46, line: 323, type: !264, flags: DIFlagPrototyped, spFlags: 0)
!277 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !278, file: !50, line: 1976)
!278 = !DISubprogram(name: "lroundf", scope: !46, file: !46, line: 323, type: !269, flags: DIFlagPrototyped, spFlags: 0)
!279 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !280, file: !50, line: 1977)
!280 = !DISubprogram(name: "lroundl", scope: !46, file: !46, line: 323, type: !273, flags: DIFlagPrototyped, spFlags: 0)
!281 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !282, file: !50, line: 1979)
!282 = !DISubprogram(name: "nan", scope: !46, file: !46, line: 203, type: !283, flags: DIFlagPrototyped, spFlags: 0)
!283 = !DISubroutineType(types: !284)
!284 = !{!49, !10}
!285 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !286, file: !50, line: 1980)
!286 = !DISubprogram(name: "nanf", scope: !46, file: !46, line: 203, type: !287, flags: DIFlagPrototyped, spFlags: 0)
!287 = !DISubroutineType(types: !288)
!288 = !{!8, !10}
!289 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !290, file: !50, line: 1981)
!290 = !DISubprogram(name: "nanl", scope: !46, file: !46, line: 203, type: !291, flags: DIFlagPrototyped, spFlags: 0)
!291 = !DISubroutineType(types: !292)
!292 = !{!118, !10}
!293 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !294, file: !50, line: 1983)
!294 = !DISubprogram(name: "nearbyint", scope: !46, file: !46, line: 297, type: !47, flags: DIFlagPrototyped, spFlags: 0)
!295 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !296, file: !50, line: 1984)
!296 = !DISubprogram(name: "nearbyintf", scope: !46, file: !46, line: 297, type: !112, flags: DIFlagPrototyped, spFlags: 0)
!297 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !298, file: !50, line: 1985)
!298 = !DISubprogram(name: "nearbyintl", scope: !46, file: !46, line: 297, type: !116, flags: DIFlagPrototyped, spFlags: 0)
!299 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !300, file: !50, line: 1987)
!300 = !DISubprogram(name: "nextafter", scope: !46, file: !46, line: 262, type: !57, flags: DIFlagPrototyped, spFlags: 0)
!301 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !302, file: !50, line: 1988)
!302 = !DISubprogram(name: "nextafterf", scope: !46, file: !46, line: 262, type: !141, flags: DIFlagPrototyped, spFlags: 0)
!303 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !304, file: !50, line: 1989)
!304 = !DISubprogram(name: "nextafterl", scope: !46, file: !46, line: 262, type: !145, flags: DIFlagPrototyped, spFlags: 0)
!305 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !306, file: !50, line: 1991)
!306 = !DISubprogram(name: "nexttoward", scope: !46, file: !46, line: 264, type: !307, flags: DIFlagPrototyped, spFlags: 0)
!307 = !DISubroutineType(types: !308)
!308 = !{!49, !49, !118}
!309 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !310, file: !50, line: 1992)
!310 = !DISubprogram(name: "nexttowardf", scope: !46, file: !46, line: 264, type: !311, flags: DIFlagPrototyped, spFlags: 0)
!311 = !DISubroutineType(types: !312)
!312 = !{!8, !8, !118}
!313 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !314, file: !50, line: 1993)
!314 = !DISubprogram(name: "nexttowardl", scope: !46, file: !46, line: 264, type: !145, flags: DIFlagPrototyped, spFlags: 0)
!315 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !316, file: !50, line: 1995)
!316 = !DISubprogram(name: "remainder", scope: !46, file: !46, line: 275, type: !57, flags: DIFlagPrototyped, spFlags: 0)
!317 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !318, file: !50, line: 1996)
!318 = !DISubprogram(name: "remainderf", scope: !46, file: !46, line: 275, type: !141, flags: DIFlagPrototyped, spFlags: 0)
!319 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !320, file: !50, line: 1997)
!320 = !DISubprogram(name: "remainderl", scope: !46, file: !46, line: 275, type: !145, flags: DIFlagPrototyped, spFlags: 0)
!321 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !322, file: !50, line: 1999)
!322 = !DISubprogram(name: "remquo", scope: !46, file: !46, line: 310, type: !323, flags: DIFlagPrototyped, spFlags: 0)
!323 = !DISubroutineType(types: !324)
!324 = !{!49, !49, !49, !77}
!325 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !326, file: !50, line: 2000)
!326 = !DISubprogram(name: "remquof", scope: !46, file: !46, line: 310, type: !327, flags: DIFlagPrototyped, spFlags: 0)
!327 = !DISubroutineType(types: !328)
!328 = !{!8, !8, !8, !77}
!329 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !330, file: !50, line: 2001)
!330 = !DISubprogram(name: "remquol", scope: !46, file: !46, line: 310, type: !331, flags: DIFlagPrototyped, spFlags: 0)
!331 = !DISubroutineType(types: !332)
!332 = !{!118, !118, !118, !77}
!333 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !334, file: !50, line: 2003)
!334 = !DISubprogram(name: "rint", scope: !46, file: !46, line: 259, type: !47, flags: DIFlagPrototyped, spFlags: 0)
!335 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !336, file: !50, line: 2004)
!336 = !DISubprogram(name: "rintf", scope: !46, file: !46, line: 259, type: !112, flags: DIFlagPrototyped, spFlags: 0)
!337 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !338, file: !50, line: 2005)
!338 = !DISubprogram(name: "rintl", scope: !46, file: !46, line: 259, type: !116, flags: DIFlagPrototyped, spFlags: 0)
!339 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !340, file: !50, line: 2007)
!340 = !DISubprogram(name: "round", scope: !46, file: !46, line: 301, type: !47, flags: DIFlagPrototyped, spFlags: 0)
!341 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !342, file: !50, line: 2008)
!342 = !DISubprogram(name: "roundf", scope: !46, file: !46, line: 301, type: !112, flags: DIFlagPrototyped, spFlags: 0)
!343 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !344, file: !50, line: 2009)
!344 = !DISubprogram(name: "roundl", scope: !46, file: !46, line: 301, type: !116, flags: DIFlagPrototyped, spFlags: 0)
!345 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !346, file: !50, line: 2011)
!346 = !DISubprogram(name: "scalbln", scope: !46, file: !46, line: 293, type: !347, flags: DIFlagPrototyped, spFlags: 0)
!347 = !DISubroutineType(types: !348)
!348 = !{!49, !49, !266}
!349 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !350, file: !50, line: 2012)
!350 = !DISubprogram(name: "scalblnf", scope: !46, file: !46, line: 293, type: !351, flags: DIFlagPrototyped, spFlags: 0)
!351 = !DISubroutineType(types: !352)
!352 = !{!8, !8, !266}
!353 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !354, file: !50, line: 2013)
!354 = !DISubprogram(name: "scalblnl", scope: !46, file: !46, line: 293, type: !355, flags: DIFlagPrototyped, spFlags: 0)
!355 = !DISubroutineType(types: !356)
!356 = !{!118, !118, !266}
!357 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !358, file: !50, line: 2015)
!358 = !DISubprogram(name: "scalbn", scope: !46, file: !46, line: 279, type: !80, flags: DIFlagPrototyped, spFlags: 0)
!359 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !360, file: !50, line: 2016)
!360 = !DISubprogram(name: "scalbnf", scope: !46, file: !46, line: 279, type: !361, flags: DIFlagPrototyped, spFlags: 0)
!361 = !DISubroutineType(types: !362)
!362 = !{!8, !8, !16}
!363 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !364, file: !50, line: 2017)
!364 = !DISubprogram(name: "scalbnl", scope: !46, file: !46, line: 279, type: !365, flags: DIFlagPrototyped, spFlags: 0)
!365 = !DISubroutineType(types: !366)
!366 = !{!118, !118, !16}
!367 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !368, file: !50, line: 2019)
!368 = !DISubprogram(name: "tgamma", scope: !46, file: !46, line: 238, type: !47, flags: DIFlagPrototyped, spFlags: 0)
!369 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !370, file: !50, line: 2020)
!370 = !DISubprogram(name: "tgammaf", scope: !46, file: !46, line: 238, type: !112, flags: DIFlagPrototyped, spFlags: 0)
!371 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !372, file: !50, line: 2021)
!372 = !DISubprogram(name: "tgammal", scope: !46, file: !46, line: 238, type: !116, flags: DIFlagPrototyped, spFlags: 0)
!373 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !374, file: !50, line: 2023)
!374 = !DISubprogram(name: "trunc", scope: !46, file: !46, line: 305, type: !47, flags: DIFlagPrototyped, spFlags: 0)
!375 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !376, file: !50, line: 2024)
!376 = !DISubprogram(name: "truncf", scope: !46, file: !46, line: 305, type: !112, flags: DIFlagPrototyped, spFlags: 0)
!377 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !378, file: !50, line: 2025)
!378 = !DISubprogram(name: "truncl", scope: !46, file: !46, line: 305, type: !116, flags: DIFlagPrototyped, spFlags: 0)
!379 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !380, entity: !381, file: !382, line: 58)
!380 = !DINamespace(name: "__gnu_debug", scope: null)
!381 = !DINamespace(name: "__debug", scope: !38)
!382 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/debug/debug.h", directory: "", checksumkind: CSK_MD5, checksum: "752210a319f5f5d356cc29cd1ce3cdc7")
!383 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !384, file: !386, line: 131)
!384 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !40, line: 63, baseType: !385)
!385 = !DICompositeType(tag: DW_TAG_structure_type, file: !40, line: 59, size: 64, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!386 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/cstdlib", directory: "")
!387 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !388, file: !386, line: 132)
!388 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !40, line: 71, baseType: !389)
!389 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !40, line: 67, size: 128, flags: DIFlagTypePassByValue, elements: !390, identifier: "_ZTS6ldiv_t")
!390 = !{!391, !392}
!391 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !389, file: !40, line: 69, baseType: !266, size: 64)
!392 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !389, file: !40, line: 70, baseType: !266, size: 64, offset: 64)
!393 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !394, file: !386, line: 134)
!394 = !DISubprogram(name: "abort", scope: !40, file: !40, line: 730, type: !395, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!395 = !DISubroutineType(types: !396)
!396 = !{null}
!397 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !398, file: !386, line: 136)
!398 = !DISubprogram(name: "aligned_alloc", scope: !40, file: !40, line: 724, type: !399, flags: DIFlagPrototyped, spFlags: 0)
!399 = !DISubroutineType(types: !400)
!400 = !{!401, !402, !402}
!401 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!402 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !403, line: 18, baseType: !404)
!403 = !DIFile(filename: "/opt/rocm-6.4.2/lib/llvm/lib/clang/19/include/__stddef_size_t.h", directory: "", checksumkind: CSK_MD5, checksum: "2c44e821a2b1951cde2eb0fb2e656867")
!404 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!405 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !406, file: !386, line: 138)
!406 = !DISubprogram(name: "atexit", scope: !40, file: !40, line: 734, type: !407, flags: DIFlagPrototyped, spFlags: 0)
!407 = !DISubroutineType(types: !408)
!408 = !{!16, !409}
!409 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !395, size: 64)
!410 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !411, file: !386, line: 141)
!411 = !DISubprogram(name: "at_quick_exit", scope: !40, file: !40, line: 739, type: !407, flags: DIFlagPrototyped, spFlags: 0)
!412 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !413, file: !386, line: 144)
!413 = !DISubprogram(name: "atof", scope: !40, file: !40, line: 102, type: !283, flags: DIFlagPrototyped, spFlags: 0)
!414 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !415, file: !386, line: 145)
!415 = !DISubprogram(name: "atoi", scope: !40, file: !40, line: 105, type: !416, flags: DIFlagPrototyped, spFlags: 0)
!416 = !DISubroutineType(types: !417)
!417 = !{!16, !10}
!418 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !419, file: !386, line: 146)
!419 = !DISubprogram(name: "atol", scope: !40, file: !40, line: 108, type: !420, flags: DIFlagPrototyped, spFlags: 0)
!420 = !DISubroutineType(types: !421)
!421 = !{!266, !10}
!422 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !423, file: !386, line: 147)
!423 = !DISubprogram(name: "bsearch", scope: !40, file: !40, line: 960, type: !424, flags: DIFlagPrototyped, spFlags: 0)
!424 = !DISubroutineType(types: !425)
!425 = !{!401, !426, !426, !402, !402, !428}
!426 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !427, size: 64)
!427 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!428 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !40, line: 948, baseType: !429)
!429 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !430, size: 64)
!430 = !DISubroutineType(types: !431)
!431 = !{!16, !426, !426}
!432 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !433, file: !386, line: 148)
!433 = !DISubprogram(name: "calloc", scope: !40, file: !40, line: 675, type: !399, flags: DIFlagPrototyped, spFlags: 0)
!434 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !435, file: !386, line: 149)
!435 = !DISubprogram(name: "div", scope: !40, file: !40, line: 992, type: !436, flags: DIFlagPrototyped, spFlags: 0)
!436 = !DISubroutineType(types: !437)
!437 = !{!384, !16, !16}
!438 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !439, file: !386, line: 150)
!439 = !DISubprogram(name: "exit", scope: !40, file: !40, line: 756, type: !440, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!440 = !DISubroutineType(types: !441)
!441 = !{null, !16}
!442 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !443, file: !386, line: 151)
!443 = !DISubprogram(name: "free", scope: !40, file: !40, line: 687, type: !444, flags: DIFlagPrototyped, spFlags: 0)
!444 = !DISubroutineType(types: !445)
!445 = !{null, !401}
!446 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !447, file: !386, line: 152)
!447 = !DISubprogram(name: "getenv", scope: !40, file: !40, line: 773, type: !448, flags: DIFlagPrototyped, spFlags: 0)
!448 = !DISubroutineType(types: !449)
!449 = !{!450, !10}
!450 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!451 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !452, file: !386, line: 153)
!452 = !DISubprogram(name: "labs", scope: !40, file: !40, line: 981, type: !453, flags: DIFlagPrototyped, spFlags: 0)
!453 = !DISubroutineType(types: !454)
!454 = !{!266, !266}
!455 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !456, file: !386, line: 154)
!456 = !DISubprogram(name: "ldiv", scope: !40, file: !40, line: 994, type: !457, flags: DIFlagPrototyped, spFlags: 0)
!457 = !DISubroutineType(types: !458)
!458 = !{!388, !266, !266}
!459 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !460, file: !386, line: 155)
!460 = !DISubprogram(name: "malloc", scope: !40, file: !40, line: 672, type: !461, flags: DIFlagPrototyped, spFlags: 0)
!461 = !DISubroutineType(types: !462)
!462 = !{!401, !402}
!463 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !464, file: !386, line: 157)
!464 = !DISubprogram(name: "mblen", scope: !40, file: !40, line: 1062, type: !465, flags: DIFlagPrototyped, spFlags: 0)
!465 = !DISubroutineType(types: !466)
!466 = !{!16, !10, !402}
!467 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !468, file: !386, line: 158)
!468 = !DISubprogram(name: "mbstowcs", scope: !40, file: !40, line: 1073, type: !469, flags: DIFlagPrototyped, spFlags: 0)
!469 = !DISubroutineType(types: !470)
!470 = !{!402, !471, !9, !402}
!471 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !472)
!472 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !473, size: 64)
!473 = !DIBasicType(name: "wchar_t", size: 32, encoding: DW_ATE_signed)
!474 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !475, file: !386, line: 159)
!475 = !DISubprogram(name: "mbtowc", scope: !40, file: !40, line: 1065, type: !476, flags: DIFlagPrototyped, spFlags: 0)
!476 = !DISubroutineType(types: !477)
!477 = !{!16, !471, !9, !402}
!478 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !479, file: !386, line: 161)
!479 = !DISubprogram(name: "qsort", scope: !40, file: !40, line: 970, type: !480, flags: DIFlagPrototyped, spFlags: 0)
!480 = !DISubroutineType(types: !481)
!481 = !{null, !401, !402, !402, !428}
!482 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !483, file: !386, line: 164)
!483 = !DISubprogram(name: "quick_exit", scope: !40, file: !40, line: 762, type: !440, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!484 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !485, file: !386, line: 167)
!485 = !DISubprogram(name: "rand", scope: !40, file: !40, line: 573, type: !486, flags: DIFlagPrototyped, spFlags: 0)
!486 = !DISubroutineType(types: !487)
!487 = !{!16}
!488 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !489, file: !386, line: 168)
!489 = !DISubprogram(name: "realloc", scope: !40, file: !40, line: 683, type: !490, flags: DIFlagPrototyped, spFlags: 0)
!490 = !DISubroutineType(types: !491)
!491 = !{!401, !401, !402}
!492 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !493, file: !386, line: 169)
!493 = !DISubprogram(name: "srand", scope: !40, file: !40, line: 575, type: !494, flags: DIFlagPrototyped, spFlags: 0)
!494 = !DISubroutineType(types: !495)
!495 = !{null, !28}
!496 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !497, file: !386, line: 170)
!497 = !DISubprogram(name: "strtod", scope: !40, file: !40, line: 118, type: !498, flags: DIFlagPrototyped, spFlags: 0)
!498 = !DISubroutineType(types: !499)
!499 = !{!49, !9, !500}
!500 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !501)
!501 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !450, size: 64)
!502 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !503, file: !386, line: 171)
!503 = !DISubprogram(name: "strtol", linkageName: "__isoc23_strtol", scope: !40, file: !40, line: 215, type: !504, flags: DIFlagPrototyped, spFlags: 0)
!504 = !DISubroutineType(types: !505)
!505 = !{!266, !9, !500, !16}
!506 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !507, file: !386, line: 172)
!507 = !DISubprogram(name: "strtoul", linkageName: "__isoc23_strtoul", scope: !40, file: !40, line: 219, type: !508, flags: DIFlagPrototyped, spFlags: 0)
!508 = !DISubroutineType(types: !509)
!509 = !{!404, !9, !500, !16}
!510 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !511, file: !386, line: 173)
!511 = !DISubprogram(name: "system", scope: !40, file: !40, line: 923, type: !416, flags: DIFlagPrototyped, spFlags: 0)
!512 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !513, file: !386, line: 175)
!513 = !DISubprogram(name: "wcstombs", scope: !40, file: !40, line: 1077, type: !514, flags: DIFlagPrototyped, spFlags: 0)
!514 = !DISubroutineType(types: !515)
!515 = !{!402, !516, !517, !402}
!516 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !450)
!517 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !518)
!518 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !519, size: 64)
!519 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !473)
!520 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !521, file: !386, line: 176)
!521 = !DISubprogram(name: "wctomb", scope: !40, file: !40, line: 1069, type: !522, flags: DIFlagPrototyped, spFlags: 0)
!522 = !DISubroutineType(types: !523)
!523 = !{!16, !450, !473}
!524 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !525, entity: !526, file: !386, line: 204)
!525 = !DINamespace(name: "__gnu_cxx", scope: null)
!526 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !40, line: 81, baseType: !527)
!527 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !40, line: 77, size: 128, flags: DIFlagTypePassByValue, elements: !528, identifier: "_ZTS7lldiv_t")
!528 = !{!529, !530}
!529 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !527, file: !40, line: 79, baseType: !229, size: 64)
!530 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !527, file: !40, line: 80, baseType: !229, size: 64, offset: 64)
!531 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !525, entity: !532, file: !386, line: 210)
!532 = !DISubprogram(name: "_Exit", scope: !40, file: !40, line: 768, type: !440, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!533 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !525, entity: !534, file: !386, line: 214)
!534 = !DISubprogram(name: "llabs", scope: !40, file: !40, line: 984, type: !535, flags: DIFlagPrototyped, spFlags: 0)
!535 = !DISubroutineType(types: !536)
!536 = !{!229, !229}
!537 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !525, entity: !538, file: !386, line: 220)
!538 = !DISubprogram(name: "lldiv", scope: !40, file: !40, line: 998, type: !539, flags: DIFlagPrototyped, spFlags: 0)
!539 = !DISubroutineType(types: !540)
!540 = !{!526, !229, !229}
!541 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !525, entity: !542, file: !386, line: 231)
!542 = !DISubprogram(name: "atoll", scope: !40, file: !40, line: 113, type: !543, flags: DIFlagPrototyped, spFlags: 0)
!543 = !DISubroutineType(types: !544)
!544 = !{!229, !10}
!545 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !525, entity: !546, file: !386, line: 232)
!546 = !DISubprogram(name: "strtoll", linkageName: "__isoc23_strtoll", scope: !40, file: !40, line: 238, type: !547, flags: DIFlagPrototyped, spFlags: 0)
!547 = !DISubroutineType(types: !548)
!548 = !{!229, !9, !500, !16}
!549 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !525, entity: !550, file: !386, line: 233)
!550 = !DISubprogram(name: "strtoull", linkageName: "__isoc23_strtoull", scope: !40, file: !40, line: 243, type: !551, flags: DIFlagPrototyped, spFlags: 0)
!551 = !DISubroutineType(types: !552)
!552 = !{!553, !9, !500, !16}
!553 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!554 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !525, entity: !555, file: !386, line: 235)
!555 = !DISubprogram(name: "strtof", scope: !40, file: !40, line: 124, type: !556, flags: DIFlagPrototyped, spFlags: 0)
!556 = !DISubroutineType(types: !557)
!557 = !{!8, !9, !500}
!558 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !525, entity: !559, file: !386, line: 236)
!559 = !DISubprogram(name: "strtold", scope: !40, file: !40, line: 127, type: !560, flags: DIFlagPrototyped, spFlags: 0)
!560 = !DISubroutineType(types: !561)
!561 = !{!118, !9, !500}
!562 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !526, file: !386, line: 244)
!563 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !532, file: !386, line: 246)
!564 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !534, file: !386, line: 248)
!565 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !566, file: !386, line: 249)
!566 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !525, file: !386, line: 217, type: !539, flags: DIFlagPrototyped, spFlags: 0)
!567 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !538, file: !386, line: 250)
!568 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !542, file: !386, line: 252)
!569 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !555, file: !386, line: 253)
!570 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !546, file: !386, line: 254)
!571 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !550, file: !386, line: 255)
!572 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !559, file: !386, line: 256)
!573 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !394, file: !574, line: 38)
!574 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/stdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "3f24ff2a8eef595875da96e5466bd4aa")
!575 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !406, file: !574, line: 39)
!576 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !439, file: !574, line: 40)
!577 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !411, file: !574, line: 43)
!578 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !483, file: !574, line: 46)
!579 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !532, file: !574, line: 49)
!580 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !384, file: !574, line: 54)
!581 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !388, file: !574, line: 55)
!582 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !583, file: !574, line: 57)
!583 = !DISubprogram(name: "abs", linkageName: "_ZSt3absn", scope: !38, file: !43, line: 85, type: !584, flags: DIFlagPrototyped, spFlags: 0)
!584 = !DISubroutineType(types: !585)
!585 = !{!586, !586}
!586 = !DIBasicType(name: "__int128", size: 128, encoding: DW_ATE_signed)
!587 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !413, file: !574, line: 58)
!588 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !415, file: !574, line: 59)
!589 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !419, file: !574, line: 60)
!590 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !423, file: !574, line: 61)
!591 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !433, file: !574, line: 62)
!592 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !566, file: !574, line: 63)
!593 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !443, file: !574, line: 64)
!594 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !447, file: !574, line: 65)
!595 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !452, file: !574, line: 66)
!596 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !456, file: !574, line: 67)
!597 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !460, file: !574, line: 68)
!598 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !464, file: !574, line: 70)
!599 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !468, file: !574, line: 71)
!600 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !475, file: !574, line: 72)
!601 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !479, file: !574, line: 74)
!602 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !485, file: !574, line: 75)
!603 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !489, file: !574, line: 76)
!604 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !493, file: !574, line: 77)
!605 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !497, file: !574, line: 78)
!606 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !503, file: !574, line: 79)
!607 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !507, file: !574, line: 80)
!608 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !511, file: !574, line: 81)
!609 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !513, file: !574, line: 83)
!610 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !521, file: !574, line: 84)
!611 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !612, file: !613, line: 200)
!612 = !DISubprogram(name: "abs", linkageName: "_ZL3absd", scope: !613, file: !613, line: 28, type: !47, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!613 = !DIFile(filename: "/opt/rocm-6.4.2/lib/llvm/lib/clang/19/include/__clang_cuda_math_forward_declares.h", directory: "", checksumkind: CSK_MD5, checksum: "7fcaa66c0bf1529fc7d2359f3dc2dd30")
!614 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !615, file: !613, line: 201)
!615 = !DISubprogram(name: "acos", linkageName: "_ZL4acosf", scope: !613, file: !613, line: 32, type: !112, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!616 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !617, file: !613, line: 202)
!617 = !DISubprogram(name: "acosh", linkageName: "_ZL5acoshf", scope: !613, file: !613, line: 34, type: !112, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!618 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !619, file: !613, line: 203)
!619 = !DISubprogram(name: "asin", linkageName: "_ZL4asinf", scope: !613, file: !613, line: 36, type: !112, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!620 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !621, file: !613, line: 204)
!621 = !DISubprogram(name: "asinh", linkageName: "_ZL5asinhf", scope: !613, file: !613, line: 38, type: !112, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!622 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !623, file: !613, line: 205)
!623 = !DISubprogram(name: "atan", linkageName: "_ZL4atanf", scope: !613, file: !613, line: 42, type: !112, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!624 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !625, file: !613, line: 206)
!625 = !DISubprogram(name: "atan2", linkageName: "_ZL5atan2ff", scope: !613, file: !613, line: 40, type: !141, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!626 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !627, file: !613, line: 207)
!627 = !DISubprogram(name: "atanh", linkageName: "_ZL5atanhf", scope: !613, file: !613, line: 44, type: !112, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!628 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !629, file: !613, line: 208)
!629 = !DISubprogram(name: "cbrt", linkageName: "_ZL4cbrtf", scope: !613, file: !613, line: 46, type: !112, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!630 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !631, file: !613, line: 209)
!631 = !DISubprogram(name: "ceil", linkageName: "_ZL4ceilf", scope: !613, file: !613, line: 48, type: !112, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!632 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !633, file: !613, line: 210)
!633 = !DISubprogram(name: "copysign", linkageName: "_ZL8copysignff", scope: !613, file: !613, line: 50, type: !141, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!634 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !635, file: !613, line: 211)
!635 = !DISubprogram(name: "cos", linkageName: "_ZL3cosf", scope: !613, file: !613, line: 52, type: !112, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!636 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !637, file: !613, line: 212)
!637 = !DISubprogram(name: "cosh", linkageName: "_ZL4coshf", scope: !613, file: !613, line: 54, type: !112, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!638 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !639, file: !613, line: 213)
!639 = !DISubprogram(name: "erf", linkageName: "_ZL3erff", scope: !613, file: !613, line: 58, type: !112, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!640 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !641, file: !613, line: 214)
!641 = !DISubprogram(name: "erfc", linkageName: "_ZL4erfcf", scope: !613, file: !613, line: 56, type: !112, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!642 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !643, file: !613, line: 215)
!643 = !DISubprogram(name: "exp", linkageName: "_ZL3expf", scope: !613, file: !613, line: 62, type: !112, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!644 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !645, file: !613, line: 216)
!645 = !DISubprogram(name: "exp2", linkageName: "_ZL4exp2f", scope: !613, file: !613, line: 60, type: !112, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!646 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !647, file: !613, line: 217)
!647 = !DISubprogram(name: "expm1", linkageName: "_ZL5expm1f", scope: !613, file: !613, line: 64, type: !112, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!648 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !649, file: !613, line: 218)
!649 = !DISubprogram(name: "fabs", linkageName: "_ZL4fabsf", scope: !613, file: !613, line: 66, type: !112, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!650 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !651, file: !613, line: 219)
!651 = !DISubprogram(name: "fdim", linkageName: "_ZL4fdimff", scope: !613, file: !613, line: 68, type: !141, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!652 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !653, file: !613, line: 220)
!653 = !DISubprogram(name: "floor", linkageName: "_ZL5floorf", scope: !613, file: !613, line: 70, type: !112, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!654 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !655, file: !613, line: 221)
!655 = !DISubprogram(name: "fma", linkageName: "_ZL3fmafff", scope: !613, file: !613, line: 72, type: !183, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!656 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !657, file: !613, line: 222)
!657 = !DISubprogram(name: "fmax", linkageName: "_ZL4fmaxff", scope: !613, file: !613, line: 74, type: !141, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!658 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !659, file: !613, line: 223)
!659 = !DISubprogram(name: "fmin", linkageName: "_ZL4fminff", scope: !613, file: !613, line: 76, type: !141, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!660 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !661, file: !613, line: 224)
!661 = !DISubprogram(name: "fmod", linkageName: "_ZL4fmodff", scope: !613, file: !613, line: 78, type: !141, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!662 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !663, file: !613, line: 225)
!663 = !DISubprogram(name: "fpclassify", linkageName: "_ZL10fpclassifyf", scope: !613, file: !613, line: 80, type: !213, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!664 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !665, file: !613, line: 226)
!665 = !DISubprogram(name: "frexp", linkageName: "_ZL5frexpfPi", scope: !613, file: !613, line: 82, type: !666, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!666 = !DISubroutineType(types: !667)
!667 = !{!8, !8, !77}
!668 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !669, file: !613, line: 227)
!669 = !DISubprogram(name: "hypot", linkageName: "_ZL5hypotff", scope: !613, file: !613, line: 84, type: !141, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!670 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !671, file: !613, line: 228)
!671 = !DISubprogram(name: "ilogb", linkageName: "_ZL5ilogbf", scope: !613, file: !613, line: 86, type: !213, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!672 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !673, file: !613, line: 229)
!673 = !DISubprogram(name: "isfinite", linkageName: "_ZL8isfinitef", scope: !613, file: !613, line: 91, type: !674, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!674 = !DISubroutineType(types: !675)
!675 = !{!676, !8}
!676 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!677 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !678, file: !613, line: 230)
!678 = !DISubprogram(name: "isgreater", linkageName: "_ZL9isgreaterff", scope: !613, file: !613, line: 95, type: !679, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!679 = !DISubroutineType(types: !680)
!680 = !{!676, !8, !8}
!681 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !682, file: !613, line: 231)
!682 = !DISubprogram(name: "isgreaterequal", linkageName: "_ZL14isgreaterequalff", scope: !613, file: !613, line: 94, type: !679, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!683 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !684, file: !613, line: 232)
!684 = !DISubprogram(name: "isinf", linkageName: "_ZL5isinff", scope: !613, file: !613, line: 100, type: !674, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!685 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !686, file: !613, line: 233)
!686 = !DISubprogram(name: "isless", linkageName: "_ZL6islessff", scope: !613, file: !613, line: 104, type: !679, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!687 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !688, file: !613, line: 234)
!688 = !DISubprogram(name: "islessequal", linkageName: "_ZL11islessequalff", scope: !613, file: !613, line: 103, type: !679, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!689 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !690, file: !613, line: 235)
!690 = !DISubprogram(name: "islessgreater", linkageName: "_ZL13islessgreaterff", scope: !613, file: !613, line: 106, type: !679, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!691 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !692, file: !613, line: 236)
!692 = !DISubprogram(name: "isnan", linkageName: "_ZL5isnanf", scope: !613, file: !613, line: 111, type: !674, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!693 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !694, file: !613, line: 237)
!694 = !DISubprogram(name: "isnormal", linkageName: "_ZL8isnormalf", scope: !613, file: !613, line: 113, type: !674, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!695 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !696, file: !613, line: 238)
!696 = !DISubprogram(name: "isunordered", linkageName: "_ZL11isunorderedff", scope: !613, file: !613, line: 115, type: !679, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!697 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !698, file: !613, line: 239)
!698 = !DISubprogram(name: "labs", linkageName: "_ZL4labsl", scope: !613, file: !613, line: 116, type: !453, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!699 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !700, file: !613, line: 240)
!700 = !DISubprogram(name: "ldexp", linkageName: "_ZL5ldexpfi", scope: !613, file: !613, line: 118, type: !361, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!701 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !702, file: !613, line: 241)
!702 = !DISubprogram(name: "lgamma", linkageName: "_ZL6lgammaf", scope: !613, file: !613, line: 120, type: !112, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!703 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !704, file: !613, line: 242)
!704 = !DISubprogram(name: "llabs", linkageName: "_ZL5llabsx", scope: !613, file: !613, line: 121, type: !535, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!705 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !706, file: !613, line: 243)
!706 = !DISubprogram(name: "llrint", linkageName: "_ZL6llrintf", scope: !613, file: !613, line: 123, type: !232, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!707 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !708, file: !613, line: 244)
!708 = !DISubprogram(name: "log", linkageName: "_ZL3logf", scope: !613, file: !613, line: 133, type: !112, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!709 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !710, file: !613, line: 245)
!710 = !DISubprogram(name: "log10", linkageName: "_ZL5log10f", scope: !613, file: !613, line: 125, type: !112, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!711 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !712, file: !613, line: 246)
!712 = !DISubprogram(name: "log1p", linkageName: "_ZL5log1pf", scope: !613, file: !613, line: 127, type: !112, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!713 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !714, file: !613, line: 247)
!714 = !DISubprogram(name: "log2", linkageName: "_ZL4log2f", scope: !613, file: !613, line: 129, type: !112, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!715 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !716, file: !613, line: 248)
!716 = !DISubprogram(name: "logb", linkageName: "_ZL4logbf", scope: !613, file: !613, line: 131, type: !112, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!717 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !718, file: !613, line: 249)
!718 = !DISubprogram(name: "lrint", linkageName: "_ZL5lrintf", scope: !613, file: !613, line: 135, type: !269, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!719 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !720, file: !613, line: 250)
!720 = !DISubprogram(name: "lround", linkageName: "_ZL6lroundf", scope: !613, file: !613, line: 137, type: !269, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!721 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !722, file: !613, line: 251)
!722 = !DISubprogram(name: "llround", linkageName: "_ZL7llroundf", scope: !613, file: !613, line: 138, type: !232, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!723 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !724, file: !613, line: 252)
!724 = !DISubprogram(name: "modf", linkageName: "_ZL4modffPf", scope: !613, file: !613, line: 140, type: !725, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!725 = !DISubroutineType(types: !726)
!726 = !{!8, !8, !7}
!727 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !728, file: !613, line: 253)
!728 = !DISubprogram(name: "nan", linkageName: "_ZL3nanPKc", scope: !613, file: !613, line: 141, type: !283, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!729 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !730, file: !613, line: 254)
!730 = !DISubprogram(name: "nanf", linkageName: "_ZL4nanfPKc", scope: !613, file: !613, line: 142, type: !287, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!731 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !732, file: !613, line: 255)
!732 = !DISubprogram(name: "nearbyint", linkageName: "_ZL9nearbyintf", scope: !613, file: !613, line: 144, type: !112, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!733 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !734, file: !613, line: 256)
!734 = !DISubprogram(name: "nextafter", linkageName: "_ZL9nextafterff", scope: !613, file: !613, line: 146, type: !141, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!735 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !736, file: !613, line: 257)
!736 = !DISubprogram(name: "pow", linkageName: "_ZL3powfi", scope: !613, file: !613, line: 150, type: !361, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!737 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !738, file: !613, line: 258)
!738 = !DISubprogram(name: "remainder", linkageName: "_ZL9remainderff", scope: !613, file: !613, line: 152, type: !141, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!739 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !740, file: !613, line: 259)
!740 = !DISubprogram(name: "remquo", linkageName: "_ZL6remquoffPi", scope: !613, file: !613, line: 154, type: !327, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!741 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !742, file: !613, line: 260)
!742 = !DISubprogram(name: "rint", linkageName: "_ZL4rintf", scope: !613, file: !613, line: 156, type: !112, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!743 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !744, file: !613, line: 261)
!744 = !DISubprogram(name: "round", linkageName: "_ZL5roundf", scope: !613, file: !613, line: 158, type: !112, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!745 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !746, file: !613, line: 262)
!746 = !DISubprogram(name: "scalbln", linkageName: "_ZL7scalblnfl", scope: !613, file: !613, line: 160, type: !351, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!747 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !748, file: !613, line: 263)
!748 = !DISubprogram(name: "scalbn", linkageName: "_ZL6scalbnfi", scope: !613, file: !613, line: 162, type: !361, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!749 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !750, file: !613, line: 264)
!750 = !DISubprogram(name: "signbit", linkageName: "_ZL7signbitf", scope: !613, file: !613, line: 167, type: !674, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!751 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !752, file: !613, line: 265)
!752 = !DISubprogram(name: "sin", linkageName: "_ZL3sinf", scope: !613, file: !613, line: 169, type: !112, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!753 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !754, file: !613, line: 266)
!754 = !DISubprogram(name: "sinh", linkageName: "_ZL4sinhf", scope: !613, file: !613, line: 171, type: !112, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!755 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !756, file: !613, line: 267)
!756 = !DISubprogram(name: "sqrt", linkageName: "_ZL4sqrtf", scope: !613, file: !613, line: 173, type: !112, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!757 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !758, file: !613, line: 268)
!758 = !DISubprogram(name: "tan", linkageName: "_ZL3tanf", scope: !613, file: !613, line: 175, type: !112, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!759 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !760, file: !613, line: 269)
!760 = !DISubprogram(name: "tanh", linkageName: "_ZL4tanhf", scope: !613, file: !613, line: 177, type: !112, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!761 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !762, file: !613, line: 270)
!762 = !DISubprogram(name: "tgamma", linkageName: "_ZL6tgammaf", scope: !613, file: !613, line: 179, type: !112, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!763 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !764, file: !613, line: 271)
!764 = !DISubprogram(name: "trunc", linkageName: "_ZL5truncf", scope: !613, file: !613, line: 181, type: !112, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!765 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !766, file: !768, line: 737)
!766 = !DISubprogram(name: "acosf", linkageName: "_ZL5acosff", scope: !767, file: !767, line: 358, type: !112, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!767 = !DIFile(filename: "/opt/rocm-6.4.2/lib/llvm/lib/clang/19/include/__clang_hip_math.h", directory: "", checksumkind: CSK_MD5, checksum: "1ddc6320be20cc493976d99e6b1c9853")
!768 = !DIFile(filename: "/opt/rocm-6.4.2/lib/llvm/lib/clang/19/include/__clang_hip_cmath.h", directory: "", checksumkind: CSK_MD5, checksum: "dc1ab1a8805dcbc75cbf36b8a1f9305a")
!769 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !770, file: !768, line: 738)
!770 = !DISubprogram(name: "acoshf", linkageName: "_ZL6acoshff", scope: !767, file: !767, line: 361, type: !112, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!771 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !772, file: !768, line: 739)
!772 = !DISubprogram(name: "asinf", linkageName: "_ZL5asinff", scope: !767, file: !767, line: 364, type: !112, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!773 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !774, file: !768, line: 740)
!774 = !DISubprogram(name: "asinhf", linkageName: "_ZL6asinhff", scope: !767, file: !767, line: 367, type: !112, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!775 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !776, file: !768, line: 741)
!776 = !DISubprogram(name: "atan2f", linkageName: "_ZL6atan2fff", scope: !767, file: !767, line: 370, type: !141, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!777 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !778, file: !768, line: 742)
!778 = !DISubprogram(name: "atanf", linkageName: "_ZL5atanff", scope: !767, file: !767, line: 373, type: !112, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!779 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !780, file: !768, line: 743)
!780 = !DISubprogram(name: "atanhf", linkageName: "_ZL6atanhff", scope: !767, file: !767, line: 376, type: !112, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!781 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !782, file: !768, line: 744)
!782 = !DISubprogram(name: "cbrtf", linkageName: "_ZL5cbrtff", scope: !767, file: !767, line: 379, type: !112, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!783 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !784, file: !768, line: 745)
!784 = !DISubprogram(name: "ceilf", linkageName: "_ZL5ceilff", scope: !767, file: !767, line: 382, type: !112, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!785 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !786, file: !768, line: 746)
!786 = !DISubprogram(name: "copysignf", linkageName: "_ZL9copysignfff", scope: !767, file: !767, line: 385, type: !141, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!787 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !788, file: !768, line: 747)
!788 = !DISubprogram(name: "cosf", linkageName: "_ZL4cosff", scope: !767, file: !767, line: 388, type: !112, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!789 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !790, file: !768, line: 748)
!790 = !DISubprogram(name: "coshf", linkageName: "_ZL5coshff", scope: !767, file: !767, line: 391, type: !112, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!791 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !792, file: !768, line: 749)
!792 = !DISubprogram(name: "erfcf", linkageName: "_ZL5erfcff", scope: !767, file: !767, line: 403, type: !112, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!793 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !794, file: !768, line: 750)
!794 = !DISubprogram(name: "erff", linkageName: "_ZL4erfff", scope: !767, file: !767, line: 412, type: !112, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!795 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !796, file: !768, line: 751)
!796 = !DISubprogram(name: "exp2f", linkageName: "_ZL5exp2ff", scope: !767, file: !767, line: 421, type: !112, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!797 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !798, file: !768, line: 752)
!798 = !DISubprogram(name: "expf", linkageName: "_ZL4expff", scope: !767, file: !767, line: 424, type: !112, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!799 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !800, file: !768, line: 753)
!800 = !DISubprogram(name: "expm1f", linkageName: "_ZL6expm1ff", scope: !767, file: !767, line: 427, type: !112, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!801 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !802, file: !768, line: 754)
!802 = !DISubprogram(name: "fabsf", linkageName: "_ZL5fabsff", scope: !767, file: !767, line: 430, type: !112, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!803 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !804, file: !768, line: 755)
!804 = !DISubprogram(name: "fdimf", linkageName: "_ZL5fdimfff", scope: !767, file: !767, line: 433, type: !141, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!805 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !806, file: !768, line: 756)
!806 = !DISubprogram(name: "floorf", linkageName: "_ZL6floorff", scope: !767, file: !767, line: 439, type: !112, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!807 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !808, file: !768, line: 757)
!808 = !DISubprogram(name: "fmaf", linkageName: "_ZL4fmaffff", scope: !767, file: !767, line: 442, type: !183, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!809 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !810, file: !768, line: 758)
!810 = !DISubprogram(name: "fmaxf", linkageName: "_ZL5fmaxfff", scope: !767, file: !767, line: 447, type: !141, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!811 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !812, file: !768, line: 759)
!812 = !DISubprogram(name: "fminf", linkageName: "_ZL5fminfff", scope: !767, file: !767, line: 450, type: !141, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!813 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !814, file: !768, line: 760)
!814 = !DISubprogram(name: "fmodf", linkageName: "_ZL5fmodfff", scope: !767, file: !767, line: 453, type: !141, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!815 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !816, file: !768, line: 761)
!816 = !DISubprogram(name: "frexpf", linkageName: "_ZL6frexpffPi", scope: !767, file: !767, line: 456, type: !666, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!817 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !818, file: !768, line: 762)
!818 = !DISubprogram(name: "hypotf", linkageName: "_ZL6hypotfff", scope: !767, file: !767, line: 461, type: !141, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!819 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !820, file: !768, line: 763)
!820 = !DISubprogram(name: "ilogbf", linkageName: "_ZL6ilogbff", scope: !767, file: !767, line: 464, type: !213, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!821 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !822, file: !768, line: 764)
!822 = !DISubprogram(name: "ldexpf", linkageName: "_ZL6ldexpffi", scope: !767, file: !767, line: 503, type: !361, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!823 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !824, file: !768, line: 765)
!824 = !DISubprogram(name: "lgammaf", linkageName: "_ZL7lgammaff", scope: !767, file: !767, line: 506, type: !112, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!825 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !826, file: !768, line: 766)
!826 = !DISubprogram(name: "llrintf", linkageName: "_ZL7llrintff", scope: !767, file: !767, line: 509, type: !232, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!827 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !828, file: !768, line: 767)
!828 = !DISubprogram(name: "llroundf", linkageName: "_ZL8llroundff", scope: !767, file: !767, line: 512, type: !232, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!829 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !830, file: !768, line: 768)
!830 = !DISubprogram(name: "log10f", linkageName: "_ZL6log10ff", scope: !767, file: !767, line: 515, type: !112, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!831 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !832, file: !768, line: 769)
!832 = !DISubprogram(name: "log1pf", linkageName: "_ZL6log1pff", scope: !767, file: !767, line: 518, type: !112, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!833 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !834, file: !768, line: 770)
!834 = distinct !DISubprogram(name: "log2f", linkageName: "_ZL5log2ff", scope: !767, file: !767, line: 521, type: !112, scopeLine: 521, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !17, retainedNodes: !835)
!835 = !{!836}
!836 = !DILocalVariable(name: "__x", arg: 1, scope: !834, file: !767, line: 521, type: !8)
!837 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !838, file: !768, line: 771)
!838 = !DISubprogram(name: "logbf", linkageName: "_ZL5logbff", scope: !767, file: !767, line: 524, type: !112, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!839 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !840, file: !768, line: 772)
!840 = !DISubprogram(name: "logf", linkageName: "_ZL4logff", scope: !767, file: !767, line: 527, type: !112, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!841 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !842, file: !768, line: 773)
!842 = !DISubprogram(name: "lrintf", linkageName: "_ZL6lrintff", scope: !767, file: !767, line: 530, type: !269, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!843 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !844, file: !768, line: 774)
!844 = !DISubprogram(name: "lroundf", linkageName: "_ZL7lroundff", scope: !767, file: !767, line: 533, type: !269, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!845 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !846, file: !768, line: 775)
!846 = !DISubprogram(name: "modff", linkageName: "_ZL5modfffPf", scope: !767, file: !767, line: 536, type: !725, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!847 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !848, file: !768, line: 776)
!848 = !DISubprogram(name: "nearbyintf", linkageName: "_ZL10nearbyintff", scope: !767, file: !767, line: 571, type: !112, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!849 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !850, file: !768, line: 777)
!850 = !DISubprogram(name: "nextafterf", linkageName: "_ZL10nextafterfff", scope: !767, file: !767, line: 574, type: !141, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!851 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !852, file: !768, line: 779)
!852 = !DISubprogram(name: "powf", linkageName: "_ZL4powfff", scope: !767, file: !767, line: 607, type: !141, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!853 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !854, file: !768, line: 780)
!854 = !DISubprogram(name: "remainderf", linkageName: "_ZL10remainderfff", scope: !767, file: !767, line: 616, type: !141, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!855 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !856, file: !768, line: 781)
!856 = !DISubprogram(name: "remquof", linkageName: "_ZL7remquofffPi", scope: !767, file: !767, line: 621, type: !327, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!857 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !858, file: !768, line: 782)
!858 = !DISubprogram(name: "rintf", linkageName: "_ZL5rintff", scope: !767, file: !767, line: 636, type: !112, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!859 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !860, file: !768, line: 783)
!860 = !DISubprogram(name: "roundf", linkageName: "_ZL6roundff", scope: !767, file: !767, line: 661, type: !112, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!861 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !862, file: !768, line: 784)
!862 = !DISubprogram(name: "scalblnf", linkageName: "_ZL8scalblnffl", scope: !767, file: !767, line: 667, type: !351, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!863 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !864, file: !768, line: 785)
!864 = !DISubprogram(name: "scalbnf", linkageName: "_ZL7scalbnffi", scope: !767, file: !767, line: 673, type: !361, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!865 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !866, file: !768, line: 786)
!866 = !DISubprogram(name: "sinf", linkageName: "_ZL4sinff", scope: !767, file: !767, line: 703, type: !112, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!867 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !868, file: !768, line: 787)
!868 = !DISubprogram(name: "sinhf", linkageName: "_ZL5sinhff", scope: !767, file: !767, line: 706, type: !112, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!869 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !870, file: !768, line: 788)
!870 = !DISubprogram(name: "sqrtf", linkageName: "_ZL5sqrtff", scope: !767, file: !767, line: 712, type: !112, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!871 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !872, file: !768, line: 789)
!872 = !DISubprogram(name: "tanf", linkageName: "_ZL4tanff", scope: !767, file: !767, line: 715, type: !112, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!873 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !874, file: !768, line: 790)
!874 = !DISubprogram(name: "tanhf", linkageName: "_ZL5tanhff", scope: !767, file: !767, line: 718, type: !112, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!875 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !876, file: !768, line: 791)
!876 = !DISubprogram(name: "tgammaf", linkageName: "_ZL7tgammaff", scope: !767, file: !767, line: 721, type: !112, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!877 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !878, file: !768, line: 792)
!878 = !DISubprogram(name: "truncf", linkageName: "_ZL6truncff", scope: !767, file: !767, line: 724, type: !112, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!879 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !880, file: !881, line: 66)
!880 = !DICompositeType(tag: DW_TAG_class_type, name: "exception_ptr", scope: !882, file: !881, line: 97, size: 64, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSNSt15__exception_ptr13exception_ptrE")
!881 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/bits/exception_ptr.h", directory: "", checksumkind: CSK_MD5, checksum: "314ad14748ccb9ff85c65d17ebb0828b")
!882 = !DINamespace(name: "__exception_ptr", scope: !38)
!883 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !882, entity: !884, file: !881, line: 85)
!884 = !DISubprogram(name: "rethrow_exception", linkageName: "_ZSt17rethrow_exceptionNSt15__exception_ptr13exception_ptrE", scope: !38, file: !881, line: 81, type: !885, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!885 = !DISubroutineType(types: !886)
!886 = !{null, !880}
!887 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !888, file: !881, line: 243)
!888 = !DISubprogram(name: "swap", linkageName: "_ZNSt15__exception_ptr4swapERNS_13exception_ptrES1_", scope: !882, file: !881, line: 230, type: !889, flags: DIFlagPrototyped, spFlags: 0)
!889 = !DISubroutineType(types: !890)
!890 = !{null, !891, !891}
!891 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !880, size: 64)
!892 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !893, file: !908, line: 64)
!893 = !DIDerivedType(tag: DW_TAG_typedef, name: "mbstate_t", file: !894, line: 6, baseType: !895)
!894 = !DIFile(filename: "/usr/include/bits/types/mbstate_t.h", directory: "", checksumkind: CSK_MD5, checksum: "ba8742313715e20e434cf6ccb2db98e3")
!895 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mbstate_t", file: !896, line: 21, baseType: !897)
!896 = !DIFile(filename: "/usr/include/bits/types/__mbstate_t.h", directory: "", checksumkind: CSK_MD5, checksum: "82911a3e689448e3691ded3e0b471a55")
!897 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !896, line: 13, size: 64, flags: DIFlagTypePassByValue, elements: !898, identifier: "_ZTS11__mbstate_t")
!898 = !{!899, !900}
!899 = !DIDerivedType(tag: DW_TAG_member, name: "__count", scope: !897, file: !896, line: 15, baseType: !16, size: 32)
!900 = !DIDerivedType(tag: DW_TAG_member, name: "__value", scope: !897, file: !896, line: 20, baseType: !901, size: 32, offset: 32)
!901 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !897, file: !896, line: 16, size: 32, flags: DIFlagTypePassByValue, elements: !902, identifier: "_ZTSN11__mbstate_tUt_E")
!902 = !{!903, !904}
!903 = !DIDerivedType(tag: DW_TAG_member, name: "__wch", scope: !901, file: !896, line: 18, baseType: !28, size: 32)
!904 = !DIDerivedType(tag: DW_TAG_member, name: "__wchb", scope: !901, file: !896, line: 19, baseType: !905, size: 32)
!905 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 32, elements: !906)
!906 = !{!907}
!907 = !DISubrange(count: 4)
!908 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/cwchar", directory: "")
!909 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !910, file: !908, line: 141)
!910 = !DIDerivedType(tag: DW_TAG_typedef, name: "wint_t", file: !911, line: 20, baseType: !28)
!911 = !DIFile(filename: "/usr/include/bits/types/wint_t.h", directory: "", checksumkind: CSK_MD5, checksum: "aa31b53ef28dc23152ceb41e2763ded3")
!912 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !913, file: !908, line: 143)
!913 = !DISubprogram(name: "btowc", scope: !914, file: !914, line: 309, type: !915, flags: DIFlagPrototyped, spFlags: 0)
!914 = !DIFile(filename: "/usr/include/wchar.h", directory: "", checksumkind: CSK_MD5, checksum: "c7881b2872d88c3ed71646d8a9e91af3")
!915 = !DISubroutineType(types: !916)
!916 = !{!910, !16}
!917 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !918, file: !908, line: 144)
!918 = !DISubprogram(name: "fgetwc", scope: !914, file: !914, line: 935, type: !919, flags: DIFlagPrototyped, spFlags: 0)
!919 = !DISubroutineType(types: !920)
!920 = !{!910, !921}
!921 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !922, size: 64)
!922 = !DIDerivedType(tag: DW_TAG_typedef, name: "__FILE", file: !923, line: 5, baseType: !924)
!923 = !DIFile(filename: "/usr/include/bits/types/__FILE.h", directory: "", checksumkind: CSK_MD5, checksum: "72a8fe90981f484acae7c6f3dfc5c2b7")
!924 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !923, line: 4, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS8_IO_FILE")
!925 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !926, file: !908, line: 145)
!926 = !DISubprogram(name: "fgetws", scope: !914, file: !914, line: 964, type: !927, flags: DIFlagPrototyped, spFlags: 0)
!927 = !DISubroutineType(types: !928)
!928 = !{!472, !471, !16, !929}
!929 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !921)
!930 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !931, file: !908, line: 146)
!931 = !DISubprogram(name: "fputwc", scope: !914, file: !914, line: 949, type: !932, flags: DIFlagPrototyped, spFlags: 0)
!932 = !DISubroutineType(types: !933)
!933 = !{!910, !473, !921}
!934 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !935, file: !908, line: 147)
!935 = !DISubprogram(name: "fputws", scope: !914, file: !914, line: 971, type: !936, flags: DIFlagPrototyped, spFlags: 0)
!936 = !DISubroutineType(types: !937)
!937 = !{!16, !517, !929}
!938 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !939, file: !908, line: 148)
!939 = !DISubprogram(name: "fwide", scope: !914, file: !914, line: 725, type: !940, flags: DIFlagPrototyped, spFlags: 0)
!940 = !DISubroutineType(types: !941)
!941 = !{!16, !921, !16}
!942 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !943, file: !908, line: 149)
!943 = !DISubprogram(name: "fwprintf", scope: !914, file: !914, line: 732, type: !944, flags: DIFlagPrototyped, spFlags: 0)
!944 = !DISubroutineType(types: !945)
!945 = !{!16, !929, !517, null}
!946 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !947, file: !908, line: 150)
!947 = !DISubprogram(name: "fwscanf", linkageName: "__isoc23_fwscanf", scope: !914, file: !914, line: 795, type: !944, flags: DIFlagPrototyped, spFlags: 0)
!948 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !949, file: !908, line: 151)
!949 = !DISubprogram(name: "getwc", scope: !914, file: !914, line: 936, type: !919, flags: DIFlagPrototyped, spFlags: 0)
!950 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !951, file: !908, line: 152)
!951 = !DISubprogram(name: "getwchar", scope: !914, file: !914, line: 942, type: !952, flags: DIFlagPrototyped, spFlags: 0)
!952 = !DISubroutineType(types: !953)
!953 = !{!910}
!954 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !955, file: !908, line: 153)
!955 = !DISubprogram(name: "mbrlen", scope: !914, file: !914, line: 332, type: !956, flags: DIFlagPrototyped, spFlags: 0)
!956 = !DISubroutineType(types: !957)
!957 = !{!402, !9, !402, !958}
!958 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !959)
!959 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !893, size: 64)
!960 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !961, file: !908, line: 154)
!961 = !DISubprogram(name: "mbrtowc", scope: !914, file: !914, line: 321, type: !962, flags: DIFlagPrototyped, spFlags: 0)
!962 = !DISubroutineType(types: !963)
!963 = !{!402, !471, !9, !402, !958}
!964 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !965, file: !908, line: 155)
!965 = !DISubprogram(name: "mbsinit", scope: !914, file: !914, line: 317, type: !966, flags: DIFlagPrototyped, spFlags: 0)
!966 = !DISubroutineType(types: !967)
!967 = !{!16, !968}
!968 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !969, size: 64)
!969 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !893)
!970 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !971, file: !908, line: 156)
!971 = !DISubprogram(name: "mbsrtowcs", scope: !914, file: !914, line: 362, type: !972, flags: DIFlagPrototyped, spFlags: 0)
!972 = !DISubroutineType(types: !973)
!973 = !{!402, !471, !974, !402, !958}
!974 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !975)
!975 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!976 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !977, file: !908, line: 157)
!977 = !DISubprogram(name: "putwc", scope: !914, file: !914, line: 950, type: !932, flags: DIFlagPrototyped, spFlags: 0)
!978 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !979, file: !908, line: 158)
!979 = !DISubprogram(name: "putwchar", scope: !914, file: !914, line: 956, type: !980, flags: DIFlagPrototyped, spFlags: 0)
!980 = !DISubroutineType(types: !981)
!981 = !{!910, !473}
!982 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !983, file: !908, line: 160)
!983 = !DISubprogram(name: "swprintf", scope: !914, file: !914, line: 742, type: !984, flags: DIFlagPrototyped, spFlags: 0)
!984 = !DISubroutineType(types: !985)
!985 = !{!16, !471, !402, !517, null}
!986 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !987, file: !908, line: 162)
!987 = !DISubprogram(name: "swscanf", linkageName: "__isoc23_swscanf", scope: !914, file: !914, line: 802, type: !988, flags: DIFlagPrototyped, spFlags: 0)
!988 = !DISubroutineType(types: !989)
!989 = !{!16, !517, !517, null}
!990 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !991, file: !908, line: 163)
!991 = !DISubprogram(name: "ungetwc", scope: !914, file: !914, line: 979, type: !992, flags: DIFlagPrototyped, spFlags: 0)
!992 = !DISubroutineType(types: !993)
!993 = !{!910, !910, !921}
!994 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !995, file: !908, line: 164)
!995 = !DISubprogram(name: "vfwprintf", scope: !914, file: !914, line: 750, type: !996, flags: DIFlagPrototyped, spFlags: 0)
!996 = !DISubroutineType(types: !997)
!997 = !{!16, !929, !517, !998}
!998 = !DIDerivedType(tag: DW_TAG_typedef, name: "__gnuc_va_list", file: !999, line: 12, baseType: !1000)
!999 = !DIFile(filename: "/opt/rocm-6.4.2/lib/llvm/lib/clang/19/include/__stdarg___gnuc_va_list.h", directory: "", checksumkind: CSK_MD5, checksum: "edb3f2eab991638e4dc94f6e55e3530f")
!1000 = !DIDerivedType(tag: DW_TAG_typedef, name: "__builtin_va_list", file: !3, baseType: !450)
!1001 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1002, file: !908, line: 166)
!1002 = !DISubprogram(name: "vfwscanf", linkageName: "__isoc23_vfwscanf", scope: !914, file: !914, line: 875, type: !996, flags: DIFlagPrototyped, spFlags: 0)
!1003 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1004, file: !908, line: 169)
!1004 = !DISubprogram(name: "vswprintf", scope: !914, file: !914, line: 763, type: !1005, flags: DIFlagPrototyped, spFlags: 0)
!1005 = !DISubroutineType(types: !1006)
!1006 = !{!16, !471, !402, !517, !998}
!1007 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1008, file: !908, line: 172)
!1008 = !DISubprogram(name: "vswscanf", linkageName: "__isoc23_vswscanf", scope: !914, file: !914, line: 882, type: !1009, flags: DIFlagPrototyped, spFlags: 0)
!1009 = !DISubroutineType(types: !1010)
!1010 = !{!16, !517, !517, !998}
!1011 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1012, file: !908, line: 174)
!1012 = !DISubprogram(name: "vwprintf", scope: !914, file: !914, line: 758, type: !1013, flags: DIFlagPrototyped, spFlags: 0)
!1013 = !DISubroutineType(types: !1014)
!1014 = !{!16, !517, !998}
!1015 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1016, file: !908, line: 176)
!1016 = !DISubprogram(name: "vwscanf", linkageName: "__isoc23_vwscanf", scope: !914, file: !914, line: 879, type: !1013, flags: DIFlagPrototyped, spFlags: 0)
!1017 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1018, file: !908, line: 178)
!1018 = !DISubprogram(name: "wcrtomb", scope: !914, file: !914, line: 326, type: !1019, flags: DIFlagPrototyped, spFlags: 0)
!1019 = !DISubroutineType(types: !1020)
!1020 = !{!402, !516, !473, !958}
!1021 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1022, file: !908, line: 179)
!1022 = !DISubprogram(name: "wcscat", scope: !914, file: !914, line: 121, type: !1023, flags: DIFlagPrototyped, spFlags: 0)
!1023 = !DISubroutineType(types: !1024)
!1024 = !{!472, !471, !517}
!1025 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1026, file: !908, line: 180)
!1026 = !DISubprogram(name: "wcscmp", scope: !914, file: !914, line: 130, type: !1027, flags: DIFlagPrototyped, spFlags: 0)
!1027 = !DISubroutineType(types: !1028)
!1028 = !{!16, !518, !518}
!1029 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1030, file: !908, line: 181)
!1030 = !DISubprogram(name: "wcscoll", scope: !914, file: !914, line: 155, type: !1027, flags: DIFlagPrototyped, spFlags: 0)
!1031 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1032, file: !908, line: 182)
!1032 = !DISubprogram(name: "wcscpy", scope: !914, file: !914, line: 98, type: !1023, flags: DIFlagPrototyped, spFlags: 0)
!1033 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1034, file: !908, line: 183)
!1034 = !DISubprogram(name: "wcscspn", scope: !914, file: !914, line: 212, type: !1035, flags: DIFlagPrototyped, spFlags: 0)
!1035 = !DISubroutineType(types: !1036)
!1036 = !{!402, !518, !518}
!1037 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1038, file: !908, line: 184)
!1038 = !DISubprogram(name: "wcsftime", scope: !914, file: !914, line: 1043, type: !1039, flags: DIFlagPrototyped, spFlags: 0)
!1039 = !DISubroutineType(types: !1040)
!1040 = !{!402, !471, !402, !517, !1041}
!1041 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1042)
!1042 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1043, size: 64)
!1043 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1044)
!1044 = !DICompositeType(tag: DW_TAG_structure_type, name: "tm", file: !914, line: 94, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS2tm")
!1045 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1046, file: !908, line: 185)
!1046 = !DISubprogram(name: "wcslen", scope: !914, file: !914, line: 247, type: !1047, flags: DIFlagPrototyped, spFlags: 0)
!1047 = !DISubroutineType(types: !1048)
!1048 = !{!402, !518}
!1049 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1050, file: !908, line: 186)
!1050 = !DISubprogram(name: "wcsncat", scope: !914, file: !914, line: 125, type: !1051, flags: DIFlagPrototyped, spFlags: 0)
!1051 = !DISubroutineType(types: !1052)
!1052 = !{!472, !471, !517, !402}
!1053 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1054, file: !908, line: 187)
!1054 = !DISubprogram(name: "wcsncmp", scope: !914, file: !914, line: 133, type: !1055, flags: DIFlagPrototyped, spFlags: 0)
!1055 = !DISubroutineType(types: !1056)
!1056 = !{!16, !518, !518, !402}
!1057 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1058, file: !908, line: 188)
!1058 = !DISubprogram(name: "wcsncpy", scope: !914, file: !914, line: 103, type: !1051, flags: DIFlagPrototyped, spFlags: 0)
!1059 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1060, file: !908, line: 189)
!1060 = !DISubprogram(name: "wcsrtombs", scope: !914, file: !914, line: 368, type: !1061, flags: DIFlagPrototyped, spFlags: 0)
!1061 = !DISubroutineType(types: !1062)
!1062 = !{!402, !516, !1063, !402, !958}
!1063 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1064)
!1064 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !518, size: 64)
!1065 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1066, file: !908, line: 190)
!1066 = !DISubprogram(name: "wcsspn", scope: !914, file: !914, line: 216, type: !1035, flags: DIFlagPrototyped, spFlags: 0)
!1067 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1068, file: !908, line: 191)
!1068 = !DISubprogram(name: "wcstod", scope: !914, file: !914, line: 402, type: !1069, flags: DIFlagPrototyped, spFlags: 0)
!1069 = !DISubroutineType(types: !1070)
!1070 = !{!49, !517, !1071}
!1071 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1072)
!1072 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !472, size: 64)
!1073 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1074, file: !908, line: 193)
!1074 = !DISubprogram(name: "wcstof", scope: !914, file: !914, line: 407, type: !1075, flags: DIFlagPrototyped, spFlags: 0)
!1075 = !DISubroutineType(types: !1076)
!1076 = !{!8, !517, !1071}
!1077 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1078, file: !908, line: 195)
!1078 = !DISubprogram(name: "wcstok", scope: !914, file: !914, line: 242, type: !1079, flags: DIFlagPrototyped, spFlags: 0)
!1079 = !DISubroutineType(types: !1080)
!1080 = !{!472, !471, !517, !1071}
!1081 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1082, file: !908, line: 196)
!1082 = !DISubprogram(name: "wcstol", linkageName: "__isoc23_wcstol", scope: !914, file: !914, line: 500, type: !1083, flags: DIFlagPrototyped, spFlags: 0)
!1083 = !DISubroutineType(types: !1084)
!1084 = !{!266, !517, !1071, !16}
!1085 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1086, file: !908, line: 197)
!1086 = !DISubprogram(name: "wcstoul", linkageName: "__isoc23_wcstoul", scope: !914, file: !914, line: 503, type: !1087, flags: DIFlagPrototyped, spFlags: 0)
!1087 = !DISubroutineType(types: !1088)
!1088 = !{!404, !517, !1071, !16}
!1089 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1090, file: !908, line: 198)
!1090 = !DISubprogram(name: "wcsxfrm", scope: !914, file: !914, line: 159, type: !1091, flags: DIFlagPrototyped, spFlags: 0)
!1091 = !DISubroutineType(types: !1092)
!1092 = !{!402, !471, !517, !402}
!1093 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1094, file: !908, line: 199)
!1094 = !DISubprogram(name: "wctob", scope: !914, file: !914, line: 313, type: !1095, flags: DIFlagPrototyped, spFlags: 0)
!1095 = !DISubroutineType(types: !1096)
!1096 = !{!16, !910}
!1097 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1098, file: !908, line: 200)
!1098 = !DISubprogram(name: "wmemcmp", scope: !914, file: !914, line: 283, type: !1055, flags: DIFlagPrototyped, spFlags: 0)
!1099 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1100, file: !908, line: 201)
!1100 = !DISubprogram(name: "wmemcpy", scope: !914, file: !914, line: 287, type: !1051, flags: DIFlagPrototyped, spFlags: 0)
!1101 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1102, file: !908, line: 202)
!1102 = !DISubprogram(name: "wmemmove", scope: !914, file: !914, line: 292, type: !1103, flags: DIFlagPrototyped, spFlags: 0)
!1103 = !DISubroutineType(types: !1104)
!1104 = !{!472, !472, !518, !402}
!1105 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1106, file: !908, line: 203)
!1106 = !DISubprogram(name: "wmemset", scope: !914, file: !914, line: 296, type: !1107, flags: DIFlagPrototyped, spFlags: 0)
!1107 = !DISubroutineType(types: !1108)
!1108 = !{!472, !472, !473, !402}
!1109 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1110, file: !908, line: 204)
!1110 = !DISubprogram(name: "wprintf", scope: !914, file: !914, line: 739, type: !1111, flags: DIFlagPrototyped, spFlags: 0)
!1111 = !DISubroutineType(types: !1112)
!1112 = !{!16, !517, null}
!1113 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1114, file: !908, line: 205)
!1114 = !DISubprogram(name: "wscanf", linkageName: "__isoc23_wscanf", scope: !914, file: !914, line: 799, type: !1111, flags: DIFlagPrototyped, spFlags: 0)
!1115 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1116, file: !908, line: 206)
!1116 = !DISubprogram(name: "wcschr", scope: !914, file: !914, line: 189, type: !1117, flags: DIFlagPrototyped, spFlags: 0)
!1117 = !DISubroutineType(types: !1118)
!1118 = !{!472, !518, !473}
!1119 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1120, file: !908, line: 207)
!1120 = !DISubprogram(name: "wcspbrk", scope: !914, file: !914, line: 226, type: !1121, flags: DIFlagPrototyped, spFlags: 0)
!1121 = !DISubroutineType(types: !1122)
!1122 = !{!472, !518, !518}
!1123 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1124, file: !908, line: 208)
!1124 = !DISubprogram(name: "wcsrchr", scope: !914, file: !914, line: 199, type: !1117, flags: DIFlagPrototyped, spFlags: 0)
!1125 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1126, file: !908, line: 209)
!1126 = !DISubprogram(name: "wcsstr", scope: !914, file: !914, line: 237, type: !1121, flags: DIFlagPrototyped, spFlags: 0)
!1127 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1128, file: !908, line: 210)
!1128 = !DISubprogram(name: "wmemchr", scope: !914, file: !914, line: 278, type: !1129, flags: DIFlagPrototyped, spFlags: 0)
!1129 = !DISubroutineType(types: !1130)
!1130 = !{!472, !518, !473, !402}
!1131 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !525, entity: !1132, file: !908, line: 251)
!1132 = !DISubprogram(name: "wcstold", scope: !914, file: !914, line: 409, type: !1133, flags: DIFlagPrototyped, spFlags: 0)
!1133 = !DISubroutineType(types: !1134)
!1134 = !{!118, !517, !1071}
!1135 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !525, entity: !1136, file: !908, line: 260)
!1136 = !DISubprogram(name: "wcstoll", linkageName: "__isoc23_wcstoll", scope: !914, file: !914, line: 508, type: !1137, flags: DIFlagPrototyped, spFlags: 0)
!1137 = !DISubroutineType(types: !1138)
!1138 = !{!229, !517, !1071, !16}
!1139 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !525, entity: !1140, file: !908, line: 261)
!1140 = !DISubprogram(name: "wcstoull", linkageName: "__isoc23_wcstoull", scope: !914, file: !914, line: 513, type: !1141, flags: DIFlagPrototyped, spFlags: 0)
!1141 = !DISubroutineType(types: !1142)
!1142 = !{!553, !517, !1071, !16}
!1143 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1132, file: !908, line: 267)
!1144 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1136, file: !908, line: 268)
!1145 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1140, file: !908, line: 269)
!1146 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1074, file: !908, line: 283)
!1147 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1002, file: !908, line: 286)
!1148 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1008, file: !908, line: 289)
!1149 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1016, file: !908, line: 292)
!1150 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1132, file: !908, line: 296)
!1151 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1136, file: !908, line: 297)
!1152 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1140, file: !908, line: 298)
!1153 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1154, file: !1156, line: 53)
!1154 = !DICompositeType(tag: DW_TAG_structure_type, name: "lconv", file: !1155, line: 51, size: 768, flags: DIFlagFwdDecl, identifier: "_ZTS5lconv")
!1155 = !DIFile(filename: "/usr/include/locale.h", directory: "", checksumkind: CSK_MD5, checksum: "9fdf0d24f6e4cc61619b5e3258456dbf")
!1156 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/clocale", directory: "")
!1157 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1158, file: !1156, line: 54)
!1158 = !DISubprogram(name: "setlocale", scope: !1155, file: !1155, line: 122, type: !1159, flags: DIFlagPrototyped, spFlags: 0)
!1159 = !DISubroutineType(types: !1160)
!1160 = !{!450, !16, !10}
!1161 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1162, file: !1156, line: 55)
!1162 = !DISubprogram(name: "localeconv", scope: !1155, file: !1155, line: 125, type: !1163, flags: DIFlagPrototyped, spFlags: 0)
!1163 = !DISubroutineType(types: !1164)
!1164 = !{!1165}
!1165 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1154, size: 64)
!1166 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1167, file: !1169, line: 64)
!1167 = !DISubprogram(name: "isalnum", scope: !1168, file: !1168, line: 108, type: !41, flags: DIFlagPrototyped, spFlags: 0)
!1168 = !DIFile(filename: "/usr/include/ctype.h", directory: "", checksumkind: CSK_MD5, checksum: "04aab4fba8cc4c824a8f09075cc98b20")
!1169 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/cctype", directory: "")
!1170 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1171, file: !1169, line: 65)
!1171 = !DISubprogram(name: "isalpha", scope: !1168, file: !1168, line: 109, type: !41, flags: DIFlagPrototyped, spFlags: 0)
!1172 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1173, file: !1169, line: 66)
!1173 = !DISubprogram(name: "iscntrl", scope: !1168, file: !1168, line: 110, type: !41, flags: DIFlagPrototyped, spFlags: 0)
!1174 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1175, file: !1169, line: 67)
!1175 = !DISubprogram(name: "isdigit", scope: !1168, file: !1168, line: 111, type: !41, flags: DIFlagPrototyped, spFlags: 0)
!1176 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1177, file: !1169, line: 68)
!1177 = !DISubprogram(name: "isgraph", scope: !1168, file: !1168, line: 113, type: !41, flags: DIFlagPrototyped, spFlags: 0)
!1178 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1179, file: !1169, line: 69)
!1179 = !DISubprogram(name: "islower", scope: !1168, file: !1168, line: 112, type: !41, flags: DIFlagPrototyped, spFlags: 0)
!1180 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1181, file: !1169, line: 70)
!1181 = !DISubprogram(name: "isprint", scope: !1168, file: !1168, line: 114, type: !41, flags: DIFlagPrototyped, spFlags: 0)
!1182 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1183, file: !1169, line: 71)
!1183 = !DISubprogram(name: "ispunct", scope: !1168, file: !1168, line: 115, type: !41, flags: DIFlagPrototyped, spFlags: 0)
!1184 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1185, file: !1169, line: 72)
!1185 = !DISubprogram(name: "isspace", scope: !1168, file: !1168, line: 116, type: !41, flags: DIFlagPrototyped, spFlags: 0)
!1186 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1187, file: !1169, line: 73)
!1187 = !DISubprogram(name: "isupper", scope: !1168, file: !1168, line: 117, type: !41, flags: DIFlagPrototyped, spFlags: 0)
!1188 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1189, file: !1169, line: 74)
!1189 = !DISubprogram(name: "isxdigit", scope: !1168, file: !1168, line: 118, type: !41, flags: DIFlagPrototyped, spFlags: 0)
!1190 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1191, file: !1169, line: 75)
!1191 = !DISubprogram(name: "tolower", scope: !1168, file: !1168, line: 122, type: !41, flags: DIFlagPrototyped, spFlags: 0)
!1192 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1193, file: !1169, line: 76)
!1193 = !DISubprogram(name: "toupper", scope: !1168, file: !1168, line: 125, type: !41, flags: DIFlagPrototyped, spFlags: 0)
!1194 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1195, file: !1169, line: 87)
!1195 = !DISubprogram(name: "isblank", scope: !1168, file: !1168, line: 130, type: !41, flags: DIFlagPrototyped, spFlags: 0)
!1196 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1197, file: !1199, line: 98)
!1197 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !1198, line: 7, baseType: !924)
!1198 = !DIFile(filename: "/usr/include/bits/types/FILE.h", directory: "", checksumkind: CSK_MD5, checksum: "571f9fb6223c42439075fdde11a0de5d")
!1199 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/cstdio", directory: "")
!1200 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1201, file: !1199, line: 99)
!1201 = !DIDerivedType(tag: DW_TAG_typedef, name: "fpos_t", file: !1202, line: 84, baseType: !1203)
!1202 = !DIFile(filename: "/usr/include/stdio.h", directory: "", checksumkind: CSK_MD5, checksum: "600479e30522c60809530fc01f232b17")
!1203 = !DIDerivedType(tag: DW_TAG_typedef, name: "__fpos_t", file: !1204, line: 14, baseType: !1205)
!1204 = !DIFile(filename: "/usr/include/bits/types/__fpos_t.h", directory: "", checksumkind: CSK_MD5, checksum: "32de8bdaf3551a6c0a9394f9af4389ce")
!1205 = !DICompositeType(tag: DW_TAG_structure_type, name: "_G_fpos_t", file: !1204, line: 10, size: 128, flags: DIFlagFwdDecl, identifier: "_ZTS9_G_fpos_t")
!1206 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1207, file: !1199, line: 101)
!1207 = !DISubprogram(name: "clearerr", scope: !1202, file: !1202, line: 844, type: !1208, flags: DIFlagPrototyped, spFlags: 0)
!1208 = !DISubroutineType(types: !1209)
!1209 = !{null, !1210}
!1210 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1197, size: 64)
!1211 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1212, file: !1199, line: 102)
!1212 = !DISubprogram(name: "fclose", scope: !1202, file: !1202, line: 183, type: !1213, flags: DIFlagPrototyped, spFlags: 0)
!1213 = !DISubroutineType(types: !1214)
!1214 = !{!16, !1210}
!1215 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1216, file: !1199, line: 103)
!1216 = !DISubprogram(name: "feof", scope: !1202, file: !1202, line: 846, type: !1213, flags: DIFlagPrototyped, spFlags: 0)
!1217 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1218, file: !1199, line: 104)
!1218 = !DISubprogram(name: "ferror", scope: !1202, file: !1202, line: 848, type: !1213, flags: DIFlagPrototyped, spFlags: 0)
!1219 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1220, file: !1199, line: 105)
!1220 = !DISubprogram(name: "fflush", scope: !1202, file: !1202, line: 235, type: !1213, flags: DIFlagPrototyped, spFlags: 0)
!1221 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1222, file: !1199, line: 106)
!1222 = !DISubprogram(name: "fgetc", scope: !1202, file: !1202, line: 571, type: !1213, flags: DIFlagPrototyped, spFlags: 0)
!1223 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1224, file: !1199, line: 107)
!1224 = !DISubprogram(name: "fgetpos", scope: !1202, file: !1202, line: 818, type: !1225, flags: DIFlagPrototyped, spFlags: 0)
!1225 = !DISubroutineType(types: !1226)
!1226 = !{!16, !1227, !1228}
!1227 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1210)
!1228 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1229)
!1229 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1201, size: 64)
!1230 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1231, file: !1199, line: 108)
!1231 = !DISubprogram(name: "fgets", scope: !1202, file: !1202, line: 650, type: !1232, flags: DIFlagPrototyped, spFlags: 0)
!1232 = !DISubroutineType(types: !1233)
!1233 = !{!450, !516, !16, !1227}
!1234 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1235, file: !1199, line: 109)
!1235 = !DISubprogram(name: "fopen", scope: !1202, file: !1202, line: 263, type: !1236, flags: DIFlagPrototyped, spFlags: 0)
!1236 = !DISubroutineType(types: !1237)
!1237 = !{!1210, !9, !9}
!1238 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1239, file: !1199, line: 110)
!1239 = !DISubprogram(name: "fprintf", scope: !1202, file: !1202, line: 355, type: !1240, flags: DIFlagPrototyped, spFlags: 0)
!1240 = !DISubroutineType(types: !1241)
!1241 = !{!16, !1227, !9, null}
!1242 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1243, file: !1199, line: 111)
!1243 = !DISubprogram(name: "fputc", scope: !1202, file: !1202, line: 607, type: !1244, flags: DIFlagPrototyped, spFlags: 0)
!1244 = !DISubroutineType(types: !1245)
!1245 = !{!16, !16, !1210}
!1246 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1247, file: !1199, line: 112)
!1247 = !DISubprogram(name: "fputs", scope: !1202, file: !1202, line: 713, type: !1248, flags: DIFlagPrototyped, spFlags: 0)
!1248 = !DISubroutineType(types: !1249)
!1249 = !{!16, !9, !1227}
!1250 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1251, file: !1199, line: 113)
!1251 = !DISubprogram(name: "fread", scope: !1202, file: !1202, line: 733, type: !1252, flags: DIFlagPrototyped, spFlags: 0)
!1252 = !DISubroutineType(types: !1253)
!1253 = !{!402, !1254, !402, !402, !1227}
!1254 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !401)
!1255 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1256, file: !1199, line: 114)
!1256 = !DISubprogram(name: "freopen", scope: !1202, file: !1202, line: 270, type: !1257, flags: DIFlagPrototyped, spFlags: 0)
!1257 = !DISubroutineType(types: !1258)
!1258 = !{!1210, !9, !9, !1227}
!1259 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1260, file: !1199, line: 115)
!1260 = !DISubprogram(name: "fscanf", linkageName: "__isoc23_fscanf", scope: !1202, file: !1202, line: 440, type: !1240, flags: DIFlagPrototyped, spFlags: 0)
!1261 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1262, file: !1199, line: 116)
!1262 = !DISubprogram(name: "fseek", scope: !1202, file: !1202, line: 771, type: !1263, flags: DIFlagPrototyped, spFlags: 0)
!1263 = !DISubroutineType(types: !1264)
!1264 = !{!16, !1210, !266, !16}
!1265 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1266, file: !1199, line: 117)
!1266 = !DISubprogram(name: "fsetpos", scope: !1202, file: !1202, line: 823, type: !1267, flags: DIFlagPrototyped, spFlags: 0)
!1267 = !DISubroutineType(types: !1268)
!1268 = !{!16, !1210, !1269}
!1269 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1270, size: 64)
!1270 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1201)
!1271 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1272, file: !1199, line: 118)
!1272 = !DISubprogram(name: "ftell", scope: !1202, file: !1202, line: 776, type: !1273, flags: DIFlagPrototyped, spFlags: 0)
!1273 = !DISubroutineType(types: !1274)
!1274 = !{!266, !1210}
!1275 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1276, file: !1199, line: 119)
!1276 = !DISubprogram(name: "fwrite", scope: !1202, file: !1202, line: 739, type: !1277, flags: DIFlagPrototyped, spFlags: 0)
!1277 = !DISubroutineType(types: !1278)
!1278 = !{!402, !1279, !402, !402, !1227}
!1279 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !426)
!1280 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1281, file: !1199, line: 120)
!1281 = !DISubprogram(name: "getc", scope: !1202, file: !1202, line: 572, type: !1213, flags: DIFlagPrototyped, spFlags: 0)
!1282 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1283, file: !1199, line: 121)
!1283 = !DISubprogram(name: "getchar", scope: !1202, file: !1202, line: 578, type: !486, flags: DIFlagPrototyped, spFlags: 0)
!1284 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1285, file: !1199, line: 126)
!1285 = !DISubprogram(name: "perror", scope: !1202, file: !1202, line: 862, type: !1286, flags: DIFlagPrototyped, spFlags: 0)
!1286 = !DISubroutineType(types: !1287)
!1287 = !{null, !10}
!1288 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1289, file: !1199, line: 127)
!1289 = !DISubprogram(name: "printf", scope: !1202, file: !1202, line: 361, type: !1290, flags: DIFlagPrototyped, spFlags: 0)
!1290 = !DISubroutineType(types: !1291)
!1291 = !{!16, !9, null}
!1292 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1293, file: !1199, line: 128)
!1293 = !DISubprogram(name: "putc", scope: !1202, file: !1202, line: 608, type: !1244, flags: DIFlagPrototyped, spFlags: 0)
!1294 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1295, file: !1199, line: 129)
!1295 = !DISubprogram(name: "putchar", scope: !1202, file: !1202, line: 614, type: !41, flags: DIFlagPrototyped, spFlags: 0)
!1296 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1297, file: !1199, line: 130)
!1297 = !DISubprogram(name: "puts", scope: !1202, file: !1202, line: 719, type: !416, flags: DIFlagPrototyped, spFlags: 0)
!1298 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1299, file: !1199, line: 131)
!1299 = !DISubprogram(name: "remove", scope: !1202, file: !1202, line: 157, type: !416, flags: DIFlagPrototyped, spFlags: 0)
!1300 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1301, file: !1199, line: 132)
!1301 = !DISubprogram(name: "rename", scope: !1202, file: !1202, line: 159, type: !1302, flags: DIFlagPrototyped, spFlags: 0)
!1302 = !DISubroutineType(types: !1303)
!1303 = !{!16, !10, !10}
!1304 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1305, file: !1199, line: 133)
!1305 = !DISubprogram(name: "rewind", scope: !1202, file: !1202, line: 781, type: !1208, flags: DIFlagPrototyped, spFlags: 0)
!1306 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1307, file: !1199, line: 134)
!1307 = !DISubprogram(name: "scanf", linkageName: "__isoc23_scanf", scope: !1202, file: !1202, line: 443, type: !1290, flags: DIFlagPrototyped, spFlags: 0)
!1308 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1309, file: !1199, line: 135)
!1309 = !DISubprogram(name: "setbuf", scope: !1202, file: !1202, line: 333, type: !1310, flags: DIFlagPrototyped, spFlags: 0)
!1310 = !DISubroutineType(types: !1311)
!1311 = !{null, !1227, !516}
!1312 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1313, file: !1199, line: 136)
!1313 = !DISubprogram(name: "setvbuf", scope: !1202, file: !1202, line: 337, type: !1314, flags: DIFlagPrototyped, spFlags: 0)
!1314 = !DISubroutineType(types: !1315)
!1315 = !{!16, !1227, !516, !16, !402}
!1316 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1317, file: !1199, line: 137)
!1317 = !DISubprogram(name: "sprintf", scope: !1202, file: !1202, line: 363, type: !1318, flags: DIFlagPrototyped, spFlags: 0)
!1318 = !DISubroutineType(types: !1319)
!1319 = !{!16, !516, !9, null}
!1320 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1321, file: !1199, line: 138)
!1321 = !DISubprogram(name: "sscanf", linkageName: "__isoc23_sscanf", scope: !1202, file: !1202, line: 445, type: !1322, flags: DIFlagPrototyped, spFlags: 0)
!1322 = !DISubroutineType(types: !1323)
!1323 = !{!16, !9, !9, null}
!1324 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1325, file: !1199, line: 139)
!1325 = !DISubprogram(name: "tmpfile", scope: !1202, file: !1202, line: 193, type: !1326, flags: DIFlagPrototyped, spFlags: 0)
!1326 = !DISubroutineType(types: !1327)
!1327 = !{!1210}
!1328 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1329, file: !1199, line: 141)
!1329 = !DISubprogram(name: "tmpnam", scope: !1202, file: !1202, line: 210, type: !1330, flags: DIFlagPrototyped, spFlags: 0)
!1330 = !DISubroutineType(types: !1331)
!1331 = !{!450, !450}
!1332 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1333, file: !1199, line: 143)
!1333 = !DISubprogram(name: "ungetc", scope: !1202, file: !1202, line: 726, type: !1244, flags: DIFlagPrototyped, spFlags: 0)
!1334 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1335, file: !1199, line: 144)
!1335 = !DISubprogram(name: "vfprintf", scope: !1202, file: !1202, line: 370, type: !1336, flags: DIFlagPrototyped, spFlags: 0)
!1336 = !DISubroutineType(types: !1337)
!1337 = !{!16, !1227, !9, !998}
!1338 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1339, file: !1199, line: 145)
!1339 = !DISubprogram(name: "vprintf", scope: !1202, file: !1202, line: 376, type: !1340, flags: DIFlagPrototyped, spFlags: 0)
!1340 = !DISubroutineType(types: !1341)
!1341 = !{!16, !9, !998}
!1342 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1343, file: !1199, line: 146)
!1343 = !DISubprogram(name: "vsprintf", scope: !1202, file: !1202, line: 378, type: !1344, flags: DIFlagPrototyped, spFlags: 0)
!1344 = !DISubroutineType(types: !1345)
!1345 = !{!16, !516, !9, !998}
!1346 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !525, entity: !1347, file: !1199, line: 175)
!1347 = !DISubprogram(name: "snprintf", scope: !1202, file: !1202, line: 383, type: !1348, flags: DIFlagPrototyped, spFlags: 0)
!1348 = !DISubroutineType(types: !1349)
!1349 = !{!16, !516, !402, !9, null}
!1350 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !525, entity: !1351, file: !1199, line: 176)
!1351 = !DISubprogram(name: "vfscanf", linkageName: "__isoc23_vfscanf", scope: !1202, file: !1202, line: 507, type: !1336, flags: DIFlagPrototyped, spFlags: 0)
!1352 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !525, entity: !1353, file: !1199, line: 177)
!1353 = !DISubprogram(name: "vscanf", linkageName: "__isoc23_vscanf", scope: !1202, file: !1202, line: 512, type: !1340, flags: DIFlagPrototyped, spFlags: 0)
!1354 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !525, entity: !1355, file: !1199, line: 178)
!1355 = !DISubprogram(name: "vsnprintf", scope: !1202, file: !1202, line: 387, type: !1356, flags: DIFlagPrototyped, spFlags: 0)
!1356 = !DISubroutineType(types: !1357)
!1357 = !{!16, !516, !402, !9, !998}
!1358 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !525, entity: !1359, file: !1199, line: 179)
!1359 = !DISubprogram(name: "vsscanf", linkageName: "__isoc23_vsscanf", scope: !1202, file: !1202, line: 515, type: !1360, flags: DIFlagPrototyped, spFlags: 0)
!1360 = !DISubroutineType(types: !1361)
!1361 = !{!16, !9, !9, !998}
!1362 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1347, file: !1199, line: 185)
!1363 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1351, file: !1199, line: 186)
!1364 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1353, file: !1199, line: 187)
!1365 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1355, file: !1199, line: 188)
!1366 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1359, file: !1199, line: 189)
!1367 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1368, file: !1374, line: 58)
!1368 = !DIDerivedType(tag: DW_TAG_typedef, name: "max_align_t", file: !1369, line: 24, baseType: !1370)
!1369 = !DIFile(filename: "/opt/rocm-6.4.2/lib/llvm/lib/clang/19/include/__stddef_max_align_t.h", directory: "", checksumkind: CSK_MD5, checksum: "3c0a2f19d136d39aa835c737c7105def")
!1370 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1369, line: 19, size: 128, flags: DIFlagTypePassByValue, elements: !1371, identifier: "_ZTS11max_align_t")
!1371 = !{!1372, !1373}
!1372 = !DIDerivedType(tag: DW_TAG_member, name: "__clang_max_align_nonce1", scope: !1370, file: !1369, line: 20, baseType: !229, size: 64, align: 64)
!1373 = !DIDerivedType(tag: DW_TAG_member, name: "__clang_max_align_nonce2", scope: !1370, file: !1369, line: 22, baseType: !118, size: 64, align: 64, offset: 64)
!1374 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/cstddef", directory: "")
!1375 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1376, file: !1381, line: 82)
!1376 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctrans_t", file: !1377, line: 48, baseType: !1378)
!1377 = !DIFile(filename: "/usr/include/wctype.h", directory: "", checksumkind: CSK_MD5, checksum: "93d4b1045b46d132ff5e6d83a26abaee")
!1378 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1379, size: 64)
!1379 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1380)
!1380 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !27, line: 41, baseType: !16)
!1381 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/cwctype", directory: "")
!1382 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1383, file: !1381, line: 83)
!1383 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctype_t", file: !1384, line: 38, baseType: !404)
!1384 = !DIFile(filename: "/usr/include/bits/wctype-wchar.h", directory: "", checksumkind: CSK_MD5, checksum: "65a194b61bfadb7760be04a5640f774f")
!1385 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !910, file: !1381, line: 84)
!1386 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1387, file: !1381, line: 86)
!1387 = !DISubprogram(name: "iswalnum", scope: !1384, file: !1384, line: 95, type: !1095, flags: DIFlagPrototyped, spFlags: 0)
!1388 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1389, file: !1381, line: 87)
!1389 = !DISubprogram(name: "iswalpha", scope: !1384, file: !1384, line: 101, type: !1095, flags: DIFlagPrototyped, spFlags: 0)
!1390 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1391, file: !1381, line: 89)
!1391 = !DISubprogram(name: "iswblank", scope: !1384, file: !1384, line: 146, type: !1095, flags: DIFlagPrototyped, spFlags: 0)
!1392 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1393, file: !1381, line: 91)
!1393 = !DISubprogram(name: "iswcntrl", scope: !1384, file: !1384, line: 104, type: !1095, flags: DIFlagPrototyped, spFlags: 0)
!1394 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1395, file: !1381, line: 92)
!1395 = !DISubprogram(name: "iswctype", scope: !1384, file: !1384, line: 159, type: !1396, flags: DIFlagPrototyped, spFlags: 0)
!1396 = !DISubroutineType(types: !1397)
!1397 = !{!16, !910, !1383}
!1398 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1399, file: !1381, line: 93)
!1399 = !DISubprogram(name: "iswdigit", scope: !1384, file: !1384, line: 108, type: !1095, flags: DIFlagPrototyped, spFlags: 0)
!1400 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1401, file: !1381, line: 94)
!1401 = !DISubprogram(name: "iswgraph", scope: !1384, file: !1384, line: 112, type: !1095, flags: DIFlagPrototyped, spFlags: 0)
!1402 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1403, file: !1381, line: 95)
!1403 = !DISubprogram(name: "iswlower", scope: !1384, file: !1384, line: 117, type: !1095, flags: DIFlagPrototyped, spFlags: 0)
!1404 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1405, file: !1381, line: 96)
!1405 = !DISubprogram(name: "iswprint", scope: !1384, file: !1384, line: 120, type: !1095, flags: DIFlagPrototyped, spFlags: 0)
!1406 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1407, file: !1381, line: 97)
!1407 = !DISubprogram(name: "iswpunct", scope: !1384, file: !1384, line: 125, type: !1095, flags: DIFlagPrototyped, spFlags: 0)
!1408 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1409, file: !1381, line: 98)
!1409 = !DISubprogram(name: "iswspace", scope: !1384, file: !1384, line: 130, type: !1095, flags: DIFlagPrototyped, spFlags: 0)
!1410 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1411, file: !1381, line: 99)
!1411 = !DISubprogram(name: "iswupper", scope: !1384, file: !1384, line: 135, type: !1095, flags: DIFlagPrototyped, spFlags: 0)
!1412 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1413, file: !1381, line: 100)
!1413 = !DISubprogram(name: "iswxdigit", scope: !1384, file: !1384, line: 140, type: !1095, flags: DIFlagPrototyped, spFlags: 0)
!1414 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1415, file: !1381, line: 101)
!1415 = !DISubprogram(name: "towctrans", scope: !1377, file: !1377, line: 55, type: !1416, flags: DIFlagPrototyped, spFlags: 0)
!1416 = !DISubroutineType(types: !1417)
!1417 = !{!910, !910, !1376}
!1418 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1419, file: !1381, line: 102)
!1419 = !DISubprogram(name: "towlower", scope: !1384, file: !1384, line: 166, type: !1420, flags: DIFlagPrototyped, spFlags: 0)
!1420 = !DISubroutineType(types: !1421)
!1421 = !{!910, !910}
!1422 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1423, file: !1381, line: 103)
!1423 = !DISubprogram(name: "towupper", scope: !1384, file: !1384, line: 169, type: !1420, flags: DIFlagPrototyped, spFlags: 0)
!1424 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1425, file: !1381, line: 104)
!1425 = !DISubprogram(name: "wctrans", scope: !1377, file: !1377, line: 52, type: !1426, flags: DIFlagPrototyped, spFlags: 0)
!1426 = !DISubroutineType(types: !1427)
!1427 = !{!1376, !10}
!1428 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1429, file: !1381, line: 105)
!1429 = !DISubprogram(name: "wctype", scope: !1384, file: !1384, line: 155, type: !1430, flags: DIFlagPrototyped, spFlags: 0)
!1430 = !DISubroutineType(types: !1431)
!1431 = !{!1383, !10}
!1432 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !612, file: !1433, line: 38)
!1433 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/math.h", directory: "", checksumkind: CSK_MD5, checksum: "f34e6ddbb19306e7d9f8c42d51dc6ee3")
!1434 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !684, file: !1433, line: 65)
!1435 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !692, file: !1433, line: 66)
!1436 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1437, file: !1441, line: 51)
!1437 = !DIDerivedType(tag: DW_TAG_typedef, name: "int8_t", file: !1438, line: 24, baseType: !1439)
!1438 = !DIFile(filename: "/usr/include/bits/stdint-intn.h", directory: "", checksumkind: CSK_MD5, checksum: "85f68316edee664d7bd685b977adf677")
!1439 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int8_t", file: !27, line: 37, baseType: !1440)
!1440 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!1441 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/cstdint", directory: "")
!1442 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1443, file: !1441, line: 52)
!1443 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !1438, line: 25, baseType: !1444)
!1444 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int16_t", file: !27, line: 39, baseType: !1445)
!1445 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!1446 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1447, file: !1441, line: 53)
!1447 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !1438, line: 26, baseType: !1380)
!1448 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1449, file: !1441, line: 54)
!1449 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !1438, line: 27, baseType: !1450)
!1450 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !27, line: 44, baseType: !266)
!1451 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1452, file: !1441, line: 56)
!1452 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast8_t", file: !1453, line: 58, baseType: !1440)
!1453 = !DIFile(filename: "/usr/include/stdint.h", directory: "", checksumkind: CSK_MD5, checksum: "e1a448af0fce22a39bc183d2915834c7")
!1454 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1455, file: !1441, line: 57)
!1455 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast16_t", file: !1453, line: 60, baseType: !266)
!1456 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1457, file: !1441, line: 58)
!1457 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast32_t", file: !1453, line: 61, baseType: !266)
!1458 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1459, file: !1441, line: 59)
!1459 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast64_t", file: !1453, line: 62, baseType: !266)
!1460 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1461, file: !1441, line: 61)
!1461 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least8_t", file: !1453, line: 43, baseType: !1462)
!1462 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least8_t", file: !27, line: 52, baseType: !1439)
!1463 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1464, file: !1441, line: 62)
!1464 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least16_t", file: !1453, line: 44, baseType: !1465)
!1465 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least16_t", file: !27, line: 54, baseType: !1444)
!1466 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1467, file: !1441, line: 63)
!1467 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least32_t", file: !1453, line: 45, baseType: !1468)
!1468 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least32_t", file: !27, line: 56, baseType: !1380)
!1469 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1470, file: !1441, line: 64)
!1470 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least64_t", file: !1453, line: 46, baseType: !1471)
!1471 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least64_t", file: !27, line: 58, baseType: !1450)
!1472 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1473, file: !1441, line: 66)
!1473 = !DIDerivedType(tag: DW_TAG_typedef, name: "intmax_t", file: !1453, line: 101, baseType: !1474)
!1474 = !DIDerivedType(tag: DW_TAG_typedef, name: "__intmax_t", file: !27, line: 72, baseType: !266)
!1475 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1476, file: !1441, line: 67)
!1476 = !DIDerivedType(tag: DW_TAG_typedef, name: "intptr_t", file: !1453, line: 87, baseType: !266)
!1477 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1478, file: !1441, line: 69)
!1478 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !25, line: 24, baseType: !1479)
!1479 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !27, line: 38, baseType: !1480)
!1480 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!1481 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1482, file: !1441, line: 70)
!1482 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !25, line: 25, baseType: !1483)
!1483 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !27, line: 40, baseType: !1484)
!1484 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!1485 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !24, file: !1441, line: 71)
!1486 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1487, file: !1441, line: 72)
!1487 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !25, line: 27, baseType: !1488)
!1488 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint64_t", file: !27, line: 45, baseType: !404)
!1489 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1490, file: !1441, line: 74)
!1490 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast8_t", file: !1453, line: 71, baseType: !1480)
!1491 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1492, file: !1441, line: 75)
!1492 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast16_t", file: !1453, line: 73, baseType: !404)
!1493 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1494, file: !1441, line: 76)
!1494 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast32_t", file: !1453, line: 74, baseType: !404)
!1495 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1496, file: !1441, line: 77)
!1496 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast64_t", file: !1453, line: 75, baseType: !404)
!1497 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1498, file: !1441, line: 79)
!1498 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least8_t", file: !1453, line: 49, baseType: !1499)
!1499 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least8_t", file: !27, line: 53, baseType: !1479)
!1500 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1501, file: !1441, line: 80)
!1501 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least16_t", file: !1453, line: 50, baseType: !1502)
!1502 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least16_t", file: !27, line: 55, baseType: !1483)
!1503 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1504, file: !1441, line: 81)
!1504 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least32_t", file: !1453, line: 51, baseType: !1505)
!1505 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least32_t", file: !27, line: 57, baseType: !26)
!1506 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1507, file: !1441, line: 82)
!1507 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least64_t", file: !1453, line: 52, baseType: !1508)
!1508 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least64_t", file: !27, line: 59, baseType: !1488)
!1509 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1510, file: !1441, line: 84)
!1510 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintmax_t", file: !1453, line: 102, baseType: !1511)
!1511 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uintmax_t", file: !27, line: 73, baseType: !404)
!1512 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1513, file: !1441, line: 85)
!1513 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintptr_t", file: !1453, line: 90, baseType: !404)
!1514 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1515, file: !1518, line: 60)
!1515 = !DIDerivedType(tag: DW_TAG_typedef, name: "clock_t", file: !1516, line: 7, baseType: !1517)
!1516 = !DIFile(filename: "/usr/include/bits/types/clock_t.h", directory: "", checksumkind: CSK_MD5, checksum: "1aade99fd778d1551600c7ca1410b9f1")
!1517 = !DIDerivedType(tag: DW_TAG_typedef, name: "__clock_t", file: !27, line: 156, baseType: !266)
!1518 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/ctime", directory: "")
!1519 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1520, file: !1518, line: 61)
!1520 = !DIDerivedType(tag: DW_TAG_typedef, name: "time_t", file: !1521, line: 10, baseType: !1522)
!1521 = !DIFile(filename: "/usr/include/bits/types/time_t.h", directory: "", checksumkind: CSK_MD5, checksum: "5c299a4954617c88bb03645c7864e1b1")
!1522 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !27, line: 160, baseType: !266)
!1523 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1044, file: !1518, line: 62)
!1524 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1525, file: !1518, line: 64)
!1525 = !DISubprogram(name: "clock", scope: !1526, file: !1526, line: 72, type: !1527, flags: DIFlagPrototyped, spFlags: 0)
!1526 = !DIFile(filename: "/usr/include/time.h", directory: "", checksumkind: CSK_MD5, checksum: "19daa87a550fdc2d68d9b199f5473f94")
!1527 = !DISubroutineType(types: !1528)
!1528 = !{!1515}
!1529 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1530, file: !1518, line: 65)
!1530 = !DISubprogram(name: "difftime", scope: !1526, file: !1526, line: 79, type: !1531, flags: DIFlagPrototyped, spFlags: 0)
!1531 = !DISubroutineType(types: !1532)
!1532 = !{!49, !1520, !1520}
!1533 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1534, file: !1518, line: 66)
!1534 = !DISubprogram(name: "mktime", scope: !1526, file: !1526, line: 83, type: !1535, flags: DIFlagPrototyped, spFlags: 0)
!1535 = !DISubroutineType(types: !1536)
!1536 = !{!1520, !1537}
!1537 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1044, size: 64)
!1538 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1539, file: !1518, line: 67)
!1539 = !DISubprogram(name: "time", scope: !1526, file: !1526, line: 76, type: !1540, flags: DIFlagPrototyped, spFlags: 0)
!1540 = !DISubroutineType(types: !1541)
!1541 = !{!1520, !1542}
!1542 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1520, size: 64)
!1543 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1544, file: !1518, line: 68)
!1544 = !DISubprogram(name: "asctime", scope: !1526, file: !1526, line: 180, type: !1545, flags: DIFlagPrototyped, spFlags: 0)
!1545 = !DISubroutineType(types: !1546)
!1546 = !{!450, !1042}
!1547 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1548, file: !1518, line: 69)
!1548 = !DISubprogram(name: "ctime", scope: !1526, file: !1526, line: 184, type: !1549, flags: DIFlagPrototyped, spFlags: 0)
!1549 = !DISubroutineType(types: !1550)
!1550 = !{!450, !1551}
!1551 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1552, size: 64)
!1552 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1520)
!1553 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1554, file: !1518, line: 70)
!1554 = !DISubprogram(name: "gmtime", scope: !1526, file: !1526, line: 133, type: !1555, flags: DIFlagPrototyped, spFlags: 0)
!1555 = !DISubroutineType(types: !1556)
!1556 = !{!1537, !1551}
!1557 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1558, file: !1518, line: 71)
!1558 = !DISubprogram(name: "localtime", scope: !1526, file: !1526, line: 137, type: !1555, flags: DIFlagPrototyped, spFlags: 0)
!1559 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1560, file: !1518, line: 72)
!1560 = !DISubprogram(name: "strftime", scope: !1526, file: !1526, line: 100, type: !1561, flags: DIFlagPrototyped, spFlags: 0)
!1561 = !DISubroutineType(types: !1562)
!1562 = !{!402, !516, !402, !9, !1041}
!1563 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1564, file: !1518, line: 79)
!1564 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timespec", file: !1565, line: 11, size: 128, flags: DIFlagTypePassByValue, elements: !1566, identifier: "_ZTS8timespec")
!1565 = !DIFile(filename: "/usr/include/bits/types/struct_timespec.h", directory: "", checksumkind: CSK_MD5, checksum: "55dc154df3f21a5aa944dcafba9b43f6")
!1566 = !{!1567, !1568}
!1567 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !1564, file: !1565, line: 16, baseType: !1522, size: 64)
!1568 = !DIDerivedType(tag: DW_TAG_member, name: "tv_nsec", scope: !1564, file: !1565, line: 21, baseType: !1569, size: 64, offset: 64)
!1569 = !DIDerivedType(tag: DW_TAG_typedef, name: "__syscall_slong_t", file: !27, line: 197, baseType: !266)
!1570 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !38, entity: !1571, file: !1518, line: 80)
!1571 = !DISubprogram(name: "timespec_get", scope: !1526, file: !1526, line: 384, type: !1572, flags: DIFlagPrototyped, spFlags: 0)
!1572 = !DISubroutineType(types: !1573)
!1573 = !{!16, !1574, !16}
!1574 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1564, size: 64)
!1575 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !1576, entity: !1577, file: !1579, line: 1436)
!1576 = !DINamespace(name: "chrono", scope: !38)
!1577 = !DINamespace(name: "chrono_literals", scope: !1578, exportSymbols: true)
!1578 = !DINamespace(name: "literals", scope: !38, exportSymbols: true)
!1579 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/bits/chrono.h", directory: "")
!1580 = !{!1581, !1582, !1583, !1584, !1585, !1586, !1588, !1589, !1590, !1592, !1593, !1595, !1599, !1602, !1603, !1604}
!1581 = !DILocalVariable(name: "d_entropy", arg: 1, scope: !2, file: !3, line: 51, type: !6)
!1582 = !DILocalVariable(name: "d_val", arg: 2, scope: !2, file: !3, line: 52, type: !9)
!1583 = !DILocalVariable(name: "d_logTable", arg: 3, scope: !2, file: !3, line: 53, type: !13)
!1584 = !DILocalVariable(name: "m", arg: 4, scope: !2, file: !3, line: 54, type: !16)
!1585 = !DILocalVariable(name: "n", arg: 5, scope: !2, file: !3, line: 54, type: !16)
!1586 = !DILocalVariable(name: "x", scope: !2, file: !3, line: 58, type: !1587)
!1587 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !16)
!1588 = !DILocalVariable(name: "y", scope: !2, file: !3, line: 59, type: !1587)
!1589 = !DILocalVariable(name: "idx", scope: !2, file: !3, line: 60, type: !1587)
!1590 = !DILocalVariable(name: "i", scope: !1591, file: !3, line: 62, type: !16)
!1591 = distinct !DILexicalBlock(scope: !2, file: !3, line: 62, column: 3)
!1592 = !DILocalVariable(name: "total", scope: !2, file: !3, line: 64, type: !12)
!1593 = !DILocalVariable(name: "dy", scope: !1594, file: !3, line: 65, type: !16)
!1594 = distinct !DILexicalBlock(scope: !2, file: !3, line: 65, column: 3)
!1595 = !DILocalVariable(name: "dx", scope: !1596, file: !3, line: 66, type: !16)
!1596 = distinct !DILexicalBlock(scope: !1597, file: !3, line: 66, column: 5)
!1597 = distinct !DILexicalBlock(scope: !1598, file: !3, line: 65, column: 35)
!1598 = distinct !DILexicalBlock(scope: !1594, file: !3, line: 65, column: 3)
!1599 = !DILocalVariable(name: "xx", scope: !1600, file: !3, line: 67, type: !16)
!1600 = distinct !DILexicalBlock(scope: !1601, file: !3, line: 66, column: 37)
!1601 = distinct !DILexicalBlock(scope: !1596, file: !3, line: 66, column: 5)
!1602 = !DILocalVariable(name: "yy", scope: !1600, file: !3, line: 68, type: !16)
!1603 = !DILocalVariable(name: "entropy", scope: !2, file: !3, line: 77, type: !8)
!1604 = !DILocalVariable(name: "k", scope: !1605, file: !3, line: 78, type: !16)
!1605 = distinct !DILexicalBlock(scope: !2, file: !3, line: 78, column: 3)
!1606 = !{!1607, !1608}
!1607 = !DITemplateValueParameter(name: "bsize_x", type: !16, value: i32 16)
!1608 = !DITemplateValueParameter(name: "bsize_y", type: !16, value: i32 16)
!1609 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 131072, elements: !1610)
!1610 = !{!1611, !1612}
!1611 = !DISubrange(count: 16)
!1612 = !DISubrange(count: 256)
!1613 = !{i32 1, !"amdhsa_code_object_version", i32 600}
!1614 = !{i32 1, !"amdgpu_printf_kind", !"hostcall"}
!1615 = !{i32 7, !"Dwarf Version", i32 5}
!1616 = !{i32 2, !"Debug Info Version", i32 3}
!1617 = !{i32 1, !"wchar_size", i32 4}
!1618 = !{i32 8, !"PIC Level", i32 2}
!1619 = !{i32 7, !"frame-pointer", i32 2}
!1620 = !{!"AMD clang version 19.0.0git (https://github.com/RadeonOpenCompute/llvm-project roc-6.4.2 25224 d366fa84f3fdcbd4b10847ebd5db572ae12a34fb)"}
!1621 = !{i32 2, i32 0}
!1622 = distinct !DISubprogram(name: "__cxa_pure_virtual", scope: !1623, file: !1623, line: 37, type: !395, scopeLine: 37, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagDefinition, unit: !17)
!1623 = !DIFile(filename: "/opt/rocm-6.4.2/lib/llvm/lib/clang/19/include/__clang_hip_runtime_wrapper.h", directory: "", checksumkind: CSK_MD5, checksum: "3b4af0bdaa6ccc1fa2b6e310d2157303")
!1624 = !DILocation(line: 38, column: 5, scope: !1622)
!1625 = !DILocation(line: 39, column: 3, scope: !1622)
!1626 = distinct !DISubprogram(name: "__cxa_deleted_virtual", scope: !1623, file: !1623, line: 43, type: !395, scopeLine: 43, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagDefinition, unit: !17)
!1627 = !DILocation(line: 44, column: 5, scope: !1626)
!1628 = !DILocation(line: 45, column: 3, scope: !1626)
!1629 = distinct !DISubprogram(name: "__assert_fail", scope: !1630, file: !1630, line: 44, type: !1631, scopeLine: 48, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !1633)
!1630 = !DIFile(filename: "/opt/rocm-6.4.2/include/hip/amd_detail/hip_assert.h", directory: "", checksumkind: CSK_MD5, checksum: "a705f3fd54b4159bc676e001f217fb77")
!1631 = !DISubroutineType(types: !1632)
!1632 = !{null, !10, !10, !28, !10}
!1633 = !{!1634, !1635, !1636, !1637, !1638, !1642, !1643, !1644, !1646, !1648, !1650}
!1634 = !DILocalVariable(name: "assertion", arg: 1, scope: !1629, file: !1630, line: 44, type: !10)
!1635 = !DILocalVariable(name: "file", arg: 2, scope: !1629, file: !1630, line: 45, type: !10)
!1636 = !DILocalVariable(name: "line", arg: 3, scope: !1629, file: !1630, line: 46, type: !28)
!1637 = !DILocalVariable(name: "function", arg: 4, scope: !1629, file: !1630, line: 47, type: !10)
!1638 = !DILocalVariable(name: "fmt", scope: !1629, file: !1630, line: 49, type: !1639)
!1639 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 376, elements: !1640)
!1640 = !{!1641}
!1641 = !DISubrange(count: 47)
!1642 = !DILocalVariable(name: "msg", scope: !1629, file: !1630, line: 68, type: !1487)
!1643 = !DILocalVariable(name: "len", scope: !1629, file: !1630, line: 69, type: !16)
!1644 = !DILocalVariable(name: "tmp", scope: !1645, file: !1630, line: 70, type: !10)
!1645 = distinct !DILexicalBlock(scope: !1629, file: !1630, line: 70, column: 3)
!1646 = !DILocalVariable(name: "tmp", scope: !1647, file: !1630, line: 72, type: !10)
!1647 = distinct !DILexicalBlock(scope: !1629, file: !1630, line: 72, column: 3)
!1648 = !DILocalVariable(name: "tmp", scope: !1649, file: !1630, line: 75, type: !10)
!1649 = distinct !DILexicalBlock(scope: !1629, file: !1630, line: 75, column: 3)
!1650 = !DILocalVariable(name: "tmp", scope: !1651, file: !1630, line: 77, type: !10)
!1651 = distinct !DILexicalBlock(scope: !1629, file: !1630, line: 77, column: 3)
!1652 = !DILocation(line: 44, column: 32, scope: !1629)
!1653 = !DILocation(line: 45, column: 32, scope: !1629)
!1654 = !DILocation(line: 46, column: 33, scope: !1629)
!1655 = !DILocation(line: 47, column: 32, scope: !1629)
!1656 = !DILocation(line: 49, column: 14, scope: !1629)
!1657 = !DILocation(line: 68, column: 8, scope: !1629)
!1658 = !DILocation(line: 68, column: 14, scope: !1629)
!1659 = !DILocation(line: 69, column: 7, scope: !1629)
!1660 = !DILocation(line: 70, column: 3, scope: !1629)
!1661 = !DILocation(line: 70, column: 3, scope: !1645)
!1662 = distinct !{!1662, !1661, !1661, !1663}
!1663 = !{!"llvm.loop.mustprogress"}
!1664 = !DILocation(line: 71, column: 40, scope: !1629)
!1665 = !DILocation(line: 71, column: 45, scope: !1629)
!1666 = !DILocation(line: 71, column: 50, scope: !1629)
!1667 = !DILocation(line: 71, column: 9, scope: !1629)
!1668 = !DILocation(line: 71, column: 7, scope: !1629)
!1669 = !DILocation(line: 72, column: 3, scope: !1629)
!1670 = !DILocation(line: 72, column: 3, scope: !1647)
!1671 = distinct !{!1671, !1670, !1670, !1663}
!1672 = !DILocation(line: 73, column: 40, scope: !1629)
!1673 = !DILocation(line: 73, column: 45, scope: !1629)
!1674 = !DILocation(line: 73, column: 51, scope: !1629)
!1675 = !DILocation(line: 73, column: 9, scope: !1629)
!1676 = !DILocation(line: 73, column: 7, scope: !1629)
!1677 = !DILocation(line: 74, column: 36, scope: !1629)
!1678 = !DILocation(line: 74, column: 44, scope: !1629)
!1679 = !DILocation(line: 74, column: 9, scope: !1629)
!1680 = !DILocation(line: 74, column: 7, scope: !1629)
!1681 = !DILocation(line: 75, column: 3, scope: !1629)
!1682 = !DILocation(line: 75, column: 3, scope: !1649)
!1683 = distinct !{!1683, !1682, !1682, !1663}
!1684 = !DILocation(line: 76, column: 40, scope: !1629)
!1685 = !DILocation(line: 76, column: 45, scope: !1629)
!1686 = !DILocation(line: 76, column: 55, scope: !1629)
!1687 = !DILocation(line: 76, column: 9, scope: !1629)
!1688 = !DILocation(line: 76, column: 7, scope: !1629)
!1689 = !DILocation(line: 77, column: 3, scope: !1629)
!1690 = !DILocation(line: 77, column: 3, scope: !1651)
!1691 = distinct !{!1691, !1690, !1690, !1663}
!1692 = !DILocation(line: 78, column: 34, scope: !1629)
!1693 = !DILocation(line: 78, column: 39, scope: !1629)
!1694 = !DILocation(line: 78, column: 50, scope: !1629)
!1695 = !DILocation(line: 78, column: 3, scope: !1629)
!1696 = !DILocation(line: 82, column: 3, scope: !1629)
!1697 = !DILocation(line: 83, column: 1, scope: !1629)
!1698 = distinct !DISubprogram(name: "__assertfail", scope: !1630, file: !1630, line: 86, type: !395, scopeLine: 87, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17)
!1699 = !DILocation(line: 89, column: 5, scope: !1698)
!1700 = !DILocation(line: 90, column: 1, scope: !1698)
!1701 = distinct !DISubprogram(name: "entropy", linkageName: "_Z7entropyPfPKcii", scope: !3, file: !3, line: 9, type: !1702, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !1704)
!1702 = !DISubroutineType(types: !1703)
!1703 = !{null, !6, !9, !16, !16}
!1704 = !{!1705, !1706, !1707, !1708, !1709, !1710, !1711, !1714, !1716, !1717, !1719, !1723, !1726, !1727, !1728, !1732}
!1705 = !DILocalVariable(name: "d_entropy", arg: 1, scope: !1701, file: !3, line: 10, type: !6)
!1706 = !DILocalVariable(name: "d_val", arg: 2, scope: !1701, file: !3, line: 11, type: !9)
!1707 = !DILocalVariable(name: "height", arg: 3, scope: !1701, file: !3, line: 12, type: !16)
!1708 = !DILocalVariable(name: "width", arg: 4, scope: !1701, file: !3, line: 12, type: !16)
!1709 = !DILocalVariable(name: "x", scope: !1701, file: !3, line: 14, type: !1587)
!1710 = !DILocalVariable(name: "y", scope: !1701, file: !3, line: 15, type: !1587)
!1711 = !DILocalVariable(name: "count", scope: !1701, file: !3, line: 18, type: !1712)
!1712 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 128, elements: !1713)
!1713 = !{!1611}
!1714 = !DILocalVariable(name: "i", scope: !1715, file: !3, line: 19, type: !16)
!1715 = distinct !DILexicalBlock(scope: !1701, file: !3, line: 19, column: 3)
!1716 = !DILocalVariable(name: "total", scope: !1701, file: !3, line: 22, type: !12)
!1717 = !DILocalVariable(name: "dy", scope: !1718, file: !3, line: 25, type: !16)
!1718 = distinct !DILexicalBlock(scope: !1701, file: !3, line: 25, column: 3)
!1719 = !DILocalVariable(name: "dx", scope: !1720, file: !3, line: 26, type: !16)
!1720 = distinct !DILexicalBlock(scope: !1721, file: !3, line: 26, column: 5)
!1721 = distinct !DILexicalBlock(scope: !1722, file: !3, line: 25, column: 35)
!1722 = distinct !DILexicalBlock(scope: !1718, file: !3, line: 25, column: 3)
!1723 = !DILocalVariable(name: "xx", scope: !1724, file: !3, line: 27, type: !16)
!1724 = distinct !DILexicalBlock(scope: !1725, file: !3, line: 26, column: 37)
!1725 = distinct !DILexicalBlock(scope: !1720, file: !3, line: 26, column: 5)
!1726 = !DILocalVariable(name: "yy", scope: !1724, file: !3, line: 28, type: !16)
!1727 = !DILocalVariable(name: "entropy", scope: !1701, file: !3, line: 36, type: !8)
!1728 = !DILocalVariable(name: "k", scope: !1729, file: !3, line: 40, type: !16)
!1729 = distinct !DILexicalBlock(scope: !1730, file: !3, line: 40, column: 5)
!1730 = distinct !DILexicalBlock(scope: !1731, file: !3, line: 39, column: 10)
!1731 = distinct !DILexicalBlock(scope: !1701, file: !3, line: 37, column: 7)
!1732 = !DILocalVariable(name: "p", scope: !1733, file: !3, line: 41, type: !8)
!1733 = distinct !DILexicalBlock(scope: !1734, file: !3, line: 40, column: 33)
!1734 = distinct !DILexicalBlock(scope: !1729, file: !3, line: 40, column: 5)
!1735 = !DILocation(line: 10, column: 29, scope: !1701)
!1736 = !DILocation(line: 11, column: 29, scope: !1701)
!1737 = !DILocation(line: 12, column: 9, scope: !1701)
!1738 = !DILocation(line: 12, column: 21, scope: !1701)
!1739 = !DILocation(line: 14, column: 13, scope: !1701)
!1740 = !DILocation(line: 265, column: 59, scope: !1741, inlinedAt: !1745)
!1741 = distinct !DISubprogram(name: "__hip_get_thread_idx_x", linkageName: "_ZL22__hip_get_thread_idx_xv", scope: !1742, file: !1742, line: 265, type: !1743, scopeLine: 265, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !17)
!1742 = !DIFile(filename: "/opt/rocm-6.4.2/include/hip/amd_detail/amd_hip_runtime.h", directory: "", checksumkind: CSK_MD5, checksum: "38097f6211bac4e19f9ae3395b411f76")
!1743 = !DISubroutineType(types: !1744)
!1744 = !{!28}
!1745 = distinct !DILocation(line: 291, column: 3, scope: !1746, inlinedAt: !1758)
!1746 = distinct !DISubprogram(name: "__get_x", linkageName: "_ZN25__hip_builtin_threadIdx_t7__get_xEv", scope: !1747, file: !1742, line: 291, type: !1743, scopeLine: 291, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, declaration: !1749)
!1747 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__hip_builtin_threadIdx_t", file: !1742, line: 290, size: 8, flags: DIFlagTypePassByValue, elements: !1748, identifier: "_ZTS25__hip_builtin_threadIdx_t")
!1748 = !{!1749, !1750, !1751, !1752}
!1749 = !DISubprogram(name: "__get_x", linkageName: "_ZN25__hip_builtin_threadIdx_t7__get_xEv", scope: !1747, file: !1742, line: 291, type: !1743, scopeLine: 291, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!1750 = !DISubprogram(name: "__get_y", linkageName: "_ZN25__hip_builtin_threadIdx_t7__get_yEv", scope: !1747, file: !1742, line: 292, type: !1743, scopeLine: 292, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!1751 = !DISubprogram(name: "__get_z", linkageName: "_ZN25__hip_builtin_threadIdx_t7__get_zEv", scope: !1747, file: !1742, line: 293, type: !1743, scopeLine: 293, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!1752 = !DISubprogram(name: "operator dim3", linkageName: "_ZNK25__hip_builtin_threadIdx_tcv4dim3Ev", scope: !1747, file: !1742, line: 295, type: !1753, scopeLine: 295, flags: DIFlagPrototyped, spFlags: 0)
!1753 = !DISubroutineType(types: !1754)
!1754 = !{!1755, !1756}
!1755 = !DIDerivedType(tag: DW_TAG_typedef, name: "dim3", file: !21, line: 1186, baseType: !20)
!1756 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1757, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1757 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1747)
!1758 = distinct !DILocation(line: 14, column: 17, scope: !1701)
!1759 = !DILocation(line: 270, column: 58, scope: !1760, inlinedAt: !1761)
!1760 = distinct !DISubprogram(name: "__hip_get_block_idx_x", linkageName: "_ZL21__hip_get_block_idx_xv", scope: !1742, file: !1742, line: 270, type: !1743, scopeLine: 270, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !17)
!1761 = distinct !DILocation(line: 300, column: 3, scope: !1762, inlinedAt: !1773)
!1762 = distinct !DISubprogram(name: "__get_x", linkageName: "_ZN24__hip_builtin_blockIdx_t7__get_xEv", scope: !1763, file: !1742, line: 300, type: !1743, scopeLine: 300, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, declaration: !1765)
!1763 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__hip_builtin_blockIdx_t", file: !1742, line: 299, size: 8, flags: DIFlagTypePassByValue, elements: !1764, identifier: "_ZTS24__hip_builtin_blockIdx_t")
!1764 = !{!1765, !1766, !1767, !1768}
!1765 = !DISubprogram(name: "__get_x", linkageName: "_ZN24__hip_builtin_blockIdx_t7__get_xEv", scope: !1763, file: !1742, line: 300, type: !1743, scopeLine: 300, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!1766 = !DISubprogram(name: "__get_y", linkageName: "_ZN24__hip_builtin_blockIdx_t7__get_yEv", scope: !1763, file: !1742, line: 301, type: !1743, scopeLine: 301, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!1767 = !DISubprogram(name: "__get_z", linkageName: "_ZN24__hip_builtin_blockIdx_t7__get_zEv", scope: !1763, file: !1742, line: 302, type: !1743, scopeLine: 302, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!1768 = !DISubprogram(name: "operator dim3", linkageName: "_ZNK24__hip_builtin_blockIdx_tcv4dim3Ev", scope: !1763, file: !1742, line: 304, type: !1769, scopeLine: 304, flags: DIFlagPrototyped, spFlags: 0)
!1769 = !DISubroutineType(types: !1770)
!1770 = !{!1755, !1771}
!1771 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1772, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1772 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1763)
!1773 = distinct !DILocation(line: 14, column: 31, scope: !1701)
!1774 = !DILocation(line: 275, column: 58, scope: !1775, inlinedAt: !1776)
!1775 = distinct !DISubprogram(name: "__hip_get_block_dim_x", linkageName: "_ZL21__hip_get_block_dim_xv", scope: !1742, file: !1742, line: 275, type: !1743, scopeLine: 275, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !17)
!1776 = distinct !DILocation(line: 309, column: 3, scope: !1777, inlinedAt: !1788)
!1777 = distinct !DISubprogram(name: "__get_x", linkageName: "_ZN24__hip_builtin_blockDim_t7__get_xEv", scope: !1778, file: !1742, line: 309, type: !1743, scopeLine: 309, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, declaration: !1780)
!1778 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__hip_builtin_blockDim_t", file: !1742, line: 308, size: 8, flags: DIFlagTypePassByValue, elements: !1779, identifier: "_ZTS24__hip_builtin_blockDim_t")
!1779 = !{!1780, !1781, !1782, !1783}
!1780 = !DISubprogram(name: "__get_x", linkageName: "_ZN24__hip_builtin_blockDim_t7__get_xEv", scope: !1778, file: !1742, line: 309, type: !1743, scopeLine: 309, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!1781 = !DISubprogram(name: "__get_y", linkageName: "_ZN24__hip_builtin_blockDim_t7__get_yEv", scope: !1778, file: !1742, line: 310, type: !1743, scopeLine: 310, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!1782 = !DISubprogram(name: "__get_z", linkageName: "_ZN24__hip_builtin_blockDim_t7__get_zEv", scope: !1778, file: !1742, line: 311, type: !1743, scopeLine: 311, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!1783 = !DISubprogram(name: "operator dim3", linkageName: "_ZNK24__hip_builtin_blockDim_tcv4dim3Ev", scope: !1778, file: !1742, line: 313, type: !1784, scopeLine: 313, flags: DIFlagPrototyped, spFlags: 0)
!1784 = !DISubroutineType(types: !1785)
!1785 = !{!1755, !1786}
!1786 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1787, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1787 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1778)
!1788 = distinct !DILocation(line: 14, column: 44, scope: !1701)
!1789 = !DILocation(line: 14, column: 42, scope: !1701)
!1790 = !DILocation(line: 14, column: 29, scope: !1701)
!1791 = !DILocation(line: 15, column: 13, scope: !1701)
!1792 = !DILocation(line: 266, column: 59, scope: !1793, inlinedAt: !1794)
!1793 = distinct !DISubprogram(name: "__hip_get_thread_idx_y", linkageName: "_ZL22__hip_get_thread_idx_yv", scope: !1742, file: !1742, line: 266, type: !1743, scopeLine: 266, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !17)
!1794 = distinct !DILocation(line: 292, column: 3, scope: !1795, inlinedAt: !1796)
!1795 = distinct !DISubprogram(name: "__get_y", linkageName: "_ZN25__hip_builtin_threadIdx_t7__get_yEv", scope: !1747, file: !1742, line: 292, type: !1743, scopeLine: 292, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, declaration: !1750)
!1796 = distinct !DILocation(line: 15, column: 17, scope: !1701)
!1797 = !DILocation(line: 271, column: 58, scope: !1798, inlinedAt: !1799)
!1798 = distinct !DISubprogram(name: "__hip_get_block_idx_y", linkageName: "_ZL21__hip_get_block_idx_yv", scope: !1742, file: !1742, line: 271, type: !1743, scopeLine: 271, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !17)
!1799 = distinct !DILocation(line: 301, column: 3, scope: !1800, inlinedAt: !1801)
!1800 = distinct !DISubprogram(name: "__get_y", linkageName: "_ZN24__hip_builtin_blockIdx_t7__get_yEv", scope: !1763, file: !1742, line: 301, type: !1743, scopeLine: 301, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, declaration: !1766)
!1801 = distinct !DILocation(line: 15, column: 31, scope: !1701)
!1802 = !DILocation(line: 276, column: 58, scope: !1803, inlinedAt: !1804)
!1803 = distinct !DISubprogram(name: "__hip_get_block_dim_y", linkageName: "_ZL21__hip_get_block_dim_yv", scope: !1742, file: !1742, line: 276, type: !1743, scopeLine: 276, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !17)
!1804 = distinct !DILocation(line: 310, column: 3, scope: !1805, inlinedAt: !1806)
!1805 = distinct !DISubprogram(name: "__get_y", linkageName: "_ZN24__hip_builtin_blockDim_t7__get_yEv", scope: !1778, file: !1742, line: 310, type: !1743, scopeLine: 310, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, declaration: !1781)
!1806 = distinct !DILocation(line: 15, column: 44, scope: !1701)
!1807 = !DILocation(line: 15, column: 42, scope: !1701)
!1808 = !DILocation(line: 15, column: 29, scope: !1701)
!1809 = !DILocation(line: 18, column: 8, scope: !1701)
!1810 = !DILocation(line: 19, column: 12, scope: !1715)
!1811 = !DILocation(line: 19, column: 8, scope: !1715)
!1812 = !DILocation(line: 19, column: 19, scope: !1813)
!1813 = distinct !DILexicalBlock(scope: !1715, file: !3, line: 19, column: 3)
!1814 = !DILocation(line: 19, column: 21, scope: !1813)
!1815 = !DILocation(line: 19, column: 3, scope: !1715)
!1816 = !DILocation(line: 19, column: 38, scope: !1813)
!1817 = !DILocation(line: 19, column: 32, scope: !1813)
!1818 = !DILocation(line: 19, column: 41, scope: !1813)
!1819 = !DILocation(line: 19, column: 28, scope: !1813)
!1820 = !DILocation(line: 19, column: 3, scope: !1813)
!1821 = distinct !{!1821, !1815, !1822, !1663}
!1822 = !DILocation(line: 19, column: 43, scope: !1715)
!1823 = !DILocation(line: 22, column: 8, scope: !1701)
!1824 = !DILocation(line: 25, column: 11, scope: !1718)
!1825 = !DILocation(line: 25, column: 7, scope: !1718)
!1826 = !DILocation(line: 25, column: 20, scope: !1722)
!1827 = !DILocation(line: 25, column: 23, scope: !1722)
!1828 = !DILocation(line: 25, column: 3, scope: !1718)
!1829 = !DILocation(line: 26, column: 13, scope: !1720)
!1830 = !DILocation(line: 26, column: 9, scope: !1720)
!1831 = !DILocation(line: 26, column: 22, scope: !1725)
!1832 = !DILocation(line: 26, column: 25, scope: !1725)
!1833 = !DILocation(line: 26, column: 5, scope: !1720)
!1834 = !DILocation(line: 27, column: 11, scope: !1724)
!1835 = !DILocation(line: 27, column: 16, scope: !1724)
!1836 = !DILocation(line: 27, column: 20, scope: !1724)
!1837 = !DILocation(line: 27, column: 18, scope: !1724)
!1838 = !DILocation(line: 28, column: 11, scope: !1724)
!1839 = !DILocation(line: 28, column: 16, scope: !1724)
!1840 = !DILocation(line: 28, column: 20, scope: !1724)
!1841 = !DILocation(line: 28, column: 18, scope: !1724)
!1842 = !DILocation(line: 29, column: 10, scope: !1843)
!1843 = distinct !DILexicalBlock(scope: !1724, file: !3, line: 29, column: 10)
!1844 = !DILocation(line: 29, column: 13, scope: !1843)
!1845 = !DILocation(line: 29, column: 18, scope: !1843)
!1846 = !DILocation(line: 29, column: 21, scope: !1843)
!1847 = !DILocation(line: 29, column: 24, scope: !1843)
!1848 = !DILocation(line: 29, column: 29, scope: !1843)
!1849 = !DILocation(line: 29, column: 32, scope: !1843)
!1850 = !DILocation(line: 29, column: 37, scope: !1843)
!1851 = !DILocation(line: 29, column: 35, scope: !1843)
!1852 = !DILocation(line: 29, column: 44, scope: !1843)
!1853 = !DILocation(line: 29, column: 47, scope: !1843)
!1854 = !DILocation(line: 29, column: 52, scope: !1843)
!1855 = !DILocation(line: 29, column: 50, scope: !1843)
!1856 = !DILocation(line: 29, column: 10, scope: !1724)
!1857 = !DILocation(line: 30, column: 15, scope: !1858)
!1858 = distinct !DILexicalBlock(scope: !1843, file: !3, line: 29, column: 59)
!1859 = !DILocation(line: 30, column: 21, scope: !1858)
!1860 = !DILocation(line: 30, column: 26, scope: !1858)
!1861 = !DILocation(line: 30, column: 24, scope: !1858)
!1862 = !DILocation(line: 30, column: 34, scope: !1858)
!1863 = !DILocation(line: 30, column: 32, scope: !1858)
!1864 = !DILocation(line: 30, column: 9, scope: !1858)
!1865 = !DILocation(line: 30, column: 38, scope: !1858)
!1866 = !DILocation(line: 31, column: 14, scope: !1858)
!1867 = !DILocation(line: 32, column: 7, scope: !1858)
!1868 = !DILocation(line: 33, column: 5, scope: !1724)
!1869 = !DILocation(line: 26, column: 33, scope: !1725)
!1870 = !DILocation(line: 26, column: 5, scope: !1725)
!1871 = distinct !{!1871, !1833, !1872, !1663}
!1872 = !DILocation(line: 33, column: 5, scope: !1720)
!1873 = !DILocation(line: 34, column: 3, scope: !1721)
!1874 = !DILocation(line: 25, column: 31, scope: !1722)
!1875 = !DILocation(line: 25, column: 3, scope: !1722)
!1876 = distinct !{!1876, !1828, !1877, !1663}
!1877 = !DILocation(line: 34, column: 3, scope: !1718)
!1878 = !DILocation(line: 36, column: 9, scope: !1701)
!1879 = !DILocation(line: 37, column: 7, scope: !1731)
!1880 = !DILocation(line: 37, column: 13, scope: !1731)
!1881 = !DILocation(line: 37, column: 7, scope: !1701)
!1882 = !DILocation(line: 38, column: 11, scope: !1883)
!1883 = distinct !DILexicalBlock(scope: !1731, file: !3, line: 37, column: 18)
!1884 = !DILocation(line: 39, column: 3, scope: !1883)
!1885 = !DILocation(line: 40, column: 13, scope: !1729)
!1886 = !DILocation(line: 40, column: 9, scope: !1729)
!1887 = !DILocation(line: 40, column: 20, scope: !1734)
!1888 = !DILocation(line: 40, column: 22, scope: !1734)
!1889 = !DILocation(line: 40, column: 5, scope: !1729)
!1890 = !DILocation(line: 41, column: 13, scope: !1733)
!1891 = !DILocation(line: 41, column: 41, scope: !1733)
!1892 = !DILocation(line: 41, column: 35, scope: !1733)
!1893 = !DILocation(line: 41, column: 52, scope: !1733)
!1894 = !DILocalVariable(name: "__x", arg: 1, scope: !1895, file: !767, line: 227, type: !8)
!1895 = distinct !DISubprogram(name: "__fdividef", linkageName: "_ZL10__fdividefff", scope: !767, file: !767, line: 227, type: !141, scopeLine: 227, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !17, retainedNodes: !1896)
!1896 = !{!1894, !1897}
!1897 = !DILocalVariable(name: "__y", arg: 2, scope: !1895, file: !767, line: 227, type: !8)
!1898 = !DILocation(line: 227, column: 24, scope: !1895, inlinedAt: !1899)
!1899 = distinct !DILocation(line: 41, column: 17, scope: !1733)
!1900 = !DILocation(line: 227, column: 35, scope: !1895, inlinedAt: !1899)
!1901 = !DILocation(line: 227, column: 49, scope: !1895, inlinedAt: !1899)
!1902 = !DILocation(line: 227, column: 55, scope: !1895, inlinedAt: !1899)
!1903 = !DILocation(line: 227, column: 53, scope: !1895, inlinedAt: !1899)
!1904 = !DILocation(line: 42, column: 18, scope: !1733)
!1905 = !DILocation(line: 42, column: 28, scope: !1733)
!1906 = !DILocation(line: 521, column: 19, scope: !834, inlinedAt: !1907)
!1907 = distinct !DILocation(line: 42, column: 22, scope: !1733)
!1908 = !DILocation(line: 521, column: 74, scope: !834, inlinedAt: !1907)
!1909 = !DILocation(line: 521, column: 33, scope: !834, inlinedAt: !1907)
!1910 = !DILocation(line: 42, column: 20, scope: !1733)
!1911 = !DILocation(line: 42, column: 15, scope: !1733)
!1912 = !DILocation(line: 43, column: 5, scope: !1733)
!1913 = !DILocation(line: 40, column: 29, scope: !1734)
!1914 = !DILocation(line: 40, column: 5, scope: !1734)
!1915 = distinct !{!1915, !1889, !1916, !1663}
!1916 = !DILocation(line: 43, column: 5, scope: !1729)
!1917 = !DILocation(line: 46, column: 6, scope: !1918)
!1918 = distinct !DILexicalBlock(scope: !1701, file: !3, line: 46, column: 6)
!1919 = !DILocation(line: 46, column: 10, scope: !1918)
!1920 = !DILocation(line: 46, column: 8, scope: !1918)
!1921 = !DILocation(line: 46, column: 17, scope: !1918)
!1922 = !DILocation(line: 46, column: 20, scope: !1918)
!1923 = !DILocation(line: 46, column: 24, scope: !1918)
!1924 = !DILocation(line: 46, column: 22, scope: !1918)
!1925 = !DILocation(line: 46, column: 6, scope: !1701)
!1926 = !DILocation(line: 46, column: 58, scope: !1918)
!1927 = !DILocation(line: 46, column: 31, scope: !1918)
!1928 = !DILocation(line: 46, column: 41, scope: !1918)
!1929 = !DILocation(line: 46, column: 45, scope: !1918)
!1930 = !DILocation(line: 46, column: 43, scope: !1918)
!1931 = !DILocation(line: 46, column: 53, scope: !1918)
!1932 = !DILocation(line: 46, column: 51, scope: !1918)
!1933 = !DILocation(line: 46, column: 56, scope: !1918)
!1934 = !DILocation(line: 47, column: 1, scope: !1701)
!1935 = !DILocation(line: 51, column: 28, scope: !2)
!1936 = !DILocation(line: 52, column: 28, scope: !2)
!1937 = !DILocation(line: 53, column: 28, scope: !2)
!1938 = !DILocation(line: 54, column: 7, scope: !2)
!1939 = !DILocation(line: 54, column: 14, scope: !2)
!1940 = !DILocation(line: 58, column: 13, scope: !2)
!1941 = !DILocation(line: 265, column: 59, scope: !1741, inlinedAt: !1942)
!1942 = distinct !DILocation(line: 291, column: 3, scope: !1746, inlinedAt: !1943)
!1943 = distinct !DILocation(line: 58, column: 17, scope: !2)
!1944 = !DILocation(line: 270, column: 58, scope: !1760, inlinedAt: !1945)
!1945 = distinct !DILocation(line: 300, column: 3, scope: !1762, inlinedAt: !1946)
!1946 = distinct !DILocation(line: 58, column: 31, scope: !2)
!1947 = !DILocation(line: 275, column: 58, scope: !1775, inlinedAt: !1948)
!1948 = distinct !DILocation(line: 309, column: 3, scope: !1777, inlinedAt: !1949)
!1949 = distinct !DILocation(line: 58, column: 44, scope: !2)
!1950 = !DILocation(line: 58, column: 42, scope: !2)
!1951 = !DILocation(line: 58, column: 29, scope: !2)
!1952 = !DILocation(line: 59, column: 13, scope: !2)
!1953 = !DILocation(line: 266, column: 59, scope: !1793, inlinedAt: !1954)
!1954 = distinct !DILocation(line: 292, column: 3, scope: !1795, inlinedAt: !1955)
!1955 = distinct !DILocation(line: 59, column: 17, scope: !2)
!1956 = !DILocation(line: 271, column: 58, scope: !1798, inlinedAt: !1957)
!1957 = distinct !DILocation(line: 301, column: 3, scope: !1800, inlinedAt: !1958)
!1958 = distinct !DILocation(line: 59, column: 31, scope: !2)
!1959 = !DILocation(line: 276, column: 58, scope: !1803, inlinedAt: !1960)
!1960 = distinct !DILocation(line: 310, column: 3, scope: !1805, inlinedAt: !1961)
!1961 = distinct !DILocation(line: 59, column: 44, scope: !2)
!1962 = !DILocation(line: 59, column: 42, scope: !2)
!1963 = !DILocation(line: 59, column: 29, scope: !2)
!1964 = !DILocation(line: 60, column: 13, scope: !2)
!1965 = !DILocation(line: 266, column: 59, scope: !1793, inlinedAt: !1966)
!1966 = distinct !DILocation(line: 292, column: 3, scope: !1795, inlinedAt: !1967)
!1967 = distinct !DILocation(line: 60, column: 19, scope: !2)
!1968 = !DILocation(line: 60, column: 30, scope: !2)
!1969 = !DILocation(line: 265, column: 59, scope: !1741, inlinedAt: !1970)
!1970 = distinct !DILocation(line: 291, column: 3, scope: !1746, inlinedAt: !1971)
!1971 = distinct !DILocation(line: 60, column: 41, scope: !2)
!1972 = !DILocation(line: 60, column: 39, scope: !2)
!1973 = !DILocation(line: 62, column: 11, scope: !1591)
!1974 = !DILocation(line: 62, column: 7, scope: !1591)
!1975 = !DILocation(line: 62, column: 18, scope: !1976)
!1976 = distinct !DILexicalBlock(scope: !1591, file: !3, line: 62, column: 3)
!1977 = !DILocation(line: 62, column: 20, scope: !1976)
!1978 = !DILocation(line: 62, column: 3, scope: !1591)
!1979 = !DILocation(line: 62, column: 39, scope: !1976)
!1980 = !DILocation(line: 62, column: 30, scope: !1976)
!1981 = !DILocation(line: 62, column: 42, scope: !1976)
!1982 = !DILocation(line: 62, column: 47, scope: !1976)
!1983 = !DILocation(line: 62, column: 26, scope: !1976)
!1984 = !DILocation(line: 62, column: 3, scope: !1976)
!1985 = distinct !{!1985, !1978, !1986, !1663}
!1986 = !DILocation(line: 62, column: 49, scope: !1591)
!1987 = !DILocation(line: 64, column: 8, scope: !2)
!1988 = !DILocation(line: 65, column: 11, scope: !1594)
!1989 = !DILocation(line: 65, column: 7, scope: !1594)
!1990 = !DILocation(line: 65, column: 20, scope: !1598)
!1991 = !DILocation(line: 65, column: 23, scope: !1598)
!1992 = !DILocation(line: 65, column: 3, scope: !1594)
!1993 = !DILocation(line: 66, column: 13, scope: !1596)
!1994 = !DILocation(line: 66, column: 9, scope: !1596)
!1995 = !DILocation(line: 66, column: 22, scope: !1601)
!1996 = !DILocation(line: 66, column: 25, scope: !1601)
!1997 = !DILocation(line: 66, column: 5, scope: !1596)
!1998 = !DILocation(line: 67, column: 11, scope: !1600)
!1999 = !DILocation(line: 67, column: 16, scope: !1600)
!2000 = !DILocation(line: 67, column: 20, scope: !1600)
!2001 = !DILocation(line: 67, column: 18, scope: !1600)
!2002 = !DILocation(line: 68, column: 11, scope: !1600)
!2003 = !DILocation(line: 68, column: 16, scope: !1600)
!2004 = !DILocation(line: 68, column: 20, scope: !1600)
!2005 = !DILocation(line: 68, column: 18, scope: !1600)
!2006 = !DILocation(line: 70, column: 10, scope: !2007)
!2007 = distinct !DILexicalBlock(scope: !1600, file: !3, line: 70, column: 10)
!2008 = !DILocation(line: 70, column: 13, scope: !2007)
!2009 = !DILocation(line: 70, column: 18, scope: !2007)
!2010 = !DILocation(line: 70, column: 21, scope: !2007)
!2011 = !DILocation(line: 70, column: 24, scope: !2007)
!2012 = !DILocation(line: 70, column: 29, scope: !2007)
!2013 = !DILocation(line: 70, column: 32, scope: !2007)
!2014 = !DILocation(line: 70, column: 37, scope: !2007)
!2015 = !DILocation(line: 70, column: 35, scope: !2007)
!2016 = !DILocation(line: 70, column: 39, scope: !2007)
!2017 = !DILocation(line: 70, column: 42, scope: !2007)
!2018 = !DILocation(line: 70, column: 47, scope: !2007)
!2019 = !DILocation(line: 70, column: 45, scope: !2007)
!2020 = !DILocation(line: 70, column: 10, scope: !1600)
!2021 = !DILocation(line: 71, column: 18, scope: !2022)
!2022 = distinct !DILexicalBlock(scope: !2007, file: !3, line: 70, column: 50)
!2023 = !DILocation(line: 71, column: 24, scope: !2022)
!2024 = !DILocation(line: 71, column: 27, scope: !2022)
!2025 = !DILocation(line: 71, column: 26, scope: !2022)
!2026 = !DILocation(line: 71, column: 29, scope: !2022)
!2027 = !DILocation(line: 71, column: 28, scope: !2022)
!2028 = !DILocation(line: 71, column: 9, scope: !2022)
!2029 = !DILocation(line: 71, column: 34, scope: !2022)
!2030 = !DILocation(line: 71, column: 38, scope: !2022)
!2031 = !DILocation(line: 72, column: 14, scope: !2022)
!2032 = !DILocation(line: 73, column: 7, scope: !2022)
!2033 = !DILocation(line: 74, column: 5, scope: !1600)
!2034 = !DILocation(line: 66, column: 33, scope: !1601)
!2035 = !DILocation(line: 66, column: 5, scope: !1601)
!2036 = distinct !{!2036, !1997, !2037, !1663}
!2037 = !DILocation(line: 74, column: 5, scope: !1596)
!2038 = !DILocation(line: 75, column: 3, scope: !1597)
!2039 = !DILocation(line: 65, column: 31, scope: !1598)
!2040 = !DILocation(line: 65, column: 3, scope: !1598)
!2041 = distinct !{!2041, !1992, !2042, !1663}
!2042 = !DILocation(line: 75, column: 3, scope: !1594)
!2043 = !DILocation(line: 77, column: 9, scope: !2)
!2044 = !DILocation(line: 78, column: 11, scope: !1605)
!2045 = !DILocation(line: 78, column: 7, scope: !1605)
!2046 = !DILocation(line: 78, column: 18, scope: !2047)
!2047 = distinct !DILexicalBlock(scope: !1605, file: !3, line: 78, column: 3)
!2048 = !DILocation(line: 78, column: 20, scope: !2047)
!2049 = !DILocation(line: 78, column: 3, scope: !1605)
!2050 = !DILocation(line: 79, column: 16, scope: !2047)
!2051 = !DILocation(line: 79, column: 36, scope: !2047)
!2052 = !DILocation(line: 79, column: 27, scope: !2047)
!2053 = !DILocation(line: 79, column: 39, scope: !2047)
!2054 = !DILocation(line: 79, column: 13, scope: !2047)
!2055 = !DILocation(line: 79, column: 5, scope: !2047)
!2056 = !DILocation(line: 78, column: 27, scope: !2047)
!2057 = !DILocation(line: 78, column: 3, scope: !2047)
!2058 = distinct !{!2058, !2049, !2059, !1663}
!2059 = !DILocation(line: 79, column: 43, scope: !1605)
!2060 = !DILocation(line: 81, column: 13, scope: !2)
!2061 = !DILocation(line: 81, column: 23, scope: !2)
!2062 = !DILocation(line: 81, column: 21, scope: !2)
!2063 = !DILocation(line: 81, column: 37, scope: !2)
!2064 = !DILocation(line: 521, column: 19, scope: !834, inlinedAt: !2065)
!2065 = distinct !DILocation(line: 81, column: 31, scope: !2)
!2066 = !DILocation(line: 521, column: 74, scope: !834, inlinedAt: !2065)
!2067 = !DILocation(line: 521, column: 33, scope: !834, inlinedAt: !2065)
!2068 = !DILocation(line: 81, column: 29, scope: !2)
!2069 = !DILocation(line: 81, column: 11, scope: !2)
!2070 = !DILocation(line: 82, column: 6, scope: !2071)
!2071 = distinct !DILexicalBlock(scope: !2, file: !3, line: 82, column: 6)
!2072 = !DILocation(line: 82, column: 10, scope: !2071)
!2073 = !DILocation(line: 82, column: 8, scope: !2071)
!2074 = !DILocation(line: 82, column: 12, scope: !2071)
!2075 = !DILocation(line: 82, column: 15, scope: !2071)
!2076 = !DILocation(line: 82, column: 19, scope: !2071)
!2077 = !DILocation(line: 82, column: 17, scope: !2071)
!2078 = !DILocation(line: 82, column: 6, scope: !2)
!2079 = !DILocation(line: 82, column: 41, scope: !2071)
!2080 = !DILocation(line: 82, column: 22, scope: !2071)
!2081 = !DILocation(line: 82, column: 32, scope: !2071)
!2082 = !DILocation(line: 82, column: 34, scope: !2071)
!2083 = !DILocation(line: 82, column: 33, scope: !2071)
!2084 = !DILocation(line: 82, column: 36, scope: !2071)
!2085 = !DILocation(line: 82, column: 35, scope: !2071)
!2086 = !DILocation(line: 82, column: 39, scope: !2071)
!2087 = !DILocation(line: 83, column: 1, scope: !2)
!2088 = !{!2089, !2089, i64 0}
!2089 = !{!"int", !2090, i64 0}
!2090 = !{!"omnipotent char", !2091, i64 0}
!2091 = !{!"Simple C/C++ TBAA"}
!2092 = !{!2093, !2093, i64 0}
!2093 = !{!"long", !2090, i64 0}
!2094 = !{!2095, !2096, i64 0}
!2095 = !{!"", !2096, i64 0, !2096, i64 8, !2097, i64 16, !2093, i64 24, !2093, i64 32, !2093, i64 40}
!2096 = !{!"any pointer", !2090, i64 0}
!2097 = !{!"hsa_signal_s", !2093, i64 0}
!2098 = !{!2095, !2093, i64 40}
!2099 = !{!2095, !2096, i64 8}
!2100 = !{!2101, !2089, i64 16}
!2101 = !{!"", !2093, i64 0, !2093, i64 8, !2089, i64 16, !2089, i64 20}
!2102 = !{!2101, !2093, i64 8}
!2103 = !{!2101, !2089, i64 20}
!2104 = !{!2101, !2093, i64 0}
!2105 = !{!2106, !2093, i64 16}
!2106 = !{!"amd_signal_s", !2093, i64 0, !2090, i64 8, !2093, i64 16, !2089, i64 24, !2089, i64 28, !2093, i64 32, !2093, i64 40, !2090, i64 48, !2090, i64 56}
!2107 = !{!2106, !2089, i64 24}
!2108 = !{!2090, !2090, i64 0}
!2109 = !{i16 1, i16 1025}
!2110 = !{}
!2111 = !{!2112, !2089, i64 12}
!2112 = !{!"hsa_kernel_dispatch_packet_s", !2113, i64 0, !2113, i64 2, !2113, i64 4, !2113, i64 6, !2113, i64 8, !2113, i64 10, !2089, i64 12, !2089, i64 16, !2089, i64 20, !2089, i64 24, !2089, i64 28, !2090, i64 32, !2096, i64 40, !2093, i64 48, !2097, i64 56}
!2113 = !{!"short", !2090, i64 0}
!2114 = !{!2113, !2113, i64 0}
!2115 = !{!2112, !2089, i64 16}
!2116 = !{!2112, !2089, i64 20}
