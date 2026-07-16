; ModuleID = '/ccs/home/mdunlavy/GPU_Fault_Injection/HeCBench/src/dense-embedding-hip/main.cu'
source_filename = "/ccs/home/mdunlavy/GPU_Fault_Injection/HeCBench/src/dense-embedding-hip/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8:9"
target triple = "amdgcn-amd-amdhsa"

%0 = type { i64, i64, i32, i32 }
%1 = type { [64 x [8 x i64]] }
%struct.__hip_builtin_blockIdx_t = type { i8 }
%struct.__hip_builtin_blockDim_t = type { i8 }
%struct.__hip_builtin_threadIdx_t = type { i8 }

$_Z11dense_esuhmIfEvPKT_S2_PS0_iPKi = comdat any

$_Z12dense_esuhm2IfEvPKT_S2_PS0_iPKi = comdat any

$_Z12dense_esuhm3IfEvPKT_S2_PS0_iPKi = comdat any

@__const.__assert_fail.fmt = private unnamed_addr addrspace(4) constant [47 x i8] c"%s:%u: %s: Device-side assertion `%s' failed.\0A\00", align 16
@blockIdx = extern_weak dso_local protected addrspace(1) global %struct.__hip_builtin_blockIdx_t, align 1
@blockDim = extern_weak dso_local protected addrspace(1) global %struct.__hip_builtin_blockDim_t, align 1
@threadIdx = extern_weak dso_local protected addrspace(1) global %struct.__hip_builtin_threadIdx_t, align 1
@__hip_cuid_937fa41b0ccec12b = addrspace(1) global i8 0
@llvm.compiler.used = appending addrspace(1) global [1 x ptr] [ptr addrspacecast (ptr addrspace(1) @__hip_cuid_937fa41b0ccec12b to ptr)], section "llvm.metadata"
@__oclc_ISA_version = internal local_unnamed_addr addrspace(4) constant i32 9010, align 4
@__oclc_ABI_version = weak_odr hidden local_unnamed_addr addrspace(4) constant i32 600

; Function Attrs: convergent mustprogress noinline noreturn nounwind optnone
define weak void @__cxa_pure_virtual() #0 !dbg !1573 {
  call void @llvm.trap(), !dbg !1575
  unreachable, !dbg !1576
}

; Function Attrs: cold noreturn nounwind memory(inaccessiblemem: write)
declare void @llvm.trap() #1

; Function Attrs: convergent mustprogress noinline noreturn nounwind optnone
define weak void @__cxa_deleted_virtual() #0 !dbg !1577 {
  call void @llvm.trap(), !dbg !1578
  unreachable, !dbg !1579
}

; Function Attrs: convergent mustprogress noinline nounwind optnone
define weak hidden void @__assert_fail(ptr noundef %0, ptr noundef %1, i32 noundef %2, ptr noundef %3) #2 !dbg !1580 {
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
    #dbg_declare(ptr addrspace(5) %5, !1585, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(ptr)), !1603)
  store ptr %1, ptr %17, align 8
    #dbg_declare(ptr addrspace(5) %6, !1586, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(ptr)), !1604)
  store i32 %2, ptr %18, align 4
    #dbg_declare(ptr addrspace(5) %7, !1587, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1605)
  store ptr %3, ptr %19, align 8
    #dbg_declare(ptr addrspace(5) %8, !1588, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(ptr)), !1606)
    #dbg_declare(ptr addrspace(5) %9, !1589, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref([47 x i8])), !1607)
  call void @llvm.memcpy.p0.p4.i64(ptr align 16 %20, ptr addrspace(4) align 16 @__const.__assert_fail.fmt, i64 47, i1 false), !dbg !1607
    #dbg_declare(ptr addrspace(5) %10, !1593, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i64)), !1608)
  %27 = call i64 @__ockl_fprintf_stderr_begin() #12, !dbg !1609
  store i64 %27, ptr %21, align 8, !dbg !1608
    #dbg_declare(ptr addrspace(5) %11, !1594, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1610)
  store i32 0, ptr %22, align 4, !dbg !1610
  br label %28, !dbg !1611

28:                                               ; preds = %4
    #dbg_declare(ptr addrspace(5) %12, !1595, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(ptr)), !1612)
  %29 = getelementptr inbounds [47 x i8], ptr %20, i64 0, i64 0, !dbg !1612
  store ptr %29, ptr %23, align 8, !dbg !1612
  br label %30, !dbg !1612

30:                                               ; preds = %35, %28
  %31 = load ptr, ptr %23, align 8, !dbg !1612
  %32 = getelementptr inbounds i8, ptr %31, i32 1, !dbg !1612
  store ptr %32, ptr %23, align 8, !dbg !1612
  %33 = load i8, ptr %31, align 1, !dbg !1612
  %34 = icmp ne i8 %33, 0, !dbg !1612
  br i1 %34, label %35, label %36, !dbg !1612

35:                                               ; preds = %30
  br label %30, !dbg !1612, !llvm.loop !1613

36:                                               ; preds = %30
  %37 = load ptr, ptr %23, align 8, !dbg !1612
  %38 = getelementptr inbounds [47 x i8], ptr %20, i64 0, i64 0, !dbg !1612
  %39 = ptrtoint ptr %37 to i64, !dbg !1612
  %40 = ptrtoint ptr %38 to i64, !dbg !1612
  %41 = sub i64 %39, %40, !dbg !1612
  %42 = trunc i64 %41 to i32, !dbg !1612
  store i32 %42, ptr %22, align 4, !dbg !1612
  br label %43, !dbg !1612

43:                                               ; preds = %36
  %44 = load i64, ptr %21, align 8, !dbg !1615
  %45 = getelementptr inbounds [47 x i8], ptr %20, i64 0, i64 0, !dbg !1616
  %46 = load i32, ptr %22, align 4, !dbg !1617
  %47 = sext i32 %46 to i64, !dbg !1617
  %48 = call i64 @__ockl_fprintf_append_string_n(i64 noundef %44, ptr noundef %45, i64 noundef %47, i32 noundef 0) #12, !dbg !1618
  store i64 %48, ptr %21, align 8, !dbg !1619
  br label %49, !dbg !1620

49:                                               ; preds = %43
    #dbg_declare(ptr addrspace(5) %13, !1597, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(ptr)), !1621)
  %50 = load ptr, ptr %17, align 8, !dbg !1621
  store ptr %50, ptr %24, align 8, !dbg !1621
  br label %51, !dbg !1621

51:                                               ; preds = %56, %49
  %52 = load ptr, ptr %24, align 8, !dbg !1621
  %53 = getelementptr inbounds i8, ptr %52, i32 1, !dbg !1621
  store ptr %53, ptr %24, align 8, !dbg !1621
  %54 = load i8, ptr %52, align 1, !dbg !1621
  %55 = icmp ne i8 %54, 0, !dbg !1621
  br i1 %55, label %56, label %57, !dbg !1621

56:                                               ; preds = %51
  br label %51, !dbg !1621, !llvm.loop !1622

57:                                               ; preds = %51
  %58 = load ptr, ptr %24, align 8, !dbg !1621
  %59 = load ptr, ptr %17, align 8, !dbg !1621
  %60 = ptrtoint ptr %58 to i64, !dbg !1621
  %61 = ptrtoint ptr %59 to i64, !dbg !1621
  %62 = sub i64 %60, %61, !dbg !1621
  %63 = trunc i64 %62 to i32, !dbg !1621
  store i32 %63, ptr %22, align 4, !dbg !1621
  br label %64, !dbg !1621

64:                                               ; preds = %57
  %65 = load i64, ptr %21, align 8, !dbg !1623
  %66 = load ptr, ptr %17, align 8, !dbg !1624
  %67 = load i32, ptr %22, align 4, !dbg !1625
  %68 = sext i32 %67 to i64, !dbg !1625
  %69 = call i64 @__ockl_fprintf_append_string_n(i64 noundef %65, ptr noundef %66, i64 noundef %68, i32 noundef 0) #12, !dbg !1626
  store i64 %69, ptr %21, align 8, !dbg !1627
  %70 = load i64, ptr %21, align 8, !dbg !1628
  %71 = load i32, ptr %18, align 4, !dbg !1629
  %72 = zext i32 %71 to i64, !dbg !1629
  %73 = call i64 @__ockl_fprintf_append_args(i64 noundef %70, i32 noundef 1, i64 noundef %72, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i32 noundef 0) #12, !dbg !1630
  store i64 %73, ptr %21, align 8, !dbg !1631
  br label %74, !dbg !1632

74:                                               ; preds = %64
    #dbg_declare(ptr addrspace(5) %14, !1599, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(ptr)), !1633)
  %75 = load ptr, ptr %19, align 8, !dbg !1633
  store ptr %75, ptr %25, align 8, !dbg !1633
  br label %76, !dbg !1633

76:                                               ; preds = %81, %74
  %77 = load ptr, ptr %25, align 8, !dbg !1633
  %78 = getelementptr inbounds i8, ptr %77, i32 1, !dbg !1633
  store ptr %78, ptr %25, align 8, !dbg !1633
  %79 = load i8, ptr %77, align 1, !dbg !1633
  %80 = icmp ne i8 %79, 0, !dbg !1633
  br i1 %80, label %81, label %82, !dbg !1633

81:                                               ; preds = %76
  br label %76, !dbg !1633, !llvm.loop !1634

82:                                               ; preds = %76
  %83 = load ptr, ptr %25, align 8, !dbg !1633
  %84 = load ptr, ptr %19, align 8, !dbg !1633
  %85 = ptrtoint ptr %83 to i64, !dbg !1633
  %86 = ptrtoint ptr %84 to i64, !dbg !1633
  %87 = sub i64 %85, %86, !dbg !1633
  %88 = trunc i64 %87 to i32, !dbg !1633
  store i32 %88, ptr %22, align 4, !dbg !1633
  br label %89, !dbg !1633

89:                                               ; preds = %82
  %90 = load i64, ptr %21, align 8, !dbg !1635
  %91 = load ptr, ptr %19, align 8, !dbg !1636
  %92 = load i32, ptr %22, align 4, !dbg !1637
  %93 = sext i32 %92 to i64, !dbg !1637
  %94 = call i64 @__ockl_fprintf_append_string_n(i64 noundef %90, ptr noundef %91, i64 noundef %93, i32 noundef 0) #12, !dbg !1638
  store i64 %94, ptr %21, align 8, !dbg !1639
  br label %95, !dbg !1640

95:                                               ; preds = %89
    #dbg_declare(ptr addrspace(5) %15, !1601, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(ptr)), !1641)
  %96 = load ptr, ptr %16, align 8, !dbg !1641
  store ptr %96, ptr %26, align 8, !dbg !1641
  br label %97, !dbg !1641

97:                                               ; preds = %102, %95
  %98 = load ptr, ptr %26, align 8, !dbg !1641
  %99 = getelementptr inbounds i8, ptr %98, i32 1, !dbg !1641
  store ptr %99, ptr %26, align 8, !dbg !1641
  %100 = load i8, ptr %98, align 1, !dbg !1641
  %101 = icmp ne i8 %100, 0, !dbg !1641
  br i1 %101, label %102, label %103, !dbg !1641

102:                                              ; preds = %97
  br label %97, !dbg !1641, !llvm.loop !1642

103:                                              ; preds = %97
  %104 = load ptr, ptr %26, align 8, !dbg !1641
  %105 = load ptr, ptr %16, align 8, !dbg !1641
  %106 = ptrtoint ptr %104 to i64, !dbg !1641
  %107 = ptrtoint ptr %105 to i64, !dbg !1641
  %108 = sub i64 %106, %107, !dbg !1641
  %109 = trunc i64 %108 to i32, !dbg !1641
  store i32 %109, ptr %22, align 4, !dbg !1641
  br label %110, !dbg !1641

110:                                              ; preds = %103
  %111 = load i64, ptr %21, align 8, !dbg !1643
  %112 = load ptr, ptr %16, align 8, !dbg !1644
  %113 = load i32, ptr %22, align 4, !dbg !1645
  %114 = sext i32 %113 to i64, !dbg !1645
  %115 = call i64 @__ockl_fprintf_append_string_n(i64 noundef %111, ptr noundef %112, i64 noundef %114, i32 noundef 1) #12, !dbg !1646
  call void @llvm.trap(), !dbg !1647
  ret void, !dbg !1648
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p4.i64(ptr noalias nocapture writeonly, ptr addrspace(4) noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: convergent mustprogress noinline nounwind optnone
define weak hidden void @__assertfail() #2 !dbg !1649 {
  call void @llvm.trap(), !dbg !1650
  ret void, !dbg !1651
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define protected amdgpu_kernel void @_Z11dense_esuhmIfEvPKT_S2_PS0_iPKi(ptr addrspace(1) noalias noundef %0, ptr addrspace(1) noalias noundef %1, ptr addrspace(1) noundef %2, i32 noundef %3, ptr addrspace(1) noalias noundef %4) #4 comdat !dbg !1652 {
  %6 = alloca i32, align 4, addrspace(5)
  %7 = alloca i32, align 4, addrspace(5)
  %8 = alloca i32, align 4, addrspace(5)
  %9 = alloca i32, align 4, addrspace(5)
  %10 = alloca i32, align 4, addrspace(5)
  %11 = alloca i32, align 4, addrspace(5)
  %12 = alloca ptr, align 8, addrspace(5)
  %13 = alloca ptr, align 8, addrspace(5)
  %14 = alloca ptr, align 8, addrspace(5)
  %15 = alloca ptr, align 8, addrspace(5)
  %16 = alloca ptr, align 8, addrspace(5)
  %17 = alloca ptr, align 8, addrspace(5)
  %18 = alloca ptr, align 8, addrspace(5)
  %19 = alloca i32, align 4, addrspace(5)
  %20 = alloca ptr, align 8, addrspace(5)
  %21 = alloca i32, align 4, addrspace(5)
  %22 = alloca i32, align 4, addrspace(5)
  %23 = alloca i32, align 4, addrspace(5)
  %24 = alloca i32, align 4, addrspace(5)
  %25 = alloca i32, align 4, addrspace(5)
  %26 = alloca float, align 4, addrspace(5)
  %27 = alloca i32, align 4, addrspace(5)
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
  %41 = addrspacecast ptr addrspace(5) %25 to ptr
  %42 = addrspacecast ptr addrspace(5) %26 to ptr
  %43 = addrspacecast ptr addrspace(5) %27 to ptr
  %44 = addrspacecast ptr addrspace(1) %0 to ptr
  store ptr %44, ptr %28, align 8
  %45 = load ptr, ptr %28, align 8
  %46 = addrspacecast ptr addrspace(1) %1 to ptr
  store ptr %46, ptr %29, align 8
  %47 = load ptr, ptr %29, align 8
  %48 = addrspacecast ptr addrspace(1) %2 to ptr
  store ptr %48, ptr %30, align 8
  %49 = load ptr, ptr %30, align 8
  %50 = addrspacecast ptr addrspace(1) %4 to ptr
  store ptr %50, ptr %31, align 8
  %51 = load ptr, ptr %31, align 8
  store ptr %45, ptr %32, align 8
    #dbg_declare(ptr addrspace(5) %16, !1662, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(ptr)), !1680)
  store ptr %47, ptr %33, align 8
    #dbg_declare(ptr addrspace(5) %17, !1663, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(ptr)), !1681)
  store ptr %49, ptr %34, align 8
    #dbg_declare(ptr addrspace(5) %18, !1664, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(ptr)), !1682)
  store i32 %3, ptr %35, align 4
    #dbg_declare(ptr addrspace(5) %19, !1665, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1683)
  store ptr %51, ptr %36, align 8
    #dbg_declare(ptr addrspace(5) %20, !1666, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(ptr)), !1684)
    #dbg_declare(ptr addrspace(5) %21, !1667, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1685)
  %52 = addrspacecast ptr addrspace(5) %11 to ptr
  %53 = addrspacecast ptr addrspace(5) %8 to ptr
  %54 = call i64 @__ockl_get_group_id(i32 noundef 0) #13, !dbg !1686
  %55 = trunc i64 %54 to i32, !dbg !1686
  store i32 %55, ptr %37, align 4, !dbg !1685
    #dbg_declare(ptr addrspace(5) %22, !1668, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1705)
  %56 = addrspacecast ptr addrspace(5) %10 to ptr
  %57 = addrspacecast ptr addrspace(5) %7 to ptr
  %58 = call i64 @__ockl_get_local_size(i32 noundef 0) #13, !dbg !1706
  %59 = trunc i64 %58 to i32, !dbg !1706
  store i32 %59, ptr %38, align 4, !dbg !1705
    #dbg_declare(ptr addrspace(5) %23, !1669, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1721)
  %60 = addrspacecast ptr addrspace(5) %9 to ptr
  %61 = addrspacecast ptr addrspace(5) %6 to ptr
  %62 = call i64 @__ockl_get_local_id(i32 noundef 0) #13, !dbg !1722
  %63 = trunc i64 %62 to i32, !dbg !1722
  store i32 %63, ptr %39, align 4, !dbg !1721
    #dbg_declare(ptr addrspace(5) %24, !1670, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1737)
  %64 = load ptr, ptr %36, align 8, !dbg !1738
  %65 = load i32, ptr %37, align 4, !dbg !1739
  %66 = add nsw i32 %65, 1, !dbg !1740
  %67 = sext i32 %66 to i64, !dbg !1738
  %68 = getelementptr inbounds i32, ptr %64, i64 %67, !dbg !1738
  %69 = load i32, ptr %68, align 4, !dbg !1738
  %70 = load ptr, ptr %36, align 8, !dbg !1741
  %71 = load i32, ptr %37, align 4, !dbg !1742
  %72 = sext i32 %71 to i64, !dbg !1741
  %73 = getelementptr inbounds i32, ptr %70, i64 %72, !dbg !1741
  %74 = load i32, ptr %73, align 4, !dbg !1741
  %75 = sub nsw i32 %69, %74, !dbg !1743
  store i32 %75, ptr %40, align 4, !dbg !1737
    #dbg_declare(ptr addrspace(5) %25, !1671, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1744)
  %76 = load i32, ptr %39, align 4, !dbg !1745
  store i32 %76, ptr %41, align 4, !dbg !1744
  br label %77, !dbg !1746

77:                                               ; preds = %125, %5
  %78 = load i32, ptr %41, align 4, !dbg !1747
  %79 = load i32, ptr %35, align 4, !dbg !1748
  %80 = icmp slt i32 %78, %79, !dbg !1749
  br i1 %80, label %81, label %129, !dbg !1750

81:                                               ; preds = %77
    #dbg_declare(ptr addrspace(5) %26, !1673, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(float)), !1751)
  %82 = load ptr, ptr %33, align 8, !dbg !1752
  %83 = load i32, ptr %37, align 4, !dbg !1753
  %84 = load i32, ptr %35, align 4, !dbg !1754
  %85 = mul nsw i32 %83, %84, !dbg !1755
  %86 = load i32, ptr %41, align 4, !dbg !1756
  %87 = add nsw i32 %85, %86, !dbg !1757
  %88 = sext i32 %87 to i64, !dbg !1752
  %89 = getelementptr inbounds float, ptr %82, i64 %88, !dbg !1752
  %90 = load float, ptr %89, align 4, !dbg !1752
  store float %90, ptr %42, align 4, !dbg !1751
    #dbg_declare(ptr addrspace(5) %27, !1676, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1758)
  %91 = load i32, ptr %41, align 4, !dbg !1759
  store i32 %91, ptr %43, align 4, !dbg !1758
  br label %92, !dbg !1760

92:                                               ; preds = %120, %81
  %93 = load i32, ptr %43, align 4, !dbg !1761
  %94 = load i32, ptr %40, align 4, !dbg !1763
  %95 = icmp slt i32 %93, %94, !dbg !1764
  br i1 %95, label %96, label %124, !dbg !1765

96:                                               ; preds = %92
  %97 = load ptr, ptr %32, align 8, !dbg !1766
  %98 = load ptr, ptr %36, align 8, !dbg !1768
  %99 = load i32, ptr %37, align 4, !dbg !1769
  %100 = sext i32 %99 to i64, !dbg !1768
  %101 = getelementptr inbounds i32, ptr %98, i64 %100, !dbg !1768
  %102 = load i32, ptr %101, align 4, !dbg !1768
  %103 = load i32, ptr %43, align 4, !dbg !1770
  %104 = add nsw i32 %102, %103, !dbg !1771
  %105 = sext i32 %104 to i64, !dbg !1766
  %106 = getelementptr inbounds float, ptr %97, i64 %105, !dbg !1766
  %107 = load float, ptr %106, align 4, !dbg !1766
  %108 = load float, ptr %42, align 4, !dbg !1772
  %109 = fadd contract float %107, %108, !dbg !1773
  %110 = load ptr, ptr %34, align 8, !dbg !1774
  %111 = load ptr, ptr %36, align 8, !dbg !1775
  %112 = load i32, ptr %37, align 4, !dbg !1776
  %113 = sext i32 %112 to i64, !dbg !1775
  %114 = getelementptr inbounds i32, ptr %111, i64 %113, !dbg !1775
  %115 = load i32, ptr %114, align 4, !dbg !1775
  %116 = load i32, ptr %43, align 4, !dbg !1777
  %117 = add nsw i32 %115, %116, !dbg !1778
  %118 = sext i32 %117 to i64, !dbg !1774
  %119 = getelementptr inbounds float, ptr %110, i64 %118, !dbg !1774
  store float %109, ptr %119, align 4, !dbg !1779
  br label %120, !dbg !1780

120:                                              ; preds = %96
  %121 = load i32, ptr %35, align 4, !dbg !1781
  %122 = load i32, ptr %43, align 4, !dbg !1782
  %123 = add nsw i32 %122, %121, !dbg !1782
  store i32 %123, ptr %43, align 4, !dbg !1782
  br label %92, !dbg !1783, !llvm.loop !1784

124:                                              ; preds = %92
  br label %125, !dbg !1786

125:                                              ; preds = %124
  %126 = load i32, ptr %38, align 4, !dbg !1787
  %127 = load i32, ptr %41, align 4, !dbg !1788
  %128 = add nsw i32 %127, %126, !dbg !1788
  store i32 %128, ptr %41, align 4, !dbg !1788
  br label %77, !dbg !1789, !llvm.loop !1790

129:                                              ; preds = %77
  ret void, !dbg !1792
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define protected amdgpu_kernel void @_Z12dense_esuhm2IfEvPKT_S2_PS0_iPKi(ptr addrspace(1) noalias noundef %0, ptr addrspace(1) noalias noundef %1, ptr addrspace(1) noundef %2, i32 noundef %3, ptr addrspace(1) noalias noundef %4) #4 comdat !dbg !1793 {
  %6 = alloca i32, align 4, addrspace(5)
  %7 = alloca i32, align 4, addrspace(5)
  %8 = alloca i32, align 4, addrspace(5)
  %9 = alloca i32, align 4, addrspace(5)
  %10 = alloca i32, align 4, addrspace(5)
  %11 = alloca i32, align 4, addrspace(5)
  %12 = alloca ptr, align 8, addrspace(5)
  %13 = alloca ptr, align 8, addrspace(5)
  %14 = alloca ptr, align 8, addrspace(5)
  %15 = alloca ptr, align 8, addrspace(5)
  %16 = alloca ptr, align 8, addrspace(5)
  %17 = alloca ptr, align 8, addrspace(5)
  %18 = alloca ptr, align 8, addrspace(5)
  %19 = alloca i32, align 4, addrspace(5)
  %20 = alloca ptr, align 8, addrspace(5)
  %21 = alloca i32, align 4, addrspace(5)
  %22 = alloca i32, align 4, addrspace(5)
  %23 = alloca i32, align 4, addrspace(5)
  %24 = alloca i32, align 4, addrspace(5)
  %25 = alloca float, align 4, addrspace(5)
  %26 = alloca i32, align 4, addrspace(5)
  %27 = addrspacecast ptr addrspace(5) %12 to ptr
  %28 = addrspacecast ptr addrspace(5) %13 to ptr
  %29 = addrspacecast ptr addrspace(5) %14 to ptr
  %30 = addrspacecast ptr addrspace(5) %15 to ptr
  %31 = addrspacecast ptr addrspace(5) %16 to ptr
  %32 = addrspacecast ptr addrspace(5) %17 to ptr
  %33 = addrspacecast ptr addrspace(5) %18 to ptr
  %34 = addrspacecast ptr addrspace(5) %19 to ptr
  %35 = addrspacecast ptr addrspace(5) %20 to ptr
  %36 = addrspacecast ptr addrspace(5) %21 to ptr
  %37 = addrspacecast ptr addrspace(5) %22 to ptr
  %38 = addrspacecast ptr addrspace(5) %23 to ptr
  %39 = addrspacecast ptr addrspace(5) %24 to ptr
  %40 = addrspacecast ptr addrspace(5) %25 to ptr
  %41 = addrspacecast ptr addrspace(5) %26 to ptr
  %42 = addrspacecast ptr addrspace(1) %0 to ptr
  store ptr %42, ptr %27, align 8
  %43 = load ptr, ptr %27, align 8
  %44 = addrspacecast ptr addrspace(1) %1 to ptr
  store ptr %44, ptr %28, align 8
  %45 = load ptr, ptr %28, align 8
  %46 = addrspacecast ptr addrspace(1) %2 to ptr
  store ptr %46, ptr %29, align 8
  %47 = load ptr, ptr %29, align 8
  %48 = addrspacecast ptr addrspace(1) %4 to ptr
  store ptr %48, ptr %30, align 8
  %49 = load ptr, ptr %30, align 8
  store ptr %43, ptr %31, align 8
    #dbg_declare(ptr addrspace(5) %16, !1795, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(ptr)), !1810)
  store ptr %45, ptr %32, align 8
    #dbg_declare(ptr addrspace(5) %17, !1796, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(ptr)), !1811)
  store ptr %47, ptr %33, align 8
    #dbg_declare(ptr addrspace(5) %18, !1797, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(ptr)), !1812)
  store i32 %3, ptr %34, align 4
    #dbg_declare(ptr addrspace(5) %19, !1798, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1813)
  store ptr %49, ptr %35, align 8
    #dbg_declare(ptr addrspace(5) %20, !1799, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(ptr)), !1814)
    #dbg_declare(ptr addrspace(5) %21, !1800, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1815)
  %50 = addrspacecast ptr addrspace(5) %11 to ptr
  %51 = addrspacecast ptr addrspace(5) %8 to ptr
  %52 = call i64 @__ockl_get_group_id(i32 noundef 0) #13, !dbg !1816
  %53 = trunc i64 %52 to i32, !dbg !1816
  store i32 %53, ptr %36, align 4, !dbg !1815
    #dbg_declare(ptr addrspace(5) %22, !1801, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1819)
  %54 = load ptr, ptr %35, align 8, !dbg !1820
  %55 = load i32, ptr %36, align 4, !dbg !1821
  %56 = sext i32 %55 to i64, !dbg !1820
  %57 = getelementptr inbounds i32, ptr %54, i64 %56, !dbg !1820
  %58 = load i32, ptr %57, align 4, !dbg !1820
  store i32 %58, ptr %37, align 4, !dbg !1819
    #dbg_declare(ptr addrspace(5) %23, !1802, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1822)
  %59 = load ptr, ptr %35, align 8, !dbg !1823
  %60 = load i32, ptr %36, align 4, !dbg !1824
  %61 = add nsw i32 %60, 1, !dbg !1825
  %62 = sext i32 %61 to i64, !dbg !1823
  %63 = getelementptr inbounds i32, ptr %59, i64 %62, !dbg !1823
  %64 = load i32, ptr %63, align 4, !dbg !1823
  %65 = load i32, ptr %37, align 4, !dbg !1826
  %66 = sub nsw i32 %64, %65, !dbg !1827
  store i32 %66, ptr %38, align 4, !dbg !1822
    #dbg_declare(ptr addrspace(5) %24, !1803, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1828)
  %67 = addrspacecast ptr addrspace(5) %9 to ptr
  %68 = addrspacecast ptr addrspace(5) %6 to ptr
  %69 = call i64 @__ockl_get_local_id(i32 noundef 0) #13, !dbg !1829
  %70 = trunc i64 %69 to i32, !dbg !1829
  store i32 %70, ptr %39, align 4, !dbg !1828
  br label %71, !dbg !1832

71:                                               ; preds = %111, %5
  %72 = load i32, ptr %39, align 4, !dbg !1833
  %73 = load i32, ptr %34, align 4, !dbg !1834
  %74 = icmp slt i32 %72, %73, !dbg !1835
  br i1 %74, label %75, label %118, !dbg !1836

75:                                               ; preds = %71
    #dbg_declare(ptr addrspace(5) %25, !1805, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(float)), !1837)
  %76 = load ptr, ptr %32, align 8, !dbg !1838
  %77 = load i32, ptr %36, align 4, !dbg !1839
  %78 = load i32, ptr %34, align 4, !dbg !1840
  %79 = mul nsw i32 %77, %78, !dbg !1841
  %80 = load i32, ptr %39, align 4, !dbg !1842
  %81 = add nsw i32 %79, %80, !dbg !1843
  %82 = sext i32 %81 to i64, !dbg !1838
  %83 = getelementptr inbounds float, ptr %76, i64 %82, !dbg !1838
  %84 = load float, ptr %83, align 4, !dbg !1838
  store float %84, ptr %40, align 4, !dbg !1837
    #dbg_declare(ptr addrspace(5) %26, !1808, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1844)
  %85 = load i32, ptr %39, align 4, !dbg !1845
  store i32 %85, ptr %41, align 4, !dbg !1844
  br label %86, !dbg !1846

86:                                               ; preds = %106, %75
  %87 = load i32, ptr %41, align 4, !dbg !1847
  %88 = load i32, ptr %38, align 4, !dbg !1849
  %89 = icmp slt i32 %87, %88, !dbg !1850
  br i1 %89, label %90, label %110, !dbg !1851

90:                                               ; preds = %86
  %91 = load ptr, ptr %31, align 8, !dbg !1852
  %92 = load i32, ptr %37, align 4, !dbg !1854
  %93 = load i32, ptr %41, align 4, !dbg !1855
  %94 = add nsw i32 %92, %93, !dbg !1856
  %95 = sext i32 %94 to i64, !dbg !1852
  %96 = getelementptr inbounds float, ptr %91, i64 %95, !dbg !1852
  %97 = load float, ptr %96, align 4, !dbg !1852
  %98 = load float, ptr %40, align 4, !dbg !1857
  %99 = fadd contract float %97, %98, !dbg !1858
  %100 = load ptr, ptr %33, align 8, !dbg !1859
  %101 = load i32, ptr %37, align 4, !dbg !1860
  %102 = load i32, ptr %41, align 4, !dbg !1861
  %103 = add nsw i32 %101, %102, !dbg !1862
  %104 = sext i32 %103 to i64, !dbg !1859
  %105 = getelementptr inbounds float, ptr %100, i64 %104, !dbg !1859
  store float %99, ptr %105, align 4, !dbg !1863
  br label %106, !dbg !1864

106:                                              ; preds = %90
  %107 = load i32, ptr %34, align 4, !dbg !1865
  %108 = load i32, ptr %41, align 4, !dbg !1866
  %109 = add nsw i32 %108, %107, !dbg !1866
  store i32 %109, ptr %41, align 4, !dbg !1866
  br label %86, !dbg !1867, !llvm.loop !1868

110:                                              ; preds = %86
  br label %111, !dbg !1870

111:                                              ; preds = %110
  %112 = addrspacecast ptr addrspace(5) %10 to ptr
  %113 = addrspacecast ptr addrspace(5) %7 to ptr
  %114 = call i64 @__ockl_get_local_size(i32 noundef 0) #13, !dbg !1871
  %115 = trunc i64 %114 to i32, !dbg !1871
  %116 = load i32, ptr %39, align 4, !dbg !1874
  %117 = add i32 %116, %115, !dbg !1874
  store i32 %117, ptr %39, align 4, !dbg !1874
  br label %71, !dbg !1875, !llvm.loop !1876

118:                                              ; preds = %71
  ret void, !dbg !1878
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define protected amdgpu_kernel void @_Z12dense_esuhm3IfEvPKT_S2_PS0_iPKi(ptr addrspace(1) noalias noundef %0, ptr addrspace(1) noalias noundef %1, ptr addrspace(1) noundef %2, i32 noundef %3, ptr addrspace(1) noalias noundef %4) #4 comdat !dbg !1879 {
  %6 = alloca i32, align 4, addrspace(5)
  %7 = alloca i32, align 4, addrspace(5)
  %8 = alloca i32, align 4, addrspace(5)
  %9 = alloca i32, align 4, addrspace(5)
  %10 = alloca i32, align 4, addrspace(5)
  %11 = alloca i32, align 4, addrspace(5)
  %12 = alloca ptr, align 8, addrspace(5)
  %13 = alloca ptr, align 8, addrspace(5)
  %14 = alloca ptr, align 8, addrspace(5)
  %15 = alloca ptr, align 8, addrspace(5)
  %16 = alloca ptr, align 8, addrspace(5)
  %17 = alloca ptr, align 8, addrspace(5)
  %18 = alloca ptr, align 8, addrspace(5)
  %19 = alloca i32, align 4, addrspace(5)
  %20 = alloca ptr, align 8, addrspace(5)
  %21 = alloca i32, align 4, addrspace(5)
  %22 = alloca i32, align 4, addrspace(5)
  %23 = alloca i32, align 4, addrspace(5)
  %24 = alloca i32, align 4, addrspace(5)
  %25 = alloca i32, align 4, addrspace(5)
  %26 = alloca float, align 4, addrspace(5)
  %27 = alloca float, align 4, addrspace(5)
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
  %41 = addrspacecast ptr addrspace(5) %25 to ptr
  %42 = addrspacecast ptr addrspace(5) %26 to ptr
  %43 = addrspacecast ptr addrspace(5) %27 to ptr
  %44 = addrspacecast ptr addrspace(1) %0 to ptr
  store ptr %44, ptr %28, align 8
  %45 = load ptr, ptr %28, align 8
  %46 = addrspacecast ptr addrspace(1) %1 to ptr
  store ptr %46, ptr %29, align 8
  %47 = load ptr, ptr %29, align 8
  %48 = addrspacecast ptr addrspace(1) %2 to ptr
  store ptr %48, ptr %30, align 8
  %49 = load ptr, ptr %30, align 8
  %50 = addrspacecast ptr addrspace(1) %4 to ptr
  store ptr %50, ptr %31, align 8
  %51 = load ptr, ptr %31, align 8
  store ptr %45, ptr %32, align 8
    #dbg_declare(ptr addrspace(5) %16, !1881, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(ptr)), !1898)
  store ptr %47, ptr %33, align 8
    #dbg_declare(ptr addrspace(5) %17, !1882, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(ptr)), !1899)
  store ptr %49, ptr %34, align 8
    #dbg_declare(ptr addrspace(5) %18, !1883, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(ptr)), !1900)
  store i32 %3, ptr %35, align 4
    #dbg_declare(ptr addrspace(5) %19, !1884, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1901)
  store ptr %51, ptr %36, align 8
    #dbg_declare(ptr addrspace(5) %20, !1885, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(ptr)), !1902)
    #dbg_declare(ptr addrspace(5) %21, !1886, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1903)
  %52 = addrspacecast ptr addrspace(5) %11 to ptr
  %53 = addrspacecast ptr addrspace(5) %8 to ptr
  %54 = call i64 @__ockl_get_group_id(i32 noundef 0) #13, !dbg !1904
  %55 = trunc i64 %54 to i32, !dbg !1904
  store i32 %55, ptr %37, align 4, !dbg !1903
    #dbg_declare(ptr addrspace(5) %22, !1887, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1907)
  %56 = load ptr, ptr %36, align 8, !dbg !1908
  %57 = load i32, ptr %37, align 4, !dbg !1909
  %58 = sext i32 %57 to i64, !dbg !1908
  %59 = getelementptr inbounds i32, ptr %56, i64 %58, !dbg !1908
  %60 = load i32, ptr %59, align 4, !dbg !1908
  store i32 %60, ptr %38, align 4, !dbg !1907
    #dbg_declare(ptr addrspace(5) %23, !1888, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1910)
  %61 = load ptr, ptr %36, align 8, !dbg !1911
  %62 = load i32, ptr %37, align 4, !dbg !1912
  %63 = add nsw i32 %62, 1, !dbg !1913
  %64 = sext i32 %63 to i64, !dbg !1911
  %65 = getelementptr inbounds i32, ptr %61, i64 %64, !dbg !1911
  %66 = load i32, ptr %65, align 4, !dbg !1911
  %67 = load i32, ptr %38, align 4, !dbg !1914
  %68 = sub nsw i32 %66, %67, !dbg !1915
  store i32 %68, ptr %39, align 4, !dbg !1910
    #dbg_declare(ptr addrspace(5) %24, !1889, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1916)
  store i32 0, ptr %40, align 4, !dbg !1916
  br label %69, !dbg !1917

69:                                               ; preds = %112, %5
  %70 = load i32, ptr %40, align 4, !dbg !1918
  %71 = load i32, ptr %39, align 4, !dbg !1919
  %72 = icmp slt i32 %70, %71, !dbg !1920
  br i1 %72, label %73, label %119, !dbg !1921

73:                                               ; preds = %69
    #dbg_declare(ptr addrspace(5) %25, !1891, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1922)
  %74 = load i32, ptr %40, align 4, !dbg !1923
  %75 = addrspacecast ptr addrspace(5) %9 to ptr
  %76 = addrspacecast ptr addrspace(5) %6 to ptr
  %77 = call i64 @__ockl_get_local_id(i32 noundef 0) #13, !dbg !1924
  %78 = trunc i64 %77 to i32, !dbg !1924
  %79 = add i32 %74, %78, !dbg !1927
  store i32 %79, ptr %41, align 4, !dbg !1922
  %80 = load i32, ptr %41, align 4, !dbg !1928
  %81 = load i32, ptr %39, align 4, !dbg !1929
  %82 = icmp slt i32 %80, %81, !dbg !1930
  br i1 %82, label %83, label %111, !dbg !1931

83:                                               ; preds = %73
    #dbg_declare(ptr addrspace(5) %26, !1894, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(float)), !1932)
  %84 = load ptr, ptr %32, align 8, !dbg !1933
  %85 = load i32, ptr %38, align 4, !dbg !1934
  %86 = load i32, ptr %41, align 4, !dbg !1935
  %87 = add nsw i32 %85, %86, !dbg !1936
  %88 = sext i32 %87 to i64, !dbg !1933
  %89 = getelementptr inbounds float, ptr %84, i64 %88, !dbg !1933
  %90 = load float, ptr %89, align 4, !dbg !1933
  store float %90, ptr %42, align 4, !dbg !1932
    #dbg_declare(ptr addrspace(5) %27, !1897, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(float)), !1937)
  %91 = load ptr, ptr %33, align 8, !dbg !1938
  %92 = load i32, ptr %37, align 4, !dbg !1939
  %93 = load i32, ptr %35, align 4, !dbg !1940
  %94 = mul nsw i32 %92, %93, !dbg !1941
  %95 = load i32, ptr %41, align 4, !dbg !1942
  %96 = load i32, ptr %35, align 4, !dbg !1943
  %97 = srem i32 %95, %96, !dbg !1944
  %98 = add nsw i32 %94, %97, !dbg !1945
  %99 = sext i32 %98 to i64, !dbg !1938
  %100 = getelementptr inbounds float, ptr %91, i64 %99, !dbg !1938
  %101 = load float, ptr %100, align 4, !dbg !1938
  store float %101, ptr %43, align 4, !dbg !1937
  %102 = load float, ptr %42, align 4, !dbg !1946
  %103 = load float, ptr %43, align 4, !dbg !1947
  %104 = fadd contract float %102, %103, !dbg !1948
  %105 = load ptr, ptr %34, align 8, !dbg !1949
  %106 = load i32, ptr %38, align 4, !dbg !1950
  %107 = load i32, ptr %41, align 4, !dbg !1951
  %108 = add nsw i32 %106, %107, !dbg !1952
  %109 = sext i32 %108 to i64, !dbg !1949
  %110 = getelementptr inbounds float, ptr %105, i64 %109, !dbg !1949
  store float %104, ptr %110, align 4, !dbg !1953
  br label %111, !dbg !1954

111:                                              ; preds = %83, %73
  br label %112, !dbg !1955

112:                                              ; preds = %111
  %113 = addrspacecast ptr addrspace(5) %10 to ptr
  %114 = addrspacecast ptr addrspace(5) %7 to ptr
  %115 = call i64 @__ockl_get_local_size(i32 noundef 0) #13, !dbg !1956
  %116 = trunc i64 %115 to i32, !dbg !1956
  %117 = load i32, ptr %40, align 4, !dbg !1959
  %118 = add i32 %117, %116, !dbg !1959
  store i32 %118, ptr %40, align 4, !dbg !1959
  br label %69, !dbg !1960, !llvm.loop !1961

119:                                              ; preds = %69
  ret void, !dbg !1963
}

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
  %10 = load i32, ptr addrspace(4) @__oclc_ABI_version, align 4, !tbaa !1964
  %11 = icmp slt i32 %10, 500
  %12 = tail call ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %13 = select i1 %11, i64 24, i64 80
  %14 = getelementptr inbounds i8, ptr addrspace(4) %12, i64 %13
  %15 = load i64, ptr addrspace(4) %14, align 8, !tbaa !1968
  %16 = inttoptr i64 %15 to ptr addrspace(1)
  %17 = addrspacecast ptr addrspace(1) %16 to ptr
  %18 = tail call <2 x i64> @__ockl_hostcall_internal(ptr noundef %17, i32 noundef %0, i64 noundef %1, i64 noundef %2, i64 noundef %3, i64 noundef %4, i64 noundef %5, i64 noundef %6, i64 noundef %7, i64 noundef %8) #14
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
  %20 = load ptr addrspace(1), ptr addrspace(1) %14, align 8, !tbaa !1970
  %21 = load i64, ptr addrspace(1) %19, align 8, !tbaa !1974
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
  %30 = load ptr addrspace(1), ptr addrspace(1) %14, align 8, !tbaa !1970
  %31 = load i64, ptr addrspace(1) %19, align 8, !tbaa !1974
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
  %49 = load ptr addrspace(1), ptr addrspace(1) %14, align 8, !tbaa !1970
  %50 = getelementptr i8, ptr addrspace(1) %14, i64 40
  %51 = load i64, ptr addrspace(1) %50, align 8, !tbaa !1974
  %52 = and i64 %48, %51
  %53 = getelementptr inbounds %0, ptr addrspace(1) %49, i64 %52
  %54 = getelementptr i8, ptr addrspace(1) %14, i64 8
  %55 = load ptr addrspace(1), ptr addrspace(1) %54, align 8, !tbaa !1975
  %56 = getelementptr inbounds %1, ptr addrspace(1) %55, i64 %52
  %57 = tail call i64 @llvm.amdgcn.ballot.i64(i1 true)
  br i1 %15, label %58, label %62

58:                                               ; preds = %38
  %59 = getelementptr inbounds i8, ptr addrspace(1) %53, i64 16
  %60 = getelementptr inbounds i8, ptr addrspace(1) %53, i64 8
  %61 = getelementptr inbounds i8, ptr addrspace(1) %53, i64 20
  store i32 %1, ptr addrspace(1) %59, align 8, !tbaa !1976
  store i64 %57, ptr addrspace(1) %60, align 8, !tbaa !1978
  store i32 1, ptr addrspace(1) %61, align 4, !tbaa !1979
  br label %62

62:                                               ; preds = %58, %38
  %63 = zext i32 %12 to i64
  %64 = getelementptr inbounds [64 x [8 x i64]], ptr addrspace(1) %56, i64 0, i64 %63
  store i64 %2, ptr addrspace(1) %64, align 8, !tbaa !1968
  %65 = getelementptr inbounds i8, ptr addrspace(1) %64, i64 8
  store i64 %3, ptr addrspace(1) %65, align 8, !tbaa !1968
  %66 = getelementptr inbounds i8, ptr addrspace(1) %64, i64 16
  store i64 %4, ptr addrspace(1) %66, align 8, !tbaa !1968
  %67 = getelementptr inbounds i8, ptr addrspace(1) %64, i64 24
  store i64 %5, ptr addrspace(1) %67, align 8, !tbaa !1968
  %68 = getelementptr inbounds i8, ptr addrspace(1) %64, i64 32
  store i64 %6, ptr addrspace(1) %68, align 8, !tbaa !1968
  %69 = getelementptr inbounds i8, ptr addrspace(1) %64, i64 40
  store i64 %7, ptr addrspace(1) %69, align 8, !tbaa !1968
  %70 = getelementptr inbounds i8, ptr addrspace(1) %64, i64 48
  store i64 %8, ptr addrspace(1) %70, align 8, !tbaa !1968
  %71 = getelementptr inbounds i8, ptr addrspace(1) %64, i64 56
  store i64 %9, ptr addrspace(1) %71, align 8, !tbaa !1968
  br i1 %15, label %72, label %88

72:                                               ; preds = %62
  %73 = getelementptr inbounds i8, ptr addrspace(1) %14, i64 32
  %74 = load atomic i64, ptr addrspace(1) %73 syncscope("one-as") monotonic, align 8
  %75 = load i64, ptr addrspace(1) %50, align 8, !tbaa !1974
  %76 = and i64 %75, %48
  %77 = getelementptr inbounds %0, ptr addrspace(1) %49, i64 %76
  store i64 %74, ptr addrspace(1) %77, align 8, !tbaa !1980
  %78 = cmpxchg ptr addrspace(1) %73, i64 %74, i64 %48 syncscope("one-as") release monotonic, align 8
  %79 = extractvalue { i64, i1 } %78, 1
  br i1 %79, label %85, label %80

80:                                               ; preds = %80, %72
  %81 = phi { i64, i1 } [ %83, %80 ], [ %78, %72 ]
  %82 = extractvalue { i64, i1 } %81, 0
  tail call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %82, ptr addrspace(1) %77, align 8, !tbaa !1980
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
  %100 = load i64, ptr addrspace(1) %64, align 8, !tbaa !1968
  %101 = load i64, ptr addrspace(1) %65, align 8, !tbaa !1968
  br i1 %15, label %102, label %120

102:                                              ; preds = %99
  %103 = load i64, ptr addrspace(1) %50, align 8, !tbaa !1974
  %104 = add i64 %103, 1
  %105 = add i64 %104, %48
  %106 = icmp eq i64 %105, 0
  %107 = select i1 %106, i64 %104, i64 %105
  %108 = getelementptr inbounds i8, ptr addrspace(1) %14, i64 24
  %109 = load atomic i64, ptr addrspace(1) %108 syncscope("one-as") monotonic, align 8
  %110 = load ptr addrspace(1), ptr addrspace(1) %14, align 8, !tbaa !1970
  %111 = and i64 %107, %103
  %112 = getelementptr inbounds %0, ptr addrspace(1) %110, i64 %111
  store i64 %109, ptr addrspace(1) %112, align 8, !tbaa !1980
  %113 = cmpxchg ptr addrspace(1) %108, i64 %109, i64 %107 syncscope("one-as") release monotonic, align 8
  %114 = extractvalue { i64, i1 } %113, 1
  br i1 %114, label %120, label %115

115:                                              ; preds = %115, %102
  %116 = phi { i64, i1 } [ %118, %115 ], [ %113, %102 ]
  %117 = extractvalue { i64, i1 } %116, 0
  tail call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %117, ptr addrspace(1) %112, align 8, !tbaa !1980
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
  %18 = load i64, ptr addrspace(1) %17, align 16, !tbaa !1981
  %19 = icmp eq i64 %18, 0
  br i1 %19, label %34, label %20

20:                                               ; preds = %16
  %21 = inttoptr i64 %18 to ptr addrspace(1)
  %22 = getelementptr inbounds i8, ptr addrspace(1) %4, i64 24
  %23 = load i32, ptr addrspace(1) %22, align 8, !tbaa !1983
  %24 = zext i32 %23 to i64
  store atomic i64 %24, ptr addrspace(1) %21 syncscope("one-as") release, align 8
  %25 = load i32, ptr addrspace(4) @__oclc_ISA_version, align 4, !tbaa !1964
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
  %33 = load i8, ptr %19, align 1, !tbaa !1984
  %34 = zext i8 %33 to i64
  %35 = getelementptr inbounds i8, ptr %19, i64 1
  %36 = load i8, ptr %35, align 1, !tbaa !1984
  %37 = zext i8 %36 to i64
  %38 = shl nuw nsw i64 %37, 8
  %39 = or disjoint i64 %38, %34
  %40 = getelementptr inbounds i8, ptr %19, i64 2
  %41 = load i8, ptr %40, align 1, !tbaa !1984
  %42 = zext i8 %41 to i64
  %43 = shl nuw nsw i64 %42, 16
  %44 = or disjoint i64 %39, %43
  %45 = getelementptr inbounds i8, ptr %19, i64 3
  %46 = load i8, ptr %45, align 1, !tbaa !1984
  %47 = zext i8 %46 to i64
  %48 = shl nuw nsw i64 %47, 24
  %49 = or disjoint i64 %44, %48
  %50 = getelementptr inbounds i8, ptr %19, i64 4
  %51 = load i8, ptr %50, align 1, !tbaa !1984
  %52 = zext i8 %51 to i64
  %53 = shl nuw nsw i64 %52, 32
  %54 = or disjoint i64 %49, %53
  %55 = getelementptr inbounds i8, ptr %19, i64 5
  %56 = load i8, ptr %55, align 1, !tbaa !1984
  %57 = zext i8 %56 to i64
  %58 = shl nuw nsw i64 %57, 40
  %59 = or i64 %54, %58
  %60 = getelementptr inbounds i8, ptr %19, i64 6
  %61 = load i8, ptr %60, align 1, !tbaa !1984
  %62 = zext i8 %61 to i64
  %63 = shl nuw nsw i64 %62, 48
  %64 = or i64 %59, %63
  %65 = getelementptr inbounds i8, ptr %19, i64 7
  %66 = load i8, ptr %65, align 1, !tbaa !1984
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
  %77 = load i8, ptr %76, align 1, !tbaa !1984
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
  %93 = load i8, ptr %86, align 1, !tbaa !1984
  %94 = zext i8 %93 to i64
  %95 = getelementptr inbounds i8, ptr %86, i64 1
  %96 = load i8, ptr %95, align 1, !tbaa !1984
  %97 = zext i8 %96 to i64
  %98 = shl nuw nsw i64 %97, 8
  %99 = or disjoint i64 %98, %94
  %100 = getelementptr inbounds i8, ptr %86, i64 2
  %101 = load i8, ptr %100, align 1, !tbaa !1984
  %102 = zext i8 %101 to i64
  %103 = shl nuw nsw i64 %102, 16
  %104 = or disjoint i64 %99, %103
  %105 = getelementptr inbounds i8, ptr %86, i64 3
  %106 = load i8, ptr %105, align 1, !tbaa !1984
  %107 = zext i8 %106 to i64
  %108 = shl nuw nsw i64 %107, 24
  %109 = or disjoint i64 %104, %108
  %110 = getelementptr inbounds i8, ptr %86, i64 4
  %111 = load i8, ptr %110, align 1, !tbaa !1984
  %112 = zext i8 %111 to i64
  %113 = shl nuw nsw i64 %112, 32
  %114 = or disjoint i64 %109, %113
  %115 = getelementptr inbounds i8, ptr %86, i64 5
  %116 = load i8, ptr %115, align 1, !tbaa !1984
  %117 = zext i8 %116 to i64
  %118 = shl nuw nsw i64 %117, 40
  %119 = or i64 %114, %118
  %120 = getelementptr inbounds i8, ptr %86, i64 6
  %121 = load i8, ptr %120, align 1, !tbaa !1984
  %122 = zext i8 %121 to i64
  %123 = shl nuw nsw i64 %122, 48
  %124 = or i64 %119, %123
  %125 = getelementptr inbounds i8, ptr %86, i64 7
  %126 = load i8, ptr %125, align 1, !tbaa !1984
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
  %137 = load i8, ptr %136, align 1, !tbaa !1984
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
  %153 = load i8, ptr %146, align 1, !tbaa !1984
  %154 = zext i8 %153 to i64
  %155 = getelementptr inbounds i8, ptr %146, i64 1
  %156 = load i8, ptr %155, align 1, !tbaa !1984
  %157 = zext i8 %156 to i64
  %158 = shl nuw nsw i64 %157, 8
  %159 = or disjoint i64 %158, %154
  %160 = getelementptr inbounds i8, ptr %146, i64 2
  %161 = load i8, ptr %160, align 1, !tbaa !1984
  %162 = zext i8 %161 to i64
  %163 = shl nuw nsw i64 %162, 16
  %164 = or disjoint i64 %159, %163
  %165 = getelementptr inbounds i8, ptr %146, i64 3
  %166 = load i8, ptr %165, align 1, !tbaa !1984
  %167 = zext i8 %166 to i64
  %168 = shl nuw nsw i64 %167, 24
  %169 = or disjoint i64 %164, %168
  %170 = getelementptr inbounds i8, ptr %146, i64 4
  %171 = load i8, ptr %170, align 1, !tbaa !1984
  %172 = zext i8 %171 to i64
  %173 = shl nuw nsw i64 %172, 32
  %174 = or disjoint i64 %169, %173
  %175 = getelementptr inbounds i8, ptr %146, i64 5
  %176 = load i8, ptr %175, align 1, !tbaa !1984
  %177 = zext i8 %176 to i64
  %178 = shl nuw nsw i64 %177, 40
  %179 = or i64 %174, %178
  %180 = getelementptr inbounds i8, ptr %146, i64 6
  %181 = load i8, ptr %180, align 1, !tbaa !1984
  %182 = zext i8 %181 to i64
  %183 = shl nuw nsw i64 %182, 48
  %184 = or i64 %179, %183
  %185 = getelementptr inbounds i8, ptr %146, i64 7
  %186 = load i8, ptr %185, align 1, !tbaa !1984
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
  %197 = load i8, ptr %196, align 1, !tbaa !1984
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
  %213 = load i8, ptr %206, align 1, !tbaa !1984
  %214 = zext i8 %213 to i64
  %215 = getelementptr inbounds i8, ptr %206, i64 1
  %216 = load i8, ptr %215, align 1, !tbaa !1984
  %217 = zext i8 %216 to i64
  %218 = shl nuw nsw i64 %217, 8
  %219 = or disjoint i64 %218, %214
  %220 = getelementptr inbounds i8, ptr %206, i64 2
  %221 = load i8, ptr %220, align 1, !tbaa !1984
  %222 = zext i8 %221 to i64
  %223 = shl nuw nsw i64 %222, 16
  %224 = or disjoint i64 %219, %223
  %225 = getelementptr inbounds i8, ptr %206, i64 3
  %226 = load i8, ptr %225, align 1, !tbaa !1984
  %227 = zext i8 %226 to i64
  %228 = shl nuw nsw i64 %227, 24
  %229 = or disjoint i64 %224, %228
  %230 = getelementptr inbounds i8, ptr %206, i64 4
  %231 = load i8, ptr %230, align 1, !tbaa !1984
  %232 = zext i8 %231 to i64
  %233 = shl nuw nsw i64 %232, 32
  %234 = or disjoint i64 %229, %233
  %235 = getelementptr inbounds i8, ptr %206, i64 5
  %236 = load i8, ptr %235, align 1, !tbaa !1984
  %237 = zext i8 %236 to i64
  %238 = shl nuw nsw i64 %237, 40
  %239 = or i64 %234, %238
  %240 = getelementptr inbounds i8, ptr %206, i64 6
  %241 = load i8, ptr %240, align 1, !tbaa !1984
  %242 = zext i8 %241 to i64
  %243 = shl nuw nsw i64 %242, 48
  %244 = or i64 %239, %243
  %245 = getelementptr inbounds i8, ptr %206, i64 7
  %246 = load i8, ptr %245, align 1, !tbaa !1984
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
  %257 = load i8, ptr %256, align 1, !tbaa !1984
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
  %273 = load i8, ptr %266, align 1, !tbaa !1984
  %274 = zext i8 %273 to i64
  %275 = getelementptr inbounds i8, ptr %266, i64 1
  %276 = load i8, ptr %275, align 1, !tbaa !1984
  %277 = zext i8 %276 to i64
  %278 = shl nuw nsw i64 %277, 8
  %279 = or disjoint i64 %278, %274
  %280 = getelementptr inbounds i8, ptr %266, i64 2
  %281 = load i8, ptr %280, align 1, !tbaa !1984
  %282 = zext i8 %281 to i64
  %283 = shl nuw nsw i64 %282, 16
  %284 = or disjoint i64 %279, %283
  %285 = getelementptr inbounds i8, ptr %266, i64 3
  %286 = load i8, ptr %285, align 1, !tbaa !1984
  %287 = zext i8 %286 to i64
  %288 = shl nuw nsw i64 %287, 24
  %289 = or disjoint i64 %284, %288
  %290 = getelementptr inbounds i8, ptr %266, i64 4
  %291 = load i8, ptr %290, align 1, !tbaa !1984
  %292 = zext i8 %291 to i64
  %293 = shl nuw nsw i64 %292, 32
  %294 = or disjoint i64 %289, %293
  %295 = getelementptr inbounds i8, ptr %266, i64 5
  %296 = load i8, ptr %295, align 1, !tbaa !1984
  %297 = zext i8 %296 to i64
  %298 = shl nuw nsw i64 %297, 40
  %299 = or i64 %294, %298
  %300 = getelementptr inbounds i8, ptr %266, i64 6
  %301 = load i8, ptr %300, align 1, !tbaa !1984
  %302 = zext i8 %301 to i64
  %303 = shl nuw nsw i64 %302, 48
  %304 = or i64 %299, %303
  %305 = getelementptr inbounds i8, ptr %266, i64 7
  %306 = load i8, ptr %305, align 1, !tbaa !1984
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
  %317 = load i8, ptr %316, align 1, !tbaa !1984
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
  %333 = load i8, ptr %326, align 1, !tbaa !1984
  %334 = zext i8 %333 to i64
  %335 = getelementptr inbounds i8, ptr %326, i64 1
  %336 = load i8, ptr %335, align 1, !tbaa !1984
  %337 = zext i8 %336 to i64
  %338 = shl nuw nsw i64 %337, 8
  %339 = or disjoint i64 %338, %334
  %340 = getelementptr inbounds i8, ptr %326, i64 2
  %341 = load i8, ptr %340, align 1, !tbaa !1984
  %342 = zext i8 %341 to i64
  %343 = shl nuw nsw i64 %342, 16
  %344 = or disjoint i64 %339, %343
  %345 = getelementptr inbounds i8, ptr %326, i64 3
  %346 = load i8, ptr %345, align 1, !tbaa !1984
  %347 = zext i8 %346 to i64
  %348 = shl nuw nsw i64 %347, 24
  %349 = or disjoint i64 %344, %348
  %350 = getelementptr inbounds i8, ptr %326, i64 4
  %351 = load i8, ptr %350, align 1, !tbaa !1984
  %352 = zext i8 %351 to i64
  %353 = shl nuw nsw i64 %352, 32
  %354 = or disjoint i64 %349, %353
  %355 = getelementptr inbounds i8, ptr %326, i64 5
  %356 = load i8, ptr %355, align 1, !tbaa !1984
  %357 = zext i8 %356 to i64
  %358 = shl nuw nsw i64 %357, 40
  %359 = or i64 %354, %358
  %360 = getelementptr inbounds i8, ptr %326, i64 6
  %361 = load i8, ptr %360, align 1, !tbaa !1984
  %362 = zext i8 %361 to i64
  %363 = shl nuw nsw i64 %362, 48
  %364 = or i64 %359, %363
  %365 = getelementptr inbounds i8, ptr %326, i64 7
  %366 = load i8, ptr %365, align 1, !tbaa !1984
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
  %377 = load i8, ptr %376, align 1, !tbaa !1984
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
  %393 = load i8, ptr %386, align 1, !tbaa !1984
  %394 = zext i8 %393 to i64
  %395 = getelementptr inbounds i8, ptr %386, i64 1
  %396 = load i8, ptr %395, align 1, !tbaa !1984
  %397 = zext i8 %396 to i64
  %398 = shl nuw nsw i64 %397, 8
  %399 = or disjoint i64 %398, %394
  %400 = getelementptr inbounds i8, ptr %386, i64 2
  %401 = load i8, ptr %400, align 1, !tbaa !1984
  %402 = zext i8 %401 to i64
  %403 = shl nuw nsw i64 %402, 16
  %404 = or disjoint i64 %399, %403
  %405 = getelementptr inbounds i8, ptr %386, i64 3
  %406 = load i8, ptr %405, align 1, !tbaa !1984
  %407 = zext i8 %406 to i64
  %408 = shl nuw nsw i64 %407, 24
  %409 = or disjoint i64 %404, %408
  %410 = getelementptr inbounds i8, ptr %386, i64 4
  %411 = load i8, ptr %410, align 1, !tbaa !1984
  %412 = zext i8 %411 to i64
  %413 = shl nuw nsw i64 %412, 32
  %414 = or disjoint i64 %409, %413
  %415 = getelementptr inbounds i8, ptr %386, i64 5
  %416 = load i8, ptr %415, align 1, !tbaa !1984
  %417 = zext i8 %416 to i64
  %418 = shl nuw nsw i64 %417, 40
  %419 = or i64 %414, %418
  %420 = getelementptr inbounds i8, ptr %386, i64 6
  %421 = load i8, ptr %420, align 1, !tbaa !1984
  %422 = zext i8 %421 to i64
  %423 = shl nuw nsw i64 %422, 48
  %424 = or i64 %419, %423
  %425 = getelementptr inbounds i8, ptr %386, i64 7
  %426 = load i8, ptr %425, align 1, !tbaa !1984
  %427 = zext i8 %426 to i64
  %428 = shl nuw i64 %427, 56
  %429 = or i64 %424, %428
  br label %443

430:                                              ; preds = %430, %390
  %431 = phi i32 [ %441, %430 ], [ 0, %390 ]
  %432 = phi i64 [ %440, %430 ], [ 0, %390 ]
  %433 = zext nneg i32 %431 to i64
  %434 = getelementptr inbounds i8, ptr %386, i64 %433
  %435 = load i8, ptr %434, align 1, !tbaa !1984
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
  %9 = load i16, ptr addrspace(4) %8, align 4, !range !1985, !invariant.load !1986, !noundef !1986
  %10 = zext nneg i16 %9 to i32
  %11 = getelementptr inbounds i8, ptr addrspace(4) %6, i64 12
  %12 = load i32, ptr addrspace(4) %11, align 4, !tbaa !1987
  %13 = mul i32 %7, %10
  %14 = sub i32 %12, %13
  %15 = tail call i32 @llvm.umin.i32(i32 %14, i32 %10)
  %16 = zext nneg i32 %15 to i64
  br label %76

17:                                               ; preds = %2
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %19 = tail call ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %20 = load i32, ptr addrspace(4) %19, align 4, !tbaa !1964
  %21 = icmp ult i32 %18, %20
  %22 = select i1 %21, i64 12, i64 18
  %23 = getelementptr inbounds i8, ptr addrspace(4) %19, i64 %22
  %24 = load i16, ptr addrspace(4) %23, align 2, !tbaa !1990
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
  %33 = load i16, ptr addrspace(4) %32, align 2, !range !1985, !invariant.load !1986, !noundef !1986
  %34 = zext nneg i16 %33 to i32
  %35 = getelementptr inbounds i8, ptr addrspace(4) %30, i64 16
  %36 = load i32, ptr addrspace(4) %35, align 8, !tbaa !1991
  %37 = mul i32 %31, %34
  %38 = sub i32 %36, %37
  %39 = tail call i32 @llvm.umin.i32(i32 %38, i32 %34)
  %40 = zext nneg i32 %39 to i64
  br label %76

41:                                               ; preds = %26
  %42 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %43 = tail call ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %44 = getelementptr inbounds i8, ptr addrspace(4) %43, i64 4
  %45 = load i32, ptr addrspace(4) %44, align 4, !tbaa !1964
  %46 = icmp ult i32 %42, %45
  %47 = select i1 %46, i64 14, i64 20
  %48 = getelementptr inbounds i8, ptr addrspace(4) %43, i64 %47
  %49 = load i16, ptr addrspace(4) %48, align 2, !tbaa !1990
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
  %58 = load i16, ptr addrspace(4) %57, align 4, !range !1985, !invariant.load !1986, !noundef !1986
  %59 = zext nneg i16 %58 to i32
  %60 = getelementptr inbounds i8, ptr addrspace(4) %55, i64 20
  %61 = load i32, ptr addrspace(4) %60, align 4, !tbaa !1992
  %62 = mul i32 %56, %59
  %63 = sub i32 %61, %62
  %64 = tail call i32 @llvm.umin.i32(i32 %63, i32 %59)
  %65 = zext nneg i32 %64 to i64
  br label %76

66:                                               ; preds = %51
  %67 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %68 = tail call ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %69 = getelementptr inbounds i8, ptr addrspace(4) %68, i64 8
  %70 = load i32, ptr addrspace(4) %69, align 4, !tbaa !1964
  %71 = icmp ult i32 %67, %70
  %72 = select i1 %71, i64 16, i64 22
  %73 = getelementptr inbounds i8, ptr addrspace(4) %68, i64 %72
  %74 = load i16, ptr addrspace(4) %73, align 2, !tbaa !1990
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
attributes #14 = { cold convergent nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!1564, !1565, !1566, !1567, !1568, !1569, !1570}
!llvm.ident = !{!1571, !1571, !1571, !1571, !1571, !1571, !1571, !1571, !1571, !1571, !1571}
!opencl.ocl.version = !{!1572, !1572, !1572, !1572, !1572, !1572, !1572, !1572, !1572, !1572}

!0 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !1, producer: "AMD clang version 19.0.0git (https://github.com/RadeonOpenCompute/llvm-project roc-6.4.2 25224 d366fa84f3fdcbd4b10847ebd5db572ae12a34fb)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, imports: !18, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/ccs/home/mdunlavy/GPU_Fault_Injection/HeCBench/src/dense-embedding-hip/main.cu", directory: "/ccs/home/mdunlavy/GPU_Fault_Injection", checksumkind: CSK_MD5, checksum: "c6b3953c42f075c3101c2a679b2990eb")
!2 = !{!3}
!3 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dim3", file: !4, line: 1179, size: 96, flags: DIFlagTypePassByValue | DIFlagNonTrivial, elements: !5, identifier: "_ZTS4dim3")
!4 = !DIFile(filename: "/opt/rocm-6.4.2/include/hip/hip_runtime_api.h", directory: "", checksumkind: CSK_MD5, checksum: "2a1ac901d8db5ef891d901275c66dbab")
!5 = !{!6, !12, !13, !14}
!6 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !3, file: !4, line: 1180, baseType: !7, size: 32)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !8, line: 26, baseType: !9)
!8 = !DIFile(filename: "/usr/include/bits/stdint-uintn.h", directory: "", checksumkind: CSK_MD5, checksum: "4ecee94d7257cd86659727d06a979b60")
!9 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !10, line: 42, baseType: !11)
!10 = !DIFile(filename: "/usr/include/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "4a64d909bcfa62a0a7682c3ac78c6965")
!11 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !3, file: !4, line: 1181, baseType: !7, size: 32, offset: 32)
!13 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !3, file: !4, line: 1182, baseType: !7, size: 32, offset: 64)
!14 = !DISubprogram(name: "dim3", scope: !3, file: !4, line: 1184, type: !15, scopeLine: 1184, flags: DIFlagPrototyped, spFlags: 0)
!15 = !DISubroutineType(types: !16)
!16 = !{null, !17, !7, !7, !7}
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!18 = !{!19, !27, !34, !36, !38, !42, !44, !46, !48, !50, !52, !54, !56, !61, !65, !67, !69, !74, !76, !78, !80, !82, !84, !86, !89, !92, !94, !98, !103, !105, !107, !109, !111, !113, !115, !117, !119, !121, !123, !127, !131, !133, !135, !137, !139, !141, !143, !145, !147, !149, !151, !153, !155, !157, !159, !161, !165, !169, !173, !175, !177, !179, !181, !183, !185, !187, !189, !191, !195, !199, !203, !205, !207, !209, !214, !218, !222, !224, !226, !228, !230, !232, !234, !236, !238, !240, !242, !244, !246, !251, !255, !259, !261, !263, !265, !272, !276, !280, !282, !284, !286, !288, !290, !292, !296, !300, !302, !304, !306, !308, !312, !316, !320, !322, !324, !326, !328, !330, !332, !336, !340, !344, !346, !350, !354, !356, !358, !360, !362, !364, !366, !370, !374, !380, !384, !392, !397, !399, !401, !405, !409, !419, !421, !425, !429, !433, !438, !442, !446, !450, !454, !462, !466, !470, !472, !476, !480, !484, !490, !494, !498, !500, !508, !512, !519, !521, !525, !529, !533, !537, !542, !546, !550, !551, !552, !553, !555, !556, !557, !558, !559, !560, !561, !563, !564, !565, !566, !567, !568, !569, !570, !575, !576, !577, !578, !579, !580, !581, !582, !583, !584, !585, !586, !587, !588, !589, !590, !591, !592, !593, !594, !595, !596, !597, !598, !599, !602, !604, !606, !608, !610, !612, !614, !616, !618, !620, !622, !624, !626, !628, !630, !632, !634, !636, !638, !640, !642, !644, !646, !648, !650, !652, !656, !658, !660, !665, !669, !671, !673, !675, !677, !679, !681, !683, !685, !687, !689, !691, !693, !695, !697, !699, !701, !703, !705, !707, !709, !711, !716, !718, !720, !722, !724, !726, !728, !730, !732, !734, !736, !738, !740, !742, !744, !746, !748, !750, !752, !754, !758, !760, !762, !764, !766, !768, !770, !772, !774, !776, !778, !780, !782, !784, !786, !788, !790, !792, !794, !796, !798, !800, !802, !804, !806, !808, !810, !812, !814, !816, !818, !820, !822, !824, !826, !828, !830, !832, !834, !836, !838, !840, !842, !844, !846, !848, !850, !852, !854, !856, !858, !860, !862, !864, !866, !870, !874, !879, !896, !899, !904, !912, !917, !921, !925, !929, !933, !935, !937, !941, !947, !951, !957, !963, !965, !969, !973, !977, !981, !989, !991, !995, !999, !1003, !1005, !1009, !1013, !1017, !1019, !1021, !1025, !1033, !1037, !1041, !1045, !1047, !1053, !1055, !1061, !1065, !1069, !1073, !1077, !1081, !1085, !1087, !1089, !1093, !1097, !1101, !1103, !1107, !1111, !1113, !1115, !1119, !1123, !1127, !1131, !1132, !1133, !1134, !1135, !1136, !1137, !1138, !1139, !1140, !1141, !1145, !1149, !1154, !1158, !1160, !1162, !1164, !1166, !1168, !1170, !1172, !1174, !1176, !1178, !1180, !1182, !1184, !1188, !1194, !1199, !1203, !1205, !1207, !1209, !1211, !1218, !1222, !1226, !1230, !1234, !1238, !1243, !1247, !1249, !1253, !1259, !1263, !1268, !1270, !1272, !1276, !1280, !1282, !1284, !1286, !1288, !1292, !1294, !1296, !1300, !1304, !1308, !1312, !1316, !1320, !1322, !1326, !1330, !1334, !1338, !1340, !1342, !1346, !1350, !1351, !1352, !1353, !1354, !1355, !1363, !1370, !1373, !1374, !1376, !1378, !1380, !1382, !1386, !1388, !1390, !1392, !1394, !1396, !1398, !1400, !1402, !1406, !1410, !1412, !1416, !1420, !1426, !1430, !1432, !1435, !1438, !1440, !1442, !1444, !1447, !1450, !1453, !1456, !1459, !1461, !1465, !1469, !1470, !1473, !1475, !1477, !1479, !1481, !1484, !1487, !1490, !1493, !1496, !1498, !1503, !1507, !1508, !1513, !1517, !1522, !1527, !1531, !1537, !1541, !1543, !1547, !1554, !1559}
!19 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !21, file: !26, line: 52)
!20 = !DINamespace(name: "std", scope: null)
!21 = !DISubprogram(name: "abs", scope: !22, file: !22, line: 980, type: !23, flags: DIFlagPrototyped, spFlags: 0)
!22 = !DIFile(filename: "/usr/include/stdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "761a239547e58b18c7327eb395f5cc1f")
!23 = !DISubroutineType(types: !24)
!24 = !{!25, !25}
!25 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!26 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/bits/std_abs.h", directory: "")
!27 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !28, file: !33, line: 85)
!28 = !DISubprogram(name: "acos", scope: !29, file: !29, line: 53, type: !30, flags: DIFlagPrototyped, spFlags: 0)
!29 = !DIFile(filename: "/usr/include/bits/mathcalls.h", directory: "", checksumkind: CSK_MD5, checksum: "a03d6e5877646e3ad0a8a5735f9e6f62")
!30 = !DISubroutineType(types: !31)
!31 = !{!32, !32}
!32 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!33 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/cmath", directory: "")
!34 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !35, file: !33, line: 104)
!35 = !DISubprogram(name: "asin", scope: !29, file: !29, line: 55, type: !30, flags: DIFlagPrototyped, spFlags: 0)
!36 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !37, file: !33, line: 123)
!37 = !DISubprogram(name: "atan", scope: !29, file: !29, line: 57, type: !30, flags: DIFlagPrototyped, spFlags: 0)
!38 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !39, file: !33, line: 142)
!39 = !DISubprogram(name: "atan2", scope: !29, file: !29, line: 59, type: !40, flags: DIFlagPrototyped, spFlags: 0)
!40 = !DISubroutineType(types: !41)
!41 = !{!32, !32, !32}
!42 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !43, file: !33, line: 154)
!43 = !DISubprogram(name: "ceil", scope: !29, file: !29, line: 159, type: !30, flags: DIFlagPrototyped, spFlags: 0)
!44 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !45, file: !33, line: 173)
!45 = !DISubprogram(name: "cos", scope: !29, file: !29, line: 62, type: !30, flags: DIFlagPrototyped, spFlags: 0)
!46 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !47, file: !33, line: 192)
!47 = !DISubprogram(name: "cosh", scope: !29, file: !29, line: 71, type: !30, flags: DIFlagPrototyped, spFlags: 0)
!48 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !49, file: !33, line: 211)
!49 = !DISubprogram(name: "exp", scope: !29, file: !29, line: 95, type: !30, flags: DIFlagPrototyped, spFlags: 0)
!50 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !51, file: !33, line: 230)
!51 = !DISubprogram(name: "fabs", scope: !29, file: !29, line: 162, type: !30, flags: DIFlagPrototyped, spFlags: 0)
!52 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !53, file: !33, line: 249)
!53 = !DISubprogram(name: "floor", scope: !29, file: !29, line: 165, type: !30, flags: DIFlagPrototyped, spFlags: 0)
!54 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !55, file: !33, line: 268)
!55 = !DISubprogram(name: "fmod", scope: !29, file: !29, line: 168, type: !40, flags: DIFlagPrototyped, spFlags: 0)
!56 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !57, file: !33, line: 280)
!57 = !DISubprogram(name: "frexp", scope: !29, file: !29, line: 98, type: !58, flags: DIFlagPrototyped, spFlags: 0)
!58 = !DISubroutineType(types: !59)
!59 = !{!32, !32, !60}
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!61 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !62, file: !33, line: 299)
!62 = !DISubprogram(name: "ldexp", scope: !29, file: !29, line: 101, type: !63, flags: DIFlagPrototyped, spFlags: 0)
!63 = !DISubroutineType(types: !64)
!64 = !{!32, !32, !25}
!65 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !66, file: !33, line: 318)
!66 = !DISubprogram(name: "log", scope: !29, file: !29, line: 104, type: !30, flags: DIFlagPrototyped, spFlags: 0)
!67 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !68, file: !33, line: 337)
!68 = !DISubprogram(name: "log10", scope: !29, file: !29, line: 107, type: !30, flags: DIFlagPrototyped, spFlags: 0)
!69 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !70, file: !33, line: 356)
!70 = !DISubprogram(name: "modf", scope: !29, file: !29, line: 110, type: !71, flags: DIFlagPrototyped, spFlags: 0)
!71 = !DISubroutineType(types: !72)
!72 = !{!32, !32, !73}
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !32, size: 64)
!74 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !75, file: !33, line: 368)
!75 = !DISubprogram(name: "pow", scope: !29, file: !29, line: 140, type: !40, flags: DIFlagPrototyped, spFlags: 0)
!76 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !77, file: !33, line: 396)
!77 = !DISubprogram(name: "sin", scope: !29, file: !29, line: 64, type: !30, flags: DIFlagPrototyped, spFlags: 0)
!78 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !79, file: !33, line: 415)
!79 = !DISubprogram(name: "sinh", scope: !29, file: !29, line: 73, type: !30, flags: DIFlagPrototyped, spFlags: 0)
!80 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !81, file: !33, line: 434)
!81 = !DISubprogram(name: "sqrt", scope: !29, file: !29, line: 143, type: !30, flags: DIFlagPrototyped, spFlags: 0)
!82 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !83, file: !33, line: 453)
!83 = !DISubprogram(name: "tan", scope: !29, file: !29, line: 66, type: !30, flags: DIFlagPrototyped, spFlags: 0)
!84 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !85, file: !33, line: 472)
!85 = !DISubprogram(name: "tanh", scope: !29, file: !29, line: 75, type: !30, flags: DIFlagPrototyped, spFlags: 0)
!86 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !87, file: !33, line: 1881)
!87 = !DIDerivedType(tag: DW_TAG_typedef, name: "double_t", file: !88, line: 164, baseType: !32)
!88 = !DIFile(filename: "/usr/include/math.h", directory: "", checksumkind: CSK_MD5, checksum: "555a51fc91303a79e6e6a7bf2a303f79")
!89 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !90, file: !33, line: 1882)
!90 = !DIDerivedType(tag: DW_TAG_typedef, name: "float_t", file: !88, line: 163, baseType: !91)
!91 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!92 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !93, file: !33, line: 1885)
!93 = !DISubprogram(name: "acosh", scope: !29, file: !29, line: 85, type: !30, flags: DIFlagPrototyped, spFlags: 0)
!94 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !95, file: !33, line: 1886)
!95 = !DISubprogram(name: "acoshf", scope: !29, file: !29, line: 85, type: !96, flags: DIFlagPrototyped, spFlags: 0)
!96 = !DISubroutineType(types: !97)
!97 = !{!91, !91}
!98 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !99, file: !33, line: 1887)
!99 = !DISubprogram(name: "acoshl", scope: !29, file: !29, line: 85, type: !100, flags: DIFlagPrototyped, spFlags: 0)
!100 = !DISubroutineType(types: !101)
!101 = !{!102, !102}
!102 = !DIBasicType(name: "long double", size: 64, encoding: DW_ATE_float)
!103 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !104, file: !33, line: 1889)
!104 = !DISubprogram(name: "asinh", scope: !29, file: !29, line: 87, type: !30, flags: DIFlagPrototyped, spFlags: 0)
!105 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !106, file: !33, line: 1890)
!106 = !DISubprogram(name: "asinhf", scope: !29, file: !29, line: 87, type: !96, flags: DIFlagPrototyped, spFlags: 0)
!107 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !108, file: !33, line: 1891)
!108 = !DISubprogram(name: "asinhl", scope: !29, file: !29, line: 87, type: !100, flags: DIFlagPrototyped, spFlags: 0)
!109 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !110, file: !33, line: 1893)
!110 = !DISubprogram(name: "atanh", scope: !29, file: !29, line: 89, type: !30, flags: DIFlagPrototyped, spFlags: 0)
!111 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !112, file: !33, line: 1894)
!112 = !DISubprogram(name: "atanhf", scope: !29, file: !29, line: 89, type: !96, flags: DIFlagPrototyped, spFlags: 0)
!113 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !114, file: !33, line: 1895)
!114 = !DISubprogram(name: "atanhl", scope: !29, file: !29, line: 89, type: !100, flags: DIFlagPrototyped, spFlags: 0)
!115 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !116, file: !33, line: 1897)
!116 = !DISubprogram(name: "cbrt", scope: !29, file: !29, line: 152, type: !30, flags: DIFlagPrototyped, spFlags: 0)
!117 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !118, file: !33, line: 1898)
!118 = !DISubprogram(name: "cbrtf", scope: !29, file: !29, line: 152, type: !96, flags: DIFlagPrototyped, spFlags: 0)
!119 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !120, file: !33, line: 1899)
!120 = !DISubprogram(name: "cbrtl", scope: !29, file: !29, line: 152, type: !100, flags: DIFlagPrototyped, spFlags: 0)
!121 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !122, file: !33, line: 1901)
!122 = !DISubprogram(name: "copysign", scope: !29, file: !29, line: 198, type: !40, flags: DIFlagPrototyped, spFlags: 0)
!123 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !124, file: !33, line: 1902)
!124 = !DISubprogram(name: "copysignf", scope: !29, file: !29, line: 198, type: !125, flags: DIFlagPrototyped, spFlags: 0)
!125 = !DISubroutineType(types: !126)
!126 = !{!91, !91, !91}
!127 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !128, file: !33, line: 1903)
!128 = !DISubprogram(name: "copysignl", scope: !29, file: !29, line: 198, type: !129, flags: DIFlagPrototyped, spFlags: 0)
!129 = !DISubroutineType(types: !130)
!130 = !{!102, !102, !102}
!131 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !132, file: !33, line: 1905)
!132 = !DISubprogram(name: "erf", scope: !29, file: !29, line: 231, type: !30, flags: DIFlagPrototyped, spFlags: 0)
!133 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !134, file: !33, line: 1906)
!134 = !DISubprogram(name: "erff", scope: !29, file: !29, line: 231, type: !96, flags: DIFlagPrototyped, spFlags: 0)
!135 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !136, file: !33, line: 1907)
!136 = !DISubprogram(name: "erfl", scope: !29, file: !29, line: 231, type: !100, flags: DIFlagPrototyped, spFlags: 0)
!137 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !138, file: !33, line: 1909)
!138 = !DISubprogram(name: "erfc", scope: !29, file: !29, line: 232, type: !30, flags: DIFlagPrototyped, spFlags: 0)
!139 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !140, file: !33, line: 1910)
!140 = !DISubprogram(name: "erfcf", scope: !29, file: !29, line: 232, type: !96, flags: DIFlagPrototyped, spFlags: 0)
!141 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !142, file: !33, line: 1911)
!142 = !DISubprogram(name: "erfcl", scope: !29, file: !29, line: 232, type: !100, flags: DIFlagPrototyped, spFlags: 0)
!143 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !144, file: !33, line: 1913)
!144 = !DISubprogram(name: "exp2", scope: !29, file: !29, line: 130, type: !30, flags: DIFlagPrototyped, spFlags: 0)
!145 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !146, file: !33, line: 1914)
!146 = !DISubprogram(name: "exp2f", scope: !29, file: !29, line: 130, type: !96, flags: DIFlagPrototyped, spFlags: 0)
!147 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !148, file: !33, line: 1915)
!148 = !DISubprogram(name: "exp2l", scope: !29, file: !29, line: 130, type: !100, flags: DIFlagPrototyped, spFlags: 0)
!149 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !150, file: !33, line: 1917)
!150 = !DISubprogram(name: "expm1", scope: !29, file: !29, line: 119, type: !30, flags: DIFlagPrototyped, spFlags: 0)
!151 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !152, file: !33, line: 1918)
!152 = !DISubprogram(name: "expm1f", scope: !29, file: !29, line: 119, type: !96, flags: DIFlagPrototyped, spFlags: 0)
!153 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !154, file: !33, line: 1919)
!154 = !DISubprogram(name: "expm1l", scope: !29, file: !29, line: 119, type: !100, flags: DIFlagPrototyped, spFlags: 0)
!155 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !156, file: !33, line: 1921)
!156 = !DISubprogram(name: "fdim", scope: !29, file: !29, line: 329, type: !40, flags: DIFlagPrototyped, spFlags: 0)
!157 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !158, file: !33, line: 1922)
!158 = !DISubprogram(name: "fdimf", scope: !29, file: !29, line: 329, type: !125, flags: DIFlagPrototyped, spFlags: 0)
!159 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !160, file: !33, line: 1923)
!160 = !DISubprogram(name: "fdiml", scope: !29, file: !29, line: 329, type: !129, flags: DIFlagPrototyped, spFlags: 0)
!161 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !162, file: !33, line: 1925)
!162 = !DISubprogram(name: "fma", scope: !29, file: !29, line: 340, type: !163, flags: DIFlagPrototyped, spFlags: 0)
!163 = !DISubroutineType(types: !164)
!164 = !{!32, !32, !32, !32}
!165 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !166, file: !33, line: 1926)
!166 = !DISubprogram(name: "fmaf", scope: !29, file: !29, line: 340, type: !167, flags: DIFlagPrototyped, spFlags: 0)
!167 = !DISubroutineType(types: !168)
!168 = !{!91, !91, !91, !91}
!169 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !170, file: !33, line: 1927)
!170 = !DISubprogram(name: "fmal", scope: !29, file: !29, line: 340, type: !171, flags: DIFlagPrototyped, spFlags: 0)
!171 = !DISubroutineType(types: !172)
!172 = !{!102, !102, !102, !102}
!173 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !174, file: !33, line: 1929)
!174 = !DISubprogram(name: "fmax", scope: !29, file: !29, line: 333, type: !40, flags: DIFlagPrototyped, spFlags: 0)
!175 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !176, file: !33, line: 1930)
!176 = !DISubprogram(name: "fmaxf", scope: !29, file: !29, line: 333, type: !125, flags: DIFlagPrototyped, spFlags: 0)
!177 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !178, file: !33, line: 1931)
!178 = !DISubprogram(name: "fmaxl", scope: !29, file: !29, line: 333, type: !129, flags: DIFlagPrototyped, spFlags: 0)
!179 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !180, file: !33, line: 1933)
!180 = !DISubprogram(name: "fmin", scope: !29, file: !29, line: 336, type: !40, flags: DIFlagPrototyped, spFlags: 0)
!181 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !182, file: !33, line: 1934)
!182 = !DISubprogram(name: "fminf", scope: !29, file: !29, line: 336, type: !125, flags: DIFlagPrototyped, spFlags: 0)
!183 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !184, file: !33, line: 1935)
!184 = !DISubprogram(name: "fminl", scope: !29, file: !29, line: 336, type: !129, flags: DIFlagPrototyped, spFlags: 0)
!185 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !186, file: !33, line: 1937)
!186 = !DISubprogram(name: "hypot", scope: !29, file: !29, line: 147, type: !40, flags: DIFlagPrototyped, spFlags: 0)
!187 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !188, file: !33, line: 1938)
!188 = !DISubprogram(name: "hypotf", scope: !29, file: !29, line: 147, type: !125, flags: DIFlagPrototyped, spFlags: 0)
!189 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !190, file: !33, line: 1939)
!190 = !DISubprogram(name: "hypotl", scope: !29, file: !29, line: 147, type: !129, flags: DIFlagPrototyped, spFlags: 0)
!191 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !192, file: !33, line: 1941)
!192 = !DISubprogram(name: "ilogb", scope: !29, file: !29, line: 283, type: !193, flags: DIFlagPrototyped, spFlags: 0)
!193 = !DISubroutineType(types: !194)
!194 = !{!25, !32}
!195 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !196, file: !33, line: 1942)
!196 = !DISubprogram(name: "ilogbf", scope: !29, file: !29, line: 283, type: !197, flags: DIFlagPrototyped, spFlags: 0)
!197 = !DISubroutineType(types: !198)
!198 = !{!25, !91}
!199 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !200, file: !33, line: 1943)
!200 = !DISubprogram(name: "ilogbl", scope: !29, file: !29, line: 283, type: !201, flags: DIFlagPrototyped, spFlags: 0)
!201 = !DISubroutineType(types: !202)
!202 = !{!25, !102}
!203 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !204, file: !33, line: 1945)
!204 = !DISubprogram(name: "lgamma", scope: !29, file: !29, line: 233, type: !30, flags: DIFlagPrototyped, spFlags: 0)
!205 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !206, file: !33, line: 1946)
!206 = !DISubprogram(name: "lgammaf", scope: !29, file: !29, line: 233, type: !96, flags: DIFlagPrototyped, spFlags: 0)
!207 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !208, file: !33, line: 1947)
!208 = !DISubprogram(name: "lgammal", scope: !29, file: !29, line: 233, type: !100, flags: DIFlagPrototyped, spFlags: 0)
!209 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !210, file: !33, line: 1950)
!210 = !DISubprogram(name: "llrint", scope: !29, file: !29, line: 319, type: !211, flags: DIFlagPrototyped, spFlags: 0)
!211 = !DISubroutineType(types: !212)
!212 = !{!213, !32}
!213 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!214 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !215, file: !33, line: 1951)
!215 = !DISubprogram(name: "llrintf", scope: !29, file: !29, line: 319, type: !216, flags: DIFlagPrototyped, spFlags: 0)
!216 = !DISubroutineType(types: !217)
!217 = !{!213, !91}
!218 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !219, file: !33, line: 1952)
!219 = !DISubprogram(name: "llrintl", scope: !29, file: !29, line: 319, type: !220, flags: DIFlagPrototyped, spFlags: 0)
!220 = !DISubroutineType(types: !221)
!221 = !{!213, !102}
!222 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !223, file: !33, line: 1954)
!223 = !DISubprogram(name: "llround", scope: !29, file: !29, line: 325, type: !211, flags: DIFlagPrototyped, spFlags: 0)
!224 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !225, file: !33, line: 1955)
!225 = !DISubprogram(name: "llroundf", scope: !29, file: !29, line: 325, type: !216, flags: DIFlagPrototyped, spFlags: 0)
!226 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !227, file: !33, line: 1956)
!227 = !DISubprogram(name: "llroundl", scope: !29, file: !29, line: 325, type: !220, flags: DIFlagPrototyped, spFlags: 0)
!228 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !229, file: !33, line: 1959)
!229 = !DISubprogram(name: "log1p", scope: !29, file: !29, line: 122, type: !30, flags: DIFlagPrototyped, spFlags: 0)
!230 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !231, file: !33, line: 1960)
!231 = !DISubprogram(name: "log1pf", scope: !29, file: !29, line: 122, type: !96, flags: DIFlagPrototyped, spFlags: 0)
!232 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !233, file: !33, line: 1961)
!233 = !DISubprogram(name: "log1pl", scope: !29, file: !29, line: 122, type: !100, flags: DIFlagPrototyped, spFlags: 0)
!234 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !235, file: !33, line: 1963)
!235 = !DISubprogram(name: "log2", scope: !29, file: !29, line: 133, type: !30, flags: DIFlagPrototyped, spFlags: 0)
!236 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !237, file: !33, line: 1964)
!237 = !DISubprogram(name: "log2f", scope: !29, file: !29, line: 133, type: !96, flags: DIFlagPrototyped, spFlags: 0)
!238 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !239, file: !33, line: 1965)
!239 = !DISubprogram(name: "log2l", scope: !29, file: !29, line: 133, type: !100, flags: DIFlagPrototyped, spFlags: 0)
!240 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !241, file: !33, line: 1967)
!241 = !DISubprogram(name: "logb", scope: !29, file: !29, line: 125, type: !30, flags: DIFlagPrototyped, spFlags: 0)
!242 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !243, file: !33, line: 1968)
!243 = !DISubprogram(name: "logbf", scope: !29, file: !29, line: 125, type: !96, flags: DIFlagPrototyped, spFlags: 0)
!244 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !245, file: !33, line: 1969)
!245 = !DISubprogram(name: "logbl", scope: !29, file: !29, line: 125, type: !100, flags: DIFlagPrototyped, spFlags: 0)
!246 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !247, file: !33, line: 1971)
!247 = !DISubprogram(name: "lrint", scope: !29, file: !29, line: 317, type: !248, flags: DIFlagPrototyped, spFlags: 0)
!248 = !DISubroutineType(types: !249)
!249 = !{!250, !32}
!250 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!251 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !252, file: !33, line: 1972)
!252 = !DISubprogram(name: "lrintf", scope: !29, file: !29, line: 317, type: !253, flags: DIFlagPrototyped, spFlags: 0)
!253 = !DISubroutineType(types: !254)
!254 = !{!250, !91}
!255 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !256, file: !33, line: 1973)
!256 = !DISubprogram(name: "lrintl", scope: !29, file: !29, line: 317, type: !257, flags: DIFlagPrototyped, spFlags: 0)
!257 = !DISubroutineType(types: !258)
!258 = !{!250, !102}
!259 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !260, file: !33, line: 1975)
!260 = !DISubprogram(name: "lround", scope: !29, file: !29, line: 323, type: !248, flags: DIFlagPrototyped, spFlags: 0)
!261 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !262, file: !33, line: 1976)
!262 = !DISubprogram(name: "lroundf", scope: !29, file: !29, line: 323, type: !253, flags: DIFlagPrototyped, spFlags: 0)
!263 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !264, file: !33, line: 1977)
!264 = !DISubprogram(name: "lroundl", scope: !29, file: !29, line: 323, type: !257, flags: DIFlagPrototyped, spFlags: 0)
!265 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !266, file: !33, line: 1979)
!266 = !DISubprogram(name: "nan", scope: !29, file: !29, line: 203, type: !267, flags: DIFlagPrototyped, spFlags: 0)
!267 = !DISubroutineType(types: !268)
!268 = !{!32, !269}
!269 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !270, size: 64)
!270 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !271)
!271 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!272 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !273, file: !33, line: 1980)
!273 = !DISubprogram(name: "nanf", scope: !29, file: !29, line: 203, type: !274, flags: DIFlagPrototyped, spFlags: 0)
!274 = !DISubroutineType(types: !275)
!275 = !{!91, !269}
!276 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !277, file: !33, line: 1981)
!277 = !DISubprogram(name: "nanl", scope: !29, file: !29, line: 203, type: !278, flags: DIFlagPrototyped, spFlags: 0)
!278 = !DISubroutineType(types: !279)
!279 = !{!102, !269}
!280 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !281, file: !33, line: 1983)
!281 = !DISubprogram(name: "nearbyint", scope: !29, file: !29, line: 297, type: !30, flags: DIFlagPrototyped, spFlags: 0)
!282 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !283, file: !33, line: 1984)
!283 = !DISubprogram(name: "nearbyintf", scope: !29, file: !29, line: 297, type: !96, flags: DIFlagPrototyped, spFlags: 0)
!284 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !285, file: !33, line: 1985)
!285 = !DISubprogram(name: "nearbyintl", scope: !29, file: !29, line: 297, type: !100, flags: DIFlagPrototyped, spFlags: 0)
!286 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !287, file: !33, line: 1987)
!287 = !DISubprogram(name: "nextafter", scope: !29, file: !29, line: 262, type: !40, flags: DIFlagPrototyped, spFlags: 0)
!288 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !289, file: !33, line: 1988)
!289 = !DISubprogram(name: "nextafterf", scope: !29, file: !29, line: 262, type: !125, flags: DIFlagPrototyped, spFlags: 0)
!290 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !291, file: !33, line: 1989)
!291 = !DISubprogram(name: "nextafterl", scope: !29, file: !29, line: 262, type: !129, flags: DIFlagPrototyped, spFlags: 0)
!292 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !293, file: !33, line: 1991)
!293 = !DISubprogram(name: "nexttoward", scope: !29, file: !29, line: 264, type: !294, flags: DIFlagPrototyped, spFlags: 0)
!294 = !DISubroutineType(types: !295)
!295 = !{!32, !32, !102}
!296 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !297, file: !33, line: 1992)
!297 = !DISubprogram(name: "nexttowardf", scope: !29, file: !29, line: 264, type: !298, flags: DIFlagPrototyped, spFlags: 0)
!298 = !DISubroutineType(types: !299)
!299 = !{!91, !91, !102}
!300 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !301, file: !33, line: 1993)
!301 = !DISubprogram(name: "nexttowardl", scope: !29, file: !29, line: 264, type: !129, flags: DIFlagPrototyped, spFlags: 0)
!302 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !303, file: !33, line: 1995)
!303 = !DISubprogram(name: "remainder", scope: !29, file: !29, line: 275, type: !40, flags: DIFlagPrototyped, spFlags: 0)
!304 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !305, file: !33, line: 1996)
!305 = !DISubprogram(name: "remainderf", scope: !29, file: !29, line: 275, type: !125, flags: DIFlagPrototyped, spFlags: 0)
!306 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !307, file: !33, line: 1997)
!307 = !DISubprogram(name: "remainderl", scope: !29, file: !29, line: 275, type: !129, flags: DIFlagPrototyped, spFlags: 0)
!308 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !309, file: !33, line: 1999)
!309 = !DISubprogram(name: "remquo", scope: !29, file: !29, line: 310, type: !310, flags: DIFlagPrototyped, spFlags: 0)
!310 = !DISubroutineType(types: !311)
!311 = !{!32, !32, !32, !60}
!312 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !313, file: !33, line: 2000)
!313 = !DISubprogram(name: "remquof", scope: !29, file: !29, line: 310, type: !314, flags: DIFlagPrototyped, spFlags: 0)
!314 = !DISubroutineType(types: !315)
!315 = !{!91, !91, !91, !60}
!316 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !317, file: !33, line: 2001)
!317 = !DISubprogram(name: "remquol", scope: !29, file: !29, line: 310, type: !318, flags: DIFlagPrototyped, spFlags: 0)
!318 = !DISubroutineType(types: !319)
!319 = !{!102, !102, !102, !60}
!320 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !321, file: !33, line: 2003)
!321 = !DISubprogram(name: "rint", scope: !29, file: !29, line: 259, type: !30, flags: DIFlagPrototyped, spFlags: 0)
!322 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !323, file: !33, line: 2004)
!323 = !DISubprogram(name: "rintf", scope: !29, file: !29, line: 259, type: !96, flags: DIFlagPrototyped, spFlags: 0)
!324 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !325, file: !33, line: 2005)
!325 = !DISubprogram(name: "rintl", scope: !29, file: !29, line: 259, type: !100, flags: DIFlagPrototyped, spFlags: 0)
!326 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !327, file: !33, line: 2007)
!327 = !DISubprogram(name: "round", scope: !29, file: !29, line: 301, type: !30, flags: DIFlagPrototyped, spFlags: 0)
!328 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !329, file: !33, line: 2008)
!329 = !DISubprogram(name: "roundf", scope: !29, file: !29, line: 301, type: !96, flags: DIFlagPrototyped, spFlags: 0)
!330 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !331, file: !33, line: 2009)
!331 = !DISubprogram(name: "roundl", scope: !29, file: !29, line: 301, type: !100, flags: DIFlagPrototyped, spFlags: 0)
!332 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !333, file: !33, line: 2011)
!333 = !DISubprogram(name: "scalbln", scope: !29, file: !29, line: 293, type: !334, flags: DIFlagPrototyped, spFlags: 0)
!334 = !DISubroutineType(types: !335)
!335 = !{!32, !32, !250}
!336 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !337, file: !33, line: 2012)
!337 = !DISubprogram(name: "scalblnf", scope: !29, file: !29, line: 293, type: !338, flags: DIFlagPrototyped, spFlags: 0)
!338 = !DISubroutineType(types: !339)
!339 = !{!91, !91, !250}
!340 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !341, file: !33, line: 2013)
!341 = !DISubprogram(name: "scalblnl", scope: !29, file: !29, line: 293, type: !342, flags: DIFlagPrototyped, spFlags: 0)
!342 = !DISubroutineType(types: !343)
!343 = !{!102, !102, !250}
!344 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !345, file: !33, line: 2015)
!345 = !DISubprogram(name: "scalbn", scope: !29, file: !29, line: 279, type: !63, flags: DIFlagPrototyped, spFlags: 0)
!346 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !347, file: !33, line: 2016)
!347 = !DISubprogram(name: "scalbnf", scope: !29, file: !29, line: 279, type: !348, flags: DIFlagPrototyped, spFlags: 0)
!348 = !DISubroutineType(types: !349)
!349 = !{!91, !91, !25}
!350 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !351, file: !33, line: 2017)
!351 = !DISubprogram(name: "scalbnl", scope: !29, file: !29, line: 279, type: !352, flags: DIFlagPrototyped, spFlags: 0)
!352 = !DISubroutineType(types: !353)
!353 = !{!102, !102, !25}
!354 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !355, file: !33, line: 2019)
!355 = !DISubprogram(name: "tgamma", scope: !29, file: !29, line: 238, type: !30, flags: DIFlagPrototyped, spFlags: 0)
!356 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !357, file: !33, line: 2020)
!357 = !DISubprogram(name: "tgammaf", scope: !29, file: !29, line: 238, type: !96, flags: DIFlagPrototyped, spFlags: 0)
!358 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !359, file: !33, line: 2021)
!359 = !DISubprogram(name: "tgammal", scope: !29, file: !29, line: 238, type: !100, flags: DIFlagPrototyped, spFlags: 0)
!360 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !361, file: !33, line: 2023)
!361 = !DISubprogram(name: "trunc", scope: !29, file: !29, line: 305, type: !30, flags: DIFlagPrototyped, spFlags: 0)
!362 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !363, file: !33, line: 2024)
!363 = !DISubprogram(name: "truncf", scope: !29, file: !29, line: 305, type: !96, flags: DIFlagPrototyped, spFlags: 0)
!364 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !365, file: !33, line: 2025)
!365 = !DISubprogram(name: "truncl", scope: !29, file: !29, line: 305, type: !100, flags: DIFlagPrototyped, spFlags: 0)
!366 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !367, entity: !368, file: !369, line: 58)
!367 = !DINamespace(name: "__gnu_debug", scope: null)
!368 = !DINamespace(name: "__debug", scope: !20)
!369 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/debug/debug.h", directory: "", checksumkind: CSK_MD5, checksum: "752210a319f5f5d356cc29cd1ce3cdc7")
!370 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !371, file: !373, line: 131)
!371 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !22, line: 63, baseType: !372)
!372 = !DICompositeType(tag: DW_TAG_structure_type, file: !22, line: 59, size: 64, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!373 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/cstdlib", directory: "")
!374 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !375, file: !373, line: 132)
!375 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !22, line: 71, baseType: !376)
!376 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !22, line: 67, size: 128, flags: DIFlagTypePassByValue, elements: !377, identifier: "_ZTS6ldiv_t")
!377 = !{!378, !379}
!378 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !376, file: !22, line: 69, baseType: !250, size: 64)
!379 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !376, file: !22, line: 70, baseType: !250, size: 64, offset: 64)
!380 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !381, file: !373, line: 134)
!381 = !DISubprogram(name: "abort", scope: !22, file: !22, line: 730, type: !382, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!382 = !DISubroutineType(types: !383)
!383 = !{null}
!384 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !385, file: !373, line: 136)
!385 = !DISubprogram(name: "aligned_alloc", scope: !22, file: !22, line: 724, type: !386, flags: DIFlagPrototyped, spFlags: 0)
!386 = !DISubroutineType(types: !387)
!387 = !{!388, !389, !389}
!388 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!389 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !390, line: 18, baseType: !391)
!390 = !DIFile(filename: "/opt/rocm-6.4.2/lib/llvm/lib/clang/19/include/__stddef_size_t.h", directory: "", checksumkind: CSK_MD5, checksum: "2c44e821a2b1951cde2eb0fb2e656867")
!391 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!392 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !393, file: !373, line: 138)
!393 = !DISubprogram(name: "atexit", scope: !22, file: !22, line: 734, type: !394, flags: DIFlagPrototyped, spFlags: 0)
!394 = !DISubroutineType(types: !395)
!395 = !{!25, !396}
!396 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !382, size: 64)
!397 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !398, file: !373, line: 141)
!398 = !DISubprogram(name: "at_quick_exit", scope: !22, file: !22, line: 739, type: !394, flags: DIFlagPrototyped, spFlags: 0)
!399 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !400, file: !373, line: 144)
!400 = !DISubprogram(name: "atof", scope: !22, file: !22, line: 102, type: !267, flags: DIFlagPrototyped, spFlags: 0)
!401 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !402, file: !373, line: 145)
!402 = !DISubprogram(name: "atoi", scope: !22, file: !22, line: 105, type: !403, flags: DIFlagPrototyped, spFlags: 0)
!403 = !DISubroutineType(types: !404)
!404 = !{!25, !269}
!405 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !406, file: !373, line: 146)
!406 = !DISubprogram(name: "atol", scope: !22, file: !22, line: 108, type: !407, flags: DIFlagPrototyped, spFlags: 0)
!407 = !DISubroutineType(types: !408)
!408 = !{!250, !269}
!409 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !410, file: !373, line: 147)
!410 = !DISubprogram(name: "bsearch", scope: !22, file: !22, line: 960, type: !411, flags: DIFlagPrototyped, spFlags: 0)
!411 = !DISubroutineType(types: !412)
!412 = !{!388, !413, !413, !389, !389, !415}
!413 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !414, size: 64)
!414 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!415 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !22, line: 948, baseType: !416)
!416 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !417, size: 64)
!417 = !DISubroutineType(types: !418)
!418 = !{!25, !413, !413}
!419 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !420, file: !373, line: 148)
!420 = !DISubprogram(name: "calloc", scope: !22, file: !22, line: 675, type: !386, flags: DIFlagPrototyped, spFlags: 0)
!421 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !422, file: !373, line: 149)
!422 = !DISubprogram(name: "div", scope: !22, file: !22, line: 992, type: !423, flags: DIFlagPrototyped, spFlags: 0)
!423 = !DISubroutineType(types: !424)
!424 = !{!371, !25, !25}
!425 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !426, file: !373, line: 150)
!426 = !DISubprogram(name: "exit", scope: !22, file: !22, line: 756, type: !427, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!427 = !DISubroutineType(types: !428)
!428 = !{null, !25}
!429 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !430, file: !373, line: 151)
!430 = !DISubprogram(name: "free", scope: !22, file: !22, line: 687, type: !431, flags: DIFlagPrototyped, spFlags: 0)
!431 = !DISubroutineType(types: !432)
!432 = !{null, !388}
!433 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !434, file: !373, line: 152)
!434 = !DISubprogram(name: "getenv", scope: !22, file: !22, line: 773, type: !435, flags: DIFlagPrototyped, spFlags: 0)
!435 = !DISubroutineType(types: !436)
!436 = !{!437, !269}
!437 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !271, size: 64)
!438 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !439, file: !373, line: 153)
!439 = !DISubprogram(name: "labs", scope: !22, file: !22, line: 981, type: !440, flags: DIFlagPrototyped, spFlags: 0)
!440 = !DISubroutineType(types: !441)
!441 = !{!250, !250}
!442 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !443, file: !373, line: 154)
!443 = !DISubprogram(name: "ldiv", scope: !22, file: !22, line: 994, type: !444, flags: DIFlagPrototyped, spFlags: 0)
!444 = !DISubroutineType(types: !445)
!445 = !{!375, !250, !250}
!446 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !447, file: !373, line: 155)
!447 = !DISubprogram(name: "malloc", scope: !22, file: !22, line: 672, type: !448, flags: DIFlagPrototyped, spFlags: 0)
!448 = !DISubroutineType(types: !449)
!449 = !{!388, !389}
!450 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !451, file: !373, line: 157)
!451 = !DISubprogram(name: "mblen", scope: !22, file: !22, line: 1062, type: !452, flags: DIFlagPrototyped, spFlags: 0)
!452 = !DISubroutineType(types: !453)
!453 = !{!25, !269, !389}
!454 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !455, file: !373, line: 158)
!455 = !DISubprogram(name: "mbstowcs", scope: !22, file: !22, line: 1073, type: !456, flags: DIFlagPrototyped, spFlags: 0)
!456 = !DISubroutineType(types: !457)
!457 = !{!389, !458, !461, !389}
!458 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !459)
!459 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !460, size: 64)
!460 = !DIBasicType(name: "wchar_t", size: 32, encoding: DW_ATE_signed)
!461 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !269)
!462 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !463, file: !373, line: 159)
!463 = !DISubprogram(name: "mbtowc", scope: !22, file: !22, line: 1065, type: !464, flags: DIFlagPrototyped, spFlags: 0)
!464 = !DISubroutineType(types: !465)
!465 = !{!25, !458, !461, !389}
!466 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !467, file: !373, line: 161)
!467 = !DISubprogram(name: "qsort", scope: !22, file: !22, line: 970, type: !468, flags: DIFlagPrototyped, spFlags: 0)
!468 = !DISubroutineType(types: !469)
!469 = !{null, !388, !389, !389, !415}
!470 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !471, file: !373, line: 164)
!471 = !DISubprogram(name: "quick_exit", scope: !22, file: !22, line: 762, type: !427, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!472 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !473, file: !373, line: 167)
!473 = !DISubprogram(name: "rand", scope: !22, file: !22, line: 573, type: !474, flags: DIFlagPrototyped, spFlags: 0)
!474 = !DISubroutineType(types: !475)
!475 = !{!25}
!476 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !477, file: !373, line: 168)
!477 = !DISubprogram(name: "realloc", scope: !22, file: !22, line: 683, type: !478, flags: DIFlagPrototyped, spFlags: 0)
!478 = !DISubroutineType(types: !479)
!479 = !{!388, !388, !389}
!480 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !481, file: !373, line: 169)
!481 = !DISubprogram(name: "srand", scope: !22, file: !22, line: 575, type: !482, flags: DIFlagPrototyped, spFlags: 0)
!482 = !DISubroutineType(types: !483)
!483 = !{null, !11}
!484 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !485, file: !373, line: 170)
!485 = !DISubprogram(name: "strtod", scope: !22, file: !22, line: 118, type: !486, flags: DIFlagPrototyped, spFlags: 0)
!486 = !DISubroutineType(types: !487)
!487 = !{!32, !461, !488}
!488 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !489)
!489 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !437, size: 64)
!490 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !491, file: !373, line: 171)
!491 = !DISubprogram(name: "strtol", linkageName: "__isoc23_strtol", scope: !22, file: !22, line: 215, type: !492, flags: DIFlagPrototyped, spFlags: 0)
!492 = !DISubroutineType(types: !493)
!493 = !{!250, !461, !488, !25}
!494 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !495, file: !373, line: 172)
!495 = !DISubprogram(name: "strtoul", linkageName: "__isoc23_strtoul", scope: !22, file: !22, line: 219, type: !496, flags: DIFlagPrototyped, spFlags: 0)
!496 = !DISubroutineType(types: !497)
!497 = !{!391, !461, !488, !25}
!498 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !499, file: !373, line: 173)
!499 = !DISubprogram(name: "system", scope: !22, file: !22, line: 923, type: !403, flags: DIFlagPrototyped, spFlags: 0)
!500 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !501, file: !373, line: 175)
!501 = !DISubprogram(name: "wcstombs", scope: !22, file: !22, line: 1077, type: !502, flags: DIFlagPrototyped, spFlags: 0)
!502 = !DISubroutineType(types: !503)
!503 = !{!389, !504, !505, !389}
!504 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !437)
!505 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !506)
!506 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !507, size: 64)
!507 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !460)
!508 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !509, file: !373, line: 176)
!509 = !DISubprogram(name: "wctomb", scope: !22, file: !22, line: 1069, type: !510, flags: DIFlagPrototyped, spFlags: 0)
!510 = !DISubroutineType(types: !511)
!511 = !{!25, !437, !460}
!512 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !513, entity: !514, file: !373, line: 204)
!513 = !DINamespace(name: "__gnu_cxx", scope: null)
!514 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !22, line: 81, baseType: !515)
!515 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !22, line: 77, size: 128, flags: DIFlagTypePassByValue, elements: !516, identifier: "_ZTS7lldiv_t")
!516 = !{!517, !518}
!517 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !515, file: !22, line: 79, baseType: !213, size: 64)
!518 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !515, file: !22, line: 80, baseType: !213, size: 64, offset: 64)
!519 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !513, entity: !520, file: !373, line: 210)
!520 = !DISubprogram(name: "_Exit", scope: !22, file: !22, line: 768, type: !427, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!521 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !513, entity: !522, file: !373, line: 214)
!522 = !DISubprogram(name: "llabs", scope: !22, file: !22, line: 984, type: !523, flags: DIFlagPrototyped, spFlags: 0)
!523 = !DISubroutineType(types: !524)
!524 = !{!213, !213}
!525 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !513, entity: !526, file: !373, line: 220)
!526 = !DISubprogram(name: "lldiv", scope: !22, file: !22, line: 998, type: !527, flags: DIFlagPrototyped, spFlags: 0)
!527 = !DISubroutineType(types: !528)
!528 = !{!514, !213, !213}
!529 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !513, entity: !530, file: !373, line: 231)
!530 = !DISubprogram(name: "atoll", scope: !22, file: !22, line: 113, type: !531, flags: DIFlagPrototyped, spFlags: 0)
!531 = !DISubroutineType(types: !532)
!532 = !{!213, !269}
!533 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !513, entity: !534, file: !373, line: 232)
!534 = !DISubprogram(name: "strtoll", linkageName: "__isoc23_strtoll", scope: !22, file: !22, line: 238, type: !535, flags: DIFlagPrototyped, spFlags: 0)
!535 = !DISubroutineType(types: !536)
!536 = !{!213, !461, !488, !25}
!537 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !513, entity: !538, file: !373, line: 233)
!538 = !DISubprogram(name: "strtoull", linkageName: "__isoc23_strtoull", scope: !22, file: !22, line: 243, type: !539, flags: DIFlagPrototyped, spFlags: 0)
!539 = !DISubroutineType(types: !540)
!540 = !{!541, !461, !488, !25}
!541 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!542 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !513, entity: !543, file: !373, line: 235)
!543 = !DISubprogram(name: "strtof", scope: !22, file: !22, line: 124, type: !544, flags: DIFlagPrototyped, spFlags: 0)
!544 = !DISubroutineType(types: !545)
!545 = !{!91, !461, !488}
!546 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !513, entity: !547, file: !373, line: 236)
!547 = !DISubprogram(name: "strtold", scope: !22, file: !22, line: 127, type: !548, flags: DIFlagPrototyped, spFlags: 0)
!548 = !DISubroutineType(types: !549)
!549 = !{!102, !461, !488}
!550 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !514, file: !373, line: 244)
!551 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !520, file: !373, line: 246)
!552 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !522, file: !373, line: 248)
!553 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !554, file: !373, line: 249)
!554 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !513, file: !373, line: 217, type: !527, flags: DIFlagPrototyped, spFlags: 0)
!555 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !526, file: !373, line: 250)
!556 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !530, file: !373, line: 252)
!557 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !543, file: !373, line: 253)
!558 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !534, file: !373, line: 254)
!559 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !538, file: !373, line: 255)
!560 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !547, file: !373, line: 256)
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
!571 = !DISubprogram(name: "abs", linkageName: "_ZSt3absn", scope: !20, file: !26, line: 85, type: !572, flags: DIFlagPrototyped, spFlags: 0)
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
!599 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !600, file: !601, line: 200)
!600 = !DISubprogram(name: "abs", linkageName: "_ZL3absd", scope: !601, file: !601, line: 28, type: !30, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!601 = !DIFile(filename: "/opt/rocm-6.4.2/lib/llvm/lib/clang/19/include/__clang_cuda_math_forward_declares.h", directory: "", checksumkind: CSK_MD5, checksum: "7fcaa66c0bf1529fc7d2359f3dc2dd30")
!602 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !603, file: !601, line: 201)
!603 = !DISubprogram(name: "acos", linkageName: "_ZL4acosf", scope: !601, file: !601, line: 32, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!604 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !605, file: !601, line: 202)
!605 = !DISubprogram(name: "acosh", linkageName: "_ZL5acoshf", scope: !601, file: !601, line: 34, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!606 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !607, file: !601, line: 203)
!607 = !DISubprogram(name: "asin", linkageName: "_ZL4asinf", scope: !601, file: !601, line: 36, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!608 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !609, file: !601, line: 204)
!609 = !DISubprogram(name: "asinh", linkageName: "_ZL5asinhf", scope: !601, file: !601, line: 38, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!610 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !611, file: !601, line: 205)
!611 = !DISubprogram(name: "atan", linkageName: "_ZL4atanf", scope: !601, file: !601, line: 42, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!612 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !613, file: !601, line: 206)
!613 = !DISubprogram(name: "atan2", linkageName: "_ZL5atan2ff", scope: !601, file: !601, line: 40, type: !125, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!614 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !615, file: !601, line: 207)
!615 = !DISubprogram(name: "atanh", linkageName: "_ZL5atanhf", scope: !601, file: !601, line: 44, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!616 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !617, file: !601, line: 208)
!617 = !DISubprogram(name: "cbrt", linkageName: "_ZL4cbrtf", scope: !601, file: !601, line: 46, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!618 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !619, file: !601, line: 209)
!619 = !DISubprogram(name: "ceil", linkageName: "_ZL4ceilf", scope: !601, file: !601, line: 48, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!620 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !621, file: !601, line: 210)
!621 = !DISubprogram(name: "copysign", linkageName: "_ZL8copysignff", scope: !601, file: !601, line: 50, type: !125, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!622 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !623, file: !601, line: 211)
!623 = !DISubprogram(name: "cos", linkageName: "_ZL3cosf", scope: !601, file: !601, line: 52, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!624 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !625, file: !601, line: 212)
!625 = !DISubprogram(name: "cosh", linkageName: "_ZL4coshf", scope: !601, file: !601, line: 54, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!626 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !627, file: !601, line: 213)
!627 = !DISubprogram(name: "erf", linkageName: "_ZL3erff", scope: !601, file: !601, line: 58, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!628 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !629, file: !601, line: 214)
!629 = !DISubprogram(name: "erfc", linkageName: "_ZL4erfcf", scope: !601, file: !601, line: 56, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!630 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !631, file: !601, line: 215)
!631 = !DISubprogram(name: "exp", linkageName: "_ZL3expf", scope: !601, file: !601, line: 62, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!632 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !633, file: !601, line: 216)
!633 = !DISubprogram(name: "exp2", linkageName: "_ZL4exp2f", scope: !601, file: !601, line: 60, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!634 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !635, file: !601, line: 217)
!635 = !DISubprogram(name: "expm1", linkageName: "_ZL5expm1f", scope: !601, file: !601, line: 64, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!636 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !637, file: !601, line: 218)
!637 = !DISubprogram(name: "fabs", linkageName: "_ZL4fabsf", scope: !601, file: !601, line: 66, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!638 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !639, file: !601, line: 219)
!639 = !DISubprogram(name: "fdim", linkageName: "_ZL4fdimff", scope: !601, file: !601, line: 68, type: !125, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!640 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !641, file: !601, line: 220)
!641 = !DISubprogram(name: "floor", linkageName: "_ZL5floorf", scope: !601, file: !601, line: 70, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!642 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !643, file: !601, line: 221)
!643 = !DISubprogram(name: "fma", linkageName: "_ZL3fmafff", scope: !601, file: !601, line: 72, type: !167, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!644 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !645, file: !601, line: 222)
!645 = !DISubprogram(name: "fmax", linkageName: "_ZL4fmaxff", scope: !601, file: !601, line: 74, type: !125, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!646 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !647, file: !601, line: 223)
!647 = !DISubprogram(name: "fmin", linkageName: "_ZL4fminff", scope: !601, file: !601, line: 76, type: !125, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!648 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !649, file: !601, line: 224)
!649 = !DISubprogram(name: "fmod", linkageName: "_ZL4fmodff", scope: !601, file: !601, line: 78, type: !125, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!650 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !651, file: !601, line: 225)
!651 = !DISubprogram(name: "fpclassify", linkageName: "_ZL10fpclassifyf", scope: !601, file: !601, line: 80, type: !197, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!652 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !653, file: !601, line: 226)
!653 = !DISubprogram(name: "frexp", linkageName: "_ZL5frexpfPi", scope: !601, file: !601, line: 82, type: !654, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!654 = !DISubroutineType(types: !655)
!655 = !{!91, !91, !60}
!656 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !657, file: !601, line: 227)
!657 = !DISubprogram(name: "hypot", linkageName: "_ZL5hypotff", scope: !601, file: !601, line: 84, type: !125, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!658 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !659, file: !601, line: 228)
!659 = !DISubprogram(name: "ilogb", linkageName: "_ZL5ilogbf", scope: !601, file: !601, line: 86, type: !197, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!660 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !661, file: !601, line: 229)
!661 = !DISubprogram(name: "isfinite", linkageName: "_ZL8isfinitef", scope: !601, file: !601, line: 91, type: !662, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!662 = !DISubroutineType(types: !663)
!663 = !{!664, !91}
!664 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!665 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !666, file: !601, line: 230)
!666 = !DISubprogram(name: "isgreater", linkageName: "_ZL9isgreaterff", scope: !601, file: !601, line: 95, type: !667, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!667 = !DISubroutineType(types: !668)
!668 = !{!664, !91, !91}
!669 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !670, file: !601, line: 231)
!670 = !DISubprogram(name: "isgreaterequal", linkageName: "_ZL14isgreaterequalff", scope: !601, file: !601, line: 94, type: !667, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!671 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !672, file: !601, line: 232)
!672 = !DISubprogram(name: "isinf", linkageName: "_ZL5isinff", scope: !601, file: !601, line: 100, type: !662, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!673 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !674, file: !601, line: 233)
!674 = !DISubprogram(name: "isless", linkageName: "_ZL6islessff", scope: !601, file: !601, line: 104, type: !667, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!675 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !676, file: !601, line: 234)
!676 = !DISubprogram(name: "islessequal", linkageName: "_ZL11islessequalff", scope: !601, file: !601, line: 103, type: !667, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!677 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !678, file: !601, line: 235)
!678 = !DISubprogram(name: "islessgreater", linkageName: "_ZL13islessgreaterff", scope: !601, file: !601, line: 106, type: !667, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!679 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !680, file: !601, line: 236)
!680 = !DISubprogram(name: "isnan", linkageName: "_ZL5isnanf", scope: !601, file: !601, line: 111, type: !662, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!681 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !682, file: !601, line: 237)
!682 = !DISubprogram(name: "isnormal", linkageName: "_ZL8isnormalf", scope: !601, file: !601, line: 113, type: !662, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!683 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !684, file: !601, line: 238)
!684 = !DISubprogram(name: "isunordered", linkageName: "_ZL11isunorderedff", scope: !601, file: !601, line: 115, type: !667, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!685 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !686, file: !601, line: 239)
!686 = !DISubprogram(name: "labs", linkageName: "_ZL4labsl", scope: !601, file: !601, line: 116, type: !440, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!687 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !688, file: !601, line: 240)
!688 = !DISubprogram(name: "ldexp", linkageName: "_ZL5ldexpfi", scope: !601, file: !601, line: 118, type: !348, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!689 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !690, file: !601, line: 241)
!690 = !DISubprogram(name: "lgamma", linkageName: "_ZL6lgammaf", scope: !601, file: !601, line: 120, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!691 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !692, file: !601, line: 242)
!692 = !DISubprogram(name: "llabs", linkageName: "_ZL5llabsx", scope: !601, file: !601, line: 121, type: !523, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!693 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !694, file: !601, line: 243)
!694 = !DISubprogram(name: "llrint", linkageName: "_ZL6llrintf", scope: !601, file: !601, line: 123, type: !216, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!695 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !696, file: !601, line: 244)
!696 = !DISubprogram(name: "log", linkageName: "_ZL3logf", scope: !601, file: !601, line: 133, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!697 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !698, file: !601, line: 245)
!698 = !DISubprogram(name: "log10", linkageName: "_ZL5log10f", scope: !601, file: !601, line: 125, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!699 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !700, file: !601, line: 246)
!700 = !DISubprogram(name: "log1p", linkageName: "_ZL5log1pf", scope: !601, file: !601, line: 127, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!701 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !702, file: !601, line: 247)
!702 = !DISubprogram(name: "log2", linkageName: "_ZL4log2f", scope: !601, file: !601, line: 129, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!703 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !704, file: !601, line: 248)
!704 = !DISubprogram(name: "logb", linkageName: "_ZL4logbf", scope: !601, file: !601, line: 131, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!705 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !706, file: !601, line: 249)
!706 = !DISubprogram(name: "lrint", linkageName: "_ZL5lrintf", scope: !601, file: !601, line: 135, type: !253, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!707 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !708, file: !601, line: 250)
!708 = !DISubprogram(name: "lround", linkageName: "_ZL6lroundf", scope: !601, file: !601, line: 137, type: !253, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!709 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !710, file: !601, line: 251)
!710 = !DISubprogram(name: "llround", linkageName: "_ZL7llroundf", scope: !601, file: !601, line: 138, type: !216, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!711 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !712, file: !601, line: 252)
!712 = !DISubprogram(name: "modf", linkageName: "_ZL4modffPf", scope: !601, file: !601, line: 140, type: !713, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!713 = !DISubroutineType(types: !714)
!714 = !{!91, !91, !715}
!715 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !91, size: 64)
!716 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !717, file: !601, line: 253)
!717 = !DISubprogram(name: "nan", linkageName: "_ZL3nanPKc", scope: !601, file: !601, line: 141, type: !267, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!718 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !719, file: !601, line: 254)
!719 = !DISubprogram(name: "nanf", linkageName: "_ZL4nanfPKc", scope: !601, file: !601, line: 142, type: !274, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!720 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !721, file: !601, line: 255)
!721 = !DISubprogram(name: "nearbyint", linkageName: "_ZL9nearbyintf", scope: !601, file: !601, line: 144, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!722 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !723, file: !601, line: 256)
!723 = !DISubprogram(name: "nextafter", linkageName: "_ZL9nextafterff", scope: !601, file: !601, line: 146, type: !125, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!724 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !725, file: !601, line: 257)
!725 = !DISubprogram(name: "pow", linkageName: "_ZL3powfi", scope: !601, file: !601, line: 150, type: !348, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!726 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !727, file: !601, line: 258)
!727 = !DISubprogram(name: "remainder", linkageName: "_ZL9remainderff", scope: !601, file: !601, line: 152, type: !125, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!728 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !729, file: !601, line: 259)
!729 = !DISubprogram(name: "remquo", linkageName: "_ZL6remquoffPi", scope: !601, file: !601, line: 154, type: !314, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!730 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !731, file: !601, line: 260)
!731 = !DISubprogram(name: "rint", linkageName: "_ZL4rintf", scope: !601, file: !601, line: 156, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!732 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !733, file: !601, line: 261)
!733 = !DISubprogram(name: "round", linkageName: "_ZL5roundf", scope: !601, file: !601, line: 158, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!734 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !735, file: !601, line: 262)
!735 = !DISubprogram(name: "scalbln", linkageName: "_ZL7scalblnfl", scope: !601, file: !601, line: 160, type: !338, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!736 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !737, file: !601, line: 263)
!737 = !DISubprogram(name: "scalbn", linkageName: "_ZL6scalbnfi", scope: !601, file: !601, line: 162, type: !348, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!738 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !739, file: !601, line: 264)
!739 = !DISubprogram(name: "signbit", linkageName: "_ZL7signbitf", scope: !601, file: !601, line: 167, type: !662, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!740 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !741, file: !601, line: 265)
!741 = !DISubprogram(name: "sin", linkageName: "_ZL3sinf", scope: !601, file: !601, line: 169, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!742 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !743, file: !601, line: 266)
!743 = !DISubprogram(name: "sinh", linkageName: "_ZL4sinhf", scope: !601, file: !601, line: 171, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!744 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !745, file: !601, line: 267)
!745 = !DISubprogram(name: "sqrt", linkageName: "_ZL4sqrtf", scope: !601, file: !601, line: 173, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!746 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !747, file: !601, line: 268)
!747 = !DISubprogram(name: "tan", linkageName: "_ZL3tanf", scope: !601, file: !601, line: 175, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!748 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !749, file: !601, line: 269)
!749 = !DISubprogram(name: "tanh", linkageName: "_ZL4tanhf", scope: !601, file: !601, line: 177, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!750 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !751, file: !601, line: 270)
!751 = !DISubprogram(name: "tgamma", linkageName: "_ZL6tgammaf", scope: !601, file: !601, line: 179, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!752 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !753, file: !601, line: 271)
!753 = !DISubprogram(name: "trunc", linkageName: "_ZL5truncf", scope: !601, file: !601, line: 181, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!754 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !755, file: !757, line: 737)
!755 = !DISubprogram(name: "acosf", linkageName: "_ZL5acosff", scope: !756, file: !756, line: 358, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!756 = !DIFile(filename: "/opt/rocm-6.4.2/lib/llvm/lib/clang/19/include/__clang_hip_math.h", directory: "", checksumkind: CSK_MD5, checksum: "1ddc6320be20cc493976d99e6b1c9853")
!757 = !DIFile(filename: "/opt/rocm-6.4.2/lib/llvm/lib/clang/19/include/__clang_hip_cmath.h", directory: "", checksumkind: CSK_MD5, checksum: "dc1ab1a8805dcbc75cbf36b8a1f9305a")
!758 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !759, file: !757, line: 738)
!759 = !DISubprogram(name: "acoshf", linkageName: "_ZL6acoshff", scope: !756, file: !756, line: 361, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!760 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !761, file: !757, line: 739)
!761 = !DISubprogram(name: "asinf", linkageName: "_ZL5asinff", scope: !756, file: !756, line: 364, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!762 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !763, file: !757, line: 740)
!763 = !DISubprogram(name: "asinhf", linkageName: "_ZL6asinhff", scope: !756, file: !756, line: 367, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!764 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !765, file: !757, line: 741)
!765 = !DISubprogram(name: "atan2f", linkageName: "_ZL6atan2fff", scope: !756, file: !756, line: 370, type: !125, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!766 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !767, file: !757, line: 742)
!767 = !DISubprogram(name: "atanf", linkageName: "_ZL5atanff", scope: !756, file: !756, line: 373, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!768 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !769, file: !757, line: 743)
!769 = !DISubprogram(name: "atanhf", linkageName: "_ZL6atanhff", scope: !756, file: !756, line: 376, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!770 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !771, file: !757, line: 744)
!771 = !DISubprogram(name: "cbrtf", linkageName: "_ZL5cbrtff", scope: !756, file: !756, line: 379, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!772 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !773, file: !757, line: 745)
!773 = !DISubprogram(name: "ceilf", linkageName: "_ZL5ceilff", scope: !756, file: !756, line: 382, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!774 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !775, file: !757, line: 746)
!775 = !DISubprogram(name: "copysignf", linkageName: "_ZL9copysignfff", scope: !756, file: !756, line: 385, type: !125, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!776 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !777, file: !757, line: 747)
!777 = !DISubprogram(name: "cosf", linkageName: "_ZL4cosff", scope: !756, file: !756, line: 388, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!778 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !779, file: !757, line: 748)
!779 = !DISubprogram(name: "coshf", linkageName: "_ZL5coshff", scope: !756, file: !756, line: 391, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!780 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !781, file: !757, line: 749)
!781 = !DISubprogram(name: "erfcf", linkageName: "_ZL5erfcff", scope: !756, file: !756, line: 403, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!782 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !783, file: !757, line: 750)
!783 = !DISubprogram(name: "erff", linkageName: "_ZL4erfff", scope: !756, file: !756, line: 412, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!784 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !785, file: !757, line: 751)
!785 = !DISubprogram(name: "exp2f", linkageName: "_ZL5exp2ff", scope: !756, file: !756, line: 421, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!786 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !787, file: !757, line: 752)
!787 = !DISubprogram(name: "expf", linkageName: "_ZL4expff", scope: !756, file: !756, line: 424, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!788 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !789, file: !757, line: 753)
!789 = !DISubprogram(name: "expm1f", linkageName: "_ZL6expm1ff", scope: !756, file: !756, line: 427, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!790 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !791, file: !757, line: 754)
!791 = !DISubprogram(name: "fabsf", linkageName: "_ZL5fabsff", scope: !756, file: !756, line: 430, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!792 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !793, file: !757, line: 755)
!793 = !DISubprogram(name: "fdimf", linkageName: "_ZL5fdimfff", scope: !756, file: !756, line: 433, type: !125, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!794 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !795, file: !757, line: 756)
!795 = !DISubprogram(name: "floorf", linkageName: "_ZL6floorff", scope: !756, file: !756, line: 439, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!796 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !797, file: !757, line: 757)
!797 = !DISubprogram(name: "fmaf", linkageName: "_ZL4fmaffff", scope: !756, file: !756, line: 442, type: !167, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!798 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !799, file: !757, line: 758)
!799 = !DISubprogram(name: "fmaxf", linkageName: "_ZL5fmaxfff", scope: !756, file: !756, line: 447, type: !125, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!800 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !801, file: !757, line: 759)
!801 = !DISubprogram(name: "fminf", linkageName: "_ZL5fminfff", scope: !756, file: !756, line: 450, type: !125, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!802 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !803, file: !757, line: 760)
!803 = !DISubprogram(name: "fmodf", linkageName: "_ZL5fmodfff", scope: !756, file: !756, line: 453, type: !125, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!804 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !805, file: !757, line: 761)
!805 = !DISubprogram(name: "frexpf", linkageName: "_ZL6frexpffPi", scope: !756, file: !756, line: 456, type: !654, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!806 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !807, file: !757, line: 762)
!807 = !DISubprogram(name: "hypotf", linkageName: "_ZL6hypotfff", scope: !756, file: !756, line: 461, type: !125, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!808 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !809, file: !757, line: 763)
!809 = !DISubprogram(name: "ilogbf", linkageName: "_ZL6ilogbff", scope: !756, file: !756, line: 464, type: !197, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!810 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !811, file: !757, line: 764)
!811 = !DISubprogram(name: "ldexpf", linkageName: "_ZL6ldexpffi", scope: !756, file: !756, line: 503, type: !348, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!812 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !813, file: !757, line: 765)
!813 = !DISubprogram(name: "lgammaf", linkageName: "_ZL7lgammaff", scope: !756, file: !756, line: 506, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!814 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !815, file: !757, line: 766)
!815 = !DISubprogram(name: "llrintf", linkageName: "_ZL7llrintff", scope: !756, file: !756, line: 509, type: !216, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!816 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !817, file: !757, line: 767)
!817 = !DISubprogram(name: "llroundf", linkageName: "_ZL8llroundff", scope: !756, file: !756, line: 512, type: !216, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!818 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !819, file: !757, line: 768)
!819 = !DISubprogram(name: "log10f", linkageName: "_ZL6log10ff", scope: !756, file: !756, line: 515, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!820 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !821, file: !757, line: 769)
!821 = !DISubprogram(name: "log1pf", linkageName: "_ZL6log1pff", scope: !756, file: !756, line: 518, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!822 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !823, file: !757, line: 770)
!823 = !DISubprogram(name: "log2f", linkageName: "_ZL5log2ff", scope: !756, file: !756, line: 521, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!824 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !825, file: !757, line: 771)
!825 = !DISubprogram(name: "logbf", linkageName: "_ZL5logbff", scope: !756, file: !756, line: 524, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!826 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !827, file: !757, line: 772)
!827 = !DISubprogram(name: "logf", linkageName: "_ZL4logff", scope: !756, file: !756, line: 527, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!828 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !829, file: !757, line: 773)
!829 = !DISubprogram(name: "lrintf", linkageName: "_ZL6lrintff", scope: !756, file: !756, line: 530, type: !253, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!830 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !831, file: !757, line: 774)
!831 = !DISubprogram(name: "lroundf", linkageName: "_ZL7lroundff", scope: !756, file: !756, line: 533, type: !253, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!832 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !833, file: !757, line: 775)
!833 = !DISubprogram(name: "modff", linkageName: "_ZL5modfffPf", scope: !756, file: !756, line: 536, type: !713, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!834 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !835, file: !757, line: 776)
!835 = !DISubprogram(name: "nearbyintf", linkageName: "_ZL10nearbyintff", scope: !756, file: !756, line: 571, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!836 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !837, file: !757, line: 777)
!837 = !DISubprogram(name: "nextafterf", linkageName: "_ZL10nextafterfff", scope: !756, file: !756, line: 574, type: !125, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!838 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !839, file: !757, line: 779)
!839 = !DISubprogram(name: "powf", linkageName: "_ZL4powfff", scope: !756, file: !756, line: 607, type: !125, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!840 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !841, file: !757, line: 780)
!841 = !DISubprogram(name: "remainderf", linkageName: "_ZL10remainderfff", scope: !756, file: !756, line: 616, type: !125, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!842 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !843, file: !757, line: 781)
!843 = !DISubprogram(name: "remquof", linkageName: "_ZL7remquofffPi", scope: !756, file: !756, line: 621, type: !314, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!844 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !845, file: !757, line: 782)
!845 = !DISubprogram(name: "rintf", linkageName: "_ZL5rintff", scope: !756, file: !756, line: 636, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!846 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !847, file: !757, line: 783)
!847 = !DISubprogram(name: "roundf", linkageName: "_ZL6roundff", scope: !756, file: !756, line: 661, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!848 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !849, file: !757, line: 784)
!849 = !DISubprogram(name: "scalblnf", linkageName: "_ZL8scalblnffl", scope: !756, file: !756, line: 667, type: !338, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!850 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !851, file: !757, line: 785)
!851 = !DISubprogram(name: "scalbnf", linkageName: "_ZL7scalbnffi", scope: !756, file: !756, line: 673, type: !348, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!852 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !853, file: !757, line: 786)
!853 = !DISubprogram(name: "sinf", linkageName: "_ZL4sinff", scope: !756, file: !756, line: 703, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!854 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !855, file: !757, line: 787)
!855 = !DISubprogram(name: "sinhf", linkageName: "_ZL5sinhff", scope: !756, file: !756, line: 706, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!856 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !857, file: !757, line: 788)
!857 = !DISubprogram(name: "sqrtf", linkageName: "_ZL5sqrtff", scope: !756, file: !756, line: 712, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!858 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !859, file: !757, line: 789)
!859 = !DISubprogram(name: "tanf", linkageName: "_ZL4tanff", scope: !756, file: !756, line: 715, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!860 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !861, file: !757, line: 790)
!861 = !DISubprogram(name: "tanhf", linkageName: "_ZL5tanhff", scope: !756, file: !756, line: 718, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!862 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !863, file: !757, line: 791)
!863 = !DISubprogram(name: "tgammaf", linkageName: "_ZL7tgammaff", scope: !756, file: !756, line: 721, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!864 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !865, file: !757, line: 792)
!865 = !DISubprogram(name: "truncf", linkageName: "_ZL6truncff", scope: !756, file: !756, line: 724, type: !96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!866 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !867, file: !868, line: 66)
!867 = !DICompositeType(tag: DW_TAG_class_type, name: "exception_ptr", scope: !869, file: !868, line: 97, size: 64, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSNSt15__exception_ptr13exception_ptrE")
!868 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/bits/exception_ptr.h", directory: "", checksumkind: CSK_MD5, checksum: "314ad14748ccb9ff85c65d17ebb0828b")
!869 = !DINamespace(name: "__exception_ptr", scope: !20)
!870 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !869, entity: !871, file: !868, line: 85)
!871 = !DISubprogram(name: "rethrow_exception", linkageName: "_ZSt17rethrow_exceptionNSt15__exception_ptr13exception_ptrE", scope: !20, file: !868, line: 81, type: !872, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!872 = !DISubroutineType(types: !873)
!873 = !{null, !867}
!874 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !875, file: !868, line: 243)
!875 = !DISubprogram(name: "swap", linkageName: "_ZNSt15__exception_ptr4swapERNS_13exception_ptrES1_", scope: !869, file: !868, line: 230, type: !876, flags: DIFlagPrototyped, spFlags: 0)
!876 = !DISubroutineType(types: !877)
!877 = !{null, !878, !878}
!878 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !867, size: 64)
!879 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !880, file: !895, line: 64)
!880 = !DIDerivedType(tag: DW_TAG_typedef, name: "mbstate_t", file: !881, line: 6, baseType: !882)
!881 = !DIFile(filename: "/usr/include/bits/types/mbstate_t.h", directory: "", checksumkind: CSK_MD5, checksum: "ba8742313715e20e434cf6ccb2db98e3")
!882 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mbstate_t", file: !883, line: 21, baseType: !884)
!883 = !DIFile(filename: "/usr/include/bits/types/__mbstate_t.h", directory: "", checksumkind: CSK_MD5, checksum: "82911a3e689448e3691ded3e0b471a55")
!884 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !883, line: 13, size: 64, flags: DIFlagTypePassByValue, elements: !885, identifier: "_ZTS11__mbstate_t")
!885 = !{!886, !887}
!886 = !DIDerivedType(tag: DW_TAG_member, name: "__count", scope: !884, file: !883, line: 15, baseType: !25, size: 32)
!887 = !DIDerivedType(tag: DW_TAG_member, name: "__value", scope: !884, file: !883, line: 20, baseType: !888, size: 32, offset: 32)
!888 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !884, file: !883, line: 16, size: 32, flags: DIFlagTypePassByValue, elements: !889, identifier: "_ZTSN11__mbstate_tUt_E")
!889 = !{!890, !891}
!890 = !DIDerivedType(tag: DW_TAG_member, name: "__wch", scope: !888, file: !883, line: 18, baseType: !11, size: 32)
!891 = !DIDerivedType(tag: DW_TAG_member, name: "__wchb", scope: !888, file: !883, line: 19, baseType: !892, size: 32)
!892 = !DICompositeType(tag: DW_TAG_array_type, baseType: !271, size: 32, elements: !893)
!893 = !{!894}
!894 = !DISubrange(count: 4)
!895 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/cwchar", directory: "")
!896 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !897, file: !895, line: 141)
!897 = !DIDerivedType(tag: DW_TAG_typedef, name: "wint_t", file: !898, line: 20, baseType: !11)
!898 = !DIFile(filename: "/usr/include/bits/types/wint_t.h", directory: "", checksumkind: CSK_MD5, checksum: "aa31b53ef28dc23152ceb41e2763ded3")
!899 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !900, file: !895, line: 143)
!900 = !DISubprogram(name: "btowc", scope: !901, file: !901, line: 309, type: !902, flags: DIFlagPrototyped, spFlags: 0)
!901 = !DIFile(filename: "/usr/include/wchar.h", directory: "", checksumkind: CSK_MD5, checksum: "c7881b2872d88c3ed71646d8a9e91af3")
!902 = !DISubroutineType(types: !903)
!903 = !{!897, !25}
!904 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !905, file: !895, line: 144)
!905 = !DISubprogram(name: "fgetwc", scope: !901, file: !901, line: 935, type: !906, flags: DIFlagPrototyped, spFlags: 0)
!906 = !DISubroutineType(types: !907)
!907 = !{!897, !908}
!908 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !909, size: 64)
!909 = !DIDerivedType(tag: DW_TAG_typedef, name: "__FILE", file: !910, line: 5, baseType: !911)
!910 = !DIFile(filename: "/usr/include/bits/types/__FILE.h", directory: "", checksumkind: CSK_MD5, checksum: "72a8fe90981f484acae7c6f3dfc5c2b7")
!911 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !910, line: 4, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS8_IO_FILE")
!912 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !913, file: !895, line: 145)
!913 = !DISubprogram(name: "fgetws", scope: !901, file: !901, line: 964, type: !914, flags: DIFlagPrototyped, spFlags: 0)
!914 = !DISubroutineType(types: !915)
!915 = !{!459, !458, !25, !916}
!916 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !908)
!917 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !918, file: !895, line: 146)
!918 = !DISubprogram(name: "fputwc", scope: !901, file: !901, line: 949, type: !919, flags: DIFlagPrototyped, spFlags: 0)
!919 = !DISubroutineType(types: !920)
!920 = !{!897, !460, !908}
!921 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !922, file: !895, line: 147)
!922 = !DISubprogram(name: "fputws", scope: !901, file: !901, line: 971, type: !923, flags: DIFlagPrototyped, spFlags: 0)
!923 = !DISubroutineType(types: !924)
!924 = !{!25, !505, !916}
!925 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !926, file: !895, line: 148)
!926 = !DISubprogram(name: "fwide", scope: !901, file: !901, line: 725, type: !927, flags: DIFlagPrototyped, spFlags: 0)
!927 = !DISubroutineType(types: !928)
!928 = !{!25, !908, !25}
!929 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !930, file: !895, line: 149)
!930 = !DISubprogram(name: "fwprintf", scope: !901, file: !901, line: 732, type: !931, flags: DIFlagPrototyped, spFlags: 0)
!931 = !DISubroutineType(types: !932)
!932 = !{!25, !916, !505, null}
!933 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !934, file: !895, line: 150)
!934 = !DISubprogram(name: "fwscanf", linkageName: "__isoc23_fwscanf", scope: !901, file: !901, line: 795, type: !931, flags: DIFlagPrototyped, spFlags: 0)
!935 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !936, file: !895, line: 151)
!936 = !DISubprogram(name: "getwc", scope: !901, file: !901, line: 936, type: !906, flags: DIFlagPrototyped, spFlags: 0)
!937 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !938, file: !895, line: 152)
!938 = !DISubprogram(name: "getwchar", scope: !901, file: !901, line: 942, type: !939, flags: DIFlagPrototyped, spFlags: 0)
!939 = !DISubroutineType(types: !940)
!940 = !{!897}
!941 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !942, file: !895, line: 153)
!942 = !DISubprogram(name: "mbrlen", scope: !901, file: !901, line: 332, type: !943, flags: DIFlagPrototyped, spFlags: 0)
!943 = !DISubroutineType(types: !944)
!944 = !{!389, !461, !389, !945}
!945 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !946)
!946 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !880, size: 64)
!947 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !948, file: !895, line: 154)
!948 = !DISubprogram(name: "mbrtowc", scope: !901, file: !901, line: 321, type: !949, flags: DIFlagPrototyped, spFlags: 0)
!949 = !DISubroutineType(types: !950)
!950 = !{!389, !458, !461, !389, !945}
!951 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !952, file: !895, line: 155)
!952 = !DISubprogram(name: "mbsinit", scope: !901, file: !901, line: 317, type: !953, flags: DIFlagPrototyped, spFlags: 0)
!953 = !DISubroutineType(types: !954)
!954 = !{!25, !955}
!955 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !956, size: 64)
!956 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !880)
!957 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !958, file: !895, line: 156)
!958 = !DISubprogram(name: "mbsrtowcs", scope: !901, file: !901, line: 362, type: !959, flags: DIFlagPrototyped, spFlags: 0)
!959 = !DISubroutineType(types: !960)
!960 = !{!389, !458, !961, !389, !945}
!961 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !962)
!962 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !269, size: 64)
!963 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !964, file: !895, line: 157)
!964 = !DISubprogram(name: "putwc", scope: !901, file: !901, line: 950, type: !919, flags: DIFlagPrototyped, spFlags: 0)
!965 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !966, file: !895, line: 158)
!966 = !DISubprogram(name: "putwchar", scope: !901, file: !901, line: 956, type: !967, flags: DIFlagPrototyped, spFlags: 0)
!967 = !DISubroutineType(types: !968)
!968 = !{!897, !460}
!969 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !970, file: !895, line: 160)
!970 = !DISubprogram(name: "swprintf", scope: !901, file: !901, line: 742, type: !971, flags: DIFlagPrototyped, spFlags: 0)
!971 = !DISubroutineType(types: !972)
!972 = !{!25, !458, !389, !505, null}
!973 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !974, file: !895, line: 162)
!974 = !DISubprogram(name: "swscanf", linkageName: "__isoc23_swscanf", scope: !901, file: !901, line: 802, type: !975, flags: DIFlagPrototyped, spFlags: 0)
!975 = !DISubroutineType(types: !976)
!976 = !{!25, !505, !505, null}
!977 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !978, file: !895, line: 163)
!978 = !DISubprogram(name: "ungetwc", scope: !901, file: !901, line: 979, type: !979, flags: DIFlagPrototyped, spFlags: 0)
!979 = !DISubroutineType(types: !980)
!980 = !{!897, !897, !908}
!981 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !982, file: !895, line: 164)
!982 = !DISubprogram(name: "vfwprintf", scope: !901, file: !901, line: 750, type: !983, flags: DIFlagPrototyped, spFlags: 0)
!983 = !DISubroutineType(types: !984)
!984 = !{!25, !916, !505, !985}
!985 = !DIDerivedType(tag: DW_TAG_typedef, name: "__gnuc_va_list", file: !986, line: 12, baseType: !987)
!986 = !DIFile(filename: "/opt/rocm-6.4.2/lib/llvm/lib/clang/19/include/__stdarg___gnuc_va_list.h", directory: "", checksumkind: CSK_MD5, checksum: "edb3f2eab991638e4dc94f6e55e3530f")
!987 = !DIDerivedType(tag: DW_TAG_typedef, name: "__builtin_va_list", file: !988, baseType: !437)
!988 = !DIFile(filename: "HeCBench/src/dense-embedding-hip/main.cu", directory: "/ccs/home/mdunlavy/GPU_Fault_Injection", checksumkind: CSK_MD5, checksum: "c6b3953c42f075c3101c2a679b2990eb")
!989 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !990, file: !895, line: 166)
!990 = !DISubprogram(name: "vfwscanf", linkageName: "__isoc23_vfwscanf", scope: !901, file: !901, line: 875, type: !983, flags: DIFlagPrototyped, spFlags: 0)
!991 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !992, file: !895, line: 169)
!992 = !DISubprogram(name: "vswprintf", scope: !901, file: !901, line: 763, type: !993, flags: DIFlagPrototyped, spFlags: 0)
!993 = !DISubroutineType(types: !994)
!994 = !{!25, !458, !389, !505, !985}
!995 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !996, file: !895, line: 172)
!996 = !DISubprogram(name: "vswscanf", linkageName: "__isoc23_vswscanf", scope: !901, file: !901, line: 882, type: !997, flags: DIFlagPrototyped, spFlags: 0)
!997 = !DISubroutineType(types: !998)
!998 = !{!25, !505, !505, !985}
!999 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1000, file: !895, line: 174)
!1000 = !DISubprogram(name: "vwprintf", scope: !901, file: !901, line: 758, type: !1001, flags: DIFlagPrototyped, spFlags: 0)
!1001 = !DISubroutineType(types: !1002)
!1002 = !{!25, !505, !985}
!1003 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1004, file: !895, line: 176)
!1004 = !DISubprogram(name: "vwscanf", linkageName: "__isoc23_vwscanf", scope: !901, file: !901, line: 879, type: !1001, flags: DIFlagPrototyped, spFlags: 0)
!1005 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1006, file: !895, line: 178)
!1006 = !DISubprogram(name: "wcrtomb", scope: !901, file: !901, line: 326, type: !1007, flags: DIFlagPrototyped, spFlags: 0)
!1007 = !DISubroutineType(types: !1008)
!1008 = !{!389, !504, !460, !945}
!1009 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1010, file: !895, line: 179)
!1010 = !DISubprogram(name: "wcscat", scope: !901, file: !901, line: 121, type: !1011, flags: DIFlagPrototyped, spFlags: 0)
!1011 = !DISubroutineType(types: !1012)
!1012 = !{!459, !458, !505}
!1013 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1014, file: !895, line: 180)
!1014 = !DISubprogram(name: "wcscmp", scope: !901, file: !901, line: 130, type: !1015, flags: DIFlagPrototyped, spFlags: 0)
!1015 = !DISubroutineType(types: !1016)
!1016 = !{!25, !506, !506}
!1017 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1018, file: !895, line: 181)
!1018 = !DISubprogram(name: "wcscoll", scope: !901, file: !901, line: 155, type: !1015, flags: DIFlagPrototyped, spFlags: 0)
!1019 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1020, file: !895, line: 182)
!1020 = !DISubprogram(name: "wcscpy", scope: !901, file: !901, line: 98, type: !1011, flags: DIFlagPrototyped, spFlags: 0)
!1021 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1022, file: !895, line: 183)
!1022 = !DISubprogram(name: "wcscspn", scope: !901, file: !901, line: 212, type: !1023, flags: DIFlagPrototyped, spFlags: 0)
!1023 = !DISubroutineType(types: !1024)
!1024 = !{!389, !506, !506}
!1025 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1026, file: !895, line: 184)
!1026 = !DISubprogram(name: "wcsftime", scope: !901, file: !901, line: 1043, type: !1027, flags: DIFlagPrototyped, spFlags: 0)
!1027 = !DISubroutineType(types: !1028)
!1028 = !{!389, !458, !389, !505, !1029}
!1029 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1030)
!1030 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1031, size: 64)
!1031 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1032)
!1032 = !DICompositeType(tag: DW_TAG_structure_type, name: "tm", file: !901, line: 94, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS2tm")
!1033 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1034, file: !895, line: 185)
!1034 = !DISubprogram(name: "wcslen", scope: !901, file: !901, line: 247, type: !1035, flags: DIFlagPrototyped, spFlags: 0)
!1035 = !DISubroutineType(types: !1036)
!1036 = !{!389, !506}
!1037 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1038, file: !895, line: 186)
!1038 = !DISubprogram(name: "wcsncat", scope: !901, file: !901, line: 125, type: !1039, flags: DIFlagPrototyped, spFlags: 0)
!1039 = !DISubroutineType(types: !1040)
!1040 = !{!459, !458, !505, !389}
!1041 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1042, file: !895, line: 187)
!1042 = !DISubprogram(name: "wcsncmp", scope: !901, file: !901, line: 133, type: !1043, flags: DIFlagPrototyped, spFlags: 0)
!1043 = !DISubroutineType(types: !1044)
!1044 = !{!25, !506, !506, !389}
!1045 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1046, file: !895, line: 188)
!1046 = !DISubprogram(name: "wcsncpy", scope: !901, file: !901, line: 103, type: !1039, flags: DIFlagPrototyped, spFlags: 0)
!1047 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1048, file: !895, line: 189)
!1048 = !DISubprogram(name: "wcsrtombs", scope: !901, file: !901, line: 368, type: !1049, flags: DIFlagPrototyped, spFlags: 0)
!1049 = !DISubroutineType(types: !1050)
!1050 = !{!389, !504, !1051, !389, !945}
!1051 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1052)
!1052 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !506, size: 64)
!1053 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1054, file: !895, line: 190)
!1054 = !DISubprogram(name: "wcsspn", scope: !901, file: !901, line: 216, type: !1023, flags: DIFlagPrototyped, spFlags: 0)
!1055 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1056, file: !895, line: 191)
!1056 = !DISubprogram(name: "wcstod", scope: !901, file: !901, line: 402, type: !1057, flags: DIFlagPrototyped, spFlags: 0)
!1057 = !DISubroutineType(types: !1058)
!1058 = !{!32, !505, !1059}
!1059 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1060)
!1060 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !459, size: 64)
!1061 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1062, file: !895, line: 193)
!1062 = !DISubprogram(name: "wcstof", scope: !901, file: !901, line: 407, type: !1063, flags: DIFlagPrototyped, spFlags: 0)
!1063 = !DISubroutineType(types: !1064)
!1064 = !{!91, !505, !1059}
!1065 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1066, file: !895, line: 195)
!1066 = !DISubprogram(name: "wcstok", scope: !901, file: !901, line: 242, type: !1067, flags: DIFlagPrototyped, spFlags: 0)
!1067 = !DISubroutineType(types: !1068)
!1068 = !{!459, !458, !505, !1059}
!1069 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1070, file: !895, line: 196)
!1070 = !DISubprogram(name: "wcstol", linkageName: "__isoc23_wcstol", scope: !901, file: !901, line: 500, type: !1071, flags: DIFlagPrototyped, spFlags: 0)
!1071 = !DISubroutineType(types: !1072)
!1072 = !{!250, !505, !1059, !25}
!1073 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1074, file: !895, line: 197)
!1074 = !DISubprogram(name: "wcstoul", linkageName: "__isoc23_wcstoul", scope: !901, file: !901, line: 503, type: !1075, flags: DIFlagPrototyped, spFlags: 0)
!1075 = !DISubroutineType(types: !1076)
!1076 = !{!391, !505, !1059, !25}
!1077 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1078, file: !895, line: 198)
!1078 = !DISubprogram(name: "wcsxfrm", scope: !901, file: !901, line: 159, type: !1079, flags: DIFlagPrototyped, spFlags: 0)
!1079 = !DISubroutineType(types: !1080)
!1080 = !{!389, !458, !505, !389}
!1081 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1082, file: !895, line: 199)
!1082 = !DISubprogram(name: "wctob", scope: !901, file: !901, line: 313, type: !1083, flags: DIFlagPrototyped, spFlags: 0)
!1083 = !DISubroutineType(types: !1084)
!1084 = !{!25, !897}
!1085 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1086, file: !895, line: 200)
!1086 = !DISubprogram(name: "wmemcmp", scope: !901, file: !901, line: 283, type: !1043, flags: DIFlagPrototyped, spFlags: 0)
!1087 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1088, file: !895, line: 201)
!1088 = !DISubprogram(name: "wmemcpy", scope: !901, file: !901, line: 287, type: !1039, flags: DIFlagPrototyped, spFlags: 0)
!1089 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1090, file: !895, line: 202)
!1090 = !DISubprogram(name: "wmemmove", scope: !901, file: !901, line: 292, type: !1091, flags: DIFlagPrototyped, spFlags: 0)
!1091 = !DISubroutineType(types: !1092)
!1092 = !{!459, !459, !506, !389}
!1093 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1094, file: !895, line: 203)
!1094 = !DISubprogram(name: "wmemset", scope: !901, file: !901, line: 296, type: !1095, flags: DIFlagPrototyped, spFlags: 0)
!1095 = !DISubroutineType(types: !1096)
!1096 = !{!459, !459, !460, !389}
!1097 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1098, file: !895, line: 204)
!1098 = !DISubprogram(name: "wprintf", scope: !901, file: !901, line: 739, type: !1099, flags: DIFlagPrototyped, spFlags: 0)
!1099 = !DISubroutineType(types: !1100)
!1100 = !{!25, !505, null}
!1101 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1102, file: !895, line: 205)
!1102 = !DISubprogram(name: "wscanf", linkageName: "__isoc23_wscanf", scope: !901, file: !901, line: 799, type: !1099, flags: DIFlagPrototyped, spFlags: 0)
!1103 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1104, file: !895, line: 206)
!1104 = !DISubprogram(name: "wcschr", scope: !901, file: !901, line: 189, type: !1105, flags: DIFlagPrototyped, spFlags: 0)
!1105 = !DISubroutineType(types: !1106)
!1106 = !{!459, !506, !460}
!1107 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1108, file: !895, line: 207)
!1108 = !DISubprogram(name: "wcspbrk", scope: !901, file: !901, line: 226, type: !1109, flags: DIFlagPrototyped, spFlags: 0)
!1109 = !DISubroutineType(types: !1110)
!1110 = !{!459, !506, !506}
!1111 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1112, file: !895, line: 208)
!1112 = !DISubprogram(name: "wcsrchr", scope: !901, file: !901, line: 199, type: !1105, flags: DIFlagPrototyped, spFlags: 0)
!1113 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1114, file: !895, line: 209)
!1114 = !DISubprogram(name: "wcsstr", scope: !901, file: !901, line: 237, type: !1109, flags: DIFlagPrototyped, spFlags: 0)
!1115 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1116, file: !895, line: 210)
!1116 = !DISubprogram(name: "wmemchr", scope: !901, file: !901, line: 278, type: !1117, flags: DIFlagPrototyped, spFlags: 0)
!1117 = !DISubroutineType(types: !1118)
!1118 = !{!459, !506, !460, !389}
!1119 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !513, entity: !1120, file: !895, line: 251)
!1120 = !DISubprogram(name: "wcstold", scope: !901, file: !901, line: 409, type: !1121, flags: DIFlagPrototyped, spFlags: 0)
!1121 = !DISubroutineType(types: !1122)
!1122 = !{!102, !505, !1059}
!1123 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !513, entity: !1124, file: !895, line: 260)
!1124 = !DISubprogram(name: "wcstoll", linkageName: "__isoc23_wcstoll", scope: !901, file: !901, line: 508, type: !1125, flags: DIFlagPrototyped, spFlags: 0)
!1125 = !DISubroutineType(types: !1126)
!1126 = !{!213, !505, !1059, !25}
!1127 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !513, entity: !1128, file: !895, line: 261)
!1128 = !DISubprogram(name: "wcstoull", linkageName: "__isoc23_wcstoull", scope: !901, file: !901, line: 513, type: !1129, flags: DIFlagPrototyped, spFlags: 0)
!1129 = !DISubroutineType(types: !1130)
!1130 = !{!541, !505, !1059, !25}
!1131 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1120, file: !895, line: 267)
!1132 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1124, file: !895, line: 268)
!1133 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1128, file: !895, line: 269)
!1134 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1062, file: !895, line: 283)
!1135 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !990, file: !895, line: 286)
!1136 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !996, file: !895, line: 289)
!1137 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1004, file: !895, line: 292)
!1138 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1120, file: !895, line: 296)
!1139 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1124, file: !895, line: 297)
!1140 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1128, file: !895, line: 298)
!1141 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1142, file: !1144, line: 53)
!1142 = !DICompositeType(tag: DW_TAG_structure_type, name: "lconv", file: !1143, line: 51, size: 768, flags: DIFlagFwdDecl, identifier: "_ZTS5lconv")
!1143 = !DIFile(filename: "/usr/include/locale.h", directory: "", checksumkind: CSK_MD5, checksum: "9fdf0d24f6e4cc61619b5e3258456dbf")
!1144 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/clocale", directory: "")
!1145 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1146, file: !1144, line: 54)
!1146 = !DISubprogram(name: "setlocale", scope: !1143, file: !1143, line: 122, type: !1147, flags: DIFlagPrototyped, spFlags: 0)
!1147 = !DISubroutineType(types: !1148)
!1148 = !{!437, !25, !269}
!1149 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1150, file: !1144, line: 55)
!1150 = !DISubprogram(name: "localeconv", scope: !1143, file: !1143, line: 125, type: !1151, flags: DIFlagPrototyped, spFlags: 0)
!1151 = !DISubroutineType(types: !1152)
!1152 = !{!1153}
!1153 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1142, size: 64)
!1154 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1155, file: !1157, line: 64)
!1155 = !DISubprogram(name: "isalnum", scope: !1156, file: !1156, line: 108, type: !23, flags: DIFlagPrototyped, spFlags: 0)
!1156 = !DIFile(filename: "/usr/include/ctype.h", directory: "", checksumkind: CSK_MD5, checksum: "04aab4fba8cc4c824a8f09075cc98b20")
!1157 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/cctype", directory: "")
!1158 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1159, file: !1157, line: 65)
!1159 = !DISubprogram(name: "isalpha", scope: !1156, file: !1156, line: 109, type: !23, flags: DIFlagPrototyped, spFlags: 0)
!1160 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1161, file: !1157, line: 66)
!1161 = !DISubprogram(name: "iscntrl", scope: !1156, file: !1156, line: 110, type: !23, flags: DIFlagPrototyped, spFlags: 0)
!1162 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1163, file: !1157, line: 67)
!1163 = !DISubprogram(name: "isdigit", scope: !1156, file: !1156, line: 111, type: !23, flags: DIFlagPrototyped, spFlags: 0)
!1164 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1165, file: !1157, line: 68)
!1165 = !DISubprogram(name: "isgraph", scope: !1156, file: !1156, line: 113, type: !23, flags: DIFlagPrototyped, spFlags: 0)
!1166 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1167, file: !1157, line: 69)
!1167 = !DISubprogram(name: "islower", scope: !1156, file: !1156, line: 112, type: !23, flags: DIFlagPrototyped, spFlags: 0)
!1168 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1169, file: !1157, line: 70)
!1169 = !DISubprogram(name: "isprint", scope: !1156, file: !1156, line: 114, type: !23, flags: DIFlagPrototyped, spFlags: 0)
!1170 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1171, file: !1157, line: 71)
!1171 = !DISubprogram(name: "ispunct", scope: !1156, file: !1156, line: 115, type: !23, flags: DIFlagPrototyped, spFlags: 0)
!1172 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1173, file: !1157, line: 72)
!1173 = !DISubprogram(name: "isspace", scope: !1156, file: !1156, line: 116, type: !23, flags: DIFlagPrototyped, spFlags: 0)
!1174 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1175, file: !1157, line: 73)
!1175 = !DISubprogram(name: "isupper", scope: !1156, file: !1156, line: 117, type: !23, flags: DIFlagPrototyped, spFlags: 0)
!1176 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1177, file: !1157, line: 74)
!1177 = !DISubprogram(name: "isxdigit", scope: !1156, file: !1156, line: 118, type: !23, flags: DIFlagPrototyped, spFlags: 0)
!1178 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1179, file: !1157, line: 75)
!1179 = !DISubprogram(name: "tolower", scope: !1156, file: !1156, line: 122, type: !23, flags: DIFlagPrototyped, spFlags: 0)
!1180 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1181, file: !1157, line: 76)
!1181 = !DISubprogram(name: "toupper", scope: !1156, file: !1156, line: 125, type: !23, flags: DIFlagPrototyped, spFlags: 0)
!1182 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1183, file: !1157, line: 87)
!1183 = !DISubprogram(name: "isblank", scope: !1156, file: !1156, line: 130, type: !23, flags: DIFlagPrototyped, spFlags: 0)
!1184 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1185, file: !1187, line: 98)
!1185 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !1186, line: 7, baseType: !911)
!1186 = !DIFile(filename: "/usr/include/bits/types/FILE.h", directory: "", checksumkind: CSK_MD5, checksum: "571f9fb6223c42439075fdde11a0de5d")
!1187 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/cstdio", directory: "")
!1188 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1189, file: !1187, line: 99)
!1189 = !DIDerivedType(tag: DW_TAG_typedef, name: "fpos_t", file: !1190, line: 84, baseType: !1191)
!1190 = !DIFile(filename: "/usr/include/stdio.h", directory: "", checksumkind: CSK_MD5, checksum: "600479e30522c60809530fc01f232b17")
!1191 = !DIDerivedType(tag: DW_TAG_typedef, name: "__fpos_t", file: !1192, line: 14, baseType: !1193)
!1192 = !DIFile(filename: "/usr/include/bits/types/__fpos_t.h", directory: "", checksumkind: CSK_MD5, checksum: "32de8bdaf3551a6c0a9394f9af4389ce")
!1193 = !DICompositeType(tag: DW_TAG_structure_type, name: "_G_fpos_t", file: !1192, line: 10, size: 128, flags: DIFlagFwdDecl, identifier: "_ZTS9_G_fpos_t")
!1194 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1195, file: !1187, line: 101)
!1195 = !DISubprogram(name: "clearerr", scope: !1190, file: !1190, line: 844, type: !1196, flags: DIFlagPrototyped, spFlags: 0)
!1196 = !DISubroutineType(types: !1197)
!1197 = !{null, !1198}
!1198 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1185, size: 64)
!1199 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1200, file: !1187, line: 102)
!1200 = !DISubprogram(name: "fclose", scope: !1190, file: !1190, line: 183, type: !1201, flags: DIFlagPrototyped, spFlags: 0)
!1201 = !DISubroutineType(types: !1202)
!1202 = !{!25, !1198}
!1203 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1204, file: !1187, line: 103)
!1204 = !DISubprogram(name: "feof", scope: !1190, file: !1190, line: 846, type: !1201, flags: DIFlagPrototyped, spFlags: 0)
!1205 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1206, file: !1187, line: 104)
!1206 = !DISubprogram(name: "ferror", scope: !1190, file: !1190, line: 848, type: !1201, flags: DIFlagPrototyped, spFlags: 0)
!1207 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1208, file: !1187, line: 105)
!1208 = !DISubprogram(name: "fflush", scope: !1190, file: !1190, line: 235, type: !1201, flags: DIFlagPrototyped, spFlags: 0)
!1209 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1210, file: !1187, line: 106)
!1210 = !DISubprogram(name: "fgetc", scope: !1190, file: !1190, line: 571, type: !1201, flags: DIFlagPrototyped, spFlags: 0)
!1211 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1212, file: !1187, line: 107)
!1212 = !DISubprogram(name: "fgetpos", scope: !1190, file: !1190, line: 818, type: !1213, flags: DIFlagPrototyped, spFlags: 0)
!1213 = !DISubroutineType(types: !1214)
!1214 = !{!25, !1215, !1216}
!1215 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1198)
!1216 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1217)
!1217 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1189, size: 64)
!1218 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1219, file: !1187, line: 108)
!1219 = !DISubprogram(name: "fgets", scope: !1190, file: !1190, line: 650, type: !1220, flags: DIFlagPrototyped, spFlags: 0)
!1220 = !DISubroutineType(types: !1221)
!1221 = !{!437, !504, !25, !1215}
!1222 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1223, file: !1187, line: 109)
!1223 = !DISubprogram(name: "fopen", scope: !1190, file: !1190, line: 263, type: !1224, flags: DIFlagPrototyped, spFlags: 0)
!1224 = !DISubroutineType(types: !1225)
!1225 = !{!1198, !461, !461}
!1226 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1227, file: !1187, line: 110)
!1227 = !DISubprogram(name: "fprintf", scope: !1190, file: !1190, line: 355, type: !1228, flags: DIFlagPrototyped, spFlags: 0)
!1228 = !DISubroutineType(types: !1229)
!1229 = !{!25, !1215, !461, null}
!1230 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1231, file: !1187, line: 111)
!1231 = !DISubprogram(name: "fputc", scope: !1190, file: !1190, line: 607, type: !1232, flags: DIFlagPrototyped, spFlags: 0)
!1232 = !DISubroutineType(types: !1233)
!1233 = !{!25, !25, !1198}
!1234 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1235, file: !1187, line: 112)
!1235 = !DISubprogram(name: "fputs", scope: !1190, file: !1190, line: 713, type: !1236, flags: DIFlagPrototyped, spFlags: 0)
!1236 = !DISubroutineType(types: !1237)
!1237 = !{!25, !461, !1215}
!1238 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1239, file: !1187, line: 113)
!1239 = !DISubprogram(name: "fread", scope: !1190, file: !1190, line: 733, type: !1240, flags: DIFlagPrototyped, spFlags: 0)
!1240 = !DISubroutineType(types: !1241)
!1241 = !{!389, !1242, !389, !389, !1215}
!1242 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !388)
!1243 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1244, file: !1187, line: 114)
!1244 = !DISubprogram(name: "freopen", scope: !1190, file: !1190, line: 270, type: !1245, flags: DIFlagPrototyped, spFlags: 0)
!1245 = !DISubroutineType(types: !1246)
!1246 = !{!1198, !461, !461, !1215}
!1247 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1248, file: !1187, line: 115)
!1248 = !DISubprogram(name: "fscanf", linkageName: "__isoc23_fscanf", scope: !1190, file: !1190, line: 440, type: !1228, flags: DIFlagPrototyped, spFlags: 0)
!1249 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1250, file: !1187, line: 116)
!1250 = !DISubprogram(name: "fseek", scope: !1190, file: !1190, line: 771, type: !1251, flags: DIFlagPrototyped, spFlags: 0)
!1251 = !DISubroutineType(types: !1252)
!1252 = !{!25, !1198, !250, !25}
!1253 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1254, file: !1187, line: 117)
!1254 = !DISubprogram(name: "fsetpos", scope: !1190, file: !1190, line: 823, type: !1255, flags: DIFlagPrototyped, spFlags: 0)
!1255 = !DISubroutineType(types: !1256)
!1256 = !{!25, !1198, !1257}
!1257 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1258, size: 64)
!1258 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1189)
!1259 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1260, file: !1187, line: 118)
!1260 = !DISubprogram(name: "ftell", scope: !1190, file: !1190, line: 776, type: !1261, flags: DIFlagPrototyped, spFlags: 0)
!1261 = !DISubroutineType(types: !1262)
!1262 = !{!250, !1198}
!1263 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1264, file: !1187, line: 119)
!1264 = !DISubprogram(name: "fwrite", scope: !1190, file: !1190, line: 739, type: !1265, flags: DIFlagPrototyped, spFlags: 0)
!1265 = !DISubroutineType(types: !1266)
!1266 = !{!389, !1267, !389, !389, !1215}
!1267 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !413)
!1268 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1269, file: !1187, line: 120)
!1269 = !DISubprogram(name: "getc", scope: !1190, file: !1190, line: 572, type: !1201, flags: DIFlagPrototyped, spFlags: 0)
!1270 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1271, file: !1187, line: 121)
!1271 = !DISubprogram(name: "getchar", scope: !1190, file: !1190, line: 578, type: !474, flags: DIFlagPrototyped, spFlags: 0)
!1272 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1273, file: !1187, line: 126)
!1273 = !DISubprogram(name: "perror", scope: !1190, file: !1190, line: 862, type: !1274, flags: DIFlagPrototyped, spFlags: 0)
!1274 = !DISubroutineType(types: !1275)
!1275 = !{null, !269}
!1276 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1277, file: !1187, line: 127)
!1277 = !DISubprogram(name: "printf", scope: !1190, file: !1190, line: 361, type: !1278, flags: DIFlagPrototyped, spFlags: 0)
!1278 = !DISubroutineType(types: !1279)
!1279 = !{!25, !461, null}
!1280 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1281, file: !1187, line: 128)
!1281 = !DISubprogram(name: "putc", scope: !1190, file: !1190, line: 608, type: !1232, flags: DIFlagPrototyped, spFlags: 0)
!1282 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1283, file: !1187, line: 129)
!1283 = !DISubprogram(name: "putchar", scope: !1190, file: !1190, line: 614, type: !23, flags: DIFlagPrototyped, spFlags: 0)
!1284 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1285, file: !1187, line: 130)
!1285 = !DISubprogram(name: "puts", scope: !1190, file: !1190, line: 719, type: !403, flags: DIFlagPrototyped, spFlags: 0)
!1286 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1287, file: !1187, line: 131)
!1287 = !DISubprogram(name: "remove", scope: !1190, file: !1190, line: 157, type: !403, flags: DIFlagPrototyped, spFlags: 0)
!1288 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1289, file: !1187, line: 132)
!1289 = !DISubprogram(name: "rename", scope: !1190, file: !1190, line: 159, type: !1290, flags: DIFlagPrototyped, spFlags: 0)
!1290 = !DISubroutineType(types: !1291)
!1291 = !{!25, !269, !269}
!1292 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1293, file: !1187, line: 133)
!1293 = !DISubprogram(name: "rewind", scope: !1190, file: !1190, line: 781, type: !1196, flags: DIFlagPrototyped, spFlags: 0)
!1294 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1295, file: !1187, line: 134)
!1295 = !DISubprogram(name: "scanf", linkageName: "__isoc23_scanf", scope: !1190, file: !1190, line: 443, type: !1278, flags: DIFlagPrototyped, spFlags: 0)
!1296 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1297, file: !1187, line: 135)
!1297 = !DISubprogram(name: "setbuf", scope: !1190, file: !1190, line: 333, type: !1298, flags: DIFlagPrototyped, spFlags: 0)
!1298 = !DISubroutineType(types: !1299)
!1299 = !{null, !1215, !504}
!1300 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1301, file: !1187, line: 136)
!1301 = !DISubprogram(name: "setvbuf", scope: !1190, file: !1190, line: 337, type: !1302, flags: DIFlagPrototyped, spFlags: 0)
!1302 = !DISubroutineType(types: !1303)
!1303 = !{!25, !1215, !504, !25, !389}
!1304 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1305, file: !1187, line: 137)
!1305 = !DISubprogram(name: "sprintf", scope: !1190, file: !1190, line: 363, type: !1306, flags: DIFlagPrototyped, spFlags: 0)
!1306 = !DISubroutineType(types: !1307)
!1307 = !{!25, !504, !461, null}
!1308 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1309, file: !1187, line: 138)
!1309 = !DISubprogram(name: "sscanf", linkageName: "__isoc23_sscanf", scope: !1190, file: !1190, line: 445, type: !1310, flags: DIFlagPrototyped, spFlags: 0)
!1310 = !DISubroutineType(types: !1311)
!1311 = !{!25, !461, !461, null}
!1312 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1313, file: !1187, line: 139)
!1313 = !DISubprogram(name: "tmpfile", scope: !1190, file: !1190, line: 193, type: !1314, flags: DIFlagPrototyped, spFlags: 0)
!1314 = !DISubroutineType(types: !1315)
!1315 = !{!1198}
!1316 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1317, file: !1187, line: 141)
!1317 = !DISubprogram(name: "tmpnam", scope: !1190, file: !1190, line: 210, type: !1318, flags: DIFlagPrototyped, spFlags: 0)
!1318 = !DISubroutineType(types: !1319)
!1319 = !{!437, !437}
!1320 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1321, file: !1187, line: 143)
!1321 = !DISubprogram(name: "ungetc", scope: !1190, file: !1190, line: 726, type: !1232, flags: DIFlagPrototyped, spFlags: 0)
!1322 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1323, file: !1187, line: 144)
!1323 = !DISubprogram(name: "vfprintf", scope: !1190, file: !1190, line: 370, type: !1324, flags: DIFlagPrototyped, spFlags: 0)
!1324 = !DISubroutineType(types: !1325)
!1325 = !{!25, !1215, !461, !985}
!1326 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1327, file: !1187, line: 145)
!1327 = !DISubprogram(name: "vprintf", scope: !1190, file: !1190, line: 376, type: !1328, flags: DIFlagPrototyped, spFlags: 0)
!1328 = !DISubroutineType(types: !1329)
!1329 = !{!25, !461, !985}
!1330 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1331, file: !1187, line: 146)
!1331 = !DISubprogram(name: "vsprintf", scope: !1190, file: !1190, line: 378, type: !1332, flags: DIFlagPrototyped, spFlags: 0)
!1332 = !DISubroutineType(types: !1333)
!1333 = !{!25, !504, !461, !985}
!1334 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !513, entity: !1335, file: !1187, line: 175)
!1335 = !DISubprogram(name: "snprintf", scope: !1190, file: !1190, line: 383, type: !1336, flags: DIFlagPrototyped, spFlags: 0)
!1336 = !DISubroutineType(types: !1337)
!1337 = !{!25, !504, !389, !461, null}
!1338 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !513, entity: !1339, file: !1187, line: 176)
!1339 = !DISubprogram(name: "vfscanf", linkageName: "__isoc23_vfscanf", scope: !1190, file: !1190, line: 507, type: !1324, flags: DIFlagPrototyped, spFlags: 0)
!1340 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !513, entity: !1341, file: !1187, line: 177)
!1341 = !DISubprogram(name: "vscanf", linkageName: "__isoc23_vscanf", scope: !1190, file: !1190, line: 512, type: !1328, flags: DIFlagPrototyped, spFlags: 0)
!1342 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !513, entity: !1343, file: !1187, line: 178)
!1343 = !DISubprogram(name: "vsnprintf", scope: !1190, file: !1190, line: 387, type: !1344, flags: DIFlagPrototyped, spFlags: 0)
!1344 = !DISubroutineType(types: !1345)
!1345 = !{!25, !504, !389, !461, !985}
!1346 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !513, entity: !1347, file: !1187, line: 179)
!1347 = !DISubprogram(name: "vsscanf", linkageName: "__isoc23_vsscanf", scope: !1190, file: !1190, line: 515, type: !1348, flags: DIFlagPrototyped, spFlags: 0)
!1348 = !DISubroutineType(types: !1349)
!1349 = !{!25, !461, !461, !985}
!1350 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1335, file: !1187, line: 185)
!1351 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1339, file: !1187, line: 186)
!1352 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1341, file: !1187, line: 187)
!1353 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1343, file: !1187, line: 188)
!1354 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1347, file: !1187, line: 189)
!1355 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1356, file: !1362, line: 58)
!1356 = !DIDerivedType(tag: DW_TAG_typedef, name: "max_align_t", file: !1357, line: 24, baseType: !1358)
!1357 = !DIFile(filename: "/opt/rocm-6.4.2/lib/llvm/lib/clang/19/include/__stddef_max_align_t.h", directory: "", checksumkind: CSK_MD5, checksum: "3c0a2f19d136d39aa835c737c7105def")
!1358 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1357, line: 19, size: 128, flags: DIFlagTypePassByValue, elements: !1359, identifier: "_ZTS11max_align_t")
!1359 = !{!1360, !1361}
!1360 = !DIDerivedType(tag: DW_TAG_member, name: "__clang_max_align_nonce1", scope: !1358, file: !1357, line: 20, baseType: !213, size: 64, align: 64)
!1361 = !DIDerivedType(tag: DW_TAG_member, name: "__clang_max_align_nonce2", scope: !1358, file: !1357, line: 22, baseType: !102, size: 64, align: 64, offset: 64)
!1362 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/cstddef", directory: "")
!1363 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1364, file: !1369, line: 82)
!1364 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctrans_t", file: !1365, line: 48, baseType: !1366)
!1365 = !DIFile(filename: "/usr/include/wctype.h", directory: "", checksumkind: CSK_MD5, checksum: "93d4b1045b46d132ff5e6d83a26abaee")
!1366 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1367, size: 64)
!1367 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1368)
!1368 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !10, line: 41, baseType: !25)
!1369 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/cwctype", directory: "")
!1370 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1371, file: !1369, line: 83)
!1371 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctype_t", file: !1372, line: 38, baseType: !391)
!1372 = !DIFile(filename: "/usr/include/bits/wctype-wchar.h", directory: "", checksumkind: CSK_MD5, checksum: "65a194b61bfadb7760be04a5640f774f")
!1373 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !897, file: !1369, line: 84)
!1374 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1375, file: !1369, line: 86)
!1375 = !DISubprogram(name: "iswalnum", scope: !1372, file: !1372, line: 95, type: !1083, flags: DIFlagPrototyped, spFlags: 0)
!1376 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1377, file: !1369, line: 87)
!1377 = !DISubprogram(name: "iswalpha", scope: !1372, file: !1372, line: 101, type: !1083, flags: DIFlagPrototyped, spFlags: 0)
!1378 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1379, file: !1369, line: 89)
!1379 = !DISubprogram(name: "iswblank", scope: !1372, file: !1372, line: 146, type: !1083, flags: DIFlagPrototyped, spFlags: 0)
!1380 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1381, file: !1369, line: 91)
!1381 = !DISubprogram(name: "iswcntrl", scope: !1372, file: !1372, line: 104, type: !1083, flags: DIFlagPrototyped, spFlags: 0)
!1382 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1383, file: !1369, line: 92)
!1383 = !DISubprogram(name: "iswctype", scope: !1372, file: !1372, line: 159, type: !1384, flags: DIFlagPrototyped, spFlags: 0)
!1384 = !DISubroutineType(types: !1385)
!1385 = !{!25, !897, !1371}
!1386 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1387, file: !1369, line: 93)
!1387 = !DISubprogram(name: "iswdigit", scope: !1372, file: !1372, line: 108, type: !1083, flags: DIFlagPrototyped, spFlags: 0)
!1388 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1389, file: !1369, line: 94)
!1389 = !DISubprogram(name: "iswgraph", scope: !1372, file: !1372, line: 112, type: !1083, flags: DIFlagPrototyped, spFlags: 0)
!1390 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1391, file: !1369, line: 95)
!1391 = !DISubprogram(name: "iswlower", scope: !1372, file: !1372, line: 117, type: !1083, flags: DIFlagPrototyped, spFlags: 0)
!1392 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1393, file: !1369, line: 96)
!1393 = !DISubprogram(name: "iswprint", scope: !1372, file: !1372, line: 120, type: !1083, flags: DIFlagPrototyped, spFlags: 0)
!1394 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1395, file: !1369, line: 97)
!1395 = !DISubprogram(name: "iswpunct", scope: !1372, file: !1372, line: 125, type: !1083, flags: DIFlagPrototyped, spFlags: 0)
!1396 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1397, file: !1369, line: 98)
!1397 = !DISubprogram(name: "iswspace", scope: !1372, file: !1372, line: 130, type: !1083, flags: DIFlagPrototyped, spFlags: 0)
!1398 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1399, file: !1369, line: 99)
!1399 = !DISubprogram(name: "iswupper", scope: !1372, file: !1372, line: 135, type: !1083, flags: DIFlagPrototyped, spFlags: 0)
!1400 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1401, file: !1369, line: 100)
!1401 = !DISubprogram(name: "iswxdigit", scope: !1372, file: !1372, line: 140, type: !1083, flags: DIFlagPrototyped, spFlags: 0)
!1402 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1403, file: !1369, line: 101)
!1403 = !DISubprogram(name: "towctrans", scope: !1365, file: !1365, line: 55, type: !1404, flags: DIFlagPrototyped, spFlags: 0)
!1404 = !DISubroutineType(types: !1405)
!1405 = !{!897, !897, !1364}
!1406 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1407, file: !1369, line: 102)
!1407 = !DISubprogram(name: "towlower", scope: !1372, file: !1372, line: 166, type: !1408, flags: DIFlagPrototyped, spFlags: 0)
!1408 = !DISubroutineType(types: !1409)
!1409 = !{!897, !897}
!1410 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1411, file: !1369, line: 103)
!1411 = !DISubprogram(name: "towupper", scope: !1372, file: !1372, line: 169, type: !1408, flags: DIFlagPrototyped, spFlags: 0)
!1412 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1413, file: !1369, line: 104)
!1413 = !DISubprogram(name: "wctrans", scope: !1365, file: !1365, line: 52, type: !1414, flags: DIFlagPrototyped, spFlags: 0)
!1414 = !DISubroutineType(types: !1415)
!1415 = !{!1364, !269}
!1416 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1417, file: !1369, line: 105)
!1417 = !DISubprogram(name: "wctype", scope: !1372, file: !1372, line: 155, type: !1418, flags: DIFlagPrototyped, spFlags: 0)
!1418 = !DISubroutineType(types: !1419)
!1419 = !{!1371, !269}
!1420 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1421, file: !1425, line: 51)
!1421 = !DIDerivedType(tag: DW_TAG_typedef, name: "int8_t", file: !1422, line: 24, baseType: !1423)
!1422 = !DIFile(filename: "/usr/include/bits/stdint-intn.h", directory: "", checksumkind: CSK_MD5, checksum: "85f68316edee664d7bd685b977adf677")
!1423 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int8_t", file: !10, line: 37, baseType: !1424)
!1424 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!1425 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/cstdint", directory: "")
!1426 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1427, file: !1425, line: 52)
!1427 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !1422, line: 25, baseType: !1428)
!1428 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int16_t", file: !10, line: 39, baseType: !1429)
!1429 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!1430 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1431, file: !1425, line: 53)
!1431 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !1422, line: 26, baseType: !1368)
!1432 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1433, file: !1425, line: 54)
!1433 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !1422, line: 27, baseType: !1434)
!1434 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !10, line: 44, baseType: !250)
!1435 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1436, file: !1425, line: 56)
!1436 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast8_t", file: !1437, line: 58, baseType: !1424)
!1437 = !DIFile(filename: "/usr/include/stdint.h", directory: "", checksumkind: CSK_MD5, checksum: "e1a448af0fce22a39bc183d2915834c7")
!1438 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1439, file: !1425, line: 57)
!1439 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast16_t", file: !1437, line: 60, baseType: !250)
!1440 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1441, file: !1425, line: 58)
!1441 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast32_t", file: !1437, line: 61, baseType: !250)
!1442 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1443, file: !1425, line: 59)
!1443 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast64_t", file: !1437, line: 62, baseType: !250)
!1444 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1445, file: !1425, line: 61)
!1445 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least8_t", file: !1437, line: 43, baseType: !1446)
!1446 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least8_t", file: !10, line: 52, baseType: !1423)
!1447 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1448, file: !1425, line: 62)
!1448 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least16_t", file: !1437, line: 44, baseType: !1449)
!1449 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least16_t", file: !10, line: 54, baseType: !1428)
!1450 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1451, file: !1425, line: 63)
!1451 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least32_t", file: !1437, line: 45, baseType: !1452)
!1452 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least32_t", file: !10, line: 56, baseType: !1368)
!1453 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1454, file: !1425, line: 64)
!1454 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least64_t", file: !1437, line: 46, baseType: !1455)
!1455 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least64_t", file: !10, line: 58, baseType: !1434)
!1456 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1457, file: !1425, line: 66)
!1457 = !DIDerivedType(tag: DW_TAG_typedef, name: "intmax_t", file: !1437, line: 101, baseType: !1458)
!1458 = !DIDerivedType(tag: DW_TAG_typedef, name: "__intmax_t", file: !10, line: 72, baseType: !250)
!1459 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1460, file: !1425, line: 67)
!1460 = !DIDerivedType(tag: DW_TAG_typedef, name: "intptr_t", file: !1437, line: 87, baseType: !250)
!1461 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1462, file: !1425, line: 69)
!1462 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !8, line: 24, baseType: !1463)
!1463 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !10, line: 38, baseType: !1464)
!1464 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!1465 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1466, file: !1425, line: 70)
!1466 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !8, line: 25, baseType: !1467)
!1467 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !10, line: 40, baseType: !1468)
!1468 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!1469 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !7, file: !1425, line: 71)
!1470 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1471, file: !1425, line: 72)
!1471 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !8, line: 27, baseType: !1472)
!1472 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint64_t", file: !10, line: 45, baseType: !391)
!1473 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1474, file: !1425, line: 74)
!1474 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast8_t", file: !1437, line: 71, baseType: !1464)
!1475 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1476, file: !1425, line: 75)
!1476 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast16_t", file: !1437, line: 73, baseType: !391)
!1477 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1478, file: !1425, line: 76)
!1478 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast32_t", file: !1437, line: 74, baseType: !391)
!1479 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1480, file: !1425, line: 77)
!1480 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast64_t", file: !1437, line: 75, baseType: !391)
!1481 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1482, file: !1425, line: 79)
!1482 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least8_t", file: !1437, line: 49, baseType: !1483)
!1483 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least8_t", file: !10, line: 53, baseType: !1463)
!1484 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1485, file: !1425, line: 80)
!1485 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least16_t", file: !1437, line: 50, baseType: !1486)
!1486 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least16_t", file: !10, line: 55, baseType: !1467)
!1487 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1488, file: !1425, line: 81)
!1488 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least32_t", file: !1437, line: 51, baseType: !1489)
!1489 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least32_t", file: !10, line: 57, baseType: !9)
!1490 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1491, file: !1425, line: 82)
!1491 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least64_t", file: !1437, line: 52, baseType: !1492)
!1492 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least64_t", file: !10, line: 59, baseType: !1472)
!1493 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1494, file: !1425, line: 84)
!1494 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintmax_t", file: !1437, line: 102, baseType: !1495)
!1495 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uintmax_t", file: !10, line: 73, baseType: !391)
!1496 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1497, file: !1425, line: 85)
!1497 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintptr_t", file: !1437, line: 90, baseType: !391)
!1498 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1499, file: !1502, line: 60)
!1499 = !DIDerivedType(tag: DW_TAG_typedef, name: "clock_t", file: !1500, line: 7, baseType: !1501)
!1500 = !DIFile(filename: "/usr/include/bits/types/clock_t.h", directory: "", checksumkind: CSK_MD5, checksum: "1aade99fd778d1551600c7ca1410b9f1")
!1501 = !DIDerivedType(tag: DW_TAG_typedef, name: "__clock_t", file: !10, line: 156, baseType: !250)
!1502 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/ctime", directory: "")
!1503 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1504, file: !1502, line: 61)
!1504 = !DIDerivedType(tag: DW_TAG_typedef, name: "time_t", file: !1505, line: 10, baseType: !1506)
!1505 = !DIFile(filename: "/usr/include/bits/types/time_t.h", directory: "", checksumkind: CSK_MD5, checksum: "5c299a4954617c88bb03645c7864e1b1")
!1506 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !10, line: 160, baseType: !250)
!1507 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1032, file: !1502, line: 62)
!1508 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1509, file: !1502, line: 64)
!1509 = !DISubprogram(name: "clock", scope: !1510, file: !1510, line: 72, type: !1511, flags: DIFlagPrototyped, spFlags: 0)
!1510 = !DIFile(filename: "/usr/include/time.h", directory: "", checksumkind: CSK_MD5, checksum: "19daa87a550fdc2d68d9b199f5473f94")
!1511 = !DISubroutineType(types: !1512)
!1512 = !{!1499}
!1513 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1514, file: !1502, line: 65)
!1514 = !DISubprogram(name: "difftime", scope: !1510, file: !1510, line: 79, type: !1515, flags: DIFlagPrototyped, spFlags: 0)
!1515 = !DISubroutineType(types: !1516)
!1516 = !{!32, !1504, !1504}
!1517 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1518, file: !1502, line: 66)
!1518 = !DISubprogram(name: "mktime", scope: !1510, file: !1510, line: 83, type: !1519, flags: DIFlagPrototyped, spFlags: 0)
!1519 = !DISubroutineType(types: !1520)
!1520 = !{!1504, !1521}
!1521 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1032, size: 64)
!1522 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1523, file: !1502, line: 67)
!1523 = !DISubprogram(name: "time", scope: !1510, file: !1510, line: 76, type: !1524, flags: DIFlagPrototyped, spFlags: 0)
!1524 = !DISubroutineType(types: !1525)
!1525 = !{!1504, !1526}
!1526 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1504, size: 64)
!1527 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1528, file: !1502, line: 68)
!1528 = !DISubprogram(name: "asctime", scope: !1510, file: !1510, line: 180, type: !1529, flags: DIFlagPrototyped, spFlags: 0)
!1529 = !DISubroutineType(types: !1530)
!1530 = !{!437, !1030}
!1531 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1532, file: !1502, line: 69)
!1532 = !DISubprogram(name: "ctime", scope: !1510, file: !1510, line: 184, type: !1533, flags: DIFlagPrototyped, spFlags: 0)
!1533 = !DISubroutineType(types: !1534)
!1534 = !{!437, !1535}
!1535 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1536, size: 64)
!1536 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1504)
!1537 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1538, file: !1502, line: 70)
!1538 = !DISubprogram(name: "gmtime", scope: !1510, file: !1510, line: 133, type: !1539, flags: DIFlagPrototyped, spFlags: 0)
!1539 = !DISubroutineType(types: !1540)
!1540 = !{!1521, !1535}
!1541 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1542, file: !1502, line: 71)
!1542 = !DISubprogram(name: "localtime", scope: !1510, file: !1510, line: 137, type: !1539, flags: DIFlagPrototyped, spFlags: 0)
!1543 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1544, file: !1502, line: 72)
!1544 = !DISubprogram(name: "strftime", scope: !1510, file: !1510, line: 100, type: !1545, flags: DIFlagPrototyped, spFlags: 0)
!1545 = !DISubroutineType(types: !1546)
!1546 = !{!389, !504, !389, !461, !1029}
!1547 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1548, file: !1502, line: 79)
!1548 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timespec", file: !1549, line: 11, size: 128, flags: DIFlagTypePassByValue, elements: !1550, identifier: "_ZTS8timespec")
!1549 = !DIFile(filename: "/usr/include/bits/types/struct_timespec.h", directory: "", checksumkind: CSK_MD5, checksum: "55dc154df3f21a5aa944dcafba9b43f6")
!1550 = !{!1551, !1552}
!1551 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !1548, file: !1549, line: 16, baseType: !1506, size: 64)
!1552 = !DIDerivedType(tag: DW_TAG_member, name: "tv_nsec", scope: !1548, file: !1549, line: 21, baseType: !1553, size: 64, offset: 64)
!1553 = !DIDerivedType(tag: DW_TAG_typedef, name: "__syscall_slong_t", file: !10, line: 197, baseType: !250)
!1554 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !20, entity: !1555, file: !1502, line: 80)
!1555 = !DISubprogram(name: "timespec_get", scope: !1510, file: !1510, line: 384, type: !1556, flags: DIFlagPrototyped, spFlags: 0)
!1556 = !DISubroutineType(types: !1557)
!1557 = !{!25, !1558, !25}
!1558 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1548, size: 64)
!1559 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !1560, entity: !1561, file: !1563, line: 1436)
!1560 = !DINamespace(name: "chrono", scope: !20)
!1561 = !DINamespace(name: "chrono_literals", scope: !1562, exportSymbols: true)
!1562 = !DINamespace(name: "literals", scope: !20, exportSymbols: true)
!1563 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/bits/chrono.h", directory: "")
!1564 = !{i32 1, !"amdhsa_code_object_version", i32 600}
!1565 = !{i32 1, !"amdgpu_printf_kind", !"hostcall"}
!1566 = !{i32 7, !"Dwarf Version", i32 5}
!1567 = !{i32 2, !"Debug Info Version", i32 3}
!1568 = !{i32 1, !"wchar_size", i32 4}
!1569 = !{i32 8, !"PIC Level", i32 2}
!1570 = !{i32 7, !"frame-pointer", i32 2}
!1571 = !{!"AMD clang version 19.0.0git (https://github.com/RadeonOpenCompute/llvm-project roc-6.4.2 25224 d366fa84f3fdcbd4b10847ebd5db572ae12a34fb)"}
!1572 = !{i32 2, i32 0}
!1573 = distinct !DISubprogram(name: "__cxa_pure_virtual", scope: !1574, file: !1574, line: 37, type: !382, scopeLine: 37, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagDefinition, unit: !0)
!1574 = !DIFile(filename: "/opt/rocm-6.4.2/lib/llvm/lib/clang/19/include/__clang_hip_runtime_wrapper.h", directory: "", checksumkind: CSK_MD5, checksum: "3b4af0bdaa6ccc1fa2b6e310d2157303")
!1575 = !DILocation(line: 38, column: 5, scope: !1573)
!1576 = !DILocation(line: 39, column: 3, scope: !1573)
!1577 = distinct !DISubprogram(name: "__cxa_deleted_virtual", scope: !1574, file: !1574, line: 43, type: !382, scopeLine: 43, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagDefinition, unit: !0)
!1578 = !DILocation(line: 44, column: 5, scope: !1577)
!1579 = !DILocation(line: 45, column: 3, scope: !1577)
!1580 = distinct !DISubprogram(name: "__assert_fail", scope: !1581, file: !1581, line: 44, type: !1582, scopeLine: 48, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !1584)
!1581 = !DIFile(filename: "/opt/rocm-6.4.2/include/hip/amd_detail/hip_assert.h", directory: "", checksumkind: CSK_MD5, checksum: "a705f3fd54b4159bc676e001f217fb77")
!1582 = !DISubroutineType(types: !1583)
!1583 = !{null, !269, !269, !11, !269}
!1584 = !{!1585, !1586, !1587, !1588, !1589, !1593, !1594, !1595, !1597, !1599, !1601}
!1585 = !DILocalVariable(name: "assertion", arg: 1, scope: !1580, file: !1581, line: 44, type: !269)
!1586 = !DILocalVariable(name: "file", arg: 2, scope: !1580, file: !1581, line: 45, type: !269)
!1587 = !DILocalVariable(name: "line", arg: 3, scope: !1580, file: !1581, line: 46, type: !11)
!1588 = !DILocalVariable(name: "function", arg: 4, scope: !1580, file: !1581, line: 47, type: !269)
!1589 = !DILocalVariable(name: "fmt", scope: !1580, file: !1581, line: 49, type: !1590)
!1590 = !DICompositeType(tag: DW_TAG_array_type, baseType: !270, size: 376, elements: !1591)
!1591 = !{!1592}
!1592 = !DISubrange(count: 47)
!1593 = !DILocalVariable(name: "msg", scope: !1580, file: !1581, line: 68, type: !1471)
!1594 = !DILocalVariable(name: "len", scope: !1580, file: !1581, line: 69, type: !25)
!1595 = !DILocalVariable(name: "tmp", scope: !1596, file: !1581, line: 70, type: !269)
!1596 = distinct !DILexicalBlock(scope: !1580, file: !1581, line: 70, column: 3)
!1597 = !DILocalVariable(name: "tmp", scope: !1598, file: !1581, line: 72, type: !269)
!1598 = distinct !DILexicalBlock(scope: !1580, file: !1581, line: 72, column: 3)
!1599 = !DILocalVariable(name: "tmp", scope: !1600, file: !1581, line: 75, type: !269)
!1600 = distinct !DILexicalBlock(scope: !1580, file: !1581, line: 75, column: 3)
!1601 = !DILocalVariable(name: "tmp", scope: !1602, file: !1581, line: 77, type: !269)
!1602 = distinct !DILexicalBlock(scope: !1580, file: !1581, line: 77, column: 3)
!1603 = !DILocation(line: 44, column: 32, scope: !1580)
!1604 = !DILocation(line: 45, column: 32, scope: !1580)
!1605 = !DILocation(line: 46, column: 33, scope: !1580)
!1606 = !DILocation(line: 47, column: 32, scope: !1580)
!1607 = !DILocation(line: 49, column: 14, scope: !1580)
!1608 = !DILocation(line: 68, column: 8, scope: !1580)
!1609 = !DILocation(line: 68, column: 14, scope: !1580)
!1610 = !DILocation(line: 69, column: 7, scope: !1580)
!1611 = !DILocation(line: 70, column: 3, scope: !1580)
!1612 = !DILocation(line: 70, column: 3, scope: !1596)
!1613 = distinct !{!1613, !1612, !1612, !1614}
!1614 = !{!"llvm.loop.mustprogress"}
!1615 = !DILocation(line: 71, column: 40, scope: !1580)
!1616 = !DILocation(line: 71, column: 45, scope: !1580)
!1617 = !DILocation(line: 71, column: 50, scope: !1580)
!1618 = !DILocation(line: 71, column: 9, scope: !1580)
!1619 = !DILocation(line: 71, column: 7, scope: !1580)
!1620 = !DILocation(line: 72, column: 3, scope: !1580)
!1621 = !DILocation(line: 72, column: 3, scope: !1598)
!1622 = distinct !{!1622, !1621, !1621, !1614}
!1623 = !DILocation(line: 73, column: 40, scope: !1580)
!1624 = !DILocation(line: 73, column: 45, scope: !1580)
!1625 = !DILocation(line: 73, column: 51, scope: !1580)
!1626 = !DILocation(line: 73, column: 9, scope: !1580)
!1627 = !DILocation(line: 73, column: 7, scope: !1580)
!1628 = !DILocation(line: 74, column: 36, scope: !1580)
!1629 = !DILocation(line: 74, column: 44, scope: !1580)
!1630 = !DILocation(line: 74, column: 9, scope: !1580)
!1631 = !DILocation(line: 74, column: 7, scope: !1580)
!1632 = !DILocation(line: 75, column: 3, scope: !1580)
!1633 = !DILocation(line: 75, column: 3, scope: !1600)
!1634 = distinct !{!1634, !1633, !1633, !1614}
!1635 = !DILocation(line: 76, column: 40, scope: !1580)
!1636 = !DILocation(line: 76, column: 45, scope: !1580)
!1637 = !DILocation(line: 76, column: 55, scope: !1580)
!1638 = !DILocation(line: 76, column: 9, scope: !1580)
!1639 = !DILocation(line: 76, column: 7, scope: !1580)
!1640 = !DILocation(line: 77, column: 3, scope: !1580)
!1641 = !DILocation(line: 77, column: 3, scope: !1602)
!1642 = distinct !{!1642, !1641, !1641, !1614}
!1643 = !DILocation(line: 78, column: 34, scope: !1580)
!1644 = !DILocation(line: 78, column: 39, scope: !1580)
!1645 = !DILocation(line: 78, column: 50, scope: !1580)
!1646 = !DILocation(line: 78, column: 3, scope: !1580)
!1647 = !DILocation(line: 82, column: 3, scope: !1580)
!1648 = !DILocation(line: 83, column: 1, scope: !1580)
!1649 = distinct !DISubprogram(name: "__assertfail", scope: !1581, file: !1581, line: 86, type: !382, scopeLine: 87, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0)
!1650 = !DILocation(line: 89, column: 5, scope: !1649)
!1651 = !DILocation(line: 90, column: 1, scope: !1649)
!1652 = distinct !DISubprogram(name: "dense_esuhm<float>", linkageName: "_Z11dense_esuhmIfEvPKT_S2_PS0_iPKi", scope: !988, file: !988, line: 30, type: !1653, scopeLine: 36, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, templateParams: !1678, retainedNodes: !1661)
!1653 = !DISubroutineType(types: !1654)
!1654 = !{null, !1655, !1655, !715, !25, !1658}
!1655 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1656)
!1656 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1657, size: 64)
!1657 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !91)
!1658 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1659)
!1659 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1660, size: 64)
!1660 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !25)
!1661 = !{!1662, !1663, !1664, !1665, !1666, !1667, !1668, !1669, !1670, !1671, !1673, !1676}
!1662 = !DILocalVariable(name: "input", arg: 1, scope: !1652, file: !988, line: 31, type: !1655)
!1663 = !DILocalVariable(name: "dense", arg: 2, scope: !1652, file: !988, line: 32, type: !1655)
!1664 = !DILocalVariable(name: "output", arg: 3, scope: !1652, file: !988, line: 33, type: !715)
!1665 = !DILocalVariable(name: "embedding_dim", arg: 4, scope: !1652, file: !988, line: 34, type: !25)
!1666 = !DILocalVariable(name: "offset", arg: 5, scope: !1652, file: !988, line: 35, type: !1658)
!1667 = !DILocalVariable(name: "batch_idx", scope: !1652, file: !988, line: 37, type: !1660)
!1668 = !DILocalVariable(name: "grain_size", scope: !1652, file: !988, line: 38, type: !1660)
!1669 = !DILocalVariable(name: "tid", scope: !1652, file: !988, line: 39, type: !1660)
!1670 = !DILocalVariable(name: "range", scope: !1652, file: !988, line: 40, type: !1660)
!1671 = !DILocalVariable(name: "idx", scope: !1672, file: !988, line: 41, type: !25)
!1672 = distinct !DILexicalBlock(scope: !1652, file: !988, line: 41, column: 3)
!1673 = !DILocalVariable(name: "dense_elem", scope: !1674, file: !988, line: 42, type: !1657)
!1674 = distinct !DILexicalBlock(scope: !1675, file: !988, line: 41, column: 63)
!1675 = distinct !DILexicalBlock(scope: !1672, file: !988, line: 41, column: 3)
!1676 = !DILocalVariable(name: "nested_idx", scope: !1677, file: !988, line: 43, type: !25)
!1677 = distinct !DILexicalBlock(scope: !1674, file: !988, line: 43, column: 5)
!1678 = !{!1679}
!1679 = !DITemplateTypeParameter(name: "T", type: !91)
!1680 = !DILocation(line: 31, column: 27, scope: !1652)
!1681 = !DILocation(line: 32, column: 27, scope: !1652)
!1682 = !DILocation(line: 33, column: 14, scope: !1652)
!1683 = !DILocation(line: 34, column: 9, scope: !1652)
!1684 = !DILocation(line: 35, column: 29, scope: !1652)
!1685 = !DILocation(line: 37, column: 13, scope: !1652)
!1686 = !DILocation(line: 270, column: 58, scope: !1687, inlinedAt: !1691)
!1687 = distinct !DISubprogram(name: "__hip_get_block_idx_x", linkageName: "_ZL21__hip_get_block_idx_xv", scope: !1688, file: !1688, line: 270, type: !1689, scopeLine: 270, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0)
!1688 = !DIFile(filename: "/opt/rocm-6.4.2/include/hip/amd_detail/amd_hip_runtime.h", directory: "", checksumkind: CSK_MD5, checksum: "38097f6211bac4e19f9ae3395b411f76")
!1689 = !DISubroutineType(types: !1690)
!1690 = !{!11}
!1691 = distinct !DILocation(line: 300, column: 3, scope: !1692, inlinedAt: !1704)
!1692 = distinct !DISubprogram(name: "__get_x", linkageName: "_ZN24__hip_builtin_blockIdx_t7__get_xEv", scope: !1693, file: !1688, line: 300, type: !1689, scopeLine: 300, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, declaration: !1695)
!1693 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__hip_builtin_blockIdx_t", file: !1688, line: 299, size: 8, flags: DIFlagTypePassByValue, elements: !1694, identifier: "_ZTS24__hip_builtin_blockIdx_t")
!1694 = !{!1695, !1696, !1697, !1698}
!1695 = !DISubprogram(name: "__get_x", linkageName: "_ZN24__hip_builtin_blockIdx_t7__get_xEv", scope: !1693, file: !1688, line: 300, type: !1689, scopeLine: 300, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!1696 = !DISubprogram(name: "__get_y", linkageName: "_ZN24__hip_builtin_blockIdx_t7__get_yEv", scope: !1693, file: !1688, line: 301, type: !1689, scopeLine: 301, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!1697 = !DISubprogram(name: "__get_z", linkageName: "_ZN24__hip_builtin_blockIdx_t7__get_zEv", scope: !1693, file: !1688, line: 302, type: !1689, scopeLine: 302, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!1698 = !DISubprogram(name: "operator dim3", linkageName: "_ZNK24__hip_builtin_blockIdx_tcv4dim3Ev", scope: !1693, file: !1688, line: 304, type: !1699, scopeLine: 304, flags: DIFlagPrototyped, spFlags: 0)
!1699 = !DISubroutineType(types: !1700)
!1700 = !{!1701, !1702}
!1701 = !DIDerivedType(tag: DW_TAG_typedef, name: "dim3", file: !4, line: 1186, baseType: !3)
!1702 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1703, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1703 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1693)
!1704 = distinct !DILocation(line: 37, column: 26, scope: !1652)
!1705 = !DILocation(line: 38, column: 13, scope: !1652)
!1706 = !DILocation(line: 275, column: 58, scope: !1707, inlinedAt: !1708)
!1707 = distinct !DISubprogram(name: "__hip_get_block_dim_x", linkageName: "_ZL21__hip_get_block_dim_xv", scope: !1688, file: !1688, line: 275, type: !1689, scopeLine: 275, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0)
!1708 = distinct !DILocation(line: 309, column: 3, scope: !1709, inlinedAt: !1720)
!1709 = distinct !DISubprogram(name: "__get_x", linkageName: "_ZN24__hip_builtin_blockDim_t7__get_xEv", scope: !1710, file: !1688, line: 309, type: !1689, scopeLine: 309, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, declaration: !1712)
!1710 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__hip_builtin_blockDim_t", file: !1688, line: 308, size: 8, flags: DIFlagTypePassByValue, elements: !1711, identifier: "_ZTS24__hip_builtin_blockDim_t")
!1711 = !{!1712, !1713, !1714, !1715}
!1712 = !DISubprogram(name: "__get_x", linkageName: "_ZN24__hip_builtin_blockDim_t7__get_xEv", scope: !1710, file: !1688, line: 309, type: !1689, scopeLine: 309, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!1713 = !DISubprogram(name: "__get_y", linkageName: "_ZN24__hip_builtin_blockDim_t7__get_yEv", scope: !1710, file: !1688, line: 310, type: !1689, scopeLine: 310, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!1714 = !DISubprogram(name: "__get_z", linkageName: "_ZN24__hip_builtin_blockDim_t7__get_zEv", scope: !1710, file: !1688, line: 311, type: !1689, scopeLine: 311, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!1715 = !DISubprogram(name: "operator dim3", linkageName: "_ZNK24__hip_builtin_blockDim_tcv4dim3Ev", scope: !1710, file: !1688, line: 313, type: !1716, scopeLine: 313, flags: DIFlagPrototyped, spFlags: 0)
!1716 = !DISubroutineType(types: !1717)
!1717 = !{!1701, !1718}
!1718 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1719, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1719 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1710)
!1720 = distinct !DILocation(line: 38, column: 26, scope: !1652)
!1721 = !DILocation(line: 39, column: 13, scope: !1652)
!1722 = !DILocation(line: 265, column: 59, scope: !1723, inlinedAt: !1724)
!1723 = distinct !DISubprogram(name: "__hip_get_thread_idx_x", linkageName: "_ZL22__hip_get_thread_idx_xv", scope: !1688, file: !1688, line: 265, type: !1689, scopeLine: 265, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0)
!1724 = distinct !DILocation(line: 291, column: 3, scope: !1725, inlinedAt: !1736)
!1725 = distinct !DISubprogram(name: "__get_x", linkageName: "_ZN25__hip_builtin_threadIdx_t7__get_xEv", scope: !1726, file: !1688, line: 291, type: !1689, scopeLine: 291, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, declaration: !1728)
!1726 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__hip_builtin_threadIdx_t", file: !1688, line: 290, size: 8, flags: DIFlagTypePassByValue, elements: !1727, identifier: "_ZTS25__hip_builtin_threadIdx_t")
!1727 = !{!1728, !1729, !1730, !1731}
!1728 = !DISubprogram(name: "__get_x", linkageName: "_ZN25__hip_builtin_threadIdx_t7__get_xEv", scope: !1726, file: !1688, line: 291, type: !1689, scopeLine: 291, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!1729 = !DISubprogram(name: "__get_y", linkageName: "_ZN25__hip_builtin_threadIdx_t7__get_yEv", scope: !1726, file: !1688, line: 292, type: !1689, scopeLine: 292, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!1730 = !DISubprogram(name: "__get_z", linkageName: "_ZN25__hip_builtin_threadIdx_t7__get_zEv", scope: !1726, file: !1688, line: 293, type: !1689, scopeLine: 293, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!1731 = !DISubprogram(name: "operator dim3", linkageName: "_ZNK25__hip_builtin_threadIdx_tcv4dim3Ev", scope: !1726, file: !1688, line: 295, type: !1732, scopeLine: 295, flags: DIFlagPrototyped, spFlags: 0)
!1732 = !DISubroutineType(types: !1733)
!1733 = !{!1701, !1734}
!1734 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1735, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1735 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1726)
!1736 = distinct !DILocation(line: 39, column: 19, scope: !1652)
!1737 = !DILocation(line: 40, column: 13, scope: !1652)
!1738 = !DILocation(line: 40, column: 21, scope: !1652)
!1739 = !DILocation(line: 40, column: 28, scope: !1652)
!1740 = !DILocation(line: 40, column: 38, scope: !1652)
!1741 = !DILocation(line: 40, column: 45, scope: !1652)
!1742 = !DILocation(line: 40, column: 52, scope: !1652)
!1743 = !DILocation(line: 40, column: 43, scope: !1652)
!1744 = !DILocation(line: 41, column: 12, scope: !1672)
!1745 = !DILocation(line: 41, column: 18, scope: !1672)
!1746 = !DILocation(line: 41, column: 8, scope: !1672)
!1747 = !DILocation(line: 41, column: 23, scope: !1675)
!1748 = !DILocation(line: 41, column: 29, scope: !1675)
!1749 = !DILocation(line: 41, column: 27, scope: !1675)
!1750 = !DILocation(line: 41, column: 3, scope: !1672)
!1751 = !DILocation(line: 42, column: 13, scope: !1674)
!1752 = !DILocation(line: 42, column: 26, scope: !1674)
!1753 = !DILocation(line: 42, column: 32, scope: !1674)
!1754 = !DILocation(line: 42, column: 44, scope: !1674)
!1755 = !DILocation(line: 42, column: 42, scope: !1674)
!1756 = !DILocation(line: 42, column: 60, scope: !1674)
!1757 = !DILocation(line: 42, column: 58, scope: !1674)
!1758 = !DILocation(line: 43, column: 14, scope: !1677)
!1759 = !DILocation(line: 43, column: 27, scope: !1677)
!1760 = !DILocation(line: 43, column: 10, scope: !1677)
!1761 = !DILocation(line: 43, column: 32, scope: !1762)
!1762 = distinct !DILexicalBlock(scope: !1677, file: !988, line: 43, column: 5)
!1763 = !DILocation(line: 43, column: 45, scope: !1762)
!1764 = !DILocation(line: 43, column: 43, scope: !1762)
!1765 = !DILocation(line: 43, column: 5, scope: !1677)
!1766 = !DILocation(line: 44, column: 48, scope: !1767)
!1767 = distinct !DILexicalBlock(scope: !1762, file: !988, line: 43, column: 81)
!1768 = !DILocation(line: 44, column: 54, scope: !1767)
!1769 = !DILocation(line: 44, column: 61, scope: !1767)
!1770 = !DILocation(line: 44, column: 74, scope: !1767)
!1771 = !DILocation(line: 44, column: 72, scope: !1767)
!1772 = !DILocation(line: 44, column: 88, scope: !1767)
!1773 = !DILocation(line: 44, column: 86, scope: !1767)
!1774 = !DILocation(line: 44, column: 7, scope: !1767)
!1775 = !DILocation(line: 44, column: 14, scope: !1767)
!1776 = !DILocation(line: 44, column: 21, scope: !1767)
!1777 = !DILocation(line: 44, column: 34, scope: !1767)
!1778 = !DILocation(line: 44, column: 32, scope: !1767)
!1779 = !DILocation(line: 44, column: 46, scope: !1767)
!1780 = !DILocation(line: 45, column: 5, scope: !1767)
!1781 = !DILocation(line: 43, column: 66, scope: !1762)
!1782 = !DILocation(line: 43, column: 63, scope: !1762)
!1783 = !DILocation(line: 43, column: 5, scope: !1762)
!1784 = distinct !{!1784, !1765, !1785, !1614}
!1785 = !DILocation(line: 45, column: 5, scope: !1677)
!1786 = !DILocation(line: 46, column: 3, scope: !1674)
!1787 = !DILocation(line: 41, column: 51, scope: !1675)
!1788 = !DILocation(line: 41, column: 48, scope: !1675)
!1789 = !DILocation(line: 41, column: 3, scope: !1675)
!1790 = distinct !{!1790, !1750, !1791, !1614}
!1791 = !DILocation(line: 46, column: 3, scope: !1672)
!1792 = !DILocation(line: 47, column: 1, scope: !1652)
!1793 = distinct !DISubprogram(name: "dense_esuhm2<float>", linkageName: "_Z12dense_esuhm2IfEvPKT_S2_PS0_iPKi", scope: !988, file: !988, line: 50, type: !1653, scopeLine: 56, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, templateParams: !1678, retainedNodes: !1794)
!1794 = !{!1795, !1796, !1797, !1798, !1799, !1800, !1801, !1802, !1803, !1805, !1808}
!1795 = !DILocalVariable(name: "input", arg: 1, scope: !1793, file: !988, line: 51, type: !1655)
!1796 = !DILocalVariable(name: "dense", arg: 2, scope: !1793, file: !988, line: 52, type: !1655)
!1797 = !DILocalVariable(name: "output", arg: 3, scope: !1793, file: !988, line: 53, type: !715)
!1798 = !DILocalVariable(name: "embedding_dim", arg: 4, scope: !1793, file: !988, line: 54, type: !25)
!1799 = !DILocalVariable(name: "offset", arg: 5, scope: !1793, file: !988, line: 55, type: !1658)
!1800 = !DILocalVariable(name: "batch_idx", scope: !1793, file: !988, line: 57, type: !1660)
!1801 = !DILocalVariable(name: "start", scope: !1793, file: !988, line: 58, type: !1660)
!1802 = !DILocalVariable(name: "range", scope: !1793, file: !988, line: 59, type: !1660)
!1803 = !DILocalVariable(name: "idx", scope: !1804, file: !988, line: 60, type: !25)
!1804 = distinct !DILexicalBlock(scope: !1793, file: !988, line: 60, column: 3)
!1805 = !DILocalVariable(name: "dense_elem", scope: !1806, file: !988, line: 61, type: !1657)
!1806 = distinct !DILexicalBlock(scope: !1807, file: !988, line: 60, column: 71)
!1807 = distinct !DILexicalBlock(scope: !1804, file: !988, line: 60, column: 3)
!1808 = !DILocalVariable(name: "nested_idx", scope: !1809, file: !988, line: 62, type: !25)
!1809 = distinct !DILexicalBlock(scope: !1806, file: !988, line: 62, column: 5)
!1810 = !DILocation(line: 51, column: 27, scope: !1793)
!1811 = !DILocation(line: 52, column: 27, scope: !1793)
!1812 = !DILocation(line: 53, column: 14, scope: !1793)
!1813 = !DILocation(line: 54, column: 9, scope: !1793)
!1814 = !DILocation(line: 55, column: 29, scope: !1793)
!1815 = !DILocation(line: 57, column: 13, scope: !1793)
!1816 = !DILocation(line: 270, column: 58, scope: !1687, inlinedAt: !1817)
!1817 = distinct !DILocation(line: 300, column: 3, scope: !1692, inlinedAt: !1818)
!1818 = distinct !DILocation(line: 57, column: 26, scope: !1793)
!1819 = !DILocation(line: 58, column: 13, scope: !1793)
!1820 = !DILocation(line: 58, column: 21, scope: !1793)
!1821 = !DILocation(line: 58, column: 28, scope: !1793)
!1822 = !DILocation(line: 59, column: 13, scope: !1793)
!1823 = !DILocation(line: 59, column: 21, scope: !1793)
!1824 = !DILocation(line: 59, column: 28, scope: !1793)
!1825 = !DILocation(line: 59, column: 38, scope: !1793)
!1826 = !DILocation(line: 59, column: 45, scope: !1793)
!1827 = !DILocation(line: 59, column: 43, scope: !1793)
!1828 = !DILocation(line: 60, column: 12, scope: !1804)
!1829 = !DILocation(line: 265, column: 59, scope: !1723, inlinedAt: !1830)
!1830 = distinct !DILocation(line: 291, column: 3, scope: !1725, inlinedAt: !1831)
!1831 = distinct !DILocation(line: 60, column: 18, scope: !1804)
!1832 = !DILocation(line: 60, column: 8, scope: !1804)
!1833 = !DILocation(line: 60, column: 31, scope: !1807)
!1834 = !DILocation(line: 60, column: 37, scope: !1807)
!1835 = !DILocation(line: 60, column: 35, scope: !1807)
!1836 = !DILocation(line: 60, column: 3, scope: !1804)
!1837 = !DILocation(line: 61, column: 13, scope: !1806)
!1838 = !DILocation(line: 61, column: 26, scope: !1806)
!1839 = !DILocation(line: 61, column: 32, scope: !1806)
!1840 = !DILocation(line: 61, column: 44, scope: !1806)
!1841 = !DILocation(line: 61, column: 42, scope: !1806)
!1842 = !DILocation(line: 61, column: 60, scope: !1806)
!1843 = !DILocation(line: 61, column: 58, scope: !1806)
!1844 = !DILocation(line: 62, column: 14, scope: !1809)
!1845 = !DILocation(line: 62, column: 27, scope: !1809)
!1846 = !DILocation(line: 62, column: 10, scope: !1809)
!1847 = !DILocation(line: 62, column: 32, scope: !1848)
!1848 = distinct !DILexicalBlock(scope: !1809, file: !988, line: 62, column: 5)
!1849 = !DILocation(line: 62, column: 45, scope: !1848)
!1850 = !DILocation(line: 62, column: 43, scope: !1848)
!1851 = !DILocation(line: 62, column: 5, scope: !1809)
!1852 = !DILocation(line: 63, column: 36, scope: !1853)
!1853 = distinct !DILexicalBlock(scope: !1848, file: !988, line: 62, column: 81)
!1854 = !DILocation(line: 63, column: 42, scope: !1853)
!1855 = !DILocation(line: 63, column: 50, scope: !1853)
!1856 = !DILocation(line: 63, column: 48, scope: !1853)
!1857 = !DILocation(line: 63, column: 64, scope: !1853)
!1858 = !DILocation(line: 63, column: 62, scope: !1853)
!1859 = !DILocation(line: 63, column: 7, scope: !1853)
!1860 = !DILocation(line: 63, column: 14, scope: !1853)
!1861 = !DILocation(line: 63, column: 22, scope: !1853)
!1862 = !DILocation(line: 63, column: 20, scope: !1853)
!1863 = !DILocation(line: 63, column: 34, scope: !1853)
!1864 = !DILocation(line: 64, column: 5, scope: !1853)
!1865 = !DILocation(line: 62, column: 66, scope: !1848)
!1866 = !DILocation(line: 62, column: 63, scope: !1848)
!1867 = !DILocation(line: 62, column: 5, scope: !1848)
!1868 = distinct !{!1868, !1851, !1869, !1614}
!1869 = !DILocation(line: 64, column: 5, scope: !1809)
!1870 = !DILocation(line: 65, column: 3, scope: !1806)
!1871 = !DILocation(line: 275, column: 58, scope: !1707, inlinedAt: !1872)
!1872 = distinct !DILocation(line: 309, column: 3, scope: !1709, inlinedAt: !1873)
!1873 = distinct !DILocation(line: 60, column: 59, scope: !1807)
!1874 = !DILocation(line: 60, column: 56, scope: !1807)
!1875 = !DILocation(line: 60, column: 3, scope: !1807)
!1876 = distinct !{!1876, !1836, !1877, !1614}
!1877 = !DILocation(line: 65, column: 3, scope: !1804)
!1878 = !DILocation(line: 66, column: 1, scope: !1793)
!1879 = distinct !DISubprogram(name: "dense_esuhm3<float>", linkageName: "_Z12dense_esuhm3IfEvPKT_S2_PS0_iPKi", scope: !988, file: !988, line: 70, type: !1653, scopeLine: 76, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, templateParams: !1678, retainedNodes: !1880)
!1880 = !{!1881, !1882, !1883, !1884, !1885, !1886, !1887, !1888, !1889, !1891, !1894, !1897}
!1881 = !DILocalVariable(name: "input", arg: 1, scope: !1879, file: !988, line: 71, type: !1655)
!1882 = !DILocalVariable(name: "dense", arg: 2, scope: !1879, file: !988, line: 72, type: !1655)
!1883 = !DILocalVariable(name: "output", arg: 3, scope: !1879, file: !988, line: 73, type: !715)
!1884 = !DILocalVariable(name: "embedding_dim", arg: 4, scope: !1879, file: !988, line: 74, type: !25)
!1885 = !DILocalVariable(name: "offset", arg: 5, scope: !1879, file: !988, line: 75, type: !1658)
!1886 = !DILocalVariable(name: "batch_idx", scope: !1879, file: !988, line: 77, type: !1660)
!1887 = !DILocalVariable(name: "start", scope: !1879, file: !988, line: 78, type: !1660)
!1888 = !DILocalVariable(name: "range", scope: !1879, file: !988, line: 79, type: !1660)
!1889 = !DILocalVariable(name: "s", scope: !1890, file: !988, line: 81, type: !25)
!1890 = distinct !DILexicalBlock(scope: !1879, file: !988, line: 81, column: 3)
!1891 = !DILocalVariable(name: "idx", scope: !1892, file: !988, line: 82, type: !25)
!1892 = distinct !DILexicalBlock(scope: !1893, file: !988, line: 81, column: 47)
!1893 = distinct !DILexicalBlock(scope: !1890, file: !988, line: 81, column: 3)
!1894 = !DILocalVariable(name: "input_elem", scope: !1895, file: !988, line: 84, type: !91)
!1895 = distinct !DILexicalBlock(scope: !1896, file: !988, line: 83, column: 22)
!1896 = distinct !DILexicalBlock(scope: !1892, file: !988, line: 83, column: 9)
!1897 = !DILocalVariable(name: "dense_elem", scope: !1895, file: !988, line: 85, type: !91)
!1898 = !DILocation(line: 71, column: 27, scope: !1879)
!1899 = !DILocation(line: 72, column: 27, scope: !1879)
!1900 = !DILocation(line: 73, column: 14, scope: !1879)
!1901 = !DILocation(line: 74, column: 9, scope: !1879)
!1902 = !DILocation(line: 75, column: 29, scope: !1879)
!1903 = !DILocation(line: 77, column: 13, scope: !1879)
!1904 = !DILocation(line: 270, column: 58, scope: !1687, inlinedAt: !1905)
!1905 = distinct !DILocation(line: 300, column: 3, scope: !1692, inlinedAt: !1906)
!1906 = distinct !DILocation(line: 77, column: 25, scope: !1879)
!1907 = !DILocation(line: 78, column: 13, scope: !1879)
!1908 = !DILocation(line: 78, column: 21, scope: !1879)
!1909 = !DILocation(line: 78, column: 28, scope: !1879)
!1910 = !DILocation(line: 79, column: 13, scope: !1879)
!1911 = !DILocation(line: 79, column: 21, scope: !1879)
!1912 = !DILocation(line: 79, column: 28, scope: !1879)
!1913 = !DILocation(line: 79, column: 38, scope: !1879)
!1914 = !DILocation(line: 79, column: 45, scope: !1879)
!1915 = !DILocation(line: 79, column: 43, scope: !1879)
!1916 = !DILocation(line: 81, column: 12, scope: !1890)
!1917 = !DILocation(line: 81, column: 8, scope: !1890)
!1918 = !DILocation(line: 81, column: 19, scope: !1893)
!1919 = !DILocation(line: 81, column: 23, scope: !1893)
!1920 = !DILocation(line: 81, column: 21, scope: !1893)
!1921 = !DILocation(line: 81, column: 3, scope: !1890)
!1922 = !DILocation(line: 82, column: 9, scope: !1892)
!1923 = !DILocation(line: 82, column: 15, scope: !1892)
!1924 = !DILocation(line: 265, column: 59, scope: !1723, inlinedAt: !1925)
!1925 = distinct !DILocation(line: 291, column: 3, scope: !1725, inlinedAt: !1926)
!1926 = distinct !DILocation(line: 82, column: 19, scope: !1892)
!1927 = !DILocation(line: 82, column: 17, scope: !1892)
!1928 = !DILocation(line: 83, column: 9, scope: !1896)
!1929 = !DILocation(line: 83, column: 15, scope: !1896)
!1930 = !DILocation(line: 83, column: 13, scope: !1896)
!1931 = !DILocation(line: 83, column: 9, scope: !1892)
!1932 = !DILocation(line: 84, column: 9, scope: !1895)
!1933 = !DILocation(line: 84, column: 22, scope: !1895)
!1934 = !DILocation(line: 84, column: 28, scope: !1895)
!1935 = !DILocation(line: 84, column: 36, scope: !1895)
!1936 = !DILocation(line: 84, column: 34, scope: !1895)
!1937 = !DILocation(line: 85, column: 9, scope: !1895)
!1938 = !DILocation(line: 85, column: 22, scope: !1895)
!1939 = !DILocation(line: 85, column: 28, scope: !1895)
!1940 = !DILocation(line: 85, column: 40, scope: !1895)
!1941 = !DILocation(line: 85, column: 38, scope: !1895)
!1942 = !DILocation(line: 85, column: 56, scope: !1895)
!1943 = !DILocation(line: 85, column: 62, scope: !1895)
!1944 = !DILocation(line: 85, column: 60, scope: !1895)
!1945 = !DILocation(line: 85, column: 54, scope: !1895)
!1946 = !DILocation(line: 86, column: 29, scope: !1895)
!1947 = !DILocation(line: 86, column: 42, scope: !1895)
!1948 = !DILocation(line: 86, column: 40, scope: !1895)
!1949 = !DILocation(line: 86, column: 7, scope: !1895)
!1950 = !DILocation(line: 86, column: 14, scope: !1895)
!1951 = !DILocation(line: 86, column: 22, scope: !1895)
!1952 = !DILocation(line: 86, column: 20, scope: !1895)
!1953 = !DILocation(line: 86, column: 27, scope: !1895)
!1954 = !DILocation(line: 87, column: 5, scope: !1895)
!1955 = !DILocation(line: 88, column: 3, scope: !1892)
!1956 = !DILocation(line: 275, column: 58, scope: !1707, inlinedAt: !1957)
!1957 = distinct !DILocation(line: 309, column: 3, scope: !1709, inlinedAt: !1958)
!1958 = distinct !DILocation(line: 81, column: 35, scope: !1893)
!1959 = !DILocation(line: 81, column: 32, scope: !1893)
!1960 = !DILocation(line: 81, column: 3, scope: !1893)
!1961 = distinct !{!1961, !1921, !1962, !1614}
!1962 = !DILocation(line: 88, column: 3, scope: !1890)
!1963 = !DILocation(line: 89, column: 1, scope: !1879)
!1964 = !{!1965, !1965, i64 0}
!1965 = !{!"int", !1966, i64 0}
!1966 = !{!"omnipotent char", !1967, i64 0}
!1967 = !{!"Simple C/C++ TBAA"}
!1968 = !{!1969, !1969, i64 0}
!1969 = !{!"long", !1966, i64 0}
!1970 = !{!1971, !1972, i64 0}
!1971 = !{!"", !1972, i64 0, !1972, i64 8, !1973, i64 16, !1969, i64 24, !1969, i64 32, !1969, i64 40}
!1972 = !{!"any pointer", !1966, i64 0}
!1973 = !{!"hsa_signal_s", !1969, i64 0}
!1974 = !{!1971, !1969, i64 40}
!1975 = !{!1971, !1972, i64 8}
!1976 = !{!1977, !1965, i64 16}
!1977 = !{!"", !1969, i64 0, !1969, i64 8, !1965, i64 16, !1965, i64 20}
!1978 = !{!1977, !1969, i64 8}
!1979 = !{!1977, !1965, i64 20}
!1980 = !{!1977, !1969, i64 0}
!1981 = !{!1982, !1969, i64 16}
!1982 = !{!"amd_signal_s", !1969, i64 0, !1966, i64 8, !1969, i64 16, !1965, i64 24, !1965, i64 28, !1969, i64 32, !1969, i64 40, !1966, i64 48, !1966, i64 56}
!1983 = !{!1982, !1965, i64 24}
!1984 = !{!1966, !1966, i64 0}
!1985 = !{i16 1, i16 1025}
!1986 = !{}
!1987 = !{!1988, !1965, i64 12}
!1988 = !{!"hsa_kernel_dispatch_packet_s", !1989, i64 0, !1989, i64 2, !1989, i64 4, !1989, i64 6, !1989, i64 8, !1989, i64 10, !1965, i64 12, !1965, i64 16, !1965, i64 20, !1965, i64 24, !1965, i64 28, !1966, i64 32, !1972, i64 40, !1969, i64 48, !1973, i64 56}
!1989 = !{!"short", !1966, i64 0}
!1990 = !{!1989, !1989, i64 0}
!1991 = !{!1988, !1965, i64 16}
!1992 = !{!1988, !1965, i64 20}
