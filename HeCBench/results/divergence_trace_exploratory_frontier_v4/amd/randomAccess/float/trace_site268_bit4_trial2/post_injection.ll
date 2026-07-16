; ModuleID = '/tmp/bitir_exploratory_v4_amd_randomAccess_site268_bit4_trial2/device.injected.bc'
source_filename = "/autofs/nccs-svm1_home2/mdunlavy/GPU_FI/HeCBench/src/randomAccess-hip/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8:9"
target triple = "amdgcn-amd-amdhsa"

%0 = type { i64, i64, i32, i32 }
%1 = type { [64 x [8 x i64]] }
%struct.__hip_builtin_blockIdx_t = type { i8 }
%struct.__hip_builtin_blockDim_t = type { i8 }
%struct.__hip_builtin_threadIdx_t = type { i8 }

$_Z9atomicXorPyy = comdat any

@__const.__assert_fail.fmt = private unnamed_addr addrspace(4) constant [47 x i8] c"%s:%u: %s: Device-side assertion `%s' failed.\0A\00", align 16
@blockIdx = extern_weak dso_local protected addrspace(1) global %struct.__hip_builtin_blockIdx_t, align 1
@blockDim = extern_weak dso_local protected addrspace(1) global %struct.__hip_builtin_blockDim_t, align 1
@threadIdx = extern_weak dso_local protected addrspace(1) global %struct.__hip_builtin_threadIdx_t, align 1
@__hip_cuid_4979889931d6cee5 = addrspace(1) global i8 0
@llvm.compiler.used = appending addrspace(1) global [1 x ptr] [ptr addrspacecast (ptr addrspace(1) @__hip_cuid_4979889931d6cee5 to ptr)], section "llvm.metadata"
@__oclc_ISA_version = internal local_unnamed_addr addrspace(4) constant i32 9010, align 4
@__oclc_ABI_version = weak_odr hidden local_unnamed_addr addrspace(4) constant i32 600

; Function Attrs: convergent mustprogress noinline noreturn nounwind optnone
define weak void @__cxa_pure_virtual() #0 !dbg !1574 {
  call void @llvm.trap(), !dbg !1576
  unreachable, !dbg !1577
}

; Function Attrs: cold noreturn nounwind memory(inaccessiblemem: write)
declare void @llvm.trap() #1

; Function Attrs: convergent mustprogress noinline noreturn nounwind optnone
define weak void @__cxa_deleted_virtual() #0 !dbg !1578 {
  call void @llvm.trap(), !dbg !1579
  unreachable, !dbg !1580
}

; Function Attrs: convergent mustprogress noinline nounwind optnone
define weak hidden void @__assert_fail(ptr noundef %0, ptr noundef %1, i32 noundef %2, ptr noundef %3) #2 !dbg !1581 {
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
    #dbg_declare(ptr addrspace(5) %5, !1586, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(ptr)), !1604)
  store ptr %1, ptr %17, align 8
    #dbg_declare(ptr addrspace(5) %6, !1587, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(ptr)), !1605)
  store i32 %2, ptr %18, align 4
    #dbg_declare(ptr addrspace(5) %7, !1588, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1606)
  store ptr %3, ptr %19, align 8
    #dbg_declare(ptr addrspace(5) %8, !1589, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(ptr)), !1607)
    #dbg_declare(ptr addrspace(5) %9, !1590, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref([47 x i8])), !1608)
  call void @llvm.memcpy.p0.p4.i64(ptr align 16 %20, ptr addrspace(4) align 16 @__const.__assert_fail.fmt, i64 47, i1 false), !dbg !1608
    #dbg_declare(ptr addrspace(5) %10, !1594, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i64)), !1609)
  %27 = call i64 @__ockl_fprintf_stderr_begin() #12, !dbg !1610
  store i64 %27, ptr %21, align 8, !dbg !1609
    #dbg_declare(ptr addrspace(5) %11, !1595, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1611)
  store i32 0, ptr %22, align 4, !dbg !1611
  br label %28, !dbg !1612

28:                                               ; preds = %4
    #dbg_declare(ptr addrspace(5) %12, !1596, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(ptr)), !1613)
  %29 = getelementptr inbounds [47 x i8], ptr %20, i64 0, i64 0, !dbg !1613
  store ptr %29, ptr %23, align 8, !dbg !1613
  br label %30, !dbg !1613

30:                                               ; preds = %35, %28
  %31 = load ptr, ptr %23, align 8, !dbg !1613
  %32 = getelementptr inbounds i8, ptr %31, i32 1, !dbg !1613
  store ptr %32, ptr %23, align 8, !dbg !1613
  %33 = load i8, ptr %31, align 1, !dbg !1613
  %34 = icmp ne i8 %33, 0, !dbg !1613
  br i1 %34, label %35, label %36, !dbg !1613

35:                                               ; preds = %30
  br label %30, !dbg !1613, !llvm.loop !1614

36:                                               ; preds = %30
  %37 = load ptr, ptr %23, align 8, !dbg !1613
  %38 = getelementptr inbounds [47 x i8], ptr %20, i64 0, i64 0, !dbg !1613
  %39 = ptrtoint ptr %37 to i64, !dbg !1613
  %40 = ptrtoint ptr %38 to i64, !dbg !1613
  %41 = sub i64 %39, %40, !dbg !1613
  %42 = trunc i64 %41 to i32, !dbg !1613
  store i32 %42, ptr %22, align 4, !dbg !1613
  br label %43, !dbg !1613

43:                                               ; preds = %36
  %44 = load i64, ptr %21, align 8, !dbg !1616
  %45 = getelementptr inbounds [47 x i8], ptr %20, i64 0, i64 0, !dbg !1617
  %46 = load i32, ptr %22, align 4, !dbg !1618
  %47 = sext i32 %46 to i64, !dbg !1618
  %48 = call i64 @__ockl_fprintf_append_string_n(i64 noundef %44, ptr noundef %45, i64 noundef %47, i32 noundef 0) #12, !dbg !1619
  store i64 %48, ptr %21, align 8, !dbg !1620
  br label %49, !dbg !1621

49:                                               ; preds = %43
    #dbg_declare(ptr addrspace(5) %13, !1598, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(ptr)), !1622)
  %50 = load ptr, ptr %17, align 8, !dbg !1622
  store ptr %50, ptr %24, align 8, !dbg !1622
  br label %51, !dbg !1622

51:                                               ; preds = %56, %49
  %52 = load ptr, ptr %24, align 8, !dbg !1622
  %53 = getelementptr inbounds i8, ptr %52, i32 1, !dbg !1622
  store ptr %53, ptr %24, align 8, !dbg !1622
  %54 = load i8, ptr %52, align 1, !dbg !1622
  %55 = icmp ne i8 %54, 0, !dbg !1622
  br i1 %55, label %56, label %57, !dbg !1622

56:                                               ; preds = %51
  br label %51, !dbg !1622, !llvm.loop !1623

57:                                               ; preds = %51
  %58 = load ptr, ptr %24, align 8, !dbg !1622
  %59 = load ptr, ptr %17, align 8, !dbg !1622
  %60 = ptrtoint ptr %58 to i64, !dbg !1622
  %61 = ptrtoint ptr %59 to i64, !dbg !1622
  %62 = sub i64 %60, %61, !dbg !1622
  %63 = trunc i64 %62 to i32, !dbg !1622
  store i32 %63, ptr %22, align 4, !dbg !1622
  br label %64, !dbg !1622

64:                                               ; preds = %57
  %65 = load i64, ptr %21, align 8, !dbg !1624
  %66 = load ptr, ptr %17, align 8, !dbg !1625
  %67 = load i32, ptr %22, align 4, !dbg !1626
  %68 = sext i32 %67 to i64, !dbg !1626
  %69 = call i64 @__ockl_fprintf_append_string_n(i64 noundef %65, ptr noundef %66, i64 noundef %68, i32 noundef 0) #12, !dbg !1627
  store i64 %69, ptr %21, align 8, !dbg !1628
  %70 = load i64, ptr %21, align 8, !dbg !1629
  %71 = load i32, ptr %18, align 4, !dbg !1630
  %72 = zext i32 %71 to i64, !dbg !1630
  %73 = call i64 @__ockl_fprintf_append_args(i64 noundef %70, i32 noundef 1, i64 noundef %72, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i32 noundef 0) #12, !dbg !1631
  store i64 %73, ptr %21, align 8, !dbg !1632
  br label %74, !dbg !1633

74:                                               ; preds = %64
    #dbg_declare(ptr addrspace(5) %14, !1600, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(ptr)), !1634)
  %75 = load ptr, ptr %19, align 8, !dbg !1634
  store ptr %75, ptr %25, align 8, !dbg !1634
  br label %76, !dbg !1634

76:                                               ; preds = %81, %74
  %77 = load ptr, ptr %25, align 8, !dbg !1634
  %78 = getelementptr inbounds i8, ptr %77, i32 1, !dbg !1634
  store ptr %78, ptr %25, align 8, !dbg !1634
  %79 = load i8, ptr %77, align 1, !dbg !1634
  %80 = icmp ne i8 %79, 0, !dbg !1634
  br i1 %80, label %81, label %82, !dbg !1634

81:                                               ; preds = %76
  br label %76, !dbg !1634, !llvm.loop !1635

82:                                               ; preds = %76
  %83 = load ptr, ptr %25, align 8, !dbg !1634
  %84 = load ptr, ptr %19, align 8, !dbg !1634
  %85 = ptrtoint ptr %83 to i64, !dbg !1634
  %86 = ptrtoint ptr %84 to i64, !dbg !1634
  %87 = sub i64 %85, %86, !dbg !1634
  %88 = trunc i64 %87 to i32, !dbg !1634
  store i32 %88, ptr %22, align 4, !dbg !1634
  br label %89, !dbg !1634

89:                                               ; preds = %82
  %90 = load i64, ptr %21, align 8, !dbg !1636
  %91 = load ptr, ptr %19, align 8, !dbg !1637
  %92 = load i32, ptr %22, align 4, !dbg !1638
  %93 = sext i32 %92 to i64, !dbg !1638
  %94 = call i64 @__ockl_fprintf_append_string_n(i64 noundef %90, ptr noundef %91, i64 noundef %93, i32 noundef 0) #12, !dbg !1639
  store i64 %94, ptr %21, align 8, !dbg !1640
  br label %95, !dbg !1641

95:                                               ; preds = %89
    #dbg_declare(ptr addrspace(5) %15, !1602, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(ptr)), !1642)
  %96 = load ptr, ptr %16, align 8, !dbg !1642
  store ptr %96, ptr %26, align 8, !dbg !1642
  br label %97, !dbg !1642

97:                                               ; preds = %102, %95
  %98 = load ptr, ptr %26, align 8, !dbg !1642
  %99 = getelementptr inbounds i8, ptr %98, i32 1, !dbg !1642
  store ptr %99, ptr %26, align 8, !dbg !1642
  %100 = load i8, ptr %98, align 1, !dbg !1642
  %101 = icmp ne i8 %100, 0, !dbg !1642
  br i1 %101, label %102, label %103, !dbg !1642

102:                                              ; preds = %97
  br label %97, !dbg !1642, !llvm.loop !1643

103:                                              ; preds = %97
  %104 = load ptr, ptr %26, align 8, !dbg !1642
  %105 = load ptr, ptr %16, align 8, !dbg !1642
  %106 = ptrtoint ptr %104 to i64, !dbg !1642
  %107 = ptrtoint ptr %105 to i64, !dbg !1642
  %108 = sub i64 %106, %107, !dbg !1642
  %109 = trunc i64 %108 to i32, !dbg !1642
  store i32 %109, ptr %22, align 4, !dbg !1642
  br label %110, !dbg !1642

110:                                              ; preds = %103
  %111 = load i64, ptr %21, align 8, !dbg !1644
  %112 = load ptr, ptr %16, align 8, !dbg !1645
  %113 = load i32, ptr %22, align 4, !dbg !1646
  %114 = sext i32 %113 to i64, !dbg !1646
  %115 = call i64 @__ockl_fprintf_append_string_n(i64 noundef %111, ptr noundef %112, i64 noundef %114, i32 noundef 1) #12, !dbg !1647
  call void @llvm.trap(), !dbg !1648
  ret void, !dbg !1649
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p4.i64(ptr noalias nocapture writeonly, ptr addrspace(4) noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: convergent mustprogress noinline nounwind optnone
define weak hidden void @__assertfail() #2 !dbg !1650 {
  call void @llvm.trap(), !dbg !1651
  ret void, !dbg !1652
}

; Function Attrs: convergent mustprogress noinline nounwind optnone
define hidden noundef i64 @_Z11HPCC_startsx(i64 noundef %0) #2 !dbg !1653 {
  %2 = alloca i64, align 8, addrspace(5)
  %3 = alloca i64, align 8, addrspace(5)
  %4 = alloca i32, align 4, addrspace(5)
  %5 = alloca i32, align 4, addrspace(5)
  %6 = alloca [64 x i64], align 16, addrspace(5)
  %7 = alloca i64, align 8, addrspace(5)
  %8 = alloca i64, align 8, addrspace(5)
  %9 = addrspacecast ptr addrspace(5) %2 to ptr
  %10 = addrspacecast ptr addrspace(5) %3 to ptr
  %11 = addrspacecast ptr addrspace(5) %4 to ptr
  %12 = addrspacecast ptr addrspace(5) %5 to ptr
  %13 = addrspacecast ptr addrspace(5) %6 to ptr
  %14 = addrspacecast ptr addrspace(5) %7 to ptr
  %15 = addrspacecast ptr addrspace(5) %8 to ptr
  store i64 %0, ptr %10, align 8
    #dbg_declare(ptr addrspace(5) %3, !1658, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i64)), !1667)
    #dbg_declare(ptr addrspace(5) %4, !1659, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1668)
    #dbg_declare(ptr addrspace(5) %5, !1660, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1669)
    #dbg_declare(ptr addrspace(5) %6, !1661, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref([64 x i64])), !1670)
    #dbg_declare(ptr addrspace(5) %7, !1665, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i64)), !1671)
    #dbg_declare(ptr addrspace(5) %8, !1666, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i64)), !1672)
  br label %16, !dbg !1673

16:                                               ; preds = %19, %1
  %17 = load i64, ptr %10, align 8, !dbg !1674
  %18 = icmp slt i64 %17, 0, !dbg !1675
  br i1 %18, label %19, label %22, !dbg !1673

19:                                               ; preds = %16
  %20 = load i64, ptr %10, align 8, !dbg !1676
  %21 = add nsw i64 %20, 1317624576693539401, !dbg !1676
  store i64 %21, ptr %10, align 8, !dbg !1676
  br label %16, !dbg !1673, !llvm.loop !1677

22:                                               ; preds = %16
  br label %23, !dbg !1679

23:                                               ; preds = %26, %22
  %24 = load i64, ptr %10, align 8, !dbg !1680
  %25 = icmp sgt i64 %24, 1317624576693539401, !dbg !1681
  br i1 %25, label %26, label %29, !dbg !1679

26:                                               ; preds = %23
  %27 = load i64, ptr %10, align 8, !dbg !1682
  %28 = sub nsw i64 %27, 1317624576693539401, !dbg !1682
  store i64 %28, ptr %10, align 8, !dbg !1682
  br label %23, !dbg !1679, !llvm.loop !1683

29:                                               ; preds = %23
  %30 = load i64, ptr %10, align 8, !dbg !1685
  %31 = icmp eq i64 %30, 0, !dbg !1687
  br i1 %31, label %32, label %33, !dbg !1688

32:                                               ; preds = %29
  store i64 1, ptr %9, align 8, !dbg !1689
  br label %122, !dbg !1689

33:                                               ; preds = %29
  store i64 1, ptr %14, align 8, !dbg !1690
  store i32 0, ptr %11, align 4, !dbg !1691
  br label %34, !dbg !1693

34:                                               ; preds = %56, %33
  %35 = load i32, ptr %11, align 4, !dbg !1694
  %36 = icmp slt i32 %35, 64, !dbg !1696
  br i1 %36, label %37, label %59, !dbg !1697

37:                                               ; preds = %34
  %38 = load i64, ptr %14, align 8, !dbg !1698
  %39 = load i32, ptr %11, align 4, !dbg !1700
  %40 = sext i32 %39 to i64, !dbg !1701
  %41 = getelementptr inbounds [64 x i64], ptr %13, i64 0, i64 %40, !dbg !1701
  store i64 %38, ptr %41, align 8, !dbg !1702
  %42 = load i64, ptr %14, align 8, !dbg !1703
  %43 = shl i64 %42, 1, !dbg !1704
  %44 = load i64, ptr %14, align 8, !dbg !1705
  %45 = icmp slt i64 %44, 0, !dbg !1706
  %46 = zext i1 %45 to i64, !dbg !1707
  %47 = select i1 %45, i64 7, i64 0, !dbg !1707
  %48 = xor i64 %43, %47, !dbg !1708
  store i64 %48, ptr %14, align 8, !dbg !1709
  %49 = load i64, ptr %14, align 8, !dbg !1710
  %50 = shl i64 %49, 1, !dbg !1711
  %51 = load i64, ptr %14, align 8, !dbg !1712
  %52 = icmp slt i64 %51, 0, !dbg !1713
  %53 = zext i1 %52 to i64, !dbg !1714
  %54 = select i1 %52, i64 7, i64 0, !dbg !1714
  %55 = xor i64 %50, %54, !dbg !1715
  store i64 %55, ptr %14, align 8, !dbg !1716
  br label %56, !dbg !1717

56:                                               ; preds = %37
  %57 = load i32, ptr %11, align 4, !dbg !1718
  %58 = add nsw i32 %57, 1, !dbg !1718
  store i32 %58, ptr %11, align 4, !dbg !1718
  br label %34, !dbg !1719, !llvm.loop !1720

59:                                               ; preds = %34
  store i32 62, ptr %11, align 4, !dbg !1723
  br label %60, !dbg !1725

60:                                               ; preds = %72, %59
  %61 = load i32, ptr %11, align 4, !dbg !1726
  %62 = icmp sge i32 %61, 0, !dbg !1728
  br i1 %62, label %63, label %75, !dbg !1729

63:                                               ; preds = %60
  %64 = load i64, ptr %10, align 8, !dbg !1730
  %65 = load i32, ptr %11, align 4, !dbg !1732
  %66 = zext i32 %65 to i64, !dbg !1733
  %67 = ashr i64 %64, %66, !dbg !1733
  %68 = and i64 %67, 1, !dbg !1734
  %69 = icmp ne i64 %68, 0, !dbg !1735
  br i1 %69, label %70, label %71, !dbg !1736

70:                                               ; preds = %63
  br label %75, !dbg !1737

71:                                               ; preds = %63
  br label %72, !dbg !1738

72:                                               ; preds = %71
  %73 = load i32, ptr %11, align 4, !dbg !1739
  %74 = add nsw i32 %73, -1, !dbg !1739
  store i32 %74, ptr %11, align 4, !dbg !1739
  br label %60, !dbg !1740, !llvm.loop !1741

75:                                               ; preds = %70, %60
  store i64 2, ptr %15, align 8, !dbg !1743
  br label %76, !dbg !1744

76:                                               ; preds = %119, %75
  %77 = load i32, ptr %11, align 4, !dbg !1745
  %78 = icmp sgt i32 %77, 0, !dbg !1746
  br i1 %78, label %79, label %120, !dbg !1744

79:                                               ; preds = %76
  store i64 0, ptr %14, align 8, !dbg !1747
  store i32 0, ptr %12, align 4, !dbg !1749
  br label %80, !dbg !1751

80:                                               ; preds = %98, %79
  %81 = load i32, ptr %12, align 4, !dbg !1752
  %82 = icmp slt i32 %81, 64, !dbg !1754
  br i1 %82, label %83, label %101, !dbg !1755

83:                                               ; preds = %80
  %84 = load i64, ptr %15, align 8, !dbg !1756
  %85 = load i32, ptr %12, align 4, !dbg !1758
  %86 = zext i32 %85 to i64, !dbg !1759
  %87 = lshr i64 %84, %86, !dbg !1759
  %88 = and i64 %87, 1, !dbg !1760
  %89 = icmp ne i64 %88, 0, !dbg !1761
  br i1 %89, label %90, label %97, !dbg !1762

90:                                               ; preds = %83
  %91 = load i32, ptr %12, align 4, !dbg !1763
  %92 = sext i32 %91 to i64, !dbg !1764
  %93 = getelementptr inbounds [64 x i64], ptr %13, i64 0, i64 %92, !dbg !1764
  %94 = load i64, ptr %93, align 8, !dbg !1764
  %95 = load i64, ptr %14, align 8, !dbg !1765
  %96 = xor i64 %95, %94, !dbg !1765
  store i64 %96, ptr %14, align 8, !dbg !1765
  br label %97, !dbg !1766

97:                                               ; preds = %90, %83
  br label %98, !dbg !1767

98:                                               ; preds = %97
  %99 = load i32, ptr %12, align 4, !dbg !1768
  %100 = add nsw i32 %99, 1, !dbg !1768
  store i32 %100, ptr %12, align 4, !dbg !1768
  br label %80, !dbg !1769, !llvm.loop !1770

101:                                              ; preds = %80
  %102 = load i64, ptr %14, align 8, !dbg !1772
  store i64 %102, ptr %15, align 8, !dbg !1773
  %103 = load i32, ptr %11, align 4, !dbg !1774
  %104 = sub nsw i32 %103, 1, !dbg !1774
  store i32 %104, ptr %11, align 4, !dbg !1774
  %105 = load i64, ptr %10, align 8, !dbg !1775
  %106 = load i32, ptr %11, align 4, !dbg !1777
  %107 = zext i32 %106 to i64, !dbg !1778
  %108 = ashr i64 %105, %107, !dbg !1778
  %109 = and i64 %108, 1, !dbg !1779
  %110 = icmp ne i64 %109, 0, !dbg !1780
  br i1 %110, label %111, label %119, !dbg !1781

111:                                              ; preds = %101
  %112 = load i64, ptr %15, align 8, !dbg !1782
  %113 = shl i64 %112, 1, !dbg !1783
  %114 = load i64, ptr %15, align 8, !dbg !1784
  %115 = icmp slt i64 %114, 0, !dbg !1785
  %116 = zext i1 %115 to i64, !dbg !1786
  %117 = select i1 %115, i64 7, i64 0, !dbg !1786
  %118 = xor i64 %113, %117, !dbg !1787
  store i64 %118, ptr %15, align 8, !dbg !1788
  br label %119, !dbg !1789

119:                                              ; preds = %111, %101
  br label %76, !dbg !1744, !llvm.loop !1790

120:                                              ; preds = %76
  %121 = load i64, ptr %15, align 8, !dbg !1792
  store i64 %121, ptr %9, align 8, !dbg !1793
  br label %122, !dbg !1793

122:                                              ; preds = %120, %32
  %123 = load i64, ptr %9, align 8, !dbg !1794
  ret i64 %123, !dbg !1794
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define protected amdgpu_kernel void @_Z9initTablePyy(ptr addrspace(1) noundef %0, i64 noundef %1) #4 !dbg !1795 {
  %3 = alloca i32, align 4, addrspace(5)
  %4 = alloca i32, align 4, addrspace(5)
  %5 = alloca i32, align 4, addrspace(5)
  %6 = alloca i32, align 4, addrspace(5)
  %7 = alloca i32, align 4, addrspace(5)
  %8 = alloca i32, align 4, addrspace(5)
  %9 = alloca ptr, align 8, addrspace(5)
  %10 = alloca ptr, align 8, addrspace(5)
  %11 = alloca i64, align 8, addrspace(5)
  %12 = alloca i32, align 4, addrspace(5)
  %13 = addrspacecast ptr addrspace(5) %9 to ptr
  %14 = addrspacecast ptr addrspace(5) %10 to ptr
  %15 = addrspacecast ptr addrspace(5) %11 to ptr
  %16 = addrspacecast ptr addrspace(5) %12 to ptr
  %17 = addrspacecast ptr addrspace(1) %0 to ptr
  store ptr %17, ptr %13, align 8
  %18 = load ptr, ptr %13, align 8
  store ptr %18, ptr %14, align 8
    #dbg_declare(ptr addrspace(5) %10, !1801, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(ptr)), !1804)
  store i64 %1, ptr %15, align 8
    #dbg_declare(ptr addrspace(5) %11, !1802, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i64)), !1805)
    #dbg_declare(ptr addrspace(5) %12, !1803, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1806)
  %19 = addrspacecast ptr addrspace(5) %8 to ptr
  %20 = addrspacecast ptr addrspace(5) %5 to ptr
  %21 = call i64 @__ockl_get_group_id(i32 noundef 0) #13, !dbg !1807
  %22 = trunc i64 %21 to i32, !dbg !1807
  %23 = addrspacecast ptr addrspace(5) %7 to ptr
  %24 = addrspacecast ptr addrspace(5) %4 to ptr
  %25 = call i64 @__ockl_get_local_size(i32 noundef 0) #13, !dbg !1826
  %26 = trunc i64 %25 to i32, !dbg !1826
  %27 = mul i32 %22, %26, !dbg !1841
  %28 = addrspacecast ptr addrspace(5) %6 to ptr
  %29 = addrspacecast ptr addrspace(5) %3 to ptr
  %30 = call i64 @__ockl_get_local_id(i32 noundef 0) #13, !dbg !1842
  %31 = trunc i64 %30 to i32, !dbg !1842
  %32 = add i32 %27, %31, !dbg !1857
  store i32 %32, ptr %16, align 4, !dbg !1806
  %33 = load i32, ptr %16, align 4, !dbg !1858
  %34 = sext i32 %33 to i64, !dbg !1858
  %35 = load i64, ptr %15, align 8, !dbg !1860
  %36 = icmp ult i64 %34, %35, !dbg !1861
  br i1 %36, label %37, label %44, !dbg !1862

37:                                               ; preds = %2
  %38 = load i32, ptr %16, align 4, !dbg !1863
  %39 = sext i32 %38 to i64, !dbg !1863
  %40 = load ptr, ptr %14, align 8, !dbg !1864
  %41 = load i32, ptr %16, align 4, !dbg !1865
  %42 = sext i32 %41 to i64, !dbg !1864
  %43 = getelementptr inbounds i64, ptr %40, i64 %42, !dbg !1864
  store i64 %39, ptr %43, align 8, !dbg !1866
  br label %44, !dbg !1864

44:                                               ; preds = %37, %2
  ret void, !dbg !1867
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define protected amdgpu_kernel void @_Z6updatePyy(ptr addrspace(1) noalias noundef %0, i64 noundef %1) #4 !dbg !1868 {
  %3 = alloca i32, align 4, addrspace(5)
  %4 = alloca i32, align 4, addrspace(5)
  %5 = alloca ptr, align 8, addrspace(5)
  %6 = alloca ptr, align 8, addrspace(5)
  %7 = alloca i64, align 8, addrspace(5)
  %8 = alloca i32, align 4, addrspace(5)
  %9 = alloca i64, align 8, addrspace(5)
  %10 = alloca i64, align 8, addrspace(5)
  %11 = addrspacecast ptr addrspace(5) %5 to ptr
  %12 = addrspacecast ptr addrspace(5) %6 to ptr
  %13 = addrspacecast ptr addrspace(5) %7 to ptr
  %14 = addrspacecast ptr addrspace(5) %8 to ptr
  %15 = addrspacecast ptr addrspace(5) %9 to ptr
  %16 = addrspacecast ptr addrspace(5) %10 to ptr
  %17 = addrspacecast ptr addrspace(1) %0 to ptr
  store ptr %17, ptr %11, align 8
  %18 = load ptr, ptr %11, align 8
  store ptr %18, ptr %12, align 8
    #dbg_declare(ptr addrspace(5) %6, !1873, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(ptr)), !1879)
  store i64 %1, ptr %13, align 8
    #dbg_declare(ptr addrspace(5) %7, !1874, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i64)), !1880)
    #dbg_declare(ptr addrspace(5) %8, !1875, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i32)), !1881)
  %19 = addrspacecast ptr addrspace(5) %4 to ptr
  %20 = addrspacecast ptr addrspace(5) %3 to ptr
  %21 = call i64 @__ockl_get_local_id(i32 noundef 0) #13, !dbg !1882
  %22 = trunc i64 %21 to i32, !dbg !1882
  store i32 %22, ptr %14, align 4, !dbg !1881
    #dbg_declare(ptr addrspace(5) %9, !1876, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i64)), !1885)
  %23 = load i64, ptr %13, align 8, !dbg !1886
  %24 = mul i64 4, %23, !dbg !1886
  %25 = udiv i64 %24, 128, !dbg !1887
  %26 = load i32, ptr %14, align 4, !dbg !1888
  %27 = sext i32 %26 to i64, !dbg !1888
  %28 = mul i64 %25, %27, !dbg !1889
  %29 = call noundef i64 @_Z11HPCC_startsx(i64 noundef %28) #12, !dbg !1890
  store i64 %29, ptr %15, align 8, !dbg !1885
    #dbg_declare(ptr addrspace(5) %10, !1877, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i64)), !1891)
  store i64 0, ptr %16, align 8, !dbg !1891
  br label %30, !dbg !1892

30:                                               ; preds = %52, %2
  %31 = load i64, ptr %16, align 8, !dbg !1893
  %32 = load i64, ptr %13, align 8, !dbg !1895
  %33 = mul i64 4, %32, !dbg !1895
  %34 = udiv i64 %33, 128, !dbg !1896
  %35 = icmp ult i64 %31, %34, !dbg !1897
  br i1 %35, label %36, label %55, !dbg !1898

36:                                               ; preds = %30
  %37 = load i64, ptr %15, align 8, !dbg !1899
  %38 = shl i64 %37, 1, !dbg !1901
  %39 = load i64, ptr %15, align 8, !dbg !1902
  %40 = icmp slt i64 %39, 0, !dbg !1903
  %41 = zext i1 %40 to i64, !dbg !1904
  %42 = select i1 %40, i64 7, i64 0, !dbg !1904
  %43 = xor i64 %38, %42, !dbg !1905
  store i64 %43, ptr %15, align 8, !dbg !1906
  %44 = load ptr, ptr %12, align 8, !dbg !1907
  %45 = load i64, ptr %15, align 8, !dbg !1908
  %46 = load i64, ptr %13, align 8, !dbg !1909
  %47 = sub i64 %46, 1, !dbg !1910
  %48 = and i64 %45, %47, !dbg !1911
  %49 = getelementptr inbounds i64, ptr %44, i64 %48, !dbg !1907
  %50 = load i64, ptr %15, align 8, !dbg !1912
  %51 = call noundef i64 @_Z9atomicXorPyy(ptr noundef %49, i64 noundef %50) #12, !dbg !1913
  br label %52, !dbg !1914

52:                                               ; preds = %36
  %53 = load i64, ptr %16, align 8, !dbg !1915
  %54 = add i64 %53, 1, !dbg !1915
  store i64 %54, ptr %16, align 8, !dbg !1915
  br label %30, !dbg !1916, !llvm.loop !1917

55:                                               ; preds = %30
  ret void, !dbg !1919
}

; Function Attrs: convergent mustprogress noinline nounwind optnone
define linkonce_odr hidden noundef i64 @_Z9atomicXorPyy(ptr noundef %0, i64 noundef %1) #2 comdat !dbg !1920 {
  %3 = alloca i64, align 8, addrspace(5)
  %4 = alloca ptr, align 8, addrspace(5)
  %5 = alloca i64, align 8, addrspace(5)
  %6 = alloca i64, align 8, addrspace(5)
  %7 = alloca i64, align 8, addrspace(5)
  %8 = addrspacecast ptr addrspace(5) %3 to ptr
  %9 = addrspacecast ptr addrspace(5) %4 to ptr
  %10 = addrspacecast ptr addrspace(5) %5 to ptr
  %11 = addrspacecast ptr addrspace(5) %6 to ptr
  %12 = addrspacecast ptr addrspace(5) %7 to ptr
  store ptr %0, ptr %9, align 8
    #dbg_declare(ptr addrspace(5) %4, !1926, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(ptr)), !1928)
  store i64 %1, ptr %10, align 8
    #dbg_declare(ptr addrspace(5) %5, !1927, !DIExpression(DIOpArg(0, ptr addrspace(5)), DIOpDeref(i64)), !1929)
  %13 = load ptr, ptr %9, align 8, !dbg !1930
  %14 = load i64, ptr %10, align 8, !dbg !1931
  store i64 %14, ptr %11, align 8, !dbg !1932
  %15 = load i64, ptr %11, align 8, !dbg !1932
  %16 = atomicrmw xor ptr %13, i64 %15 syncscope("agent-one-as") monotonic, align 8, !dbg !1932
  store i64 %16, ptr %12, align 8, !dbg !1932
  %17 = load i64, ptr %12, align 8, !dbg !1932
  ret i64 %17, !dbg !1933
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
  %10 = load i32, ptr addrspace(4) @__oclc_ABI_version, align 4, !tbaa !1934
  %11 = icmp slt i32 %10, 500
  %12 = tail call ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %13 = select i1 %11, i64 24, i64 80
  %14 = getelementptr inbounds i8, ptr addrspace(4) %12, i64 %13
  %15 = load i64, ptr addrspace(4) %14, align 8, !tbaa !1938
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
  %20 = load ptr addrspace(1), ptr addrspace(1) %14, align 8, !tbaa !1940
  %21 = load i64, ptr addrspace(1) %19, align 8, !tbaa !1944
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
  %30 = load ptr addrspace(1), ptr addrspace(1) %14, align 8, !tbaa !1940
  %31 = load i64, ptr addrspace(1) %19, align 8, !tbaa !1944
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
  %49 = load ptr addrspace(1), ptr addrspace(1) %14, align 8, !tbaa !1940
  %50 = getelementptr i8, ptr addrspace(1) %14, i64 40
  %51 = load i64, ptr addrspace(1) %50, align 8, !tbaa !1944
  %52 = and i64 %48, %51
  %53 = getelementptr inbounds %0, ptr addrspace(1) %49, i64 %52
  %54 = getelementptr i8, ptr addrspace(1) %14, i64 8
  %55 = load ptr addrspace(1), ptr addrspace(1) %54, align 8, !tbaa !1945
  %56 = getelementptr inbounds %1, ptr addrspace(1) %55, i64 %52
  %57 = tail call i64 @llvm.amdgcn.ballot.i64(i1 true)
  br i1 %15, label %58, label %62

58:                                               ; preds = %38
  %59 = getelementptr inbounds i8, ptr addrspace(1) %53, i64 16
  %60 = getelementptr inbounds i8, ptr addrspace(1) %53, i64 8
  %61 = getelementptr inbounds i8, ptr addrspace(1) %53, i64 20
  store i32 %1, ptr addrspace(1) %59, align 8, !tbaa !1946
  store i64 %57, ptr addrspace(1) %60, align 8, !tbaa !1948
  store i32 1, ptr addrspace(1) %61, align 4, !tbaa !1949
  br label %62

62:                                               ; preds = %58, %38
  %63 = zext i32 %12 to i64
  %64 = getelementptr inbounds [64 x [8 x i64]], ptr addrspace(1) %56, i64 0, i64 %63
  store i64 %2, ptr addrspace(1) %64, align 8, !tbaa !1938
  %65 = getelementptr inbounds i8, ptr addrspace(1) %64, i64 8
  store i64 %3, ptr addrspace(1) %65, align 8, !tbaa !1938
  %66 = getelementptr inbounds i8, ptr addrspace(1) %64, i64 16
  store i64 %4, ptr addrspace(1) %66, align 8, !tbaa !1938
  %67 = getelementptr inbounds i8, ptr addrspace(1) %64, i64 24
  store i64 %5, ptr addrspace(1) %67, align 8, !tbaa !1938
  %68 = getelementptr inbounds i8, ptr addrspace(1) %64, i64 32
  store i64 %6, ptr addrspace(1) %68, align 8, !tbaa !1938
  %69 = getelementptr inbounds i8, ptr addrspace(1) %64, i64 40
  store i64 %7, ptr addrspace(1) %69, align 8, !tbaa !1938
  %70 = getelementptr inbounds i8, ptr addrspace(1) %64, i64 48
  store i64 %8, ptr addrspace(1) %70, align 8, !tbaa !1938
  %71 = getelementptr inbounds i8, ptr addrspace(1) %64, i64 56
  store i64 %9, ptr addrspace(1) %71, align 8, !tbaa !1938
  br i1 %15, label %72, label %88

72:                                               ; preds = %62
  %73 = getelementptr inbounds i8, ptr addrspace(1) %14, i64 32
  %74 = load atomic i64, ptr addrspace(1) %73 syncscope("one-as") monotonic, align 8
  %75 = load i64, ptr addrspace(1) %50, align 8, !tbaa !1944
  %76 = and i64 %75, %48
  %77 = getelementptr inbounds %0, ptr addrspace(1) %49, i64 %76
  store i64 %74, ptr addrspace(1) %77, align 8, !tbaa !1950
  %78 = cmpxchg ptr addrspace(1) %73, i64 %74, i64 %48 syncscope("one-as") release monotonic, align 8
  %79 = extractvalue { i64, i1 } %78, 1
  br i1 %79, label %85, label %80

80:                                               ; preds = %80, %72
  %81 = phi { i64, i1 } [ %83, %80 ], [ %78, %72 ]
  %82 = extractvalue { i64, i1 } %81, 0
  tail call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %82, ptr addrspace(1) %77, align 8, !tbaa !1950
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
  %100 = load i64, ptr addrspace(1) %64, align 8, !tbaa !1938
  %101 = load i64, ptr addrspace(1) %65, align 8, !tbaa !1938
  br i1 %15, label %102, label %120

102:                                              ; preds = %99
  %103 = load i64, ptr addrspace(1) %50, align 8, !tbaa !1944
  %104 = add i64 %103, 1
  %105 = add i64 %104, %48
  %106 = icmp eq i64 %105, 0
  %107 = select i1 %106, i64 %104, i64 %105
  %108 = getelementptr inbounds i8, ptr addrspace(1) %14, i64 24
  %109 = load atomic i64, ptr addrspace(1) %108 syncscope("one-as") monotonic, align 8
  %110 = load ptr addrspace(1), ptr addrspace(1) %14, align 8, !tbaa !1940
  %111 = and i64 %107, %103
  %112 = getelementptr inbounds %0, ptr addrspace(1) %110, i64 %111
  store i64 %109, ptr addrspace(1) %112, align 8, !tbaa !1950
  %113 = cmpxchg ptr addrspace(1) %108, i64 %109, i64 %107 syncscope("one-as") release monotonic, align 8
  %114 = extractvalue { i64, i1 } %113, 1
  br i1 %114, label %120, label %115

115:                                              ; preds = %115, %102
  %116 = phi { i64, i1 } [ %118, %115 ], [ %113, %102 ]
  %117 = extractvalue { i64, i1 } %116, 0
  tail call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %117, ptr addrspace(1) %112, align 8, !tbaa !1950
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
  %18 = load i64, ptr addrspace(1) %17, align 16, !tbaa !1951
  %19 = icmp eq i64 %18, 0
  br i1 %19, label %34, label %20

20:                                               ; preds = %16
  %21 = inttoptr i64 %18 to ptr addrspace(1)
  %22 = getelementptr inbounds i8, ptr addrspace(1) %4, i64 24
  %23 = load i32, ptr addrspace(1) %22, align 8, !tbaa !1953
  %24 = zext i32 %23 to i64
  store atomic i64 %24, ptr addrspace(1) %21 syncscope("one-as") release, align 8
  %25 = load i32, ptr addrspace(4) @__oclc_ISA_version, align 4, !tbaa !1934
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
  %fi_flip = xor i64 %15, 16
  %16 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %fi_flip, i64 0
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
  %33 = load i8, ptr %19, align 1, !tbaa !1954
  %34 = zext i8 %33 to i64
  %35 = getelementptr inbounds i8, ptr %19, i64 1
  %36 = load i8, ptr %35, align 1, !tbaa !1954
  %37 = zext i8 %36 to i64
  %38 = shl nuw nsw i64 %37, 8
  %39 = or disjoint i64 %38, %34
  %40 = getelementptr inbounds i8, ptr %19, i64 2
  %41 = load i8, ptr %40, align 1, !tbaa !1954
  %42 = zext i8 %41 to i64
  %43 = shl nuw nsw i64 %42, 16
  %44 = or disjoint i64 %39, %43
  %45 = getelementptr inbounds i8, ptr %19, i64 3
  %46 = load i8, ptr %45, align 1, !tbaa !1954
  %47 = zext i8 %46 to i64
  %48 = shl nuw nsw i64 %47, 24
  %49 = or disjoint i64 %44, %48
  %50 = getelementptr inbounds i8, ptr %19, i64 4
  %51 = load i8, ptr %50, align 1, !tbaa !1954
  %52 = zext i8 %51 to i64
  %53 = shl nuw nsw i64 %52, 32
  %54 = or disjoint i64 %49, %53
  %55 = getelementptr inbounds i8, ptr %19, i64 5
  %56 = load i8, ptr %55, align 1, !tbaa !1954
  %57 = zext i8 %56 to i64
  %58 = shl nuw nsw i64 %57, 40
  %59 = or i64 %54, %58
  %60 = getelementptr inbounds i8, ptr %19, i64 6
  %61 = load i8, ptr %60, align 1, !tbaa !1954
  %62 = zext i8 %61 to i64
  %63 = shl nuw nsw i64 %62, 48
  %64 = or i64 %59, %63
  %65 = getelementptr inbounds i8, ptr %19, i64 7
  %66 = load i8, ptr %65, align 1, !tbaa !1954
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
  %77 = load i8, ptr %76, align 1, !tbaa !1954
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
  %93 = load i8, ptr %86, align 1, !tbaa !1954
  %94 = zext i8 %93 to i64
  %95 = getelementptr inbounds i8, ptr %86, i64 1
  %96 = load i8, ptr %95, align 1, !tbaa !1954
  %97 = zext i8 %96 to i64
  %98 = shl nuw nsw i64 %97, 8
  %99 = or disjoint i64 %98, %94
  %100 = getelementptr inbounds i8, ptr %86, i64 2
  %101 = load i8, ptr %100, align 1, !tbaa !1954
  %102 = zext i8 %101 to i64
  %103 = shl nuw nsw i64 %102, 16
  %104 = or disjoint i64 %99, %103
  %105 = getelementptr inbounds i8, ptr %86, i64 3
  %106 = load i8, ptr %105, align 1, !tbaa !1954
  %107 = zext i8 %106 to i64
  %108 = shl nuw nsw i64 %107, 24
  %109 = or disjoint i64 %104, %108
  %110 = getelementptr inbounds i8, ptr %86, i64 4
  %111 = load i8, ptr %110, align 1, !tbaa !1954
  %112 = zext i8 %111 to i64
  %113 = shl nuw nsw i64 %112, 32
  %114 = or disjoint i64 %109, %113
  %115 = getelementptr inbounds i8, ptr %86, i64 5
  %116 = load i8, ptr %115, align 1, !tbaa !1954
  %117 = zext i8 %116 to i64
  %118 = shl nuw nsw i64 %117, 40
  %119 = or i64 %114, %118
  %120 = getelementptr inbounds i8, ptr %86, i64 6
  %121 = load i8, ptr %120, align 1, !tbaa !1954
  %122 = zext i8 %121 to i64
  %123 = shl nuw nsw i64 %122, 48
  %124 = or i64 %119, %123
  %125 = getelementptr inbounds i8, ptr %86, i64 7
  %126 = load i8, ptr %125, align 1, !tbaa !1954
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
  %137 = load i8, ptr %136, align 1, !tbaa !1954
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
  %153 = load i8, ptr %146, align 1, !tbaa !1954
  %154 = zext i8 %153 to i64
  %155 = getelementptr inbounds i8, ptr %146, i64 1
  %156 = load i8, ptr %155, align 1, !tbaa !1954
  %157 = zext i8 %156 to i64
  %158 = shl nuw nsw i64 %157, 8
  %159 = or disjoint i64 %158, %154
  %160 = getelementptr inbounds i8, ptr %146, i64 2
  %161 = load i8, ptr %160, align 1, !tbaa !1954
  %162 = zext i8 %161 to i64
  %163 = shl nuw nsw i64 %162, 16
  %164 = or disjoint i64 %159, %163
  %165 = getelementptr inbounds i8, ptr %146, i64 3
  %166 = load i8, ptr %165, align 1, !tbaa !1954
  %167 = zext i8 %166 to i64
  %168 = shl nuw nsw i64 %167, 24
  %169 = or disjoint i64 %164, %168
  %170 = getelementptr inbounds i8, ptr %146, i64 4
  %171 = load i8, ptr %170, align 1, !tbaa !1954
  %172 = zext i8 %171 to i64
  %173 = shl nuw nsw i64 %172, 32
  %174 = or disjoint i64 %169, %173
  %175 = getelementptr inbounds i8, ptr %146, i64 5
  %176 = load i8, ptr %175, align 1, !tbaa !1954
  %177 = zext i8 %176 to i64
  %178 = shl nuw nsw i64 %177, 40
  %179 = or i64 %174, %178
  %180 = getelementptr inbounds i8, ptr %146, i64 6
  %181 = load i8, ptr %180, align 1, !tbaa !1954
  %182 = zext i8 %181 to i64
  %183 = shl nuw nsw i64 %182, 48
  %184 = or i64 %179, %183
  %185 = getelementptr inbounds i8, ptr %146, i64 7
  %186 = load i8, ptr %185, align 1, !tbaa !1954
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
  %197 = load i8, ptr %196, align 1, !tbaa !1954
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
  %213 = load i8, ptr %206, align 1, !tbaa !1954
  %214 = zext i8 %213 to i64
  %215 = getelementptr inbounds i8, ptr %206, i64 1
  %216 = load i8, ptr %215, align 1, !tbaa !1954
  %217 = zext i8 %216 to i64
  %218 = shl nuw nsw i64 %217, 8
  %219 = or disjoint i64 %218, %214
  %220 = getelementptr inbounds i8, ptr %206, i64 2
  %221 = load i8, ptr %220, align 1, !tbaa !1954
  %222 = zext i8 %221 to i64
  %223 = shl nuw nsw i64 %222, 16
  %224 = or disjoint i64 %219, %223
  %225 = getelementptr inbounds i8, ptr %206, i64 3
  %226 = load i8, ptr %225, align 1, !tbaa !1954
  %227 = zext i8 %226 to i64
  %228 = shl nuw nsw i64 %227, 24
  %229 = or disjoint i64 %224, %228
  %230 = getelementptr inbounds i8, ptr %206, i64 4
  %231 = load i8, ptr %230, align 1, !tbaa !1954
  %232 = zext i8 %231 to i64
  %233 = shl nuw nsw i64 %232, 32
  %234 = or disjoint i64 %229, %233
  %235 = getelementptr inbounds i8, ptr %206, i64 5
  %236 = load i8, ptr %235, align 1, !tbaa !1954
  %237 = zext i8 %236 to i64
  %238 = shl nuw nsw i64 %237, 40
  %239 = or i64 %234, %238
  %240 = getelementptr inbounds i8, ptr %206, i64 6
  %241 = load i8, ptr %240, align 1, !tbaa !1954
  %242 = zext i8 %241 to i64
  %243 = shl nuw nsw i64 %242, 48
  %244 = or i64 %239, %243
  %245 = getelementptr inbounds i8, ptr %206, i64 7
  %246 = load i8, ptr %245, align 1, !tbaa !1954
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
  %257 = load i8, ptr %256, align 1, !tbaa !1954
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
  %273 = load i8, ptr %266, align 1, !tbaa !1954
  %274 = zext i8 %273 to i64
  %275 = getelementptr inbounds i8, ptr %266, i64 1
  %276 = load i8, ptr %275, align 1, !tbaa !1954
  %277 = zext i8 %276 to i64
  %278 = shl nuw nsw i64 %277, 8
  %279 = or disjoint i64 %278, %274
  %280 = getelementptr inbounds i8, ptr %266, i64 2
  %281 = load i8, ptr %280, align 1, !tbaa !1954
  %282 = zext i8 %281 to i64
  %283 = shl nuw nsw i64 %282, 16
  %284 = or disjoint i64 %279, %283
  %285 = getelementptr inbounds i8, ptr %266, i64 3
  %286 = load i8, ptr %285, align 1, !tbaa !1954
  %287 = zext i8 %286 to i64
  %288 = shl nuw nsw i64 %287, 24
  %289 = or disjoint i64 %284, %288
  %290 = getelementptr inbounds i8, ptr %266, i64 4
  %291 = load i8, ptr %290, align 1, !tbaa !1954
  %292 = zext i8 %291 to i64
  %293 = shl nuw nsw i64 %292, 32
  %294 = or disjoint i64 %289, %293
  %295 = getelementptr inbounds i8, ptr %266, i64 5
  %296 = load i8, ptr %295, align 1, !tbaa !1954
  %297 = zext i8 %296 to i64
  %298 = shl nuw nsw i64 %297, 40
  %299 = or i64 %294, %298
  %300 = getelementptr inbounds i8, ptr %266, i64 6
  %301 = load i8, ptr %300, align 1, !tbaa !1954
  %302 = zext i8 %301 to i64
  %303 = shl nuw nsw i64 %302, 48
  %304 = or i64 %299, %303
  %305 = getelementptr inbounds i8, ptr %266, i64 7
  %306 = load i8, ptr %305, align 1, !tbaa !1954
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
  %317 = load i8, ptr %316, align 1, !tbaa !1954
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
  %333 = load i8, ptr %326, align 1, !tbaa !1954
  %334 = zext i8 %333 to i64
  %335 = getelementptr inbounds i8, ptr %326, i64 1
  %336 = load i8, ptr %335, align 1, !tbaa !1954
  %337 = zext i8 %336 to i64
  %338 = shl nuw nsw i64 %337, 8
  %339 = or disjoint i64 %338, %334
  %340 = getelementptr inbounds i8, ptr %326, i64 2
  %341 = load i8, ptr %340, align 1, !tbaa !1954
  %342 = zext i8 %341 to i64
  %343 = shl nuw nsw i64 %342, 16
  %344 = or disjoint i64 %339, %343
  %345 = getelementptr inbounds i8, ptr %326, i64 3
  %346 = load i8, ptr %345, align 1, !tbaa !1954
  %347 = zext i8 %346 to i64
  %348 = shl nuw nsw i64 %347, 24
  %349 = or disjoint i64 %344, %348
  %350 = getelementptr inbounds i8, ptr %326, i64 4
  %351 = load i8, ptr %350, align 1, !tbaa !1954
  %352 = zext i8 %351 to i64
  %353 = shl nuw nsw i64 %352, 32
  %354 = or disjoint i64 %349, %353
  %355 = getelementptr inbounds i8, ptr %326, i64 5
  %356 = load i8, ptr %355, align 1, !tbaa !1954
  %357 = zext i8 %356 to i64
  %358 = shl nuw nsw i64 %357, 40
  %359 = or i64 %354, %358
  %360 = getelementptr inbounds i8, ptr %326, i64 6
  %361 = load i8, ptr %360, align 1, !tbaa !1954
  %362 = zext i8 %361 to i64
  %363 = shl nuw nsw i64 %362, 48
  %364 = or i64 %359, %363
  %365 = getelementptr inbounds i8, ptr %326, i64 7
  %366 = load i8, ptr %365, align 1, !tbaa !1954
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
  %377 = load i8, ptr %376, align 1, !tbaa !1954
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
  %393 = load i8, ptr %386, align 1, !tbaa !1954
  %394 = zext i8 %393 to i64
  %395 = getelementptr inbounds i8, ptr %386, i64 1
  %396 = load i8, ptr %395, align 1, !tbaa !1954
  %397 = zext i8 %396 to i64
  %398 = shl nuw nsw i64 %397, 8
  %399 = or disjoint i64 %398, %394
  %400 = getelementptr inbounds i8, ptr %386, i64 2
  %401 = load i8, ptr %400, align 1, !tbaa !1954
  %402 = zext i8 %401 to i64
  %403 = shl nuw nsw i64 %402, 16
  %404 = or disjoint i64 %399, %403
  %405 = getelementptr inbounds i8, ptr %386, i64 3
  %406 = load i8, ptr %405, align 1, !tbaa !1954
  %407 = zext i8 %406 to i64
  %408 = shl nuw nsw i64 %407, 24
  %409 = or disjoint i64 %404, %408
  %410 = getelementptr inbounds i8, ptr %386, i64 4
  %411 = load i8, ptr %410, align 1, !tbaa !1954
  %412 = zext i8 %411 to i64
  %413 = shl nuw nsw i64 %412, 32
  %414 = or disjoint i64 %409, %413
  %415 = getelementptr inbounds i8, ptr %386, i64 5
  %416 = load i8, ptr %415, align 1, !tbaa !1954
  %417 = zext i8 %416 to i64
  %418 = shl nuw nsw i64 %417, 40
  %419 = or i64 %414, %418
  %420 = getelementptr inbounds i8, ptr %386, i64 6
  %421 = load i8, ptr %420, align 1, !tbaa !1954
  %422 = zext i8 %421 to i64
  %423 = shl nuw nsw i64 %422, 48
  %424 = or i64 %419, %423
  %425 = getelementptr inbounds i8, ptr %386, i64 7
  %426 = load i8, ptr %425, align 1, !tbaa !1954
  %427 = zext i8 %426 to i64
  %428 = shl nuw i64 %427, 56
  %429 = or i64 %424, %428
  br label %443

430:                                              ; preds = %430, %390
  %431 = phi i32 [ %441, %430 ], [ 0, %390 ]
  %432 = phi i64 [ %440, %430 ], [ 0, %390 ]
  %433 = zext nneg i32 %431 to i64
  %434 = getelementptr inbounds i8, ptr %386, i64 %433
  %435 = load i8, ptr %434, align 1, !tbaa !1954
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
  %9 = load i16, ptr addrspace(4) %8, align 4, !range !1955, !invariant.load !1956, !noundef !1956
  %10 = zext nneg i16 %9 to i32
  %11 = getelementptr inbounds i8, ptr addrspace(4) %6, i64 12
  %12 = load i32, ptr addrspace(4) %11, align 4, !tbaa !1957
  %13 = mul i32 %7, %10
  %14 = sub i32 %12, %13
  %15 = tail call i32 @llvm.umin.i32(i32 %14, i32 %10)
  %16 = zext nneg i32 %15 to i64
  br label %76

17:                                               ; preds = %2
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %19 = tail call ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %20 = load i32, ptr addrspace(4) %19, align 4, !tbaa !1934
  %21 = icmp ult i32 %18, %20
  %22 = select i1 %21, i64 12, i64 18
  %23 = getelementptr inbounds i8, ptr addrspace(4) %19, i64 %22
  %24 = load i16, ptr addrspace(4) %23, align 2, !tbaa !1960
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
  %33 = load i16, ptr addrspace(4) %32, align 2, !range !1955, !invariant.load !1956, !noundef !1956
  %34 = zext nneg i16 %33 to i32
  %35 = getelementptr inbounds i8, ptr addrspace(4) %30, i64 16
  %36 = load i32, ptr addrspace(4) %35, align 8, !tbaa !1961
  %37 = mul i32 %31, %34
  %38 = sub i32 %36, %37
  %39 = tail call i32 @llvm.umin.i32(i32 %38, i32 %34)
  %40 = zext nneg i32 %39 to i64
  br label %76

41:                                               ; preds = %26
  %42 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %43 = tail call ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %44 = getelementptr inbounds i8, ptr addrspace(4) %43, i64 4
  %45 = load i32, ptr addrspace(4) %44, align 4, !tbaa !1934
  %46 = icmp ult i32 %42, %45
  %47 = select i1 %46, i64 14, i64 20
  %48 = getelementptr inbounds i8, ptr addrspace(4) %43, i64 %47
  %49 = load i16, ptr addrspace(4) %48, align 2, !tbaa !1960
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
  %58 = load i16, ptr addrspace(4) %57, align 4, !range !1955, !invariant.load !1956, !noundef !1956
  %59 = zext nneg i16 %58 to i32
  %60 = getelementptr inbounds i8, ptr addrspace(4) %55, i64 20
  %61 = load i32, ptr addrspace(4) %60, align 4, !tbaa !1962
  %62 = mul i32 %56, %59
  %63 = sub i32 %61, %62
  %64 = tail call i32 @llvm.umin.i32(i32 %63, i32 %59)
  %65 = zext nneg i32 %64 to i64
  br label %76

66:                                               ; preds = %51
  %67 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %68 = tail call ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %69 = getelementptr inbounds i8, ptr addrspace(4) %68, i64 8
  %70 = load i32, ptr addrspace(4) %69, align 4, !tbaa !1934
  %71 = icmp ult i32 %67, %70
  %72 = select i1 %71, i64 16, i64 22
  %73 = getelementptr inbounds i8, ptr addrspace(4) %68, i64 %72
  %74 = load i16, ptr addrspace(4) %73, align 2, !tbaa !1960
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
!llvm.module.flags = !{!1565, !1566, !1567, !1568, !1569, !1570, !1571}
!llvm.ident = !{!1572, !1572, !1572, !1572, !1572, !1572, !1572, !1572, !1572, !1572, !1572}
!opencl.ocl.version = !{!1573, !1573, !1573, !1573, !1573, !1573, !1573, !1573, !1573, !1573}

!0 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !1, producer: "AMD clang version 19.0.0git (https://github.com/RadeonOpenCompute/llvm-project roc-6.4.2 25224 d366fa84f3fdcbd4b10847ebd5db572ae12a34fb)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, imports: !21, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/autofs/nccs-svm1_home2/mdunlavy/GPU_FI/HeCBench/src/randomAccess-hip/main.cu", directory: "/autofs/nccs-svm1_home2/mdunlavy/GPU_FI", checksumkind: CSK_MD5, checksum: "95a00401bcd7ad618567535f328f891f")
!2 = !{!3, !6}
!3 = !DIDerivedType(tag: DW_TAG_typedef, name: "s64Int", file: !4, line: 7, baseType: !5)
!4 = !DIFile(filename: "HeCBench/src/randomAccess-hip/main.cu", directory: "/autofs/nccs-svm1_home2/mdunlavy/GPU_FI", checksumkind: CSK_MD5, checksum: "95a00401bcd7ad618567535f328f891f")
!5 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!6 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dim3", file: !7, line: 1179, size: 96, flags: DIFlagTypePassByValue | DIFlagNonTrivial, elements: !8, identifier: "_ZTS4dim3")
!7 = !DIFile(filename: "/opt/rocm-6.4.2/include/hip/hip_runtime_api.h", directory: "", checksumkind: CSK_MD5, checksum: "2a1ac901d8db5ef891d901275c66dbab")
!8 = !{!9, !15, !16, !17}
!9 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !6, file: !7, line: 1180, baseType: !10, size: 32)
!10 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !11, line: 26, baseType: !12)
!11 = !DIFile(filename: "/usr/include/bits/stdint-uintn.h", directory: "", checksumkind: CSK_MD5, checksum: "4ecee94d7257cd86659727d06a979b60")
!12 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !13, line: 42, baseType: !14)
!13 = !DIFile(filename: "/usr/include/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "4a64d909bcfa62a0a7682c3ac78c6965")
!14 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!15 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !6, file: !7, line: 1181, baseType: !10, size: 32, offset: 32)
!16 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !6, file: !7, line: 1182, baseType: !10, size: 32, offset: 64)
!17 = !DISubprogram(name: "dim3", scope: !6, file: !7, line: 1184, type: !18, scopeLine: 1184, flags: DIFlagPrototyped, spFlags: 0)
!18 = !DISubroutineType(types: !19)
!19 = !{null, !20, !10, !10, !10}
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!21 = !{!22, !30, !37, !39, !41, !45, !47, !49, !51, !53, !55, !57, !59, !64, !68, !70, !72, !77, !79, !81, !83, !85, !87, !89, !92, !95, !97, !101, !106, !108, !110, !112, !114, !116, !118, !120, !122, !124, !126, !130, !134, !136, !138, !140, !142, !144, !146, !148, !150, !152, !154, !156, !158, !160, !162, !164, !168, !172, !176, !178, !180, !182, !184, !186, !188, !190, !192, !194, !198, !202, !206, !208, !210, !212, !216, !220, !224, !226, !228, !230, !232, !234, !236, !238, !240, !242, !244, !246, !248, !253, !257, !261, !263, !265, !267, !274, !278, !282, !284, !286, !288, !290, !292, !294, !298, !302, !304, !306, !308, !310, !314, !318, !322, !324, !326, !328, !330, !332, !334, !338, !342, !346, !348, !352, !356, !358, !360, !362, !364, !366, !368, !372, !376, !382, !386, !394, !399, !401, !403, !407, !411, !421, !423, !427, !431, !435, !440, !444, !448, !452, !456, !464, !468, !472, !474, !478, !482, !486, !492, !496, !500, !502, !510, !514, !521, !523, !527, !531, !535, !539, !544, !548, !552, !553, !554, !555, !557, !558, !559, !560, !561, !562, !563, !565, !566, !567, !568, !569, !570, !571, !572, !577, !578, !579, !580, !581, !582, !583, !584, !585, !586, !587, !588, !589, !590, !591, !592, !593, !594, !595, !596, !597, !598, !599, !600, !601, !604, !606, !608, !610, !612, !614, !616, !618, !620, !622, !624, !626, !628, !630, !632, !634, !636, !638, !640, !642, !644, !646, !648, !650, !652, !654, !658, !660, !662, !667, !671, !673, !675, !677, !679, !681, !683, !685, !687, !689, !691, !693, !695, !697, !699, !701, !703, !705, !707, !709, !711, !713, !718, !720, !722, !724, !726, !728, !730, !732, !734, !736, !738, !740, !742, !744, !746, !748, !750, !752, !754, !756, !760, !762, !764, !766, !768, !770, !772, !774, !776, !778, !780, !782, !784, !786, !788, !790, !792, !794, !796, !798, !800, !802, !804, !806, !808, !810, !812, !814, !816, !818, !820, !822, !824, !826, !828, !830, !832, !834, !836, !838, !840, !842, !844, !846, !848, !850, !852, !854, !856, !858, !860, !862, !864, !866, !868, !872, !876, !881, !898, !901, !906, !914, !919, !923, !927, !931, !935, !937, !939, !943, !949, !953, !959, !965, !967, !971, !975, !979, !983, !990, !992, !996, !1000, !1004, !1006, !1010, !1014, !1018, !1020, !1022, !1026, !1034, !1038, !1042, !1046, !1048, !1054, !1056, !1062, !1066, !1070, !1074, !1078, !1082, !1086, !1088, !1090, !1094, !1098, !1102, !1104, !1108, !1112, !1114, !1116, !1120, !1124, !1128, !1132, !1133, !1134, !1135, !1136, !1137, !1138, !1139, !1140, !1141, !1142, !1146, !1150, !1155, !1159, !1161, !1163, !1165, !1167, !1169, !1171, !1173, !1175, !1177, !1179, !1181, !1183, !1185, !1189, !1195, !1200, !1204, !1206, !1208, !1210, !1212, !1219, !1223, !1227, !1231, !1235, !1239, !1244, !1248, !1250, !1254, !1260, !1264, !1269, !1271, !1273, !1277, !1281, !1283, !1285, !1287, !1289, !1293, !1295, !1297, !1301, !1305, !1309, !1313, !1317, !1321, !1323, !1327, !1331, !1335, !1339, !1341, !1343, !1347, !1351, !1352, !1353, !1354, !1355, !1356, !1364, !1371, !1374, !1375, !1377, !1379, !1381, !1383, !1387, !1389, !1391, !1393, !1395, !1397, !1399, !1401, !1403, !1407, !1411, !1413, !1417, !1421, !1427, !1431, !1433, !1436, !1439, !1441, !1443, !1445, !1448, !1451, !1454, !1457, !1460, !1462, !1466, !1470, !1471, !1474, !1476, !1478, !1480, !1482, !1485, !1488, !1491, !1494, !1497, !1499, !1504, !1508, !1509, !1514, !1518, !1523, !1528, !1532, !1538, !1542, !1544, !1548, !1555, !1560}
!22 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !24, file: !29, line: 52)
!23 = !DINamespace(name: "std", scope: null)
!24 = !DISubprogram(name: "abs", scope: !25, file: !25, line: 980, type: !26, flags: DIFlagPrototyped, spFlags: 0)
!25 = !DIFile(filename: "/usr/include/stdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "761a239547e58b18c7327eb395f5cc1f")
!26 = !DISubroutineType(types: !27)
!27 = !{!28, !28}
!28 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!29 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/bits/std_abs.h", directory: "")
!30 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !31, file: !36, line: 85)
!31 = !DISubprogram(name: "acos", scope: !32, file: !32, line: 53, type: !33, flags: DIFlagPrototyped, spFlags: 0)
!32 = !DIFile(filename: "/usr/include/bits/mathcalls.h", directory: "", checksumkind: CSK_MD5, checksum: "a03d6e5877646e3ad0a8a5735f9e6f62")
!33 = !DISubroutineType(types: !34)
!34 = !{!35, !35}
!35 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!36 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/cmath", directory: "")
!37 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !38, file: !36, line: 104)
!38 = !DISubprogram(name: "asin", scope: !32, file: !32, line: 55, type: !33, flags: DIFlagPrototyped, spFlags: 0)
!39 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !40, file: !36, line: 123)
!40 = !DISubprogram(name: "atan", scope: !32, file: !32, line: 57, type: !33, flags: DIFlagPrototyped, spFlags: 0)
!41 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !42, file: !36, line: 142)
!42 = !DISubprogram(name: "atan2", scope: !32, file: !32, line: 59, type: !43, flags: DIFlagPrototyped, spFlags: 0)
!43 = !DISubroutineType(types: !44)
!44 = !{!35, !35, !35}
!45 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !46, file: !36, line: 154)
!46 = !DISubprogram(name: "ceil", scope: !32, file: !32, line: 159, type: !33, flags: DIFlagPrototyped, spFlags: 0)
!47 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !48, file: !36, line: 173)
!48 = !DISubprogram(name: "cos", scope: !32, file: !32, line: 62, type: !33, flags: DIFlagPrototyped, spFlags: 0)
!49 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !50, file: !36, line: 192)
!50 = !DISubprogram(name: "cosh", scope: !32, file: !32, line: 71, type: !33, flags: DIFlagPrototyped, spFlags: 0)
!51 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !52, file: !36, line: 211)
!52 = !DISubprogram(name: "exp", scope: !32, file: !32, line: 95, type: !33, flags: DIFlagPrototyped, spFlags: 0)
!53 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !54, file: !36, line: 230)
!54 = !DISubprogram(name: "fabs", scope: !32, file: !32, line: 162, type: !33, flags: DIFlagPrototyped, spFlags: 0)
!55 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !56, file: !36, line: 249)
!56 = !DISubprogram(name: "floor", scope: !32, file: !32, line: 165, type: !33, flags: DIFlagPrototyped, spFlags: 0)
!57 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !58, file: !36, line: 268)
!58 = !DISubprogram(name: "fmod", scope: !32, file: !32, line: 168, type: !43, flags: DIFlagPrototyped, spFlags: 0)
!59 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !60, file: !36, line: 280)
!60 = !DISubprogram(name: "frexp", scope: !32, file: !32, line: 98, type: !61, flags: DIFlagPrototyped, spFlags: 0)
!61 = !DISubroutineType(types: !62)
!62 = !{!35, !35, !63}
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !28, size: 64)
!64 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !65, file: !36, line: 299)
!65 = !DISubprogram(name: "ldexp", scope: !32, file: !32, line: 101, type: !66, flags: DIFlagPrototyped, spFlags: 0)
!66 = !DISubroutineType(types: !67)
!67 = !{!35, !35, !28}
!68 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !69, file: !36, line: 318)
!69 = !DISubprogram(name: "log", scope: !32, file: !32, line: 104, type: !33, flags: DIFlagPrototyped, spFlags: 0)
!70 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !71, file: !36, line: 337)
!71 = !DISubprogram(name: "log10", scope: !32, file: !32, line: 107, type: !33, flags: DIFlagPrototyped, spFlags: 0)
!72 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !73, file: !36, line: 356)
!73 = !DISubprogram(name: "modf", scope: !32, file: !32, line: 110, type: !74, flags: DIFlagPrototyped, spFlags: 0)
!74 = !DISubroutineType(types: !75)
!75 = !{!35, !35, !76}
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !35, size: 64)
!77 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !78, file: !36, line: 368)
!78 = !DISubprogram(name: "pow", scope: !32, file: !32, line: 140, type: !43, flags: DIFlagPrototyped, spFlags: 0)
!79 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !80, file: !36, line: 396)
!80 = !DISubprogram(name: "sin", scope: !32, file: !32, line: 64, type: !33, flags: DIFlagPrototyped, spFlags: 0)
!81 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !82, file: !36, line: 415)
!82 = !DISubprogram(name: "sinh", scope: !32, file: !32, line: 73, type: !33, flags: DIFlagPrototyped, spFlags: 0)
!83 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !84, file: !36, line: 434)
!84 = !DISubprogram(name: "sqrt", scope: !32, file: !32, line: 143, type: !33, flags: DIFlagPrototyped, spFlags: 0)
!85 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !86, file: !36, line: 453)
!86 = !DISubprogram(name: "tan", scope: !32, file: !32, line: 66, type: !33, flags: DIFlagPrototyped, spFlags: 0)
!87 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !88, file: !36, line: 472)
!88 = !DISubprogram(name: "tanh", scope: !32, file: !32, line: 75, type: !33, flags: DIFlagPrototyped, spFlags: 0)
!89 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !90, file: !36, line: 1881)
!90 = !DIDerivedType(tag: DW_TAG_typedef, name: "double_t", file: !91, line: 164, baseType: !35)
!91 = !DIFile(filename: "/usr/include/math.h", directory: "", checksumkind: CSK_MD5, checksum: "555a51fc91303a79e6e6a7bf2a303f79")
!92 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !93, file: !36, line: 1882)
!93 = !DIDerivedType(tag: DW_TAG_typedef, name: "float_t", file: !91, line: 163, baseType: !94)
!94 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!95 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !96, file: !36, line: 1885)
!96 = !DISubprogram(name: "acosh", scope: !32, file: !32, line: 85, type: !33, flags: DIFlagPrototyped, spFlags: 0)
!97 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !98, file: !36, line: 1886)
!98 = !DISubprogram(name: "acoshf", scope: !32, file: !32, line: 85, type: !99, flags: DIFlagPrototyped, spFlags: 0)
!99 = !DISubroutineType(types: !100)
!100 = !{!94, !94}
!101 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !102, file: !36, line: 1887)
!102 = !DISubprogram(name: "acoshl", scope: !32, file: !32, line: 85, type: !103, flags: DIFlagPrototyped, spFlags: 0)
!103 = !DISubroutineType(types: !104)
!104 = !{!105, !105}
!105 = !DIBasicType(name: "long double", size: 64, encoding: DW_ATE_float)
!106 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !107, file: !36, line: 1889)
!107 = !DISubprogram(name: "asinh", scope: !32, file: !32, line: 87, type: !33, flags: DIFlagPrototyped, spFlags: 0)
!108 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !109, file: !36, line: 1890)
!109 = !DISubprogram(name: "asinhf", scope: !32, file: !32, line: 87, type: !99, flags: DIFlagPrototyped, spFlags: 0)
!110 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !111, file: !36, line: 1891)
!111 = !DISubprogram(name: "asinhl", scope: !32, file: !32, line: 87, type: !103, flags: DIFlagPrototyped, spFlags: 0)
!112 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !113, file: !36, line: 1893)
!113 = !DISubprogram(name: "atanh", scope: !32, file: !32, line: 89, type: !33, flags: DIFlagPrototyped, spFlags: 0)
!114 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !115, file: !36, line: 1894)
!115 = !DISubprogram(name: "atanhf", scope: !32, file: !32, line: 89, type: !99, flags: DIFlagPrototyped, spFlags: 0)
!116 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !117, file: !36, line: 1895)
!117 = !DISubprogram(name: "atanhl", scope: !32, file: !32, line: 89, type: !103, flags: DIFlagPrototyped, spFlags: 0)
!118 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !119, file: !36, line: 1897)
!119 = !DISubprogram(name: "cbrt", scope: !32, file: !32, line: 152, type: !33, flags: DIFlagPrototyped, spFlags: 0)
!120 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !121, file: !36, line: 1898)
!121 = !DISubprogram(name: "cbrtf", scope: !32, file: !32, line: 152, type: !99, flags: DIFlagPrototyped, spFlags: 0)
!122 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !123, file: !36, line: 1899)
!123 = !DISubprogram(name: "cbrtl", scope: !32, file: !32, line: 152, type: !103, flags: DIFlagPrototyped, spFlags: 0)
!124 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !125, file: !36, line: 1901)
!125 = !DISubprogram(name: "copysign", scope: !32, file: !32, line: 198, type: !43, flags: DIFlagPrototyped, spFlags: 0)
!126 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !127, file: !36, line: 1902)
!127 = !DISubprogram(name: "copysignf", scope: !32, file: !32, line: 198, type: !128, flags: DIFlagPrototyped, spFlags: 0)
!128 = !DISubroutineType(types: !129)
!129 = !{!94, !94, !94}
!130 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !131, file: !36, line: 1903)
!131 = !DISubprogram(name: "copysignl", scope: !32, file: !32, line: 198, type: !132, flags: DIFlagPrototyped, spFlags: 0)
!132 = !DISubroutineType(types: !133)
!133 = !{!105, !105, !105}
!134 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !135, file: !36, line: 1905)
!135 = !DISubprogram(name: "erf", scope: !32, file: !32, line: 231, type: !33, flags: DIFlagPrototyped, spFlags: 0)
!136 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !137, file: !36, line: 1906)
!137 = !DISubprogram(name: "erff", scope: !32, file: !32, line: 231, type: !99, flags: DIFlagPrototyped, spFlags: 0)
!138 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !139, file: !36, line: 1907)
!139 = !DISubprogram(name: "erfl", scope: !32, file: !32, line: 231, type: !103, flags: DIFlagPrototyped, spFlags: 0)
!140 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !141, file: !36, line: 1909)
!141 = !DISubprogram(name: "erfc", scope: !32, file: !32, line: 232, type: !33, flags: DIFlagPrototyped, spFlags: 0)
!142 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !143, file: !36, line: 1910)
!143 = !DISubprogram(name: "erfcf", scope: !32, file: !32, line: 232, type: !99, flags: DIFlagPrototyped, spFlags: 0)
!144 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !145, file: !36, line: 1911)
!145 = !DISubprogram(name: "erfcl", scope: !32, file: !32, line: 232, type: !103, flags: DIFlagPrototyped, spFlags: 0)
!146 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !147, file: !36, line: 1913)
!147 = !DISubprogram(name: "exp2", scope: !32, file: !32, line: 130, type: !33, flags: DIFlagPrototyped, spFlags: 0)
!148 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !149, file: !36, line: 1914)
!149 = !DISubprogram(name: "exp2f", scope: !32, file: !32, line: 130, type: !99, flags: DIFlagPrototyped, spFlags: 0)
!150 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !151, file: !36, line: 1915)
!151 = !DISubprogram(name: "exp2l", scope: !32, file: !32, line: 130, type: !103, flags: DIFlagPrototyped, spFlags: 0)
!152 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !153, file: !36, line: 1917)
!153 = !DISubprogram(name: "expm1", scope: !32, file: !32, line: 119, type: !33, flags: DIFlagPrototyped, spFlags: 0)
!154 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !155, file: !36, line: 1918)
!155 = !DISubprogram(name: "expm1f", scope: !32, file: !32, line: 119, type: !99, flags: DIFlagPrototyped, spFlags: 0)
!156 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !157, file: !36, line: 1919)
!157 = !DISubprogram(name: "expm1l", scope: !32, file: !32, line: 119, type: !103, flags: DIFlagPrototyped, spFlags: 0)
!158 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !159, file: !36, line: 1921)
!159 = !DISubprogram(name: "fdim", scope: !32, file: !32, line: 329, type: !43, flags: DIFlagPrototyped, spFlags: 0)
!160 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !161, file: !36, line: 1922)
!161 = !DISubprogram(name: "fdimf", scope: !32, file: !32, line: 329, type: !128, flags: DIFlagPrototyped, spFlags: 0)
!162 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !163, file: !36, line: 1923)
!163 = !DISubprogram(name: "fdiml", scope: !32, file: !32, line: 329, type: !132, flags: DIFlagPrototyped, spFlags: 0)
!164 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !165, file: !36, line: 1925)
!165 = !DISubprogram(name: "fma", scope: !32, file: !32, line: 340, type: !166, flags: DIFlagPrototyped, spFlags: 0)
!166 = !DISubroutineType(types: !167)
!167 = !{!35, !35, !35, !35}
!168 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !169, file: !36, line: 1926)
!169 = !DISubprogram(name: "fmaf", scope: !32, file: !32, line: 340, type: !170, flags: DIFlagPrototyped, spFlags: 0)
!170 = !DISubroutineType(types: !171)
!171 = !{!94, !94, !94, !94}
!172 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !173, file: !36, line: 1927)
!173 = !DISubprogram(name: "fmal", scope: !32, file: !32, line: 340, type: !174, flags: DIFlagPrototyped, spFlags: 0)
!174 = !DISubroutineType(types: !175)
!175 = !{!105, !105, !105, !105}
!176 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !177, file: !36, line: 1929)
!177 = !DISubprogram(name: "fmax", scope: !32, file: !32, line: 333, type: !43, flags: DIFlagPrototyped, spFlags: 0)
!178 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !179, file: !36, line: 1930)
!179 = !DISubprogram(name: "fmaxf", scope: !32, file: !32, line: 333, type: !128, flags: DIFlagPrototyped, spFlags: 0)
!180 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !181, file: !36, line: 1931)
!181 = !DISubprogram(name: "fmaxl", scope: !32, file: !32, line: 333, type: !132, flags: DIFlagPrototyped, spFlags: 0)
!182 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !183, file: !36, line: 1933)
!183 = !DISubprogram(name: "fmin", scope: !32, file: !32, line: 336, type: !43, flags: DIFlagPrototyped, spFlags: 0)
!184 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !185, file: !36, line: 1934)
!185 = !DISubprogram(name: "fminf", scope: !32, file: !32, line: 336, type: !128, flags: DIFlagPrototyped, spFlags: 0)
!186 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !187, file: !36, line: 1935)
!187 = !DISubprogram(name: "fminl", scope: !32, file: !32, line: 336, type: !132, flags: DIFlagPrototyped, spFlags: 0)
!188 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !189, file: !36, line: 1937)
!189 = !DISubprogram(name: "hypot", scope: !32, file: !32, line: 147, type: !43, flags: DIFlagPrototyped, spFlags: 0)
!190 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !191, file: !36, line: 1938)
!191 = !DISubprogram(name: "hypotf", scope: !32, file: !32, line: 147, type: !128, flags: DIFlagPrototyped, spFlags: 0)
!192 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !193, file: !36, line: 1939)
!193 = !DISubprogram(name: "hypotl", scope: !32, file: !32, line: 147, type: !132, flags: DIFlagPrototyped, spFlags: 0)
!194 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !195, file: !36, line: 1941)
!195 = !DISubprogram(name: "ilogb", scope: !32, file: !32, line: 283, type: !196, flags: DIFlagPrototyped, spFlags: 0)
!196 = !DISubroutineType(types: !197)
!197 = !{!28, !35}
!198 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !199, file: !36, line: 1942)
!199 = !DISubprogram(name: "ilogbf", scope: !32, file: !32, line: 283, type: !200, flags: DIFlagPrototyped, spFlags: 0)
!200 = !DISubroutineType(types: !201)
!201 = !{!28, !94}
!202 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !203, file: !36, line: 1943)
!203 = !DISubprogram(name: "ilogbl", scope: !32, file: !32, line: 283, type: !204, flags: DIFlagPrototyped, spFlags: 0)
!204 = !DISubroutineType(types: !205)
!205 = !{!28, !105}
!206 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !207, file: !36, line: 1945)
!207 = !DISubprogram(name: "lgamma", scope: !32, file: !32, line: 233, type: !33, flags: DIFlagPrototyped, spFlags: 0)
!208 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !209, file: !36, line: 1946)
!209 = !DISubprogram(name: "lgammaf", scope: !32, file: !32, line: 233, type: !99, flags: DIFlagPrototyped, spFlags: 0)
!210 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !211, file: !36, line: 1947)
!211 = !DISubprogram(name: "lgammal", scope: !32, file: !32, line: 233, type: !103, flags: DIFlagPrototyped, spFlags: 0)
!212 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !213, file: !36, line: 1950)
!213 = !DISubprogram(name: "llrint", scope: !32, file: !32, line: 319, type: !214, flags: DIFlagPrototyped, spFlags: 0)
!214 = !DISubroutineType(types: !215)
!215 = !{!5, !35}
!216 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !217, file: !36, line: 1951)
!217 = !DISubprogram(name: "llrintf", scope: !32, file: !32, line: 319, type: !218, flags: DIFlagPrototyped, spFlags: 0)
!218 = !DISubroutineType(types: !219)
!219 = !{!5, !94}
!220 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !221, file: !36, line: 1952)
!221 = !DISubprogram(name: "llrintl", scope: !32, file: !32, line: 319, type: !222, flags: DIFlagPrototyped, spFlags: 0)
!222 = !DISubroutineType(types: !223)
!223 = !{!5, !105}
!224 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !225, file: !36, line: 1954)
!225 = !DISubprogram(name: "llround", scope: !32, file: !32, line: 325, type: !214, flags: DIFlagPrototyped, spFlags: 0)
!226 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !227, file: !36, line: 1955)
!227 = !DISubprogram(name: "llroundf", scope: !32, file: !32, line: 325, type: !218, flags: DIFlagPrototyped, spFlags: 0)
!228 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !229, file: !36, line: 1956)
!229 = !DISubprogram(name: "llroundl", scope: !32, file: !32, line: 325, type: !222, flags: DIFlagPrototyped, spFlags: 0)
!230 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !231, file: !36, line: 1959)
!231 = !DISubprogram(name: "log1p", scope: !32, file: !32, line: 122, type: !33, flags: DIFlagPrototyped, spFlags: 0)
!232 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !233, file: !36, line: 1960)
!233 = !DISubprogram(name: "log1pf", scope: !32, file: !32, line: 122, type: !99, flags: DIFlagPrototyped, spFlags: 0)
!234 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !235, file: !36, line: 1961)
!235 = !DISubprogram(name: "log1pl", scope: !32, file: !32, line: 122, type: !103, flags: DIFlagPrototyped, spFlags: 0)
!236 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !237, file: !36, line: 1963)
!237 = !DISubprogram(name: "log2", scope: !32, file: !32, line: 133, type: !33, flags: DIFlagPrototyped, spFlags: 0)
!238 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !239, file: !36, line: 1964)
!239 = !DISubprogram(name: "log2f", scope: !32, file: !32, line: 133, type: !99, flags: DIFlagPrototyped, spFlags: 0)
!240 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !241, file: !36, line: 1965)
!241 = !DISubprogram(name: "log2l", scope: !32, file: !32, line: 133, type: !103, flags: DIFlagPrototyped, spFlags: 0)
!242 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !243, file: !36, line: 1967)
!243 = !DISubprogram(name: "logb", scope: !32, file: !32, line: 125, type: !33, flags: DIFlagPrototyped, spFlags: 0)
!244 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !245, file: !36, line: 1968)
!245 = !DISubprogram(name: "logbf", scope: !32, file: !32, line: 125, type: !99, flags: DIFlagPrototyped, spFlags: 0)
!246 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !247, file: !36, line: 1969)
!247 = !DISubprogram(name: "logbl", scope: !32, file: !32, line: 125, type: !103, flags: DIFlagPrototyped, spFlags: 0)
!248 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !249, file: !36, line: 1971)
!249 = !DISubprogram(name: "lrint", scope: !32, file: !32, line: 317, type: !250, flags: DIFlagPrototyped, spFlags: 0)
!250 = !DISubroutineType(types: !251)
!251 = !{!252, !35}
!252 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!253 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !254, file: !36, line: 1972)
!254 = !DISubprogram(name: "lrintf", scope: !32, file: !32, line: 317, type: !255, flags: DIFlagPrototyped, spFlags: 0)
!255 = !DISubroutineType(types: !256)
!256 = !{!252, !94}
!257 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !258, file: !36, line: 1973)
!258 = !DISubprogram(name: "lrintl", scope: !32, file: !32, line: 317, type: !259, flags: DIFlagPrototyped, spFlags: 0)
!259 = !DISubroutineType(types: !260)
!260 = !{!252, !105}
!261 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !262, file: !36, line: 1975)
!262 = !DISubprogram(name: "lround", scope: !32, file: !32, line: 323, type: !250, flags: DIFlagPrototyped, spFlags: 0)
!263 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !264, file: !36, line: 1976)
!264 = !DISubprogram(name: "lroundf", scope: !32, file: !32, line: 323, type: !255, flags: DIFlagPrototyped, spFlags: 0)
!265 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !266, file: !36, line: 1977)
!266 = !DISubprogram(name: "lroundl", scope: !32, file: !32, line: 323, type: !259, flags: DIFlagPrototyped, spFlags: 0)
!267 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !268, file: !36, line: 1979)
!268 = !DISubprogram(name: "nan", scope: !32, file: !32, line: 203, type: !269, flags: DIFlagPrototyped, spFlags: 0)
!269 = !DISubroutineType(types: !270)
!270 = !{!35, !271}
!271 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !272, size: 64)
!272 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !273)
!273 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!274 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !275, file: !36, line: 1980)
!275 = !DISubprogram(name: "nanf", scope: !32, file: !32, line: 203, type: !276, flags: DIFlagPrototyped, spFlags: 0)
!276 = !DISubroutineType(types: !277)
!277 = !{!94, !271}
!278 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !279, file: !36, line: 1981)
!279 = !DISubprogram(name: "nanl", scope: !32, file: !32, line: 203, type: !280, flags: DIFlagPrototyped, spFlags: 0)
!280 = !DISubroutineType(types: !281)
!281 = !{!105, !271}
!282 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !283, file: !36, line: 1983)
!283 = !DISubprogram(name: "nearbyint", scope: !32, file: !32, line: 297, type: !33, flags: DIFlagPrototyped, spFlags: 0)
!284 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !285, file: !36, line: 1984)
!285 = !DISubprogram(name: "nearbyintf", scope: !32, file: !32, line: 297, type: !99, flags: DIFlagPrototyped, spFlags: 0)
!286 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !287, file: !36, line: 1985)
!287 = !DISubprogram(name: "nearbyintl", scope: !32, file: !32, line: 297, type: !103, flags: DIFlagPrototyped, spFlags: 0)
!288 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !289, file: !36, line: 1987)
!289 = !DISubprogram(name: "nextafter", scope: !32, file: !32, line: 262, type: !43, flags: DIFlagPrototyped, spFlags: 0)
!290 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !291, file: !36, line: 1988)
!291 = !DISubprogram(name: "nextafterf", scope: !32, file: !32, line: 262, type: !128, flags: DIFlagPrototyped, spFlags: 0)
!292 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !293, file: !36, line: 1989)
!293 = !DISubprogram(name: "nextafterl", scope: !32, file: !32, line: 262, type: !132, flags: DIFlagPrototyped, spFlags: 0)
!294 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !295, file: !36, line: 1991)
!295 = !DISubprogram(name: "nexttoward", scope: !32, file: !32, line: 264, type: !296, flags: DIFlagPrototyped, spFlags: 0)
!296 = !DISubroutineType(types: !297)
!297 = !{!35, !35, !105}
!298 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !299, file: !36, line: 1992)
!299 = !DISubprogram(name: "nexttowardf", scope: !32, file: !32, line: 264, type: !300, flags: DIFlagPrototyped, spFlags: 0)
!300 = !DISubroutineType(types: !301)
!301 = !{!94, !94, !105}
!302 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !303, file: !36, line: 1993)
!303 = !DISubprogram(name: "nexttowardl", scope: !32, file: !32, line: 264, type: !132, flags: DIFlagPrototyped, spFlags: 0)
!304 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !305, file: !36, line: 1995)
!305 = !DISubprogram(name: "remainder", scope: !32, file: !32, line: 275, type: !43, flags: DIFlagPrototyped, spFlags: 0)
!306 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !307, file: !36, line: 1996)
!307 = !DISubprogram(name: "remainderf", scope: !32, file: !32, line: 275, type: !128, flags: DIFlagPrototyped, spFlags: 0)
!308 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !309, file: !36, line: 1997)
!309 = !DISubprogram(name: "remainderl", scope: !32, file: !32, line: 275, type: !132, flags: DIFlagPrototyped, spFlags: 0)
!310 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !311, file: !36, line: 1999)
!311 = !DISubprogram(name: "remquo", scope: !32, file: !32, line: 310, type: !312, flags: DIFlagPrototyped, spFlags: 0)
!312 = !DISubroutineType(types: !313)
!313 = !{!35, !35, !35, !63}
!314 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !315, file: !36, line: 2000)
!315 = !DISubprogram(name: "remquof", scope: !32, file: !32, line: 310, type: !316, flags: DIFlagPrototyped, spFlags: 0)
!316 = !DISubroutineType(types: !317)
!317 = !{!94, !94, !94, !63}
!318 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !319, file: !36, line: 2001)
!319 = !DISubprogram(name: "remquol", scope: !32, file: !32, line: 310, type: !320, flags: DIFlagPrototyped, spFlags: 0)
!320 = !DISubroutineType(types: !321)
!321 = !{!105, !105, !105, !63}
!322 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !323, file: !36, line: 2003)
!323 = !DISubprogram(name: "rint", scope: !32, file: !32, line: 259, type: !33, flags: DIFlagPrototyped, spFlags: 0)
!324 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !325, file: !36, line: 2004)
!325 = !DISubprogram(name: "rintf", scope: !32, file: !32, line: 259, type: !99, flags: DIFlagPrototyped, spFlags: 0)
!326 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !327, file: !36, line: 2005)
!327 = !DISubprogram(name: "rintl", scope: !32, file: !32, line: 259, type: !103, flags: DIFlagPrototyped, spFlags: 0)
!328 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !329, file: !36, line: 2007)
!329 = !DISubprogram(name: "round", scope: !32, file: !32, line: 301, type: !33, flags: DIFlagPrototyped, spFlags: 0)
!330 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !331, file: !36, line: 2008)
!331 = !DISubprogram(name: "roundf", scope: !32, file: !32, line: 301, type: !99, flags: DIFlagPrototyped, spFlags: 0)
!332 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !333, file: !36, line: 2009)
!333 = !DISubprogram(name: "roundl", scope: !32, file: !32, line: 301, type: !103, flags: DIFlagPrototyped, spFlags: 0)
!334 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !335, file: !36, line: 2011)
!335 = !DISubprogram(name: "scalbln", scope: !32, file: !32, line: 293, type: !336, flags: DIFlagPrototyped, spFlags: 0)
!336 = !DISubroutineType(types: !337)
!337 = !{!35, !35, !252}
!338 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !339, file: !36, line: 2012)
!339 = !DISubprogram(name: "scalblnf", scope: !32, file: !32, line: 293, type: !340, flags: DIFlagPrototyped, spFlags: 0)
!340 = !DISubroutineType(types: !341)
!341 = !{!94, !94, !252}
!342 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !343, file: !36, line: 2013)
!343 = !DISubprogram(name: "scalblnl", scope: !32, file: !32, line: 293, type: !344, flags: DIFlagPrototyped, spFlags: 0)
!344 = !DISubroutineType(types: !345)
!345 = !{!105, !105, !252}
!346 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !347, file: !36, line: 2015)
!347 = !DISubprogram(name: "scalbn", scope: !32, file: !32, line: 279, type: !66, flags: DIFlagPrototyped, spFlags: 0)
!348 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !349, file: !36, line: 2016)
!349 = !DISubprogram(name: "scalbnf", scope: !32, file: !32, line: 279, type: !350, flags: DIFlagPrototyped, spFlags: 0)
!350 = !DISubroutineType(types: !351)
!351 = !{!94, !94, !28}
!352 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !353, file: !36, line: 2017)
!353 = !DISubprogram(name: "scalbnl", scope: !32, file: !32, line: 279, type: !354, flags: DIFlagPrototyped, spFlags: 0)
!354 = !DISubroutineType(types: !355)
!355 = !{!105, !105, !28}
!356 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !357, file: !36, line: 2019)
!357 = !DISubprogram(name: "tgamma", scope: !32, file: !32, line: 238, type: !33, flags: DIFlagPrototyped, spFlags: 0)
!358 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !359, file: !36, line: 2020)
!359 = !DISubprogram(name: "tgammaf", scope: !32, file: !32, line: 238, type: !99, flags: DIFlagPrototyped, spFlags: 0)
!360 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !361, file: !36, line: 2021)
!361 = !DISubprogram(name: "tgammal", scope: !32, file: !32, line: 238, type: !103, flags: DIFlagPrototyped, spFlags: 0)
!362 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !363, file: !36, line: 2023)
!363 = !DISubprogram(name: "trunc", scope: !32, file: !32, line: 305, type: !33, flags: DIFlagPrototyped, spFlags: 0)
!364 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !365, file: !36, line: 2024)
!365 = !DISubprogram(name: "truncf", scope: !32, file: !32, line: 305, type: !99, flags: DIFlagPrototyped, spFlags: 0)
!366 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !367, file: !36, line: 2025)
!367 = !DISubprogram(name: "truncl", scope: !32, file: !32, line: 305, type: !103, flags: DIFlagPrototyped, spFlags: 0)
!368 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !369, entity: !370, file: !371, line: 58)
!369 = !DINamespace(name: "__gnu_debug", scope: null)
!370 = !DINamespace(name: "__debug", scope: !23)
!371 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/debug/debug.h", directory: "", checksumkind: CSK_MD5, checksum: "752210a319f5f5d356cc29cd1ce3cdc7")
!372 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !373, file: !375, line: 131)
!373 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !25, line: 63, baseType: !374)
!374 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !25, line: 59, size: 64, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!375 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/cstdlib", directory: "")
!376 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !377, file: !375, line: 132)
!377 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !25, line: 71, baseType: !378)
!378 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !25, line: 67, size: 128, flags: DIFlagTypePassByValue, elements: !379, identifier: "_ZTS6ldiv_t")
!379 = !{!380, !381}
!380 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !378, file: !25, line: 69, baseType: !252, size: 64)
!381 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !378, file: !25, line: 70, baseType: !252, size: 64, offset: 64)
!382 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !383, file: !375, line: 134)
!383 = !DISubprogram(name: "abort", scope: !25, file: !25, line: 730, type: !384, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!384 = !DISubroutineType(types: !385)
!385 = !{null}
!386 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !387, file: !375, line: 136)
!387 = !DISubprogram(name: "aligned_alloc", scope: !25, file: !25, line: 724, type: !388, flags: DIFlagPrototyped, spFlags: 0)
!388 = !DISubroutineType(types: !389)
!389 = !{!390, !391, !391}
!390 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!391 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !392, line: 18, baseType: !393)
!392 = !DIFile(filename: "/opt/rocm-6.4.2/lib/llvm/lib/clang/19/include/__stddef_size_t.h", directory: "", checksumkind: CSK_MD5, checksum: "2c44e821a2b1951cde2eb0fb2e656867")
!393 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!394 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !395, file: !375, line: 138)
!395 = !DISubprogram(name: "atexit", scope: !25, file: !25, line: 734, type: !396, flags: DIFlagPrototyped, spFlags: 0)
!396 = !DISubroutineType(types: !397)
!397 = !{!28, !398}
!398 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !384, size: 64)
!399 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !400, file: !375, line: 141)
!400 = !DISubprogram(name: "at_quick_exit", scope: !25, file: !25, line: 739, type: !396, flags: DIFlagPrototyped, spFlags: 0)
!401 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !402, file: !375, line: 144)
!402 = !DISubprogram(name: "atof", scope: !25, file: !25, line: 102, type: !269, flags: DIFlagPrototyped, spFlags: 0)
!403 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !404, file: !375, line: 145)
!404 = !DISubprogram(name: "atoi", scope: !25, file: !25, line: 105, type: !405, flags: DIFlagPrototyped, spFlags: 0)
!405 = !DISubroutineType(types: !406)
!406 = !{!28, !271}
!407 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !408, file: !375, line: 146)
!408 = !DISubprogram(name: "atol", scope: !25, file: !25, line: 108, type: !409, flags: DIFlagPrototyped, spFlags: 0)
!409 = !DISubroutineType(types: !410)
!410 = !{!252, !271}
!411 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !412, file: !375, line: 147)
!412 = !DISubprogram(name: "bsearch", scope: !25, file: !25, line: 960, type: !413, flags: DIFlagPrototyped, spFlags: 0)
!413 = !DISubroutineType(types: !414)
!414 = !{!390, !415, !415, !391, !391, !417}
!415 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !416, size: 64)
!416 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!417 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !25, line: 948, baseType: !418)
!418 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !419, size: 64)
!419 = !DISubroutineType(types: !420)
!420 = !{!28, !415, !415}
!421 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !422, file: !375, line: 148)
!422 = !DISubprogram(name: "calloc", scope: !25, file: !25, line: 675, type: !388, flags: DIFlagPrototyped, spFlags: 0)
!423 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !424, file: !375, line: 149)
!424 = !DISubprogram(name: "div", scope: !25, file: !25, line: 992, type: !425, flags: DIFlagPrototyped, spFlags: 0)
!425 = !DISubroutineType(types: !426)
!426 = !{!373, !28, !28}
!427 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !428, file: !375, line: 150)
!428 = !DISubprogram(name: "exit", scope: !25, file: !25, line: 756, type: !429, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!429 = !DISubroutineType(types: !430)
!430 = !{null, !28}
!431 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !432, file: !375, line: 151)
!432 = !DISubprogram(name: "free", scope: !25, file: !25, line: 687, type: !433, flags: DIFlagPrototyped, spFlags: 0)
!433 = !DISubroutineType(types: !434)
!434 = !{null, !390}
!435 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !436, file: !375, line: 152)
!436 = !DISubprogram(name: "getenv", scope: !25, file: !25, line: 773, type: !437, flags: DIFlagPrototyped, spFlags: 0)
!437 = !DISubroutineType(types: !438)
!438 = !{!439, !271}
!439 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !273, size: 64)
!440 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !441, file: !375, line: 153)
!441 = !DISubprogram(name: "labs", scope: !25, file: !25, line: 981, type: !442, flags: DIFlagPrototyped, spFlags: 0)
!442 = !DISubroutineType(types: !443)
!443 = !{!252, !252}
!444 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !445, file: !375, line: 154)
!445 = !DISubprogram(name: "ldiv", scope: !25, file: !25, line: 994, type: !446, flags: DIFlagPrototyped, spFlags: 0)
!446 = !DISubroutineType(types: !447)
!447 = !{!377, !252, !252}
!448 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !449, file: !375, line: 155)
!449 = !DISubprogram(name: "malloc", scope: !25, file: !25, line: 672, type: !450, flags: DIFlagPrototyped, spFlags: 0)
!450 = !DISubroutineType(types: !451)
!451 = !{!390, !391}
!452 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !453, file: !375, line: 157)
!453 = !DISubprogram(name: "mblen", scope: !25, file: !25, line: 1062, type: !454, flags: DIFlagPrototyped, spFlags: 0)
!454 = !DISubroutineType(types: !455)
!455 = !{!28, !271, !391}
!456 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !457, file: !375, line: 158)
!457 = !DISubprogram(name: "mbstowcs", scope: !25, file: !25, line: 1073, type: !458, flags: DIFlagPrototyped, spFlags: 0)
!458 = !DISubroutineType(types: !459)
!459 = !{!391, !460, !463, !391}
!460 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !461)
!461 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !462, size: 64)
!462 = !DIBasicType(name: "wchar_t", size: 32, encoding: DW_ATE_signed)
!463 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !271)
!464 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !465, file: !375, line: 159)
!465 = !DISubprogram(name: "mbtowc", scope: !25, file: !25, line: 1065, type: !466, flags: DIFlagPrototyped, spFlags: 0)
!466 = !DISubroutineType(types: !467)
!467 = !{!28, !460, !463, !391}
!468 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !469, file: !375, line: 161)
!469 = !DISubprogram(name: "qsort", scope: !25, file: !25, line: 970, type: !470, flags: DIFlagPrototyped, spFlags: 0)
!470 = !DISubroutineType(types: !471)
!471 = !{null, !390, !391, !391, !417}
!472 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !473, file: !375, line: 164)
!473 = !DISubprogram(name: "quick_exit", scope: !25, file: !25, line: 762, type: !429, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!474 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !475, file: !375, line: 167)
!475 = !DISubprogram(name: "rand", scope: !25, file: !25, line: 573, type: !476, flags: DIFlagPrototyped, spFlags: 0)
!476 = !DISubroutineType(types: !477)
!477 = !{!28}
!478 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !479, file: !375, line: 168)
!479 = !DISubprogram(name: "realloc", scope: !25, file: !25, line: 683, type: !480, flags: DIFlagPrototyped, spFlags: 0)
!480 = !DISubroutineType(types: !481)
!481 = !{!390, !390, !391}
!482 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !483, file: !375, line: 169)
!483 = !DISubprogram(name: "srand", scope: !25, file: !25, line: 575, type: !484, flags: DIFlagPrototyped, spFlags: 0)
!484 = !DISubroutineType(types: !485)
!485 = !{null, !14}
!486 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !487, file: !375, line: 170)
!487 = !DISubprogram(name: "strtod", scope: !25, file: !25, line: 118, type: !488, flags: DIFlagPrototyped, spFlags: 0)
!488 = !DISubroutineType(types: !489)
!489 = !{!35, !463, !490}
!490 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !491)
!491 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !439, size: 64)
!492 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !493, file: !375, line: 171)
!493 = !DISubprogram(name: "strtol", linkageName: "__isoc23_strtol", scope: !25, file: !25, line: 215, type: !494, flags: DIFlagPrototyped, spFlags: 0)
!494 = !DISubroutineType(types: !495)
!495 = !{!252, !463, !490, !28}
!496 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !497, file: !375, line: 172)
!497 = !DISubprogram(name: "strtoul", linkageName: "__isoc23_strtoul", scope: !25, file: !25, line: 219, type: !498, flags: DIFlagPrototyped, spFlags: 0)
!498 = !DISubroutineType(types: !499)
!499 = !{!393, !463, !490, !28}
!500 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !501, file: !375, line: 173)
!501 = !DISubprogram(name: "system", scope: !25, file: !25, line: 923, type: !405, flags: DIFlagPrototyped, spFlags: 0)
!502 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !503, file: !375, line: 175)
!503 = !DISubprogram(name: "wcstombs", scope: !25, file: !25, line: 1077, type: !504, flags: DIFlagPrototyped, spFlags: 0)
!504 = !DISubroutineType(types: !505)
!505 = !{!391, !506, !507, !391}
!506 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !439)
!507 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !508)
!508 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !509, size: 64)
!509 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !462)
!510 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !511, file: !375, line: 176)
!511 = !DISubprogram(name: "wctomb", scope: !25, file: !25, line: 1069, type: !512, flags: DIFlagPrototyped, spFlags: 0)
!512 = !DISubroutineType(types: !513)
!513 = !{!28, !439, !462}
!514 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !515, entity: !516, file: !375, line: 204)
!515 = !DINamespace(name: "__gnu_cxx", scope: null)
!516 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !25, line: 81, baseType: !517)
!517 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !25, line: 77, size: 128, flags: DIFlagTypePassByValue, elements: !518, identifier: "_ZTS7lldiv_t")
!518 = !{!519, !520}
!519 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !517, file: !25, line: 79, baseType: !5, size: 64)
!520 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !517, file: !25, line: 80, baseType: !5, size: 64, offset: 64)
!521 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !515, entity: !522, file: !375, line: 210)
!522 = !DISubprogram(name: "_Exit", scope: !25, file: !25, line: 768, type: !429, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!523 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !515, entity: !524, file: !375, line: 214)
!524 = !DISubprogram(name: "llabs", scope: !25, file: !25, line: 984, type: !525, flags: DIFlagPrototyped, spFlags: 0)
!525 = !DISubroutineType(types: !526)
!526 = !{!5, !5}
!527 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !515, entity: !528, file: !375, line: 220)
!528 = !DISubprogram(name: "lldiv", scope: !25, file: !25, line: 998, type: !529, flags: DIFlagPrototyped, spFlags: 0)
!529 = !DISubroutineType(types: !530)
!530 = !{!516, !5, !5}
!531 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !515, entity: !532, file: !375, line: 231)
!532 = !DISubprogram(name: "atoll", scope: !25, file: !25, line: 113, type: !533, flags: DIFlagPrototyped, spFlags: 0)
!533 = !DISubroutineType(types: !534)
!534 = !{!5, !271}
!535 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !515, entity: !536, file: !375, line: 232)
!536 = !DISubprogram(name: "strtoll", linkageName: "__isoc23_strtoll", scope: !25, file: !25, line: 238, type: !537, flags: DIFlagPrototyped, spFlags: 0)
!537 = !DISubroutineType(types: !538)
!538 = !{!5, !463, !490, !28}
!539 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !515, entity: !540, file: !375, line: 233)
!540 = !DISubprogram(name: "strtoull", linkageName: "__isoc23_strtoull", scope: !25, file: !25, line: 243, type: !541, flags: DIFlagPrototyped, spFlags: 0)
!541 = !DISubroutineType(types: !542)
!542 = !{!543, !463, !490, !28}
!543 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!544 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !515, entity: !545, file: !375, line: 235)
!545 = !DISubprogram(name: "strtof", scope: !25, file: !25, line: 124, type: !546, flags: DIFlagPrototyped, spFlags: 0)
!546 = !DISubroutineType(types: !547)
!547 = !{!94, !463, !490}
!548 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !515, entity: !549, file: !375, line: 236)
!549 = !DISubprogram(name: "strtold", scope: !25, file: !25, line: 127, type: !550, flags: DIFlagPrototyped, spFlags: 0)
!550 = !DISubroutineType(types: !551)
!551 = !{!105, !463, !490}
!552 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !516, file: !375, line: 244)
!553 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !522, file: !375, line: 246)
!554 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !524, file: !375, line: 248)
!555 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !556, file: !375, line: 249)
!556 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !515, file: !375, line: 217, type: !529, flags: DIFlagPrototyped, spFlags: 0)
!557 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !528, file: !375, line: 250)
!558 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !532, file: !375, line: 252)
!559 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !545, file: !375, line: 253)
!560 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !536, file: !375, line: 254)
!561 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !540, file: !375, line: 255)
!562 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !549, file: !375, line: 256)
!563 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !383, file: !564, line: 38)
!564 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/stdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "3f24ff2a8eef595875da96e5466bd4aa")
!565 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !395, file: !564, line: 39)
!566 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !428, file: !564, line: 40)
!567 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !400, file: !564, line: 43)
!568 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !473, file: !564, line: 46)
!569 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !522, file: !564, line: 49)
!570 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !373, file: !564, line: 54)
!571 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !377, file: !564, line: 55)
!572 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !573, file: !564, line: 57)
!573 = !DISubprogram(name: "abs", linkageName: "_ZSt3absn", scope: !23, file: !29, line: 85, type: !574, flags: DIFlagPrototyped, spFlags: 0)
!574 = !DISubroutineType(types: !575)
!575 = !{!576, !576}
!576 = !DIBasicType(name: "__int128", size: 128, encoding: DW_ATE_signed)
!577 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !402, file: !564, line: 58)
!578 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !404, file: !564, line: 59)
!579 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !408, file: !564, line: 60)
!580 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !412, file: !564, line: 61)
!581 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !422, file: !564, line: 62)
!582 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !556, file: !564, line: 63)
!583 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !432, file: !564, line: 64)
!584 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !436, file: !564, line: 65)
!585 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !441, file: !564, line: 66)
!586 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !445, file: !564, line: 67)
!587 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !449, file: !564, line: 68)
!588 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !453, file: !564, line: 70)
!589 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !457, file: !564, line: 71)
!590 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !465, file: !564, line: 72)
!591 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !469, file: !564, line: 74)
!592 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !475, file: !564, line: 75)
!593 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !479, file: !564, line: 76)
!594 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !483, file: !564, line: 77)
!595 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !487, file: !564, line: 78)
!596 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !493, file: !564, line: 79)
!597 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !497, file: !564, line: 80)
!598 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !501, file: !564, line: 81)
!599 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !503, file: !564, line: 83)
!600 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !511, file: !564, line: 84)
!601 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !602, file: !603, line: 200)
!602 = !DISubprogram(name: "abs", linkageName: "_ZL3absd", scope: !603, file: !603, line: 28, type: !33, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!603 = !DIFile(filename: "/opt/rocm-6.4.2/lib/llvm/lib/clang/19/include/__clang_cuda_math_forward_declares.h", directory: "", checksumkind: CSK_MD5, checksum: "7fcaa66c0bf1529fc7d2359f3dc2dd30")
!604 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !605, file: !603, line: 201)
!605 = !DISubprogram(name: "acos", linkageName: "_ZL4acosf", scope: !603, file: !603, line: 32, type: !99, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!606 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !607, file: !603, line: 202)
!607 = !DISubprogram(name: "acosh", linkageName: "_ZL5acoshf", scope: !603, file: !603, line: 34, type: !99, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!608 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !609, file: !603, line: 203)
!609 = !DISubprogram(name: "asin", linkageName: "_ZL4asinf", scope: !603, file: !603, line: 36, type: !99, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!610 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !611, file: !603, line: 204)
!611 = !DISubprogram(name: "asinh", linkageName: "_ZL5asinhf", scope: !603, file: !603, line: 38, type: !99, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!612 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !613, file: !603, line: 205)
!613 = !DISubprogram(name: "atan", linkageName: "_ZL4atanf", scope: !603, file: !603, line: 42, type: !99, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!614 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !615, file: !603, line: 206)
!615 = !DISubprogram(name: "atan2", linkageName: "_ZL5atan2ff", scope: !603, file: !603, line: 40, type: !128, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!616 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !617, file: !603, line: 207)
!617 = !DISubprogram(name: "atanh", linkageName: "_ZL5atanhf", scope: !603, file: !603, line: 44, type: !99, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!618 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !619, file: !603, line: 208)
!619 = !DISubprogram(name: "cbrt", linkageName: "_ZL4cbrtf", scope: !603, file: !603, line: 46, type: !99, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!620 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !621, file: !603, line: 209)
!621 = !DISubprogram(name: "ceil", linkageName: "_ZL4ceilf", scope: !603, file: !603, line: 48, type: !99, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!622 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !623, file: !603, line: 210)
!623 = !DISubprogram(name: "copysign", linkageName: "_ZL8copysignff", scope: !603, file: !603, line: 50, type: !128, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!624 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !625, file: !603, line: 211)
!625 = !DISubprogram(name: "cos", linkageName: "_ZL3cosf", scope: !603, file: !603, line: 52, type: !99, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!626 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !627, file: !603, line: 212)
!627 = !DISubprogram(name: "cosh", linkageName: "_ZL4coshf", scope: !603, file: !603, line: 54, type: !99, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!628 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !629, file: !603, line: 213)
!629 = !DISubprogram(name: "erf", linkageName: "_ZL3erff", scope: !603, file: !603, line: 58, type: !99, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!630 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !631, file: !603, line: 214)
!631 = !DISubprogram(name: "erfc", linkageName: "_ZL4erfcf", scope: !603, file: !603, line: 56, type: !99, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!632 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !633, file: !603, line: 215)
!633 = !DISubprogram(name: "exp", linkageName: "_ZL3expf", scope: !603, file: !603, line: 62, type: !99, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!634 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !635, file: !603, line: 216)
!635 = !DISubprogram(name: "exp2", linkageName: "_ZL4exp2f", scope: !603, file: !603, line: 60, type: !99, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!636 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !637, file: !603, line: 217)
!637 = !DISubprogram(name: "expm1", linkageName: "_ZL5expm1f", scope: !603, file: !603, line: 64, type: !99, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!638 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !639, file: !603, line: 218)
!639 = !DISubprogram(name: "fabs", linkageName: "_ZL4fabsf", scope: !603, file: !603, line: 66, type: !99, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!640 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !641, file: !603, line: 219)
!641 = !DISubprogram(name: "fdim", linkageName: "_ZL4fdimff", scope: !603, file: !603, line: 68, type: !128, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!642 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !643, file: !603, line: 220)
!643 = !DISubprogram(name: "floor", linkageName: "_ZL5floorf", scope: !603, file: !603, line: 70, type: !99, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!644 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !645, file: !603, line: 221)
!645 = !DISubprogram(name: "fma", linkageName: "_ZL3fmafff", scope: !603, file: !603, line: 72, type: !170, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!646 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !647, file: !603, line: 222)
!647 = !DISubprogram(name: "fmax", linkageName: "_ZL4fmaxff", scope: !603, file: !603, line: 74, type: !128, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!648 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !649, file: !603, line: 223)
!649 = !DISubprogram(name: "fmin", linkageName: "_ZL4fminff", scope: !603, file: !603, line: 76, type: !128, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!650 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !651, file: !603, line: 224)
!651 = !DISubprogram(name: "fmod", linkageName: "_ZL4fmodff", scope: !603, file: !603, line: 78, type: !128, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!652 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !653, file: !603, line: 225)
!653 = !DISubprogram(name: "fpclassify", linkageName: "_ZL10fpclassifyf", scope: !603, file: !603, line: 80, type: !200, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!654 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !655, file: !603, line: 226)
!655 = !DISubprogram(name: "frexp", linkageName: "_ZL5frexpfPi", scope: !603, file: !603, line: 82, type: !656, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!656 = !DISubroutineType(types: !657)
!657 = !{!94, !94, !63}
!658 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !659, file: !603, line: 227)
!659 = !DISubprogram(name: "hypot", linkageName: "_ZL5hypotff", scope: !603, file: !603, line: 84, type: !128, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!660 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !661, file: !603, line: 228)
!661 = !DISubprogram(name: "ilogb", linkageName: "_ZL5ilogbf", scope: !603, file: !603, line: 86, type: !200, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!662 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !663, file: !603, line: 229)
!663 = !DISubprogram(name: "isfinite", linkageName: "_ZL8isfinitef", scope: !603, file: !603, line: 91, type: !664, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!664 = !DISubroutineType(types: !665)
!665 = !{!666, !94}
!666 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!667 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !668, file: !603, line: 230)
!668 = !DISubprogram(name: "isgreater", linkageName: "_ZL9isgreaterff", scope: !603, file: !603, line: 95, type: !669, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!669 = !DISubroutineType(types: !670)
!670 = !{!666, !94, !94}
!671 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !672, file: !603, line: 231)
!672 = !DISubprogram(name: "isgreaterequal", linkageName: "_ZL14isgreaterequalff", scope: !603, file: !603, line: 94, type: !669, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!673 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !674, file: !603, line: 232)
!674 = !DISubprogram(name: "isinf", linkageName: "_ZL5isinff", scope: !603, file: !603, line: 100, type: !664, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!675 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !676, file: !603, line: 233)
!676 = !DISubprogram(name: "isless", linkageName: "_ZL6islessff", scope: !603, file: !603, line: 104, type: !669, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!677 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !678, file: !603, line: 234)
!678 = !DISubprogram(name: "islessequal", linkageName: "_ZL11islessequalff", scope: !603, file: !603, line: 103, type: !669, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!679 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !680, file: !603, line: 235)
!680 = !DISubprogram(name: "islessgreater", linkageName: "_ZL13islessgreaterff", scope: !603, file: !603, line: 106, type: !669, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!681 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !682, file: !603, line: 236)
!682 = !DISubprogram(name: "isnan", linkageName: "_ZL5isnanf", scope: !603, file: !603, line: 111, type: !664, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!683 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !684, file: !603, line: 237)
!684 = !DISubprogram(name: "isnormal", linkageName: "_ZL8isnormalf", scope: !603, file: !603, line: 113, type: !664, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!685 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !686, file: !603, line: 238)
!686 = !DISubprogram(name: "isunordered", linkageName: "_ZL11isunorderedff", scope: !603, file: !603, line: 115, type: !669, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!687 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !688, file: !603, line: 239)
!688 = !DISubprogram(name: "labs", linkageName: "_ZL4labsl", scope: !603, file: !603, line: 116, type: !442, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!689 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !690, file: !603, line: 240)
!690 = !DISubprogram(name: "ldexp", linkageName: "_ZL5ldexpfi", scope: !603, file: !603, line: 118, type: !350, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!691 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !692, file: !603, line: 241)
!692 = !DISubprogram(name: "lgamma", linkageName: "_ZL6lgammaf", scope: !603, file: !603, line: 120, type: !99, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!693 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !694, file: !603, line: 242)
!694 = !DISubprogram(name: "llabs", linkageName: "_ZL5llabsx", scope: !603, file: !603, line: 121, type: !525, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!695 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !696, file: !603, line: 243)
!696 = !DISubprogram(name: "llrint", linkageName: "_ZL6llrintf", scope: !603, file: !603, line: 123, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!697 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !698, file: !603, line: 244)
!698 = !DISubprogram(name: "log", linkageName: "_ZL3logf", scope: !603, file: !603, line: 133, type: !99, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!699 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !700, file: !603, line: 245)
!700 = !DISubprogram(name: "log10", linkageName: "_ZL5log10f", scope: !603, file: !603, line: 125, type: !99, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!701 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !702, file: !603, line: 246)
!702 = !DISubprogram(name: "log1p", linkageName: "_ZL5log1pf", scope: !603, file: !603, line: 127, type: !99, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!703 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !704, file: !603, line: 247)
!704 = !DISubprogram(name: "log2", linkageName: "_ZL4log2f", scope: !603, file: !603, line: 129, type: !99, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!705 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !706, file: !603, line: 248)
!706 = !DISubprogram(name: "logb", linkageName: "_ZL4logbf", scope: !603, file: !603, line: 131, type: !99, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!707 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !708, file: !603, line: 249)
!708 = !DISubprogram(name: "lrint", linkageName: "_ZL5lrintf", scope: !603, file: !603, line: 135, type: !255, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!709 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !710, file: !603, line: 250)
!710 = !DISubprogram(name: "lround", linkageName: "_ZL6lroundf", scope: !603, file: !603, line: 137, type: !255, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!711 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !712, file: !603, line: 251)
!712 = !DISubprogram(name: "llround", linkageName: "_ZL7llroundf", scope: !603, file: !603, line: 138, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!713 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !714, file: !603, line: 252)
!714 = !DISubprogram(name: "modf", linkageName: "_ZL4modffPf", scope: !603, file: !603, line: 140, type: !715, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!715 = !DISubroutineType(types: !716)
!716 = !{!94, !94, !717}
!717 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !94, size: 64)
!718 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !719, file: !603, line: 253)
!719 = !DISubprogram(name: "nan", linkageName: "_ZL3nanPKc", scope: !603, file: !603, line: 141, type: !269, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!720 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !721, file: !603, line: 254)
!721 = !DISubprogram(name: "nanf", linkageName: "_ZL4nanfPKc", scope: !603, file: !603, line: 142, type: !276, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!722 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !723, file: !603, line: 255)
!723 = !DISubprogram(name: "nearbyint", linkageName: "_ZL9nearbyintf", scope: !603, file: !603, line: 144, type: !99, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!724 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !725, file: !603, line: 256)
!725 = !DISubprogram(name: "nextafter", linkageName: "_ZL9nextafterff", scope: !603, file: !603, line: 146, type: !128, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!726 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !727, file: !603, line: 257)
!727 = !DISubprogram(name: "pow", linkageName: "_ZL3powfi", scope: !603, file: !603, line: 150, type: !350, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!728 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !729, file: !603, line: 258)
!729 = !DISubprogram(name: "remainder", linkageName: "_ZL9remainderff", scope: !603, file: !603, line: 152, type: !128, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!730 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !731, file: !603, line: 259)
!731 = !DISubprogram(name: "remquo", linkageName: "_ZL6remquoffPi", scope: !603, file: !603, line: 154, type: !316, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!732 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !733, file: !603, line: 260)
!733 = !DISubprogram(name: "rint", linkageName: "_ZL4rintf", scope: !603, file: !603, line: 156, type: !99, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!734 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !735, file: !603, line: 261)
!735 = !DISubprogram(name: "round", linkageName: "_ZL5roundf", scope: !603, file: !603, line: 158, type: !99, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!736 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !737, file: !603, line: 262)
!737 = !DISubprogram(name: "scalbln", linkageName: "_ZL7scalblnfl", scope: !603, file: !603, line: 160, type: !340, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!738 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !739, file: !603, line: 263)
!739 = !DISubprogram(name: "scalbn", linkageName: "_ZL6scalbnfi", scope: !603, file: !603, line: 162, type: !350, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!740 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !741, file: !603, line: 264)
!741 = !DISubprogram(name: "signbit", linkageName: "_ZL7signbitf", scope: !603, file: !603, line: 167, type: !664, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!742 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !743, file: !603, line: 265)
!743 = !DISubprogram(name: "sin", linkageName: "_ZL3sinf", scope: !603, file: !603, line: 169, type: !99, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!744 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !745, file: !603, line: 266)
!745 = !DISubprogram(name: "sinh", linkageName: "_ZL4sinhf", scope: !603, file: !603, line: 171, type: !99, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!746 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !747, file: !603, line: 267)
!747 = !DISubprogram(name: "sqrt", linkageName: "_ZL4sqrtf", scope: !603, file: !603, line: 173, type: !99, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!748 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !749, file: !603, line: 268)
!749 = !DISubprogram(name: "tan", linkageName: "_ZL3tanf", scope: !603, file: !603, line: 175, type: !99, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!750 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !751, file: !603, line: 269)
!751 = !DISubprogram(name: "tanh", linkageName: "_ZL4tanhf", scope: !603, file: !603, line: 177, type: !99, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!752 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !753, file: !603, line: 270)
!753 = !DISubprogram(name: "tgamma", linkageName: "_ZL6tgammaf", scope: !603, file: !603, line: 179, type: !99, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!754 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !755, file: !603, line: 271)
!755 = !DISubprogram(name: "trunc", linkageName: "_ZL5truncf", scope: !603, file: !603, line: 181, type: !99, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!756 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !757, file: !759, line: 737)
!757 = !DISubprogram(name: "acosf", linkageName: "_ZL5acosff", scope: !758, file: !758, line: 358, type: !99, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!758 = !DIFile(filename: "/opt/rocm-6.4.2/lib/llvm/lib/clang/19/include/__clang_hip_math.h", directory: "", checksumkind: CSK_MD5, checksum: "1ddc6320be20cc493976d99e6b1c9853")
!759 = !DIFile(filename: "/opt/rocm-6.4.2/lib/llvm/lib/clang/19/include/__clang_hip_cmath.h", directory: "", checksumkind: CSK_MD5, checksum: "dc1ab1a8805dcbc75cbf36b8a1f9305a")
!760 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !761, file: !759, line: 738)
!761 = !DISubprogram(name: "acoshf", linkageName: "_ZL6acoshff", scope: !758, file: !758, line: 361, type: !99, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!762 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !763, file: !759, line: 739)
!763 = !DISubprogram(name: "asinf", linkageName: "_ZL5asinff", scope: !758, file: !758, line: 364, type: !99, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!764 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !765, file: !759, line: 740)
!765 = !DISubprogram(name: "asinhf", linkageName: "_ZL6asinhff", scope: !758, file: !758, line: 367, type: !99, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!766 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !767, file: !759, line: 741)
!767 = !DISubprogram(name: "atan2f", linkageName: "_ZL6atan2fff", scope: !758, file: !758, line: 370, type: !128, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!768 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !769, file: !759, line: 742)
!769 = !DISubprogram(name: "atanf", linkageName: "_ZL5atanff", scope: !758, file: !758, line: 373, type: !99, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!770 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !771, file: !759, line: 743)
!771 = !DISubprogram(name: "atanhf", linkageName: "_ZL6atanhff", scope: !758, file: !758, line: 376, type: !99, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!772 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !773, file: !759, line: 744)
!773 = !DISubprogram(name: "cbrtf", linkageName: "_ZL5cbrtff", scope: !758, file: !758, line: 379, type: !99, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!774 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !775, file: !759, line: 745)
!775 = !DISubprogram(name: "ceilf", linkageName: "_ZL5ceilff", scope: !758, file: !758, line: 382, type: !99, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!776 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !777, file: !759, line: 746)
!777 = !DISubprogram(name: "copysignf", linkageName: "_ZL9copysignfff", scope: !758, file: !758, line: 385, type: !128, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!778 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !779, file: !759, line: 747)
!779 = !DISubprogram(name: "cosf", linkageName: "_ZL4cosff", scope: !758, file: !758, line: 388, type: !99, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!780 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !781, file: !759, line: 748)
!781 = !DISubprogram(name: "coshf", linkageName: "_ZL5coshff", scope: !758, file: !758, line: 391, type: !99, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!782 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !783, file: !759, line: 749)
!783 = !DISubprogram(name: "erfcf", linkageName: "_ZL5erfcff", scope: !758, file: !758, line: 403, type: !99, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!784 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !785, file: !759, line: 750)
!785 = !DISubprogram(name: "erff", linkageName: "_ZL4erfff", scope: !758, file: !758, line: 412, type: !99, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!786 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !787, file: !759, line: 751)
!787 = !DISubprogram(name: "exp2f", linkageName: "_ZL5exp2ff", scope: !758, file: !758, line: 421, type: !99, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!788 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !789, file: !759, line: 752)
!789 = !DISubprogram(name: "expf", linkageName: "_ZL4expff", scope: !758, file: !758, line: 424, type: !99, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!790 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !791, file: !759, line: 753)
!791 = !DISubprogram(name: "expm1f", linkageName: "_ZL6expm1ff", scope: !758, file: !758, line: 427, type: !99, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!792 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !793, file: !759, line: 754)
!793 = !DISubprogram(name: "fabsf", linkageName: "_ZL5fabsff", scope: !758, file: !758, line: 430, type: !99, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!794 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !795, file: !759, line: 755)
!795 = !DISubprogram(name: "fdimf", linkageName: "_ZL5fdimfff", scope: !758, file: !758, line: 433, type: !128, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!796 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !797, file: !759, line: 756)
!797 = !DISubprogram(name: "floorf", linkageName: "_ZL6floorff", scope: !758, file: !758, line: 439, type: !99, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!798 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !799, file: !759, line: 757)
!799 = !DISubprogram(name: "fmaf", linkageName: "_ZL4fmaffff", scope: !758, file: !758, line: 442, type: !170, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!800 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !801, file: !759, line: 758)
!801 = !DISubprogram(name: "fmaxf", linkageName: "_ZL5fmaxfff", scope: !758, file: !758, line: 447, type: !128, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!802 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !803, file: !759, line: 759)
!803 = !DISubprogram(name: "fminf", linkageName: "_ZL5fminfff", scope: !758, file: !758, line: 450, type: !128, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!804 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !805, file: !759, line: 760)
!805 = !DISubprogram(name: "fmodf", linkageName: "_ZL5fmodfff", scope: !758, file: !758, line: 453, type: !128, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!806 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !807, file: !759, line: 761)
!807 = !DISubprogram(name: "frexpf", linkageName: "_ZL6frexpffPi", scope: !758, file: !758, line: 456, type: !656, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!808 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !809, file: !759, line: 762)
!809 = !DISubprogram(name: "hypotf", linkageName: "_ZL6hypotfff", scope: !758, file: !758, line: 461, type: !128, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!810 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !811, file: !759, line: 763)
!811 = !DISubprogram(name: "ilogbf", linkageName: "_ZL6ilogbff", scope: !758, file: !758, line: 464, type: !200, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!812 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !813, file: !759, line: 764)
!813 = !DISubprogram(name: "ldexpf", linkageName: "_ZL6ldexpffi", scope: !758, file: !758, line: 503, type: !350, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!814 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !815, file: !759, line: 765)
!815 = !DISubprogram(name: "lgammaf", linkageName: "_ZL7lgammaff", scope: !758, file: !758, line: 506, type: !99, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!816 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !817, file: !759, line: 766)
!817 = !DISubprogram(name: "llrintf", linkageName: "_ZL7llrintff", scope: !758, file: !758, line: 509, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!818 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !819, file: !759, line: 767)
!819 = !DISubprogram(name: "llroundf", linkageName: "_ZL8llroundff", scope: !758, file: !758, line: 512, type: !218, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!820 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !821, file: !759, line: 768)
!821 = !DISubprogram(name: "log10f", linkageName: "_ZL6log10ff", scope: !758, file: !758, line: 515, type: !99, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!822 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !823, file: !759, line: 769)
!823 = !DISubprogram(name: "log1pf", linkageName: "_ZL6log1pff", scope: !758, file: !758, line: 518, type: !99, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!824 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !825, file: !759, line: 770)
!825 = !DISubprogram(name: "log2f", linkageName: "_ZL5log2ff", scope: !758, file: !758, line: 521, type: !99, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!826 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !827, file: !759, line: 771)
!827 = !DISubprogram(name: "logbf", linkageName: "_ZL5logbff", scope: !758, file: !758, line: 524, type: !99, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!828 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !829, file: !759, line: 772)
!829 = !DISubprogram(name: "logf", linkageName: "_ZL4logff", scope: !758, file: !758, line: 527, type: !99, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!830 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !831, file: !759, line: 773)
!831 = !DISubprogram(name: "lrintf", linkageName: "_ZL6lrintff", scope: !758, file: !758, line: 530, type: !255, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!832 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !833, file: !759, line: 774)
!833 = !DISubprogram(name: "lroundf", linkageName: "_ZL7lroundff", scope: !758, file: !758, line: 533, type: !255, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!834 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !835, file: !759, line: 775)
!835 = !DISubprogram(name: "modff", linkageName: "_ZL5modfffPf", scope: !758, file: !758, line: 536, type: !715, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!836 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !837, file: !759, line: 776)
!837 = !DISubprogram(name: "nearbyintf", linkageName: "_ZL10nearbyintff", scope: !758, file: !758, line: 571, type: !99, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!838 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !839, file: !759, line: 777)
!839 = !DISubprogram(name: "nextafterf", linkageName: "_ZL10nextafterfff", scope: !758, file: !758, line: 574, type: !128, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!840 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !841, file: !759, line: 779)
!841 = !DISubprogram(name: "powf", linkageName: "_ZL4powfff", scope: !758, file: !758, line: 607, type: !128, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!842 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !843, file: !759, line: 780)
!843 = !DISubprogram(name: "remainderf", linkageName: "_ZL10remainderfff", scope: !758, file: !758, line: 616, type: !128, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!844 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !845, file: !759, line: 781)
!845 = !DISubprogram(name: "remquof", linkageName: "_ZL7remquofffPi", scope: !758, file: !758, line: 621, type: !316, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!846 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !847, file: !759, line: 782)
!847 = !DISubprogram(name: "rintf", linkageName: "_ZL5rintff", scope: !758, file: !758, line: 636, type: !99, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!848 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !849, file: !759, line: 783)
!849 = !DISubprogram(name: "roundf", linkageName: "_ZL6roundff", scope: !758, file: !758, line: 661, type: !99, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!850 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !851, file: !759, line: 784)
!851 = !DISubprogram(name: "scalblnf", linkageName: "_ZL8scalblnffl", scope: !758, file: !758, line: 667, type: !340, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!852 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !853, file: !759, line: 785)
!853 = !DISubprogram(name: "scalbnf", linkageName: "_ZL7scalbnffi", scope: !758, file: !758, line: 673, type: !350, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!854 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !855, file: !759, line: 786)
!855 = !DISubprogram(name: "sinf", linkageName: "_ZL4sinff", scope: !758, file: !758, line: 703, type: !99, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!856 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !857, file: !759, line: 787)
!857 = !DISubprogram(name: "sinhf", linkageName: "_ZL5sinhff", scope: !758, file: !758, line: 706, type: !99, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!858 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !859, file: !759, line: 788)
!859 = !DISubprogram(name: "sqrtf", linkageName: "_ZL5sqrtff", scope: !758, file: !758, line: 712, type: !99, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!860 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !861, file: !759, line: 789)
!861 = !DISubprogram(name: "tanf", linkageName: "_ZL4tanff", scope: !758, file: !758, line: 715, type: !99, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!862 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !863, file: !759, line: 790)
!863 = !DISubprogram(name: "tanhf", linkageName: "_ZL5tanhff", scope: !758, file: !758, line: 718, type: !99, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!864 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !865, file: !759, line: 791)
!865 = !DISubprogram(name: "tgammaf", linkageName: "_ZL7tgammaff", scope: !758, file: !758, line: 721, type: !99, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!866 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !867, file: !759, line: 792)
!867 = !DISubprogram(name: "truncf", linkageName: "_ZL6truncff", scope: !758, file: !758, line: 724, type: !99, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!868 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !869, file: !870, line: 66)
!869 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "exception_ptr", scope: !871, file: !870, line: 97, size: 64, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSNSt15__exception_ptr13exception_ptrE")
!870 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/bits/exception_ptr.h", directory: "", checksumkind: CSK_MD5, checksum: "314ad14748ccb9ff85c65d17ebb0828b")
!871 = !DINamespace(name: "__exception_ptr", scope: !23)
!872 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !871, entity: !873, file: !870, line: 85)
!873 = !DISubprogram(name: "rethrow_exception", linkageName: "_ZSt17rethrow_exceptionNSt15__exception_ptr13exception_ptrE", scope: !23, file: !870, line: 81, type: !874, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!874 = !DISubroutineType(types: !875)
!875 = !{null, !869}
!876 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !877, file: !870, line: 243)
!877 = !DISubprogram(name: "swap", linkageName: "_ZNSt15__exception_ptr4swapERNS_13exception_ptrES1_", scope: !871, file: !870, line: 230, type: !878, flags: DIFlagPrototyped, spFlags: 0)
!878 = !DISubroutineType(types: !879)
!879 = !{null, !880, !880}
!880 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !869, size: 64)
!881 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !882, file: !897, line: 64)
!882 = !DIDerivedType(tag: DW_TAG_typedef, name: "mbstate_t", file: !883, line: 6, baseType: !884)
!883 = !DIFile(filename: "/usr/include/bits/types/mbstate_t.h", directory: "", checksumkind: CSK_MD5, checksum: "ba8742313715e20e434cf6ccb2db98e3")
!884 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mbstate_t", file: !885, line: 21, baseType: !886)
!885 = !DIFile(filename: "/usr/include/bits/types/__mbstate_t.h", directory: "", checksumkind: CSK_MD5, checksum: "82911a3e689448e3691ded3e0b471a55")
!886 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !885, line: 13, size: 64, flags: DIFlagTypePassByValue, elements: !887, identifier: "_ZTS11__mbstate_t")
!887 = !{!888, !889}
!888 = !DIDerivedType(tag: DW_TAG_member, name: "__count", scope: !886, file: !885, line: 15, baseType: !28, size: 32)
!889 = !DIDerivedType(tag: DW_TAG_member, name: "__value", scope: !886, file: !885, line: 20, baseType: !890, size: 32, offset: 32)
!890 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !886, file: !885, line: 16, size: 32, flags: DIFlagTypePassByValue, elements: !891, identifier: "_ZTSN11__mbstate_tUt_E")
!891 = !{!892, !893}
!892 = !DIDerivedType(tag: DW_TAG_member, name: "__wch", scope: !890, file: !885, line: 18, baseType: !14, size: 32)
!893 = !DIDerivedType(tag: DW_TAG_member, name: "__wchb", scope: !890, file: !885, line: 19, baseType: !894, size: 32)
!894 = !DICompositeType(tag: DW_TAG_array_type, baseType: !273, size: 32, elements: !895)
!895 = !{!896}
!896 = !DISubrange(count: 4)
!897 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/cwchar", directory: "")
!898 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !899, file: !897, line: 141)
!899 = !DIDerivedType(tag: DW_TAG_typedef, name: "wint_t", file: !900, line: 20, baseType: !14)
!900 = !DIFile(filename: "/usr/include/bits/types/wint_t.h", directory: "", checksumkind: CSK_MD5, checksum: "aa31b53ef28dc23152ceb41e2763ded3")
!901 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !902, file: !897, line: 143)
!902 = !DISubprogram(name: "btowc", scope: !903, file: !903, line: 309, type: !904, flags: DIFlagPrototyped, spFlags: 0)
!903 = !DIFile(filename: "/usr/include/wchar.h", directory: "", checksumkind: CSK_MD5, checksum: "c7881b2872d88c3ed71646d8a9e91af3")
!904 = !DISubroutineType(types: !905)
!905 = !{!899, !28}
!906 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !907, file: !897, line: 144)
!907 = !DISubprogram(name: "fgetwc", scope: !903, file: !903, line: 935, type: !908, flags: DIFlagPrototyped, spFlags: 0)
!908 = !DISubroutineType(types: !909)
!909 = !{!899, !910}
!910 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !911, size: 64)
!911 = !DIDerivedType(tag: DW_TAG_typedef, name: "__FILE", file: !912, line: 5, baseType: !913)
!912 = !DIFile(filename: "/usr/include/bits/types/__FILE.h", directory: "", checksumkind: CSK_MD5, checksum: "72a8fe90981f484acae7c6f3dfc5c2b7")
!913 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !912, line: 4, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS8_IO_FILE")
!914 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !915, file: !897, line: 145)
!915 = !DISubprogram(name: "fgetws", scope: !903, file: !903, line: 964, type: !916, flags: DIFlagPrototyped, spFlags: 0)
!916 = !DISubroutineType(types: !917)
!917 = !{!461, !460, !28, !918}
!918 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !910)
!919 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !920, file: !897, line: 146)
!920 = !DISubprogram(name: "fputwc", scope: !903, file: !903, line: 949, type: !921, flags: DIFlagPrototyped, spFlags: 0)
!921 = !DISubroutineType(types: !922)
!922 = !{!899, !462, !910}
!923 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !924, file: !897, line: 147)
!924 = !DISubprogram(name: "fputws", scope: !903, file: !903, line: 971, type: !925, flags: DIFlagPrototyped, spFlags: 0)
!925 = !DISubroutineType(types: !926)
!926 = !{!28, !507, !918}
!927 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !928, file: !897, line: 148)
!928 = !DISubprogram(name: "fwide", scope: !903, file: !903, line: 725, type: !929, flags: DIFlagPrototyped, spFlags: 0)
!929 = !DISubroutineType(types: !930)
!930 = !{!28, !910, !28}
!931 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !932, file: !897, line: 149)
!932 = !DISubprogram(name: "fwprintf", scope: !903, file: !903, line: 732, type: !933, flags: DIFlagPrototyped, spFlags: 0)
!933 = !DISubroutineType(types: !934)
!934 = !{!28, !918, !507, null}
!935 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !936, file: !897, line: 150)
!936 = !DISubprogram(name: "fwscanf", linkageName: "__isoc23_fwscanf", scope: !903, file: !903, line: 795, type: !933, flags: DIFlagPrototyped, spFlags: 0)
!937 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !938, file: !897, line: 151)
!938 = !DISubprogram(name: "getwc", scope: !903, file: !903, line: 936, type: !908, flags: DIFlagPrototyped, spFlags: 0)
!939 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !940, file: !897, line: 152)
!940 = !DISubprogram(name: "getwchar", scope: !903, file: !903, line: 942, type: !941, flags: DIFlagPrototyped, spFlags: 0)
!941 = !DISubroutineType(types: !942)
!942 = !{!899}
!943 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !944, file: !897, line: 153)
!944 = !DISubprogram(name: "mbrlen", scope: !903, file: !903, line: 332, type: !945, flags: DIFlagPrototyped, spFlags: 0)
!945 = !DISubroutineType(types: !946)
!946 = !{!391, !463, !391, !947}
!947 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !948)
!948 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !882, size: 64)
!949 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !950, file: !897, line: 154)
!950 = !DISubprogram(name: "mbrtowc", scope: !903, file: !903, line: 321, type: !951, flags: DIFlagPrototyped, spFlags: 0)
!951 = !DISubroutineType(types: !952)
!952 = !{!391, !460, !463, !391, !947}
!953 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !954, file: !897, line: 155)
!954 = !DISubprogram(name: "mbsinit", scope: !903, file: !903, line: 317, type: !955, flags: DIFlagPrototyped, spFlags: 0)
!955 = !DISubroutineType(types: !956)
!956 = !{!28, !957}
!957 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !958, size: 64)
!958 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !882)
!959 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !960, file: !897, line: 156)
!960 = !DISubprogram(name: "mbsrtowcs", scope: !903, file: !903, line: 362, type: !961, flags: DIFlagPrototyped, spFlags: 0)
!961 = !DISubroutineType(types: !962)
!962 = !{!391, !460, !963, !391, !947}
!963 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !964)
!964 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !271, size: 64)
!965 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !966, file: !897, line: 157)
!966 = !DISubprogram(name: "putwc", scope: !903, file: !903, line: 950, type: !921, flags: DIFlagPrototyped, spFlags: 0)
!967 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !968, file: !897, line: 158)
!968 = !DISubprogram(name: "putwchar", scope: !903, file: !903, line: 956, type: !969, flags: DIFlagPrototyped, spFlags: 0)
!969 = !DISubroutineType(types: !970)
!970 = !{!899, !462}
!971 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !972, file: !897, line: 160)
!972 = !DISubprogram(name: "swprintf", scope: !903, file: !903, line: 742, type: !973, flags: DIFlagPrototyped, spFlags: 0)
!973 = !DISubroutineType(types: !974)
!974 = !{!28, !460, !391, !507, null}
!975 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !976, file: !897, line: 162)
!976 = !DISubprogram(name: "swscanf", linkageName: "__isoc23_swscanf", scope: !903, file: !903, line: 802, type: !977, flags: DIFlagPrototyped, spFlags: 0)
!977 = !DISubroutineType(types: !978)
!978 = !{!28, !507, !507, null}
!979 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !980, file: !897, line: 163)
!980 = !DISubprogram(name: "ungetwc", scope: !903, file: !903, line: 979, type: !981, flags: DIFlagPrototyped, spFlags: 0)
!981 = !DISubroutineType(types: !982)
!982 = !{!899, !899, !910}
!983 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !984, file: !897, line: 164)
!984 = !DISubprogram(name: "vfwprintf", scope: !903, file: !903, line: 750, type: !985, flags: DIFlagPrototyped, spFlags: 0)
!985 = !DISubroutineType(types: !986)
!986 = !{!28, !918, !507, !987}
!987 = !DIDerivedType(tag: DW_TAG_typedef, name: "__gnuc_va_list", file: !988, line: 12, baseType: !989)
!988 = !DIFile(filename: "/opt/rocm-6.4.2/lib/llvm/lib/clang/19/include/__stdarg___gnuc_va_list.h", directory: "", checksumkind: CSK_MD5, checksum: "edb3f2eab991638e4dc94f6e55e3530f")
!989 = !DIDerivedType(tag: DW_TAG_typedef, name: "__builtin_va_list", file: !4, baseType: !439)
!990 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !991, file: !897, line: 166)
!991 = !DISubprogram(name: "vfwscanf", linkageName: "__isoc23_vfwscanf", scope: !903, file: !903, line: 875, type: !985, flags: DIFlagPrototyped, spFlags: 0)
!992 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !993, file: !897, line: 169)
!993 = !DISubprogram(name: "vswprintf", scope: !903, file: !903, line: 763, type: !994, flags: DIFlagPrototyped, spFlags: 0)
!994 = !DISubroutineType(types: !995)
!995 = !{!28, !460, !391, !507, !987}
!996 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !997, file: !897, line: 172)
!997 = !DISubprogram(name: "vswscanf", linkageName: "__isoc23_vswscanf", scope: !903, file: !903, line: 882, type: !998, flags: DIFlagPrototyped, spFlags: 0)
!998 = !DISubroutineType(types: !999)
!999 = !{!28, !507, !507, !987}
!1000 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1001, file: !897, line: 174)
!1001 = !DISubprogram(name: "vwprintf", scope: !903, file: !903, line: 758, type: !1002, flags: DIFlagPrototyped, spFlags: 0)
!1002 = !DISubroutineType(types: !1003)
!1003 = !{!28, !507, !987}
!1004 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1005, file: !897, line: 176)
!1005 = !DISubprogram(name: "vwscanf", linkageName: "__isoc23_vwscanf", scope: !903, file: !903, line: 879, type: !1002, flags: DIFlagPrototyped, spFlags: 0)
!1006 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1007, file: !897, line: 178)
!1007 = !DISubprogram(name: "wcrtomb", scope: !903, file: !903, line: 326, type: !1008, flags: DIFlagPrototyped, spFlags: 0)
!1008 = !DISubroutineType(types: !1009)
!1009 = !{!391, !506, !462, !947}
!1010 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1011, file: !897, line: 179)
!1011 = !DISubprogram(name: "wcscat", scope: !903, file: !903, line: 121, type: !1012, flags: DIFlagPrototyped, spFlags: 0)
!1012 = !DISubroutineType(types: !1013)
!1013 = !{!461, !460, !507}
!1014 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1015, file: !897, line: 180)
!1015 = !DISubprogram(name: "wcscmp", scope: !903, file: !903, line: 130, type: !1016, flags: DIFlagPrototyped, spFlags: 0)
!1016 = !DISubroutineType(types: !1017)
!1017 = !{!28, !508, !508}
!1018 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1019, file: !897, line: 181)
!1019 = !DISubprogram(name: "wcscoll", scope: !903, file: !903, line: 155, type: !1016, flags: DIFlagPrototyped, spFlags: 0)
!1020 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1021, file: !897, line: 182)
!1021 = !DISubprogram(name: "wcscpy", scope: !903, file: !903, line: 98, type: !1012, flags: DIFlagPrototyped, spFlags: 0)
!1022 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1023, file: !897, line: 183)
!1023 = !DISubprogram(name: "wcscspn", scope: !903, file: !903, line: 212, type: !1024, flags: DIFlagPrototyped, spFlags: 0)
!1024 = !DISubroutineType(types: !1025)
!1025 = !{!391, !508, !508}
!1026 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1027, file: !897, line: 184)
!1027 = !DISubprogram(name: "wcsftime", scope: !903, file: !903, line: 1043, type: !1028, flags: DIFlagPrototyped, spFlags: 0)
!1028 = !DISubroutineType(types: !1029)
!1029 = !{!391, !460, !391, !507, !1030}
!1030 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1031)
!1031 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1032, size: 64)
!1032 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1033)
!1033 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tm", file: !903, line: 94, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS2tm")
!1034 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1035, file: !897, line: 185)
!1035 = !DISubprogram(name: "wcslen", scope: !903, file: !903, line: 247, type: !1036, flags: DIFlagPrototyped, spFlags: 0)
!1036 = !DISubroutineType(types: !1037)
!1037 = !{!391, !508}
!1038 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1039, file: !897, line: 186)
!1039 = !DISubprogram(name: "wcsncat", scope: !903, file: !903, line: 125, type: !1040, flags: DIFlagPrototyped, spFlags: 0)
!1040 = !DISubroutineType(types: !1041)
!1041 = !{!461, !460, !507, !391}
!1042 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1043, file: !897, line: 187)
!1043 = !DISubprogram(name: "wcsncmp", scope: !903, file: !903, line: 133, type: !1044, flags: DIFlagPrototyped, spFlags: 0)
!1044 = !DISubroutineType(types: !1045)
!1045 = !{!28, !508, !508, !391}
!1046 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1047, file: !897, line: 188)
!1047 = !DISubprogram(name: "wcsncpy", scope: !903, file: !903, line: 103, type: !1040, flags: DIFlagPrototyped, spFlags: 0)
!1048 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1049, file: !897, line: 189)
!1049 = !DISubprogram(name: "wcsrtombs", scope: !903, file: !903, line: 368, type: !1050, flags: DIFlagPrototyped, spFlags: 0)
!1050 = !DISubroutineType(types: !1051)
!1051 = !{!391, !506, !1052, !391, !947}
!1052 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1053)
!1053 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !508, size: 64)
!1054 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1055, file: !897, line: 190)
!1055 = !DISubprogram(name: "wcsspn", scope: !903, file: !903, line: 216, type: !1024, flags: DIFlagPrototyped, spFlags: 0)
!1056 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1057, file: !897, line: 191)
!1057 = !DISubprogram(name: "wcstod", scope: !903, file: !903, line: 402, type: !1058, flags: DIFlagPrototyped, spFlags: 0)
!1058 = !DISubroutineType(types: !1059)
!1059 = !{!35, !507, !1060}
!1060 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1061)
!1061 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !461, size: 64)
!1062 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1063, file: !897, line: 193)
!1063 = !DISubprogram(name: "wcstof", scope: !903, file: !903, line: 407, type: !1064, flags: DIFlagPrototyped, spFlags: 0)
!1064 = !DISubroutineType(types: !1065)
!1065 = !{!94, !507, !1060}
!1066 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1067, file: !897, line: 195)
!1067 = !DISubprogram(name: "wcstok", scope: !903, file: !903, line: 242, type: !1068, flags: DIFlagPrototyped, spFlags: 0)
!1068 = !DISubroutineType(types: !1069)
!1069 = !{!461, !460, !507, !1060}
!1070 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1071, file: !897, line: 196)
!1071 = !DISubprogram(name: "wcstol", linkageName: "__isoc23_wcstol", scope: !903, file: !903, line: 500, type: !1072, flags: DIFlagPrototyped, spFlags: 0)
!1072 = !DISubroutineType(types: !1073)
!1073 = !{!252, !507, !1060, !28}
!1074 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1075, file: !897, line: 197)
!1075 = !DISubprogram(name: "wcstoul", linkageName: "__isoc23_wcstoul", scope: !903, file: !903, line: 503, type: !1076, flags: DIFlagPrototyped, spFlags: 0)
!1076 = !DISubroutineType(types: !1077)
!1077 = !{!393, !507, !1060, !28}
!1078 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1079, file: !897, line: 198)
!1079 = !DISubprogram(name: "wcsxfrm", scope: !903, file: !903, line: 159, type: !1080, flags: DIFlagPrototyped, spFlags: 0)
!1080 = !DISubroutineType(types: !1081)
!1081 = !{!391, !460, !507, !391}
!1082 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1083, file: !897, line: 199)
!1083 = !DISubprogram(name: "wctob", scope: !903, file: !903, line: 313, type: !1084, flags: DIFlagPrototyped, spFlags: 0)
!1084 = !DISubroutineType(types: !1085)
!1085 = !{!28, !899}
!1086 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1087, file: !897, line: 200)
!1087 = !DISubprogram(name: "wmemcmp", scope: !903, file: !903, line: 283, type: !1044, flags: DIFlagPrototyped, spFlags: 0)
!1088 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1089, file: !897, line: 201)
!1089 = !DISubprogram(name: "wmemcpy", scope: !903, file: !903, line: 287, type: !1040, flags: DIFlagPrototyped, spFlags: 0)
!1090 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1091, file: !897, line: 202)
!1091 = !DISubprogram(name: "wmemmove", scope: !903, file: !903, line: 292, type: !1092, flags: DIFlagPrototyped, spFlags: 0)
!1092 = !DISubroutineType(types: !1093)
!1093 = !{!461, !461, !508, !391}
!1094 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1095, file: !897, line: 203)
!1095 = !DISubprogram(name: "wmemset", scope: !903, file: !903, line: 296, type: !1096, flags: DIFlagPrototyped, spFlags: 0)
!1096 = !DISubroutineType(types: !1097)
!1097 = !{!461, !461, !462, !391}
!1098 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1099, file: !897, line: 204)
!1099 = !DISubprogram(name: "wprintf", scope: !903, file: !903, line: 739, type: !1100, flags: DIFlagPrototyped, spFlags: 0)
!1100 = !DISubroutineType(types: !1101)
!1101 = !{!28, !507, null}
!1102 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1103, file: !897, line: 205)
!1103 = !DISubprogram(name: "wscanf", linkageName: "__isoc23_wscanf", scope: !903, file: !903, line: 799, type: !1100, flags: DIFlagPrototyped, spFlags: 0)
!1104 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1105, file: !897, line: 206)
!1105 = !DISubprogram(name: "wcschr", scope: !903, file: !903, line: 189, type: !1106, flags: DIFlagPrototyped, spFlags: 0)
!1106 = !DISubroutineType(types: !1107)
!1107 = !{!461, !508, !462}
!1108 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1109, file: !897, line: 207)
!1109 = !DISubprogram(name: "wcspbrk", scope: !903, file: !903, line: 226, type: !1110, flags: DIFlagPrototyped, spFlags: 0)
!1110 = !DISubroutineType(types: !1111)
!1111 = !{!461, !508, !508}
!1112 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1113, file: !897, line: 208)
!1113 = !DISubprogram(name: "wcsrchr", scope: !903, file: !903, line: 199, type: !1106, flags: DIFlagPrototyped, spFlags: 0)
!1114 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1115, file: !897, line: 209)
!1115 = !DISubprogram(name: "wcsstr", scope: !903, file: !903, line: 237, type: !1110, flags: DIFlagPrototyped, spFlags: 0)
!1116 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1117, file: !897, line: 210)
!1117 = !DISubprogram(name: "wmemchr", scope: !903, file: !903, line: 278, type: !1118, flags: DIFlagPrototyped, spFlags: 0)
!1118 = !DISubroutineType(types: !1119)
!1119 = !{!461, !508, !462, !391}
!1120 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !515, entity: !1121, file: !897, line: 251)
!1121 = !DISubprogram(name: "wcstold", scope: !903, file: !903, line: 409, type: !1122, flags: DIFlagPrototyped, spFlags: 0)
!1122 = !DISubroutineType(types: !1123)
!1123 = !{!105, !507, !1060}
!1124 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !515, entity: !1125, file: !897, line: 260)
!1125 = !DISubprogram(name: "wcstoll", linkageName: "__isoc23_wcstoll", scope: !903, file: !903, line: 508, type: !1126, flags: DIFlagPrototyped, spFlags: 0)
!1126 = !DISubroutineType(types: !1127)
!1127 = !{!5, !507, !1060, !28}
!1128 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !515, entity: !1129, file: !897, line: 261)
!1129 = !DISubprogram(name: "wcstoull", linkageName: "__isoc23_wcstoull", scope: !903, file: !903, line: 513, type: !1130, flags: DIFlagPrototyped, spFlags: 0)
!1130 = !DISubroutineType(types: !1131)
!1131 = !{!543, !507, !1060, !28}
!1132 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1121, file: !897, line: 267)
!1133 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1125, file: !897, line: 268)
!1134 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1129, file: !897, line: 269)
!1135 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1063, file: !897, line: 283)
!1136 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !991, file: !897, line: 286)
!1137 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !997, file: !897, line: 289)
!1138 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1005, file: !897, line: 292)
!1139 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1121, file: !897, line: 296)
!1140 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1125, file: !897, line: 297)
!1141 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1129, file: !897, line: 298)
!1142 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1143, file: !1145, line: 53)
!1143 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "lconv", file: !1144, line: 51, size: 768, flags: DIFlagFwdDecl, identifier: "_ZTS5lconv")
!1144 = !DIFile(filename: "/usr/include/locale.h", directory: "", checksumkind: CSK_MD5, checksum: "9fdf0d24f6e4cc61619b5e3258456dbf")
!1145 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/clocale", directory: "")
!1146 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1147, file: !1145, line: 54)
!1147 = !DISubprogram(name: "setlocale", scope: !1144, file: !1144, line: 122, type: !1148, flags: DIFlagPrototyped, spFlags: 0)
!1148 = !DISubroutineType(types: !1149)
!1149 = !{!439, !28, !271}
!1150 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1151, file: !1145, line: 55)
!1151 = !DISubprogram(name: "localeconv", scope: !1144, file: !1144, line: 125, type: !1152, flags: DIFlagPrototyped, spFlags: 0)
!1152 = !DISubroutineType(types: !1153)
!1153 = !{!1154}
!1154 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1143, size: 64)
!1155 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1156, file: !1158, line: 64)
!1156 = !DISubprogram(name: "isalnum", scope: !1157, file: !1157, line: 108, type: !26, flags: DIFlagPrototyped, spFlags: 0)
!1157 = !DIFile(filename: "/usr/include/ctype.h", directory: "", checksumkind: CSK_MD5, checksum: "04aab4fba8cc4c824a8f09075cc98b20")
!1158 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/cctype", directory: "")
!1159 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1160, file: !1158, line: 65)
!1160 = !DISubprogram(name: "isalpha", scope: !1157, file: !1157, line: 109, type: !26, flags: DIFlagPrototyped, spFlags: 0)
!1161 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1162, file: !1158, line: 66)
!1162 = !DISubprogram(name: "iscntrl", scope: !1157, file: !1157, line: 110, type: !26, flags: DIFlagPrototyped, spFlags: 0)
!1163 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1164, file: !1158, line: 67)
!1164 = !DISubprogram(name: "isdigit", scope: !1157, file: !1157, line: 111, type: !26, flags: DIFlagPrototyped, spFlags: 0)
!1165 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1166, file: !1158, line: 68)
!1166 = !DISubprogram(name: "isgraph", scope: !1157, file: !1157, line: 113, type: !26, flags: DIFlagPrototyped, spFlags: 0)
!1167 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1168, file: !1158, line: 69)
!1168 = !DISubprogram(name: "islower", scope: !1157, file: !1157, line: 112, type: !26, flags: DIFlagPrototyped, spFlags: 0)
!1169 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1170, file: !1158, line: 70)
!1170 = !DISubprogram(name: "isprint", scope: !1157, file: !1157, line: 114, type: !26, flags: DIFlagPrototyped, spFlags: 0)
!1171 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1172, file: !1158, line: 71)
!1172 = !DISubprogram(name: "ispunct", scope: !1157, file: !1157, line: 115, type: !26, flags: DIFlagPrototyped, spFlags: 0)
!1173 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1174, file: !1158, line: 72)
!1174 = !DISubprogram(name: "isspace", scope: !1157, file: !1157, line: 116, type: !26, flags: DIFlagPrototyped, spFlags: 0)
!1175 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1176, file: !1158, line: 73)
!1176 = !DISubprogram(name: "isupper", scope: !1157, file: !1157, line: 117, type: !26, flags: DIFlagPrototyped, spFlags: 0)
!1177 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1178, file: !1158, line: 74)
!1178 = !DISubprogram(name: "isxdigit", scope: !1157, file: !1157, line: 118, type: !26, flags: DIFlagPrototyped, spFlags: 0)
!1179 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1180, file: !1158, line: 75)
!1180 = !DISubprogram(name: "tolower", scope: !1157, file: !1157, line: 122, type: !26, flags: DIFlagPrototyped, spFlags: 0)
!1181 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1182, file: !1158, line: 76)
!1182 = !DISubprogram(name: "toupper", scope: !1157, file: !1157, line: 125, type: !26, flags: DIFlagPrototyped, spFlags: 0)
!1183 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1184, file: !1158, line: 87)
!1184 = !DISubprogram(name: "isblank", scope: !1157, file: !1157, line: 130, type: !26, flags: DIFlagPrototyped, spFlags: 0)
!1185 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1186, file: !1188, line: 98)
!1186 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !1187, line: 7, baseType: !913)
!1187 = !DIFile(filename: "/usr/include/bits/types/FILE.h", directory: "", checksumkind: CSK_MD5, checksum: "571f9fb6223c42439075fdde11a0de5d")
!1188 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/cstdio", directory: "")
!1189 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1190, file: !1188, line: 99)
!1190 = !DIDerivedType(tag: DW_TAG_typedef, name: "fpos_t", file: !1191, line: 84, baseType: !1192)
!1191 = !DIFile(filename: "/usr/include/stdio.h", directory: "", checksumkind: CSK_MD5, checksum: "600479e30522c60809530fc01f232b17")
!1192 = !DIDerivedType(tag: DW_TAG_typedef, name: "__fpos_t", file: !1193, line: 14, baseType: !1194)
!1193 = !DIFile(filename: "/usr/include/bits/types/__fpos_t.h", directory: "", checksumkind: CSK_MD5, checksum: "32de8bdaf3551a6c0a9394f9af4389ce")
!1194 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_G_fpos_t", file: !1193, line: 10, size: 128, flags: DIFlagFwdDecl, identifier: "_ZTS9_G_fpos_t")
!1195 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1196, file: !1188, line: 101)
!1196 = !DISubprogram(name: "clearerr", scope: !1191, file: !1191, line: 844, type: !1197, flags: DIFlagPrototyped, spFlags: 0)
!1197 = !DISubroutineType(types: !1198)
!1198 = !{null, !1199}
!1199 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1186, size: 64)
!1200 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1201, file: !1188, line: 102)
!1201 = !DISubprogram(name: "fclose", scope: !1191, file: !1191, line: 183, type: !1202, flags: DIFlagPrototyped, spFlags: 0)
!1202 = !DISubroutineType(types: !1203)
!1203 = !{!28, !1199}
!1204 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1205, file: !1188, line: 103)
!1205 = !DISubprogram(name: "feof", scope: !1191, file: !1191, line: 846, type: !1202, flags: DIFlagPrototyped, spFlags: 0)
!1206 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1207, file: !1188, line: 104)
!1207 = !DISubprogram(name: "ferror", scope: !1191, file: !1191, line: 848, type: !1202, flags: DIFlagPrototyped, spFlags: 0)
!1208 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1209, file: !1188, line: 105)
!1209 = !DISubprogram(name: "fflush", scope: !1191, file: !1191, line: 235, type: !1202, flags: DIFlagPrototyped, spFlags: 0)
!1210 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1211, file: !1188, line: 106)
!1211 = !DISubprogram(name: "fgetc", scope: !1191, file: !1191, line: 571, type: !1202, flags: DIFlagPrototyped, spFlags: 0)
!1212 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1213, file: !1188, line: 107)
!1213 = !DISubprogram(name: "fgetpos", scope: !1191, file: !1191, line: 818, type: !1214, flags: DIFlagPrototyped, spFlags: 0)
!1214 = !DISubroutineType(types: !1215)
!1215 = !{!28, !1216, !1217}
!1216 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1199)
!1217 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1218)
!1218 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1190, size: 64)
!1219 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1220, file: !1188, line: 108)
!1220 = !DISubprogram(name: "fgets", scope: !1191, file: !1191, line: 650, type: !1221, flags: DIFlagPrototyped, spFlags: 0)
!1221 = !DISubroutineType(types: !1222)
!1222 = !{!439, !506, !28, !1216}
!1223 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1224, file: !1188, line: 109)
!1224 = !DISubprogram(name: "fopen", scope: !1191, file: !1191, line: 263, type: !1225, flags: DIFlagPrototyped, spFlags: 0)
!1225 = !DISubroutineType(types: !1226)
!1226 = !{!1199, !463, !463}
!1227 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1228, file: !1188, line: 110)
!1228 = !DISubprogram(name: "fprintf", scope: !1191, file: !1191, line: 355, type: !1229, flags: DIFlagPrototyped, spFlags: 0)
!1229 = !DISubroutineType(types: !1230)
!1230 = !{!28, !1216, !463, null}
!1231 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1232, file: !1188, line: 111)
!1232 = !DISubprogram(name: "fputc", scope: !1191, file: !1191, line: 607, type: !1233, flags: DIFlagPrototyped, spFlags: 0)
!1233 = !DISubroutineType(types: !1234)
!1234 = !{!28, !28, !1199}
!1235 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1236, file: !1188, line: 112)
!1236 = !DISubprogram(name: "fputs", scope: !1191, file: !1191, line: 713, type: !1237, flags: DIFlagPrototyped, spFlags: 0)
!1237 = !DISubroutineType(types: !1238)
!1238 = !{!28, !463, !1216}
!1239 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1240, file: !1188, line: 113)
!1240 = !DISubprogram(name: "fread", scope: !1191, file: !1191, line: 733, type: !1241, flags: DIFlagPrototyped, spFlags: 0)
!1241 = !DISubroutineType(types: !1242)
!1242 = !{!391, !1243, !391, !391, !1216}
!1243 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !390)
!1244 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1245, file: !1188, line: 114)
!1245 = !DISubprogram(name: "freopen", scope: !1191, file: !1191, line: 270, type: !1246, flags: DIFlagPrototyped, spFlags: 0)
!1246 = !DISubroutineType(types: !1247)
!1247 = !{!1199, !463, !463, !1216}
!1248 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1249, file: !1188, line: 115)
!1249 = !DISubprogram(name: "fscanf", linkageName: "__isoc23_fscanf", scope: !1191, file: !1191, line: 440, type: !1229, flags: DIFlagPrototyped, spFlags: 0)
!1250 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1251, file: !1188, line: 116)
!1251 = !DISubprogram(name: "fseek", scope: !1191, file: !1191, line: 771, type: !1252, flags: DIFlagPrototyped, spFlags: 0)
!1252 = !DISubroutineType(types: !1253)
!1253 = !{!28, !1199, !252, !28}
!1254 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1255, file: !1188, line: 117)
!1255 = !DISubprogram(name: "fsetpos", scope: !1191, file: !1191, line: 823, type: !1256, flags: DIFlagPrototyped, spFlags: 0)
!1256 = !DISubroutineType(types: !1257)
!1257 = !{!28, !1199, !1258}
!1258 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1259, size: 64)
!1259 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1190)
!1260 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1261, file: !1188, line: 118)
!1261 = !DISubprogram(name: "ftell", scope: !1191, file: !1191, line: 776, type: !1262, flags: DIFlagPrototyped, spFlags: 0)
!1262 = !DISubroutineType(types: !1263)
!1263 = !{!252, !1199}
!1264 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1265, file: !1188, line: 119)
!1265 = !DISubprogram(name: "fwrite", scope: !1191, file: !1191, line: 739, type: !1266, flags: DIFlagPrototyped, spFlags: 0)
!1266 = !DISubroutineType(types: !1267)
!1267 = !{!391, !1268, !391, !391, !1216}
!1268 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !415)
!1269 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1270, file: !1188, line: 120)
!1270 = !DISubprogram(name: "getc", scope: !1191, file: !1191, line: 572, type: !1202, flags: DIFlagPrototyped, spFlags: 0)
!1271 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1272, file: !1188, line: 121)
!1272 = !DISubprogram(name: "getchar", scope: !1191, file: !1191, line: 578, type: !476, flags: DIFlagPrototyped, spFlags: 0)
!1273 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1274, file: !1188, line: 126)
!1274 = !DISubprogram(name: "perror", scope: !1191, file: !1191, line: 862, type: !1275, flags: DIFlagPrototyped, spFlags: 0)
!1275 = !DISubroutineType(types: !1276)
!1276 = !{null, !271}
!1277 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1278, file: !1188, line: 127)
!1278 = !DISubprogram(name: "printf", scope: !1191, file: !1191, line: 361, type: !1279, flags: DIFlagPrototyped, spFlags: 0)
!1279 = !DISubroutineType(types: !1280)
!1280 = !{!28, !463, null}
!1281 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1282, file: !1188, line: 128)
!1282 = !DISubprogram(name: "putc", scope: !1191, file: !1191, line: 608, type: !1233, flags: DIFlagPrototyped, spFlags: 0)
!1283 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1284, file: !1188, line: 129)
!1284 = !DISubprogram(name: "putchar", scope: !1191, file: !1191, line: 614, type: !26, flags: DIFlagPrototyped, spFlags: 0)
!1285 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1286, file: !1188, line: 130)
!1286 = !DISubprogram(name: "puts", scope: !1191, file: !1191, line: 719, type: !405, flags: DIFlagPrototyped, spFlags: 0)
!1287 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1288, file: !1188, line: 131)
!1288 = !DISubprogram(name: "remove", scope: !1191, file: !1191, line: 157, type: !405, flags: DIFlagPrototyped, spFlags: 0)
!1289 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1290, file: !1188, line: 132)
!1290 = !DISubprogram(name: "rename", scope: !1191, file: !1191, line: 159, type: !1291, flags: DIFlagPrototyped, spFlags: 0)
!1291 = !DISubroutineType(types: !1292)
!1292 = !{!28, !271, !271}
!1293 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1294, file: !1188, line: 133)
!1294 = !DISubprogram(name: "rewind", scope: !1191, file: !1191, line: 781, type: !1197, flags: DIFlagPrototyped, spFlags: 0)
!1295 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1296, file: !1188, line: 134)
!1296 = !DISubprogram(name: "scanf", linkageName: "__isoc23_scanf", scope: !1191, file: !1191, line: 443, type: !1279, flags: DIFlagPrototyped, spFlags: 0)
!1297 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1298, file: !1188, line: 135)
!1298 = !DISubprogram(name: "setbuf", scope: !1191, file: !1191, line: 333, type: !1299, flags: DIFlagPrototyped, spFlags: 0)
!1299 = !DISubroutineType(types: !1300)
!1300 = !{null, !1216, !506}
!1301 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1302, file: !1188, line: 136)
!1302 = !DISubprogram(name: "setvbuf", scope: !1191, file: !1191, line: 337, type: !1303, flags: DIFlagPrototyped, spFlags: 0)
!1303 = !DISubroutineType(types: !1304)
!1304 = !{!28, !1216, !506, !28, !391}
!1305 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1306, file: !1188, line: 137)
!1306 = !DISubprogram(name: "sprintf", scope: !1191, file: !1191, line: 363, type: !1307, flags: DIFlagPrototyped, spFlags: 0)
!1307 = !DISubroutineType(types: !1308)
!1308 = !{!28, !506, !463, null}
!1309 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1310, file: !1188, line: 138)
!1310 = !DISubprogram(name: "sscanf", linkageName: "__isoc23_sscanf", scope: !1191, file: !1191, line: 445, type: !1311, flags: DIFlagPrototyped, spFlags: 0)
!1311 = !DISubroutineType(types: !1312)
!1312 = !{!28, !463, !463, null}
!1313 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1314, file: !1188, line: 139)
!1314 = !DISubprogram(name: "tmpfile", scope: !1191, file: !1191, line: 193, type: !1315, flags: DIFlagPrototyped, spFlags: 0)
!1315 = !DISubroutineType(types: !1316)
!1316 = !{!1199}
!1317 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1318, file: !1188, line: 141)
!1318 = !DISubprogram(name: "tmpnam", scope: !1191, file: !1191, line: 210, type: !1319, flags: DIFlagPrototyped, spFlags: 0)
!1319 = !DISubroutineType(types: !1320)
!1320 = !{!439, !439}
!1321 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1322, file: !1188, line: 143)
!1322 = !DISubprogram(name: "ungetc", scope: !1191, file: !1191, line: 726, type: !1233, flags: DIFlagPrototyped, spFlags: 0)
!1323 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1324, file: !1188, line: 144)
!1324 = !DISubprogram(name: "vfprintf", scope: !1191, file: !1191, line: 370, type: !1325, flags: DIFlagPrototyped, spFlags: 0)
!1325 = !DISubroutineType(types: !1326)
!1326 = !{!28, !1216, !463, !987}
!1327 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1328, file: !1188, line: 145)
!1328 = !DISubprogram(name: "vprintf", scope: !1191, file: !1191, line: 376, type: !1329, flags: DIFlagPrototyped, spFlags: 0)
!1329 = !DISubroutineType(types: !1330)
!1330 = !{!28, !463, !987}
!1331 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1332, file: !1188, line: 146)
!1332 = !DISubprogram(name: "vsprintf", scope: !1191, file: !1191, line: 378, type: !1333, flags: DIFlagPrototyped, spFlags: 0)
!1333 = !DISubroutineType(types: !1334)
!1334 = !{!28, !506, !463, !987}
!1335 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !515, entity: !1336, file: !1188, line: 175)
!1336 = !DISubprogram(name: "snprintf", scope: !1191, file: !1191, line: 383, type: !1337, flags: DIFlagPrototyped, spFlags: 0)
!1337 = !DISubroutineType(types: !1338)
!1338 = !{!28, !506, !391, !463, null}
!1339 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !515, entity: !1340, file: !1188, line: 176)
!1340 = !DISubprogram(name: "vfscanf", linkageName: "__isoc23_vfscanf", scope: !1191, file: !1191, line: 507, type: !1325, flags: DIFlagPrototyped, spFlags: 0)
!1341 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !515, entity: !1342, file: !1188, line: 177)
!1342 = !DISubprogram(name: "vscanf", linkageName: "__isoc23_vscanf", scope: !1191, file: !1191, line: 512, type: !1329, flags: DIFlagPrototyped, spFlags: 0)
!1343 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !515, entity: !1344, file: !1188, line: 178)
!1344 = !DISubprogram(name: "vsnprintf", scope: !1191, file: !1191, line: 387, type: !1345, flags: DIFlagPrototyped, spFlags: 0)
!1345 = !DISubroutineType(types: !1346)
!1346 = !{!28, !506, !391, !463, !987}
!1347 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !515, entity: !1348, file: !1188, line: 179)
!1348 = !DISubprogram(name: "vsscanf", linkageName: "__isoc23_vsscanf", scope: !1191, file: !1191, line: 515, type: !1349, flags: DIFlagPrototyped, spFlags: 0)
!1349 = !DISubroutineType(types: !1350)
!1350 = !{!28, !463, !463, !987}
!1351 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1336, file: !1188, line: 185)
!1352 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1340, file: !1188, line: 186)
!1353 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1342, file: !1188, line: 187)
!1354 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1344, file: !1188, line: 188)
!1355 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1348, file: !1188, line: 189)
!1356 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1357, file: !1363, line: 58)
!1357 = !DIDerivedType(tag: DW_TAG_typedef, name: "max_align_t", file: !1358, line: 24, baseType: !1359)
!1358 = !DIFile(filename: "/opt/rocm-6.4.2/lib/llvm/lib/clang/19/include/__stddef_max_align_t.h", directory: "", checksumkind: CSK_MD5, checksum: "3c0a2f19d136d39aa835c737c7105def")
!1359 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1358, line: 19, size: 128, flags: DIFlagTypePassByValue, elements: !1360, identifier: "_ZTS11max_align_t")
!1360 = !{!1361, !1362}
!1361 = !DIDerivedType(tag: DW_TAG_member, name: "__clang_max_align_nonce1", scope: !1359, file: !1358, line: 20, baseType: !5, size: 64, align: 64)
!1362 = !DIDerivedType(tag: DW_TAG_member, name: "__clang_max_align_nonce2", scope: !1359, file: !1358, line: 22, baseType: !105, size: 64, align: 64, offset: 64)
!1363 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/cstddef", directory: "")
!1364 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1365, file: !1370, line: 82)
!1365 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctrans_t", file: !1366, line: 48, baseType: !1367)
!1366 = !DIFile(filename: "/usr/include/wctype.h", directory: "", checksumkind: CSK_MD5, checksum: "93d4b1045b46d132ff5e6d83a26abaee")
!1367 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1368, size: 64)
!1368 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1369)
!1369 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !13, line: 41, baseType: !28)
!1370 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/cwctype", directory: "")
!1371 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1372, file: !1370, line: 83)
!1372 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctype_t", file: !1373, line: 38, baseType: !393)
!1373 = !DIFile(filename: "/usr/include/bits/wctype-wchar.h", directory: "", checksumkind: CSK_MD5, checksum: "65a194b61bfadb7760be04a5640f774f")
!1374 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !899, file: !1370, line: 84)
!1375 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1376, file: !1370, line: 86)
!1376 = !DISubprogram(name: "iswalnum", scope: !1373, file: !1373, line: 95, type: !1084, flags: DIFlagPrototyped, spFlags: 0)
!1377 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1378, file: !1370, line: 87)
!1378 = !DISubprogram(name: "iswalpha", scope: !1373, file: !1373, line: 101, type: !1084, flags: DIFlagPrototyped, spFlags: 0)
!1379 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1380, file: !1370, line: 89)
!1380 = !DISubprogram(name: "iswblank", scope: !1373, file: !1373, line: 146, type: !1084, flags: DIFlagPrototyped, spFlags: 0)
!1381 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1382, file: !1370, line: 91)
!1382 = !DISubprogram(name: "iswcntrl", scope: !1373, file: !1373, line: 104, type: !1084, flags: DIFlagPrototyped, spFlags: 0)
!1383 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1384, file: !1370, line: 92)
!1384 = !DISubprogram(name: "iswctype", scope: !1373, file: !1373, line: 159, type: !1385, flags: DIFlagPrototyped, spFlags: 0)
!1385 = !DISubroutineType(types: !1386)
!1386 = !{!28, !899, !1372}
!1387 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1388, file: !1370, line: 93)
!1388 = !DISubprogram(name: "iswdigit", scope: !1373, file: !1373, line: 108, type: !1084, flags: DIFlagPrototyped, spFlags: 0)
!1389 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1390, file: !1370, line: 94)
!1390 = !DISubprogram(name: "iswgraph", scope: !1373, file: !1373, line: 112, type: !1084, flags: DIFlagPrototyped, spFlags: 0)
!1391 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1392, file: !1370, line: 95)
!1392 = !DISubprogram(name: "iswlower", scope: !1373, file: !1373, line: 117, type: !1084, flags: DIFlagPrototyped, spFlags: 0)
!1393 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1394, file: !1370, line: 96)
!1394 = !DISubprogram(name: "iswprint", scope: !1373, file: !1373, line: 120, type: !1084, flags: DIFlagPrototyped, spFlags: 0)
!1395 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1396, file: !1370, line: 97)
!1396 = !DISubprogram(name: "iswpunct", scope: !1373, file: !1373, line: 125, type: !1084, flags: DIFlagPrototyped, spFlags: 0)
!1397 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1398, file: !1370, line: 98)
!1398 = !DISubprogram(name: "iswspace", scope: !1373, file: !1373, line: 130, type: !1084, flags: DIFlagPrototyped, spFlags: 0)
!1399 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1400, file: !1370, line: 99)
!1400 = !DISubprogram(name: "iswupper", scope: !1373, file: !1373, line: 135, type: !1084, flags: DIFlagPrototyped, spFlags: 0)
!1401 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1402, file: !1370, line: 100)
!1402 = !DISubprogram(name: "iswxdigit", scope: !1373, file: !1373, line: 140, type: !1084, flags: DIFlagPrototyped, spFlags: 0)
!1403 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1404, file: !1370, line: 101)
!1404 = !DISubprogram(name: "towctrans", scope: !1366, file: !1366, line: 55, type: !1405, flags: DIFlagPrototyped, spFlags: 0)
!1405 = !DISubroutineType(types: !1406)
!1406 = !{!899, !899, !1365}
!1407 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1408, file: !1370, line: 102)
!1408 = !DISubprogram(name: "towlower", scope: !1373, file: !1373, line: 166, type: !1409, flags: DIFlagPrototyped, spFlags: 0)
!1409 = !DISubroutineType(types: !1410)
!1410 = !{!899, !899}
!1411 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1412, file: !1370, line: 103)
!1412 = !DISubprogram(name: "towupper", scope: !1373, file: !1373, line: 169, type: !1409, flags: DIFlagPrototyped, spFlags: 0)
!1413 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1414, file: !1370, line: 104)
!1414 = !DISubprogram(name: "wctrans", scope: !1366, file: !1366, line: 52, type: !1415, flags: DIFlagPrototyped, spFlags: 0)
!1415 = !DISubroutineType(types: !1416)
!1416 = !{!1365, !271}
!1417 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1418, file: !1370, line: 105)
!1418 = !DISubprogram(name: "wctype", scope: !1373, file: !1373, line: 155, type: !1419, flags: DIFlagPrototyped, spFlags: 0)
!1419 = !DISubroutineType(types: !1420)
!1420 = !{!1372, !271}
!1421 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1422, file: !1426, line: 51)
!1422 = !DIDerivedType(tag: DW_TAG_typedef, name: "int8_t", file: !1423, line: 24, baseType: !1424)
!1423 = !DIFile(filename: "/usr/include/bits/stdint-intn.h", directory: "", checksumkind: CSK_MD5, checksum: "85f68316edee664d7bd685b977adf677")
!1424 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int8_t", file: !13, line: 37, baseType: !1425)
!1425 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!1426 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/cstdint", directory: "")
!1427 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1428, file: !1426, line: 52)
!1428 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !1423, line: 25, baseType: !1429)
!1429 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int16_t", file: !13, line: 39, baseType: !1430)
!1430 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!1431 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1432, file: !1426, line: 53)
!1432 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !1423, line: 26, baseType: !1369)
!1433 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1434, file: !1426, line: 54)
!1434 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !1423, line: 27, baseType: !1435)
!1435 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !13, line: 44, baseType: !252)
!1436 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1437, file: !1426, line: 56)
!1437 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast8_t", file: !1438, line: 58, baseType: !1425)
!1438 = !DIFile(filename: "/usr/include/stdint.h", directory: "", checksumkind: CSK_MD5, checksum: "e1a448af0fce22a39bc183d2915834c7")
!1439 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1440, file: !1426, line: 57)
!1440 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast16_t", file: !1438, line: 60, baseType: !252)
!1441 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1442, file: !1426, line: 58)
!1442 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast32_t", file: !1438, line: 61, baseType: !252)
!1443 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1444, file: !1426, line: 59)
!1444 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast64_t", file: !1438, line: 62, baseType: !252)
!1445 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1446, file: !1426, line: 61)
!1446 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least8_t", file: !1438, line: 43, baseType: !1447)
!1447 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least8_t", file: !13, line: 52, baseType: !1424)
!1448 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1449, file: !1426, line: 62)
!1449 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least16_t", file: !1438, line: 44, baseType: !1450)
!1450 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least16_t", file: !13, line: 54, baseType: !1429)
!1451 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1452, file: !1426, line: 63)
!1452 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least32_t", file: !1438, line: 45, baseType: !1453)
!1453 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least32_t", file: !13, line: 56, baseType: !1369)
!1454 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1455, file: !1426, line: 64)
!1455 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least64_t", file: !1438, line: 46, baseType: !1456)
!1456 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least64_t", file: !13, line: 58, baseType: !1435)
!1457 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1458, file: !1426, line: 66)
!1458 = !DIDerivedType(tag: DW_TAG_typedef, name: "intmax_t", file: !1438, line: 101, baseType: !1459)
!1459 = !DIDerivedType(tag: DW_TAG_typedef, name: "__intmax_t", file: !13, line: 72, baseType: !252)
!1460 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1461, file: !1426, line: 67)
!1461 = !DIDerivedType(tag: DW_TAG_typedef, name: "intptr_t", file: !1438, line: 87, baseType: !252)
!1462 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1463, file: !1426, line: 69)
!1463 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !11, line: 24, baseType: !1464)
!1464 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !13, line: 38, baseType: !1465)
!1465 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!1466 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1467, file: !1426, line: 70)
!1467 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !11, line: 25, baseType: !1468)
!1468 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !13, line: 40, baseType: !1469)
!1469 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!1470 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !10, file: !1426, line: 71)
!1471 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1472, file: !1426, line: 72)
!1472 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !11, line: 27, baseType: !1473)
!1473 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint64_t", file: !13, line: 45, baseType: !393)
!1474 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1475, file: !1426, line: 74)
!1475 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast8_t", file: !1438, line: 71, baseType: !1465)
!1476 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1477, file: !1426, line: 75)
!1477 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast16_t", file: !1438, line: 73, baseType: !393)
!1478 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1479, file: !1426, line: 76)
!1479 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast32_t", file: !1438, line: 74, baseType: !393)
!1480 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1481, file: !1426, line: 77)
!1481 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast64_t", file: !1438, line: 75, baseType: !393)
!1482 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1483, file: !1426, line: 79)
!1483 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least8_t", file: !1438, line: 49, baseType: !1484)
!1484 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least8_t", file: !13, line: 53, baseType: !1464)
!1485 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1486, file: !1426, line: 80)
!1486 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least16_t", file: !1438, line: 50, baseType: !1487)
!1487 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least16_t", file: !13, line: 55, baseType: !1468)
!1488 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1489, file: !1426, line: 81)
!1489 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least32_t", file: !1438, line: 51, baseType: !1490)
!1490 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least32_t", file: !13, line: 57, baseType: !12)
!1491 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1492, file: !1426, line: 82)
!1492 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least64_t", file: !1438, line: 52, baseType: !1493)
!1493 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least64_t", file: !13, line: 59, baseType: !1473)
!1494 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1495, file: !1426, line: 84)
!1495 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintmax_t", file: !1438, line: 102, baseType: !1496)
!1496 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uintmax_t", file: !13, line: 73, baseType: !393)
!1497 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1498, file: !1426, line: 85)
!1498 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintptr_t", file: !1438, line: 90, baseType: !393)
!1499 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1500, file: !1503, line: 60)
!1500 = !DIDerivedType(tag: DW_TAG_typedef, name: "clock_t", file: !1501, line: 7, baseType: !1502)
!1501 = !DIFile(filename: "/usr/include/bits/types/clock_t.h", directory: "", checksumkind: CSK_MD5, checksum: "1aade99fd778d1551600c7ca1410b9f1")
!1502 = !DIDerivedType(tag: DW_TAG_typedef, name: "__clock_t", file: !13, line: 156, baseType: !252)
!1503 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/ctime", directory: "")
!1504 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1505, file: !1503, line: 61)
!1505 = !DIDerivedType(tag: DW_TAG_typedef, name: "time_t", file: !1506, line: 10, baseType: !1507)
!1506 = !DIFile(filename: "/usr/include/bits/types/time_t.h", directory: "", checksumkind: CSK_MD5, checksum: "5c299a4954617c88bb03645c7864e1b1")
!1507 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !13, line: 160, baseType: !252)
!1508 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1033, file: !1503, line: 62)
!1509 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1510, file: !1503, line: 64)
!1510 = !DISubprogram(name: "clock", scope: !1511, file: !1511, line: 72, type: !1512, flags: DIFlagPrototyped, spFlags: 0)
!1511 = !DIFile(filename: "/usr/include/time.h", directory: "", checksumkind: CSK_MD5, checksum: "19daa87a550fdc2d68d9b199f5473f94")
!1512 = !DISubroutineType(types: !1513)
!1513 = !{!1500}
!1514 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1515, file: !1503, line: 65)
!1515 = !DISubprogram(name: "difftime", scope: !1511, file: !1511, line: 79, type: !1516, flags: DIFlagPrototyped, spFlags: 0)
!1516 = !DISubroutineType(types: !1517)
!1517 = !{!35, !1505, !1505}
!1518 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1519, file: !1503, line: 66)
!1519 = !DISubprogram(name: "mktime", scope: !1511, file: !1511, line: 83, type: !1520, flags: DIFlagPrototyped, spFlags: 0)
!1520 = !DISubroutineType(types: !1521)
!1521 = !{!1505, !1522}
!1522 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1033, size: 64)
!1523 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1524, file: !1503, line: 67)
!1524 = !DISubprogram(name: "time", scope: !1511, file: !1511, line: 76, type: !1525, flags: DIFlagPrototyped, spFlags: 0)
!1525 = !DISubroutineType(types: !1526)
!1526 = !{!1505, !1527}
!1527 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1505, size: 64)
!1528 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1529, file: !1503, line: 68)
!1529 = !DISubprogram(name: "asctime", scope: !1511, file: !1511, line: 180, type: !1530, flags: DIFlagPrototyped, spFlags: 0)
!1530 = !DISubroutineType(types: !1531)
!1531 = !{!439, !1031}
!1532 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1533, file: !1503, line: 69)
!1533 = !DISubprogram(name: "ctime", scope: !1511, file: !1511, line: 184, type: !1534, flags: DIFlagPrototyped, spFlags: 0)
!1534 = !DISubroutineType(types: !1535)
!1535 = !{!439, !1536}
!1536 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1537, size: 64)
!1537 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1505)
!1538 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1539, file: !1503, line: 70)
!1539 = !DISubprogram(name: "gmtime", scope: !1511, file: !1511, line: 133, type: !1540, flags: DIFlagPrototyped, spFlags: 0)
!1540 = !DISubroutineType(types: !1541)
!1541 = !{!1522, !1536}
!1542 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1543, file: !1503, line: 71)
!1543 = !DISubprogram(name: "localtime", scope: !1511, file: !1511, line: 137, type: !1540, flags: DIFlagPrototyped, spFlags: 0)
!1544 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1545, file: !1503, line: 72)
!1545 = !DISubprogram(name: "strftime", scope: !1511, file: !1511, line: 100, type: !1546, flags: DIFlagPrototyped, spFlags: 0)
!1546 = !DISubroutineType(types: !1547)
!1547 = !{!391, !506, !391, !463, !1030}
!1548 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1549, file: !1503, line: 79)
!1549 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timespec", file: !1550, line: 11, size: 128, flags: DIFlagTypePassByValue, elements: !1551, identifier: "_ZTS8timespec")
!1550 = !DIFile(filename: "/usr/include/bits/types/struct_timespec.h", directory: "", checksumkind: CSK_MD5, checksum: "55dc154df3f21a5aa944dcafba9b43f6")
!1551 = !{!1552, !1553}
!1552 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !1549, file: !1550, line: 16, baseType: !1507, size: 64)
!1553 = !DIDerivedType(tag: DW_TAG_member, name: "tv_nsec", scope: !1549, file: !1550, line: 21, baseType: !1554, size: 64, offset: 64)
!1554 = !DIDerivedType(tag: DW_TAG_typedef, name: "__syscall_slong_t", file: !13, line: 197, baseType: !252)
!1555 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1556, file: !1503, line: 80)
!1556 = !DISubprogram(name: "timespec_get", scope: !1511, file: !1511, line: 384, type: !1557, flags: DIFlagPrototyped, spFlags: 0)
!1557 = !DISubroutineType(types: !1558)
!1558 = !{!28, !1559, !28}
!1559 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1549, size: 64)
!1560 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !1561, entity: !1562, file: !1564, line: 1436)
!1561 = !DINamespace(name: "chrono", scope: !23)
!1562 = !DINamespace(name: "chrono_literals", scope: !1563, exportSymbols: true)
!1563 = !DINamespace(name: "literals", scope: !23, exportSymbols: true)
!1564 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/13/../../../../include/c++/13/bits/chrono.h", directory: "")
!1565 = !{i32 1, !"amdhsa_code_object_version", i32 600}
!1566 = !{i32 1, !"amdgpu_printf_kind", !"hostcall"}
!1567 = !{i32 7, !"Dwarf Version", i32 5}
!1568 = !{i32 2, !"Debug Info Version", i32 3}
!1569 = !{i32 1, !"wchar_size", i32 4}
!1570 = !{i32 8, !"PIC Level", i32 2}
!1571 = !{i32 7, !"frame-pointer", i32 2}
!1572 = !{!"AMD clang version 19.0.0git (https://github.com/RadeonOpenCompute/llvm-project roc-6.4.2 25224 d366fa84f3fdcbd4b10847ebd5db572ae12a34fb)"}
!1573 = !{i32 2, i32 0}
!1574 = distinct !DISubprogram(name: "__cxa_pure_virtual", scope: !1575, file: !1575, line: 37, type: !384, scopeLine: 37, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagDefinition, unit: !0)
!1575 = !DIFile(filename: "/opt/rocm-6.4.2/lib/llvm/lib/clang/19/include/__clang_hip_runtime_wrapper.h", directory: "", checksumkind: CSK_MD5, checksum: "3b4af0bdaa6ccc1fa2b6e310d2157303")
!1576 = !DILocation(line: 38, column: 5, scope: !1574)
!1577 = !DILocation(line: 39, column: 3, scope: !1574)
!1578 = distinct !DISubprogram(name: "__cxa_deleted_virtual", scope: !1575, file: !1575, line: 43, type: !384, scopeLine: 43, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagDefinition, unit: !0)
!1579 = !DILocation(line: 44, column: 5, scope: !1578)
!1580 = !DILocation(line: 45, column: 3, scope: !1578)
!1581 = distinct !DISubprogram(name: "__assert_fail", scope: !1582, file: !1582, line: 44, type: !1583, scopeLine: 48, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !1585)
!1582 = !DIFile(filename: "/opt/rocm-6.4.2/include/hip/amd_detail/hip_assert.h", directory: "", checksumkind: CSK_MD5, checksum: "a705f3fd54b4159bc676e001f217fb77")
!1583 = !DISubroutineType(types: !1584)
!1584 = !{null, !271, !271, !14, !271}
!1585 = !{!1586, !1587, !1588, !1589, !1590, !1594, !1595, !1596, !1598, !1600, !1602}
!1586 = !DILocalVariable(name: "assertion", arg: 1, scope: !1581, file: !1582, line: 44, type: !271)
!1587 = !DILocalVariable(name: "file", arg: 2, scope: !1581, file: !1582, line: 45, type: !271)
!1588 = !DILocalVariable(name: "line", arg: 3, scope: !1581, file: !1582, line: 46, type: !14)
!1589 = !DILocalVariable(name: "function", arg: 4, scope: !1581, file: !1582, line: 47, type: !271)
!1590 = !DILocalVariable(name: "fmt", scope: !1581, file: !1582, line: 49, type: !1591)
!1591 = !DICompositeType(tag: DW_TAG_array_type, baseType: !272, size: 376, elements: !1592)
!1592 = !{!1593}
!1593 = !DISubrange(count: 47)
!1594 = !DILocalVariable(name: "msg", scope: !1581, file: !1582, line: 68, type: !1472)
!1595 = !DILocalVariable(name: "len", scope: !1581, file: !1582, line: 69, type: !28)
!1596 = !DILocalVariable(name: "tmp", scope: !1597, file: !1582, line: 70, type: !271)
!1597 = distinct !DILexicalBlock(scope: !1581, file: !1582, line: 70, column: 3)
!1598 = !DILocalVariable(name: "tmp", scope: !1599, file: !1582, line: 72, type: !271)
!1599 = distinct !DILexicalBlock(scope: !1581, file: !1582, line: 72, column: 3)
!1600 = !DILocalVariable(name: "tmp", scope: !1601, file: !1582, line: 75, type: !271)
!1601 = distinct !DILexicalBlock(scope: !1581, file: !1582, line: 75, column: 3)
!1602 = !DILocalVariable(name: "tmp", scope: !1603, file: !1582, line: 77, type: !271)
!1603 = distinct !DILexicalBlock(scope: !1581, file: !1582, line: 77, column: 3)
!1604 = !DILocation(line: 44, column: 32, scope: !1581)
!1605 = !DILocation(line: 45, column: 32, scope: !1581)
!1606 = !DILocation(line: 46, column: 33, scope: !1581)
!1607 = !DILocation(line: 47, column: 32, scope: !1581)
!1608 = !DILocation(line: 49, column: 14, scope: !1581)
!1609 = !DILocation(line: 68, column: 8, scope: !1581)
!1610 = !DILocation(line: 68, column: 14, scope: !1581)
!1611 = !DILocation(line: 69, column: 7, scope: !1581)
!1612 = !DILocation(line: 70, column: 3, scope: !1581)
!1613 = !DILocation(line: 70, column: 3, scope: !1597)
!1614 = distinct !{!1614, !1613, !1613, !1615}
!1615 = !{!"llvm.loop.mustprogress"}
!1616 = !DILocation(line: 71, column: 40, scope: !1581)
!1617 = !DILocation(line: 71, column: 45, scope: !1581)
!1618 = !DILocation(line: 71, column: 50, scope: !1581)
!1619 = !DILocation(line: 71, column: 9, scope: !1581)
!1620 = !DILocation(line: 71, column: 7, scope: !1581)
!1621 = !DILocation(line: 72, column: 3, scope: !1581)
!1622 = !DILocation(line: 72, column: 3, scope: !1599)
!1623 = distinct !{!1623, !1622, !1622, !1615}
!1624 = !DILocation(line: 73, column: 40, scope: !1581)
!1625 = !DILocation(line: 73, column: 45, scope: !1581)
!1626 = !DILocation(line: 73, column: 51, scope: !1581)
!1627 = !DILocation(line: 73, column: 9, scope: !1581)
!1628 = !DILocation(line: 73, column: 7, scope: !1581)
!1629 = !DILocation(line: 74, column: 36, scope: !1581)
!1630 = !DILocation(line: 74, column: 44, scope: !1581)
!1631 = !DILocation(line: 74, column: 9, scope: !1581)
!1632 = !DILocation(line: 74, column: 7, scope: !1581)
!1633 = !DILocation(line: 75, column: 3, scope: !1581)
!1634 = !DILocation(line: 75, column: 3, scope: !1601)
!1635 = distinct !{!1635, !1634, !1634, !1615}
!1636 = !DILocation(line: 76, column: 40, scope: !1581)
!1637 = !DILocation(line: 76, column: 45, scope: !1581)
!1638 = !DILocation(line: 76, column: 55, scope: !1581)
!1639 = !DILocation(line: 76, column: 9, scope: !1581)
!1640 = !DILocation(line: 76, column: 7, scope: !1581)
!1641 = !DILocation(line: 77, column: 3, scope: !1581)
!1642 = !DILocation(line: 77, column: 3, scope: !1603)
!1643 = distinct !{!1643, !1642, !1642, !1615}
!1644 = !DILocation(line: 78, column: 34, scope: !1581)
!1645 = !DILocation(line: 78, column: 39, scope: !1581)
!1646 = !DILocation(line: 78, column: 50, scope: !1581)
!1647 = !DILocation(line: 78, column: 3, scope: !1581)
!1648 = !DILocation(line: 82, column: 3, scope: !1581)
!1649 = !DILocation(line: 83, column: 1, scope: !1581)
!1650 = distinct !DISubprogram(name: "__assertfail", scope: !1582, file: !1582, line: 86, type: !384, scopeLine: 87, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0)
!1651 = !DILocation(line: 89, column: 5, scope: !1650)
!1652 = !DILocation(line: 90, column: 1, scope: !1650)
!1653 = distinct !DISubprogram(name: "HPCC_starts", linkageName: "_Z11HPCC_startsx", scope: !4, file: !4, line: 20, type: !1654, scopeLine: 21, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !1657)
!1654 = !DISubroutineType(types: !1655)
!1655 = !{!1656, !3}
!1656 = !DIDerivedType(tag: DW_TAG_typedef, name: "u64Int", file: !4, line: 6, baseType: !543)
!1657 = !{!1658, !1659, !1660, !1661, !1665, !1666}
!1658 = !DILocalVariable(name: "n", arg: 1, scope: !1653, file: !4, line: 20, type: !3)
!1659 = !DILocalVariable(name: "i", scope: !1653, file: !4, line: 22, type: !28)
!1660 = !DILocalVariable(name: "j", scope: !1653, file: !4, line: 22, type: !28)
!1661 = !DILocalVariable(name: "m2", scope: !1653, file: !4, line: 23, type: !1662)
!1662 = !DICompositeType(tag: DW_TAG_array_type, baseType: !1656, size: 4096, elements: !1663)
!1663 = !{!1664}
!1664 = !DISubrange(count: 64)
!1665 = !DILocalVariable(name: "temp", scope: !1653, file: !4, line: 24, type: !1656)
!1666 = !DILocalVariable(name: "ran", scope: !1653, file: !4, line: 24, type: !1656)
!1667 = !DILocation(line: 20, column: 27, scope: !1653)
!1668 = !DILocation(line: 22, column: 7, scope: !1653)
!1669 = !DILocation(line: 22, column: 10, scope: !1653)
!1670 = !DILocation(line: 23, column: 10, scope: !1653)
!1671 = !DILocation(line: 24, column: 10, scope: !1653)
!1672 = !DILocation(line: 24, column: 16, scope: !1653)
!1673 = !DILocation(line: 26, column: 3, scope: !1653)
!1674 = !DILocation(line: 26, column: 10, scope: !1653)
!1675 = !DILocation(line: 26, column: 12, scope: !1653)
!1676 = !DILocation(line: 26, column: 19, scope: !1653)
!1677 = distinct !{!1677, !1673, !1678, !1615}
!1678 = !DILocation(line: 26, column: 22, scope: !1653)
!1679 = !DILocation(line: 27, column: 3, scope: !1653)
!1680 = !DILocation(line: 27, column: 10, scope: !1653)
!1681 = !DILocation(line: 27, column: 12, scope: !1653)
!1682 = !DILocation(line: 27, column: 24, scope: !1653)
!1683 = distinct !{!1683, !1679, !1684, !1615}
!1684 = !DILocation(line: 27, column: 27, scope: !1653)
!1685 = !DILocation(line: 28, column: 7, scope: !1686)
!1686 = distinct !DILexicalBlock(scope: !1653, file: !4, line: 28, column: 7)
!1687 = !DILocation(line: 28, column: 9, scope: !1686)
!1688 = !DILocation(line: 28, column: 7, scope: !1653)
!1689 = !DILocation(line: 28, column: 15, scope: !1686)
!1690 = !DILocation(line: 30, column: 8, scope: !1653)
!1691 = !DILocation(line: 33, column: 9, scope: !1692)
!1692 = distinct !DILexicalBlock(scope: !1653, file: !4, line: 33, column: 3)
!1693 = !DILocation(line: 33, column: 8, scope: !1692)
!1694 = !DILocation(line: 33, column: 13, scope: !1695)
!1695 = distinct !DILexicalBlock(scope: !1692, file: !4, line: 33, column: 3)
!1696 = !DILocation(line: 33, column: 14, scope: !1695)
!1697 = !DILocation(line: 33, column: 3, scope: !1692)
!1698 = !DILocation(line: 34, column: 13, scope: !1699)
!1699 = distinct !DILexicalBlock(scope: !1695, file: !4, line: 33, column: 24)
!1700 = !DILocation(line: 34, column: 8, scope: !1699)
!1701 = !DILocation(line: 34, column: 5, scope: !1699)
!1702 = !DILocation(line: 34, column: 11, scope: !1699)
!1703 = !DILocation(line: 35, column: 13, scope: !1699)
!1704 = !DILocation(line: 35, column: 18, scope: !1699)
!1705 = !DILocation(line: 35, column: 36, scope: !1699)
!1706 = !DILocation(line: 35, column: 41, scope: !1699)
!1707 = !DILocation(line: 35, column: 27, scope: !1699)
!1708 = !DILocation(line: 35, column: 24, scope: !1699)
!1709 = !DILocation(line: 35, column: 10, scope: !1699)
!1710 = !DILocation(line: 36, column: 13, scope: !1699)
!1711 = !DILocation(line: 36, column: 18, scope: !1699)
!1712 = !DILocation(line: 36, column: 36, scope: !1699)
!1713 = !DILocation(line: 36, column: 41, scope: !1699)
!1714 = !DILocation(line: 36, column: 27, scope: !1699)
!1715 = !DILocation(line: 36, column: 24, scope: !1699)
!1716 = !DILocation(line: 36, column: 10, scope: !1699)
!1717 = !DILocation(line: 37, column: 3, scope: !1699)
!1718 = !DILocation(line: 33, column: 20, scope: !1695)
!1719 = !DILocation(line: 33, column: 3, scope: !1695)
!1720 = distinct !{!1720, !1697, !1721, !1615, !1722}
!1721 = !DILocation(line: 37, column: 3, scope: !1692)
!1722 = !{!"llvm.loop.unroll.enable"}
!1723 = !DILocation(line: 39, column: 9, scope: !1724)
!1724 = distinct !DILexicalBlock(scope: !1653, file: !4, line: 39, column: 3)
!1725 = !DILocation(line: 39, column: 8, scope: !1724)
!1726 = !DILocation(line: 39, column: 14, scope: !1727)
!1727 = distinct !DILexicalBlock(scope: !1724, file: !4, line: 39, column: 3)
!1728 = !DILocation(line: 39, column: 15, scope: !1727)
!1729 = !DILocation(line: 39, column: 3, scope: !1724)
!1730 = !DILocation(line: 40, column: 10, scope: !1731)
!1731 = distinct !DILexicalBlock(scope: !1727, file: !4, line: 40, column: 9)
!1732 = !DILocation(line: 40, column: 15, scope: !1731)
!1733 = !DILocation(line: 40, column: 12, scope: !1731)
!1734 = !DILocation(line: 40, column: 18, scope: !1731)
!1735 = !DILocation(line: 40, column: 9, scope: !1731)
!1736 = !DILocation(line: 40, column: 9, scope: !1727)
!1737 = !DILocation(line: 41, column: 7, scope: !1731)
!1738 = !DILocation(line: 40, column: 20, scope: !1731)
!1739 = !DILocation(line: 39, column: 21, scope: !1727)
!1740 = !DILocation(line: 39, column: 3, scope: !1727)
!1741 = distinct !{!1741, !1729, !1742, !1615}
!1742 = !DILocation(line: 41, column: 7, scope: !1724)
!1743 = !DILocation(line: 43, column: 7, scope: !1653)
!1744 = !DILocation(line: 44, column: 3, scope: !1653)
!1745 = !DILocation(line: 44, column: 10, scope: !1653)
!1746 = !DILocation(line: 44, column: 12, scope: !1653)
!1747 = !DILocation(line: 45, column: 10, scope: !1748)
!1748 = distinct !DILexicalBlock(scope: !1653, file: !4, line: 44, column: 17)
!1749 = !DILocation(line: 47, column: 11, scope: !1750)
!1750 = distinct !DILexicalBlock(scope: !1748, file: !4, line: 47, column: 5)
!1751 = !DILocation(line: 47, column: 10, scope: !1750)
!1752 = !DILocation(line: 47, column: 15, scope: !1753)
!1753 = distinct !DILexicalBlock(scope: !1750, file: !4, line: 47, column: 5)
!1754 = !DILocation(line: 47, column: 16, scope: !1753)
!1755 = !DILocation(line: 47, column: 5, scope: !1750)
!1756 = !DILocation(line: 48, column: 12, scope: !1757)
!1757 = distinct !DILexicalBlock(scope: !1753, file: !4, line: 48, column: 11)
!1758 = !DILocation(line: 48, column: 19, scope: !1757)
!1759 = !DILocation(line: 48, column: 16, scope: !1757)
!1760 = !DILocation(line: 48, column: 22, scope: !1757)
!1761 = !DILocation(line: 48, column: 11, scope: !1757)
!1762 = !DILocation(line: 48, column: 11, scope: !1753)
!1763 = !DILocation(line: 49, column: 20, scope: !1757)
!1764 = !DILocation(line: 49, column: 17, scope: !1757)
!1765 = !DILocation(line: 49, column: 14, scope: !1757)
!1766 = !DILocation(line: 49, column: 9, scope: !1757)
!1767 = !DILocation(line: 48, column: 24, scope: !1757)
!1768 = !DILocation(line: 47, column: 22, scope: !1753)
!1769 = !DILocation(line: 47, column: 5, scope: !1753)
!1770 = distinct !{!1770, !1755, !1771, !1615, !1722}
!1771 = !DILocation(line: 49, column: 21, scope: !1750)
!1772 = !DILocation(line: 50, column: 11, scope: !1748)
!1773 = !DILocation(line: 50, column: 9, scope: !1748)
!1774 = !DILocation(line: 51, column: 7, scope: !1748)
!1775 = !DILocation(line: 52, column: 10, scope: !1776)
!1776 = distinct !DILexicalBlock(scope: !1748, file: !4, line: 52, column: 9)
!1777 = !DILocation(line: 52, column: 15, scope: !1776)
!1778 = !DILocation(line: 52, column: 12, scope: !1776)
!1779 = !DILocation(line: 52, column: 18, scope: !1776)
!1780 = !DILocation(line: 52, column: 9, scope: !1776)
!1781 = !DILocation(line: 52, column: 9, scope: !1748)
!1782 = !DILocation(line: 53, column: 14, scope: !1776)
!1783 = !DILocation(line: 53, column: 18, scope: !1776)
!1784 = !DILocation(line: 53, column: 36, scope: !1776)
!1785 = !DILocation(line: 53, column: 40, scope: !1776)
!1786 = !DILocation(line: 53, column: 27, scope: !1776)
!1787 = !DILocation(line: 53, column: 24, scope: !1776)
!1788 = !DILocation(line: 53, column: 11, scope: !1776)
!1789 = !DILocation(line: 53, column: 7, scope: !1776)
!1790 = distinct !{!1790, !1744, !1791, !1615}
!1791 = !DILocation(line: 54, column: 3, scope: !1653)
!1792 = !DILocation(line: 56, column: 10, scope: !1653)
!1793 = !DILocation(line: 56, column: 3, scope: !1653)
!1794 = !DILocation(line: 57, column: 1, scope: !1653)
!1795 = distinct !DISubprogram(name: "initTable", linkageName: "_Z9initTablePyy", scope: !4, file: !4, line: 59, type: !1796, scopeLine: 59, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !1800)
!1796 = !DISubroutineType(types: !1797)
!1797 = !{null, !1798, !1799}
!1798 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1656, size: 64)
!1799 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1656)
!1800 = !{!1801, !1802, !1803}
!1801 = !DILocalVariable(name: "Table", arg: 1, scope: !1795, file: !4, line: 59, type: !1798)
!1802 = !DILocalVariable(name: "TableSize", arg: 2, scope: !1795, file: !4, line: 59, type: !1799)
!1803 = !DILocalVariable(name: "i", scope: !1795, file: !4, line: 60, type: !28)
!1804 = !DILocation(line: 59, column: 36, scope: !1795)
!1805 = !DILocation(line: 59, column: 56, scope: !1795)
!1806 = !DILocation(line: 60, column: 7, scope: !1795)
!1807 = !DILocation(line: 270, column: 58, scope: !1808, inlinedAt: !1812)
!1808 = distinct !DISubprogram(name: "__hip_get_block_idx_x", linkageName: "_ZL21__hip_get_block_idx_xv", scope: !1809, file: !1809, line: 270, type: !1810, scopeLine: 270, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0)
!1809 = !DIFile(filename: "/opt/rocm-6.4.2/include/hip/amd_detail/amd_hip_runtime.h", directory: "", checksumkind: CSK_MD5, checksum: "38097f6211bac4e19f9ae3395b411f76")
!1810 = !DISubroutineType(types: !1811)
!1811 = !{!14}
!1812 = distinct !DILocation(line: 300, column: 3, scope: !1813, inlinedAt: !1825)
!1813 = distinct !DISubprogram(name: "__get_x", linkageName: "_ZN24__hip_builtin_blockIdx_t7__get_xEv", scope: !1814, file: !1809, line: 300, type: !1810, scopeLine: 300, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, declaration: !1816)
!1814 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__hip_builtin_blockIdx_t", file: !1809, line: 299, size: 8, flags: DIFlagTypePassByValue, elements: !1815, identifier: "_ZTS24__hip_builtin_blockIdx_t")
!1815 = !{!1816, !1817, !1818, !1819}
!1816 = !DISubprogram(name: "__get_x", linkageName: "_ZN24__hip_builtin_blockIdx_t7__get_xEv", scope: !1814, file: !1809, line: 300, type: !1810, scopeLine: 300, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!1817 = !DISubprogram(name: "__get_y", linkageName: "_ZN24__hip_builtin_blockIdx_t7__get_yEv", scope: !1814, file: !1809, line: 301, type: !1810, scopeLine: 301, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!1818 = !DISubprogram(name: "__get_z", linkageName: "_ZN24__hip_builtin_blockIdx_t7__get_zEv", scope: !1814, file: !1809, line: 302, type: !1810, scopeLine: 302, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!1819 = !DISubprogram(name: "operator dim3", linkageName: "_ZNK24__hip_builtin_blockIdx_tcv4dim3Ev", scope: !1814, file: !1809, line: 304, type: !1820, scopeLine: 304, flags: DIFlagPrototyped, spFlags: 0)
!1820 = !DISubroutineType(types: !1821)
!1821 = !{!1822, !1823}
!1822 = !DIDerivedType(tag: DW_TAG_typedef, name: "dim3", file: !7, line: 1186, baseType: !6)
!1823 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1824, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1824 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1814)
!1825 = distinct !DILocation(line: 60, column: 11, scope: !1795)
!1826 = !DILocation(line: 275, column: 58, scope: !1827, inlinedAt: !1828)
!1827 = distinct !DISubprogram(name: "__hip_get_block_dim_x", linkageName: "_ZL21__hip_get_block_dim_xv", scope: !1809, file: !1809, line: 275, type: !1810, scopeLine: 275, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0)
!1828 = distinct !DILocation(line: 309, column: 3, scope: !1829, inlinedAt: !1840)
!1829 = distinct !DISubprogram(name: "__get_x", linkageName: "_ZN24__hip_builtin_blockDim_t7__get_xEv", scope: !1830, file: !1809, line: 309, type: !1810, scopeLine: 309, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, declaration: !1832)
!1830 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__hip_builtin_blockDim_t", file: !1809, line: 308, size: 8, flags: DIFlagTypePassByValue, elements: !1831, identifier: "_ZTS24__hip_builtin_blockDim_t")
!1831 = !{!1832, !1833, !1834, !1835}
!1832 = !DISubprogram(name: "__get_x", linkageName: "_ZN24__hip_builtin_blockDim_t7__get_xEv", scope: !1830, file: !1809, line: 309, type: !1810, scopeLine: 309, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!1833 = !DISubprogram(name: "__get_y", linkageName: "_ZN24__hip_builtin_blockDim_t7__get_yEv", scope: !1830, file: !1809, line: 310, type: !1810, scopeLine: 310, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!1834 = !DISubprogram(name: "__get_z", linkageName: "_ZN24__hip_builtin_blockDim_t7__get_zEv", scope: !1830, file: !1809, line: 311, type: !1810, scopeLine: 311, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!1835 = !DISubprogram(name: "operator dim3", linkageName: "_ZNK24__hip_builtin_blockDim_tcv4dim3Ev", scope: !1830, file: !1809, line: 313, type: !1836, scopeLine: 313, flags: DIFlagPrototyped, spFlags: 0)
!1836 = !DISubroutineType(types: !1837)
!1837 = !{!1822, !1838}
!1838 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1839, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1839 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1830)
!1840 = distinct !DILocation(line: 60, column: 24, scope: !1795)
!1841 = !DILocation(line: 60, column: 22, scope: !1795)
!1842 = !DILocation(line: 265, column: 59, scope: !1843, inlinedAt: !1844)
!1843 = distinct !DISubprogram(name: "__hip_get_thread_idx_x", linkageName: "_ZL22__hip_get_thread_idx_xv", scope: !1809, file: !1809, line: 265, type: !1810, scopeLine: 265, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0)
!1844 = distinct !DILocation(line: 291, column: 3, scope: !1845, inlinedAt: !1856)
!1845 = distinct !DISubprogram(name: "__get_x", linkageName: "_ZN25__hip_builtin_threadIdx_t7__get_xEv", scope: !1846, file: !1809, line: 291, type: !1810, scopeLine: 291, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, declaration: !1848)
!1846 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__hip_builtin_threadIdx_t", file: !1809, line: 290, size: 8, flags: DIFlagTypePassByValue, elements: !1847, identifier: "_ZTS25__hip_builtin_threadIdx_t")
!1847 = !{!1848, !1849, !1850, !1851}
!1848 = !DISubprogram(name: "__get_x", linkageName: "_ZN25__hip_builtin_threadIdx_t7__get_xEv", scope: !1846, file: !1809, line: 291, type: !1810, scopeLine: 291, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!1849 = !DISubprogram(name: "__get_y", linkageName: "_ZN25__hip_builtin_threadIdx_t7__get_yEv", scope: !1846, file: !1809, line: 292, type: !1810, scopeLine: 292, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!1850 = !DISubprogram(name: "__get_z", linkageName: "_ZN25__hip_builtin_threadIdx_t7__get_zEv", scope: !1846, file: !1809, line: 293, type: !1810, scopeLine: 293, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!1851 = !DISubprogram(name: "operator dim3", linkageName: "_ZNK25__hip_builtin_threadIdx_tcv4dim3Ev", scope: !1846, file: !1809, line: 295, type: !1852, scopeLine: 295, flags: DIFlagPrototyped, spFlags: 0)
!1852 = !DISubroutineType(types: !1853)
!1853 = !{!1822, !1854}
!1854 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1855, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1855 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1846)
!1856 = distinct !DILocation(line: 60, column: 37, scope: !1795)
!1857 = !DILocation(line: 60, column: 35, scope: !1795)
!1858 = !DILocation(line: 61, column: 7, scope: !1859)
!1859 = distinct !DILexicalBlock(scope: !1795, file: !4, line: 61, column: 7)
!1860 = !DILocation(line: 61, column: 11, scope: !1859)
!1861 = !DILocation(line: 61, column: 9, scope: !1859)
!1862 = !DILocation(line: 61, column: 7, scope: !1795)
!1863 = !DILocation(line: 61, column: 33, scope: !1859)
!1864 = !DILocation(line: 61, column: 22, scope: !1859)
!1865 = !DILocation(line: 61, column: 28, scope: !1859)
!1866 = !DILocation(line: 61, column: 31, scope: !1859)
!1867 = !DILocation(line: 62, column: 1, scope: !1795)
!1868 = distinct !DISubprogram(name: "update", linkageName: "_Z6updatePyy", scope: !4, file: !4, line: 64, type: !1869, scopeLine: 65, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !1872)
!1869 = !DISubroutineType(types: !1870)
!1870 = !{null, !1871, !1799}
!1871 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1798)
!1872 = !{!1873, !1874, !1875, !1876, !1877}
!1873 = !DILocalVariable(name: "Table", arg: 1, scope: !1868, file: !4, line: 64, type: !1871)
!1874 = !DILocalVariable(name: "TableSize", arg: 2, scope: !1868, file: !4, line: 64, type: !1799)
!1875 = !DILocalVariable(name: "j", scope: !1868, file: !4, line: 66, type: !28)
!1876 = !DILocalVariable(name: "ran", scope: !1868, file: !4, line: 67, type: !1656)
!1877 = !DILocalVariable(name: "i", scope: !1878, file: !4, line: 68, type: !1656)
!1878 = distinct !DILexicalBlock(scope: !1868, file: !4, line: 68, column: 3)
!1879 = !DILocation(line: 64, column: 45, scope: !1868)
!1880 = !DILocation(line: 64, column: 65, scope: !1868)
!1881 = !DILocation(line: 66, column: 7, scope: !1868)
!1882 = !DILocation(line: 265, column: 59, scope: !1843, inlinedAt: !1883)
!1883 = distinct !DILocation(line: 291, column: 3, scope: !1845, inlinedAt: !1884)
!1884 = distinct !DILocation(line: 66, column: 11, scope: !1868)
!1885 = !DILocation(line: 67, column: 10, scope: !1868)
!1886 = !DILocation(line: 67, column: 30, scope: !1868)
!1887 = !DILocation(line: 67, column: 37, scope: !1868)
!1888 = !DILocation(line: 67, column: 45, scope: !1868)
!1889 = !DILocation(line: 67, column: 43, scope: !1868)
!1890 = !DILocation(line: 67, column: 16, scope: !1868)
!1891 = !DILocation(line: 68, column: 15, scope: !1878)
!1892 = !DILocation(line: 68, column: 8, scope: !1878)
!1893 = !DILocation(line: 68, column: 20, scope: !1894)
!1894 = distinct !DILexicalBlock(scope: !1878, file: !4, line: 68, column: 3)
!1895 = !DILocation(line: 68, column: 22, scope: !1894)
!1896 = !DILocation(line: 68, column: 29, scope: !1894)
!1897 = !DILocation(line: 68, column: 21, scope: !1894)
!1898 = !DILocation(line: 68, column: 3, scope: !1878)
!1899 = !DILocation(line: 69, column: 12, scope: !1900)
!1900 = distinct !DILexicalBlock(scope: !1894, file: !4, line: 68, column: 40)
!1901 = !DILocation(line: 69, column: 16, scope: !1900)
!1902 = !DILocation(line: 69, column: 34, scope: !1900)
!1903 = !DILocation(line: 69, column: 38, scope: !1900)
!1904 = !DILocation(line: 69, column: 25, scope: !1900)
!1905 = !DILocation(line: 69, column: 22, scope: !1900)
!1906 = !DILocation(line: 69, column: 9, scope: !1900)
!1907 = !DILocation(line: 70, column: 16, scope: !1900)
!1908 = !DILocation(line: 70, column: 22, scope: !1900)
!1909 = !DILocation(line: 70, column: 29, scope: !1900)
!1910 = !DILocation(line: 70, column: 38, scope: !1900)
!1911 = !DILocation(line: 70, column: 26, scope: !1900)
!1912 = !DILocation(line: 70, column: 44, scope: !1900)
!1913 = !DILocation(line: 70, column: 5, scope: !1900)
!1914 = !DILocation(line: 71, column: 3, scope: !1900)
!1915 = !DILocation(line: 68, column: 36, scope: !1894)
!1916 = !DILocation(line: 68, column: 3, scope: !1894)
!1917 = distinct !{!1917, !1898, !1918, !1615}
!1918 = !DILocation(line: 71, column: 3, scope: !1878)
!1919 = !DILocation(line: 72, column: 1, scope: !1868)
!1920 = distinct !DISubprogram(name: "atomicXor", linkageName: "_Z9atomicXorPyy", scope: !1921, file: !1921, line: 1309, type: !1922, scopeLine: 1309, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !1925)
!1921 = !DIFile(filename: "/opt/rocm-6.4.2/include/hip/amd_detail/amd_hip_atomic.h", directory: "", checksumkind: CSK_MD5, checksum: "ebf97c3a66e959f6dd7514927ddb211d")
!1922 = !DISubroutineType(types: !1923)
!1923 = !{!543, !1924, !543}
!1924 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !543, size: 64)
!1925 = !{!1926, !1927}
!1926 = !DILocalVariable(name: "address", arg: 1, scope: !1920, file: !1921, line: 1309, type: !1924)
!1927 = !DILocalVariable(name: "val", arg: 2, scope: !1920, file: !1921, line: 1309, type: !543)
!1928 = !DILocation(line: 1309, column: 50, scope: !1920)
!1929 = !DILocation(line: 1309, column: 78, scope: !1920)
!1930 = !DILocation(line: 1320, column: 33, scope: !1920)
!1931 = !DILocation(line: 1320, column: 42, scope: !1920)
!1932 = !DILocation(line: 1320, column: 10, scope: !1920)
!1933 = !DILocation(line: 1320, column: 3, scope: !1920)
!1934 = !{!1935, !1935, i64 0}
!1935 = !{!"int", !1936, i64 0}
!1936 = !{!"omnipotent char", !1937, i64 0}
!1937 = !{!"Simple C/C++ TBAA"}
!1938 = !{!1939, !1939, i64 0}
!1939 = !{!"long", !1936, i64 0}
!1940 = !{!1941, !1942, i64 0}
!1941 = !{!"", !1942, i64 0, !1942, i64 8, !1943, i64 16, !1939, i64 24, !1939, i64 32, !1939, i64 40}
!1942 = !{!"any pointer", !1936, i64 0}
!1943 = !{!"hsa_signal_s", !1939, i64 0}
!1944 = !{!1941, !1939, i64 40}
!1945 = !{!1941, !1942, i64 8}
!1946 = !{!1947, !1935, i64 16}
!1947 = !{!"", !1939, i64 0, !1939, i64 8, !1935, i64 16, !1935, i64 20}
!1948 = !{!1947, !1939, i64 8}
!1949 = !{!1947, !1935, i64 20}
!1950 = !{!1947, !1939, i64 0}
!1951 = !{!1952, !1939, i64 16}
!1952 = !{!"amd_signal_s", !1939, i64 0, !1936, i64 8, !1939, i64 16, !1935, i64 24, !1935, i64 28, !1939, i64 32, !1939, i64 40, !1936, i64 48, !1936, i64 56}
!1953 = !{!1952, !1935, i64 24}
!1954 = !{!1936, !1936, i64 0}
!1955 = !{i16 1, i16 1025}
!1956 = !{}
!1957 = !{!1958, !1935, i64 12}
!1958 = !{!"hsa_kernel_dispatch_packet_s", !1959, i64 0, !1959, i64 2, !1959, i64 4, !1959, i64 6, !1959, i64 8, !1959, i64 10, !1935, i64 12, !1935, i64 16, !1935, i64 20, !1935, i64 24, !1935, i64 28, !1936, i64 32, !1942, i64 40, !1939, i64 48, !1943, i64 56}
!1959 = !{!"short", !1936, i64 0}
!1960 = !{!1959, !1959, i64 0}
!1961 = !{!1958, !1935, i64 16}
!1962 = !{!1958, !1935, i64 20}
