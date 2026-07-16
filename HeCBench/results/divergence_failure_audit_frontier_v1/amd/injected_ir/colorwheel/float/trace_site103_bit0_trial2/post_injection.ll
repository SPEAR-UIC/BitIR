; ModuleID = '/tmp/bitir_failure_audit_injected_ir_colorwheel_site103_bit0_trial2/device.injected.bc'
source_filename = "/ccs/home/mdunlavy/GPU_Fault_Injection/HeCBench/src/colorwheel-hip/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8:9"
target triple = "amdgcn-amd-amdhsa"

%0 = type { i64, i64, i32, i32 }
%1 = type { [64 x [8 x i64]] }
%struct.__hip_builtin_blockDim_t = type { i8 }
%struct.__hip_builtin_blockIdx_t = type { i8 }
%struct.__hip_builtin_threadIdx_t = type { i8 }

@__const.__assert_fail.fmt = private unnamed_addr addrspace(4) constant [47 x i8] c"%s:%u: %s: Device-side assertion `%s' failed.\0A\00", align 16
@blockDim = extern_weak dso_local protected addrspace(1) global %struct.__hip_builtin_blockDim_t, align 1
@blockIdx = extern_weak dso_local protected addrspace(1) global %struct.__hip_builtin_blockIdx_t, align 1
@threadIdx = extern_weak dso_local protected addrspace(1) global %struct.__hip_builtin_threadIdx_t, align 1
@__hip_cuid_9164ebc39367ae2e = addrspace(1) global i8 0
@llvm.compiler.used = appending addrspace(1) global [1 x ptr] [ptr addrspacecast (ptr addrspace(1) @__hip_cuid_9164ebc39367ae2e to ptr)], section "llvm.metadata"
@__oclc_finite_only_opt = internal local_unnamed_addr addrspace(4) constant i8 0, align 1
@__oclc_ISA_version = internal local_unnamed_addr addrspace(4) constant i32 9010, align 4
@__oclc_ABI_version = weak_odr hidden local_unnamed_addr addrspace(4) constant i32 600

; Function Attrs: convergent mustprogress noinline noreturn nounwind optnone
define weak void @__cxa_pure_virtual() #0 !dbg !1652 {
  call void @llvm.trap(), !dbg !1654
  unreachable, !dbg !1655
}

; Function Attrs: cold noreturn nounwind memory(inaccessiblemem: write)
declare void @llvm.trap() #1

; Function Attrs: convergent mustprogress noinline noreturn nounwind optnone
define weak void @__cxa_deleted_virtual() #0 !dbg !1656 {
  call void @llvm.trap(), !dbg !1657
  unreachable, !dbg !1658
}

; Function Attrs: convergent mustprogress noinline nounwind optnone
define weak hidden void @__assert_fail(ptr noundef %0, ptr noundef %1, i32 noundef %2, ptr noundef %3) #2 !dbg !1659 {
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
    #dbg_declare(ptr addrspace(5) %5, !1664, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(ptr)), !1682)
  store ptr %1, ptr %17, align 8
    #dbg_declare(ptr addrspace(5) %6, !1665, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(ptr)), !1683)
  store i32 %2, ptr %18, align 4
    #dbg_declare(ptr addrspace(5) %7, !1666, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1684)
  store ptr %3, ptr %19, align 8
    #dbg_declare(ptr addrspace(5) %8, !1667, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(ptr)), !1685)
    #dbg_declare(ptr addrspace(5) %9, !1668, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref([47 x i8])), !1686)
  call void @llvm.memcpy.p0.p4.i64(ptr align 16 %20, ptr addrspace(4) align 16 @__const.__assert_fail.fmt, i64 47, i1 false), !dbg !1686
    #dbg_declare(ptr addrspace(5) %10, !1672, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i64)), !1687)
  %27 = call i64 @__ockl_fprintf_stderr_begin() #13, !dbg !1688
  store i64 %27, ptr %21, align 8, !dbg !1687
    #dbg_declare(ptr addrspace(5) %11, !1673, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1689)
  store i32 0, ptr %22, align 4, !dbg !1689
  br label %28, !dbg !1690

28:                                               ; preds = %4
    #dbg_declare(ptr addrspace(5) %12, !1674, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(ptr)), !1691)
  %29 = getelementptr inbounds [47 x i8], ptr %20, i64 0, i64 0, !dbg !1691
  store ptr %29, ptr %23, align 8, !dbg !1691
  br label %30, !dbg !1691

30:                                               ; preds = %35, %28
  %31 = load ptr, ptr %23, align 8, !dbg !1691
  %32 = getelementptr inbounds i8, ptr %31, i32 1, !dbg !1691
  store ptr %32, ptr %23, align 8, !dbg !1691
  %33 = load i8, ptr %31, align 1, !dbg !1691
  %34 = icmp ne i8 %33, 0, !dbg !1691
  br i1 %34, label %35, label %36, !dbg !1691

35:                                               ; preds = %30
  br label %30, !dbg !1691, !llvm.loop !1692

36:                                               ; preds = %30
  %37 = load ptr, ptr %23, align 8, !dbg !1691
  %38 = getelementptr inbounds [47 x i8], ptr %20, i64 0, i64 0, !dbg !1691
  %39 = ptrtoint ptr %37 to i64, !dbg !1691
  %40 = ptrtoint ptr %38 to i64, !dbg !1691
  %41 = sub i64 %39, %40, !dbg !1691
  %42 = trunc i64 %41 to i32, !dbg !1691
  store i32 %42, ptr %22, align 4, !dbg !1691
  br label %43, !dbg !1691

43:                                               ; preds = %36
  %44 = load i64, ptr %21, align 8, !dbg !1694
  %45 = getelementptr inbounds [47 x i8], ptr %20, i64 0, i64 0, !dbg !1695
  %46 = load i32, ptr %22, align 4, !dbg !1696
  %47 = sext i32 %46 to i64, !dbg !1696
  %48 = call i64 @__ockl_fprintf_append_string_n(i64 noundef %44, ptr noundef %45, i64 noundef %47, i32 noundef 0) #13, !dbg !1697
  store i64 %48, ptr %21, align 8, !dbg !1698
  br label %49, !dbg !1699

49:                                               ; preds = %43
    #dbg_declare(ptr addrspace(5) %13, !1676, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(ptr)), !1700)
  %50 = load ptr, ptr %17, align 8, !dbg !1700
  store ptr %50, ptr %24, align 8, !dbg !1700
  br label %51, !dbg !1700

51:                                               ; preds = %56, %49
  %52 = load ptr, ptr %24, align 8, !dbg !1700
  %53 = getelementptr inbounds i8, ptr %52, i32 1, !dbg !1700
  store ptr %53, ptr %24, align 8, !dbg !1700
  %54 = load i8, ptr %52, align 1, !dbg !1700
  %55 = icmp ne i8 %54, 0, !dbg !1700
  br i1 %55, label %56, label %57, !dbg !1700

56:                                               ; preds = %51
  br label %51, !dbg !1700, !llvm.loop !1701

57:                                               ; preds = %51
  %58 = load ptr, ptr %24, align 8, !dbg !1700
  %59 = load ptr, ptr %17, align 8, !dbg !1700
  %60 = ptrtoint ptr %58 to i64, !dbg !1700
  %61 = ptrtoint ptr %59 to i64, !dbg !1700
  %62 = sub i64 %60, %61, !dbg !1700
  %63 = trunc i64 %62 to i32, !dbg !1700
  store i32 %63, ptr %22, align 4, !dbg !1700
  br label %64, !dbg !1700

64:                                               ; preds = %57
  %65 = load i64, ptr %21, align 8, !dbg !1702
  %66 = load ptr, ptr %17, align 8, !dbg !1703
  %67 = load i32, ptr %22, align 4, !dbg !1704
  %68 = sext i32 %67 to i64, !dbg !1704
  %69 = call i64 @__ockl_fprintf_append_string_n(i64 noundef %65, ptr noundef %66, i64 noundef %68, i32 noundef 0) #13, !dbg !1705
  store i64 %69, ptr %21, align 8, !dbg !1706
  %70 = load i64, ptr %21, align 8, !dbg !1707
  %71 = load i32, ptr %18, align 4, !dbg !1708
  %72 = zext i32 %71 to i64, !dbg !1708
  %73 = call i64 @__ockl_fprintf_append_args(i64 noundef %70, i32 noundef 1, i64 noundef %72, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i32 noundef 0) #13, !dbg !1709
  store i64 %73, ptr %21, align 8, !dbg !1710
  br label %74, !dbg !1711

74:                                               ; preds = %64
    #dbg_declare(ptr addrspace(5) %14, !1678, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(ptr)), !1712)
  %75 = load ptr, ptr %19, align 8, !dbg !1712
  store ptr %75, ptr %25, align 8, !dbg !1712
  br label %76, !dbg !1712

76:                                               ; preds = %81, %74
  %77 = load ptr, ptr %25, align 8, !dbg !1712
  %78 = getelementptr inbounds i8, ptr %77, i32 1, !dbg !1712
  store ptr %78, ptr %25, align 8, !dbg !1712
  %79 = load i8, ptr %77, align 1, !dbg !1712
  %80 = icmp ne i8 %79, 0, !dbg !1712
  br i1 %80, label %81, label %82, !dbg !1712

81:                                               ; preds = %76
  br label %76, !dbg !1712, !llvm.loop !1713

82:                                               ; preds = %76
  %83 = load ptr, ptr %25, align 8, !dbg !1712
  %84 = load ptr, ptr %19, align 8, !dbg !1712
  %85 = ptrtoint ptr %83 to i64, !dbg !1712
  %86 = ptrtoint ptr %84 to i64, !dbg !1712
  %87 = sub i64 %85, %86, !dbg !1712
  %88 = trunc i64 %87 to i32, !dbg !1712
  store i32 %88, ptr %22, align 4, !dbg !1712
  br label %89, !dbg !1712

89:                                               ; preds = %82
  %90 = load i64, ptr %21, align 8, !dbg !1714
  %91 = load ptr, ptr %19, align 8, !dbg !1715
  %92 = load i32, ptr %22, align 4, !dbg !1716
  %93 = sext i32 %92 to i64, !dbg !1716
  %94 = call i64 @__ockl_fprintf_append_string_n(i64 noundef %90, ptr noundef %91, i64 noundef %93, i32 noundef 0) #13, !dbg !1717
  store i64 %94, ptr %21, align 8, !dbg !1718
  br label %95, !dbg !1719

95:                                               ; preds = %89
    #dbg_declare(ptr addrspace(5) %15, !1680, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(ptr)), !1720)
  %96 = load ptr, ptr %16, align 8, !dbg !1720
  store ptr %96, ptr %26, align 8, !dbg !1720
  br label %97, !dbg !1720

97:                                               ; preds = %102, %95
  %98 = load ptr, ptr %26, align 8, !dbg !1720
  %99 = getelementptr inbounds i8, ptr %98, i32 1, !dbg !1720
  store ptr %99, ptr %26, align 8, !dbg !1720
  %100 = load i8, ptr %98, align 1, !dbg !1720
  %101 = icmp ne i8 %100, 0, !dbg !1720
  br i1 %101, label %102, label %103, !dbg !1720

102:                                              ; preds = %97
  br label %97, !dbg !1720, !llvm.loop !1721

103:                                              ; preds = %97
  %104 = load ptr, ptr %26, align 8, !dbg !1720
  %105 = load ptr, ptr %16, align 8, !dbg !1720
  %106 = ptrtoint ptr %104 to i64, !dbg !1720
  %107 = ptrtoint ptr %105 to i64, !dbg !1720
  %108 = sub i64 %106, %107, !dbg !1720
  %109 = trunc i64 %108 to i32, !dbg !1720
  store i32 %109, ptr %22, align 4, !dbg !1720
  br label %110, !dbg !1720

110:                                              ; preds = %103
  %111 = load i64, ptr %21, align 8, !dbg !1722
  %112 = load ptr, ptr %16, align 8, !dbg !1723
  %113 = load i32, ptr %22, align 4, !dbg !1724
  %114 = sext i32 %113 to i64, !dbg !1724
  %115 = call i64 @__ockl_fprintf_append_string_n(i64 noundef %111, ptr noundef %112, i64 noundef %114, i32 noundef 1) #13, !dbg !1725
  call void @llvm.trap(), !dbg !1726
  ret void, !dbg !1727
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p4.i64(ptr noalias nocapture writeonly, ptr addrspace(4) noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: convergent mustprogress noinline nounwind optnone
define weak hidden void @__assertfail() #2 !dbg !1728 {
  call void @llvm.trap(), !dbg !1729
  ret void, !dbg !1730
}

; Function Attrs: convergent mustprogress noinline nounwind optnone
define hidden void @_Z7setcolsPA3_iiiii(ptr noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4) #2 !dbg !1731 {
  %6 = alloca ptr, align 8, addrspace(5)
  %7 = alloca i32, align 4, addrspace(5)
  %8 = alloca i32, align 4, addrspace(5)
  %9 = alloca i32, align 4, addrspace(5)
  %10 = alloca i32, align 4, addrspace(5)
  %11 = addrspacecast ptr addrspace(5) %6 to ptr
  %12 = addrspacecast ptr addrspace(5) %7 to ptr
  %13 = addrspacecast ptr addrspace(5) %8 to ptr
  %14 = addrspacecast ptr addrspace(5) %9 to ptr
  %15 = addrspacecast ptr addrspace(5) %10 to ptr
  store ptr %0, ptr %11, align 8
    #dbg_declare(ptr addrspace(5) %6, !1739, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(ptr)), !1744)
  store i32 %1, ptr %12, align 4
    #dbg_declare(ptr addrspace(5) %7, !1740, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1745)
  store i32 %2, ptr %13, align 4
    #dbg_declare(ptr addrspace(5) %8, !1741, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1746)
  store i32 %3, ptr %14, align 4
    #dbg_declare(ptr addrspace(5) %9, !1742, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1747)
  store i32 %4, ptr %15, align 4
    #dbg_declare(ptr addrspace(5) %10, !1743, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1748)
  %16 = load i32, ptr %12, align 4, !dbg !1749
  %17 = load ptr, ptr %11, align 8, !dbg !1750
  %18 = load i32, ptr %15, align 4, !dbg !1751
  %19 = sext i32 %18 to i64, !dbg !1750
  %20 = getelementptr inbounds [3 x i32], ptr %17, i64 %19, !dbg !1750
  %21 = getelementptr inbounds [3 x i32], ptr %20, i64 0, i64 0, !dbg !1750
  store i32 %16, ptr %21, align 4, !dbg !1752
  %22 = load i32, ptr %13, align 4, !dbg !1753
  %23 = load ptr, ptr %11, align 8, !dbg !1754
  %24 = load i32, ptr %15, align 4, !dbg !1755
  %25 = sext i32 %24 to i64, !dbg !1754
  %26 = getelementptr inbounds [3 x i32], ptr %23, i64 %25, !dbg !1754
  %27 = getelementptr inbounds [3 x i32], ptr %26, i64 0, i64 1, !dbg !1754
  store i32 %22, ptr %27, align 4, !dbg !1756
  %28 = load i32, ptr %14, align 4, !dbg !1757
  %29 = load ptr, ptr %11, align 8, !dbg !1758
  %30 = load i32, ptr %15, align 4, !dbg !1759
  %31 = sext i32 %30 to i64, !dbg !1758
  %32 = getelementptr inbounds [3 x i32], ptr %29, i64 %31, !dbg !1758
  %33 = getelementptr inbounds [3 x i32], ptr %32, i64 0, i64 2, !dbg !1758
  store i32 %28, ptr %33, align 4, !dbg !1760
  ret void, !dbg !1761
}

; Function Attrs: convergent mustprogress noinline nounwind optnone
define hidden void @_Z12computeColorffPh(float noundef %0, float noundef %1, ptr noundef %2) #2 !dbg !1762 {
  %4 = alloca float, align 4, addrspace(5)
  %5 = alloca float, align 4, addrspace(5)
  %6 = alloca float, align 4, addrspace(5)
  %7 = alloca float, align 4, addrspace(5)
  %8 = alloca float, align 4, addrspace(5)
  %9 = alloca float, align 4, addrspace(5)
  %10 = alloca float, align 4, addrspace(5)
  %11 = alloca ptr, align 8, addrspace(5)
  %12 = alloca [55 x [3 x i32]], align 16, addrspace(5)
  %13 = alloca i32, align 4, addrspace(5)
  %14 = alloca i32, align 4, addrspace(5)
  %15 = alloca float, align 4, addrspace(5)
  %16 = alloca float, align 4, addrspace(5)
  %17 = alloca float, align 4, addrspace(5)
  %18 = alloca i32, align 4, addrspace(5)
  %19 = alloca i32, align 4, addrspace(5)
  %20 = alloca float, align 4, addrspace(5)
  %21 = alloca i32, align 4, addrspace(5)
  %22 = alloca float, align 4, addrspace(5)
  %23 = alloca float, align 4, addrspace(5)
  %24 = alloca float, align 4, addrspace(5)
  %25 = addrspacecast ptr addrspace(5) %9 to ptr
  %26 = addrspacecast ptr addrspace(5) %10 to ptr
  %27 = addrspacecast ptr addrspace(5) %11 to ptr
  %28 = addrspacecast ptr addrspace(5) %12 to ptr
  %29 = addrspacecast ptr addrspace(5) %13 to ptr
  %30 = addrspacecast ptr addrspace(5) %14 to ptr
  %31 = addrspacecast ptr addrspace(5) %15 to ptr
  %32 = addrspacecast ptr addrspace(5) %16 to ptr
  %33 = addrspacecast ptr addrspace(5) %17 to ptr
  %34 = addrspacecast ptr addrspace(5) %18 to ptr
  %35 = addrspacecast ptr addrspace(5) %19 to ptr
  %36 = addrspacecast ptr addrspace(5) %20 to ptr
  %37 = addrspacecast ptr addrspace(5) %21 to ptr
  %38 = addrspacecast ptr addrspace(5) %22 to ptr
  %39 = addrspacecast ptr addrspace(5) %23 to ptr
  %40 = addrspacecast ptr addrspace(5) %24 to ptr
  store float %0, ptr %25, align 4
    #dbg_declare(ptr addrspace(5) %9, !1768, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(float)), !1790)
  store float %1, ptr %26, align 4
    #dbg_declare(ptr addrspace(5) %10, !1769, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(float)), !1791)
  store ptr %2, ptr %27, align 8
    #dbg_declare(ptr addrspace(5) %11, !1770, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(ptr)), !1792)
    #dbg_declare(ptr addrspace(5) %12, !1771, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref([55 x [3 x i32]])), !1793)
    #dbg_declare(ptr addrspace(5) %13, !1775, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1794)
    #dbg_declare(ptr addrspace(5) %14, !1776, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1795)
  store i32 0, ptr %30, align 4, !dbg !1795
  store i32 0, ptr %29, align 4, !dbg !1796
  br label %41, !dbg !1798

41:                                               ; preds = %51, %3
  %42 = load i32, ptr %29, align 4, !dbg !1799
  %43 = icmp slt i32 %42, 15, !dbg !1801
  br i1 %43, label %44, label %54, !dbg !1802

44:                                               ; preds = %41
  %45 = getelementptr inbounds [55 x [3 x i32]], ptr %28, i64 0, i64 0, !dbg !1803
  %46 = load i32, ptr %29, align 4, !dbg !1804
  %47 = mul nsw i32 255, %46, !dbg !1805
  %48 = sdiv i32 %47, 15, !dbg !1806
  %49 = load i32, ptr %30, align 4, !dbg !1807
  %50 = add nsw i32 %49, 1, !dbg !1807
  store i32 %50, ptr %30, align 4, !dbg !1807
  call void @_Z7setcolsPA3_iiiii(ptr noundef %45, i32 noundef 255, i32 noundef %48, i32 noundef 0, i32 noundef %49) #13, !dbg !1808
  br label %51, !dbg !1808

51:                                               ; preds = %44
  %52 = load i32, ptr %29, align 4, !dbg !1809
  %53 = add nsw i32 %52, 1, !dbg !1809
  store i32 %53, ptr %29, align 4, !dbg !1809
  br label %41, !dbg !1810, !llvm.loop !1811

54:                                               ; preds = %41
  store i32 0, ptr %29, align 4, !dbg !1813
  br label %55, !dbg !1815

55:                                               ; preds = %66, %54
  %56 = load i32, ptr %29, align 4, !dbg !1816
  %57 = icmp slt i32 %56, 6, !dbg !1818
  br i1 %57, label %58, label %69, !dbg !1819

58:                                               ; preds = %55
  %59 = getelementptr inbounds [55 x [3 x i32]], ptr %28, i64 0, i64 0, !dbg !1820
  %60 = load i32, ptr %29, align 4, !dbg !1821
  %61 = mul nsw i32 255, %60, !dbg !1822
  %62 = sdiv i32 %61, 6, !dbg !1823
  %63 = sub nsw i32 255, %62, !dbg !1824
  %64 = load i32, ptr %30, align 4, !dbg !1825
  %65 = add nsw i32 %64, 1, !dbg !1825
  store i32 %65, ptr %30, align 4, !dbg !1825
  call void @_Z7setcolsPA3_iiiii(ptr noundef %59, i32 noundef %63, i32 noundef 255, i32 noundef 0, i32 noundef %64) #13, !dbg !1826
  br label %66, !dbg !1826

66:                                               ; preds = %58
  %67 = load i32, ptr %29, align 4, !dbg !1827
  %68 = add nsw i32 %67, 1, !dbg !1827
  store i32 %68, ptr %29, align 4, !dbg !1827
  br label %55, !dbg !1828, !llvm.loop !1829

69:                                               ; preds = %55
  store i32 0, ptr %29, align 4, !dbg !1831
  br label %70, !dbg !1833

70:                                               ; preds = %80, %69
  %71 = load i32, ptr %29, align 4, !dbg !1834
  %72 = icmp slt i32 %71, 4, !dbg !1836
  br i1 %72, label %73, label %83, !dbg !1837

73:                                               ; preds = %70
  %74 = getelementptr inbounds [55 x [3 x i32]], ptr %28, i64 0, i64 0, !dbg !1838
  %75 = load i32, ptr %29, align 4, !dbg !1839
  %76 = mul nsw i32 255, %75, !dbg !1840
  %77 = sdiv i32 %76, 4, !dbg !1841
  %78 = load i32, ptr %30, align 4, !dbg !1842
  %79 = add nsw i32 %78, 1, !dbg !1842
  store i32 %79, ptr %30, align 4, !dbg !1842
  call void @_Z7setcolsPA3_iiiii(ptr noundef %74, i32 noundef 0, i32 noundef 255, i32 noundef %77, i32 noundef %78) #13, !dbg !1843
  br label %80, !dbg !1843

80:                                               ; preds = %73
  %81 = load i32, ptr %29, align 4, !dbg !1844
  %82 = add nsw i32 %81, 1, !dbg !1844
  store i32 %82, ptr %29, align 4, !dbg !1844
  br label %70, !dbg !1845, !llvm.loop !1846

83:                                               ; preds = %70
  store i32 0, ptr %29, align 4, !dbg !1848
  br label %84, !dbg !1850

84:                                               ; preds = %95, %83
  %85 = load i32, ptr %29, align 4, !dbg !1851
  %86 = icmp slt i32 %85, 11, !dbg !1853
  br i1 %86, label %87, label %98, !dbg !1854

87:                                               ; preds = %84
  %88 = getelementptr inbounds [55 x [3 x i32]], ptr %28, i64 0, i64 0, !dbg !1855
  %89 = load i32, ptr %29, align 4, !dbg !1856
  %90 = mul nsw i32 255, %89, !dbg !1857
  %91 = sdiv i32 %90, 11, !dbg !1858
  %92 = sub nsw i32 255, %91, !dbg !1859
  %93 = load i32, ptr %30, align 4, !dbg !1860
  %94 = add nsw i32 %93, 1, !dbg !1860
  store i32 %94, ptr %30, align 4, !dbg !1860
  call void @_Z7setcolsPA3_iiiii(ptr noundef %88, i32 noundef 0, i32 noundef %92, i32 noundef 255, i32 noundef %93) #13, !dbg !1861
  br label %95, !dbg !1861

95:                                               ; preds = %87
  %96 = load i32, ptr %29, align 4, !dbg !1862
  %97 = add nsw i32 %96, 1, !dbg !1862
  store i32 %97, ptr %29, align 4, !dbg !1862
  br label %84, !dbg !1863, !llvm.loop !1864

98:                                               ; preds = %84
  store i32 0, ptr %29, align 4, !dbg !1866
  br label %99, !dbg !1868

99:                                               ; preds = %109, %98
  %100 = load i32, ptr %29, align 4, !dbg !1869
  %101 = icmp slt i32 %100, 13, !dbg !1871
  br i1 %101, label %102, label %112, !dbg !1872

102:                                              ; preds = %99
  %103 = getelementptr inbounds [55 x [3 x i32]], ptr %28, i64 0, i64 0, !dbg !1873
  %104 = load i32, ptr %29, align 4, !dbg !1874
  %105 = mul nsw i32 255, %104, !dbg !1875
  %106 = sdiv i32 %105, 13, !dbg !1876
  %107 = load i32, ptr %30, align 4, !dbg !1877
  %108 = add nsw i32 %107, 1, !dbg !1877
  store i32 %108, ptr %30, align 4, !dbg !1877
  call void @_Z7setcolsPA3_iiiii(ptr noundef %103, i32 noundef %106, i32 noundef 0, i32 noundef 255, i32 noundef %107) #13, !dbg !1878
  br label %109, !dbg !1878

109:                                              ; preds = %102
  %110 = load i32, ptr %29, align 4, !dbg !1879
  %111 = add nsw i32 %110, 1, !dbg !1879
  store i32 %111, ptr %29, align 4, !dbg !1879
  br label %99, !dbg !1880, !llvm.loop !1881

112:                                              ; preds = %99
  store i32 0, ptr %29, align 4, !dbg !1883
  br label %113, !dbg !1885

113:                                              ; preds = %124, %112
  %114 = load i32, ptr %29, align 4, !dbg !1886
  %115 = icmp slt i32 %114, 6, !dbg !1888
  %fi_flip = xor i1 %115, true, !dbg !1889
  br i1 %fi_flip, label %116, label %127, !dbg !1889

116:                                              ; preds = %113
  %117 = getelementptr inbounds [55 x [3 x i32]], ptr %28, i64 0, i64 0, !dbg !1890
  %118 = load i32, ptr %29, align 4, !dbg !1891
  %119 = mul nsw i32 255, %118, !dbg !1892
  %120 = sdiv i32 %119, 6, !dbg !1893
  %121 = sub nsw i32 255, %120, !dbg !1894
  %122 = load i32, ptr %30, align 4, !dbg !1895
  %123 = add nsw i32 %122, 1, !dbg !1895
  store i32 %123, ptr %30, align 4, !dbg !1895
  call void @_Z7setcolsPA3_iiiii(ptr noundef %117, i32 noundef 255, i32 noundef 0, i32 noundef %121, i32 noundef %122) #13, !dbg !1896
  br label %124, !dbg !1896

124:                                              ; preds = %116
  %125 = load i32, ptr %29, align 4, !dbg !1897
  %126 = add nsw i32 %125, 1, !dbg !1897
  store i32 %126, ptr %29, align 4, !dbg !1897
  br label %113, !dbg !1898, !llvm.loop !1899

127:                                              ; preds = %113
    #dbg_declare(ptr addrspace(5) %15, !1777, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(float)), !1901)
  %128 = load float, ptr %25, align 4, !dbg !1902
  %129 = load float, ptr %25, align 4, !dbg !1903
  %130 = fmul contract float %128, %129, !dbg !1904
  %131 = load float, ptr %26, align 4, !dbg !1905
  %132 = load float, ptr %26, align 4, !dbg !1906
  %133 = fmul contract float %131, %132, !dbg !1907
  %134 = fadd contract float %130, %133, !dbg !1908
  %135 = addrspacecast ptr addrspace(5) %7 to ptr
  %136 = addrspacecast ptr addrspace(5) %8 to ptr
  store float %134, ptr %136, align 4
    #dbg_declare(ptr addrspace(5) %8, !862, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(float)), !1909)
  %137 = load float, ptr %136, align 4, !dbg !1911
  %138 = call contract noundef float @llvm.sqrt.f32(float %137), !dbg !1912
  store float %138, ptr %31, align 4, !dbg !1901
    #dbg_declare(ptr addrspace(5) %16, !1778, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(float)), !1913)
  %139 = load float, ptr %26, align 4, !dbg !1914
  %140 = fneg contract float %139, !dbg !1915
  %141 = load float, ptr %25, align 4, !dbg !1916
  %142 = fneg contract float %141, !dbg !1917
  %143 = addrspacecast ptr addrspace(5) %4 to ptr
  %144 = addrspacecast ptr addrspace(5) %5 to ptr
  %145 = addrspacecast ptr addrspace(5) %6 to ptr
  store float %140, ptr %144, align 4
    #dbg_declare(ptr addrspace(5) %5, !767, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(float)), !1918)
  store float %142, ptr %145, align 4
    #dbg_declare(ptr addrspace(5) %6, !768, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(float)), !1920)
  %146 = load float, ptr %144, align 4, !dbg !1921
  %147 = load float, ptr %145, align 4, !dbg !1922
  %148 = call contract noundef float @__ocml_atan2_f32(float noundef %146, float noundef %147) #14, !dbg !1923
  %149 = fdiv contract float %148, 0x400921FB60000000, !dbg !1924
  store float %149, ptr %32, align 4, !dbg !1913
    #dbg_declare(ptr addrspace(5) %17, !1779, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(float)), !1925)
  %150 = load float, ptr %32, align 4, !dbg !1926
  %151 = fadd contract float %150, 1.000000e+00, !dbg !1927
  %152 = fdiv contract float %151, 2.000000e+00, !dbg !1928
  %153 = fmul contract float %152, 5.400000e+01, !dbg !1929
  store float %153, ptr %33, align 4, !dbg !1925
    #dbg_declare(ptr addrspace(5) %18, !1780, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1930)
  %154 = load float, ptr %33, align 4, !dbg !1931
  %155 = fptosi float %154 to i32, !dbg !1931
  store i32 %155, ptr %34, align 4, !dbg !1930
    #dbg_declare(ptr addrspace(5) %19, !1781, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1932)
  %156 = load i32, ptr %34, align 4, !dbg !1933
  %157 = add nsw i32 %156, 1, !dbg !1934
  %158 = srem i32 %157, 55, !dbg !1935
  store i32 %158, ptr %35, align 4, !dbg !1932
    #dbg_declare(ptr addrspace(5) %20, !1782, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(float)), !1936)
  %159 = load float, ptr %33, align 4, !dbg !1937
  %160 = load i32, ptr %34, align 4, !dbg !1938
  %161 = sitofp i32 %160 to float, !dbg !1938
  %162 = fsub contract float %159, %161, !dbg !1939
  store float %162, ptr %36, align 4, !dbg !1936
    #dbg_declare(ptr addrspace(5) %21, !1783, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1940)
  store i32 0, ptr %37, align 4, !dbg !1940
  br label %163, !dbg !1941

163:                                              ; preds = %214, %127
  %164 = load i32, ptr %37, align 4, !dbg !1942
  %165 = icmp slt i32 %164, 3, !dbg !1943
  br i1 %165, label %166, label %217, !dbg !1944

166:                                              ; preds = %163
    #dbg_declare(ptr addrspace(5) %22, !1785, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(float)), !1945)
  %167 = load i32, ptr %34, align 4, !dbg !1946
  %168 = sext i32 %167 to i64, !dbg !1947
  %169 = getelementptr inbounds [55 x [3 x i32]], ptr %28, i64 0, i64 %168, !dbg !1947
  %170 = load i32, ptr %37, align 4, !dbg !1948
  %171 = sext i32 %170 to i64, !dbg !1947
  %172 = getelementptr inbounds [3 x i32], ptr %169, i64 0, i64 %171, !dbg !1947
  %173 = load i32, ptr %172, align 4, !dbg !1947
  %174 = sitofp i32 %173 to float, !dbg !1947
  %175 = fdiv contract float %174, 2.550000e+02, !dbg !1949
  store float %175, ptr %38, align 4, !dbg !1945
    #dbg_declare(ptr addrspace(5) %23, !1788, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(float)), !1950)
  %176 = load i32, ptr %35, align 4, !dbg !1951
  %177 = sext i32 %176 to i64, !dbg !1952
  %178 = getelementptr inbounds [55 x [3 x i32]], ptr %28, i64 0, i64 %177, !dbg !1952
  %179 = load i32, ptr %37, align 4, !dbg !1953
  %180 = sext i32 %179 to i64, !dbg !1952
  %181 = getelementptr inbounds [3 x i32], ptr %178, i64 0, i64 %180, !dbg !1952
  %182 = load i32, ptr %181, align 4, !dbg !1952
  %183 = sitofp i32 %182 to float, !dbg !1952
  %184 = fdiv contract float %183, 2.550000e+02, !dbg !1954
  store float %184, ptr %39, align 4, !dbg !1950
    #dbg_declare(ptr addrspace(5) %24, !1789, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(float)), !1955)
  %185 = load float, ptr %36, align 4, !dbg !1956
  %186 = fsub contract float 1.000000e+00, %185, !dbg !1957
  %187 = load float, ptr %38, align 4, !dbg !1958
  %188 = fmul contract float %186, %187, !dbg !1959
  %189 = load float, ptr %36, align 4, !dbg !1960
  %190 = load float, ptr %39, align 4, !dbg !1961
  %191 = fmul contract float %189, %190, !dbg !1962
  %192 = fadd contract float %188, %191, !dbg !1963
  store float %192, ptr %40, align 4, !dbg !1955
  %193 = load float, ptr %31, align 4, !dbg !1964
  %194 = fcmp contract ole float %193, 1.000000e+00, !dbg !1966
  br i1 %194, label %195, label %201, !dbg !1967

195:                                              ; preds = %166
  %196 = load float, ptr %31, align 4, !dbg !1968
  %197 = load float, ptr %40, align 4, !dbg !1969
  %198 = fsub contract float 1.000000e+00, %197, !dbg !1970
  %199 = fmul contract float %196, %198, !dbg !1971
  %200 = fsub contract float 1.000000e+00, %199, !dbg !1972
  store float %200, ptr %40, align 4, !dbg !1973
  br label %204, !dbg !1974

201:                                              ; preds = %166
  %202 = load float, ptr %40, align 4, !dbg !1975
  %203 = fmul contract float %202, 7.500000e-01, !dbg !1975
  store float %203, ptr %40, align 4, !dbg !1975
  br label %204

204:                                              ; preds = %201, %195
  %205 = load float, ptr %40, align 4, !dbg !1976
  %206 = fmul contract float 2.550000e+02, %205, !dbg !1977
  %207 = fptosi float %206 to i32, !dbg !1978
  %208 = trunc i32 %207 to i8, !dbg !1979
  %209 = load ptr, ptr %27, align 8, !dbg !1980
  %210 = load i32, ptr %37, align 4, !dbg !1981
  %211 = sub nsw i32 2, %210, !dbg !1982
  %212 = sext i32 %211 to i64, !dbg !1980
  %213 = getelementptr inbounds i8, ptr %209, i64 %212, !dbg !1980
  store i8 %208, ptr %213, align 1, !dbg !1983
  br label %214, !dbg !1984

214:                                              ; preds = %204
  %215 = load i32, ptr %37, align 4, !dbg !1985
  %216 = add nsw i32 %215, 1, !dbg !1985
  store i32 %216, ptr %37, align 4, !dbg !1985
  br label %163, !dbg !1986, !llvm.loop !1987

217:                                              ; preds = %163
  ret void, !dbg !1989
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define protected amdgpu_kernel void @_Z5colorPhiiff(ptr addrspace(1) noundef %0, i32 noundef %1, i32 noundef %2, float noundef %3, float noundef %4) #4 !dbg !1990 {
  %6 = alloca i32, align 4, addrspace(5)
  %7 = alloca i32, align 4, addrspace(5)
  %8 = alloca i32, align 4, addrspace(5)
  %9 = alloca i32, align 4, addrspace(5)
  %10 = alloca i32, align 4, addrspace(5)
  %11 = alloca i32, align 4, addrspace(5)
  %12 = alloca i32, align 4, addrspace(5)
  %13 = alloca i32, align 4, addrspace(5)
  %14 = alloca i32, align 4, addrspace(5)
  %15 = alloca i32, align 4, addrspace(5)
  %16 = alloca i32, align 4, addrspace(5)
  %17 = alloca i32, align 4, addrspace(5)
  %18 = alloca ptr, align 8, addrspace(5)
  %19 = alloca ptr, align 8, addrspace(5)
  %20 = alloca i32, align 4, addrspace(5)
  %21 = alloca i32, align 4, addrspace(5)
  %22 = alloca float, align 4, addrspace(5)
  %23 = alloca float, align 4, addrspace(5)
  %24 = alloca i32, align 4, addrspace(5)
  %25 = alloca i32, align 4, addrspace(5)
  %26 = alloca float, align 4, addrspace(5)
  %27 = alloca float, align 4, addrspace(5)
  %28 = alloca i64, align 8, addrspace(5)
  %29 = addrspacecast ptr addrspace(5) %18 to ptr
  %30 = addrspacecast ptr addrspace(5) %19 to ptr
  %31 = addrspacecast ptr addrspace(5) %20 to ptr
  %32 = addrspacecast ptr addrspace(5) %21 to ptr
  %33 = addrspacecast ptr addrspace(5) %22 to ptr
  %34 = addrspacecast ptr addrspace(5) %23 to ptr
  %35 = addrspacecast ptr addrspace(5) %24 to ptr
  %36 = addrspacecast ptr addrspace(5) %25 to ptr
  %37 = addrspacecast ptr addrspace(5) %26 to ptr
  %38 = addrspacecast ptr addrspace(5) %27 to ptr
  %39 = addrspacecast ptr addrspace(5) %28 to ptr
  %40 = addrspacecast ptr addrspace(1) %0 to ptr
  store ptr %40, ptr %29, align 8
  %41 = load ptr, ptr %29, align 8
  store ptr %41, ptr %30, align 8
    #dbg_declare(ptr addrspace(5) %19, !1994, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(ptr)), !2006)
  store i32 %1, ptr %31, align 4
    #dbg_declare(ptr addrspace(5) %20, !1995, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !2007)
  store i32 %2, ptr %32, align 4
    #dbg_declare(ptr addrspace(5) %21, !1996, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !2008)
  store float %3, ptr %33, align 4
    #dbg_declare(ptr addrspace(5) %22, !1997, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(float)), !2009)
  store float %4, ptr %34, align 4
    #dbg_declare(ptr addrspace(5) %23, !1998, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(float)), !2010)
    #dbg_declare(ptr addrspace(5) %24, !1999, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !2011)
  %42 = addrspacecast ptr addrspace(5) %17 to ptr
  %43 = addrspacecast ptr addrspace(5) %11 to ptr
  %44 = call i64 @__ockl_get_local_size(i32 noundef 1) #14, !dbg !2012
  %45 = trunc i64 %44 to i32, !dbg !2012
  %46 = addrspacecast ptr addrspace(5) %16 to ptr
  %47 = addrspacecast ptr addrspace(5) %10 to ptr
  %48 = call i64 @__ockl_get_group_id(i32 noundef 1) #14, !dbg !2031
  %49 = trunc i64 %48 to i32, !dbg !2031
  %50 = mul i32 %45, %49, !dbg !2046
  %51 = addrspacecast ptr addrspace(5) %15 to ptr
  %52 = addrspacecast ptr addrspace(5) %9 to ptr
  %53 = call i64 @__ockl_get_local_id(i32 noundef 1) #14, !dbg !2047
  %54 = trunc i64 %53 to i32, !dbg !2047
  %55 = add i32 %50, %54, !dbg !2062
  store i32 %55, ptr %35, align 4, !dbg !2011
    #dbg_declare(ptr addrspace(5) %25, !2000, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !2063)
  %56 = addrspacecast ptr addrspace(5) %14 to ptr
  %57 = addrspacecast ptr addrspace(5) %8 to ptr
  %58 = call i64 @__ockl_get_local_size(i32 noundef 0) #14, !dbg !2064
  %59 = trunc i64 %58 to i32, !dbg !2064
  %60 = addrspacecast ptr addrspace(5) %13 to ptr
  %61 = addrspacecast ptr addrspace(5) %7 to ptr
  %62 = call i64 @__ockl_get_group_id(i32 noundef 0) #14, !dbg !2069
  %63 = trunc i64 %62 to i32, !dbg !2069
  %64 = mul i32 %59, %63, !dbg !2074
  %65 = addrspacecast ptr addrspace(5) %12 to ptr
  %66 = addrspacecast ptr addrspace(5) %6 to ptr
  %67 = call i64 @__ockl_get_local_id(i32 noundef 0) #14, !dbg !2075
  %68 = trunc i64 %67 to i32, !dbg !2075
  %69 = add i32 %64, %68, !dbg !2080
  store i32 %69, ptr %36, align 4, !dbg !2063
  %70 = load i32, ptr %35, align 4, !dbg !2081
  %71 = load i32, ptr %31, align 4, !dbg !2082
  %72 = icmp slt i32 %70, %71, !dbg !2083
  br i1 %72, label %73, label %121, !dbg !2084

73:                                               ; preds = %5
  %74 = load i32, ptr %36, align 4, !dbg !2085
  %75 = load i32, ptr %31, align 4, !dbg !2086
  %76 = icmp slt i32 %74, %75, !dbg !2087
  br i1 %76, label %77, label %121, !dbg !2088

77:                                               ; preds = %73
    #dbg_declare(ptr addrspace(5) %26, !2001, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(float)), !2089)
  %78 = load i32, ptr %36, align 4, !dbg !2090
  %79 = sitofp i32 %78 to float, !dbg !2090
  %80 = load i32, ptr %32, align 4, !dbg !2091
  %81 = sitofp i32 %80 to float, !dbg !2091
  %82 = fdiv contract float %79, %81, !dbg !2092
  %83 = load float, ptr %33, align 4, !dbg !2093
  %84 = fmul contract float %82, %83, !dbg !2094
  %85 = load float, ptr %33, align 4, !dbg !2095
  %86 = fsub contract float %84, %85, !dbg !2096
  store float %86, ptr %37, align 4, !dbg !2089
    #dbg_declare(ptr addrspace(5) %27, !2004, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(float)), !2097)
  %87 = load i32, ptr %35, align 4, !dbg !2098
  %88 = sitofp i32 %87 to float, !dbg !2098
  %89 = load i32, ptr %32, align 4, !dbg !2099
  %90 = sitofp i32 %89 to float, !dbg !2099
  %91 = fdiv contract float %88, %90, !dbg !2100
  %92 = load float, ptr %33, align 4, !dbg !2101
  %93 = fmul contract float %91, %92, !dbg !2102
  %94 = load float, ptr %33, align 4, !dbg !2103
  %95 = fsub contract float %93, %94, !dbg !2104
  store float %95, ptr %38, align 4, !dbg !2097
  %96 = load i32, ptr %36, align 4, !dbg !2105
  %97 = load i32, ptr %32, align 4, !dbg !2107
  %98 = icmp eq i32 %96, %97, !dbg !2108
  br i1 %98, label %103, label %99, !dbg !2109

99:                                               ; preds = %77
  %100 = load i32, ptr %35, align 4, !dbg !2110
  %101 = load i32, ptr %32, align 4, !dbg !2111
  %102 = icmp eq i32 %100, %101, !dbg !2112
  br i1 %102, label %103, label %104, !dbg !2113

103:                                              ; preds = %99, %77
  br label %121, !dbg !2114

104:                                              ; preds = %99
    #dbg_declare(ptr addrspace(5) %28, !2005, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i64)), !2115)
  %105 = load i32, ptr %35, align 4, !dbg !2116
  %106 = load i32, ptr %31, align 4, !dbg !2117
  %107 = mul nsw i32 %105, %106, !dbg !2118
  %108 = load i32, ptr %36, align 4, !dbg !2119
  %109 = add nsw i32 %107, %108, !dbg !2120
  %110 = mul nsw i32 %109, 3, !dbg !2121
  %111 = sext i32 %110 to i64, !dbg !2122
  store i64 %111, ptr %39, align 8, !dbg !2115
  %112 = load float, ptr %37, align 4, !dbg !2123
  %113 = load float, ptr %34, align 4, !dbg !2124
  %114 = fdiv contract float %112, %113, !dbg !2125
  %115 = load float, ptr %38, align 4, !dbg !2126
  %116 = load float, ptr %34, align 4, !dbg !2127
  %117 = fdiv contract float %115, %116, !dbg !2128
  %118 = load ptr, ptr %30, align 8, !dbg !2129
  %119 = load i64, ptr %39, align 8, !dbg !2130
  %120 = getelementptr inbounds i8, ptr %118, i64 %119, !dbg !2131
  call void @_Z12computeColorffPh(float noundef %114, float noundef %117, ptr noundef %120) #13, !dbg !2132
  br label %121, !dbg !2133

121:                                              ; preds = %104, %103, %73, %5
  ret void, !dbg !2134
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.sqrt.f32(float) #5

; Function Attrs: convergent mustprogress nofree norecurse nounwind willreturn memory(none)
define internal float @__ocml_atan2_f32(float noundef %0, float noundef %1) #6 {
  %3 = tail call float @llvm.fabs.f32(float %1)
  %4 = tail call float @llvm.fabs.f32(float %0)
  %5 = tail call float @llvm.minnum.f32(float %3, float %4)
  %6 = tail call float @llvm.maxnum.f32(float %3, float %4)
  %7 = tail call float @llvm.canonicalize.f32(float 0x36A0000000000000)
  %8 = tail call i1 @llvm.is.fpclass.f32(float %7, i32 64)
  br i1 %8, label %9, label %16

9:                                                ; preds = %2
  %10 = fcmp ogt float %6, 0x45F0000000000000
  %11 = select i1 %10, float 0x3DF0000000000000, float 1.000000e+00
  %12 = fmul float %6, %11
  %13 = tail call float @llvm.amdgcn.rcp.f32(float %12)
  %14 = fmul float %5, %13
  %15 = fmul float %11, %14
  br label %18

16:                                               ; preds = %2
  %17 = fdiv float %5, %6, !fpmath !2135
  br label %18

18:                                               ; preds = %16, %9
  %19 = phi float [ %15, %9 ], [ %17, %16 ]
  %20 = tail call float @__ocmlpriv_atanred_f32(float noundef %19) #14
  %21 = fsub float 0x3FF921FB60000000, %20
  %22 = fcmp ogt float %4, %3
  %23 = select i1 %22, float %21, float %20
  %24 = fsub float 0x400921FB60000000, %23
  %25 = fcmp olt float %1, 0.000000e+00
  %26 = select i1 %25, float %24, float %23
  %27 = bitcast float %1 to i32
  %28 = icmp slt i32 %27, 0
  %29 = select i1 %28, float 0x400921FB60000000, float 0.000000e+00
  %30 = fcmp oeq float %0, 0.000000e+00
  %31 = select i1 %30, float %29, float %26
  %32 = load i8, ptr addrspace(4) @__oclc_finite_only_opt, align 1, !tbaa !2136, !range !2140, !noundef !2141
  %33 = trunc nuw i8 %32 to i1
  %34 = select i1 %25, float 0x4002D97C80000000, float 0x3FE921FB60000000
  %35 = fcmp oeq float %3, 0x7FF0000000000000
  %36 = fcmp oeq float %4, 0x7FF0000000000000
  %37 = and i1 %36, %35
  %38 = select i1 %37, float %34, float %31
  %39 = fcmp uno float %1, %0
  %40 = select i1 %39, float 0x7FF8000000000000, float %38
  %41 = select i1 %33, float %31, float %40
  %42 = tail call float @llvm.copysign.f32(float %41, float %0)
  ret float %42
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fabs.f32(float) #5

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.minnum.f32(float, float) #5

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.maxnum.f32(float, float) #5

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.canonicalize.f32(float) #5

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.is.fpclass.f32(float, i32 immarg) #5

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.amdgcn.rcp.f32(float) #5

; Function Attrs: convergent mustprogress nofree norecurse nounwind willreturn memory(none)
define internal float @__ocmlpriv_atanred_f32(float noundef %0) local_unnamed_addr #6 {
  %2 = fmul float %0, %0
  %3 = tail call float @__ocml_fmuladd_f32(float noundef %2, float noundef 0x3F65A54B00000000, float noundef 0xBF8F4B2180000000) #14
  %4 = tail call float @__ocml_fmuladd_f32(float noundef %2, float noundef %3, float noundef 0x3FA53F67E0000000) #14
  %5 = tail call float @__ocml_fmuladd_f32(float noundef %2, float noundef %4, float noundef 0xBFB2FA9AE0000000) #14
  %6 = tail call float @__ocml_fmuladd_f32(float noundef %2, float noundef %5, float noundef 0x3FBB263640000000) #14
  %7 = tail call float @__ocml_fmuladd_f32(float noundef %2, float noundef %6, float noundef 0xBFC22C1CC0000000) #14
  %8 = tail call float @__ocml_fmuladd_f32(float noundef %2, float noundef %7, float noundef 0x3FC99717E0000000) #14
  %9 = tail call float @__ocml_fmuladd_f32(float noundef %2, float noundef %8, float noundef 0xBFD5554C40000000) #14
  %10 = fmul float %2, %9
  %11 = tail call float @__ocml_fmuladd_f32(float noundef %0, float noundef %10, float noundef %0) #14
  ret float %11
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.copysign.f32(float, float) #5

; Function Attrs: convergent mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal noundef float @__ocml_fmuladd_f32(float noundef %0, float noundef %1, float noundef %2) local_unnamed_addr #7 {
  %4 = tail call float @llvm.fmuladd.f32(float %0, float %1, float %2)
  ret float %4
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #5

; Function Attrs: convergent mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal range(i64 0, 1024) i64 @__ockl_get_local_id(i32 noundef %0) #7 {
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
declare noundef i32 @llvm.amdgcn.workitem.id.x() #5

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.amdgcn.workitem.id.y() #5

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.amdgcn.workitem.id.z() #5

; Function Attrs: convergent norecurse nounwind
define internal i64 @__ockl_fprintf_stderr_begin() #8 {
  %1 = tail call <2 x i64> @__ockl_hostcall_preview(i32 noundef 2, i64 noundef 33, i64 noundef 1, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #13
  %2 = extractelement <2 x i64> %1, i64 0
  ret i64 %2
}

; Function Attrs: convergent norecurse nounwind
define internal <2 x i64> @__ockl_hostcall_preview(i32 noundef %0, i64 noundef %1, i64 noundef %2, i64 noundef %3, i64 noundef %4, i64 noundef %5, i64 noundef %6, i64 noundef %7, i64 noundef %8) local_unnamed_addr #8 {
  %10 = load i32, ptr addrspace(4) @__oclc_ABI_version, align 4, !tbaa !2142
  %11 = icmp slt i32 %10, 500
  %12 = tail call ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %13 = select i1 %11, i64 24, i64 80
  %14 = getelementptr inbounds i8, ptr addrspace(4) %12, i64 %13
  %15 = load i64, ptr addrspace(4) %14, align 8, !tbaa !2144
  %16 = inttoptr i64 %15 to ptr addrspace(1)
  %17 = addrspacecast ptr addrspace(1) %16 to ptr
  %18 = tail call <2 x i64> @__ockl_hostcall_internal(ptr noundef %17, i32 noundef %0, i64 noundef %1, i64 noundef %2, i64 noundef %3, i64 noundef %4, i64 noundef %5, i64 noundef %6, i64 noundef %7, i64 noundef %8) #15
  ret <2 x i64> %18
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef align 4 ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr() #5

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
  %20 = load ptr addrspace(1), ptr addrspace(1) %14, align 8, !tbaa !2146
  %21 = load i64, ptr addrspace(1) %19, align 8, !tbaa !2150
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
  %30 = load ptr addrspace(1), ptr addrspace(1) %14, align 8, !tbaa !2146
  %31 = load i64, ptr addrspace(1) %19, align 8, !tbaa !2150
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
  %49 = load ptr addrspace(1), ptr addrspace(1) %14, align 8, !tbaa !2146
  %50 = getelementptr i8, ptr addrspace(1) %14, i64 40
  %51 = load i64, ptr addrspace(1) %50, align 8, !tbaa !2150
  %52 = and i64 %48, %51
  %53 = getelementptr inbounds %0, ptr addrspace(1) %49, i64 %52
  %54 = getelementptr i8, ptr addrspace(1) %14, i64 8
  %55 = load ptr addrspace(1), ptr addrspace(1) %54, align 8, !tbaa !2151
  %56 = getelementptr inbounds %1, ptr addrspace(1) %55, i64 %52
  %57 = tail call i64 @llvm.amdgcn.ballot.i64(i1 true)
  br i1 %15, label %58, label %62

58:                                               ; preds = %38
  %59 = getelementptr inbounds i8, ptr addrspace(1) %53, i64 16
  %60 = getelementptr inbounds i8, ptr addrspace(1) %53, i64 8
  %61 = getelementptr inbounds i8, ptr addrspace(1) %53, i64 20
  store i32 %1, ptr addrspace(1) %59, align 8, !tbaa !2152
  store i64 %57, ptr addrspace(1) %60, align 8, !tbaa !2154
  store i32 1, ptr addrspace(1) %61, align 4, !tbaa !2155
  br label %62

62:                                               ; preds = %58, %38
  %63 = zext i32 %12 to i64
  %64 = getelementptr inbounds [64 x [8 x i64]], ptr addrspace(1) %56, i64 0, i64 %63
  store i64 %2, ptr addrspace(1) %64, align 8, !tbaa !2144
  %65 = getelementptr inbounds i8, ptr addrspace(1) %64, i64 8
  store i64 %3, ptr addrspace(1) %65, align 8, !tbaa !2144
  %66 = getelementptr inbounds i8, ptr addrspace(1) %64, i64 16
  store i64 %4, ptr addrspace(1) %66, align 8, !tbaa !2144
  %67 = getelementptr inbounds i8, ptr addrspace(1) %64, i64 24
  store i64 %5, ptr addrspace(1) %67, align 8, !tbaa !2144
  %68 = getelementptr inbounds i8, ptr addrspace(1) %64, i64 32
  store i64 %6, ptr addrspace(1) %68, align 8, !tbaa !2144
  %69 = getelementptr inbounds i8, ptr addrspace(1) %64, i64 40
  store i64 %7, ptr addrspace(1) %69, align 8, !tbaa !2144
  %70 = getelementptr inbounds i8, ptr addrspace(1) %64, i64 48
  store i64 %8, ptr addrspace(1) %70, align 8, !tbaa !2144
  %71 = getelementptr inbounds i8, ptr addrspace(1) %64, i64 56
  store i64 %9, ptr addrspace(1) %71, align 8, !tbaa !2144
  br i1 %15, label %72, label %88

72:                                               ; preds = %62
  %73 = getelementptr inbounds i8, ptr addrspace(1) %14, i64 32
  %74 = load atomic i64, ptr addrspace(1) %73 syncscope("one-as") monotonic, align 8
  %75 = load i64, ptr addrspace(1) %50, align 8, !tbaa !2150
  %76 = and i64 %75, %48
  %77 = getelementptr inbounds %0, ptr addrspace(1) %49, i64 %76
  store i64 %74, ptr addrspace(1) %77, align 8, !tbaa !2156
  %78 = cmpxchg ptr addrspace(1) %73, i64 %74, i64 %48 syncscope("one-as") release monotonic, align 8
  %79 = extractvalue { i64, i1 } %78, 1
  br i1 %79, label %85, label %80

80:                                               ; preds = %80, %72
  %81 = phi { i64, i1 } [ %83, %80 ], [ %78, %72 ]
  %82 = extractvalue { i64, i1 } %81, 0
  tail call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %82, ptr addrspace(1) %77, align 8, !tbaa !2156
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
  %100 = load i64, ptr addrspace(1) %64, align 8, !tbaa !2144
  %101 = load i64, ptr addrspace(1) %65, align 8, !tbaa !2144
  br i1 %15, label %102, label %120

102:                                              ; preds = %99
  %103 = load i64, ptr addrspace(1) %50, align 8, !tbaa !2150
  %104 = add i64 %103, 1
  %105 = add i64 %104, %48
  %106 = icmp eq i64 %105, 0
  %107 = select i1 %106, i64 %104, i64 %105
  %108 = getelementptr inbounds i8, ptr addrspace(1) %14, i64 24
  %109 = load atomic i64, ptr addrspace(1) %108 syncscope("one-as") monotonic, align 8
  %110 = load ptr addrspace(1), ptr addrspace(1) %14, align 8, !tbaa !2146
  %111 = and i64 %107, %103
  %112 = getelementptr inbounds %0, ptr addrspace(1) %110, i64 %111
  store i64 %109, ptr addrspace(1) %112, align 8, !tbaa !2156
  %113 = cmpxchg ptr addrspace(1) %108, i64 %109, i64 %107 syncscope("one-as") release monotonic, align 8
  %114 = extractvalue { i64, i1 } %113, 1
  br i1 %114, label %120, label %115

115:                                              ; preds = %115, %102
  %116 = phi { i64, i1 } [ %118, %115 ], [ %113, %102 ]
  %117 = extractvalue { i64, i1 } %116, 0
  tail call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %117, ptr addrspace(1) %112, align 8, !tbaa !2156
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
  %18 = load i64, ptr addrspace(1) %17, align 16, !tbaa !2157
  %19 = icmp eq i64 %18, 0
  br i1 %19, label %34, label %20

20:                                               ; preds = %16
  %21 = inttoptr i64 %18 to ptr addrspace(1)
  %22 = getelementptr inbounds i8, ptr addrspace(1) %4, i64 24
  %23 = load i32, ptr addrspace(1) %22, align 8, !tbaa !2159
  %24 = zext i32 %23 to i64
  store atomic i64 %24, ptr addrspace(1) %21 syncscope("one-as") release, align 8
  %25 = load i32, ptr addrspace(4) @__oclc_ISA_version, align 4, !tbaa !2142
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
  %33 = load i8, ptr %19, align 1, !tbaa !2160
  %34 = zext i8 %33 to i64
  %35 = getelementptr inbounds i8, ptr %19, i64 1
  %36 = load i8, ptr %35, align 1, !tbaa !2160
  %37 = zext i8 %36 to i64
  %38 = shl nuw nsw i64 %37, 8
  %39 = or disjoint i64 %38, %34
  %40 = getelementptr inbounds i8, ptr %19, i64 2
  %41 = load i8, ptr %40, align 1, !tbaa !2160
  %42 = zext i8 %41 to i64
  %43 = shl nuw nsw i64 %42, 16
  %44 = or disjoint i64 %39, %43
  %45 = getelementptr inbounds i8, ptr %19, i64 3
  %46 = load i8, ptr %45, align 1, !tbaa !2160
  %47 = zext i8 %46 to i64
  %48 = shl nuw nsw i64 %47, 24
  %49 = or disjoint i64 %44, %48
  %50 = getelementptr inbounds i8, ptr %19, i64 4
  %51 = load i8, ptr %50, align 1, !tbaa !2160
  %52 = zext i8 %51 to i64
  %53 = shl nuw nsw i64 %52, 32
  %54 = or disjoint i64 %49, %53
  %55 = getelementptr inbounds i8, ptr %19, i64 5
  %56 = load i8, ptr %55, align 1, !tbaa !2160
  %57 = zext i8 %56 to i64
  %58 = shl nuw nsw i64 %57, 40
  %59 = or i64 %54, %58
  %60 = getelementptr inbounds i8, ptr %19, i64 6
  %61 = load i8, ptr %60, align 1, !tbaa !2160
  %62 = zext i8 %61 to i64
  %63 = shl nuw nsw i64 %62, 48
  %64 = or i64 %59, %63
  %65 = getelementptr inbounds i8, ptr %19, i64 7
  %66 = load i8, ptr %65, align 1, !tbaa !2160
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
  %77 = load i8, ptr %76, align 1, !tbaa !2160
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
  %93 = load i8, ptr %86, align 1, !tbaa !2160
  %94 = zext i8 %93 to i64
  %95 = getelementptr inbounds i8, ptr %86, i64 1
  %96 = load i8, ptr %95, align 1, !tbaa !2160
  %97 = zext i8 %96 to i64
  %98 = shl nuw nsw i64 %97, 8
  %99 = or disjoint i64 %98, %94
  %100 = getelementptr inbounds i8, ptr %86, i64 2
  %101 = load i8, ptr %100, align 1, !tbaa !2160
  %102 = zext i8 %101 to i64
  %103 = shl nuw nsw i64 %102, 16
  %104 = or disjoint i64 %99, %103
  %105 = getelementptr inbounds i8, ptr %86, i64 3
  %106 = load i8, ptr %105, align 1, !tbaa !2160
  %107 = zext i8 %106 to i64
  %108 = shl nuw nsw i64 %107, 24
  %109 = or disjoint i64 %104, %108
  %110 = getelementptr inbounds i8, ptr %86, i64 4
  %111 = load i8, ptr %110, align 1, !tbaa !2160
  %112 = zext i8 %111 to i64
  %113 = shl nuw nsw i64 %112, 32
  %114 = or disjoint i64 %109, %113
  %115 = getelementptr inbounds i8, ptr %86, i64 5
  %116 = load i8, ptr %115, align 1, !tbaa !2160
  %117 = zext i8 %116 to i64
  %118 = shl nuw nsw i64 %117, 40
  %119 = or i64 %114, %118
  %120 = getelementptr inbounds i8, ptr %86, i64 6
  %121 = load i8, ptr %120, align 1, !tbaa !2160
  %122 = zext i8 %121 to i64
  %123 = shl nuw nsw i64 %122, 48
  %124 = or i64 %119, %123
  %125 = getelementptr inbounds i8, ptr %86, i64 7
  %126 = load i8, ptr %125, align 1, !tbaa !2160
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
  %137 = load i8, ptr %136, align 1, !tbaa !2160
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
  %153 = load i8, ptr %146, align 1, !tbaa !2160
  %154 = zext i8 %153 to i64
  %155 = getelementptr inbounds i8, ptr %146, i64 1
  %156 = load i8, ptr %155, align 1, !tbaa !2160
  %157 = zext i8 %156 to i64
  %158 = shl nuw nsw i64 %157, 8
  %159 = or disjoint i64 %158, %154
  %160 = getelementptr inbounds i8, ptr %146, i64 2
  %161 = load i8, ptr %160, align 1, !tbaa !2160
  %162 = zext i8 %161 to i64
  %163 = shl nuw nsw i64 %162, 16
  %164 = or disjoint i64 %159, %163
  %165 = getelementptr inbounds i8, ptr %146, i64 3
  %166 = load i8, ptr %165, align 1, !tbaa !2160
  %167 = zext i8 %166 to i64
  %168 = shl nuw nsw i64 %167, 24
  %169 = or disjoint i64 %164, %168
  %170 = getelementptr inbounds i8, ptr %146, i64 4
  %171 = load i8, ptr %170, align 1, !tbaa !2160
  %172 = zext i8 %171 to i64
  %173 = shl nuw nsw i64 %172, 32
  %174 = or disjoint i64 %169, %173
  %175 = getelementptr inbounds i8, ptr %146, i64 5
  %176 = load i8, ptr %175, align 1, !tbaa !2160
  %177 = zext i8 %176 to i64
  %178 = shl nuw nsw i64 %177, 40
  %179 = or i64 %174, %178
  %180 = getelementptr inbounds i8, ptr %146, i64 6
  %181 = load i8, ptr %180, align 1, !tbaa !2160
  %182 = zext i8 %181 to i64
  %183 = shl nuw nsw i64 %182, 48
  %184 = or i64 %179, %183
  %185 = getelementptr inbounds i8, ptr %146, i64 7
  %186 = load i8, ptr %185, align 1, !tbaa !2160
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
  %197 = load i8, ptr %196, align 1, !tbaa !2160
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
  %213 = load i8, ptr %206, align 1, !tbaa !2160
  %214 = zext i8 %213 to i64
  %215 = getelementptr inbounds i8, ptr %206, i64 1
  %216 = load i8, ptr %215, align 1, !tbaa !2160
  %217 = zext i8 %216 to i64
  %218 = shl nuw nsw i64 %217, 8
  %219 = or disjoint i64 %218, %214
  %220 = getelementptr inbounds i8, ptr %206, i64 2
  %221 = load i8, ptr %220, align 1, !tbaa !2160
  %222 = zext i8 %221 to i64
  %223 = shl nuw nsw i64 %222, 16
  %224 = or disjoint i64 %219, %223
  %225 = getelementptr inbounds i8, ptr %206, i64 3
  %226 = load i8, ptr %225, align 1, !tbaa !2160
  %227 = zext i8 %226 to i64
  %228 = shl nuw nsw i64 %227, 24
  %229 = or disjoint i64 %224, %228
  %230 = getelementptr inbounds i8, ptr %206, i64 4
  %231 = load i8, ptr %230, align 1, !tbaa !2160
  %232 = zext i8 %231 to i64
  %233 = shl nuw nsw i64 %232, 32
  %234 = or disjoint i64 %229, %233
  %235 = getelementptr inbounds i8, ptr %206, i64 5
  %236 = load i8, ptr %235, align 1, !tbaa !2160
  %237 = zext i8 %236 to i64
  %238 = shl nuw nsw i64 %237, 40
  %239 = or i64 %234, %238
  %240 = getelementptr inbounds i8, ptr %206, i64 6
  %241 = load i8, ptr %240, align 1, !tbaa !2160
  %242 = zext i8 %241 to i64
  %243 = shl nuw nsw i64 %242, 48
  %244 = or i64 %239, %243
  %245 = getelementptr inbounds i8, ptr %206, i64 7
  %246 = load i8, ptr %245, align 1, !tbaa !2160
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
  %257 = load i8, ptr %256, align 1, !tbaa !2160
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
  %273 = load i8, ptr %266, align 1, !tbaa !2160
  %274 = zext i8 %273 to i64
  %275 = getelementptr inbounds i8, ptr %266, i64 1
  %276 = load i8, ptr %275, align 1, !tbaa !2160
  %277 = zext i8 %276 to i64
  %278 = shl nuw nsw i64 %277, 8
  %279 = or disjoint i64 %278, %274
  %280 = getelementptr inbounds i8, ptr %266, i64 2
  %281 = load i8, ptr %280, align 1, !tbaa !2160
  %282 = zext i8 %281 to i64
  %283 = shl nuw nsw i64 %282, 16
  %284 = or disjoint i64 %279, %283
  %285 = getelementptr inbounds i8, ptr %266, i64 3
  %286 = load i8, ptr %285, align 1, !tbaa !2160
  %287 = zext i8 %286 to i64
  %288 = shl nuw nsw i64 %287, 24
  %289 = or disjoint i64 %284, %288
  %290 = getelementptr inbounds i8, ptr %266, i64 4
  %291 = load i8, ptr %290, align 1, !tbaa !2160
  %292 = zext i8 %291 to i64
  %293 = shl nuw nsw i64 %292, 32
  %294 = or disjoint i64 %289, %293
  %295 = getelementptr inbounds i8, ptr %266, i64 5
  %296 = load i8, ptr %295, align 1, !tbaa !2160
  %297 = zext i8 %296 to i64
  %298 = shl nuw nsw i64 %297, 40
  %299 = or i64 %294, %298
  %300 = getelementptr inbounds i8, ptr %266, i64 6
  %301 = load i8, ptr %300, align 1, !tbaa !2160
  %302 = zext i8 %301 to i64
  %303 = shl nuw nsw i64 %302, 48
  %304 = or i64 %299, %303
  %305 = getelementptr inbounds i8, ptr %266, i64 7
  %306 = load i8, ptr %305, align 1, !tbaa !2160
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
  %317 = load i8, ptr %316, align 1, !tbaa !2160
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
  %333 = load i8, ptr %326, align 1, !tbaa !2160
  %334 = zext i8 %333 to i64
  %335 = getelementptr inbounds i8, ptr %326, i64 1
  %336 = load i8, ptr %335, align 1, !tbaa !2160
  %337 = zext i8 %336 to i64
  %338 = shl nuw nsw i64 %337, 8
  %339 = or disjoint i64 %338, %334
  %340 = getelementptr inbounds i8, ptr %326, i64 2
  %341 = load i8, ptr %340, align 1, !tbaa !2160
  %342 = zext i8 %341 to i64
  %343 = shl nuw nsw i64 %342, 16
  %344 = or disjoint i64 %339, %343
  %345 = getelementptr inbounds i8, ptr %326, i64 3
  %346 = load i8, ptr %345, align 1, !tbaa !2160
  %347 = zext i8 %346 to i64
  %348 = shl nuw nsw i64 %347, 24
  %349 = or disjoint i64 %344, %348
  %350 = getelementptr inbounds i8, ptr %326, i64 4
  %351 = load i8, ptr %350, align 1, !tbaa !2160
  %352 = zext i8 %351 to i64
  %353 = shl nuw nsw i64 %352, 32
  %354 = or disjoint i64 %349, %353
  %355 = getelementptr inbounds i8, ptr %326, i64 5
  %356 = load i8, ptr %355, align 1, !tbaa !2160
  %357 = zext i8 %356 to i64
  %358 = shl nuw nsw i64 %357, 40
  %359 = or i64 %354, %358
  %360 = getelementptr inbounds i8, ptr %326, i64 6
  %361 = load i8, ptr %360, align 1, !tbaa !2160
  %362 = zext i8 %361 to i64
  %363 = shl nuw nsw i64 %362, 48
  %364 = or i64 %359, %363
  %365 = getelementptr inbounds i8, ptr %326, i64 7
  %366 = load i8, ptr %365, align 1, !tbaa !2160
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
  %377 = load i8, ptr %376, align 1, !tbaa !2160
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
  %393 = load i8, ptr %386, align 1, !tbaa !2160
  %394 = zext i8 %393 to i64
  %395 = getelementptr inbounds i8, ptr %386, i64 1
  %396 = load i8, ptr %395, align 1, !tbaa !2160
  %397 = zext i8 %396 to i64
  %398 = shl nuw nsw i64 %397, 8
  %399 = or disjoint i64 %398, %394
  %400 = getelementptr inbounds i8, ptr %386, i64 2
  %401 = load i8, ptr %400, align 1, !tbaa !2160
  %402 = zext i8 %401 to i64
  %403 = shl nuw nsw i64 %402, 16
  %404 = or disjoint i64 %399, %403
  %405 = getelementptr inbounds i8, ptr %386, i64 3
  %406 = load i8, ptr %405, align 1, !tbaa !2160
  %407 = zext i8 %406 to i64
  %408 = shl nuw nsw i64 %407, 24
  %409 = or disjoint i64 %404, %408
  %410 = getelementptr inbounds i8, ptr %386, i64 4
  %411 = load i8, ptr %410, align 1, !tbaa !2160
  %412 = zext i8 %411 to i64
  %413 = shl nuw nsw i64 %412, 32
  %414 = or disjoint i64 %409, %413
  %415 = getelementptr inbounds i8, ptr %386, i64 5
  %416 = load i8, ptr %415, align 1, !tbaa !2160
  %417 = zext i8 %416 to i64
  %418 = shl nuw nsw i64 %417, 40
  %419 = or i64 %414, %418
  %420 = getelementptr inbounds i8, ptr %386, i64 6
  %421 = load i8, ptr %420, align 1, !tbaa !2160
  %422 = zext i8 %421 to i64
  %423 = shl nuw nsw i64 %422, 48
  %424 = or i64 %419, %423
  %425 = getelementptr inbounds i8, ptr %386, i64 7
  %426 = load i8, ptr %425, align 1, !tbaa !2160
  %427 = zext i8 %426 to i64
  %428 = shl nuw i64 %427, 56
  %429 = or i64 %424, %428
  br label %443

430:                                              ; preds = %430, %390
  %431 = phi i32 [ %441, %430 ], [ 0, %390 ]
  %432 = phi i64 [ %440, %430 ], [ 0, %390 ]
  %433 = zext nneg i32 %431 to i64
  %434 = getelementptr inbounds i8, ptr %386, i64 %433
  %435 = load i8, ptr %434, align 1, !tbaa !2160
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
declare i64 @llvm.umin.i64(i64, i64) #5

; Function Attrs: convergent mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal range(i64 0, 4294967296) i64 @__ockl_get_local_size(i32 noundef %0) #7 {
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
  %9 = load i16, ptr addrspace(4) %8, align 4, !range !2161, !invariant.load !2141, !noundef !2141
  %10 = zext nneg i16 %9 to i32
  %11 = getelementptr inbounds i8, ptr addrspace(4) %6, i64 12
  %12 = load i32, ptr addrspace(4) %11, align 4, !tbaa !2162
  %13 = mul i32 %7, %10
  %14 = sub i32 %12, %13
  %15 = tail call i32 @llvm.umin.i32(i32 %14, i32 %10)
  %16 = zext nneg i32 %15 to i64
  br label %76

17:                                               ; preds = %2
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %19 = tail call ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %20 = load i32, ptr addrspace(4) %19, align 4, !tbaa !2142
  %21 = icmp ult i32 %18, %20
  %22 = select i1 %21, i64 12, i64 18
  %23 = getelementptr inbounds i8, ptr addrspace(4) %19, i64 %22
  %24 = load i16, ptr addrspace(4) %23, align 2, !tbaa !2165
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
  %33 = load i16, ptr addrspace(4) %32, align 2, !range !2161, !invariant.load !2141, !noundef !2141
  %34 = zext nneg i16 %33 to i32
  %35 = getelementptr inbounds i8, ptr addrspace(4) %30, i64 16
  %36 = load i32, ptr addrspace(4) %35, align 8, !tbaa !2166
  %37 = mul i32 %31, %34
  %38 = sub i32 %36, %37
  %39 = tail call i32 @llvm.umin.i32(i32 %38, i32 %34)
  %40 = zext nneg i32 %39 to i64
  br label %76

41:                                               ; preds = %26
  %42 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %43 = tail call ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %44 = getelementptr inbounds i8, ptr addrspace(4) %43, i64 4
  %45 = load i32, ptr addrspace(4) %44, align 4, !tbaa !2142
  %46 = icmp ult i32 %42, %45
  %47 = select i1 %46, i64 14, i64 20
  %48 = getelementptr inbounds i8, ptr addrspace(4) %43, i64 %47
  %49 = load i16, ptr addrspace(4) %48, align 2, !tbaa !2165
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
  %58 = load i16, ptr addrspace(4) %57, align 4, !range !2161, !invariant.load !2141, !noundef !2141
  %59 = zext nneg i16 %58 to i32
  %60 = getelementptr inbounds i8, ptr addrspace(4) %55, i64 20
  %61 = load i32, ptr addrspace(4) %60, align 4, !tbaa !2167
  %62 = mul i32 %56, %59
  %63 = sub i32 %61, %62
  %64 = tail call i32 @llvm.umin.i32(i32 %63, i32 %59)
  %65 = zext nneg i32 %64 to i64
  br label %76

66:                                               ; preds = %51
  %67 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %68 = tail call ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %69 = getelementptr inbounds i8, ptr addrspace(4) %68, i64 8
  %70 = load i32, ptr addrspace(4) %69, align 4, !tbaa !2142
  %71 = icmp ult i32 %67, %70
  %72 = select i1 %71, i64 16, i64 22
  %73 = getelementptr inbounds i8, ptr addrspace(4) %68, i64 %72
  %74 = load i16, ptr addrspace(4) %73, align 2, !tbaa !2165
  %75 = zext i16 %74 to i64
  br label %76

76:                                               ; preds = %66, %54, %41, %29, %17, %5, %1
  %77 = phi i64 [ 1, %1 ], [ %16, %5 ], [ %25, %17 ], [ %40, %29 ], [ %50, %41 ], [ %65, %54 ], [ %75, %66 ]
  ret i64 %77
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef nonnull align 4 ptr addrspace(4) @llvm.amdgcn.dispatch.ptr() #5

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.amdgcn.workgroup.id.x() #5

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.umin.i32(i32, i32) #5

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.amdgcn.workgroup.id.y() #5

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.amdgcn.workgroup.id.z() #5

; Function Attrs: convergent mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal range(i64 0, 4294967296) i64 @__ockl_get_group_id(i32 noundef %0) #7 {
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
attributes #5 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #6 = { convergent mustprogress nofree norecurse nounwind willreturn memory(none) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx90a" "target-features"="+16-bit-insts,+atomic-buffer-global-pk-add-f16-insts,+atomic-fadd-rtn-insts,+ci-insts,+dl-insts,+dot1-insts,+dot10-insts,+dot2-insts,+dot3-insts,+dot4-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+gfx8-insts,+gfx9-insts,+gfx90a-insts,+gws,+image-insts,+mai-insts,+s-memrealtime,+s-memtime-inst,+wavefrontsize64" }
attributes #7 = { convergent mustprogress nofree norecurse nosync nounwind willreturn memory(none) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx90a" "target-features"="+16-bit-insts,+atomic-buffer-global-pk-add-f16-insts,+atomic-fadd-rtn-insts,+ci-insts,+dl-insts,+dot1-insts,+dot10-insts,+dot2-insts,+dot3-insts,+dot4-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+gfx8-insts,+gfx9-insts,+gfx90a-insts,+gws,+image-insts,+mai-insts,+s-memrealtime,+s-memtime-inst,+wavefrontsize64" }
attributes #8 = { convergent norecurse nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx90a" "target-features"="+16-bit-insts,+atomic-buffer-global-pk-add-f16-insts,+atomic-fadd-rtn-insts,+ci-insts,+dl-insts,+dot1-insts,+dot10-insts,+dot2-insts,+dot3-insts,+dot4-insts,+dot5-insts,+dot6-insts,+dot7-insts,+dpp,+gfx8-insts,+gfx9-insts,+gfx90a-insts,+gws,+image-insts,+mai-insts,+s-memrealtime,+s-memtime-inst,+wavefrontsize64" }
attributes #9 = { convergent nocallback nofree nounwind willreturn memory(none) }
attributes #10 = { nocallback nofree nosync nounwind willreturn }
attributes #11 = { nounwind }
attributes #12 = { nocallback nofree nosync nounwind willreturn memory(none) }
attributes #13 = { convergent nounwind }
attributes #14 = { convergent nounwind willreturn memory(none) }
attributes #15 = { cold convergent nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!1643, !1644, !1645, !1646, !1647, !1648, !1649}
!llvm.ident = !{!1650, !1650, !1650, !1650, !1650, !1650, !1650, !1650, !1650, !1650, !1650}
!opencl.ocl.version = !{!1651, !1651, !1651, !1651, !1651, !1651, !1651, !1651, !1651, !1651}

!0 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !1, producer: "AMD clang version 19.0.0git (https://github.com/RadeonOpenCompute/llvm-project roc-6.4.2 25224 d366fa84f3fdcbd4b10847ebd5db572ae12a34fb)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, imports: !20, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/ccs/home/mdunlavy/GPU_Fault_Injection/HeCBench/src/colorwheel-hip/main.cu", directory: "/ccs/home/mdunlavy/GPU_Fault_Injection", checksumkind: CSK_MD5, checksum: "4c8b22f0f3b333f48673b33d1e2205ea")
!2 = !{!3, !4, !5}
!3 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!4 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!5 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dim3", file: !6, line: 1179, size: 96, flags: DIFlagTypePassByValue | DIFlagNonTrivial, elements: !7, identifier: "_ZTS4dim3")
!6 = !DIFile(filename: "/opt/rocm-6.4.2/include/hip/hip_runtime_api.h", directory: "", checksumkind: CSK_MD5, checksum: "2a1ac901d8db5ef891d901275c66dbab")
!7 = !{!8, !14, !15, !16}
!8 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !5, file: !6, line: 1180, baseType: !9, size: 32)
!9 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !10, line: 26, baseType: !11)
!10 = !DIFile(filename: "/usr/include/bits/stdint-uintn.h", directory: "", checksumkind: CSK_MD5, checksum: "4ecee94d7257cd86659727d06a979b60")
!11 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !12, line: 42, baseType: !13)
!12 = !DIFile(filename: "/usr/include/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "4a64d909bcfa62a0a7682c3ac78c6965")
!13 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!14 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !5, file: !6, line: 1181, baseType: !9, size: 32, offset: 32)
!15 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !5, file: !6, line: 1182, baseType: !9, size: 32, offset: 64)
!16 = !DISubprogram(name: "dim3", scope: !5, file: !6, line: 1184, type: !17, scopeLine: 1184, flags: DIFlagPrototyped, spFlags: 0)
!17 = !DISubroutineType(types: !18)
!18 = !{null, !19, !9, !9, !9}
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!20 = !{!21, !28, !35, !37, !39, !43, !45, !47, !49, !51, !53, !55, !57, !62, !66, !68, !70, !75, !77, !79, !81, !83, !85, !87, !90, !92, !94, !98, !103, !105, !107, !109, !111, !113, !115, !117, !119, !121, !123, !127, !131, !133, !135, !137, !139, !141, !143, !145, !147, !149, !151, !153, !155, !157, !159, !161, !165, !169, !173, !175, !177, !179, !181, !183, !185, !187, !189, !191, !195, !199, !203, !205, !207, !209, !214, !218, !222, !224, !226, !228, !230, !232, !234, !236, !238, !240, !242, !244, !246, !251, !255, !259, !261, !263, !265, !272, !276, !280, !282, !284, !286, !288, !290, !292, !296, !300, !302, !304, !306, !308, !312, !316, !320, !322, !324, !326, !328, !330, !332, !336, !340, !344, !346, !350, !354, !356, !358, !360, !362, !364, !366, !370, !374, !380, !384, !392, !397, !399, !401, !405, !409, !419, !421, !425, !429, !433, !438, !442, !446, !450, !454, !462, !466, !470, !472, !476, !480, !484, !490, !494, !498, !500, !508, !512, !519, !521, !525, !529, !533, !537, !542, !546, !550, !551, !552, !553, !555, !556, !557, !558, !559, !560, !561, !563, !564, !565, !566, !567, !568, !569, !570, !575, !576, !577, !578, !579, !580, !581, !582, !583, !584, !585, !586, !587, !588, !589, !590, !591, !592, !593, !594, !595, !596, !597, !598, !599, !602, !604, !606, !608, !610, !612, !614, !616, !618, !620, !622, !624, !626, !628, !630, !632, !634, !636, !638, !640, !642, !644, !646, !648, !650, !652, !656, !658, !660, !665, !669, !671, !673, !675, !677, !679, !681, !683, !685, !687, !689, !691, !693, !695, !697, !699, !701, !703, !705, !707, !709, !711, !716, !718, !720, !722, !724, !726, !728, !730, !732, !734, !736, !738, !740, !742, !744, !746, !748, !750, !752, !754, !758, !760, !762, !764, !769, !771, !773, !775, !777, !779, !781, !783, !785, !787, !789, !791, !793, !795, !797, !799, !801, !803, !805, !807, !809, !811, !813, !815, !817, !819, !821, !823, !825, !827, !829, !831, !833, !835, !837, !839, !841, !843, !845, !847, !849, !851, !853, !855, !857, !859, !863, !865, !867, !869, !871, !875, !879, !884, !901, !904, !909, !917, !922, !926, !930, !934, !938, !940, !942, !946, !952, !956, !962, !968, !970, !974, !978, !982, !986, !994, !996, !1000, !1004, !1008, !1010, !1014, !1018, !1022, !1024, !1026, !1030, !1038, !1042, !1046, !1050, !1052, !1058, !1060, !1066, !1070, !1074, !1078, !1082, !1086, !1090, !1092, !1094, !1098, !1102, !1106, !1108, !1112, !1116, !1118, !1120, !1124, !1128, !1132, !1136, !1137, !1138, !1139, !1140, !1141, !1142, !1143, !1144, !1145, !1146, !1150, !1154, !1159, !1163, !1165, !1167, !1169, !1171, !1173, !1175, !1177, !1179, !1181, !1183, !1185, !1187, !1189, !1193, !1199, !1204, !1208, !1210, !1212, !1214, !1216, !1223, !1227, !1231, !1235, !1239, !1243, !1248, !1252, !1254, !1258, !1264, !1268, !1273, !1275, !1277, !1281, !1285, !1287, !1289, !1291, !1293, !1297, !1299, !1301, !1305, !1309, !1313, !1317, !1321, !1325, !1327, !1331, !1335, !1339, !1343, !1345, !1347, !1351, !1355, !1356, !1357, !1358, !1359, !1360, !1368, !1375, !1378, !1379, !1381, !1383, !1385, !1387, !1391, !1393, !1395, !1397, !1399, !1401, !1403, !1405, !1407, !1411, !1415, !1417, !1421, !1425, !1431, !1435, !1437, !1440, !1443, !1445, !1447, !1449, !1452, !1455, !1458, !1461, !1464, !1466, !1470, !1474, !1475, !1478, !1480, !1482, !1484, !1486, !1489, !1492, !1495, !1498, !1501, !1503, !1508, !1512, !1513, !1518, !1522, !1527, !1532, !1536, !1542, !1546, !1548, !1552, !1559, !1564, !1569, !1575, !1579, !1583, !1587, !1591, !1595, !1597, !1599, !1601, !1605, !1609, !1613, !1617, !1621, !1623, !1625, !1627, !1631, !1635, !1639, !1641}
!21 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !23, file: !27, line: 52)
!22 = !DINamespace(name: "std", scope: null)
!23 = !DISubprogram(name: "abs", scope: !24, file: !24, line: 980, type: !25, flags: DIFlagPrototyped, spFlags: 0)
!24 = !DIFile(filename: "/usr/include/stdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "761a239547e58b18c7327eb395f5cc1f")
!25 = !DISubroutineType(types: !26)
!26 = !{!4, !4}
!27 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/bits/std_abs.h", directory: "")
!28 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !29, file: !34, line: 85)
!29 = !DISubprogram(name: "acos", scope: !30, file: !30, line: 53, type: !31, flags: DIFlagPrototyped, spFlags: 0)
!30 = !DIFile(filename: "/usr/include/bits/mathcalls.h", directory: "", checksumkind: CSK_MD5, checksum: "a03d6e5877646e3ad0a8a5735f9e6f62")
!31 = !DISubroutineType(types: !32)
!32 = !{!33, !33}
!33 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!34 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/cmath", directory: "")
!35 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !36, file: !34, line: 104)
!36 = !DISubprogram(name: "asin", scope: !30, file: !30, line: 55, type: !31, flags: DIFlagPrototyped, spFlags: 0)
!37 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !38, file: !34, line: 123)
!38 = !DISubprogram(name: "atan", scope: !30, file: !30, line: 57, type: !31, flags: DIFlagPrototyped, spFlags: 0)
!39 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !40, file: !34, line: 142)
!40 = !DISubprogram(name: "atan2", scope: !30, file: !30, line: 59, type: !41, flags: DIFlagPrototyped, spFlags: 0)
!41 = !DISubroutineType(types: !42)
!42 = !{!33, !33, !33}
!43 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !44, file: !34, line: 154)
!44 = !DISubprogram(name: "ceil", scope: !30, file: !30, line: 159, type: !31, flags: DIFlagPrototyped, spFlags: 0)
!45 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !46, file: !34, line: 173)
!46 = !DISubprogram(name: "cos", scope: !30, file: !30, line: 62, type: !31, flags: DIFlagPrototyped, spFlags: 0)
!47 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !48, file: !34, line: 192)
!48 = !DISubprogram(name: "cosh", scope: !30, file: !30, line: 71, type: !31, flags: DIFlagPrototyped, spFlags: 0)
!49 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !50, file: !34, line: 211)
!50 = !DISubprogram(name: "exp", scope: !30, file: !30, line: 95, type: !31, flags: DIFlagPrototyped, spFlags: 0)
!51 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !52, file: !34, line: 230)
!52 = !DISubprogram(name: "fabs", scope: !30, file: !30, line: 162, type: !31, flags: DIFlagPrototyped, spFlags: 0)
!53 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !54, file: !34, line: 249)
!54 = !DISubprogram(name: "floor", scope: !30, file: !30, line: 165, type: !31, flags: DIFlagPrototyped, spFlags: 0)
!55 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !56, file: !34, line: 268)
!56 = !DISubprogram(name: "fmod", scope: !30, file: !30, line: 168, type: !41, flags: DIFlagPrototyped, spFlags: 0)
!57 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !58, file: !34, line: 280)
!58 = !DISubprogram(name: "frexp", scope: !30, file: !30, line: 98, type: !59, flags: DIFlagPrototyped, spFlags: 0)
!59 = !DISubroutineType(types: !60)
!60 = !{!33, !33, !61}
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!62 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !63, file: !34, line: 299)
!63 = !DISubprogram(name: "ldexp", scope: !30, file: !30, line: 101, type: !64, flags: DIFlagPrototyped, spFlags: 0)
!64 = !DISubroutineType(types: !65)
!65 = !{!33, !33, !4}
!66 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !67, file: !34, line: 318)
!67 = !DISubprogram(name: "log", scope: !30, file: !30, line: 104, type: !31, flags: DIFlagPrototyped, spFlags: 0)
!68 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !69, file: !34, line: 337)
!69 = !DISubprogram(name: "log10", scope: !30, file: !30, line: 107, type: !31, flags: DIFlagPrototyped, spFlags: 0)
!70 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !71, file: !34, line: 356)
!71 = !DISubprogram(name: "modf", scope: !30, file: !30, line: 110, type: !72, flags: DIFlagPrototyped, spFlags: 0)
!72 = !DISubroutineType(types: !73)
!73 = !{!33, !33, !74}
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !33, size: 64)
!75 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !76, file: !34, line: 368)
!76 = !DISubprogram(name: "pow", scope: !30, file: !30, line: 140, type: !41, flags: DIFlagPrototyped, spFlags: 0)
!77 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !78, file: !34, line: 396)
!78 = !DISubprogram(name: "sin", scope: !30, file: !30, line: 64, type: !31, flags: DIFlagPrototyped, spFlags: 0)
!79 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !80, file: !34, line: 415)
!80 = !DISubprogram(name: "sinh", scope: !30, file: !30, line: 73, type: !31, flags: DIFlagPrototyped, spFlags: 0)
!81 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !82, file: !34, line: 434)
!82 = !DISubprogram(name: "sqrt", scope: !30, file: !30, line: 143, type: !31, flags: DIFlagPrototyped, spFlags: 0)
!83 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !84, file: !34, line: 453)
!84 = !DISubprogram(name: "tan", scope: !30, file: !30, line: 66, type: !31, flags: DIFlagPrototyped, spFlags: 0)
!85 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !86, file: !34, line: 472)
!86 = !DISubprogram(name: "tanh", scope: !30, file: !30, line: 75, type: !31, flags: DIFlagPrototyped, spFlags: 0)
!87 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !88, file: !34, line: 1881)
!88 = !DIDerivedType(tag: DW_TAG_typedef, name: "double_t", file: !89, line: 164, baseType: !33)
!89 = !DIFile(filename: "/usr/include/math.h", directory: "", checksumkind: CSK_MD5, checksum: "555a51fc91303a79e6e6a7bf2a303f79")
!90 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !91, file: !34, line: 1882)
!91 = !DIDerivedType(tag: DW_TAG_typedef, name: "float_t", file: !89, line: 163, baseType: !3)
!92 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !93, file: !34, line: 1885)
!93 = !DISubprogram(name: "acosh", scope: !30, file: !30, line: 85, type: !31, flags: DIFlagPrototyped, spFlags: 0)
!94 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !95, file: !34, line: 1886)
!95 = !DISubprogram(name: "acoshf", scope: !30, file: !30, line: 85, type: !96, flags: DIFlagPrototyped, spFlags: 0)
!96 = !DISubroutineType(types: !97)
!97 = !{!3, !3}
!98 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !99, file: !34, line: 1887)
!99 = !DISubprogram(name: "acoshl", scope: !30, file: !30, line: 85, type: !100, flags: DIFlagPrototyped, spFlags: 0)
!100 = !DISubroutineType(types: !101)
!101 = !{!102, !102}
!102 = !DIBasicType(name: "long double", size: 64, encoding: DW_ATE_float)
!103 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !104, file: !34, line: 1889)
!104 = !DISubprogram(name: "asinh", scope: !30, file: !30, line: 87, type: !31, flags: DIFlagPrototyped, spFlags: 0)
!105 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !106, file: !34, line: 1890)
!106 = !DISubprogram(name: "asinhf", scope: !30, file: !30, line: 87, type: !96, flags: DIFlagPrototyped, spFlags: 0)
!107 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !108, file: !34, line: 1891)
!108 = !DISubprogram(name: "asinhl", scope: !30, file: !30, line: 87, type: !100, flags: DIFlagPrototyped, spFlags: 0)
!109 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !110, file: !34, line: 1893)
!110 = !DISubprogram(name: "atanh", scope: !30, file: !30, line: 89, type: !31, flags: DIFlagPrototyped, spFlags: 0)
!111 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !112, file: !34, line: 1894)
!112 = !DISubprogram(name: "atanhf", scope: !30, file: !30, line: 89, type: !96, flags: DIFlagPrototyped, spFlags: 0)
!113 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !114, file: !34, line: 1895)
!114 = !DISubprogram(name: "atanhl", scope: !30, file: !30, line: 89, type: !100, flags: DIFlagPrototyped, spFlags: 0)
!115 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !116, file: !34, line: 1897)
!116 = !DISubprogram(name: "cbrt", scope: !30, file: !30, line: 152, type: !31, flags: DIFlagPrototyped, spFlags: 0)
!117 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !118, file: !34, line: 1898)
!118 = !DISubprogram(name: "cbrtf", scope: !30, file: !30, line: 152, type: !96, flags: DIFlagPrototyped, spFlags: 0)
!119 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !120, file: !34, line: 1899)
!120 = !DISubprogram(name: "cbrtl", scope: !30, file: !30, line: 152, type: !100, flags: DIFlagPrototyped, spFlags: 0)
!121 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !122, file: !34, line: 1901)
!122 = !DISubprogram(name: "copysign", scope: !30, file: !30, line: 198, type: !41, flags: DIFlagPrototyped, spFlags: 0)
!123 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !124, file: !34, line: 1902)
!124 = !DISubprogram(name: "copysignf", scope: !30, file: !30, line: 198, type: !125, flags: DIFlagPrototyped, spFlags: 0)
!125 = !DISubroutineType(types: !126)
!126 = !{!3, !3, !3}
!127 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !128, file: !34, line: 1903)
!128 = !DISubprogram(name: "copysignl", scope: !30, file: !30, line: 198, type: !129, flags: DIFlagPrototyped, spFlags: 0)
!129 = !DISubroutineType(types: !130)
!130 = !{!102, !102, !102}
!131 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !132, file: !34, line: 1905)
!132 = !DISubprogram(name: "erf", scope: !30, file: !30, line: 231, type: !31, flags: DIFlagPrototyped, spFlags: 0)
!133 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !134, file: !34, line: 1906)
!134 = !DISubprogram(name: "erff", scope: !30, file: !30, line: 231, type: !96, flags: DIFlagPrototyped, spFlags: 0)
!135 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !136, file: !34, line: 1907)
!136 = !DISubprogram(name: "erfl", scope: !30, file: !30, line: 231, type: !100, flags: DIFlagPrototyped, spFlags: 0)
!137 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !138, file: !34, line: 1909)
!138 = !DISubprogram(name: "erfc", scope: !30, file: !30, line: 232, type: !31, flags: DIFlagPrototyped, spFlags: 0)
!139 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !140, file: !34, line: 1910)
!140 = !DISubprogram(name: "erfcf", scope: !30, file: !30, line: 232, type: !96, flags: DIFlagPrototyped, spFlags: 0)
!141 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !142, file: !34, line: 1911)
!142 = !DISubprogram(name: "erfcl", scope: !30, file: !30, line: 232, type: !100, flags: DIFlagPrototyped, spFlags: 0)
!143 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !144, file: !34, line: 1913)
!144 = !DISubprogram(name: "exp2", scope: !30, file: !30, line: 130, type: !31, flags: DIFlagPrototyped, spFlags: 0)
!145 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !146, file: !34, line: 1914)
!146 = !DISubprogram(name: "exp2f", scope: !30, file: !30, line: 130, type: !96, flags: DIFlagPrototyped, spFlags: 0)
!147 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !148, file: !34, line: 1915)
!148 = !DISubprogram(name: "exp2l", scope: !30, file: !30, line: 130, type: !100, flags: DIFlagPrototyped, spFlags: 0)
!149 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !150, file: !34, line: 1917)
!150 = !DISubprogram(name: "expm1", scope: !30, file: !30, line: 119, type: !31, flags: DIFlagPrototyped, spFlags: 0)
!151 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !152, file: !34, line: 1918)
!152 = !DISubprogram(name: "expm1f", scope: !30, file: !30, line: 119, type: !96, flags: DIFlagPrototyped, spFlags: 0)
!153 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !154, file: !34, line: 1919)
!154 = !DISubprogram(name: "expm1l", scope: !30, file: !30, line: 119, type: !100, flags: DIFlagPrototyped, spFlags: 0)
!155 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !156, file: !34, line: 1921)
!156 = !DISubprogram(name: "fdim", scope: !30, file: !30, line: 329, type: !41, flags: DIFlagPrototyped, spFlags: 0)
!157 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !158, file: !34, line: 1922)
!158 = !DISubprogram(name: "fdimf", scope: !30, file: !30, line: 329, type: !125, flags: DIFlagPrototyped, spFlags: 0)
!159 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !160, file: !34, line: 1923)
!160 = !DISubprogram(name: "fdiml", scope: !30, file: !30, line: 329, type: !129, flags: DIFlagPrototyped, spFlags: 0)
!161 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !162, file: !34, line: 1925)
!162 = !DISubprogram(name: "fma", scope: !30, file: !30, line: 340, type: !163, flags: DIFlagPrototyped, spFlags: 0)
!163 = !DISubroutineType(types: !164)
!164 = !{!33, !33, !33, !33}
!165 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !166, file: !34, line: 1926)
!166 = !DISubprogram(name: "fmaf", scope: !30, file: !30, line: 340, type: !167, flags: DIFlagPrototyped, spFlags: 0)
!167 = !DISubroutineType(types: !168)
!168 = !{!3, !3, !3, !3}
!169 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !170, file: !34, line: 1927)
!170 = !DISubprogram(name: "fmal", scope: !30, file: !30, line: 340, type: !171, flags: DIFlagPrototyped, spFlags: 0)
!171 = !DISubroutineType(types: !172)
!172 = !{!102, !102, !102, !102}
!173 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !174, file: !34, line: 1929)
!174 = !DISubprogram(name: "fmax", scope: !30, file: !30, line: 333, type: !41, flags: DIFlagPrototyped, spFlags: 0)
!175 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !176, file: !34, line: 1930)
!176 = !DISubprogram(name: "fmaxf", scope: !30, file: !30, line: 333, type: !125, flags: DIFlagPrototyped, spFlags: 0)
!177 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !178, file: !34, line: 1931)
!178 = !DISubprogram(name: "fmaxl", scope: !30, file: !30, line: 333, type: !129, flags: DIFlagPrototyped, spFlags: 0)
!179 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !180, file: !34, line: 1933)
!180 = !DISubprogram(name: "fmin", scope: !30, file: !30, line: 336, type: !41, flags: DIFlagPrototyped, spFlags: 0)
!181 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !182, file: !34, line: 1934)
!182 = !DISubprogram(name: "fminf", scope: !30, file: !30, line: 336, type: !125, flags: DIFlagPrototyped, spFlags: 0)
!183 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !184, file: !34, line: 1935)
!184 = !DISubprogram(name: "fminl", scope: !30, file: !30, line: 336, type: !129, flags: DIFlagPrototyped, spFlags: 0)
!185 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !186, file: !34, line: 1937)
!186 = !DISubprogram(name: "hypot", scope: !30, file: !30, line: 147, type: !41, flags: DIFlagPrototyped, spFlags: 0)
!187 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !188, file: !34, line: 1938)
!188 = !DISubprogram(name: "hypotf", scope: !30, file: !30, line: 147, type: !125, flags: DIFlagPrototyped, spFlags: 0)
!189 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !190, file: !34, line: 1939)
!190 = !DISubprogram(name: "hypotl", scope: !30, file: !30, line: 147, type: !129, flags: DIFlagPrototyped, spFlags: 0)
!191 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !192, file: !34, line: 1941)
!192 = !DISubprogram(name: "ilogb", scope: !30, file: !30, line: 283, type: !193, flags: DIFlagPrototyped, spFlags: 0)
!193 = !DISubroutineType(types: !194)
!194 = !{!4, !33}
!195 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !196, file: !34, line: 1942)
!196 = !DISubprogram(name: "ilogbf", scope: !30, file: !30, line: 283, type: !197, flags: DIFlagPrototyped, spFlags: 0)
!197 = !DISubroutineType(types: !198)
!198 = !{!4, !3}
!199 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !200, file: !34, line: 1943)
!200 = !DISubprogram(name: "ilogbl", scope: !30, file: !30, line: 283, type: !201, flags: DIFlagPrototyped, spFlags: 0)
!201 = !DISubroutineType(types: !202)
!202 = !{!4, !102}
!203 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !204, file: !34, line: 1945)
!204 = !DISubprogram(name: "lgamma", scope: !30, file: !30, line: 233, type: !31, flags: DIFlagPrototyped, spFlags: 0)
!205 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !206, file: !34, line: 1946)
!206 = !DISubprogram(name: "lgammaf", scope: !30, file: !30, line: 233, type: !96, flags: DIFlagPrototyped, spFlags: 0)
!207 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !208, file: !34, line: 1947)
!208 = !DISubprogram(name: "lgammal", scope: !30, file: !30, line: 233, type: !100, flags: DIFlagPrototyped, spFlags: 0)
!209 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !210, file: !34, line: 1950)
!210 = !DISubprogram(name: "llrint", scope: !30, file: !30, line: 319, type: !211, flags: DIFlagPrototyped, spFlags: 0)
!211 = !DISubroutineType(types: !212)
!212 = !{!213, !33}
!213 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!214 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !215, file: !34, line: 1951)
!215 = !DISubprogram(name: "llrintf", scope: !30, file: !30, line: 319, type: !216, flags: DIFlagPrototyped, spFlags: 0)
!216 = !DISubroutineType(types: !217)
!217 = !{!213, !3}
!218 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !219, file: !34, line: 1952)
!219 = !DISubprogram(name: "llrintl", scope: !30, file: !30, line: 319, type: !220, flags: DIFlagPrototyped, spFlags: 0)
!220 = !DISubroutineType(types: !221)
!221 = !{!213, !102}
!222 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !223, file: !34, line: 1954)
!223 = !DISubprogram(name: "llround", scope: !30, file: !30, line: 325, type: !211, flags: DIFlagPrototyped, spFlags: 0)
!224 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !225, file: !34, line: 1955)
!225 = !DISubprogram(name: "llroundf", scope: !30, file: !30, line: 325, type: !216, flags: DIFlagPrototyped, spFlags: 0)
!226 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !227, file: !34, line: 1956)
!227 = !DISubprogram(name: "llroundl", scope: !30, file: !30, line: 325, type: !220, flags: DIFlagPrototyped, spFlags: 0)
!228 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !229, file: !34, line: 1959)
!229 = !DISubprogram(name: "log1p", scope: !30, file: !30, line: 122, type: !31, flags: DIFlagPrototyped, spFlags: 0)
!230 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !231, file: !34, line: 1960)
!231 = !DISubprogram(name: "log1pf", scope: !30, file: !30, line: 122, type: !96, flags: DIFlagPrototyped, spFlags: 0)
!232 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !233, file: !34, line: 1961)
!233 = !DISubprogram(name: "log1pl", scope: !30, file: !30, line: 122, type: !100, flags: DIFlagPrototyped, spFlags: 0)
!234 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !235, file: !34, line: 1963)
!235 = !DISubprogram(name: "log2", scope: !30, file: !30, line: 133, type: !31, flags: DIFlagPrototyped, spFlags: 0)
!236 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !237, file: !34, line: 1964)
!237 = !DISubprogram(name: "log2f", scope: !30, file: !30, line: 133, type: !96, flags: DIFlagPrototyped, spFlags: 0)
!238 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !239, file: !34, line: 1965)
!239 = !DISubprogram(name: "log2l", scope: !30, file: !30, line: 133, type: !100, flags: DIFlagPrototyped, spFlags: 0)
!240 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !241, file: !34, line: 1967)
!241 = !DISubprogram(name: "logb", scope: !30, file: !30, line: 125, type: !31, flags: DIFlagPrototyped, spFlags: 0)
!242 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !243, file: !34, line: 1968)
!243 = !DISubprogram(name: "logbf", scope: !30, file: !30, line: 125, type: !96, flags: DIFlagPrototyped, spFlags: 0)
!244 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !245, file: !34, line: 1969)
!245 = !DISubprogram(name: "logbl", scope: !30, file: !30, line: 125, type: !100, flags: DIFlagPrototyped, spFlags: 0)
!246 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !247, file: !34, line: 1971)
!247 = !DISubprogram(name: "lrint", scope: !30, file: !30, line: 317, type: !248, flags: DIFlagPrototyped, spFlags: 0)
!248 = !DISubroutineType(types: !249)
!249 = !{!250, !33}
!250 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!251 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !252, file: !34, line: 1972)
!252 = !DISubprogram(name: "lrintf", scope: !30, file: !30, line: 317, type: !253, flags: DIFlagPrototyped, spFlags: 0)
!253 = !DISubroutineType(types: !254)
!254 = !{!250, !3}
!255 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !256, file: !34, line: 1973)
!256 = !DISubprogram(name: "lrintl", scope: !30, file: !30, line: 317, type: !257, flags: DIFlagPrototyped, spFlags: 0)
!257 = !DISubroutineType(types: !258)
!258 = !{!250, !102}
!259 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !260, file: !34, line: 1975)
!260 = !DISubprogram(name: "lround", scope: !30, file: !30, line: 323, type: !248, flags: DIFlagPrototyped, spFlags: 0)
!261 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !262, file: !34, line: 1976)
!262 = !DISubprogram(name: "lroundf", scope: !30, file: !30, line: 323, type: !253, flags: DIFlagPrototyped, spFlags: 0)
!263 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !264, file: !34, line: 1977)
!264 = !DISubprogram(name: "lroundl", scope: !30, file: !30, line: 323, type: !257, flags: DIFlagPrototyped, spFlags: 0)
!265 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !266, file: !34, line: 1979)
!266 = !DISubprogram(name: "nan", scope: !30, file: !30, line: 203, type: !267, flags: DIFlagPrototyped, spFlags: 0)
!267 = !DISubroutineType(types: !268)
!268 = !{!33, !269}
!269 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !270, size: 64)
!270 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !271)
!271 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!272 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !273, file: !34, line: 1980)
!273 = !DISubprogram(name: "nanf", scope: !30, file: !30, line: 203, type: !274, flags: DIFlagPrototyped, spFlags: 0)
!274 = !DISubroutineType(types: !275)
!275 = !{!3, !269}
!276 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !277, file: !34, line: 1981)
!277 = !DISubprogram(name: "nanl", scope: !30, file: !30, line: 203, type: !278, flags: DIFlagPrototyped, spFlags: 0)
!278 = !DISubroutineType(types: !279)
!279 = !{!102, !269}
!280 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !281, file: !34, line: 1983)
!281 = !DISubprogram(name: "nearbyint", scope: !30, file: !30, line: 297, type: !31, flags: DIFlagPrototyped, spFlags: 0)
!282 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !283, file: !34, line: 1984)
!283 = !DISubprogram(name: "nearbyintf", scope: !30, file: !30, line: 297, type: !96, flags: DIFlagPrototyped, spFlags: 0)
!284 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !285, file: !34, line: 1985)
!285 = !DISubprogram(name: "nearbyintl", scope: !30, file: !30, line: 297, type: !100, flags: DIFlagPrototyped, spFlags: 0)
!286 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !287, file: !34, line: 1987)
!287 = !DISubprogram(name: "nextafter", scope: !30, file: !30, line: 262, type: !41, flags: DIFlagPrototyped, spFlags: 0)
!288 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !289, file: !34, line: 1988)
!289 = !DISubprogram(name: "nextafterf", scope: !30, file: !30, line: 262, type: !125, flags: DIFlagPrototyped, spFlags: 0)
!290 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !291, file: !34, line: 1989)
!291 = !DISubprogram(name: "nextafterl", scope: !30, file: !30, line: 262, type: !129, flags: DIFlagPrototyped, spFlags: 0)
!292 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !293, file: !34, line: 1991)
!293 = !DISubprogram(name: "nexttoward", scope: !30, file: !30, line: 264, type: !294, flags: DIFlagPrototyped, spFlags: 0)
!294 = !DISubroutineType(types: !295)
!295 = !{!33, !33, !102}
!296 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !297, file: !34, line: 1992)
!297 = !DISubprogram(name: "nexttowardf", scope: !30, file: !30, line: 264, type: !298, flags: DIFlagPrototyped, spFlags: 0)
!298 = !DISubroutineType(types: !299)
!299 = !{!3, !3, !102}
!300 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !301, file: !34, line: 1993)
!301 = !DISubprogram(name: "nexttowardl", scope: !30, file: !30, line: 264, type: !129, flags: DIFlagPrototyped, spFlags: 0)
!302 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !303, file: !34, line: 1995)
!303 = !DISubprogram(name: "remainder", scope: !30, file: !30, line: 275, type: !41, flags: DIFlagPrototyped, spFlags: 0)
!304 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !305, file: !34, line: 1996)
!305 = !DISubprogram(name: "remainderf", scope: !30, file: !30, line: 275, type: !125, flags: DIFlagPrototyped, spFlags: 0)
!306 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !307, file: !34, line: 1997)
!307 = !DISubprogram(name: "remainderl", scope: !30, file: !30, line: 275, type: !129, flags: DIFlagPrototyped, spFlags: 0)
!308 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !309, file: !34, line: 1999)
!309 = !DISubprogram(name: "remquo", scope: !30, file: !30, line: 310, type: !310, flags: DIFlagPrototyped, spFlags: 0)
!310 = !DISubroutineType(types: !311)
!311 = !{!33, !33, !33, !61}
!312 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !313, file: !34, line: 2000)
!313 = !DISubprogram(name: "remquof", scope: !30, file: !30, line: 310, type: !314, flags: DIFlagPrototyped, spFlags: 0)
!314 = !DISubroutineType(types: !315)
!315 = !{!3, !3, !3, !61}
!316 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !317, file: !34, line: 2001)
!317 = !DISubprogram(name: "remquol", scope: !30, file: !30, line: 310, type: !318, flags: DIFlagPrototyped, spFlags: 0)
!318 = !DISubroutineType(types: !319)
!319 = !{!102, !102, !102, !61}
!320 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !321, file: !34, line: 2003)
!321 = !DISubprogram(name: "rint", scope: !30, file: !30, line: 259, type: !31, flags: DIFlagPrototyped, spFlags: 0)
!322 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !323, file: !34, line: 2004)
!323 = !DISubprogram(name: "rintf", scope: !30, file: !30, line: 259, type: !96, flags: DIFlagPrototyped, spFlags: 0)
!324 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !325, file: !34, line: 2005)
!325 = !DISubprogram(name: "rintl", scope: !30, file: !30, line: 259, type: !100, flags: DIFlagPrototyped, spFlags: 0)
!326 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !327, file: !34, line: 2007)
!327 = !DISubprogram(name: "round", scope: !30, file: !30, line: 301, type: !31, flags: DIFlagPrototyped, spFlags: 0)
!328 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !329, file: !34, line: 2008)
!329 = !DISubprogram(name: "roundf", scope: !30, file: !30, line: 301, type: !96, flags: DIFlagPrototyped, spFlags: 0)
!330 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !331, file: !34, line: 2009)
!331 = !DISubprogram(name: "roundl", scope: !30, file: !30, line: 301, type: !100, flags: DIFlagPrototyped, spFlags: 0)
!332 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !333, file: !34, line: 2011)
!333 = !DISubprogram(name: "scalbln", scope: !30, file: !30, line: 293, type: !334, flags: DIFlagPrototyped, spFlags: 0)
!334 = !DISubroutineType(types: !335)
!335 = !{!33, !33, !250}
!336 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !337, file: !34, line: 2012)
!337 = !DISubprogram(name: "scalblnf", scope: !30, file: !30, line: 293, type: !338, flags: DIFlagPrototyped, spFlags: 0)
!338 = !DISubroutineType(types: !339)
!339 = !{!3, !3, !250}
!340 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !341, file: !34, line: 2013)
!341 = !DISubprogram(name: "scalblnl", scope: !30, file: !30, line: 293, type: !342, flags: DIFlagPrototyped, spFlags: 0)
!342 = !DISubroutineType(types: !343)
!343 = !{!102, !102, !250}
!344 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !345, file: !34, line: 2015)
!345 = !DISubprogram(name: "scalbn", scope: !30, file: !30, line: 279, type: !64, flags: DIFlagPrototyped, spFlags: 0)
!346 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !347, file: !34, line: 2016)
!347 = !DISubprogram(name: "scalbnf", scope: !30, file: !30, line: 279, type: !348, flags: DIFlagPrototyped, spFlags: 0)
!348 = !DISubroutineType(types: !349)
!349 = !{!3, !3, !4}
!350 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !351, file: !34, line: 2017)
!351 = !DISubprogram(name: "scalbnl", scope: !30, file: !30, line: 279, type: !352, flags: DIFlagPrototyped, spFlags: 0)
!352 = !DISubroutineType(types: !353)
!353 = !{!102, !102, !4}
!354 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !355, file: !34, line: 2019)
!355 = !DISubprogram(name: "tgamma", scope: !30, file: !30, line: 238, type: !31, flags: DIFlagPrototyped, spFlags: 0)
!356 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !357, file: !34, line: 2020)
!357 = !DISubprogram(name: "tgammaf", scope: !30, file: !30, line: 238, type: !96, flags: DIFlagPrototyped, spFlags: 0)
!358 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !359, file: !34, line: 2021)
!359 = !DISubprogram(name: "tgammal", scope: !30, file: !30, line: 238, type: !100, flags: DIFlagPrototyped, spFlags: 0)
!360 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !361, file: !34, line: 2023)
!361 = !DISubprogram(name: "trunc", scope: !30, file: !30, line: 305, type: !31, flags: DIFlagPrototyped, spFlags: 0)
!362 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !363, file: !34, line: 2024)
!363 = !DISubprogram(name: "truncf", scope: !30, file: !30, line: 305, type: !96, flags: DIFlagPrototyped, spFlags: 0)
!364 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !365, file: !34, line: 2025)
!365 = !DISubprogram(name: "truncl", scope: !30, file: !30, line: 305, type: !100, flags: DIFlagPrototyped, spFlags: 0)
!366 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !367, entity: !368, file: !369, line: 58)
!367 = !DINamespace(name: "__gnu_debug", scope: null)
!368 = !DINamespace(name: "__debug", scope: !22)
!369 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/debug/debug.h", directory: "", checksumkind: CSK_MD5, checksum: "752210a319f5f5d356cc29cd1ce3cdc7")
!370 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !371, file: !373, line: 131)
!371 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !24, line: 63, baseType: !372)
!372 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !24, line: 59, size: 64, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!373 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/cstdlib", directory: "")
!374 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !375, file: !373, line: 132)
!375 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !24, line: 71, baseType: !376)
!376 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !24, line: 67, size: 128, flags: DIFlagTypePassByValue, elements: !377, identifier: "_ZTS6ldiv_t")
!377 = !{!378, !379}
!378 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !376, file: !24, line: 69, baseType: !250, size: 64)
!379 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !376, file: !24, line: 70, baseType: !250, size: 64, offset: 64)
!380 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !381, file: !373, line: 134)
!381 = !DISubprogram(name: "abort", scope: !24, file: !24, line: 730, type: !382, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!382 = !DISubroutineType(types: !383)
!383 = !{null}
!384 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !385, file: !373, line: 136)
!385 = !DISubprogram(name: "aligned_alloc", scope: !24, file: !24, line: 724, type: !386, flags: DIFlagPrototyped, spFlags: 0)
!386 = !DISubroutineType(types: !387)
!387 = !{!388, !389, !389}
!388 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!389 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !390, line: 18, baseType: !391)
!390 = !DIFile(filename: "/opt/rocm-6.4.2/lib/llvm/lib/clang/19/include/__stddef_size_t.h", directory: "", checksumkind: CSK_MD5, checksum: "2c44e821a2b1951cde2eb0fb2e656867")
!391 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!392 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !393, file: !373, line: 138)
!393 = !DISubprogram(name: "atexit", scope: !24, file: !24, line: 734, type: !394, flags: DIFlagPrototyped, spFlags: 0)
!394 = !DISubroutineType(types: !395)
!395 = !{!4, !396}
!396 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !382, size: 64)
!397 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !398, file: !373, line: 141)
!398 = !DISubprogram(name: "at_quick_exit", scope: !24, file: !24, line: 739, type: !394, flags: DIFlagPrototyped, spFlags: 0)
!399 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !400, file: !373, line: 144)
!400 = !DISubprogram(name: "atof", scope: !24, file: !24, line: 102, type: !267, flags: DIFlagPrototyped, spFlags: 0)
!401 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !402, file: !373, line: 145)
!402 = !DISubprogram(name: "atoi", scope: !24, file: !24, line: 105, type: !403, flags: DIFlagPrototyped, spFlags: 0)
!403 = !DISubroutineType(types: !404)
!404 = !{!4, !269}
!405 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !406, file: !373, line: 146)
!406 = !DISubprogram(name: "atol", scope: !24, file: !24, line: 108, type: !407, flags: DIFlagPrototyped, spFlags: 0)
!407 = !DISubroutineType(types: !408)
!408 = !{!250, !269}
!409 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !410, file: !373, line: 147)
!410 = !DISubprogram(name: "bsearch", scope: !24, file: !24, line: 960, type: !411, flags: DIFlagPrototyped, spFlags: 0)
!411 = !DISubroutineType(types: !412)
!412 = !{!388, !413, !413, !389, !389, !415}
!413 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !414, size: 64)
!414 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!415 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !24, line: 948, baseType: !416)
!416 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !417, size: 64)
!417 = !DISubroutineType(types: !418)
!418 = !{!4, !413, !413}
!419 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !420, file: !373, line: 148)
!420 = !DISubprogram(name: "calloc", scope: !24, file: !24, line: 675, type: !386, flags: DIFlagPrototyped, spFlags: 0)
!421 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !422, file: !373, line: 149)
!422 = !DISubprogram(name: "div", scope: !24, file: !24, line: 992, type: !423, flags: DIFlagPrototyped, spFlags: 0)
!423 = !DISubroutineType(types: !424)
!424 = !{!371, !4, !4}
!425 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !426, file: !373, line: 150)
!426 = !DISubprogram(name: "exit", scope: !24, file: !24, line: 756, type: !427, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!427 = !DISubroutineType(types: !428)
!428 = !{null, !4}
!429 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !430, file: !373, line: 151)
!430 = !DISubprogram(name: "free", scope: !24, file: !24, line: 687, type: !431, flags: DIFlagPrototyped, spFlags: 0)
!431 = !DISubroutineType(types: !432)
!432 = !{null, !388}
!433 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !434, file: !373, line: 152)
!434 = !DISubprogram(name: "getenv", scope: !24, file: !24, line: 773, type: !435, flags: DIFlagPrototyped, spFlags: 0)
!435 = !DISubroutineType(types: !436)
!436 = !{!437, !269}
!437 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !271, size: 64)
!438 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !439, file: !373, line: 153)
!439 = !DISubprogram(name: "labs", scope: !24, file: !24, line: 981, type: !440, flags: DIFlagPrototyped, spFlags: 0)
!440 = !DISubroutineType(types: !441)
!441 = !{!250, !250}
!442 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !443, file: !373, line: 154)
!443 = !DISubprogram(name: "ldiv", scope: !24, file: !24, line: 994, type: !444, flags: DIFlagPrototyped, spFlags: 0)
!444 = !DISubroutineType(types: !445)
!445 = !{!375, !250, !250}
!446 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !447, file: !373, line: 155)
!447 = !DISubprogram(name: "malloc", scope: !24, file: !24, line: 672, type: !448, flags: DIFlagPrototyped, spFlags: 0)
!448 = !DISubroutineType(types: !449)
!449 = !{!388, !389}
!450 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !451, file: !373, line: 157)
!451 = !DISubprogram(name: "mblen", scope: !24, file: !24, line: 1062, type: !452, flags: DIFlagPrototyped, spFlags: 0)
!452 = !DISubroutineType(types: !453)
!453 = !{!4, !269, !389}
!454 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !455, file: !373, line: 158)
!455 = !DISubprogram(name: "mbstowcs", scope: !24, file: !24, line: 1073, type: !456, flags: DIFlagPrototyped, spFlags: 0)
!456 = !DISubroutineType(types: !457)
!457 = !{!389, !458, !461, !389}
!458 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !459)
!459 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !460, size: 64)
!460 = !DIBasicType(name: "wchar_t", size: 32, encoding: DW_ATE_signed)
!461 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !269)
!462 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !463, file: !373, line: 159)
!463 = !DISubprogram(name: "mbtowc", scope: !24, file: !24, line: 1065, type: !464, flags: DIFlagPrototyped, spFlags: 0)
!464 = !DISubroutineType(types: !465)
!465 = !{!4, !458, !461, !389}
!466 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !467, file: !373, line: 161)
!467 = !DISubprogram(name: "qsort", scope: !24, file: !24, line: 970, type: !468, flags: DIFlagPrototyped, spFlags: 0)
!468 = !DISubroutineType(types: !469)
!469 = !{null, !388, !389, !389, !415}
!470 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !471, file: !373, line: 164)
!471 = !DISubprogram(name: "quick_exit", scope: !24, file: !24, line: 762, type: !427, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!472 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !473, file: !373, line: 167)
!473 = !DISubprogram(name: "rand", scope: !24, file: !24, line: 573, type: !474, flags: DIFlagPrototyped, spFlags: 0)
!474 = !DISubroutineType(types: !475)
!475 = !{!4}
!476 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !477, file: !373, line: 168)
!477 = !DISubprogram(name: "realloc", scope: !24, file: !24, line: 683, type: !478, flags: DIFlagPrototyped, spFlags: 0)
!478 = !DISubroutineType(types: !479)
!479 = !{!388, !388, !389}
!480 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !481, file: !373, line: 169)
!481 = !DISubprogram(name: "srand", scope: !24, file: !24, line: 575, type: !482, flags: DIFlagPrototyped, spFlags: 0)
!482 = !DISubroutineType(types: !483)
!483 = !{null, !13}
!484 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !485, file: !373, line: 170)
!485 = !DISubprogram(name: "strtod", scope: !24, file: !24, line: 118, type: !486, flags: DIFlagPrototyped, spFlags: 0)
!486 = !DISubroutineType(types: !487)
!487 = !{!33, !461, !488}
!488 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !489)
!489 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !437, size: 64)
!490 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !491, file: !373, line: 171)
!491 = !DISubprogram(name: "strtol", linkageName: "__isoc23_strtol", scope: !24, file: !24, line: 215, type: !492, flags: DIFlagPrototyped, spFlags: 0)
!492 = !DISubroutineType(types: !493)
!493 = !{!250, !461, !488, !4}
!494 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !495, file: !373, line: 172)
!495 = !DISubprogram(name: "strtoul", linkageName: "__isoc23_strtoul", scope: !24, file: !24, line: 219, type: !496, flags: DIFlagPrototyped, spFlags: 0)
!496 = !DISubroutineType(types: !497)
!497 = !{!391, !461, !488, !4}
!498 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !499, file: !373, line: 173)
!499 = !DISubprogram(name: "system", scope: !24, file: !24, line: 923, type: !403, flags: DIFlagPrototyped, spFlags: 0)
!500 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !501, file: !373, line: 175)
!501 = !DISubprogram(name: "wcstombs", scope: !24, file: !24, line: 1077, type: !502, flags: DIFlagPrototyped, spFlags: 0)
!502 = !DISubroutineType(types: !503)
!503 = !{!389, !504, !505, !389}
!504 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !437)
!505 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !506)
!506 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !507, size: 64)
!507 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !460)
!508 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !509, file: !373, line: 176)
!509 = !DISubprogram(name: "wctomb", scope: !24, file: !24, line: 1069, type: !510, flags: DIFlagPrototyped, spFlags: 0)
!510 = !DISubroutineType(types: !511)
!511 = !{!4, !437, !460}
!512 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !513, entity: !514, file: !373, line: 204)
!513 = !DINamespace(name: "__gnu_cxx", scope: null)
!514 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !24, line: 81, baseType: !515)
!515 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !24, line: 77, size: 128, flags: DIFlagTypePassByValue, elements: !516, identifier: "_ZTS7lldiv_t")
!516 = !{!517, !518}
!517 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !515, file: !24, line: 79, baseType: !213, size: 64)
!518 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !515, file: !24, line: 80, baseType: !213, size: 64, offset: 64)
!519 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !513, entity: !520, file: !373, line: 210)
!520 = !DISubprogram(name: "_Exit", scope: !24, file: !24, line: 768, type: !427, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!521 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !513, entity: !522, file: !373, line: 214)
!522 = !DISubprogram(name: "llabs", scope: !24, file: !24, line: 984, type: !523, flags: DIFlagPrototyped, spFlags: 0)
!523 = !DISubroutineType(types: !524)
!524 = !{!213, !213}
!525 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !513, entity: !526, file: !373, line: 220)
!526 = !DISubprogram(name: "lldiv", scope: !24, file: !24, line: 998, type: !527, flags: DIFlagPrototyped, spFlags: 0)
!527 = !DISubroutineType(types: !528)
!528 = !{!514, !213, !213}
!529 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !513, entity: !530, file: !373, line: 231)
!530 = !DISubprogram(name: "atoll", scope: !24, file: !24, line: 113, type: !531, flags: DIFlagPrototyped, spFlags: 0)
!531 = !DISubroutineType(types: !532)
!532 = !{!213, !269}
!533 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !513, entity: !534, file: !373, line: 232)
!534 = !DISubprogram(name: "strtoll", linkageName: "__isoc23_strtoll", scope: !24, file: !24, line: 238, type: !535, flags: DIFlagPrototyped, spFlags: 0)
!535 = !DISubroutineType(types: !536)
!536 = !{!213, !461, !488, !4}
!537 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !513, entity: !538, file: !373, line: 233)
!538 = !DISubprogram(name: "strtoull", linkageName: "__isoc23_strtoull", scope: !24, file: !24, line: 243, type: !539, flags: DIFlagPrototyped, spFlags: 0)
!539 = !DISubroutineType(types: !540)
!540 = !{!541, !461, !488, !4}
!541 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!542 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !513, entity: !543, file: !373, line: 235)
!543 = !DISubprogram(name: "strtof", scope: !24, file: !24, line: 124, type: !544, flags: DIFlagPrototyped, spFlags: 0)
!544 = !DISubroutineType(types: !545)
!545 = !{!3, !461, !488}
!546 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !513, entity: !547, file: !373, line: 236)
!547 = !DISubprogram(name: "strtold", scope: !24, file: !24, line: 127, type: !548, flags: DIFlagPrototyped, spFlags: 0)
!548 = !DISubroutineType(types: !549)
!549 = !{!102, !461, !488}
!550 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !514, file: !373, line: 244)
!551 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !520, file: !373, line: 246)
!552 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !522, file: !373, line: 248)
!553 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !554, file: !373, line: 249)
!554 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !513, file: !373, line: 217, type: !527, flags: DIFlagPrototyped, spFlags: 0)
!555 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !526, file: !373, line: 250)
!556 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !530, file: !373, line: 252)
!557 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !543, file: !373, line: 253)
!558 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !534, file: !373, line: 254)
!559 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !538, file: !373, line: 255)
!560 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !547, file: !373, line: 256)
!561 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !381, file: !562, line: 38)
!562 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/stdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "3f24ff2a8eef595875da96e5466bd4aa")
!563 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !393, file: !562, line: 39)
!564 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !426, file: !562, line: 40)
!565 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !398, file: !562, line: 43)
!566 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !471, file: !562, line: 46)
!567 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !520, file: !562, line: 49)
!568 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !371, file: !562, line: 54)
!569 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !375, file: !562, line: 55)
!570 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !571, file: !562, line: 57)
!571 = !DISubprogram(name: "abs", linkageName: "_ZSt3absn", scope: !22, file: !27, line: 85, type: !572, flags: DIFlagPrototyped, spFlags: 0)
!572 = !DISubroutineType(types: !573)
!573 = !{!574, !574}
!574 = !DIBasicType(name: "__int128", size: 128, encoding: DW_ATE_signed)
!575 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !400, file: !562, line: 58)
!576 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !402, file: !562, line: 59)
!577 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !406, file: !562, line: 60)
!578 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !410, file: !562, line: 61)
!579 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !420, file: !562, line: 62)
!580 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !554, file: !562, line: 63)
!581 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !430, file: !562, line: 64)
!582 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !434, file: !562, line: 65)
!583 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !439, file: !562, line: 66)
!584 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !443, file: !562, line: 67)
!585 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !447, file: !562, line: 68)
!586 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !451, file: !562, line: 70)
!587 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !455, file: !562, line: 71)
!588 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !463, file: !562, line: 72)
!589 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !467, file: !562, line: 74)
!590 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !473, file: !562, line: 75)
!591 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !477, file: !562, line: 76)
!592 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !481, file: !562, line: 77)
!593 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !485, file: !562, line: 78)
!594 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !491, file: !562, line: 79)
!595 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !495, file: !562, line: 80)
!596 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !499, file: !562, line: 81)
!597 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !501, file: !562, line: 83)
!598 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !509, file: !562, line: 84)
!599 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !600, file: !601, line: 200)
!600 = !DISubprogram(name: "abs", linkageName: "_ZL3absd", scope: !601, file: !601, line: 28, type: !31, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!601 = !DIFile(filename: "/opt/rocm-6.4.2/lib/llvm/lib/clang/19/include/__clang_cuda_math_forward_declares.h", directory: "", checksumkind: CSK_MD5, checksum: "7fcaa66c0bf1529fc7d2359f3dc2dd30")
!602 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !603, file: !601, line: 201)
!603 = !DISubprogram(name: "acos", linkageName: "_ZL4acosf", scope: !601, file: !601, line: 32, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!604 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !605, file: !601, line: 202)
!605 = !DISubprogram(name: "acosh", linkageName: "_ZL5acoshf", scope: !601, file: !601, line: 34, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!606 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !607, file: !601, line: 203)
!607 = !DISubprogram(name: "asin", linkageName: "_ZL4asinf", scope: !601, file: !601, line: 36, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!608 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !609, file: !601, line: 204)
!609 = !DISubprogram(name: "asinh", linkageName: "_ZL5asinhf", scope: !601, file: !601, line: 38, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!610 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !611, file: !601, line: 205)
!611 = !DISubprogram(name: "atan", linkageName: "_ZL4atanf", scope: !601, file: !601, line: 42, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!612 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !613, file: !601, line: 206)
!613 = !DISubprogram(name: "atan2", linkageName: "_ZL5atan2ff", scope: !601, file: !601, line: 40, type: !125, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!614 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !615, file: !601, line: 207)
!615 = !DISubprogram(name: "atanh", linkageName: "_ZL5atanhf", scope: !601, file: !601, line: 44, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!616 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !617, file: !601, line: 208)
!617 = !DISubprogram(name: "cbrt", linkageName: "_ZL4cbrtf", scope: !601, file: !601, line: 46, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!618 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !619, file: !601, line: 209)
!619 = !DISubprogram(name: "ceil", linkageName: "_ZL4ceilf", scope: !601, file: !601, line: 48, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!620 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !621, file: !601, line: 210)
!621 = !DISubprogram(name: "copysign", linkageName: "_ZL8copysignff", scope: !601, file: !601, line: 50, type: !125, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!622 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !623, file: !601, line: 211)
!623 = !DISubprogram(name: "cos", linkageName: "_ZL3cosf", scope: !601, file: !601, line: 52, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!624 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !625, file: !601, line: 212)
!625 = !DISubprogram(name: "cosh", linkageName: "_ZL4coshf", scope: !601, file: !601, line: 54, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!626 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !627, file: !601, line: 213)
!627 = !DISubprogram(name: "erf", linkageName: "_ZL3erff", scope: !601, file: !601, line: 58, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!628 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !629, file: !601, line: 214)
!629 = !DISubprogram(name: "erfc", linkageName: "_ZL4erfcf", scope: !601, file: !601, line: 56, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!630 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !631, file: !601, line: 215)
!631 = !DISubprogram(name: "exp", linkageName: "_ZL3expf", scope: !601, file: !601, line: 62, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!632 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !633, file: !601, line: 216)
!633 = !DISubprogram(name: "exp2", linkageName: "_ZL4exp2f", scope: !601, file: !601, line: 60, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!634 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !635, file: !601, line: 217)
!635 = !DISubprogram(name: "expm1", linkageName: "_ZL5expm1f", scope: !601, file: !601, line: 64, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!636 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !637, file: !601, line: 218)
!637 = !DISubprogram(name: "fabs", linkageName: "_ZL4fabsf", scope: !601, file: !601, line: 66, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!638 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !639, file: !601, line: 219)
!639 = !DISubprogram(name: "fdim", linkageName: "_ZL4fdimff", scope: !601, file: !601, line: 68, type: !125, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!640 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !641, file: !601, line: 220)
!641 = !DISubprogram(name: "floor", linkageName: "_ZL5floorf", scope: !601, file: !601, line: 70, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!642 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !643, file: !601, line: 221)
!643 = !DISubprogram(name: "fma", linkageName: "_ZL3fmafff", scope: !601, file: !601, line: 72, type: !167, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!644 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !645, file: !601, line: 222)
!645 = !DISubprogram(name: "fmax", linkageName: "_ZL4fmaxff", scope: !601, file: !601, line: 74, type: !125, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!646 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !647, file: !601, line: 223)
!647 = !DISubprogram(name: "fmin", linkageName: "_ZL4fminff", scope: !601, file: !601, line: 76, type: !125, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!648 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !649, file: !601, line: 224)
!649 = !DISubprogram(name: "fmod", linkageName: "_ZL4fmodff", scope: !601, file: !601, line: 78, type: !125, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!650 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !651, file: !601, line: 225)
!651 = !DISubprogram(name: "fpclassify", linkageName: "_ZL10fpclassifyf", scope: !601, file: !601, line: 80, type: !197, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!652 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !653, file: !601, line: 226)
!653 = !DISubprogram(name: "frexp", linkageName: "_ZL5frexpfPi", scope: !601, file: !601, line: 82, type: !654, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!654 = !DISubroutineType(types: !655)
!655 = !{!3, !3, !61}
!656 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !657, file: !601, line: 227)
!657 = !DISubprogram(name: "hypot", linkageName: "_ZL5hypotff", scope: !601, file: !601, line: 84, type: !125, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!658 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !659, file: !601, line: 228)
!659 = !DISubprogram(name: "ilogb", linkageName: "_ZL5ilogbf", scope: !601, file: !601, line: 86, type: !197, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!660 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !661, file: !601, line: 229)
!661 = !DISubprogram(name: "isfinite", linkageName: "_ZL8isfinitef", scope: !601, file: !601, line: 91, type: !662, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!662 = !DISubroutineType(types: !663)
!663 = !{!664, !3}
!664 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!665 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !666, file: !601, line: 230)
!666 = !DISubprogram(name: "isgreater", linkageName: "_ZL9isgreaterff", scope: !601, file: !601, line: 95, type: !667, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!667 = !DISubroutineType(types: !668)
!668 = !{!664, !3, !3}
!669 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !670, file: !601, line: 231)
!670 = !DISubprogram(name: "isgreaterequal", linkageName: "_ZL14isgreaterequalff", scope: !601, file: !601, line: 94, type: !667, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!671 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !672, file: !601, line: 232)
!672 = !DISubprogram(name: "isinf", linkageName: "_ZL5isinff", scope: !601, file: !601, line: 100, type: !662, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!673 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !674, file: !601, line: 233)
!674 = !DISubprogram(name: "isless", linkageName: "_ZL6islessff", scope: !601, file: !601, line: 104, type: !667, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!675 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !676, file: !601, line: 234)
!676 = !DISubprogram(name: "islessequal", linkageName: "_ZL11islessequalff", scope: !601, file: !601, line: 103, type: !667, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!677 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !678, file: !601, line: 235)
!678 = !DISubprogram(name: "islessgreater", linkageName: "_ZL13islessgreaterff", scope: !601, file: !601, line: 106, type: !667, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!679 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !680, file: !601, line: 236)
!680 = !DISubprogram(name: "isnan", linkageName: "_ZL5isnanf", scope: !601, file: !601, line: 111, type: !662, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!681 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !682, file: !601, line: 237)
!682 = !DISubprogram(name: "isnormal", linkageName: "_ZL8isnormalf", scope: !601, file: !601, line: 113, type: !662, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!683 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !684, file: !601, line: 238)
!684 = !DISubprogram(name: "isunordered", linkageName: "_ZL11isunorderedff", scope: !601, file: !601, line: 115, type: !667, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!685 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !686, file: !601, line: 239)
!686 = !DISubprogram(name: "labs", linkageName: "_ZL4labsl", scope: !601, file: !601, line: 116, type: !440, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!687 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !688, file: !601, line: 240)
!688 = !DISubprogram(name: "ldexp", linkageName: "_ZL5ldexpfi", scope: !601, file: !601, line: 118, type: !348, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!689 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !690, file: !601, line: 241)
!690 = !DISubprogram(name: "lgamma", linkageName: "_ZL6lgammaf", scope: !601, file: !601, line: 120, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!691 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !692, file: !601, line: 242)
!692 = !DISubprogram(name: "llabs", linkageName: "_ZL5llabsx", scope: !601, file: !601, line: 121, type: !523, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!693 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !694, file: !601, line: 243)
!694 = !DISubprogram(name: "llrint", linkageName: "_ZL6llrintf", scope: !601, file: !601, line: 123, type: !216, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!695 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !696, file: !601, line: 244)
!696 = !DISubprogram(name: "log", linkageName: "_ZL3logf", scope: !601, file: !601, line: 133, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!697 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !698, file: !601, line: 245)
!698 = !DISubprogram(name: "log10", linkageName: "_ZL5log10f", scope: !601, file: !601, line: 125, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!699 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !700, file: !601, line: 246)
!700 = !DISubprogram(name: "log1p", linkageName: "_ZL5log1pf", scope: !601, file: !601, line: 127, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!701 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !702, file: !601, line: 247)
!702 = !DISubprogram(name: "log2", linkageName: "_ZL4log2f", scope: !601, file: !601, line: 129, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!703 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !704, file: !601, line: 248)
!704 = !DISubprogram(name: "logb", linkageName: "_ZL4logbf", scope: !601, file: !601, line: 131, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!705 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !706, file: !601, line: 249)
!706 = !DISubprogram(name: "lrint", linkageName: "_ZL5lrintf", scope: !601, file: !601, line: 135, type: !253, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!707 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !708, file: !601, line: 250)
!708 = !DISubprogram(name: "lround", linkageName: "_ZL6lroundf", scope: !601, file: !601, line: 137, type: !253, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!709 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !710, file: !601, line: 251)
!710 = !DISubprogram(name: "llround", linkageName: "_ZL7llroundf", scope: !601, file: !601, line: 138, type: !216, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!711 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !712, file: !601, line: 252)
!712 = !DISubprogram(name: "modf", linkageName: "_ZL4modffPf", scope: !601, file: !601, line: 140, type: !713, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!713 = !DISubroutineType(types: !714)
!714 = !{!3, !3, !715}
!715 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!716 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !717, file: !601, line: 253)
!717 = !DISubprogram(name: "nan", linkageName: "_ZL3nanPKc", scope: !601, file: !601, line: 141, type: !267, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!718 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !719, file: !601, line: 254)
!719 = !DISubprogram(name: "nanf", linkageName: "_ZL4nanfPKc", scope: !601, file: !601, line: 142, type: !274, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!720 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !721, file: !601, line: 255)
!721 = !DISubprogram(name: "nearbyint", linkageName: "_ZL9nearbyintf", scope: !601, file: !601, line: 144, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!722 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !723, file: !601, line: 256)
!723 = !DISubprogram(name: "nextafter", linkageName: "_ZL9nextafterff", scope: !601, file: !601, line: 146, type: !125, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!724 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !725, file: !601, line: 257)
!725 = !DISubprogram(name: "pow", linkageName: "_ZL3powfi", scope: !601, file: !601, line: 150, type: !348, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!726 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !727, file: !601, line: 258)
!727 = !DISubprogram(name: "remainder", linkageName: "_ZL9remainderff", scope: !601, file: !601, line: 152, type: !125, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!728 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !729, file: !601, line: 259)
!729 = !DISubprogram(name: "remquo", linkageName: "_ZL6remquoffPi", scope: !601, file: !601, line: 154, type: !314, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!730 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !731, file: !601, line: 260)
!731 = !DISubprogram(name: "rint", linkageName: "_ZL4rintf", scope: !601, file: !601, line: 156, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!732 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !733, file: !601, line: 261)
!733 = !DISubprogram(name: "round", linkageName: "_ZL5roundf", scope: !601, file: !601, line: 158, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!734 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !735, file: !601, line: 262)
!735 = !DISubprogram(name: "scalbln", linkageName: "_ZL7scalblnfl", scope: !601, file: !601, line: 160, type: !338, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!736 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !737, file: !601, line: 263)
!737 = !DISubprogram(name: "scalbn", linkageName: "_ZL6scalbnfi", scope: !601, file: !601, line: 162, type: !348, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!738 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !739, file: !601, line: 264)
!739 = !DISubprogram(name: "signbit", linkageName: "_ZL7signbitf", scope: !601, file: !601, line: 167, type: !662, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!740 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !741, file: !601, line: 265)
!741 = !DISubprogram(name: "sin", linkageName: "_ZL3sinf", scope: !601, file: !601, line: 169, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!742 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !743, file: !601, line: 266)
!743 = !DISubprogram(name: "sinh", linkageName: "_ZL4sinhf", scope: !601, file: !601, line: 171, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!744 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !745, file: !601, line: 267)
!745 = !DISubprogram(name: "sqrt", linkageName: "_ZL4sqrtf", scope: !601, file: !601, line: 173, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!746 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !747, file: !601, line: 268)
!747 = !DISubprogram(name: "tan", linkageName: "_ZL3tanf", scope: !601, file: !601, line: 175, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!748 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !749, file: !601, line: 269)
!749 = !DISubprogram(name: "tanh", linkageName: "_ZL4tanhf", scope: !601, file: !601, line: 177, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!750 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !751, file: !601, line: 270)
!751 = !DISubprogram(name: "tgamma", linkageName: "_ZL6tgammaf", scope: !601, file: !601, line: 179, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!752 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !753, file: !601, line: 271)
!753 = !DISubprogram(name: "trunc", linkageName: "_ZL5truncf", scope: !601, file: !601, line: 181, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!754 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !755, file: !757, line: 737)
!755 = !DISubprogram(name: "acosf", linkageName: "_ZL5acosff", scope: !756, file: !756, line: 358, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!756 = !DIFile(filename: "/opt/rocm-6.4.2/lib/llvm/lib/clang/19/include/__clang_hip_math.h", directory: "", checksumkind: CSK_MD5, checksum: "1ddc6320be20cc493976d99e6b1c9853")
!757 = !DIFile(filename: "/opt/rocm-6.4.2/lib/llvm/lib/clang/19/include/__clang_hip_cmath.h", directory: "", checksumkind: CSK_MD5, checksum: "dc1ab1a8805dcbc75cbf36b8a1f9305a")
!758 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !759, file: !757, line: 738)
!759 = !DISubprogram(name: "acoshf", linkageName: "_ZL6acoshff", scope: !756, file: !756, line: 361, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!760 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !761, file: !757, line: 739)
!761 = !DISubprogram(name: "asinf", linkageName: "_ZL5asinff", scope: !756, file: !756, line: 364, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!762 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !763, file: !757, line: 740)
!763 = !DISubprogram(name: "asinhf", linkageName: "_ZL6asinhff", scope: !756, file: !756, line: 367, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!764 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !765, file: !757, line: 741)
!765 = distinct !DISubprogram(name: "atan2f", linkageName: "_ZL6atan2fff", scope: !756, file: !756, line: 370, type: !125, scopeLine: 370, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !766)
!766 = !{!767, !768}
!767 = !DILocalVariable(name: "__x", arg: 1, scope: !765, file: !756, line: 370, type: !3)
!768 = !DILocalVariable(name: "__y", arg: 2, scope: !765, file: !756, line: 370, type: !3)
!769 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !770, file: !757, line: 742)
!770 = !DISubprogram(name: "atanf", linkageName: "_ZL5atanff", scope: !756, file: !756, line: 373, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!771 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !772, file: !757, line: 743)
!772 = !DISubprogram(name: "atanhf", linkageName: "_ZL6atanhff", scope: !756, file: !756, line: 376, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!773 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !774, file: !757, line: 744)
!774 = !DISubprogram(name: "cbrtf", linkageName: "_ZL5cbrtff", scope: !756, file: !756, line: 379, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!775 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !776, file: !757, line: 745)
!776 = !DISubprogram(name: "ceilf", linkageName: "_ZL5ceilff", scope: !756, file: !756, line: 382, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!777 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !778, file: !757, line: 746)
!778 = !DISubprogram(name: "copysignf", linkageName: "_ZL9copysignfff", scope: !756, file: !756, line: 385, type: !125, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!779 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !780, file: !757, line: 747)
!780 = !DISubprogram(name: "cosf", linkageName: "_ZL4cosff", scope: !756, file: !756, line: 388, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!781 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !782, file: !757, line: 748)
!782 = !DISubprogram(name: "coshf", linkageName: "_ZL5coshff", scope: !756, file: !756, line: 391, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!783 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !784, file: !757, line: 749)
!784 = !DISubprogram(name: "erfcf", linkageName: "_ZL5erfcff", scope: !756, file: !756, line: 403, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!785 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !786, file: !757, line: 750)
!786 = !DISubprogram(name: "erff", linkageName: "_ZL4erfff", scope: !756, file: !756, line: 412, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!787 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !788, file: !757, line: 751)
!788 = !DISubprogram(name: "exp2f", linkageName: "_ZL5exp2ff", scope: !756, file: !756, line: 421, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!789 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !790, file: !757, line: 752)
!790 = !DISubprogram(name: "expf", linkageName: "_ZL4expff", scope: !756, file: !756, line: 424, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!791 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !792, file: !757, line: 753)
!792 = !DISubprogram(name: "expm1f", linkageName: "_ZL6expm1ff", scope: !756, file: !756, line: 427, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!793 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !794, file: !757, line: 754)
!794 = !DISubprogram(name: "fabsf", linkageName: "_ZL5fabsff", scope: !756, file: !756, line: 430, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!795 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !796, file: !757, line: 755)
!796 = !DISubprogram(name: "fdimf", linkageName: "_ZL5fdimfff", scope: !756, file: !756, line: 433, type: !125, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!797 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !798, file: !757, line: 756)
!798 = !DISubprogram(name: "floorf", linkageName: "_ZL6floorff", scope: !756, file: !756, line: 439, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!799 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !800, file: !757, line: 757)
!800 = !DISubprogram(name: "fmaf", linkageName: "_ZL4fmaffff", scope: !756, file: !756, line: 442, type: !167, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!801 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !802, file: !757, line: 758)
!802 = !DISubprogram(name: "fmaxf", linkageName: "_ZL5fmaxfff", scope: !756, file: !756, line: 447, type: !125, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!803 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !804, file: !757, line: 759)
!804 = !DISubprogram(name: "fminf", linkageName: "_ZL5fminfff", scope: !756, file: !756, line: 450, type: !125, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!805 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !806, file: !757, line: 760)
!806 = !DISubprogram(name: "fmodf", linkageName: "_ZL5fmodfff", scope: !756, file: !756, line: 453, type: !125, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!807 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !808, file: !757, line: 761)
!808 = !DISubprogram(name: "frexpf", linkageName: "_ZL6frexpffPi", scope: !756, file: !756, line: 456, type: !654, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!809 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !810, file: !757, line: 762)
!810 = !DISubprogram(name: "hypotf", linkageName: "_ZL6hypotfff", scope: !756, file: !756, line: 461, type: !125, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!811 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !812, file: !757, line: 763)
!812 = !DISubprogram(name: "ilogbf", linkageName: "_ZL6ilogbff", scope: !756, file: !756, line: 464, type: !197, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!813 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !814, file: !757, line: 764)
!814 = !DISubprogram(name: "ldexpf", linkageName: "_ZL6ldexpffi", scope: !756, file: !756, line: 503, type: !348, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!815 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !816, file: !757, line: 765)
!816 = !DISubprogram(name: "lgammaf", linkageName: "_ZL7lgammaff", scope: !756, file: !756, line: 506, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!817 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !818, file: !757, line: 766)
!818 = !DISubprogram(name: "llrintf", linkageName: "_ZL7llrintff", scope: !756, file: !756, line: 509, type: !216, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!819 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !820, file: !757, line: 767)
!820 = !DISubprogram(name: "llroundf", linkageName: "_ZL8llroundff", scope: !756, file: !756, line: 512, type: !216, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!821 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !822, file: !757, line: 768)
!822 = !DISubprogram(name: "log10f", linkageName: "_ZL6log10ff", scope: !756, file: !756, line: 515, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!823 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !824, file: !757, line: 769)
!824 = !DISubprogram(name: "log1pf", linkageName: "_ZL6log1pff", scope: !756, file: !756, line: 518, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!825 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !826, file: !757, line: 770)
!826 = !DISubprogram(name: "log2f", linkageName: "_ZL5log2ff", scope: !756, file: !756, line: 521, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!827 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !828, file: !757, line: 771)
!828 = !DISubprogram(name: "logbf", linkageName: "_ZL5logbff", scope: !756, file: !756, line: 524, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!829 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !830, file: !757, line: 772)
!830 = !DISubprogram(name: "logf", linkageName: "_ZL4logff", scope: !756, file: !756, line: 527, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!831 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !832, file: !757, line: 773)
!832 = !DISubprogram(name: "lrintf", linkageName: "_ZL6lrintff", scope: !756, file: !756, line: 530, type: !253, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!833 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !834, file: !757, line: 774)
!834 = !DISubprogram(name: "lroundf", linkageName: "_ZL7lroundff", scope: !756, file: !756, line: 533, type: !253, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!835 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !836, file: !757, line: 775)
!836 = !DISubprogram(name: "modff", linkageName: "_ZL5modfffPf", scope: !756, file: !756, line: 536, type: !713, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!837 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !838, file: !757, line: 776)
!838 = !DISubprogram(name: "nearbyintf", linkageName: "_ZL10nearbyintff", scope: !756, file: !756, line: 571, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!839 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !840, file: !757, line: 777)
!840 = !DISubprogram(name: "nextafterf", linkageName: "_ZL10nextafterfff", scope: !756, file: !756, line: 574, type: !125, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!841 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !842, file: !757, line: 779)
!842 = !DISubprogram(name: "powf", linkageName: "_ZL4powfff", scope: !756, file: !756, line: 607, type: !125, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!843 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !844, file: !757, line: 780)
!844 = !DISubprogram(name: "remainderf", linkageName: "_ZL10remainderfff", scope: !756, file: !756, line: 616, type: !125, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!845 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !846, file: !757, line: 781)
!846 = !DISubprogram(name: "remquof", linkageName: "_ZL7remquofffPi", scope: !756, file: !756, line: 621, type: !314, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!847 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !848, file: !757, line: 782)
!848 = !DISubprogram(name: "rintf", linkageName: "_ZL5rintff", scope: !756, file: !756, line: 636, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!849 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !850, file: !757, line: 783)
!850 = !DISubprogram(name: "roundf", linkageName: "_ZL6roundff", scope: !756, file: !756, line: 661, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!851 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !852, file: !757, line: 784)
!852 = !DISubprogram(name: "scalblnf", linkageName: "_ZL8scalblnffl", scope: !756, file: !756, line: 667, type: !338, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!853 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !854, file: !757, line: 785)
!854 = !DISubprogram(name: "scalbnf", linkageName: "_ZL7scalbnffi", scope: !756, file: !756, line: 673, type: !348, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!855 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !856, file: !757, line: 786)
!856 = !DISubprogram(name: "sinf", linkageName: "_ZL4sinff", scope: !756, file: !756, line: 703, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!857 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !858, file: !757, line: 787)
!858 = !DISubprogram(name: "sinhf", linkageName: "_ZL5sinhff", scope: !756, file: !756, line: 706, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!859 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !860, file: !757, line: 788)
!860 = distinct !DISubprogram(name: "sqrtf", linkageName: "_ZL5sqrtff", scope: !756, file: !756, line: 712, type: !96, scopeLine: 712, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !861)
!861 = !{!862}
!862 = !DILocalVariable(name: "__x", arg: 1, scope: !860, file: !756, line: 712, type: !3)
!863 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !864, file: !757, line: 789)
!864 = !DISubprogram(name: "tanf", linkageName: "_ZL4tanff", scope: !756, file: !756, line: 715, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!865 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !866, file: !757, line: 790)
!866 = !DISubprogram(name: "tanhf", linkageName: "_ZL5tanhff", scope: !756, file: !756, line: 718, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!867 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !868, file: !757, line: 791)
!868 = !DISubprogram(name: "tgammaf", linkageName: "_ZL7tgammaff", scope: !756, file: !756, line: 721, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!869 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !870, file: !757, line: 792)
!870 = !DISubprogram(name: "truncf", linkageName: "_ZL6truncff", scope: !756, file: !756, line: 724, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!871 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !872, file: !873, line: 66)
!872 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "exception_ptr", scope: !874, file: !873, line: 97, size: 64, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSNSt15__exception_ptr13exception_ptrE")
!873 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/bits/exception_ptr.h", directory: "", checksumkind: CSK_MD5, checksum: "314ad14748ccb9ff85c65d17ebb0828b")
!874 = !DINamespace(name: "__exception_ptr", scope: !22)
!875 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !874, entity: !876, file: !873, line: 85)
!876 = !DISubprogram(name: "rethrow_exception", linkageName: "_ZSt17rethrow_exceptionNSt15__exception_ptr13exception_ptrE", scope: !22, file: !873, line: 81, type: !877, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!877 = !DISubroutineType(types: !878)
!878 = !{null, !872}
!879 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !880, file: !873, line: 243)
!880 = !DISubprogram(name: "swap", linkageName: "_ZNSt15__exception_ptr4swapERNS_13exception_ptrES1_", scope: !874, file: !873, line: 230, type: !881, flags: DIFlagPrototyped, spFlags: 0)
!881 = !DISubroutineType(types: !882)
!882 = !{null, !883, !883}
!883 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !872, size: 64)
!884 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !885, file: !900, line: 64)
!885 = !DIDerivedType(tag: DW_TAG_typedef, name: "mbstate_t", file: !886, line: 6, baseType: !887)
!886 = !DIFile(filename: "/usr/include/bits/types/mbstate_t.h", directory: "", checksumkind: CSK_MD5, checksum: "ba8742313715e20e434cf6ccb2db98e3")
!887 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mbstate_t", file: !888, line: 21, baseType: !889)
!888 = !DIFile(filename: "/usr/include/bits/types/__mbstate_t.h", directory: "", checksumkind: CSK_MD5, checksum: "82911a3e689448e3691ded3e0b471a55")
!889 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !888, line: 13, size: 64, flags: DIFlagTypePassByValue, elements: !890, identifier: "_ZTS11__mbstate_t")
!890 = !{!891, !892}
!891 = !DIDerivedType(tag: DW_TAG_member, name: "__count", scope: !889, file: !888, line: 15, baseType: !4, size: 32)
!892 = !DIDerivedType(tag: DW_TAG_member, name: "__value", scope: !889, file: !888, line: 20, baseType: !893, size: 32, offset: 32)
!893 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !889, file: !888, line: 16, size: 32, flags: DIFlagTypePassByValue, elements: !894, identifier: "_ZTSN11__mbstate_tUt_E")
!894 = !{!895, !896}
!895 = !DIDerivedType(tag: DW_TAG_member, name: "__wch", scope: !893, file: !888, line: 18, baseType: !13, size: 32)
!896 = !DIDerivedType(tag: DW_TAG_member, name: "__wchb", scope: !893, file: !888, line: 19, baseType: !897, size: 32)
!897 = !DICompositeType(tag: DW_TAG_array_type, baseType: !271, size: 32, elements: !898)
!898 = !{!899}
!899 = !DISubrange(count: 4)
!900 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/cwchar", directory: "")
!901 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !902, file: !900, line: 141)
!902 = !DIDerivedType(tag: DW_TAG_typedef, name: "wint_t", file: !903, line: 20, baseType: !13)
!903 = !DIFile(filename: "/usr/include/bits/types/wint_t.h", directory: "", checksumkind: CSK_MD5, checksum: "aa31b53ef28dc23152ceb41e2763ded3")
!904 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !905, file: !900, line: 143)
!905 = !DISubprogram(name: "btowc", scope: !906, file: !906, line: 309, type: !907, flags: DIFlagPrototyped, spFlags: 0)
!906 = !DIFile(filename: "/usr/include/wchar.h", directory: "", checksumkind: CSK_MD5, checksum: "c7881b2872d88c3ed71646d8a9e91af3")
!907 = !DISubroutineType(types: !908)
!908 = !{!902, !4}
!909 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !910, file: !900, line: 144)
!910 = !DISubprogram(name: "fgetwc", scope: !906, file: !906, line: 935, type: !911, flags: DIFlagPrototyped, spFlags: 0)
!911 = !DISubroutineType(types: !912)
!912 = !{!902, !913}
!913 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !914, size: 64)
!914 = !DIDerivedType(tag: DW_TAG_typedef, name: "__FILE", file: !915, line: 5, baseType: !916)
!915 = !DIFile(filename: "/usr/include/bits/types/__FILE.h", directory: "", checksumkind: CSK_MD5, checksum: "72a8fe90981f484acae7c6f3dfc5c2b7")
!916 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !915, line: 4, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS8_IO_FILE")
!917 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !918, file: !900, line: 145)
!918 = !DISubprogram(name: "fgetws", scope: !906, file: !906, line: 964, type: !919, flags: DIFlagPrototyped, spFlags: 0)
!919 = !DISubroutineType(types: !920)
!920 = !{!459, !458, !4, !921}
!921 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !913)
!922 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !923, file: !900, line: 146)
!923 = !DISubprogram(name: "fputwc", scope: !906, file: !906, line: 949, type: !924, flags: DIFlagPrototyped, spFlags: 0)
!924 = !DISubroutineType(types: !925)
!925 = !{!902, !460, !913}
!926 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !927, file: !900, line: 147)
!927 = !DISubprogram(name: "fputws", scope: !906, file: !906, line: 971, type: !928, flags: DIFlagPrototyped, spFlags: 0)
!928 = !DISubroutineType(types: !929)
!929 = !{!4, !505, !921}
!930 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !931, file: !900, line: 148)
!931 = !DISubprogram(name: "fwide", scope: !906, file: !906, line: 725, type: !932, flags: DIFlagPrototyped, spFlags: 0)
!932 = !DISubroutineType(types: !933)
!933 = !{!4, !913, !4}
!934 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !935, file: !900, line: 149)
!935 = !DISubprogram(name: "fwprintf", scope: !906, file: !906, line: 732, type: !936, flags: DIFlagPrototyped, spFlags: 0)
!936 = !DISubroutineType(types: !937)
!937 = !{!4, !921, !505, null}
!938 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !939, file: !900, line: 150)
!939 = !DISubprogram(name: "fwscanf", linkageName: "__isoc23_fwscanf", scope: !906, file: !906, line: 795, type: !936, flags: DIFlagPrototyped, spFlags: 0)
!940 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !941, file: !900, line: 151)
!941 = !DISubprogram(name: "getwc", scope: !906, file: !906, line: 936, type: !911, flags: DIFlagPrototyped, spFlags: 0)
!942 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !943, file: !900, line: 152)
!943 = !DISubprogram(name: "getwchar", scope: !906, file: !906, line: 942, type: !944, flags: DIFlagPrototyped, spFlags: 0)
!944 = !DISubroutineType(types: !945)
!945 = !{!902}
!946 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !947, file: !900, line: 153)
!947 = !DISubprogram(name: "mbrlen", scope: !906, file: !906, line: 332, type: !948, flags: DIFlagPrototyped, spFlags: 0)
!948 = !DISubroutineType(types: !949)
!949 = !{!389, !461, !389, !950}
!950 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !951)
!951 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !885, size: 64)
!952 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !953, file: !900, line: 154)
!953 = !DISubprogram(name: "mbrtowc", scope: !906, file: !906, line: 321, type: !954, flags: DIFlagPrototyped, spFlags: 0)
!954 = !DISubroutineType(types: !955)
!955 = !{!389, !458, !461, !389, !950}
!956 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !957, file: !900, line: 155)
!957 = !DISubprogram(name: "mbsinit", scope: !906, file: !906, line: 317, type: !958, flags: DIFlagPrototyped, spFlags: 0)
!958 = !DISubroutineType(types: !959)
!959 = !{!4, !960}
!960 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !961, size: 64)
!961 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !885)
!962 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !963, file: !900, line: 156)
!963 = !DISubprogram(name: "mbsrtowcs", scope: !906, file: !906, line: 362, type: !964, flags: DIFlagPrototyped, spFlags: 0)
!964 = !DISubroutineType(types: !965)
!965 = !{!389, !458, !966, !389, !950}
!966 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !967)
!967 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !269, size: 64)
!968 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !969, file: !900, line: 157)
!969 = !DISubprogram(name: "putwc", scope: !906, file: !906, line: 950, type: !924, flags: DIFlagPrototyped, spFlags: 0)
!970 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !971, file: !900, line: 158)
!971 = !DISubprogram(name: "putwchar", scope: !906, file: !906, line: 956, type: !972, flags: DIFlagPrototyped, spFlags: 0)
!972 = !DISubroutineType(types: !973)
!973 = !{!902, !460}
!974 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !975, file: !900, line: 160)
!975 = !DISubprogram(name: "swprintf", scope: !906, file: !906, line: 742, type: !976, flags: DIFlagPrototyped, spFlags: 0)
!976 = !DISubroutineType(types: !977)
!977 = !{!4, !458, !389, !505, null}
!978 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !979, file: !900, line: 162)
!979 = !DISubprogram(name: "swscanf", linkageName: "__isoc23_swscanf", scope: !906, file: !906, line: 802, type: !980, flags: DIFlagPrototyped, spFlags: 0)
!980 = !DISubroutineType(types: !981)
!981 = !{!4, !505, !505, null}
!982 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !983, file: !900, line: 163)
!983 = !DISubprogram(name: "ungetwc", scope: !906, file: !906, line: 979, type: !984, flags: DIFlagPrototyped, spFlags: 0)
!984 = !DISubroutineType(types: !985)
!985 = !{!902, !902, !913}
!986 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !987, file: !900, line: 164)
!987 = !DISubprogram(name: "vfwprintf", scope: !906, file: !906, line: 750, type: !988, flags: DIFlagPrototyped, spFlags: 0)
!988 = !DISubroutineType(types: !989)
!989 = !{!4, !921, !505, !990}
!990 = !DIDerivedType(tag: DW_TAG_typedef, name: "__gnuc_va_list", file: !991, line: 12, baseType: !992)
!991 = !DIFile(filename: "/opt/rocm-6.4.2/lib/llvm/lib/clang/19/include/__stdarg___gnuc_va_list.h", directory: "", checksumkind: CSK_MD5, checksum: "edb3f2eab991638e4dc94f6e55e3530f")
!992 = !DIDerivedType(tag: DW_TAG_typedef, name: "__builtin_va_list", file: !993, baseType: !437)
!993 = !DIFile(filename: "HeCBench/src/colorwheel-hip/main.cu", directory: "/ccs/home/mdunlavy/GPU_Fault_Injection", checksumkind: CSK_MD5, checksum: "4c8b22f0f3b333f48673b33d1e2205ea")
!994 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !995, file: !900, line: 166)
!995 = !DISubprogram(name: "vfwscanf", linkageName: "__isoc23_vfwscanf", scope: !906, file: !906, line: 875, type: !988, flags: DIFlagPrototyped, spFlags: 0)
!996 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !997, file: !900, line: 169)
!997 = !DISubprogram(name: "vswprintf", scope: !906, file: !906, line: 763, type: !998, flags: DIFlagPrototyped, spFlags: 0)
!998 = !DISubroutineType(types: !999)
!999 = !{!4, !458, !389, !505, !990}
!1000 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1001, file: !900, line: 172)
!1001 = !DISubprogram(name: "vswscanf", linkageName: "__isoc23_vswscanf", scope: !906, file: !906, line: 882, type: !1002, flags: DIFlagPrototyped, spFlags: 0)
!1002 = !DISubroutineType(types: !1003)
!1003 = !{!4, !505, !505, !990}
!1004 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1005, file: !900, line: 174)
!1005 = !DISubprogram(name: "vwprintf", scope: !906, file: !906, line: 758, type: !1006, flags: DIFlagPrototyped, spFlags: 0)
!1006 = !DISubroutineType(types: !1007)
!1007 = !{!4, !505, !990}
!1008 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1009, file: !900, line: 176)
!1009 = !DISubprogram(name: "vwscanf", linkageName: "__isoc23_vwscanf", scope: !906, file: !906, line: 879, type: !1006, flags: DIFlagPrototyped, spFlags: 0)
!1010 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1011, file: !900, line: 178)
!1011 = !DISubprogram(name: "wcrtomb", scope: !906, file: !906, line: 326, type: !1012, flags: DIFlagPrototyped, spFlags: 0)
!1012 = !DISubroutineType(types: !1013)
!1013 = !{!389, !504, !460, !950}
!1014 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1015, file: !900, line: 179)
!1015 = !DISubprogram(name: "wcscat", scope: !906, file: !906, line: 121, type: !1016, flags: DIFlagPrototyped, spFlags: 0)
!1016 = !DISubroutineType(types: !1017)
!1017 = !{!459, !458, !505}
!1018 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1019, file: !900, line: 180)
!1019 = !DISubprogram(name: "wcscmp", scope: !906, file: !906, line: 130, type: !1020, flags: DIFlagPrototyped, spFlags: 0)
!1020 = !DISubroutineType(types: !1021)
!1021 = !{!4, !506, !506}
!1022 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1023, file: !900, line: 181)
!1023 = !DISubprogram(name: "wcscoll", scope: !906, file: !906, line: 155, type: !1020, flags: DIFlagPrototyped, spFlags: 0)
!1024 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1025, file: !900, line: 182)
!1025 = !DISubprogram(name: "wcscpy", scope: !906, file: !906, line: 98, type: !1016, flags: DIFlagPrototyped, spFlags: 0)
!1026 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1027, file: !900, line: 183)
!1027 = !DISubprogram(name: "wcscspn", scope: !906, file: !906, line: 212, type: !1028, flags: DIFlagPrototyped, spFlags: 0)
!1028 = !DISubroutineType(types: !1029)
!1029 = !{!389, !506, !506}
!1030 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1031, file: !900, line: 184)
!1031 = !DISubprogram(name: "wcsftime", scope: !906, file: !906, line: 1043, type: !1032, flags: DIFlagPrototyped, spFlags: 0)
!1032 = !DISubroutineType(types: !1033)
!1033 = !{!389, !458, !389, !505, !1034}
!1034 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1035)
!1035 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1036, size: 64)
!1036 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1037)
!1037 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tm", file: !906, line: 94, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS2tm")
!1038 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1039, file: !900, line: 185)
!1039 = !DISubprogram(name: "wcslen", scope: !906, file: !906, line: 247, type: !1040, flags: DIFlagPrototyped, spFlags: 0)
!1040 = !DISubroutineType(types: !1041)
!1041 = !{!389, !506}
!1042 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1043, file: !900, line: 186)
!1043 = !DISubprogram(name: "wcsncat", scope: !906, file: !906, line: 125, type: !1044, flags: DIFlagPrototyped, spFlags: 0)
!1044 = !DISubroutineType(types: !1045)
!1045 = !{!459, !458, !505, !389}
!1046 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1047, file: !900, line: 187)
!1047 = !DISubprogram(name: "wcsncmp", scope: !906, file: !906, line: 133, type: !1048, flags: DIFlagPrototyped, spFlags: 0)
!1048 = !DISubroutineType(types: !1049)
!1049 = !{!4, !506, !506, !389}
!1050 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1051, file: !900, line: 188)
!1051 = !DISubprogram(name: "wcsncpy", scope: !906, file: !906, line: 103, type: !1044, flags: DIFlagPrototyped, spFlags: 0)
!1052 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1053, file: !900, line: 189)
!1053 = !DISubprogram(name: "wcsrtombs", scope: !906, file: !906, line: 368, type: !1054, flags: DIFlagPrototyped, spFlags: 0)
!1054 = !DISubroutineType(types: !1055)
!1055 = !{!389, !504, !1056, !389, !950}
!1056 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1057)
!1057 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !506, size: 64)
!1058 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1059, file: !900, line: 190)
!1059 = !DISubprogram(name: "wcsspn", scope: !906, file: !906, line: 216, type: !1028, flags: DIFlagPrototyped, spFlags: 0)
!1060 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1061, file: !900, line: 191)
!1061 = !DISubprogram(name: "wcstod", scope: !906, file: !906, line: 402, type: !1062, flags: DIFlagPrototyped, spFlags: 0)
!1062 = !DISubroutineType(types: !1063)
!1063 = !{!33, !505, !1064}
!1064 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1065)
!1065 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !459, size: 64)
!1066 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1067, file: !900, line: 193)
!1067 = !DISubprogram(name: "wcstof", scope: !906, file: !906, line: 407, type: !1068, flags: DIFlagPrototyped, spFlags: 0)
!1068 = !DISubroutineType(types: !1069)
!1069 = !{!3, !505, !1064}
!1070 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1071, file: !900, line: 195)
!1071 = !DISubprogram(name: "wcstok", scope: !906, file: !906, line: 242, type: !1072, flags: DIFlagPrototyped, spFlags: 0)
!1072 = !DISubroutineType(types: !1073)
!1073 = !{!459, !458, !505, !1064}
!1074 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1075, file: !900, line: 196)
!1075 = !DISubprogram(name: "wcstol", linkageName: "__isoc23_wcstol", scope: !906, file: !906, line: 500, type: !1076, flags: DIFlagPrototyped, spFlags: 0)
!1076 = !DISubroutineType(types: !1077)
!1077 = !{!250, !505, !1064, !4}
!1078 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1079, file: !900, line: 197)
!1079 = !DISubprogram(name: "wcstoul", linkageName: "__isoc23_wcstoul", scope: !906, file: !906, line: 503, type: !1080, flags: DIFlagPrototyped, spFlags: 0)
!1080 = !DISubroutineType(types: !1081)
!1081 = !{!391, !505, !1064, !4}
!1082 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1083, file: !900, line: 198)
!1083 = !DISubprogram(name: "wcsxfrm", scope: !906, file: !906, line: 159, type: !1084, flags: DIFlagPrototyped, spFlags: 0)
!1084 = !DISubroutineType(types: !1085)
!1085 = !{!389, !458, !505, !389}
!1086 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1087, file: !900, line: 199)
!1087 = !DISubprogram(name: "wctob", scope: !906, file: !906, line: 313, type: !1088, flags: DIFlagPrototyped, spFlags: 0)
!1088 = !DISubroutineType(types: !1089)
!1089 = !{!4, !902}
!1090 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1091, file: !900, line: 200)
!1091 = !DISubprogram(name: "wmemcmp", scope: !906, file: !906, line: 283, type: !1048, flags: DIFlagPrototyped, spFlags: 0)
!1092 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1093, file: !900, line: 201)
!1093 = !DISubprogram(name: "wmemcpy", scope: !906, file: !906, line: 287, type: !1044, flags: DIFlagPrototyped, spFlags: 0)
!1094 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1095, file: !900, line: 202)
!1095 = !DISubprogram(name: "wmemmove", scope: !906, file: !906, line: 292, type: !1096, flags: DIFlagPrototyped, spFlags: 0)
!1096 = !DISubroutineType(types: !1097)
!1097 = !{!459, !459, !506, !389}
!1098 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1099, file: !900, line: 203)
!1099 = !DISubprogram(name: "wmemset", scope: !906, file: !906, line: 296, type: !1100, flags: DIFlagPrototyped, spFlags: 0)
!1100 = !DISubroutineType(types: !1101)
!1101 = !{!459, !459, !460, !389}
!1102 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1103, file: !900, line: 204)
!1103 = !DISubprogram(name: "wprintf", scope: !906, file: !906, line: 739, type: !1104, flags: DIFlagPrototyped, spFlags: 0)
!1104 = !DISubroutineType(types: !1105)
!1105 = !{!4, !505, null}
!1106 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1107, file: !900, line: 205)
!1107 = !DISubprogram(name: "wscanf", linkageName: "__isoc23_wscanf", scope: !906, file: !906, line: 799, type: !1104, flags: DIFlagPrototyped, spFlags: 0)
!1108 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1109, file: !900, line: 206)
!1109 = !DISubprogram(name: "wcschr", scope: !906, file: !906, line: 189, type: !1110, flags: DIFlagPrototyped, spFlags: 0)
!1110 = !DISubroutineType(types: !1111)
!1111 = !{!459, !506, !460}
!1112 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1113, file: !900, line: 207)
!1113 = !DISubprogram(name: "wcspbrk", scope: !906, file: !906, line: 226, type: !1114, flags: DIFlagPrototyped, spFlags: 0)
!1114 = !DISubroutineType(types: !1115)
!1115 = !{!459, !506, !506}
!1116 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1117, file: !900, line: 208)
!1117 = !DISubprogram(name: "wcsrchr", scope: !906, file: !906, line: 199, type: !1110, flags: DIFlagPrototyped, spFlags: 0)
!1118 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1119, file: !900, line: 209)
!1119 = !DISubprogram(name: "wcsstr", scope: !906, file: !906, line: 237, type: !1114, flags: DIFlagPrototyped, spFlags: 0)
!1120 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1121, file: !900, line: 210)
!1121 = !DISubprogram(name: "wmemchr", scope: !906, file: !906, line: 278, type: !1122, flags: DIFlagPrototyped, spFlags: 0)
!1122 = !DISubroutineType(types: !1123)
!1123 = !{!459, !506, !460, !389}
!1124 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !513, entity: !1125, file: !900, line: 251)
!1125 = !DISubprogram(name: "wcstold", scope: !906, file: !906, line: 409, type: !1126, flags: DIFlagPrototyped, spFlags: 0)
!1126 = !DISubroutineType(types: !1127)
!1127 = !{!102, !505, !1064}
!1128 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !513, entity: !1129, file: !900, line: 260)
!1129 = !DISubprogram(name: "wcstoll", linkageName: "__isoc23_wcstoll", scope: !906, file: !906, line: 508, type: !1130, flags: DIFlagPrototyped, spFlags: 0)
!1130 = !DISubroutineType(types: !1131)
!1131 = !{!213, !505, !1064, !4}
!1132 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !513, entity: !1133, file: !900, line: 261)
!1133 = !DISubprogram(name: "wcstoull", linkageName: "__isoc23_wcstoull", scope: !906, file: !906, line: 513, type: !1134, flags: DIFlagPrototyped, spFlags: 0)
!1134 = !DISubroutineType(types: !1135)
!1135 = !{!541, !505, !1064, !4}
!1136 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1125, file: !900, line: 267)
!1137 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1129, file: !900, line: 268)
!1138 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1133, file: !900, line: 269)
!1139 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1067, file: !900, line: 283)
!1140 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !995, file: !900, line: 286)
!1141 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1001, file: !900, line: 289)
!1142 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1009, file: !900, line: 292)
!1143 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1125, file: !900, line: 296)
!1144 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1129, file: !900, line: 297)
!1145 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1133, file: !900, line: 298)
!1146 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1147, file: !1149, line: 53)
!1147 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "lconv", file: !1148, line: 51, size: 768, flags: DIFlagFwdDecl, identifier: "_ZTS5lconv")
!1148 = !DIFile(filename: "/usr/include/locale.h", directory: "", checksumkind: CSK_MD5, checksum: "9fdf0d24f6e4cc61619b5e3258456dbf")
!1149 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/clocale", directory: "")
!1150 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1151, file: !1149, line: 54)
!1151 = !DISubprogram(name: "setlocale", scope: !1148, file: !1148, line: 122, type: !1152, flags: DIFlagPrototyped, spFlags: 0)
!1152 = !DISubroutineType(types: !1153)
!1153 = !{!437, !4, !269}
!1154 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1155, file: !1149, line: 55)
!1155 = !DISubprogram(name: "localeconv", scope: !1148, file: !1148, line: 125, type: !1156, flags: DIFlagPrototyped, spFlags: 0)
!1156 = !DISubroutineType(types: !1157)
!1157 = !{!1158}
!1158 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1147, size: 64)
!1159 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1160, file: !1162, line: 64)
!1160 = !DISubprogram(name: "isalnum", scope: !1161, file: !1161, line: 108, type: !25, flags: DIFlagPrototyped, spFlags: 0)
!1161 = !DIFile(filename: "/usr/include/ctype.h", directory: "", checksumkind: CSK_MD5, checksum: "04aab4fba8cc4c824a8f09075cc98b20")
!1162 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/cctype", directory: "")
!1163 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1164, file: !1162, line: 65)
!1164 = !DISubprogram(name: "isalpha", scope: !1161, file: !1161, line: 109, type: !25, flags: DIFlagPrototyped, spFlags: 0)
!1165 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1166, file: !1162, line: 66)
!1166 = !DISubprogram(name: "iscntrl", scope: !1161, file: !1161, line: 110, type: !25, flags: DIFlagPrototyped, spFlags: 0)
!1167 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1168, file: !1162, line: 67)
!1168 = !DISubprogram(name: "isdigit", scope: !1161, file: !1161, line: 111, type: !25, flags: DIFlagPrototyped, spFlags: 0)
!1169 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1170, file: !1162, line: 68)
!1170 = !DISubprogram(name: "isgraph", scope: !1161, file: !1161, line: 113, type: !25, flags: DIFlagPrototyped, spFlags: 0)
!1171 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1172, file: !1162, line: 69)
!1172 = !DISubprogram(name: "islower", scope: !1161, file: !1161, line: 112, type: !25, flags: DIFlagPrototyped, spFlags: 0)
!1173 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1174, file: !1162, line: 70)
!1174 = !DISubprogram(name: "isprint", scope: !1161, file: !1161, line: 114, type: !25, flags: DIFlagPrototyped, spFlags: 0)
!1175 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1176, file: !1162, line: 71)
!1176 = !DISubprogram(name: "ispunct", scope: !1161, file: !1161, line: 115, type: !25, flags: DIFlagPrototyped, spFlags: 0)
!1177 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1178, file: !1162, line: 72)
!1178 = !DISubprogram(name: "isspace", scope: !1161, file: !1161, line: 116, type: !25, flags: DIFlagPrototyped, spFlags: 0)
!1179 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1180, file: !1162, line: 73)
!1180 = !DISubprogram(name: "isupper", scope: !1161, file: !1161, line: 117, type: !25, flags: DIFlagPrototyped, spFlags: 0)
!1181 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1182, file: !1162, line: 74)
!1182 = !DISubprogram(name: "isxdigit", scope: !1161, file: !1161, line: 118, type: !25, flags: DIFlagPrototyped, spFlags: 0)
!1183 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1184, file: !1162, line: 75)
!1184 = !DISubprogram(name: "tolower", scope: !1161, file: !1161, line: 122, type: !25, flags: DIFlagPrototyped, spFlags: 0)
!1185 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1186, file: !1162, line: 76)
!1186 = !DISubprogram(name: "toupper", scope: !1161, file: !1161, line: 125, type: !25, flags: DIFlagPrototyped, spFlags: 0)
!1187 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1188, file: !1162, line: 87)
!1188 = !DISubprogram(name: "isblank", scope: !1161, file: !1161, line: 130, type: !25, flags: DIFlagPrototyped, spFlags: 0)
!1189 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1190, file: !1192, line: 98)
!1190 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !1191, line: 7, baseType: !916)
!1191 = !DIFile(filename: "/usr/include/bits/types/FILE.h", directory: "", checksumkind: CSK_MD5, checksum: "571f9fb6223c42439075fdde11a0de5d")
!1192 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/cstdio", directory: "")
!1193 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1194, file: !1192, line: 99)
!1194 = !DIDerivedType(tag: DW_TAG_typedef, name: "fpos_t", file: !1195, line: 84, baseType: !1196)
!1195 = !DIFile(filename: "/usr/include/stdio.h", directory: "", checksumkind: CSK_MD5, checksum: "600479e30522c60809530fc01f232b17")
!1196 = !DIDerivedType(tag: DW_TAG_typedef, name: "__fpos_t", file: !1197, line: 14, baseType: !1198)
!1197 = !DIFile(filename: "/usr/include/bits/types/__fpos_t.h", directory: "", checksumkind: CSK_MD5, checksum: "32de8bdaf3551a6c0a9394f9af4389ce")
!1198 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_G_fpos_t", file: !1197, line: 10, size: 128, flags: DIFlagFwdDecl, identifier: "_ZTS9_G_fpos_t")
!1199 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1200, file: !1192, line: 101)
!1200 = !DISubprogram(name: "clearerr", scope: !1195, file: !1195, line: 844, type: !1201, flags: DIFlagPrototyped, spFlags: 0)
!1201 = !DISubroutineType(types: !1202)
!1202 = !{null, !1203}
!1203 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1190, size: 64)
!1204 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1205, file: !1192, line: 102)
!1205 = !DISubprogram(name: "fclose", scope: !1195, file: !1195, line: 183, type: !1206, flags: DIFlagPrototyped, spFlags: 0)
!1206 = !DISubroutineType(types: !1207)
!1207 = !{!4, !1203}
!1208 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1209, file: !1192, line: 103)
!1209 = !DISubprogram(name: "feof", scope: !1195, file: !1195, line: 846, type: !1206, flags: DIFlagPrototyped, spFlags: 0)
!1210 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1211, file: !1192, line: 104)
!1211 = !DISubprogram(name: "ferror", scope: !1195, file: !1195, line: 848, type: !1206, flags: DIFlagPrototyped, spFlags: 0)
!1212 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1213, file: !1192, line: 105)
!1213 = !DISubprogram(name: "fflush", scope: !1195, file: !1195, line: 235, type: !1206, flags: DIFlagPrototyped, spFlags: 0)
!1214 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1215, file: !1192, line: 106)
!1215 = !DISubprogram(name: "fgetc", scope: !1195, file: !1195, line: 571, type: !1206, flags: DIFlagPrototyped, spFlags: 0)
!1216 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1217, file: !1192, line: 107)
!1217 = !DISubprogram(name: "fgetpos", scope: !1195, file: !1195, line: 818, type: !1218, flags: DIFlagPrototyped, spFlags: 0)
!1218 = !DISubroutineType(types: !1219)
!1219 = !{!4, !1220, !1221}
!1220 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1203)
!1221 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1222)
!1222 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1194, size: 64)
!1223 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1224, file: !1192, line: 108)
!1224 = !DISubprogram(name: "fgets", scope: !1195, file: !1195, line: 650, type: !1225, flags: DIFlagPrototyped, spFlags: 0)
!1225 = !DISubroutineType(types: !1226)
!1226 = !{!437, !504, !4, !1220}
!1227 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1228, file: !1192, line: 109)
!1228 = !DISubprogram(name: "fopen", scope: !1195, file: !1195, line: 263, type: !1229, flags: DIFlagPrototyped, spFlags: 0)
!1229 = !DISubroutineType(types: !1230)
!1230 = !{!1203, !461, !461}
!1231 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1232, file: !1192, line: 110)
!1232 = !DISubprogram(name: "fprintf", scope: !1195, file: !1195, line: 355, type: !1233, flags: DIFlagPrototyped, spFlags: 0)
!1233 = !DISubroutineType(types: !1234)
!1234 = !{!4, !1220, !461, null}
!1235 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1236, file: !1192, line: 111)
!1236 = !DISubprogram(name: "fputc", scope: !1195, file: !1195, line: 607, type: !1237, flags: DIFlagPrototyped, spFlags: 0)
!1237 = !DISubroutineType(types: !1238)
!1238 = !{!4, !4, !1203}
!1239 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1240, file: !1192, line: 112)
!1240 = !DISubprogram(name: "fputs", scope: !1195, file: !1195, line: 713, type: !1241, flags: DIFlagPrototyped, spFlags: 0)
!1241 = !DISubroutineType(types: !1242)
!1242 = !{!4, !461, !1220}
!1243 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1244, file: !1192, line: 113)
!1244 = !DISubprogram(name: "fread", scope: !1195, file: !1195, line: 733, type: !1245, flags: DIFlagPrototyped, spFlags: 0)
!1245 = !DISubroutineType(types: !1246)
!1246 = !{!389, !1247, !389, !389, !1220}
!1247 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !388)
!1248 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1249, file: !1192, line: 114)
!1249 = !DISubprogram(name: "freopen", scope: !1195, file: !1195, line: 270, type: !1250, flags: DIFlagPrototyped, spFlags: 0)
!1250 = !DISubroutineType(types: !1251)
!1251 = !{!1203, !461, !461, !1220}
!1252 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1253, file: !1192, line: 115)
!1253 = !DISubprogram(name: "fscanf", linkageName: "__isoc23_fscanf", scope: !1195, file: !1195, line: 440, type: !1233, flags: DIFlagPrototyped, spFlags: 0)
!1254 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1255, file: !1192, line: 116)
!1255 = !DISubprogram(name: "fseek", scope: !1195, file: !1195, line: 771, type: !1256, flags: DIFlagPrototyped, spFlags: 0)
!1256 = !DISubroutineType(types: !1257)
!1257 = !{!4, !1203, !250, !4}
!1258 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1259, file: !1192, line: 117)
!1259 = !DISubprogram(name: "fsetpos", scope: !1195, file: !1195, line: 823, type: !1260, flags: DIFlagPrototyped, spFlags: 0)
!1260 = !DISubroutineType(types: !1261)
!1261 = !{!4, !1203, !1262}
!1262 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1263, size: 64)
!1263 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1194)
!1264 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1265, file: !1192, line: 118)
!1265 = !DISubprogram(name: "ftell", scope: !1195, file: !1195, line: 776, type: !1266, flags: DIFlagPrototyped, spFlags: 0)
!1266 = !DISubroutineType(types: !1267)
!1267 = !{!250, !1203}
!1268 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1269, file: !1192, line: 119)
!1269 = !DISubprogram(name: "fwrite", scope: !1195, file: !1195, line: 739, type: !1270, flags: DIFlagPrototyped, spFlags: 0)
!1270 = !DISubroutineType(types: !1271)
!1271 = !{!389, !1272, !389, !389, !1220}
!1272 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !413)
!1273 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1274, file: !1192, line: 120)
!1274 = !DISubprogram(name: "getc", scope: !1195, file: !1195, line: 572, type: !1206, flags: DIFlagPrototyped, spFlags: 0)
!1275 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1276, file: !1192, line: 121)
!1276 = !DISubprogram(name: "getchar", scope: !1195, file: !1195, line: 578, type: !474, flags: DIFlagPrototyped, spFlags: 0)
!1277 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1278, file: !1192, line: 126)
!1278 = !DISubprogram(name: "perror", scope: !1195, file: !1195, line: 862, type: !1279, flags: DIFlagPrototyped, spFlags: 0)
!1279 = !DISubroutineType(types: !1280)
!1280 = !{null, !269}
!1281 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1282, file: !1192, line: 127)
!1282 = !DISubprogram(name: "printf", scope: !1195, file: !1195, line: 361, type: !1283, flags: DIFlagPrototyped, spFlags: 0)
!1283 = !DISubroutineType(types: !1284)
!1284 = !{!4, !461, null}
!1285 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1286, file: !1192, line: 128)
!1286 = !DISubprogram(name: "putc", scope: !1195, file: !1195, line: 608, type: !1237, flags: DIFlagPrototyped, spFlags: 0)
!1287 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1288, file: !1192, line: 129)
!1288 = !DISubprogram(name: "putchar", scope: !1195, file: !1195, line: 614, type: !25, flags: DIFlagPrototyped, spFlags: 0)
!1289 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1290, file: !1192, line: 130)
!1290 = !DISubprogram(name: "puts", scope: !1195, file: !1195, line: 719, type: !403, flags: DIFlagPrototyped, spFlags: 0)
!1291 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1292, file: !1192, line: 131)
!1292 = !DISubprogram(name: "remove", scope: !1195, file: !1195, line: 157, type: !403, flags: DIFlagPrototyped, spFlags: 0)
!1293 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1294, file: !1192, line: 132)
!1294 = !DISubprogram(name: "rename", scope: !1195, file: !1195, line: 159, type: !1295, flags: DIFlagPrototyped, spFlags: 0)
!1295 = !DISubroutineType(types: !1296)
!1296 = !{!4, !269, !269}
!1297 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1298, file: !1192, line: 133)
!1298 = !DISubprogram(name: "rewind", scope: !1195, file: !1195, line: 781, type: !1201, flags: DIFlagPrototyped, spFlags: 0)
!1299 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1300, file: !1192, line: 134)
!1300 = !DISubprogram(name: "scanf", linkageName: "__isoc23_scanf", scope: !1195, file: !1195, line: 443, type: !1283, flags: DIFlagPrototyped, spFlags: 0)
!1301 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1302, file: !1192, line: 135)
!1302 = !DISubprogram(name: "setbuf", scope: !1195, file: !1195, line: 333, type: !1303, flags: DIFlagPrototyped, spFlags: 0)
!1303 = !DISubroutineType(types: !1304)
!1304 = !{null, !1220, !504}
!1305 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1306, file: !1192, line: 136)
!1306 = !DISubprogram(name: "setvbuf", scope: !1195, file: !1195, line: 337, type: !1307, flags: DIFlagPrototyped, spFlags: 0)
!1307 = !DISubroutineType(types: !1308)
!1308 = !{!4, !1220, !504, !4, !389}
!1309 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1310, file: !1192, line: 137)
!1310 = !DISubprogram(name: "sprintf", scope: !1195, file: !1195, line: 363, type: !1311, flags: DIFlagPrototyped, spFlags: 0)
!1311 = !DISubroutineType(types: !1312)
!1312 = !{!4, !504, !461, null}
!1313 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1314, file: !1192, line: 138)
!1314 = !DISubprogram(name: "sscanf", linkageName: "__isoc23_sscanf", scope: !1195, file: !1195, line: 445, type: !1315, flags: DIFlagPrototyped, spFlags: 0)
!1315 = !DISubroutineType(types: !1316)
!1316 = !{!4, !461, !461, null}
!1317 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1318, file: !1192, line: 139)
!1318 = !DISubprogram(name: "tmpfile", scope: !1195, file: !1195, line: 193, type: !1319, flags: DIFlagPrototyped, spFlags: 0)
!1319 = !DISubroutineType(types: !1320)
!1320 = !{!1203}
!1321 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1322, file: !1192, line: 141)
!1322 = !DISubprogram(name: "tmpnam", scope: !1195, file: !1195, line: 210, type: !1323, flags: DIFlagPrototyped, spFlags: 0)
!1323 = !DISubroutineType(types: !1324)
!1324 = !{!437, !437}
!1325 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1326, file: !1192, line: 143)
!1326 = !DISubprogram(name: "ungetc", scope: !1195, file: !1195, line: 726, type: !1237, flags: DIFlagPrototyped, spFlags: 0)
!1327 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1328, file: !1192, line: 144)
!1328 = !DISubprogram(name: "vfprintf", scope: !1195, file: !1195, line: 370, type: !1329, flags: DIFlagPrototyped, spFlags: 0)
!1329 = !DISubroutineType(types: !1330)
!1330 = !{!4, !1220, !461, !990}
!1331 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1332, file: !1192, line: 145)
!1332 = !DISubprogram(name: "vprintf", scope: !1195, file: !1195, line: 376, type: !1333, flags: DIFlagPrototyped, spFlags: 0)
!1333 = !DISubroutineType(types: !1334)
!1334 = !{!4, !461, !990}
!1335 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1336, file: !1192, line: 146)
!1336 = !DISubprogram(name: "vsprintf", scope: !1195, file: !1195, line: 378, type: !1337, flags: DIFlagPrototyped, spFlags: 0)
!1337 = !DISubroutineType(types: !1338)
!1338 = !{!4, !504, !461, !990}
!1339 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !513, entity: !1340, file: !1192, line: 175)
!1340 = !DISubprogram(name: "snprintf", scope: !1195, file: !1195, line: 383, type: !1341, flags: DIFlagPrototyped, spFlags: 0)
!1341 = !DISubroutineType(types: !1342)
!1342 = !{!4, !504, !389, !461, null}
!1343 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !513, entity: !1344, file: !1192, line: 176)
!1344 = !DISubprogram(name: "vfscanf", linkageName: "__isoc23_vfscanf", scope: !1195, file: !1195, line: 507, type: !1329, flags: DIFlagPrototyped, spFlags: 0)
!1345 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !513, entity: !1346, file: !1192, line: 177)
!1346 = !DISubprogram(name: "vscanf", linkageName: "__isoc23_vscanf", scope: !1195, file: !1195, line: 512, type: !1333, flags: DIFlagPrototyped, spFlags: 0)
!1347 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !513, entity: !1348, file: !1192, line: 178)
!1348 = !DISubprogram(name: "vsnprintf", scope: !1195, file: !1195, line: 387, type: !1349, flags: DIFlagPrototyped, spFlags: 0)
!1349 = !DISubroutineType(types: !1350)
!1350 = !{!4, !504, !389, !461, !990}
!1351 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !513, entity: !1352, file: !1192, line: 179)
!1352 = !DISubprogram(name: "vsscanf", linkageName: "__isoc23_vsscanf", scope: !1195, file: !1195, line: 515, type: !1353, flags: DIFlagPrototyped, spFlags: 0)
!1353 = !DISubroutineType(types: !1354)
!1354 = !{!4, !461, !461, !990}
!1355 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1340, file: !1192, line: 185)
!1356 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1344, file: !1192, line: 186)
!1357 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1346, file: !1192, line: 187)
!1358 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1348, file: !1192, line: 188)
!1359 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1352, file: !1192, line: 189)
!1360 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1361, file: !1367, line: 58)
!1361 = !DIDerivedType(tag: DW_TAG_typedef, name: "max_align_t", file: !1362, line: 24, baseType: !1363)
!1362 = !DIFile(filename: "/opt/rocm-6.4.2/lib/llvm/lib/clang/19/include/__stddef_max_align_t.h", directory: "", checksumkind: CSK_MD5, checksum: "3c0a2f19d136d39aa835c737c7105def")
!1363 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1362, line: 19, size: 128, flags: DIFlagTypePassByValue, elements: !1364, identifier: "_ZTS11max_align_t")
!1364 = !{!1365, !1366}
!1365 = !DIDerivedType(tag: DW_TAG_member, name: "__clang_max_align_nonce1", scope: !1363, file: !1362, line: 20, baseType: !213, size: 64, align: 64)
!1366 = !DIDerivedType(tag: DW_TAG_member, name: "__clang_max_align_nonce2", scope: !1363, file: !1362, line: 22, baseType: !102, size: 64, align: 64, offset: 64)
!1367 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/cstddef", directory: "")
!1368 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1369, file: !1374, line: 82)
!1369 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctrans_t", file: !1370, line: 48, baseType: !1371)
!1370 = !DIFile(filename: "/usr/include/wctype.h", directory: "", checksumkind: CSK_MD5, checksum: "93d4b1045b46d132ff5e6d83a26abaee")
!1371 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1372, size: 64)
!1372 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1373)
!1373 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !12, line: 41, baseType: !4)
!1374 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/cwctype", directory: "")
!1375 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1376, file: !1374, line: 83)
!1376 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctype_t", file: !1377, line: 38, baseType: !391)
!1377 = !DIFile(filename: "/usr/include/bits/wctype-wchar.h", directory: "", checksumkind: CSK_MD5, checksum: "65a194b61bfadb7760be04a5640f774f")
!1378 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !902, file: !1374, line: 84)
!1379 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1380, file: !1374, line: 86)
!1380 = !DISubprogram(name: "iswalnum", scope: !1377, file: !1377, line: 95, type: !1088, flags: DIFlagPrototyped, spFlags: 0)
!1381 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1382, file: !1374, line: 87)
!1382 = !DISubprogram(name: "iswalpha", scope: !1377, file: !1377, line: 101, type: !1088, flags: DIFlagPrototyped, spFlags: 0)
!1383 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1384, file: !1374, line: 89)
!1384 = !DISubprogram(name: "iswblank", scope: !1377, file: !1377, line: 146, type: !1088, flags: DIFlagPrototyped, spFlags: 0)
!1385 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1386, file: !1374, line: 91)
!1386 = !DISubprogram(name: "iswcntrl", scope: !1377, file: !1377, line: 104, type: !1088, flags: DIFlagPrototyped, spFlags: 0)
!1387 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1388, file: !1374, line: 92)
!1388 = !DISubprogram(name: "iswctype", scope: !1377, file: !1377, line: 159, type: !1389, flags: DIFlagPrototyped, spFlags: 0)
!1389 = !DISubroutineType(types: !1390)
!1390 = !{!4, !902, !1376}
!1391 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1392, file: !1374, line: 93)
!1392 = !DISubprogram(name: "iswdigit", scope: !1377, file: !1377, line: 108, type: !1088, flags: DIFlagPrototyped, spFlags: 0)
!1393 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1394, file: !1374, line: 94)
!1394 = !DISubprogram(name: "iswgraph", scope: !1377, file: !1377, line: 112, type: !1088, flags: DIFlagPrototyped, spFlags: 0)
!1395 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1396, file: !1374, line: 95)
!1396 = !DISubprogram(name: "iswlower", scope: !1377, file: !1377, line: 117, type: !1088, flags: DIFlagPrototyped, spFlags: 0)
!1397 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1398, file: !1374, line: 96)
!1398 = !DISubprogram(name: "iswprint", scope: !1377, file: !1377, line: 120, type: !1088, flags: DIFlagPrototyped, spFlags: 0)
!1399 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1400, file: !1374, line: 97)
!1400 = !DISubprogram(name: "iswpunct", scope: !1377, file: !1377, line: 125, type: !1088, flags: DIFlagPrototyped, spFlags: 0)
!1401 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1402, file: !1374, line: 98)
!1402 = !DISubprogram(name: "iswspace", scope: !1377, file: !1377, line: 130, type: !1088, flags: DIFlagPrototyped, spFlags: 0)
!1403 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1404, file: !1374, line: 99)
!1404 = !DISubprogram(name: "iswupper", scope: !1377, file: !1377, line: 135, type: !1088, flags: DIFlagPrototyped, spFlags: 0)
!1405 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1406, file: !1374, line: 100)
!1406 = !DISubprogram(name: "iswxdigit", scope: !1377, file: !1377, line: 140, type: !1088, flags: DIFlagPrototyped, spFlags: 0)
!1407 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1408, file: !1374, line: 101)
!1408 = !DISubprogram(name: "towctrans", scope: !1370, file: !1370, line: 55, type: !1409, flags: DIFlagPrototyped, spFlags: 0)
!1409 = !DISubroutineType(types: !1410)
!1410 = !{!902, !902, !1369}
!1411 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1412, file: !1374, line: 102)
!1412 = !DISubprogram(name: "towlower", scope: !1377, file: !1377, line: 166, type: !1413, flags: DIFlagPrototyped, spFlags: 0)
!1413 = !DISubroutineType(types: !1414)
!1414 = !{!902, !902}
!1415 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1416, file: !1374, line: 103)
!1416 = !DISubprogram(name: "towupper", scope: !1377, file: !1377, line: 169, type: !1413, flags: DIFlagPrototyped, spFlags: 0)
!1417 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1418, file: !1374, line: 104)
!1418 = !DISubprogram(name: "wctrans", scope: !1370, file: !1370, line: 52, type: !1419, flags: DIFlagPrototyped, spFlags: 0)
!1419 = !DISubroutineType(types: !1420)
!1420 = !{!1369, !269}
!1421 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1422, file: !1374, line: 105)
!1422 = !DISubprogram(name: "wctype", scope: !1377, file: !1377, line: 155, type: !1423, flags: DIFlagPrototyped, spFlags: 0)
!1423 = !DISubroutineType(types: !1424)
!1424 = !{!1376, !269}
!1425 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1426, file: !1430, line: 51)
!1426 = !DIDerivedType(tag: DW_TAG_typedef, name: "int8_t", file: !1427, line: 24, baseType: !1428)
!1427 = !DIFile(filename: "/usr/include/bits/stdint-intn.h", directory: "", checksumkind: CSK_MD5, checksum: "85f68316edee664d7bd685b977adf677")
!1428 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int8_t", file: !12, line: 37, baseType: !1429)
!1429 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!1430 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/cstdint", directory: "")
!1431 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1432, file: !1430, line: 52)
!1432 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !1427, line: 25, baseType: !1433)
!1433 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int16_t", file: !12, line: 39, baseType: !1434)
!1434 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!1435 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1436, file: !1430, line: 53)
!1436 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !1427, line: 26, baseType: !1373)
!1437 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1438, file: !1430, line: 54)
!1438 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !1427, line: 27, baseType: !1439)
!1439 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !12, line: 44, baseType: !250)
!1440 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1441, file: !1430, line: 56)
!1441 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast8_t", file: !1442, line: 58, baseType: !1429)
!1442 = !DIFile(filename: "/usr/include/stdint.h", directory: "", checksumkind: CSK_MD5, checksum: "e1a448af0fce22a39bc183d2915834c7")
!1443 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1444, file: !1430, line: 57)
!1444 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast16_t", file: !1442, line: 60, baseType: !250)
!1445 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1446, file: !1430, line: 58)
!1446 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast32_t", file: !1442, line: 61, baseType: !250)
!1447 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1448, file: !1430, line: 59)
!1448 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast64_t", file: !1442, line: 62, baseType: !250)
!1449 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1450, file: !1430, line: 61)
!1450 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least8_t", file: !1442, line: 43, baseType: !1451)
!1451 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least8_t", file: !12, line: 52, baseType: !1428)
!1452 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1453, file: !1430, line: 62)
!1453 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least16_t", file: !1442, line: 44, baseType: !1454)
!1454 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least16_t", file: !12, line: 54, baseType: !1433)
!1455 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1456, file: !1430, line: 63)
!1456 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least32_t", file: !1442, line: 45, baseType: !1457)
!1457 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least32_t", file: !12, line: 56, baseType: !1373)
!1458 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1459, file: !1430, line: 64)
!1459 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least64_t", file: !1442, line: 46, baseType: !1460)
!1460 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least64_t", file: !12, line: 58, baseType: !1439)
!1461 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1462, file: !1430, line: 66)
!1462 = !DIDerivedType(tag: DW_TAG_typedef, name: "intmax_t", file: !1442, line: 101, baseType: !1463)
!1463 = !DIDerivedType(tag: DW_TAG_typedef, name: "__intmax_t", file: !12, line: 72, baseType: !250)
!1464 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1465, file: !1430, line: 67)
!1465 = !DIDerivedType(tag: DW_TAG_typedef, name: "intptr_t", file: !1442, line: 87, baseType: !250)
!1466 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1467, file: !1430, line: 69)
!1467 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !10, line: 24, baseType: !1468)
!1468 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !12, line: 38, baseType: !1469)
!1469 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!1470 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1471, file: !1430, line: 70)
!1471 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !10, line: 25, baseType: !1472)
!1472 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !12, line: 40, baseType: !1473)
!1473 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!1474 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !9, file: !1430, line: 71)
!1475 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1476, file: !1430, line: 72)
!1476 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !10, line: 27, baseType: !1477)
!1477 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint64_t", file: !12, line: 45, baseType: !391)
!1478 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1479, file: !1430, line: 74)
!1479 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast8_t", file: !1442, line: 71, baseType: !1469)
!1480 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1481, file: !1430, line: 75)
!1481 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast16_t", file: !1442, line: 73, baseType: !391)
!1482 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1483, file: !1430, line: 76)
!1483 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast32_t", file: !1442, line: 74, baseType: !391)
!1484 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1485, file: !1430, line: 77)
!1485 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast64_t", file: !1442, line: 75, baseType: !391)
!1486 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1487, file: !1430, line: 79)
!1487 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least8_t", file: !1442, line: 49, baseType: !1488)
!1488 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least8_t", file: !12, line: 53, baseType: !1468)
!1489 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1490, file: !1430, line: 80)
!1490 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least16_t", file: !1442, line: 50, baseType: !1491)
!1491 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least16_t", file: !12, line: 55, baseType: !1472)
!1492 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1493, file: !1430, line: 81)
!1493 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least32_t", file: !1442, line: 51, baseType: !1494)
!1494 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least32_t", file: !12, line: 57, baseType: !11)
!1495 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1496, file: !1430, line: 82)
!1496 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least64_t", file: !1442, line: 52, baseType: !1497)
!1497 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least64_t", file: !12, line: 59, baseType: !1477)
!1498 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1499, file: !1430, line: 84)
!1499 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintmax_t", file: !1442, line: 102, baseType: !1500)
!1500 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uintmax_t", file: !12, line: 73, baseType: !391)
!1501 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1502, file: !1430, line: 85)
!1502 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintptr_t", file: !1442, line: 90, baseType: !391)
!1503 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1504, file: !1507, line: 60)
!1504 = !DIDerivedType(tag: DW_TAG_typedef, name: "clock_t", file: !1505, line: 7, baseType: !1506)
!1505 = !DIFile(filename: "/usr/include/bits/types/clock_t.h", directory: "", checksumkind: CSK_MD5, checksum: "1aade99fd778d1551600c7ca1410b9f1")
!1506 = !DIDerivedType(tag: DW_TAG_typedef, name: "__clock_t", file: !12, line: 156, baseType: !250)
!1507 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/ctime", directory: "")
!1508 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1509, file: !1507, line: 61)
!1509 = !DIDerivedType(tag: DW_TAG_typedef, name: "time_t", file: !1510, line: 10, baseType: !1511)
!1510 = !DIFile(filename: "/usr/include/bits/types/time_t.h", directory: "", checksumkind: CSK_MD5, checksum: "5c299a4954617c88bb03645c7864e1b1")
!1511 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !12, line: 160, baseType: !250)
!1512 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1037, file: !1507, line: 62)
!1513 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1514, file: !1507, line: 64)
!1514 = !DISubprogram(name: "clock", scope: !1515, file: !1515, line: 72, type: !1516, flags: DIFlagPrototyped, spFlags: 0)
!1515 = !DIFile(filename: "/usr/include/time.h", directory: "", checksumkind: CSK_MD5, checksum: "19daa87a550fdc2d68d9b199f5473f94")
!1516 = !DISubroutineType(types: !1517)
!1517 = !{!1504}
!1518 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1519, file: !1507, line: 65)
!1519 = !DISubprogram(name: "difftime", scope: !1515, file: !1515, line: 79, type: !1520, flags: DIFlagPrototyped, spFlags: 0)
!1520 = !DISubroutineType(types: !1521)
!1521 = !{!33, !1509, !1509}
!1522 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1523, file: !1507, line: 66)
!1523 = !DISubprogram(name: "mktime", scope: !1515, file: !1515, line: 83, type: !1524, flags: DIFlagPrototyped, spFlags: 0)
!1524 = !DISubroutineType(types: !1525)
!1525 = !{!1509, !1526}
!1526 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1037, size: 64)
!1527 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1528, file: !1507, line: 67)
!1528 = !DISubprogram(name: "time", scope: !1515, file: !1515, line: 76, type: !1529, flags: DIFlagPrototyped, spFlags: 0)
!1529 = !DISubroutineType(types: !1530)
!1530 = !{!1509, !1531}
!1531 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1509, size: 64)
!1532 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1533, file: !1507, line: 68)
!1533 = !DISubprogram(name: "asctime", scope: !1515, file: !1515, line: 180, type: !1534, flags: DIFlagPrototyped, spFlags: 0)
!1534 = !DISubroutineType(types: !1535)
!1535 = !{!437, !1035}
!1536 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1537, file: !1507, line: 69)
!1537 = !DISubprogram(name: "ctime", scope: !1515, file: !1515, line: 184, type: !1538, flags: DIFlagPrototyped, spFlags: 0)
!1538 = !DISubroutineType(types: !1539)
!1539 = !{!437, !1540}
!1540 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1541, size: 64)
!1541 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1509)
!1542 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1543, file: !1507, line: 70)
!1543 = !DISubprogram(name: "gmtime", scope: !1515, file: !1515, line: 133, type: !1544, flags: DIFlagPrototyped, spFlags: 0)
!1544 = !DISubroutineType(types: !1545)
!1545 = !{!1526, !1540}
!1546 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1547, file: !1507, line: 71)
!1547 = !DISubprogram(name: "localtime", scope: !1515, file: !1515, line: 137, type: !1544, flags: DIFlagPrototyped, spFlags: 0)
!1548 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1549, file: !1507, line: 72)
!1549 = !DISubprogram(name: "strftime", scope: !1515, file: !1515, line: 100, type: !1550, flags: DIFlagPrototyped, spFlags: 0)
!1550 = !DISubroutineType(types: !1551)
!1551 = !{!389, !504, !389, !461, !1034}
!1552 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1553, file: !1507, line: 79)
!1553 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timespec", file: !1554, line: 11, size: 128, flags: DIFlagTypePassByValue, elements: !1555, identifier: "_ZTS8timespec")
!1554 = !DIFile(filename: "/usr/include/bits/types/struct_timespec.h", directory: "", checksumkind: CSK_MD5, checksum: "55dc154df3f21a5aa944dcafba9b43f6")
!1555 = !{!1556, !1557}
!1556 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !1553, file: !1554, line: 16, baseType: !1511, size: 64)
!1557 = !DIDerivedType(tag: DW_TAG_member, name: "tv_nsec", scope: !1553, file: !1554, line: 21, baseType: !1558, size: 64, offset: 64)
!1558 = !DIDerivedType(tag: DW_TAG_typedef, name: "__syscall_slong_t", file: !12, line: 197, baseType: !250)
!1559 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1560, file: !1507, line: 80)
!1560 = !DISubprogram(name: "timespec_get", scope: !1515, file: !1515, line: 384, type: !1561, flags: DIFlagPrototyped, spFlags: 0)
!1561 = !DISubroutineType(types: !1562)
!1562 = !{!4, !1563, !4}
!1563 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1553, size: 64)
!1564 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !1565, entity: !1566, file: !1568, line: 1436)
!1565 = !DINamespace(name: "chrono", scope: !22)
!1566 = !DINamespace(name: "chrono_literals", scope: !1567, exportSymbols: true)
!1567 = !DINamespace(name: "literals", scope: !22, exportSymbols: true)
!1568 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/bits/chrono.h", directory: "")
!1569 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1570, file: !1574, line: 77)
!1570 = !DISubprogram(name: "memchr", scope: !1571, file: !1571, line: 89, type: !1572, flags: DIFlagPrototyped, spFlags: 0)
!1571 = !DIFile(filename: "/usr/include/string.h", directory: "", checksumkind: CSK_MD5, checksum: "3fc3efdf2e52b973f380a6e7608374ff")
!1572 = !DISubroutineType(types: !1573)
!1573 = !{!413, !413, !4, !389}
!1574 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/cstring", directory: "")
!1575 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1576, file: !1574, line: 78)
!1576 = !DISubprogram(name: "memcmp", scope: !1571, file: !1571, line: 64, type: !1577, flags: DIFlagPrototyped, spFlags: 0)
!1577 = !DISubroutineType(types: !1578)
!1578 = !{!4, !413, !413, !389}
!1579 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1580, file: !1574, line: 79)
!1580 = !DISubprogram(name: "memcpy", scope: !1571, file: !1571, line: 43, type: !1581, flags: DIFlagPrototyped, spFlags: 0)
!1581 = !DISubroutineType(types: !1582)
!1582 = !{!388, !1247, !1272, !389}
!1583 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1584, file: !1574, line: 80)
!1584 = !DISubprogram(name: "memmove", scope: !1571, file: !1571, line: 47, type: !1585, flags: DIFlagPrototyped, spFlags: 0)
!1585 = !DISubroutineType(types: !1586)
!1586 = !{!388, !388, !413, !389}
!1587 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1588, file: !1574, line: 81)
!1588 = !DISubprogram(name: "memset", scope: !1571, file: !1571, line: 61, type: !1589, flags: DIFlagPrototyped, spFlags: 0)
!1589 = !DISubroutineType(types: !1590)
!1590 = !{!388, !388, !4, !389}
!1591 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1592, file: !1574, line: 82)
!1592 = !DISubprogram(name: "strcat", scope: !1571, file: !1571, line: 149, type: !1593, flags: DIFlagPrototyped, spFlags: 0)
!1593 = !DISubroutineType(types: !1594)
!1594 = !{!437, !504, !461}
!1595 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1596, file: !1574, line: 83)
!1596 = !DISubprogram(name: "strcmp", scope: !1571, file: !1571, line: 156, type: !1295, flags: DIFlagPrototyped, spFlags: 0)
!1597 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1598, file: !1574, line: 84)
!1598 = !DISubprogram(name: "strcoll", scope: !1571, file: !1571, line: 163, type: !1295, flags: DIFlagPrototyped, spFlags: 0)
!1599 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1600, file: !1574, line: 85)
!1600 = !DISubprogram(name: "strcpy", scope: !1571, file: !1571, line: 141, type: !1593, flags: DIFlagPrototyped, spFlags: 0)
!1601 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1602, file: !1574, line: 86)
!1602 = !DISubprogram(name: "strcspn", scope: !1571, file: !1571, line: 293, type: !1603, flags: DIFlagPrototyped, spFlags: 0)
!1603 = !DISubroutineType(types: !1604)
!1604 = !{!389, !269, !269}
!1605 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1606, file: !1574, line: 87)
!1606 = !DISubprogram(name: "strerror", scope: !1571, file: !1571, line: 419, type: !1607, flags: DIFlagPrototyped, spFlags: 0)
!1607 = !DISubroutineType(types: !1608)
!1608 = !{!437, !4}
!1609 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1610, file: !1574, line: 88)
!1610 = !DISubprogram(name: "strlen", scope: !1571, file: !1571, line: 407, type: !1611, flags: DIFlagPrototyped, spFlags: 0)
!1611 = !DISubroutineType(types: !1612)
!1612 = !{!389, !269}
!1613 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1614, file: !1574, line: 89)
!1614 = !DISubprogram(name: "strncat", scope: !1571, file: !1571, line: 152, type: !1615, flags: DIFlagPrototyped, spFlags: 0)
!1615 = !DISubroutineType(types: !1616)
!1616 = !{!437, !504, !461, !389}
!1617 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1618, file: !1574, line: 90)
!1618 = !DISubprogram(name: "strncmp", scope: !1571, file: !1571, line: 159, type: !1619, flags: DIFlagPrototyped, spFlags: 0)
!1619 = !DISubroutineType(types: !1620)
!1620 = !{!4, !269, !269, !389}
!1621 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1622, file: !1574, line: 91)
!1622 = !DISubprogram(name: "strncpy", scope: !1571, file: !1571, line: 144, type: !1615, flags: DIFlagPrototyped, spFlags: 0)
!1623 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1624, file: !1574, line: 92)
!1624 = !DISubprogram(name: "strspn", scope: !1571, file: !1571, line: 297, type: !1603, flags: DIFlagPrototyped, spFlags: 0)
!1625 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1626, file: !1574, line: 93)
!1626 = !DISubprogram(name: "strtok", scope: !1571, file: !1571, line: 356, type: !1593, flags: DIFlagPrototyped, spFlags: 0)
!1627 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1628, file: !1574, line: 94)
!1628 = !DISubprogram(name: "strxfrm", scope: !1571, file: !1571, line: 166, type: !1629, flags: DIFlagPrototyped, spFlags: 0)
!1629 = !DISubroutineType(types: !1630)
!1630 = !{!389, !504, !461, !389}
!1631 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1632, file: !1574, line: 95)
!1632 = !DISubprogram(name: "strchr", scope: !1571, file: !1571, line: 228, type: !1633, flags: DIFlagPrototyped, spFlags: 0)
!1633 = !DISubroutineType(types: !1634)
!1634 = !{!269, !269, !4}
!1635 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1636, file: !1574, line: 96)
!1636 = !DISubprogram(name: "strpbrk", scope: !1571, file: !1571, line: 305, type: !1637, flags: DIFlagPrototyped, spFlags: 0)
!1637 = !DISubroutineType(types: !1638)
!1638 = !{!269, !269, !269}
!1639 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1640, file: !1574, line: 97)
!1640 = !DISubprogram(name: "strrchr", scope: !1571, file: !1571, line: 255, type: !1633, flags: DIFlagPrototyped, spFlags: 0)
!1641 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !1642, file: !1574, line: 98)
!1642 = !DISubprogram(name: "strstr", scope: !1571, file: !1571, line: 332, type: !1637, flags: DIFlagPrototyped, spFlags: 0)
!1643 = !{i32 1, !"amdhsa_code_object_version", i32 600}
!1644 = !{i32 1, !"amdgpu_printf_kind", !"hostcall"}
!1645 = !{i32 7, !"Dwarf Version", i32 5}
!1646 = !{i32 2, !"Debug Info Version", i32 3}
!1647 = !{i32 1, !"wchar_size", i32 4}
!1648 = !{i32 8, !"PIC Level", i32 2}
!1649 = !{i32 7, !"frame-pointer", i32 2}
!1650 = !{!"AMD clang version 19.0.0git (https://github.com/RadeonOpenCompute/llvm-project roc-6.4.2 25224 d366fa84f3fdcbd4b10847ebd5db572ae12a34fb)"}
!1651 = !{i32 2, i32 0}
!1652 = distinct !DISubprogram(name: "__cxa_pure_virtual", scope: !1653, file: !1653, line: 37, type: !382, scopeLine: 37, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagDefinition, unit: !0)
!1653 = !DIFile(filename: "/opt/rocm-6.4.2/lib/llvm/lib/clang/19/include/__clang_hip_runtime_wrapper.h", directory: "", checksumkind: CSK_MD5, checksum: "3b4af0bdaa6ccc1fa2b6e310d2157303")
!1654 = !DILocation(line: 38, column: 5, scope: !1652)
!1655 = !DILocation(line: 39, column: 3, scope: !1652)
!1656 = distinct !DISubprogram(name: "__cxa_deleted_virtual", scope: !1653, file: !1653, line: 43, type: !382, scopeLine: 43, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagDefinition, unit: !0)
!1657 = !DILocation(line: 44, column: 5, scope: !1656)
!1658 = !DILocation(line: 45, column: 3, scope: !1656)
!1659 = distinct !DISubprogram(name: "__assert_fail", scope: !1660, file: !1660, line: 44, type: !1661, scopeLine: 48, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !1663)
!1660 = !DIFile(filename: "/opt/rocm-6.4.2/include/hip/amd_detail/hip_assert.h", directory: "", checksumkind: CSK_MD5, checksum: "a705f3fd54b4159bc676e001f217fb77")
!1661 = !DISubroutineType(types: !1662)
!1662 = !{null, !269, !269, !13, !269}
!1663 = !{!1664, !1665, !1666, !1667, !1668, !1672, !1673, !1674, !1676, !1678, !1680}
!1664 = !DILocalVariable(name: "assertion", arg: 1, scope: !1659, file: !1660, line: 44, type: !269)
!1665 = !DILocalVariable(name: "file", arg: 2, scope: !1659, file: !1660, line: 45, type: !269)
!1666 = !DILocalVariable(name: "line", arg: 3, scope: !1659, file: !1660, line: 46, type: !13)
!1667 = !DILocalVariable(name: "function", arg: 4, scope: !1659, file: !1660, line: 47, type: !269)
!1668 = !DILocalVariable(name: "fmt", scope: !1659, file: !1660, line: 49, type: !1669)
!1669 = !DICompositeType(tag: DW_TAG_array_type, baseType: !270, size: 376, elements: !1670)
!1670 = !{!1671}
!1671 = !DISubrange(count: 47)
!1672 = !DILocalVariable(name: "msg", scope: !1659, file: !1660, line: 68, type: !1476)
!1673 = !DILocalVariable(name: "len", scope: !1659, file: !1660, line: 69, type: !4)
!1674 = !DILocalVariable(name: "tmp", scope: !1675, file: !1660, line: 70, type: !269)
!1675 = distinct !DILexicalBlock(scope: !1659, file: !1660, line: 70, column: 3)
!1676 = !DILocalVariable(name: "tmp", scope: !1677, file: !1660, line: 72, type: !269)
!1677 = distinct !DILexicalBlock(scope: !1659, file: !1660, line: 72, column: 3)
!1678 = !DILocalVariable(name: "tmp", scope: !1679, file: !1660, line: 75, type: !269)
!1679 = distinct !DILexicalBlock(scope: !1659, file: !1660, line: 75, column: 3)
!1680 = !DILocalVariable(name: "tmp", scope: !1681, file: !1660, line: 77, type: !269)
!1681 = distinct !DILexicalBlock(scope: !1659, file: !1660, line: 77, column: 3)
!1682 = !DILocation(line: 44, column: 32, scope: !1659)
!1683 = !DILocation(line: 45, column: 32, scope: !1659)
!1684 = !DILocation(line: 46, column: 33, scope: !1659)
!1685 = !DILocation(line: 47, column: 32, scope: !1659)
!1686 = !DILocation(line: 49, column: 14, scope: !1659)
!1687 = !DILocation(line: 68, column: 8, scope: !1659)
!1688 = !DILocation(line: 68, column: 14, scope: !1659)
!1689 = !DILocation(line: 69, column: 7, scope: !1659)
!1690 = !DILocation(line: 70, column: 3, scope: !1659)
!1691 = !DILocation(line: 70, column: 3, scope: !1675)
!1692 = distinct !{!1692, !1691, !1691, !1693}
!1693 = !{!"llvm.loop.mustprogress"}
!1694 = !DILocation(line: 71, column: 40, scope: !1659)
!1695 = !DILocation(line: 71, column: 45, scope: !1659)
!1696 = !DILocation(line: 71, column: 50, scope: !1659)
!1697 = !DILocation(line: 71, column: 9, scope: !1659)
!1698 = !DILocation(line: 71, column: 7, scope: !1659)
!1699 = !DILocation(line: 72, column: 3, scope: !1659)
!1700 = !DILocation(line: 72, column: 3, scope: !1677)
!1701 = distinct !{!1701, !1700, !1700, !1693}
!1702 = !DILocation(line: 73, column: 40, scope: !1659)
!1703 = !DILocation(line: 73, column: 45, scope: !1659)
!1704 = !DILocation(line: 73, column: 51, scope: !1659)
!1705 = !DILocation(line: 73, column: 9, scope: !1659)
!1706 = !DILocation(line: 73, column: 7, scope: !1659)
!1707 = !DILocation(line: 74, column: 36, scope: !1659)
!1708 = !DILocation(line: 74, column: 44, scope: !1659)
!1709 = !DILocation(line: 74, column: 9, scope: !1659)
!1710 = !DILocation(line: 74, column: 7, scope: !1659)
!1711 = !DILocation(line: 75, column: 3, scope: !1659)
!1712 = !DILocation(line: 75, column: 3, scope: !1679)
!1713 = distinct !{!1713, !1712, !1712, !1693}
!1714 = !DILocation(line: 76, column: 40, scope: !1659)
!1715 = !DILocation(line: 76, column: 45, scope: !1659)
!1716 = !DILocation(line: 76, column: 55, scope: !1659)
!1717 = !DILocation(line: 76, column: 9, scope: !1659)
!1718 = !DILocation(line: 76, column: 7, scope: !1659)
!1719 = !DILocation(line: 77, column: 3, scope: !1659)
!1720 = !DILocation(line: 77, column: 3, scope: !1681)
!1721 = distinct !{!1721, !1720, !1720, !1693}
!1722 = !DILocation(line: 78, column: 34, scope: !1659)
!1723 = !DILocation(line: 78, column: 39, scope: !1659)
!1724 = !DILocation(line: 78, column: 50, scope: !1659)
!1725 = !DILocation(line: 78, column: 3, scope: !1659)
!1726 = !DILocation(line: 82, column: 3, scope: !1659)
!1727 = !DILocation(line: 83, column: 1, scope: !1659)
!1728 = distinct !DISubprogram(name: "__assertfail", scope: !1660, file: !1660, line: 86, type: !382, scopeLine: 87, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0)
!1729 = !DILocation(line: 89, column: 5, scope: !1728)
!1730 = !DILocation(line: 90, column: 1, scope: !1728)
!1731 = distinct !DISubprogram(name: "setcols", linkageName: "_Z7setcolsPA3_iiiii", scope: !993, file: !993, line: 24, type: !1732, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !1738)
!1732 = !DISubroutineType(types: !1733)
!1733 = !{null, !1734, !4, !4, !4, !4}
!1734 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1735, size: 64)
!1735 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 96, elements: !1736)
!1736 = !{!1737}
!1737 = !DISubrange(count: 3)
!1738 = !{!1739, !1740, !1741, !1742, !1743}
!1739 = !DILocalVariable(name: "cw", arg: 1, scope: !1731, file: !993, line: 24, type: !1734)
!1740 = !DILocalVariable(name: "r", arg: 2, scope: !1731, file: !993, line: 24, type: !4)
!1741 = !DILocalVariable(name: "g", arg: 3, scope: !1731, file: !993, line: 24, type: !4)
!1742 = !DILocalVariable(name: "b", arg: 4, scope: !1731, file: !993, line: 24, type: !4)
!1743 = !DILocalVariable(name: "k", arg: 5, scope: !1731, file: !993, line: 24, type: !4)
!1744 = !DILocation(line: 24, column: 18, scope: !1731)
!1745 = !DILocation(line: 24, column: 38, scope: !1731)
!1746 = !DILocation(line: 24, column: 45, scope: !1731)
!1747 = !DILocation(line: 24, column: 52, scope: !1731)
!1748 = !DILocation(line: 24, column: 59, scope: !1731)
!1749 = !DILocation(line: 26, column: 14, scope: !1731)
!1750 = !DILocation(line: 26, column: 3, scope: !1731)
!1751 = !DILocation(line: 26, column: 6, scope: !1731)
!1752 = !DILocation(line: 26, column: 12, scope: !1731)
!1753 = !DILocation(line: 27, column: 14, scope: !1731)
!1754 = !DILocation(line: 27, column: 3, scope: !1731)
!1755 = !DILocation(line: 27, column: 6, scope: !1731)
!1756 = !DILocation(line: 27, column: 12, scope: !1731)
!1757 = !DILocation(line: 28, column: 14, scope: !1731)
!1758 = !DILocation(line: 28, column: 3, scope: !1731)
!1759 = !DILocation(line: 28, column: 6, scope: !1731)
!1760 = !DILocation(line: 28, column: 12, scope: !1731)
!1761 = !DILocation(line: 29, column: 1, scope: !1731)
!1762 = distinct !DISubprogram(name: "computeColor", linkageName: "_Z12computeColorffPh", scope: !993, file: !993, line: 32, type: !1763, scopeLine: 33, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !1767)
!1763 = !DISubroutineType(types: !1764)
!1764 = !{null, !3, !3, !1765}
!1765 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1766, size: 64)
!1766 = !DIDerivedType(tag: DW_TAG_typedef, name: "uchar", file: !993, line: 21, baseType: !1469)
!1767 = !{!1768, !1769, !1770, !1771, !1775, !1776, !1777, !1778, !1779, !1780, !1781, !1782, !1783, !1785, !1788, !1789}
!1768 = !DILocalVariable(name: "fx", arg: 1, scope: !1762, file: !993, line: 32, type: !3)
!1769 = !DILocalVariable(name: "fy", arg: 2, scope: !1762, file: !993, line: 32, type: !3)
!1770 = !DILocalVariable(name: "pix", arg: 3, scope: !1762, file: !993, line: 32, type: !1765)
!1771 = !DILocalVariable(name: "cw", scope: !1762, file: !993, line: 34, type: !1772)
!1772 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 5280, elements: !1773)
!1773 = !{!1774, !1737}
!1774 = !DISubrange(count: 55)
!1775 = !DILocalVariable(name: "i", scope: !1762, file: !993, line: 40, type: !4)
!1776 = !DILocalVariable(name: "k", scope: !1762, file: !993, line: 41, type: !4)
!1777 = !DILocalVariable(name: "rad", scope: !1762, file: !993, line: 49, type: !3)
!1778 = !DILocalVariable(name: "a", scope: !1762, file: !993, line: 50, type: !3)
!1779 = !DILocalVariable(name: "fk", scope: !1762, file: !993, line: 51, type: !3)
!1780 = !DILocalVariable(name: "k0", scope: !1762, file: !993, line: 52, type: !4)
!1781 = !DILocalVariable(name: "k1", scope: !1762, file: !993, line: 53, type: !4)
!1782 = !DILocalVariable(name: "f", scope: !1762, file: !993, line: 54, type: !3)
!1783 = !DILocalVariable(name: "b", scope: !1784, file: !993, line: 55, type: !4)
!1784 = distinct !DILexicalBlock(scope: !1762, file: !993, line: 55, column: 3)
!1785 = !DILocalVariable(name: "col0", scope: !1786, file: !993, line: 56, type: !3)
!1786 = distinct !DILexicalBlock(scope: !1787, file: !993, line: 55, column: 31)
!1787 = distinct !DILexicalBlock(scope: !1784, file: !993, line: 55, column: 3)
!1788 = !DILocalVariable(name: "col1", scope: !1786, file: !993, line: 57, type: !3)
!1789 = !DILocalVariable(name: "col", scope: !1786, file: !993, line: 58, type: !3)
!1790 = !DILocation(line: 32, column: 25, scope: !1762)
!1791 = !DILocation(line: 32, column: 35, scope: !1762)
!1792 = !DILocation(line: 32, column: 46, scope: !1762)
!1793 = !DILocation(line: 34, column: 7, scope: !1762)
!1794 = !DILocation(line: 40, column: 7, scope: !1762)
!1795 = !DILocation(line: 41, column: 7, scope: !1762)
!1796 = !DILocation(line: 42, column: 10, scope: !1797)
!1797 = distinct !DILexicalBlock(scope: !1762, file: !993, line: 42, column: 3)
!1798 = !DILocation(line: 42, column: 8, scope: !1797)
!1799 = !DILocation(line: 42, column: 15, scope: !1800)
!1800 = distinct !DILexicalBlock(scope: !1797, file: !993, line: 42, column: 3)
!1801 = !DILocation(line: 42, column: 17, scope: !1800)
!1802 = !DILocation(line: 42, column: 3, scope: !1797)
!1803 = !DILocation(line: 42, column: 36, scope: !1800)
!1804 = !DILocation(line: 42, column: 53, scope: !1800)
!1805 = !DILocation(line: 42, column: 52, scope: !1800)
!1806 = !DILocation(line: 42, column: 54, scope: !1800)
!1807 = !DILocation(line: 42, column: 71, scope: !1800)
!1808 = !DILocation(line: 42, column: 28, scope: !1800)
!1809 = !DILocation(line: 42, column: 24, scope: !1800)
!1810 = !DILocation(line: 42, column: 3, scope: !1800)
!1811 = distinct !{!1811, !1802, !1812, !1693}
!1812 = !DILocation(line: 42, column: 73, scope: !1797)
!1813 = !DILocation(line: 43, column: 10, scope: !1814)
!1814 = distinct !DILexicalBlock(scope: !1762, file: !993, line: 43, column: 3)
!1815 = !DILocation(line: 43, column: 8, scope: !1814)
!1816 = !DILocation(line: 43, column: 15, scope: !1817)
!1817 = distinct !DILexicalBlock(scope: !1814, file: !993, line: 43, column: 3)
!1818 = !DILocation(line: 43, column: 17, scope: !1817)
!1819 = !DILocation(line: 43, column: 3, scope: !1814)
!1820 = !DILocation(line: 43, column: 36, scope: !1817)
!1821 = !DILocation(line: 43, column: 48, scope: !1817)
!1822 = !DILocation(line: 43, column: 47, scope: !1817)
!1823 = !DILocation(line: 43, column: 49, scope: !1817)
!1824 = !DILocation(line: 43, column: 43, scope: !1817)
!1825 = !DILocation(line: 43, column: 71, scope: !1817)
!1826 = !DILocation(line: 43, column: 28, scope: !1817)
!1827 = !DILocation(line: 43, column: 24, scope: !1817)
!1828 = !DILocation(line: 43, column: 3, scope: !1817)
!1829 = distinct !{!1829, !1819, !1830, !1693}
!1830 = !DILocation(line: 43, column: 73, scope: !1814)
!1831 = !DILocation(line: 44, column: 10, scope: !1832)
!1832 = distinct !DILexicalBlock(scope: !1762, file: !993, line: 44, column: 3)
!1833 = !DILocation(line: 44, column: 8, scope: !1832)
!1834 = !DILocation(line: 44, column: 15, scope: !1835)
!1835 = distinct !DILexicalBlock(scope: !1832, file: !993, line: 44, column: 3)
!1836 = !DILocation(line: 44, column: 17, scope: !1835)
!1837 = !DILocation(line: 44, column: 3, scope: !1832)
!1838 = !DILocation(line: 44, column: 36, scope: !1835)
!1839 = !DILocation(line: 44, column: 62, scope: !1835)
!1840 = !DILocation(line: 44, column: 61, scope: !1835)
!1841 = !DILocation(line: 44, column: 63, scope: !1835)
!1842 = !DILocation(line: 44, column: 71, scope: !1835)
!1843 = !DILocation(line: 44, column: 28, scope: !1835)
!1844 = !DILocation(line: 44, column: 24, scope: !1835)
!1845 = !DILocation(line: 44, column: 3, scope: !1835)
!1846 = distinct !{!1846, !1837, !1847, !1693}
!1847 = !DILocation(line: 44, column: 73, scope: !1832)
!1848 = !DILocation(line: 45, column: 10, scope: !1849)
!1849 = distinct !DILexicalBlock(scope: !1762, file: !993, line: 45, column: 3)
!1850 = !DILocation(line: 45, column: 8, scope: !1849)
!1851 = !DILocation(line: 45, column: 15, scope: !1852)
!1852 = distinct !DILexicalBlock(scope: !1849, file: !993, line: 45, column: 3)
!1853 = !DILocation(line: 45, column: 17, scope: !1852)
!1854 = !DILocation(line: 45, column: 3, scope: !1849)
!1855 = !DILocation(line: 45, column: 36, scope: !1852)
!1856 = !DILocation(line: 45, column: 57, scope: !1852)
!1857 = !DILocation(line: 45, column: 56, scope: !1852)
!1858 = !DILocation(line: 45, column: 58, scope: !1852)
!1859 = !DILocation(line: 45, column: 52, scope: !1852)
!1860 = !DILocation(line: 45, column: 71, scope: !1852)
!1861 = !DILocation(line: 45, column: 28, scope: !1852)
!1862 = !DILocation(line: 45, column: 24, scope: !1852)
!1863 = !DILocation(line: 45, column: 3, scope: !1852)
!1864 = distinct !{!1864, !1854, !1865, !1693}
!1865 = !DILocation(line: 45, column: 73, scope: !1849)
!1866 = !DILocation(line: 46, column: 10, scope: !1867)
!1867 = distinct !DILexicalBlock(scope: !1762, file: !993, line: 46, column: 3)
!1868 = !DILocation(line: 46, column: 8, scope: !1867)
!1869 = !DILocation(line: 46, column: 15, scope: !1870)
!1870 = distinct !DILexicalBlock(scope: !1867, file: !993, line: 46, column: 3)
!1871 = !DILocation(line: 46, column: 17, scope: !1870)
!1872 = !DILocation(line: 46, column: 3, scope: !1867)
!1873 = !DILocation(line: 46, column: 36, scope: !1870)
!1874 = !DILocation(line: 46, column: 44, scope: !1870)
!1875 = !DILocation(line: 46, column: 43, scope: !1870)
!1876 = !DILocation(line: 46, column: 45, scope: !1870)
!1877 = !DILocation(line: 46, column: 71, scope: !1870)
!1878 = !DILocation(line: 46, column: 28, scope: !1870)
!1879 = !DILocation(line: 46, column: 24, scope: !1870)
!1880 = !DILocation(line: 46, column: 3, scope: !1870)
!1881 = distinct !{!1881, !1872, !1882, !1693}
!1882 = !DILocation(line: 46, column: 73, scope: !1867)
!1883 = !DILocation(line: 47, column: 10, scope: !1884)
!1884 = distinct !DILexicalBlock(scope: !1762, file: !993, line: 47, column: 3)
!1885 = !DILocation(line: 47, column: 8, scope: !1884)
!1886 = !DILocation(line: 47, column: 15, scope: !1887)
!1887 = distinct !DILexicalBlock(scope: !1884, file: !993, line: 47, column: 3)
!1888 = !DILocation(line: 47, column: 17, scope: !1887)
!1889 = !DILocation(line: 47, column: 3, scope: !1884)
!1890 = !DILocation(line: 47, column: 36, scope: !1887)
!1891 = !DILocation(line: 47, column: 64, scope: !1887)
!1892 = !DILocation(line: 47, column: 63, scope: !1887)
!1893 = !DILocation(line: 47, column: 65, scope: !1887)
!1894 = !DILocation(line: 47, column: 59, scope: !1887)
!1895 = !DILocation(line: 47, column: 71, scope: !1887)
!1896 = !DILocation(line: 47, column: 28, scope: !1887)
!1897 = !DILocation(line: 47, column: 24, scope: !1887)
!1898 = !DILocation(line: 47, column: 3, scope: !1887)
!1899 = distinct !{!1899, !1889, !1900, !1693}
!1900 = !DILocation(line: 47, column: 73, scope: !1884)
!1901 = !DILocation(line: 49, column: 9, scope: !1762)
!1902 = !DILocation(line: 49, column: 21, scope: !1762)
!1903 = !DILocation(line: 49, column: 26, scope: !1762)
!1904 = !DILocation(line: 49, column: 24, scope: !1762)
!1905 = !DILocation(line: 49, column: 31, scope: !1762)
!1906 = !DILocation(line: 49, column: 36, scope: !1762)
!1907 = !DILocation(line: 49, column: 34, scope: !1762)
!1908 = !DILocation(line: 49, column: 29, scope: !1762)
!1909 = !DILocation(line: 712, column: 19, scope: !860, inlinedAt: !1910)
!1910 = distinct !DILocation(line: 49, column: 15, scope: !1762)
!1911 = !DILocation(line: 712, column: 49, scope: !860, inlinedAt: !1910)
!1912 = !DILocation(line: 712, column: 33, scope: !860, inlinedAt: !1910)
!1913 = !DILocation(line: 50, column: 9, scope: !1762)
!1914 = !DILocation(line: 50, column: 21, scope: !1762)
!1915 = !DILocation(line: 50, column: 20, scope: !1762)
!1916 = !DILocation(line: 50, column: 26, scope: !1762)
!1917 = !DILocation(line: 50, column: 25, scope: !1762)
!1918 = !DILocation(line: 370, column: 20, scope: !765, inlinedAt: !1919)
!1919 = distinct !DILocation(line: 50, column: 13, scope: !1762)
!1920 = !DILocation(line: 370, column: 31, scope: !765, inlinedAt: !1919)
!1921 = !DILocation(line: 370, column: 62, scope: !765, inlinedAt: !1919)
!1922 = !DILocation(line: 370, column: 67, scope: !765, inlinedAt: !1919)
!1923 = !DILocation(line: 370, column: 45, scope: !765, inlinedAt: !1919)
!1924 = !DILocation(line: 50, column: 30, scope: !1762)
!1925 = !DILocation(line: 51, column: 9, scope: !1762)
!1926 = !DILocation(line: 51, column: 15, scope: !1762)
!1927 = !DILocation(line: 51, column: 17, scope: !1762)
!1928 = !DILocation(line: 51, column: 24, scope: !1762)
!1929 = !DILocation(line: 51, column: 30, scope: !1762)
!1930 = !DILocation(line: 52, column: 7, scope: !1762)
!1931 = !DILocation(line: 52, column: 17, scope: !1762)
!1932 = !DILocation(line: 53, column: 7, scope: !1762)
!1933 = !DILocation(line: 53, column: 13, scope: !1762)
!1934 = !DILocation(line: 53, column: 16, scope: !1762)
!1935 = !DILocation(line: 53, column: 21, scope: !1762)
!1936 = !DILocation(line: 54, column: 9, scope: !1762)
!1937 = !DILocation(line: 54, column: 13, scope: !1762)
!1938 = !DILocation(line: 54, column: 18, scope: !1762)
!1939 = !DILocation(line: 54, column: 16, scope: !1762)
!1940 = !DILocation(line: 55, column: 12, scope: !1784)
!1941 = !DILocation(line: 55, column: 8, scope: !1784)
!1942 = !DILocation(line: 55, column: 19, scope: !1787)
!1943 = !DILocation(line: 55, column: 21, scope: !1787)
!1944 = !DILocation(line: 55, column: 3, scope: !1784)
!1945 = !DILocation(line: 56, column: 11, scope: !1786)
!1946 = !DILocation(line: 56, column: 21, scope: !1786)
!1947 = !DILocation(line: 56, column: 18, scope: !1786)
!1948 = !DILocation(line: 56, column: 25, scope: !1786)
!1949 = !DILocation(line: 56, column: 28, scope: !1786)
!1950 = !DILocation(line: 57, column: 11, scope: !1786)
!1951 = !DILocation(line: 57, column: 21, scope: !1786)
!1952 = !DILocation(line: 57, column: 18, scope: !1786)
!1953 = !DILocation(line: 57, column: 25, scope: !1786)
!1954 = !DILocation(line: 57, column: 28, scope: !1786)
!1955 = !DILocation(line: 58, column: 11, scope: !1786)
!1956 = !DILocation(line: 58, column: 24, scope: !1786)
!1957 = !DILocation(line: 58, column: 22, scope: !1786)
!1958 = !DILocation(line: 58, column: 29, scope: !1786)
!1959 = !DILocation(line: 58, column: 27, scope: !1786)
!1960 = !DILocation(line: 58, column: 36, scope: !1786)
!1961 = !DILocation(line: 58, column: 40, scope: !1786)
!1962 = !DILocation(line: 58, column: 38, scope: !1786)
!1963 = !DILocation(line: 58, column: 34, scope: !1786)
!1964 = !DILocation(line: 59, column: 9, scope: !1965)
!1965 = distinct !DILexicalBlock(scope: !1786, file: !993, line: 59, column: 9)
!1966 = !DILocation(line: 59, column: 13, scope: !1965)
!1967 = !DILocation(line: 59, column: 9, scope: !1786)
!1968 = !DILocation(line: 60, column: 19, scope: !1965)
!1969 = !DILocation(line: 60, column: 32, scope: !1965)
!1970 = !DILocation(line: 60, column: 30, scope: !1965)
!1971 = !DILocation(line: 60, column: 23, scope: !1965)
!1972 = !DILocation(line: 60, column: 17, scope: !1965)
!1973 = !DILocation(line: 60, column: 11, scope: !1965)
!1974 = !DILocation(line: 60, column: 7, scope: !1965)
!1975 = !DILocation(line: 62, column: 11, scope: !1965)
!1976 = !DILocation(line: 63, column: 32, scope: !1786)
!1977 = !DILocation(line: 63, column: 30, scope: !1786)
!1978 = !DILocation(line: 63, column: 23, scope: !1786)
!1979 = !DILocation(line: 63, column: 18, scope: !1786)
!1980 = !DILocation(line: 63, column: 5, scope: !1786)
!1981 = !DILocation(line: 63, column: 13, scope: !1786)
!1982 = !DILocation(line: 63, column: 11, scope: !1786)
!1983 = !DILocation(line: 63, column: 16, scope: !1786)
!1984 = !DILocation(line: 64, column: 3, scope: !1786)
!1985 = !DILocation(line: 55, column: 27, scope: !1787)
!1986 = !DILocation(line: 55, column: 3, scope: !1787)
!1987 = distinct !{!1987, !1944, !1988, !1693}
!1988 = !DILocation(line: 64, column: 3, scope: !1784)
!1989 = !DILocation(line: 65, column: 1, scope: !1762)
!1990 = distinct !DISubprogram(name: "color", linkageName: "_Z5colorPhiiff", scope: !993, file: !993, line: 68, type: !1991, scopeLine: 69, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !1993)
!1991 = !DISubroutineType(types: !1992)
!1992 = !{null, !1765, !4, !4, !3, !3}
!1993 = !{!1994, !1995, !1996, !1997, !1998, !1999, !2000, !2001, !2004, !2005}
!1994 = !DILocalVariable(name: "pix", arg: 1, scope: !1990, file: !993, line: 68, type: !1765)
!1995 = !DILocalVariable(name: "size", arg: 2, scope: !1990, file: !993, line: 68, type: !4)
!1996 = !DILocalVariable(name: "half_size", arg: 3, scope: !1990, file: !993, line: 68, type: !4)
!1997 = !DILocalVariable(name: "range", arg: 4, scope: !1990, file: !993, line: 68, type: !3)
!1998 = !DILocalVariable(name: "truerange", arg: 5, scope: !1990, file: !993, line: 68, type: !3)
!1999 = !DILocalVariable(name: "y", scope: !1990, file: !993, line: 70, type: !4)
!2000 = !DILocalVariable(name: "x", scope: !1990, file: !993, line: 71, type: !4)
!2001 = !DILocalVariable(name: "fx", scope: !2002, file: !993, line: 74, type: !3)
!2002 = distinct !DILexicalBlock(scope: !2003, file: !993, line: 73, column: 29)
!2003 = distinct !DILexicalBlock(scope: !1990, file: !993, line: 73, column: 7)
!2004 = !DILocalVariable(name: "fy", scope: !2002, file: !993, line: 75, type: !3)
!2005 = !DILocalVariable(name: "idx", scope: !2002, file: !993, line: 77, type: !389)
!2006 = !DILocation(line: 68, column: 20, scope: !1990)
!2007 = !DILocation(line: 68, column: 29, scope: !1990)
!2008 = !DILocation(line: 68, column: 39, scope: !1990)
!2009 = !DILocation(line: 68, column: 56, scope: !1990)
!2010 = !DILocation(line: 68, column: 69, scope: !1990)
!2011 = !DILocation(line: 70, column: 7, scope: !1990)
!2012 = !DILocation(line: 276, column: 58, scope: !2013, inlinedAt: !2017)
!2013 = distinct !DISubprogram(name: "__hip_get_block_dim_y", linkageName: "_ZL21__hip_get_block_dim_yv", scope: !2014, file: !2014, line: 276, type: !2015, scopeLine: 276, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0)
!2014 = !DIFile(filename: "/opt/rocm-6.4.2/include/hip/amd_detail/amd_hip_runtime.h", directory: "", checksumkind: CSK_MD5, checksum: "38097f6211bac4e19f9ae3395b411f76")
!2015 = !DISubroutineType(types: !2016)
!2016 = !{!13}
!2017 = distinct !DILocation(line: 310, column: 3, scope: !2018, inlinedAt: !2030)
!2018 = distinct !DISubprogram(name: "__get_y", linkageName: "_ZN24__hip_builtin_blockDim_t7__get_yEv", scope: !2019, file: !2014, line: 310, type: !2015, scopeLine: 310, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, declaration: !2022)
!2019 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__hip_builtin_blockDim_t", file: !2014, line: 308, size: 8, flags: DIFlagTypePassByValue, elements: !2020, identifier: "_ZTS24__hip_builtin_blockDim_t")
!2020 = !{!2021, !2022, !2023, !2024}
!2021 = !DISubprogram(name: "__get_x", linkageName: "_ZN24__hip_builtin_blockDim_t7__get_xEv", scope: !2019, file: !2014, line: 309, type: !2015, scopeLine: 309, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!2022 = !DISubprogram(name: "__get_y", linkageName: "_ZN24__hip_builtin_blockDim_t7__get_yEv", scope: !2019, file: !2014, line: 310, type: !2015, scopeLine: 310, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!2023 = !DISubprogram(name: "__get_z", linkageName: "_ZN24__hip_builtin_blockDim_t7__get_zEv", scope: !2019, file: !2014, line: 311, type: !2015, scopeLine: 311, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!2024 = !DISubprogram(name: "operator dim3", linkageName: "_ZNK24__hip_builtin_blockDim_tcv4dim3Ev", scope: !2019, file: !2014, line: 313, type: !2025, scopeLine: 313, flags: DIFlagPrototyped, spFlags: 0)
!2025 = !DISubroutineType(types: !2026)
!2026 = !{!2027, !2028}
!2027 = !DIDerivedType(tag: DW_TAG_typedef, name: "dim3", file: !6, line: 1186, baseType: !5)
!2028 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2029, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!2029 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2019)
!2030 = distinct !DILocation(line: 70, column: 11, scope: !1990)
!2031 = !DILocation(line: 271, column: 58, scope: !2032, inlinedAt: !2033)
!2032 = distinct !DISubprogram(name: "__hip_get_block_idx_y", linkageName: "_ZL21__hip_get_block_idx_yv", scope: !2014, file: !2014, line: 271, type: !2015, scopeLine: 271, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0)
!2033 = distinct !DILocation(line: 301, column: 3, scope: !2034, inlinedAt: !2045)
!2034 = distinct !DISubprogram(name: "__get_y", linkageName: "_ZN24__hip_builtin_blockIdx_t7__get_yEv", scope: !2035, file: !2014, line: 301, type: !2015, scopeLine: 301, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, declaration: !2038)
!2035 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__hip_builtin_blockIdx_t", file: !2014, line: 299, size: 8, flags: DIFlagTypePassByValue, elements: !2036, identifier: "_ZTS24__hip_builtin_blockIdx_t")
!2036 = !{!2037, !2038, !2039, !2040}
!2037 = !DISubprogram(name: "__get_x", linkageName: "_ZN24__hip_builtin_blockIdx_t7__get_xEv", scope: !2035, file: !2014, line: 300, type: !2015, scopeLine: 300, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!2038 = !DISubprogram(name: "__get_y", linkageName: "_ZN24__hip_builtin_blockIdx_t7__get_yEv", scope: !2035, file: !2014, line: 301, type: !2015, scopeLine: 301, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!2039 = !DISubprogram(name: "__get_z", linkageName: "_ZN24__hip_builtin_blockIdx_t7__get_zEv", scope: !2035, file: !2014, line: 302, type: !2015, scopeLine: 302, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!2040 = !DISubprogram(name: "operator dim3", linkageName: "_ZNK24__hip_builtin_blockIdx_tcv4dim3Ev", scope: !2035, file: !2014, line: 304, type: !2041, scopeLine: 304, flags: DIFlagPrototyped, spFlags: 0)
!2041 = !DISubroutineType(types: !2042)
!2042 = !{!2027, !2043}
!2043 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2044, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!2044 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2035)
!2045 = distinct !DILocation(line: 70, column: 24, scope: !1990)
!2046 = !DILocation(line: 70, column: 22, scope: !1990)
!2047 = !DILocation(line: 266, column: 59, scope: !2048, inlinedAt: !2049)
!2048 = distinct !DISubprogram(name: "__hip_get_thread_idx_y", linkageName: "_ZL22__hip_get_thread_idx_yv", scope: !2014, file: !2014, line: 266, type: !2015, scopeLine: 266, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0)
!2049 = distinct !DILocation(line: 292, column: 3, scope: !2050, inlinedAt: !2061)
!2050 = distinct !DISubprogram(name: "__get_y", linkageName: "_ZN25__hip_builtin_threadIdx_t7__get_yEv", scope: !2051, file: !2014, line: 292, type: !2015, scopeLine: 292, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, declaration: !2054)
!2051 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__hip_builtin_threadIdx_t", file: !2014, line: 290, size: 8, flags: DIFlagTypePassByValue, elements: !2052, identifier: "_ZTS25__hip_builtin_threadIdx_t")
!2052 = !{!2053, !2054, !2055, !2056}
!2053 = !DISubprogram(name: "__get_x", linkageName: "_ZN25__hip_builtin_threadIdx_t7__get_xEv", scope: !2051, file: !2014, line: 291, type: !2015, scopeLine: 291, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!2054 = !DISubprogram(name: "__get_y", linkageName: "_ZN25__hip_builtin_threadIdx_t7__get_yEv", scope: !2051, file: !2014, line: 292, type: !2015, scopeLine: 292, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!2055 = !DISubprogram(name: "__get_z", linkageName: "_ZN25__hip_builtin_threadIdx_t7__get_zEv", scope: !2051, file: !2014, line: 293, type: !2015, scopeLine: 293, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!2056 = !DISubprogram(name: "operator dim3", linkageName: "_ZNK25__hip_builtin_threadIdx_tcv4dim3Ev", scope: !2051, file: !2014, line: 295, type: !2057, scopeLine: 295, flags: DIFlagPrototyped, spFlags: 0)
!2057 = !DISubroutineType(types: !2058)
!2058 = !{!2027, !2059}
!2059 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2060, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!2060 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2051)
!2061 = distinct !DILocation(line: 70, column: 37, scope: !1990)
!2062 = !DILocation(line: 70, column: 35, scope: !1990)
!2063 = !DILocation(line: 71, column: 7, scope: !1990)
!2064 = !DILocation(line: 275, column: 58, scope: !2065, inlinedAt: !2066)
!2065 = distinct !DISubprogram(name: "__hip_get_block_dim_x", linkageName: "_ZL21__hip_get_block_dim_xv", scope: !2014, file: !2014, line: 275, type: !2015, scopeLine: 275, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0)
!2066 = distinct !DILocation(line: 309, column: 3, scope: !2067, inlinedAt: !2068)
!2067 = distinct !DISubprogram(name: "__get_x", linkageName: "_ZN24__hip_builtin_blockDim_t7__get_xEv", scope: !2019, file: !2014, line: 309, type: !2015, scopeLine: 309, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, declaration: !2021)
!2068 = distinct !DILocation(line: 71, column: 11, scope: !1990)
!2069 = !DILocation(line: 270, column: 58, scope: !2070, inlinedAt: !2071)
!2070 = distinct !DISubprogram(name: "__hip_get_block_idx_x", linkageName: "_ZL21__hip_get_block_idx_xv", scope: !2014, file: !2014, line: 270, type: !2015, scopeLine: 270, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0)
!2071 = distinct !DILocation(line: 300, column: 3, scope: !2072, inlinedAt: !2073)
!2072 = distinct !DISubprogram(name: "__get_x", linkageName: "_ZN24__hip_builtin_blockIdx_t7__get_xEv", scope: !2035, file: !2014, line: 300, type: !2015, scopeLine: 300, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, declaration: !2037)
!2073 = distinct !DILocation(line: 71, column: 24, scope: !1990)
!2074 = !DILocation(line: 71, column: 22, scope: !1990)
!2075 = !DILocation(line: 265, column: 59, scope: !2076, inlinedAt: !2077)
!2076 = distinct !DISubprogram(name: "__hip_get_thread_idx_x", linkageName: "_ZL22__hip_get_thread_idx_xv", scope: !2014, file: !2014, line: 265, type: !2015, scopeLine: 265, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0)
!2077 = distinct !DILocation(line: 291, column: 3, scope: !2078, inlinedAt: !2079)
!2078 = distinct !DISubprogram(name: "__get_x", linkageName: "_ZN25__hip_builtin_threadIdx_t7__get_xEv", scope: !2051, file: !2014, line: 291, type: !2015, scopeLine: 291, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, declaration: !2053)
!2079 = distinct !DILocation(line: 71, column: 37, scope: !1990)
!2080 = !DILocation(line: 71, column: 35, scope: !1990)
!2081 = !DILocation(line: 73, column: 7, scope: !2003)
!2082 = !DILocation(line: 73, column: 11, scope: !2003)
!2083 = !DILocation(line: 73, column: 9, scope: !2003)
!2084 = !DILocation(line: 73, column: 16, scope: !2003)
!2085 = !DILocation(line: 73, column: 19, scope: !2003)
!2086 = !DILocation(line: 73, column: 23, scope: !2003)
!2087 = !DILocation(line: 73, column: 21, scope: !2003)
!2088 = !DILocation(line: 73, column: 7, scope: !1990)
!2089 = !DILocation(line: 74, column: 11, scope: !2002)
!2090 = !DILocation(line: 74, column: 23, scope: !2002)
!2091 = !DILocation(line: 74, column: 34, scope: !2002)
!2092 = !DILocation(line: 74, column: 25, scope: !2002)
!2093 = !DILocation(line: 74, column: 46, scope: !2002)
!2094 = !DILocation(line: 74, column: 44, scope: !2002)
!2095 = !DILocation(line: 74, column: 54, scope: !2002)
!2096 = !DILocation(line: 74, column: 52, scope: !2002)
!2097 = !DILocation(line: 75, column: 11, scope: !2002)
!2098 = !DILocation(line: 75, column: 23, scope: !2002)
!2099 = !DILocation(line: 75, column: 34, scope: !2002)
!2100 = !DILocation(line: 75, column: 25, scope: !2002)
!2101 = !DILocation(line: 75, column: 46, scope: !2002)
!2102 = !DILocation(line: 75, column: 44, scope: !2002)
!2103 = !DILocation(line: 75, column: 54, scope: !2002)
!2104 = !DILocation(line: 75, column: 52, scope: !2002)
!2105 = !DILocation(line: 76, column: 9, scope: !2106)
!2106 = distinct !DILexicalBlock(scope: !2002, file: !993, line: 76, column: 9)
!2107 = !DILocation(line: 76, column: 14, scope: !2106)
!2108 = !DILocation(line: 76, column: 11, scope: !2106)
!2109 = !DILocation(line: 76, column: 24, scope: !2106)
!2110 = !DILocation(line: 76, column: 27, scope: !2106)
!2111 = !DILocation(line: 76, column: 32, scope: !2106)
!2112 = !DILocation(line: 76, column: 29, scope: !2106)
!2113 = !DILocation(line: 76, column: 9, scope: !2002)
!2114 = !DILocation(line: 76, column: 43, scope: !2106)
!2115 = !DILocation(line: 77, column: 12, scope: !2002)
!2116 = !DILocation(line: 77, column: 19, scope: !2002)
!2117 = !DILocation(line: 77, column: 23, scope: !2002)
!2118 = !DILocation(line: 77, column: 21, scope: !2002)
!2119 = !DILocation(line: 77, column: 30, scope: !2002)
!2120 = !DILocation(line: 77, column: 28, scope: !2002)
!2121 = !DILocation(line: 77, column: 33, scope: !2002)
!2122 = !DILocation(line: 77, column: 18, scope: !2002)
!2123 = !DILocation(line: 78, column: 18, scope: !2002)
!2124 = !DILocation(line: 78, column: 21, scope: !2002)
!2125 = !DILocation(line: 78, column: 20, scope: !2002)
!2126 = !DILocation(line: 78, column: 32, scope: !2002)
!2127 = !DILocation(line: 78, column: 35, scope: !2002)
!2128 = !DILocation(line: 78, column: 34, scope: !2002)
!2129 = !DILocation(line: 78, column: 46, scope: !2002)
!2130 = !DILocation(line: 78, column: 50, scope: !2002)
!2131 = !DILocation(line: 78, column: 49, scope: !2002)
!2132 = !DILocation(line: 78, column: 5, scope: !2002)
!2133 = !DILocation(line: 79, column: 3, scope: !2002)
!2134 = !DILocation(line: 80, column: 1, scope: !1990)
!2135 = !{float 2.500000e+00}
!2136 = !{!2137, !2137, i64 0}
!2137 = !{!"bool", !2138, i64 0}
!2138 = !{!"omnipotent char", !2139, i64 0}
!2139 = !{!"Simple C/C++ TBAA"}
!2140 = !{i8 0, i8 2}
!2141 = !{}
!2142 = !{!2143, !2143, i64 0}
!2143 = !{!"int", !2138, i64 0}
!2144 = !{!2145, !2145, i64 0}
!2145 = !{!"long", !2138, i64 0}
!2146 = !{!2147, !2148, i64 0}
!2147 = !{!"", !2148, i64 0, !2148, i64 8, !2149, i64 16, !2145, i64 24, !2145, i64 32, !2145, i64 40}
!2148 = !{!"any pointer", !2138, i64 0}
!2149 = !{!"hsa_signal_s", !2145, i64 0}
!2150 = !{!2147, !2145, i64 40}
!2151 = !{!2147, !2148, i64 8}
!2152 = !{!2153, !2143, i64 16}
!2153 = !{!"", !2145, i64 0, !2145, i64 8, !2143, i64 16, !2143, i64 20}
!2154 = !{!2153, !2145, i64 8}
!2155 = !{!2153, !2143, i64 20}
!2156 = !{!2153, !2145, i64 0}
!2157 = !{!2158, !2145, i64 16}
!2158 = !{!"amd_signal_s", !2145, i64 0, !2138, i64 8, !2145, i64 16, !2143, i64 24, !2143, i64 28, !2145, i64 32, !2145, i64 40, !2138, i64 48, !2138, i64 56}
!2159 = !{!2158, !2143, i64 24}
!2160 = !{!2138, !2138, i64 0}
!2161 = !{i16 1, i16 1025}
!2162 = !{!2163, !2143, i64 12}
!2163 = !{!"hsa_kernel_dispatch_packet_s", !2164, i64 0, !2164, i64 2, !2164, i64 4, !2164, i64 6, !2164, i64 8, !2164, i64 10, !2143, i64 12, !2143, i64 16, !2143, i64 20, !2143, i64 24, !2143, i64 28, !2138, i64 32, !2148, i64 40, !2145, i64 48, !2149, i64 56}
!2164 = !{!"short", !2138, i64 0}
!2165 = !{!2164, !2164, i64 0}
!2166 = !{!2163, !2143, i64 16}
!2167 = !{!2163, !2143, i64 20}
