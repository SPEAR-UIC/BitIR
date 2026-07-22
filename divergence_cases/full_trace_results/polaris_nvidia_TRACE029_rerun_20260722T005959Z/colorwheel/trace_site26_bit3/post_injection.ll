; ModuleID = '/var/tmp/pbs.7268173.polaris-pbs-01.hsn.cm.polaris.alcf.anl.gov/nvidia_divergence_colorwheel_26_3_7268173.polaris-pbs-01.hsn.cm.polaris.alcf.anl.gov/device.injected.bc'
source_filename = "/home/mdunlavy/GPU_FI/HeCBench/src/colorwheel-cuda/main.cu"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

%struct.__cuda_builtin_blockDim_t = type { i8 }
%struct.__cuda_builtin_blockIdx_t = type { i8 }
%struct.__cuda_builtin_threadIdx_t = type { i8 }

@blockDim = extern_weak dso_local addrspace(1) global %struct.__cuda_builtin_blockDim_t, align 1
@blockIdx = extern_weak dso_local addrspace(1) global %struct.__cuda_builtin_blockIdx_t, align 1
@threadIdx = extern_weak dso_local addrspace(1) global %struct.__cuda_builtin_threadIdx_t, align 1
@.str = private unnamed_addr constant [11 x i8] c"__CUDA_FTZ\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"__CUDA_PREC_SQRT\00", align 1

; Function Attrs: convergent mustprogress noinline nounwind optnone
define dso_local void @_Z7setcolsPA3_iiiii(ptr noundef %cw, i32 noundef %r, i32 noundef %g, i32 noundef %b, i32 noundef %k) #0 !dbg !1376 {
entry:
  %cw.addr = alloca ptr, align 8
  %r.addr = alloca i32, align 4
  %g.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  %k.addr = alloca i32, align 4
  store ptr %cw, ptr %cw.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %cw.addr, metadata !1383, metadata !DIExpression()), !dbg !1384
  store i32 %r, ptr %r.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %r.addr, metadata !1385, metadata !DIExpression()), !dbg !1386
  store i32 %g, ptr %g.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %g.addr, metadata !1387, metadata !DIExpression()), !dbg !1388
  store i32 %b, ptr %b.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %b.addr, metadata !1389, metadata !DIExpression()), !dbg !1390
  store i32 %k, ptr %k.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %k.addr, metadata !1391, metadata !DIExpression()), !dbg !1392
  %0 = load i32, ptr %r.addr, align 4, !dbg !1393
  %1 = load ptr, ptr %cw.addr, align 8, !dbg !1394
  %2 = load i32, ptr %k.addr, align 4, !dbg !1395
  %idxprom = sext i32 %2 to i64, !dbg !1394
  %arrayidx = getelementptr inbounds [3 x i32], ptr %1, i64 %idxprom, !dbg !1394
  %arrayidx1 = getelementptr inbounds [3 x i32], ptr %arrayidx, i64 0, i64 0, !dbg !1394
  store i32 %0, ptr %arrayidx1, align 4, !dbg !1396
  %3 = load i32, ptr %g.addr, align 4, !dbg !1397
  %4 = load ptr, ptr %cw.addr, align 8, !dbg !1398
  %5 = load i32, ptr %k.addr, align 4, !dbg !1399
  %idxprom2 = sext i32 %5 to i64, !dbg !1398
  %arrayidx3 = getelementptr inbounds [3 x i32], ptr %4, i64 %idxprom2, !dbg !1398
  %arrayidx4 = getelementptr inbounds [3 x i32], ptr %arrayidx3, i64 0, i64 1, !dbg !1398
  store i32 %3, ptr %arrayidx4, align 4, !dbg !1400
  %6 = load i32, ptr %b.addr, align 4, !dbg !1401
  %7 = load ptr, ptr %cw.addr, align 8, !dbg !1402
  %8 = load i32, ptr %k.addr, align 4, !dbg !1403
  %idxprom5 = sext i32 %8 to i64, !dbg !1402
  %arrayidx6 = getelementptr inbounds [3 x i32], ptr %7, i64 %idxprom5, !dbg !1402
  %arrayidx7 = getelementptr inbounds [3 x i32], ptr %arrayidx6, i64 0, i64 2, !dbg !1402
  store i32 %6, ptr %arrayidx7, align 4, !dbg !1404
  ret void, !dbg !1405
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: convergent noinline nounwind optnone
define dso_local void @_Z12computeColorffPh(float noundef %fx, float noundef %fy, ptr noundef %pix) #2 !dbg !1406 {
entry:
  %__a.addr.i96 = alloca float, align 4
  %__b.addr.i = alloca float, align 4
  %__a.addr.i = alloca float, align 4
  %fx.addr = alloca float, align 4
  %fy.addr = alloca float, align 4
  %pix.addr = alloca ptr, align 8
  %cw = alloca [55 x [3 x i32]], align 4
  %i = alloca i32, align 4
  %k = alloca i32, align 4
  %rad = alloca float, align 4
  %a = alloca float, align 4
  %fk = alloca float, align 4
  %k0 = alloca i32, align 4
  %k1 = alloca i32, align 4
  %f = alloca float, align 4
  %b = alloca i32, align 4
  %col0 = alloca float, align 4
  %col1 = alloca float, align 4
  %col = alloca float, align 4
  store float %fx, ptr %fx.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %fx.addr, metadata !1411, metadata !DIExpression()), !dbg !1412
  store float %fy, ptr %fy.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %fy.addr, metadata !1413, metadata !DIExpression()), !dbg !1414
  store ptr %pix, ptr %pix.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %pix.addr, metadata !1415, metadata !DIExpression()), !dbg !1416
  call void @llvm.dbg.declare(metadata ptr %cw, metadata !1417, metadata !DIExpression()), !dbg !1421
  call void @llvm.dbg.declare(metadata ptr %i, metadata !1422, metadata !DIExpression()), !dbg !1423
  call void @llvm.dbg.declare(metadata ptr %k, metadata !1424, metadata !DIExpression()), !dbg !1425
  store i32 0, ptr %k, align 4, !dbg !1425
  store i32 0, ptr %i, align 4, !dbg !1426
  br label %for.cond, !dbg !1428

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, ptr %i, align 4, !dbg !1429
  %cmp = icmp slt i32 %0, 15, !dbg !1431
  br i1 %cmp, label %for.body, label %for.end, !dbg !1432

for.body:                                         ; preds = %for.cond
  %arraydecay = getelementptr inbounds [55 x [3 x i32]], ptr %cw, i64 0, i64 0, !dbg !1433
  %1 = load i32, ptr %i, align 4, !dbg !1434
  %mul = mul nsw i32 255, %1, !dbg !1435
  %div = sdiv i32 %mul, 15, !dbg !1436
  %2 = load i32, ptr %k, align 4, !dbg !1437
  %inc = add nsw i32 %2, 1, !dbg !1437
  store i32 %inc, ptr %k, align 4, !dbg !1437
  call void @_Z7setcolsPA3_iiiii(ptr noundef %arraydecay, i32 noundef 255, i32 noundef %div, i32 noundef 0, i32 noundef %2) #6, !dbg !1438
  br label %for.inc, !dbg !1438

for.inc:                                          ; preds = %for.body
  %3 = load i32, ptr %i, align 4, !dbg !1439
  %inc1 = add nsw i32 %3, 1, !dbg !1439
  store i32 %inc1, ptr %i, align 4, !dbg !1439
  br label %for.cond, !dbg !1440, !llvm.loop !1441

for.end:                                          ; preds = %for.cond
  store i32 0, ptr %i, align 4, !dbg !1444
  br label %for.cond2, !dbg !1446

for.cond2:                                        ; preds = %for.inc9, %for.end
  %4 = load i32, ptr %i, align 4, !dbg !1447
  %cmp3 = icmp slt i32 %4, 6, !dbg !1449
  br i1 %cmp3, label %for.body4, label %for.end11, !dbg !1450

for.body4:                                        ; preds = %for.cond2
  %arraydecay5 = getelementptr inbounds [55 x [3 x i32]], ptr %cw, i64 0, i64 0, !dbg !1451
  %5 = load i32, ptr %i, align 4, !dbg !1452
  %mul6 = mul nsw i32 255, %5, !dbg !1453
  %div7 = sdiv i32 %mul6, 6, !dbg !1454
  %sub = sub nsw i32 255, %div7, !dbg !1455
  %6 = load i32, ptr %k, align 4, !dbg !1456
  %inc8 = add nsw i32 %6, 1, !dbg !1456
  %fi_flip = xor i32 %inc8, 8, !dbg !1456
  store i32 %fi_flip, ptr %k, align 4, !dbg !1456
  call void @_Z7setcolsPA3_iiiii(ptr noundef %arraydecay5, i32 noundef %sub, i32 noundef 255, i32 noundef 0, i32 noundef %6) #6, !dbg !1457
  br label %for.inc9, !dbg !1457

for.inc9:                                         ; preds = %for.body4
  %7 = load i32, ptr %i, align 4, !dbg !1458
  %inc10 = add nsw i32 %7, 1, !dbg !1458
  store i32 %inc10, ptr %i, align 4, !dbg !1458
  br label %for.cond2, !dbg !1459, !llvm.loop !1460

for.end11:                                        ; preds = %for.cond2
  store i32 0, ptr %i, align 4, !dbg !1462
  br label %for.cond12, !dbg !1464

for.cond12:                                       ; preds = %for.inc19, %for.end11
  %8 = load i32, ptr %i, align 4, !dbg !1465
  %cmp13 = icmp slt i32 %8, 4, !dbg !1467
  br i1 %cmp13, label %for.body14, label %for.end21, !dbg !1468

for.body14:                                       ; preds = %for.cond12
  %arraydecay15 = getelementptr inbounds [55 x [3 x i32]], ptr %cw, i64 0, i64 0, !dbg !1469
  %9 = load i32, ptr %i, align 4, !dbg !1470
  %mul16 = mul nsw i32 255, %9, !dbg !1471
  %div17 = sdiv i32 %mul16, 4, !dbg !1472
  %10 = load i32, ptr %k, align 4, !dbg !1473
  %inc18 = add nsw i32 %10, 1, !dbg !1473
  store i32 %inc18, ptr %k, align 4, !dbg !1473
  call void @_Z7setcolsPA3_iiiii(ptr noundef %arraydecay15, i32 noundef 0, i32 noundef 255, i32 noundef %div17, i32 noundef %10) #6, !dbg !1474
  br label %for.inc19, !dbg !1474

for.inc19:                                        ; preds = %for.body14
  %11 = load i32, ptr %i, align 4, !dbg !1475
  %inc20 = add nsw i32 %11, 1, !dbg !1475
  store i32 %inc20, ptr %i, align 4, !dbg !1475
  br label %for.cond12, !dbg !1476, !llvm.loop !1477

for.end21:                                        ; preds = %for.cond12
  store i32 0, ptr %i, align 4, !dbg !1479
  br label %for.cond22, !dbg !1481

for.cond22:                                       ; preds = %for.inc30, %for.end21
  %12 = load i32, ptr %i, align 4, !dbg !1482
  %cmp23 = icmp slt i32 %12, 11, !dbg !1484
  br i1 %cmp23, label %for.body24, label %for.end32, !dbg !1485

for.body24:                                       ; preds = %for.cond22
  %arraydecay25 = getelementptr inbounds [55 x [3 x i32]], ptr %cw, i64 0, i64 0, !dbg !1486
  %13 = load i32, ptr %i, align 4, !dbg !1487
  %mul26 = mul nsw i32 255, %13, !dbg !1488
  %div27 = sdiv i32 %mul26, 11, !dbg !1489
  %sub28 = sub nsw i32 255, %div27, !dbg !1490
  %14 = load i32, ptr %k, align 4, !dbg !1491
  %inc29 = add nsw i32 %14, 1, !dbg !1491
  store i32 %inc29, ptr %k, align 4, !dbg !1491
  call void @_Z7setcolsPA3_iiiii(ptr noundef %arraydecay25, i32 noundef 0, i32 noundef %sub28, i32 noundef 255, i32 noundef %14) #6, !dbg !1492
  br label %for.inc30, !dbg !1492

for.inc30:                                        ; preds = %for.body24
  %15 = load i32, ptr %i, align 4, !dbg !1493
  %inc31 = add nsw i32 %15, 1, !dbg !1493
  store i32 %inc31, ptr %i, align 4, !dbg !1493
  br label %for.cond22, !dbg !1494, !llvm.loop !1495

for.end32:                                        ; preds = %for.cond22
  store i32 0, ptr %i, align 4, !dbg !1497
  br label %for.cond33, !dbg !1499

for.cond33:                                       ; preds = %for.inc40, %for.end32
  %16 = load i32, ptr %i, align 4, !dbg !1500
  %cmp34 = icmp slt i32 %16, 13, !dbg !1502
  br i1 %cmp34, label %for.body35, label %for.end42, !dbg !1503

for.body35:                                       ; preds = %for.cond33
  %arraydecay36 = getelementptr inbounds [55 x [3 x i32]], ptr %cw, i64 0, i64 0, !dbg !1504
  %17 = load i32, ptr %i, align 4, !dbg !1505
  %mul37 = mul nsw i32 255, %17, !dbg !1506
  %div38 = sdiv i32 %mul37, 13, !dbg !1507
  %18 = load i32, ptr %k, align 4, !dbg !1508
  %inc39 = add nsw i32 %18, 1, !dbg !1508
  store i32 %inc39, ptr %k, align 4, !dbg !1508
  call void @_Z7setcolsPA3_iiiii(ptr noundef %arraydecay36, i32 noundef %div38, i32 noundef 0, i32 noundef 255, i32 noundef %18) #6, !dbg !1509
  br label %for.inc40, !dbg !1509

for.inc40:                                        ; preds = %for.body35
  %19 = load i32, ptr %i, align 4, !dbg !1510
  %inc41 = add nsw i32 %19, 1, !dbg !1510
  store i32 %inc41, ptr %i, align 4, !dbg !1510
  br label %for.cond33, !dbg !1511, !llvm.loop !1512

for.end42:                                        ; preds = %for.cond33
  store i32 0, ptr %i, align 4, !dbg !1514
  br label %for.cond43, !dbg !1516

for.cond43:                                       ; preds = %for.inc51, %for.end42
  %20 = load i32, ptr %i, align 4, !dbg !1517
  %cmp44 = icmp slt i32 %20, 6, !dbg !1519
  br i1 %cmp44, label %for.body45, label %for.end53, !dbg !1520

for.body45:                                       ; preds = %for.cond43
  %arraydecay46 = getelementptr inbounds [55 x [3 x i32]], ptr %cw, i64 0, i64 0, !dbg !1521
  %21 = load i32, ptr %i, align 4, !dbg !1522
  %mul47 = mul nsw i32 255, %21, !dbg !1523
  %div48 = sdiv i32 %mul47, 6, !dbg !1524
  %sub49 = sub nsw i32 255, %div48, !dbg !1525
  %22 = load i32, ptr %k, align 4, !dbg !1526
  %inc50 = add nsw i32 %22, 1, !dbg !1526
  store i32 %inc50, ptr %k, align 4, !dbg !1526
  call void @_Z7setcolsPA3_iiiii(ptr noundef %arraydecay46, i32 noundef 255, i32 noundef 0, i32 noundef %sub49, i32 noundef %22) #6, !dbg !1527
  br label %for.inc51, !dbg !1527

for.inc51:                                        ; preds = %for.body45
  %23 = load i32, ptr %i, align 4, !dbg !1528
  %inc52 = add nsw i32 %23, 1, !dbg !1528
  store i32 %inc52, ptr %i, align 4, !dbg !1528
  br label %for.cond43, !dbg !1529, !llvm.loop !1530

for.end53:                                        ; preds = %for.cond43
  call void @llvm.dbg.declare(metadata ptr %rad, metadata !1532, metadata !DIExpression()), !dbg !1533
  %24 = load float, ptr %fx.addr, align 4, !dbg !1534
  %25 = load float, ptr %fx.addr, align 4, !dbg !1535
  %mul54 = fmul contract float %24, %25, !dbg !1536
  %26 = load float, ptr %fy.addr, align 4, !dbg !1537
  %27 = load float, ptr %fy.addr, align 4, !dbg !1538
  %mul55 = fmul contract float %26, %27, !dbg !1539
  %add = fadd contract float %mul54, %mul55, !dbg !1540
  store float %add, ptr %__a.addr.i, align 4
  call void @llvm.dbg.declare(metadata ptr %__a.addr.i, metadata !1541, metadata !DIExpression()), !dbg !1542
  %28 = load float, ptr %__a.addr.i, align 4, !dbg !1544
  %29 = call float @llvm.nvvm.sqrt.approx.f(float %28) #7, !dbg !1545
  store float %29, ptr %rad, align 4, !dbg !1533
  call void @llvm.dbg.declare(metadata ptr %a, metadata !1546, metadata !DIExpression()), !dbg !1547
  %30 = load float, ptr %fy.addr, align 4, !dbg !1548
  %fneg = fneg contract float %30, !dbg !1549
  %31 = load float, ptr %fx.addr, align 4, !dbg !1550
  %fneg56 = fneg contract float %31, !dbg !1551
  store float %fneg, ptr %__a.addr.i96, align 4
  call void @llvm.dbg.declare(metadata ptr %__a.addr.i96, metadata !1552, metadata !DIExpression()), !dbg !1553
  store float %fneg56, ptr %__b.addr.i, align 4
  call void @llvm.dbg.declare(metadata ptr %__b.addr.i, metadata !1555, metadata !DIExpression()), !dbg !1556
  %32 = load float, ptr %__a.addr.i96, align 4, !dbg !1557
  %33 = load float, ptr %__b.addr.i, align 4, !dbg !1558
  %34 = call float @llvm.nvvm.fabs.f(float %33) #7, !dbg !1559
  %35 = call float @llvm.nvvm.fabs.f(float %32) #7, !dbg !1559
  %36 = fcmp oeq float %34, 0.000000e+00, !dbg !1559
  br i1 %36, label %37, label %48, !dbg !1559

37:                                               ; preds = %for.end53
  %38 = fcmp oeq float %35, 0.000000e+00, !dbg !1559
  br i1 %38, label %39, label %48, !dbg !1559

39:                                               ; preds = %37
  %40 = bitcast float %33 to i32, !dbg !1559
  %41 = icmp slt i32 %40, 0, !dbg !1559
  %42 = select i1 %41, float 0x400921FB60000000, float 0.000000e+00, !dbg !1559
  %43 = bitcast float %42 to i32, !dbg !1559
  %44 = bitcast float %32 to i32, !dbg !1559
  %45 = and i32 %44, -2147483648, !dbg !1559
  %46 = or i32 %43, %45, !dbg !1559
  %47 = bitcast i32 %46 to float, !dbg !1559
  br label %__nv_atan2f.exit, !dbg !1559

48:                                               ; preds = %37, %for.end53
  %49 = fcmp oeq float %34, 0x7FF0000000000000, !dbg !1559
  br i1 %49, label %50, label %61, !dbg !1559

50:                                               ; preds = %48
  %51 = fcmp oeq float %35, 0x7FF0000000000000, !dbg !1559
  br i1 %51, label %52, label %61, !dbg !1559

52:                                               ; preds = %50
  %53 = bitcast float %33 to i32, !dbg !1559
  %54 = icmp slt i32 %53, 0, !dbg !1559
  %55 = select i1 %54, float 0x4002D97C80000000, float 0x3FE921FB60000000, !dbg !1559
  %56 = bitcast float %55 to i32, !dbg !1559
  %57 = bitcast float %32 to i32, !dbg !1559
  %58 = and i32 %57, -2147483648, !dbg !1559
  %59 = or i32 %56, %58, !dbg !1559
  %60 = bitcast i32 %59 to float, !dbg !1559
  br label %93, !dbg !1559

61:                                               ; preds = %50, %48
  %62 = call float @llvm.nvvm.fmax.f(float %35, float %34) #7, !dbg !1559
  %63 = call float @llvm.nvvm.fmin.f(float %35, float %34) #7, !dbg !1559
  %64 = fdiv float %63, %62, !dbg !1559
  %65 = call float @llvm.nvvm.mul.rn.f(float %64, float %64) #7, !dbg !1559
  %66 = call float @llvm.nvvm.fma.rn.f(float %65, float 0xBFEA58FD40000000, float 0xC016B31060000000) #7, !dbg !1559
  %67 = call float @llvm.nvvm.fma.rn.f(float %66, float %65, float 0xC01A4320E0000000) #7, !dbg !1559
  %68 = fmul float %67, %65, !dbg !1559
  %69 = fmul float %68, %64, !dbg !1559
  %70 = fadd float %65, 0x4026ABB800000000, !dbg !1559
  %71 = call float @llvm.nvvm.fma.rn.f(float %70, float %65, float 0x403CD7AC00000000) #7, !dbg !1559
  %72 = call float @llvm.nvvm.fma.rn.f(float %71, float %65, float 0x4033B25900000000) #7, !dbg !1559
  %73 = fdiv float 1.000000e+00, %72, !dbg !1559
  %74 = call float @llvm.nvvm.fma.rn.f(float %69, float %73, float %64) #7, !dbg !1559
  %75 = fcmp ogt float %35, %34, !dbg !1559
  br i1 %75, label %76, label %78, !dbg !1559

76:                                               ; preds = %61
  %77 = fsub float 0x3FF921FB60000000, %74, !dbg !1559
  br label %78, !dbg !1559

78:                                               ; preds = %76, %61
  %t0.0.i = phi float [ %77, %76 ], [ %74, %61 ], !dbg !1559
  %79 = bitcast float %33 to i32, !dbg !1559
  %80 = icmp slt i32 %79, 0, !dbg !1559
  br i1 %80, label %81, label %83, !dbg !1559

81:                                               ; preds = %78
  %82 = fsub float 0x400921FB60000000, %t0.0.i, !dbg !1559
  br label %83, !dbg !1559

83:                                               ; preds = %81, %78
  %t0.1.i = phi float [ %82, %81 ], [ %t0.0.i, %78 ], !dbg !1559
  %84 = bitcast float %t0.1.i to i32, !dbg !1559
  %85 = bitcast float %32 to i32, !dbg !1559
  %86 = and i32 %85, -2147483648, !dbg !1559
  %87 = or i32 %84, %86, !dbg !1559
  %88 = bitcast i32 %87 to float, !dbg !1559
  %89 = fadd float %34, %35, !dbg !1559
  %90 = fcmp ole float %89, 0x7FF0000000000000, !dbg !1559
  br i1 %90, label %92, label %91, !dbg !1559

91:                                               ; preds = %83
  br label %92, !dbg !1559

92:                                               ; preds = %91, %83
  %t0.2.i = phi float [ %88, %83 ], [ %89, %91 ], !dbg !1559
  br label %93, !dbg !1559

93:                                               ; preds = %92, %52
  %t0.3.i = phi float [ %60, %52 ], [ %t0.2.i, %92 ], !dbg !1559
  br label %__nv_atan2f.exit, !dbg !1559

__nv_atan2f.exit:                                 ; preds = %93, %39
  %t0.4.i = phi float [ %47, %39 ], [ %t0.3.i, %93 ], !dbg !1559
  %div58 = fdiv contract float %t0.4.i, 0x400921FB60000000, !dbg !1560
  store float %div58, ptr %a, align 4, !dbg !1547
  call void @llvm.dbg.declare(metadata ptr %fk, metadata !1561, metadata !DIExpression()), !dbg !1562
  %94 = load float, ptr %a, align 4, !dbg !1563
  %add59 = fadd contract float %94, 1.000000e+00, !dbg !1564
  %div60 = fdiv contract float %add59, 2.000000e+00, !dbg !1565
  %mul61 = fmul contract float %div60, 5.400000e+01, !dbg !1566
  store float %mul61, ptr %fk, align 4, !dbg !1562
  call void @llvm.dbg.declare(metadata ptr %k0, metadata !1567, metadata !DIExpression()), !dbg !1568
  %95 = load float, ptr %fk, align 4, !dbg !1569
  %conv = fptosi float %95 to i32, !dbg !1569
  store i32 %conv, ptr %k0, align 4, !dbg !1568
  call void @llvm.dbg.declare(metadata ptr %k1, metadata !1570, metadata !DIExpression()), !dbg !1571
  %96 = load i32, ptr %k0, align 4, !dbg !1572
  %add62 = add nsw i32 %96, 1, !dbg !1573
  %rem = srem i32 %add62, 55, !dbg !1574
  store i32 %rem, ptr %k1, align 4, !dbg !1571
  call void @llvm.dbg.declare(metadata ptr %f, metadata !1575, metadata !DIExpression()), !dbg !1576
  %97 = load float, ptr %fk, align 4, !dbg !1577
  %98 = load i32, ptr %k0, align 4, !dbg !1578
  %conv63 = sitofp i32 %98 to float, !dbg !1578
  %sub64 = fsub contract float %97, %conv63, !dbg !1579
  store float %sub64, ptr %f, align 4, !dbg !1576
  call void @llvm.dbg.declare(metadata ptr %b, metadata !1580, metadata !DIExpression()), !dbg !1582
  store i32 0, ptr %b, align 4, !dbg !1582
  br label %for.cond65, !dbg !1583

for.cond65:                                       ; preds = %for.inc93, %__nv_atan2f.exit
  %99 = load i32, ptr %b, align 4, !dbg !1584
  %cmp66 = icmp slt i32 %99, 3, !dbg !1586
  br i1 %cmp66, label %for.body67, label %for.end95, !dbg !1587

for.body67:                                       ; preds = %for.cond65
  call void @llvm.dbg.declare(metadata ptr %col0, metadata !1588, metadata !DIExpression()), !dbg !1590
  %100 = load i32, ptr %k0, align 4, !dbg !1591
  %idxprom = sext i32 %100 to i64, !dbg !1592
  %arrayidx = getelementptr inbounds [55 x [3 x i32]], ptr %cw, i64 0, i64 %idxprom, !dbg !1592
  %101 = load i32, ptr %b, align 4, !dbg !1593
  %idxprom68 = sext i32 %101 to i64, !dbg !1592
  %arrayidx69 = getelementptr inbounds [3 x i32], ptr %arrayidx, i64 0, i64 %idxprom68, !dbg !1592
  %102 = load i32, ptr %arrayidx69, align 4, !dbg !1592
  %conv70 = sitofp i32 %102 to float, !dbg !1592
  %div71 = fdiv contract float %conv70, 2.550000e+02, !dbg !1594
  store float %div71, ptr %col0, align 4, !dbg !1590
  call void @llvm.dbg.declare(metadata ptr %col1, metadata !1595, metadata !DIExpression()), !dbg !1596
  %103 = load i32, ptr %k1, align 4, !dbg !1597
  %idxprom72 = sext i32 %103 to i64, !dbg !1598
  %arrayidx73 = getelementptr inbounds [55 x [3 x i32]], ptr %cw, i64 0, i64 %idxprom72, !dbg !1598
  %104 = load i32, ptr %b, align 4, !dbg !1599
  %idxprom74 = sext i32 %104 to i64, !dbg !1598
  %arrayidx75 = getelementptr inbounds [3 x i32], ptr %arrayidx73, i64 0, i64 %idxprom74, !dbg !1598
  %105 = load i32, ptr %arrayidx75, align 4, !dbg !1598
  %conv76 = sitofp i32 %105 to float, !dbg !1598
  %div77 = fdiv contract float %conv76, 2.550000e+02, !dbg !1600
  store float %div77, ptr %col1, align 4, !dbg !1596
  call void @llvm.dbg.declare(metadata ptr %col, metadata !1601, metadata !DIExpression()), !dbg !1602
  %106 = load float, ptr %f, align 4, !dbg !1603
  %sub78 = fsub contract float 1.000000e+00, %106, !dbg !1604
  %107 = load float, ptr %col0, align 4, !dbg !1605
  %mul79 = fmul contract float %sub78, %107, !dbg !1606
  %108 = load float, ptr %f, align 4, !dbg !1607
  %109 = load float, ptr %col1, align 4, !dbg !1608
  %mul80 = fmul contract float %108, %109, !dbg !1609
  %add81 = fadd contract float %mul79, %mul80, !dbg !1610
  store float %add81, ptr %col, align 4, !dbg !1602
  %110 = load float, ptr %rad, align 4, !dbg !1611
  %cmp82 = fcmp contract ole float %110, 1.000000e+00, !dbg !1613
  br i1 %cmp82, label %if.then, label %if.else, !dbg !1614

if.then:                                          ; preds = %for.body67
  %111 = load float, ptr %rad, align 4, !dbg !1615
  %112 = load float, ptr %col, align 4, !dbg !1616
  %sub83 = fsub contract float 1.000000e+00, %112, !dbg !1617
  %mul84 = fmul contract float %111, %sub83, !dbg !1618
  %sub85 = fsub contract float 1.000000e+00, %mul84, !dbg !1619
  store float %sub85, ptr %col, align 4, !dbg !1620
  br label %if.end, !dbg !1621

if.else:                                          ; preds = %for.body67
  %113 = load float, ptr %col, align 4, !dbg !1622
  %mul86 = fmul contract float %113, 7.500000e-01, !dbg !1622
  store float %mul86, ptr %col, align 4, !dbg !1622
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %114 = load float, ptr %col, align 4, !dbg !1623
  %mul87 = fmul contract float 2.550000e+02, %114, !dbg !1624
  %conv88 = fptosi float %mul87 to i32, !dbg !1625
  %conv89 = trunc i32 %conv88 to i8, !dbg !1626
  %115 = load ptr, ptr %pix.addr, align 8, !dbg !1627
  %116 = load i32, ptr %b, align 4, !dbg !1628
  %sub90 = sub nsw i32 2, %116, !dbg !1629
  %idxprom91 = sext i32 %sub90 to i64, !dbg !1627
  %arrayidx92 = getelementptr inbounds i8, ptr %115, i64 %idxprom91, !dbg !1627
  store i8 %conv89, ptr %arrayidx92, align 1, !dbg !1630
  br label %for.inc93, !dbg !1631

for.inc93:                                        ; preds = %if.end
  %117 = load i32, ptr %b, align 4, !dbg !1632
  %inc94 = add nsw i32 %117, 1, !dbg !1632
  store i32 %inc94, ptr %b, align 4, !dbg !1632
  br label %for.cond65, !dbg !1633, !llvm.loop !1634

for.end95:                                        ; preds = %for.cond65
  ret void, !dbg !1636
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define dso_local void @_Z5colorPhiiff(ptr noundef %pix, i32 noundef %size, i32 noundef %half_size, float noundef %range, float noundef %truerange) #3 !dbg !1637 {
entry:
  %pix.addr = alloca ptr, align 8
  %size.addr = alloca i32, align 4
  %half_size.addr = alloca i32, align 4
  %range.addr = alloca float, align 4
  %truerange.addr = alloca float, align 4
  %y = alloca i32, align 4
  %x = alloca i32, align 4
  %fx = alloca float, align 4
  %fy = alloca float, align 4
  %idx = alloca i64, align 8
  store ptr %pix, ptr %pix.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %pix.addr, metadata !1640, metadata !DIExpression()), !dbg !1641
  store i32 %size, ptr %size.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %size.addr, metadata !1642, metadata !DIExpression()), !dbg !1643
  store i32 %half_size, ptr %half_size.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %half_size.addr, metadata !1644, metadata !DIExpression()), !dbg !1645
  store float %range, ptr %range.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %range.addr, metadata !1646, metadata !DIExpression()), !dbg !1647
  store float %truerange, ptr %truerange.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %truerange.addr, metadata !1648, metadata !DIExpression()), !dbg !1649
  call void @llvm.dbg.declare(metadata ptr %y, metadata !1650, metadata !DIExpression()), !dbg !1651
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.y(), !dbg !1652
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !dbg !1655
  %mul = mul i32 %0, %1, !dbg !1658
  %2 = call i32 @llvm.nvvm.read.ptx.sreg.tid.y(), !dbg !1659
  %add = add i32 %mul, %2, !dbg !1662
  store i32 %add, ptr %y, align 4, !dbg !1651
  call void @llvm.dbg.declare(metadata ptr %x, metadata !1663, metadata !DIExpression()), !dbg !1664
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x(), !dbg !1665
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !dbg !1668
  %mul5 = mul i32 %3, %4, !dbg !1671
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !dbg !1672
  %add7 = add i32 %mul5, %5, !dbg !1675
  store i32 %add7, ptr %x, align 4, !dbg !1664
  %6 = load i32, ptr %y, align 4, !dbg !1676
  %7 = load i32, ptr %size.addr, align 4, !dbg !1678
  %cmp = icmp slt i32 %6, %7, !dbg !1679
  br i1 %cmp, label %land.lhs.true, label %if.end25, !dbg !1680

land.lhs.true:                                    ; preds = %entry
  %8 = load i32, ptr %x, align 4, !dbg !1681
  %9 = load i32, ptr %size.addr, align 4, !dbg !1682
  %cmp8 = icmp slt i32 %8, %9, !dbg !1683
  br i1 %cmp8, label %if.then, label %if.end25, !dbg !1684

if.then:                                          ; preds = %land.lhs.true
  call void @llvm.dbg.declare(metadata ptr %fx, metadata !1685, metadata !DIExpression()), !dbg !1687
  %10 = load i32, ptr %x, align 4, !dbg !1688
  %conv = sitofp i32 %10 to float, !dbg !1688
  %11 = load i32, ptr %half_size.addr, align 4, !dbg !1689
  %conv9 = sitofp i32 %11 to float, !dbg !1689
  %div = fdiv contract float %conv, %conv9, !dbg !1690
  %12 = load float, ptr %range.addr, align 4, !dbg !1691
  %mul10 = fmul contract float %div, %12, !dbg !1692
  %13 = load float, ptr %range.addr, align 4, !dbg !1693
  %sub = fsub contract float %mul10, %13, !dbg !1694
  store float %sub, ptr %fx, align 4, !dbg !1687
  call void @llvm.dbg.declare(metadata ptr %fy, metadata !1695, metadata !DIExpression()), !dbg !1696
  %14 = load i32, ptr %y, align 4, !dbg !1697
  %conv11 = sitofp i32 %14 to float, !dbg !1697
  %15 = load i32, ptr %half_size.addr, align 4, !dbg !1698
  %conv12 = sitofp i32 %15 to float, !dbg !1698
  %div13 = fdiv contract float %conv11, %conv12, !dbg !1699
  %16 = load float, ptr %range.addr, align 4, !dbg !1700
  %mul14 = fmul contract float %div13, %16, !dbg !1701
  %17 = load float, ptr %range.addr, align 4, !dbg !1702
  %sub15 = fsub contract float %mul14, %17, !dbg !1703
  store float %sub15, ptr %fy, align 4, !dbg !1696
  %18 = load i32, ptr %x, align 4, !dbg !1704
  %19 = load i32, ptr %half_size.addr, align 4, !dbg !1706
  %cmp16 = icmp eq i32 %18, %19, !dbg !1707
  br i1 %cmp16, label %if.then18, label %lor.lhs.false, !dbg !1708

lor.lhs.false:                                    ; preds = %if.then
  %20 = load i32, ptr %y, align 4, !dbg !1709
  %21 = load i32, ptr %half_size.addr, align 4, !dbg !1710
  %cmp17 = icmp eq i32 %20, %21, !dbg !1711
  br i1 %cmp17, label %if.then18, label %if.end, !dbg !1712

if.then18:                                        ; preds = %lor.lhs.false, %if.then
  br label %if.end25, !dbg !1713

if.end:                                           ; preds = %lor.lhs.false
  call void @llvm.dbg.declare(metadata ptr %idx, metadata !1714, metadata !DIExpression()), !dbg !1715
  %22 = load i32, ptr %y, align 4, !dbg !1716
  %23 = load i32, ptr %size.addr, align 4, !dbg !1717
  %mul19 = mul nsw i32 %22, %23, !dbg !1718
  %24 = load i32, ptr %x, align 4, !dbg !1719
  %add20 = add nsw i32 %mul19, %24, !dbg !1720
  %mul21 = mul nsw i32 %add20, 3, !dbg !1721
  %conv22 = sext i32 %mul21 to i64, !dbg !1722
  store i64 %conv22, ptr %idx, align 8, !dbg !1715
  %25 = load float, ptr %fx, align 4, !dbg !1723
  %26 = load float, ptr %truerange.addr, align 4, !dbg !1724
  %div23 = fdiv contract float %25, %26, !dbg !1725
  %27 = load float, ptr %fy, align 4, !dbg !1726
  %28 = load float, ptr %truerange.addr, align 4, !dbg !1727
  %div24 = fdiv contract float %27, %28, !dbg !1728
  %29 = load ptr, ptr %pix.addr, align 8, !dbg !1729
  %30 = load i64, ptr %idx, align 8, !dbg !1730
  %add.ptr = getelementptr inbounds i8, ptr %29, i64 %30, !dbg !1731
  call void @_Z12computeColorffPh(float noundef %div23, float noundef %div24, ptr noundef %add.ptr) #6, !dbg !1732
  br label %if.end25, !dbg !1733

if.end25:                                         ; preds = %if.end, %if.then18, %land.lhs.true, %entry
  ret void, !dbg !1734
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ntid.y() #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.y() #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: convergent nounwind
declare i32 @__nvvm_reflect(ptr) #4

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare float @llvm.nvvm.sqrt.rn.ftz.f(float) #5

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare float @llvm.nvvm.sqrt.approx.ftz.f(float) #5

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare float @llvm.nvvm.sqrt.rn.f(float) #5

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare float @llvm.nvvm.sqrt.approx.f(float) #5

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.nvvm.fabs.ftz.f(float) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.nvvm.fabs.f(float) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.nvvm.fmax.ftz.f(float, float) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.nvvm.fmax.f(float, float) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.nvvm.fmin.ftz.f(float, float) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.nvvm.fmin.f(float, float) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.nvvm.mul.rn.ftz.f(float, float) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.nvvm.mul.rn.f(float, float) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.nvvm.fma.rn.ftz.f(float, float, float) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.nvvm.fma.rn.f(float, float, float) #1

attributes #0 = { convergent mustprogress noinline nounwind optnone "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="sm_80" "target-features"="+ptx78,+sm_80" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { convergent noinline nounwind optnone "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="sm_80" "target-features"="+ptx78,+sm_80" }
attributes #3 = { convergent mustprogress noinline norecurse nounwind optnone "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="sm_80" "target-features"="+ptx78,+sm_80" }
attributes #4 = { convergent nounwind "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="sm_80" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nocallback nofree nosync nounwind willreturn memory(none) }
attributes #6 = { convergent nounwind }
attributes #7 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5}
!llvm.dbg.cu = !{!6}
!nvvm.annotations = !{!1373}
!llvm.ident = !{!1374, !1375}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 11, i32 8]}
!1 = !{i32 7, !"Dwarf Version", i32 2}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!5 = !{i32 7, !"frame-pointer", i32 2}
!6 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !7, producer: "clang version 17.0.6 (https://github.com/llvm/llvm-project.git 6009708b4367171ccdbf4b5905cb6a803753fe18)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !8, imports: !123, splitDebugInlining: false, nameTableKind: None)
!7 = !DIFile(filename: "/home/mdunlavy/GPU_FI/HeCBench/src/colorwheel-cuda/main.cu", directory: "/home/mdunlavy")
!8 = !{!9, !10, !11, !36, !67, !95}
!9 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dim3", file: !12, line: 418, size: 96, flags: DIFlagTypePassByValue | DIFlagNonTrivial, elements: !13, identifier: "_ZTS4dim3")
!12 = !DIFile(filename: "/soft/compilers/cudatoolkit/cuda-11.8.0/include/vector_types.h", directory: "")
!13 = !{!14, !16, !17, !18, !22, !31}
!14 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !11, file: !12, line: 420, baseType: !15, size: 32)
!15 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!16 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !11, file: !12, line: 420, baseType: !15, size: 32, offset: 32)
!17 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !11, file: !12, line: 420, baseType: !15, size: 32, offset: 64)
!18 = !DISubprogram(name: "dim3", scope: !11, file: !12, line: 423, type: !19, scopeLine: 423, flags: DIFlagPrototyped, spFlags: 0)
!19 = !DISubroutineType(types: !20)
!20 = !{null, !21, !15, !15, !15}
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!22 = !DISubprogram(name: "dim3", scope: !11, file: !12, line: 424, type: !23, scopeLine: 424, flags: DIFlagPrototyped, spFlags: 0)
!23 = !DISubroutineType(types: !24)
!24 = !{null, !21, !25}
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint3", file: !12, line: 384, baseType: !26)
!26 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "uint3", file: !12, line: 192, size: 96, flags: DIFlagTypePassByValue, elements: !27, identifier: "_ZTS5uint3")
!27 = !{!28, !29, !30}
!28 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !26, file: !12, line: 194, baseType: !15, size: 32)
!29 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !26, file: !12, line: 194, baseType: !15, size: 32, offset: 32)
!30 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !26, file: !12, line: 194, baseType: !15, size: 32, offset: 64)
!31 = !DISubprogram(name: "operator uint3", linkageName: "_ZNK4dim3cv5uint3Ev", scope: !11, file: !12, line: 425, type: !32, scopeLine: 425, flags: DIFlagPrototyped, spFlags: 0)
!32 = !DISubroutineType(types: !33)
!33 = !{!25, !34}
!34 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !35, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!35 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !11)
!36 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__cuda_builtin_blockDim_t", file: !37, line: 78, size: 8, flags: DIFlagTypePassByReference, elements: !38, identifier: "_ZTS25__cuda_builtin_blockDim_t")
!37 = !DIFile(filename: "/soft/compilers/llvm/release-17.0.6/lib/clang/17/include/__clang_cuda_builtin_vars.h", directory: "")
!38 = !{!39, !42, !43, !44, !49, !52, !56, !60, !63}
!39 = !DISubprogram(name: "__fetch_builtin_x", linkageName: "_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv", scope: !36, file: !37, line: 79, type: !40, scopeLine: 79, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!40 = !DISubroutineType(types: !41)
!41 = !{!15}
!42 = !DISubprogram(name: "__fetch_builtin_y", linkageName: "_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_yEv", scope: !36, file: !37, line: 80, type: !40, scopeLine: 80, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!43 = !DISubprogram(name: "__fetch_builtin_z", linkageName: "_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_zEv", scope: !36, file: !37, line: 81, type: !40, scopeLine: 81, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!44 = !DISubprogram(name: "operator dim3", linkageName: "_ZNK25__cuda_builtin_blockDim_tcv4dim3Ev", scope: !36, file: !37, line: 84, type: !45, scopeLine: 84, flags: DIFlagPrototyped, spFlags: 0)
!45 = !DISubroutineType(types: !46)
!46 = !{!11, !47}
!47 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !48, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!48 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !36)
!49 = !DISubprogram(name: "operator uint3", linkageName: "_ZNK25__cuda_builtin_blockDim_tcv5uint3Ev", scope: !36, file: !37, line: 85, type: !50, scopeLine: 85, flags: DIFlagPrototyped, spFlags: 0)
!50 = !DISubroutineType(types: !51)
!51 = !{!26, !47}
!52 = !DISubprogram(name: "__cuda_builtin_blockDim_t", scope: !36, file: !37, line: 88, type: !53, scopeLine: 88, flags: DIFlagPrivate | DIFlagPrototyped, spFlags: DISPFlagDeleted)
!53 = !DISubroutineType(types: !54)
!54 = !{null, !55}
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !36, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!56 = !DISubprogram(name: "__cuda_builtin_blockDim_t", scope: !36, file: !37, line: 88, type: !57, scopeLine: 88, flags: DIFlagPrivate | DIFlagPrototyped, spFlags: DISPFlagDeleted)
!57 = !DISubroutineType(types: !58)
!58 = !{null, !55, !59}
!59 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !48, size: 64)
!60 = !DISubprogram(name: "operator=", linkageName: "_ZNK25__cuda_builtin_blockDim_taSERKS_", scope: !36, file: !37, line: 88, type: !61, scopeLine: 88, flags: DIFlagPrivate | DIFlagPrototyped, spFlags: DISPFlagDeleted)
!61 = !DISubroutineType(types: !62)
!62 = !{null, !47, !59}
!63 = !DISubprogram(name: "operator&", linkageName: "_ZNK25__cuda_builtin_blockDim_tadEv", scope: !36, file: !37, line: 88, type: !64, scopeLine: 88, flags: DIFlagPrivate | DIFlagPrototyped, spFlags: DISPFlagDeleted)
!64 = !DISubroutineType(types: !65)
!65 = !{!66, !47}
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !36, size: 64)
!67 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__cuda_builtin_blockIdx_t", file: !37, line: 65, size: 8, flags: DIFlagTypePassByReference, elements: !68, identifier: "_ZTS25__cuda_builtin_blockIdx_t")
!68 = !{!69, !70, !71, !72, !77, !80, !84, !88, !91}
!69 = !DISubprogram(name: "__fetch_builtin_x", linkageName: "_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv", scope: !67, file: !37, line: 66, type: !40, scopeLine: 66, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!70 = !DISubprogram(name: "__fetch_builtin_y", linkageName: "_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv", scope: !67, file: !37, line: 67, type: !40, scopeLine: 67, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!71 = !DISubprogram(name: "__fetch_builtin_z", linkageName: "_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_zEv", scope: !67, file: !37, line: 68, type: !40, scopeLine: 68, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!72 = !DISubprogram(name: "operator dim3", linkageName: "_ZNK25__cuda_builtin_blockIdx_tcv4dim3Ev", scope: !67, file: !37, line: 71, type: !73, scopeLine: 71, flags: DIFlagPrototyped, spFlags: 0)
!73 = !DISubroutineType(types: !74)
!74 = !{!11, !75}
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!76 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !67)
!77 = !DISubprogram(name: "operator uint3", linkageName: "_ZNK25__cuda_builtin_blockIdx_tcv5uint3Ev", scope: !67, file: !37, line: 72, type: !78, scopeLine: 72, flags: DIFlagPrototyped, spFlags: 0)
!78 = !DISubroutineType(types: !79)
!79 = !{!26, !75}
!80 = !DISubprogram(name: "__cuda_builtin_blockIdx_t", scope: !67, file: !37, line: 75, type: !81, scopeLine: 75, flags: DIFlagPrivate | DIFlagPrototyped, spFlags: DISPFlagDeleted)
!81 = !DISubroutineType(types: !82)
!82 = !{null, !83}
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!84 = !DISubprogram(name: "__cuda_builtin_blockIdx_t", scope: !67, file: !37, line: 75, type: !85, scopeLine: 75, flags: DIFlagPrivate | DIFlagPrototyped, spFlags: DISPFlagDeleted)
!85 = !DISubroutineType(types: !86)
!86 = !{null, !83, !87}
!87 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !76, size: 64)
!88 = !DISubprogram(name: "operator=", linkageName: "_ZNK25__cuda_builtin_blockIdx_taSERKS_", scope: !67, file: !37, line: 75, type: !89, scopeLine: 75, flags: DIFlagPrivate | DIFlagPrototyped, spFlags: DISPFlagDeleted)
!89 = !DISubroutineType(types: !90)
!90 = !{null, !75, !87}
!91 = !DISubprogram(name: "operator&", linkageName: "_ZNK25__cuda_builtin_blockIdx_tadEv", scope: !67, file: !37, line: 75, type: !92, scopeLine: 75, flags: DIFlagPrivate | DIFlagPrototyped, spFlags: DISPFlagDeleted)
!92 = !DISubroutineType(types: !93)
!93 = !{!94, !75}
!94 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!95 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__cuda_builtin_threadIdx_t", file: !37, line: 52, size: 8, flags: DIFlagTypePassByReference, elements: !96, identifier: "_ZTS26__cuda_builtin_threadIdx_t")
!96 = !{!97, !98, !99, !100, !105, !108, !112, !116, !119}
!97 = !DISubprogram(name: "__fetch_builtin_x", linkageName: "_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv", scope: !95, file: !37, line: 53, type: !40, scopeLine: 53, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!98 = !DISubprogram(name: "__fetch_builtin_y", linkageName: "_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv", scope: !95, file: !37, line: 54, type: !40, scopeLine: 54, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!99 = !DISubprogram(name: "__fetch_builtin_z", linkageName: "_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_zEv", scope: !95, file: !37, line: 55, type: !40, scopeLine: 55, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!100 = !DISubprogram(name: "operator dim3", linkageName: "_ZNK26__cuda_builtin_threadIdx_tcv4dim3Ev", scope: !95, file: !37, line: 58, type: !101, scopeLine: 58, flags: DIFlagPrototyped, spFlags: 0)
!101 = !DISubroutineType(types: !102)
!102 = !{!11, !103}
!103 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !104, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!104 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !95)
!105 = !DISubprogram(name: "operator uint3", linkageName: "_ZNK26__cuda_builtin_threadIdx_tcv5uint3Ev", scope: !95, file: !37, line: 59, type: !106, scopeLine: 59, flags: DIFlagPrototyped, spFlags: 0)
!106 = !DISubroutineType(types: !107)
!107 = !{!26, !103}
!108 = !DISubprogram(name: "__cuda_builtin_threadIdx_t", scope: !95, file: !37, line: 62, type: !109, scopeLine: 62, flags: DIFlagPrivate | DIFlagPrototyped, spFlags: DISPFlagDeleted)
!109 = !DISubroutineType(types: !110)
!110 = !{null, !111}
!111 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !95, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!112 = !DISubprogram(name: "__cuda_builtin_threadIdx_t", scope: !95, file: !37, line: 62, type: !113, scopeLine: 62, flags: DIFlagPrivate | DIFlagPrototyped, spFlags: DISPFlagDeleted)
!113 = !DISubroutineType(types: !114)
!114 = !{null, !111, !115}
!115 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !104, size: 64)
!116 = !DISubprogram(name: "operator=", linkageName: "_ZNK26__cuda_builtin_threadIdx_taSERKS_", scope: !95, file: !37, line: 62, type: !117, scopeLine: 62, flags: DIFlagPrivate | DIFlagPrototyped, spFlags: DISPFlagDeleted)
!117 = !DISubroutineType(types: !118)
!118 = !{null, !103, !115}
!119 = !DISubprogram(name: "operator&", linkageName: "_ZNK26__cuda_builtin_threadIdx_tadEv", scope: !95, file: !37, line: 62, type: !120, scopeLine: 62, flags: DIFlagPrivate | DIFlagPrototyped, spFlags: DISPFlagDeleted)
!120 = !DISubroutineType(types: !121)
!121 = !{!122, !103}
!122 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !95, size: 64)
!123 = !{!124, !130, !134, !136, !138, !140, !142, !146, !148, !150, !152, !154, !156, !158, !160, !162, !164, !166, !168, !170, !172, !174, !178, !180, !182, !184, !188, !193, !195, !197, !202, !206, !208, !210, !212, !214, !216, !218, !220, !222, !227, !231, !233, !238, !242, !244, !246, !248, !250, !252, !256, !258, !260, !265, !273, !277, !279, !281, !283, !285, !289, !291, !293, !297, !299, !301, !303, !305, !307, !309, !311, !313, !315, !319, !325, !327, !329, !333, !335, !337, !339, !341, !343, !345, !347, !351, !355, !357, !359, !364, !366, !368, !370, !372, !374, !376, !379, !381, !383, !385, !390, !392, !394, !396, !398, !400, !402, !404, !406, !408, !410, !412, !416, !418, !420, !422, !424, !426, !428, !430, !432, !434, !436, !438, !440, !442, !444, !446, !450, !452, !456, !458, !460, !462, !464, !466, !468, !470, !472, !474, !478, !480, !484, !486, !488, !490, !494, !496, !500, !502, !504, !506, !508, !510, !512, !514, !516, !518, !520, !522, !524, !528, !530, !534, !536, !538, !540, !542, !544, !548, !550, !552, !554, !556, !558, !560, !564, !568, !570, !572, !574, !576, !580, !582, !586, !588, !590, !592, !594, !596, !598, !602, !604, !608, !610, !612, !616, !618, !620, !622, !624, !626, !628, !632, !636, !642, !646, !654, !659, !661, !663, !667, !671, !681, !683, !687, !691, !695, !700, !702, !706, !710, !714, !722, !726, !730, !732, !736, !740, !744, !750, !754, !758, !760, !768, !772, !779, !781, !783, !787, !791, !795, !800, !804, !808, !809, !810, !811, !813, !814, !815, !816, !817, !818, !819, !821, !822, !823, !824, !825, !826, !827, !832, !833, !834, !835, !836, !837, !838, !839, !840, !841, !842, !843, !844, !845, !846, !847, !848, !849, !850, !851, !852, !853, !854, !855, !856, !860, !862, !864, !866, !869, !871, !873, !875, !877, !879, !881, !883, !885, !887, !889, !891, !893, !895, !897, !899, !901, !903, !905, !907, !909, !911, !913, !915, !917, !919, !921, !923, !925, !927, !929, !931, !933, !935, !937, !939, !941, !943, !945, !947, !949, !951, !953, !955, !957, !959, !961, !963, !965, !967, !969, !976, !980, !983, !986, !989, !991, !993, !995, !998, !1001, !1004, !1007, !1010, !1012, !1017, !1021, !1024, !1027, !1029, !1031, !1033, !1035, !1038, !1041, !1044, !1047, !1050, !1052, !1057, !1061, !1064, !1069, !1073, !1078, !1083, !1089, !1095, !1099, !1101, !1106, !1113, !1118, !1123, !1129, !1135, !1140, !1144, !1146, !1148, !1150, !1152, !1159, !1163, !1167, !1171, !1175, !1179, !1184, !1188, !1190, !1194, !1200, !1204, !1209, !1211, !1213, !1217, !1221, !1223, !1225, !1227, !1229, !1233, !1235, !1237, !1241, !1245, !1249, !1253, !1257, !1261, !1263, !1271, !1275, !1279, !1283, !1285, !1287, !1291, !1295, !1296, !1297, !1298, !1299, !1300, !1306, !1310, !1315, !1317, !1321, !1325, !1327, !1329, !1331, !1335, !1339, !1343, !1347, !1351, !1353, !1355, !1357, !1361, !1365, !1369, !1371}
!124 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !126, file: !127, line: 200)
!125 = !DINamespace(name: "std", scope: null)
!126 = !DISubprogram(name: "abs", linkageName: "_ZL3absi", scope: !127, file: !127, line: 30, type: !128, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!127 = !DIFile(filename: "/soft/compilers/llvm/release-17.0.6/lib/clang/17/include/__clang_cuda_math_forward_declares.h", directory: "")
!128 = !DISubroutineType(types: !129)
!129 = !{!10, !10}
!130 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !131, file: !127, line: 201)
!131 = !DISubprogram(name: "acos", linkageName: "_ZL4acosf", scope: !127, file: !127, line: 32, type: !132, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!132 = !DISubroutineType(types: !133)
!133 = !{!9, !9}
!134 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !135, file: !127, line: 202)
!135 = !DISubprogram(name: "acosh", linkageName: "_ZL5acoshf", scope: !127, file: !127, line: 34, type: !132, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!136 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !137, file: !127, line: 203)
!137 = !DISubprogram(name: "asin", linkageName: "_ZL4asinf", scope: !127, file: !127, line: 36, type: !132, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!138 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !139, file: !127, line: 204)
!139 = !DISubprogram(name: "asinh", linkageName: "_ZL5asinhf", scope: !127, file: !127, line: 38, type: !132, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!140 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !141, file: !127, line: 205)
!141 = !DISubprogram(name: "atan", linkageName: "_ZL4atanf", scope: !127, file: !127, line: 42, type: !132, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!142 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !143, file: !127, line: 206)
!143 = !DISubprogram(name: "atan2", linkageName: "_ZL5atan2ff", scope: !127, file: !127, line: 40, type: !144, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!144 = !DISubroutineType(types: !145)
!145 = !{!9, !9, !9}
!146 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !147, file: !127, line: 207)
!147 = !DISubprogram(name: "atanh", linkageName: "_ZL5atanhf", scope: !127, file: !127, line: 44, type: !132, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!148 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !149, file: !127, line: 208)
!149 = !DISubprogram(name: "cbrt", linkageName: "_ZL4cbrtf", scope: !127, file: !127, line: 46, type: !132, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!150 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !151, file: !127, line: 209)
!151 = !DISubprogram(name: "ceil", linkageName: "_ZL4ceilf", scope: !127, file: !127, line: 48, type: !132, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!152 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !153, file: !127, line: 210)
!153 = !DISubprogram(name: "copysign", linkageName: "_ZL8copysignff", scope: !127, file: !127, line: 50, type: !144, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!154 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !155, file: !127, line: 211)
!155 = !DISubprogram(name: "cos", linkageName: "_ZL3cosf", scope: !127, file: !127, line: 52, type: !132, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!156 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !157, file: !127, line: 212)
!157 = !DISubprogram(name: "cosh", linkageName: "_ZL4coshf", scope: !127, file: !127, line: 54, type: !132, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!158 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !159, file: !127, line: 213)
!159 = !DISubprogram(name: "erf", linkageName: "_ZL3erff", scope: !127, file: !127, line: 58, type: !132, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!160 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !161, file: !127, line: 214)
!161 = !DISubprogram(name: "erfc", linkageName: "_ZL4erfcf", scope: !127, file: !127, line: 56, type: !132, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!162 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !163, file: !127, line: 215)
!163 = !DISubprogram(name: "exp", linkageName: "_ZL3expf", scope: !127, file: !127, line: 62, type: !132, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!164 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !165, file: !127, line: 216)
!165 = !DISubprogram(name: "exp2", linkageName: "_ZL4exp2f", scope: !127, file: !127, line: 60, type: !132, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!166 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !167, file: !127, line: 217)
!167 = !DISubprogram(name: "expm1", linkageName: "_ZL5expm1f", scope: !127, file: !127, line: 64, type: !132, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!168 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !169, file: !127, line: 218)
!169 = !DISubprogram(name: "fabs", linkageName: "_ZL4fabsf", scope: !127, file: !127, line: 66, type: !132, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!170 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !171, file: !127, line: 219)
!171 = !DISubprogram(name: "fdim", linkageName: "_ZL4fdimff", scope: !127, file: !127, line: 68, type: !144, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!172 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !173, file: !127, line: 220)
!173 = !DISubprogram(name: "floor", linkageName: "_ZL5floorf", scope: !127, file: !127, line: 70, type: !132, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!174 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !175, file: !127, line: 221)
!175 = !DISubprogram(name: "fma", linkageName: "_ZL3fmafff", scope: !127, file: !127, line: 72, type: !176, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!176 = !DISubroutineType(types: !177)
!177 = !{!9, !9, !9, !9}
!178 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !179, file: !127, line: 222)
!179 = !DISubprogram(name: "fmax", linkageName: "_ZL4fmaxff", scope: !127, file: !127, line: 74, type: !144, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!180 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !181, file: !127, line: 223)
!181 = !DISubprogram(name: "fmin", linkageName: "_ZL4fminff", scope: !127, file: !127, line: 76, type: !144, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!182 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !183, file: !127, line: 224)
!183 = !DISubprogram(name: "fmod", linkageName: "_ZL4fmodff", scope: !127, file: !127, line: 78, type: !144, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!184 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !185, file: !127, line: 225)
!185 = !DISubprogram(name: "fpclassify", linkageName: "_ZL10fpclassifyf", scope: !127, file: !127, line: 80, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!186 = !DISubroutineType(types: !187)
!187 = !{!10, !9}
!188 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !189, file: !127, line: 226)
!189 = !DISubprogram(name: "frexp", linkageName: "_ZL5frexpfPi", scope: !127, file: !127, line: 82, type: !190, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!190 = !DISubroutineType(types: !191)
!191 = !{!9, !9, !192}
!192 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!193 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !194, file: !127, line: 227)
!194 = !DISubprogram(name: "hypot", linkageName: "_ZL5hypotff", scope: !127, file: !127, line: 84, type: !144, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!195 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !196, file: !127, line: 228)
!196 = !DISubprogram(name: "ilogb", linkageName: "_ZL5ilogbf", scope: !127, file: !127, line: 86, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!197 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !198, file: !127, line: 229)
!198 = !DISubprogram(name: "isfinite", linkageName: "_ZL8isfinitef", scope: !127, file: !127, line: 91, type: !199, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!199 = !DISubroutineType(types: !200)
!200 = !{!201, !9}
!201 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!202 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !203, file: !127, line: 230)
!203 = !DISubprogram(name: "isgreater", linkageName: "_ZL9isgreaterff", scope: !127, file: !127, line: 95, type: !204, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!204 = !DISubroutineType(types: !205)
!205 = !{!201, !9, !9}
!206 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !207, file: !127, line: 231)
!207 = !DISubprogram(name: "isgreaterequal", linkageName: "_ZL14isgreaterequalff", scope: !127, file: !127, line: 94, type: !204, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!208 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !209, file: !127, line: 232)
!209 = !DISubprogram(name: "isinf", linkageName: "_ZL5isinff", scope: !127, file: !127, line: 100, type: !199, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!210 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !211, file: !127, line: 233)
!211 = !DISubprogram(name: "isless", linkageName: "_ZL6islessff", scope: !127, file: !127, line: 104, type: !204, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!212 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !213, file: !127, line: 234)
!213 = !DISubprogram(name: "islessequal", linkageName: "_ZL11islessequalff", scope: !127, file: !127, line: 103, type: !204, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!214 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !215, file: !127, line: 235)
!215 = !DISubprogram(name: "islessgreater", linkageName: "_ZL13islessgreaterff", scope: !127, file: !127, line: 106, type: !204, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!216 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !217, file: !127, line: 236)
!217 = !DISubprogram(name: "isnan", linkageName: "_ZL5isnanf", scope: !127, file: !127, line: 111, type: !199, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!218 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !219, file: !127, line: 237)
!219 = !DISubprogram(name: "isnormal", linkageName: "_ZL8isnormalf", scope: !127, file: !127, line: 113, type: !199, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!220 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !221, file: !127, line: 238)
!221 = !DISubprogram(name: "isunordered", linkageName: "_ZL11isunorderedff", scope: !127, file: !127, line: 115, type: !204, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!222 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !223, file: !127, line: 239)
!223 = !DISubprogram(name: "labs", linkageName: "_ZL4labsl", scope: !127, file: !127, line: 116, type: !224, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!224 = !DISubroutineType(types: !225)
!225 = !{!226, !226}
!226 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!227 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !228, file: !127, line: 240)
!228 = !DISubprogram(name: "ldexp", linkageName: "_ZL5ldexpfi", scope: !127, file: !127, line: 118, type: !229, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!229 = !DISubroutineType(types: !230)
!230 = !{!9, !9, !10}
!231 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !232, file: !127, line: 241)
!232 = !DISubprogram(name: "lgamma", linkageName: "_ZL6lgammaf", scope: !127, file: !127, line: 120, type: !132, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!233 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !234, file: !127, line: 242)
!234 = !DISubprogram(name: "llabs", linkageName: "_ZL5llabsx", scope: !127, file: !127, line: 121, type: !235, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!235 = !DISubroutineType(types: !236)
!236 = !{!237, !237}
!237 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!238 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !239, file: !127, line: 243)
!239 = !DISubprogram(name: "llrint", linkageName: "_ZL6llrintf", scope: !127, file: !127, line: 123, type: !240, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!240 = !DISubroutineType(types: !241)
!241 = !{!237, !9}
!242 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !243, file: !127, line: 244)
!243 = !DISubprogram(name: "log", linkageName: "_ZL3logf", scope: !127, file: !127, line: 133, type: !132, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!244 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !245, file: !127, line: 245)
!245 = !DISubprogram(name: "log10", linkageName: "_ZL5log10f", scope: !127, file: !127, line: 125, type: !132, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!246 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !247, file: !127, line: 246)
!247 = !DISubprogram(name: "log1p", linkageName: "_ZL5log1pf", scope: !127, file: !127, line: 127, type: !132, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!248 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !249, file: !127, line: 247)
!249 = !DISubprogram(name: "log2", linkageName: "_ZL4log2f", scope: !127, file: !127, line: 129, type: !132, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!250 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !251, file: !127, line: 248)
!251 = !DISubprogram(name: "logb", linkageName: "_ZL4logbf", scope: !127, file: !127, line: 131, type: !132, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!252 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !253, file: !127, line: 249)
!253 = !DISubprogram(name: "lrint", linkageName: "_ZL5lrintf", scope: !127, file: !127, line: 135, type: !254, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!254 = !DISubroutineType(types: !255)
!255 = !{!226, !9}
!256 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !257, file: !127, line: 250)
!257 = !DISubprogram(name: "lround", linkageName: "_ZL6lroundf", scope: !127, file: !127, line: 137, type: !254, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!258 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !259, file: !127, line: 251)
!259 = !DISubprogram(name: "llround", linkageName: "_ZL7llroundf", scope: !127, file: !127, line: 138, type: !240, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!260 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !261, file: !127, line: 252)
!261 = !DISubprogram(name: "modf", linkageName: "_ZL4modffPf", scope: !127, file: !127, line: 140, type: !262, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!262 = !DISubroutineType(types: !263)
!263 = !{!9, !9, !264}
!264 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!265 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !266, file: !127, line: 253)
!266 = !DISubprogram(name: "nan", linkageName: "_ZL3nanPKc", scope: !127, file: !127, line: 141, type: !267, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!267 = !DISubroutineType(types: !268)
!268 = !{!269, !270}
!269 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!270 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !271, size: 64)
!271 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !272)
!272 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!273 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !274, file: !127, line: 254)
!274 = !DISubprogram(name: "nanf", linkageName: "_ZL4nanfPKc", scope: !127, file: !127, line: 142, type: !275, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!275 = !DISubroutineType(types: !276)
!276 = !{!9, !270}
!277 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !278, file: !127, line: 255)
!278 = !DISubprogram(name: "nearbyint", linkageName: "_ZL9nearbyintf", scope: !127, file: !127, line: 144, type: !132, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!279 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !280, file: !127, line: 256)
!280 = !DISubprogram(name: "nextafter", linkageName: "_ZL9nextafterff", scope: !127, file: !127, line: 146, type: !144, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!281 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !282, file: !127, line: 257)
!282 = !DISubprogram(name: "pow", linkageName: "_ZL3powfi", scope: !127, file: !127, line: 150, type: !229, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!283 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !284, file: !127, line: 258)
!284 = !DISubprogram(name: "remainder", linkageName: "_ZL9remainderff", scope: !127, file: !127, line: 152, type: !144, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!285 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !286, file: !127, line: 259)
!286 = !DISubprogram(name: "remquo", linkageName: "_ZL6remquoffPi", scope: !127, file: !127, line: 154, type: !287, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!287 = !DISubroutineType(types: !288)
!288 = !{!9, !9, !9, !192}
!289 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !290, file: !127, line: 260)
!290 = !DISubprogram(name: "rint", linkageName: "_ZL4rintf", scope: !127, file: !127, line: 156, type: !132, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!291 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !292, file: !127, line: 261)
!292 = !DISubprogram(name: "round", linkageName: "_ZL5roundf", scope: !127, file: !127, line: 158, type: !132, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!293 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !294, file: !127, line: 262)
!294 = !DISubprogram(name: "scalbln", linkageName: "_ZL7scalblnfl", scope: !127, file: !127, line: 160, type: !295, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!295 = !DISubroutineType(types: !296)
!296 = !{!9, !9, !226}
!297 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !298, file: !127, line: 263)
!298 = !DISubprogram(name: "scalbn", linkageName: "_ZL6scalbnfi", scope: !127, file: !127, line: 162, type: !229, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!299 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !300, file: !127, line: 264)
!300 = !DISubprogram(name: "signbit", linkageName: "_ZL7signbitf", scope: !127, file: !127, line: 167, type: !199, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!301 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !302, file: !127, line: 265)
!302 = !DISubprogram(name: "sin", linkageName: "_ZL3sinf", scope: !127, file: !127, line: 169, type: !132, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!303 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !304, file: !127, line: 266)
!304 = !DISubprogram(name: "sinh", linkageName: "_ZL4sinhf", scope: !127, file: !127, line: 171, type: !132, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!305 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !306, file: !127, line: 267)
!306 = !DISubprogram(name: "sqrt", linkageName: "_ZL4sqrtf", scope: !127, file: !127, line: 173, type: !132, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!307 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !308, file: !127, line: 268)
!308 = !DISubprogram(name: "tan", linkageName: "_ZL3tanf", scope: !127, file: !127, line: 175, type: !132, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!309 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !310, file: !127, line: 269)
!310 = !DISubprogram(name: "tanh", linkageName: "_ZL4tanhf", scope: !127, file: !127, line: 177, type: !132, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!311 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !312, file: !127, line: 270)
!312 = !DISubprogram(name: "tgamma", linkageName: "_ZL6tgammaf", scope: !127, file: !127, line: 179, type: !132, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!313 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !314, file: !127, line: 271)
!314 = !DISubprogram(name: "trunc", linkageName: "_ZL5truncf", scope: !127, file: !127, line: 181, type: !132, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!315 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !316, file: !318, line: 52)
!316 = !DISubprogram(name: "abs", scope: !317, file: !317, line: 980, type: !128, flags: DIFlagPrototyped, spFlags: 0)
!317 = !DIFile(filename: "/usr/include/stdlib.h", directory: "")
!318 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/12/../../../../include/c++/12/bits/std_abs.h", directory: "")
!319 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !320, file: !324, line: 83)
!320 = !DISubprogram(name: "acos", scope: !321, file: !321, line: 53, type: !322, flags: DIFlagPrototyped, spFlags: 0)
!321 = !DIFile(filename: "/usr/include/bits/mathcalls.h", directory: "")
!322 = !DISubroutineType(types: !323)
!323 = !{!269, !269}
!324 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/12/../../../../include/c++/12/cmath", directory: "")
!325 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !326, file: !324, line: 102)
!326 = !DISubprogram(name: "asin", scope: !321, file: !321, line: 55, type: !322, flags: DIFlagPrototyped, spFlags: 0)
!327 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !328, file: !324, line: 121)
!328 = !DISubprogram(name: "atan", scope: !321, file: !321, line: 57, type: !322, flags: DIFlagPrototyped, spFlags: 0)
!329 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !330, file: !324, line: 140)
!330 = !DISubprogram(name: "atan2", scope: !321, file: !321, line: 59, type: !331, flags: DIFlagPrototyped, spFlags: 0)
!331 = !DISubroutineType(types: !332)
!332 = !{!269, !269, !269}
!333 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !334, file: !324, line: 161)
!334 = !DISubprogram(name: "ceil", scope: !321, file: !321, line: 159, type: !322, flags: DIFlagPrototyped, spFlags: 0)
!335 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !336, file: !324, line: 180)
!336 = !DISubprogram(name: "cos", scope: !321, file: !321, line: 62, type: !322, flags: DIFlagPrototyped, spFlags: 0)
!337 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !338, file: !324, line: 199)
!338 = !DISubprogram(name: "cosh", scope: !321, file: !321, line: 71, type: !322, flags: DIFlagPrototyped, spFlags: 0)
!339 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !340, file: !324, line: 218)
!340 = !DISubprogram(name: "exp", scope: !321, file: !321, line: 95, type: !322, flags: DIFlagPrototyped, spFlags: 0)
!341 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !342, file: !324, line: 237)
!342 = !DISubprogram(name: "fabs", scope: !321, file: !321, line: 162, type: !322, flags: DIFlagPrototyped, spFlags: 0)
!343 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !344, file: !324, line: 256)
!344 = !DISubprogram(name: "floor", scope: !321, file: !321, line: 165, type: !322, flags: DIFlagPrototyped, spFlags: 0)
!345 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !346, file: !324, line: 275)
!346 = !DISubprogram(name: "fmod", scope: !321, file: !321, line: 168, type: !331, flags: DIFlagPrototyped, spFlags: 0)
!347 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !348, file: !324, line: 296)
!348 = !DISubprogram(name: "frexp", scope: !321, file: !321, line: 98, type: !349, flags: DIFlagPrototyped, spFlags: 0)
!349 = !DISubroutineType(types: !350)
!350 = !{!269, !269, !192}
!351 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !352, file: !324, line: 315)
!352 = !DISubprogram(name: "ldexp", scope: !321, file: !321, line: 101, type: !353, flags: DIFlagPrototyped, spFlags: 0)
!353 = !DISubroutineType(types: !354)
!354 = !{!269, !269, !10}
!355 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !356, file: !324, line: 334)
!356 = !DISubprogram(name: "log", scope: !321, file: !321, line: 104, type: !322, flags: DIFlagPrototyped, spFlags: 0)
!357 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !358, file: !324, line: 353)
!358 = !DISubprogram(name: "log10", scope: !321, file: !321, line: 107, type: !322, flags: DIFlagPrototyped, spFlags: 0)
!359 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !360, file: !324, line: 372)
!360 = !DISubprogram(name: "modf", scope: !321, file: !321, line: 110, type: !361, flags: DIFlagPrototyped, spFlags: 0)
!361 = !DISubroutineType(types: !362)
!362 = !{!269, !269, !363}
!363 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !269, size: 64)
!364 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !365, file: !324, line: 384)
!365 = !DISubprogram(name: "pow", scope: !321, file: !321, line: 140, type: !331, flags: DIFlagPrototyped, spFlags: 0)
!366 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !367, file: !324, line: 421)
!367 = !DISubprogram(name: "sin", scope: !321, file: !321, line: 64, type: !322, flags: DIFlagPrototyped, spFlags: 0)
!368 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !369, file: !324, line: 440)
!369 = !DISubprogram(name: "sinh", scope: !321, file: !321, line: 73, type: !322, flags: DIFlagPrototyped, spFlags: 0)
!370 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !371, file: !324, line: 459)
!371 = !DISubprogram(name: "sqrt", scope: !321, file: !321, line: 143, type: !322, flags: DIFlagPrototyped, spFlags: 0)
!372 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !373, file: !324, line: 478)
!373 = !DISubprogram(name: "tan", scope: !321, file: !321, line: 66, type: !322, flags: DIFlagPrototyped, spFlags: 0)
!374 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !375, file: !324, line: 497)
!375 = !DISubprogram(name: "tanh", scope: !321, file: !321, line: 75, type: !322, flags: DIFlagPrototyped, spFlags: 0)
!376 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !377, file: !324, line: 1065)
!377 = !DIDerivedType(tag: DW_TAG_typedef, name: "double_t", file: !378, line: 164, baseType: !269)
!378 = !DIFile(filename: "/usr/include/math.h", directory: "")
!379 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !380, file: !324, line: 1066)
!380 = !DIDerivedType(tag: DW_TAG_typedef, name: "float_t", file: !378, line: 163, baseType: !9)
!381 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !382, file: !324, line: 1069)
!382 = !DISubprogram(name: "acosh", scope: !321, file: !321, line: 85, type: !322, flags: DIFlagPrototyped, spFlags: 0)
!383 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !384, file: !324, line: 1070)
!384 = !DISubprogram(name: "acoshf", scope: !321, file: !321, line: 85, type: !132, flags: DIFlagPrototyped, spFlags: 0)
!385 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !386, file: !324, line: 1071)
!386 = !DISubprogram(name: "acoshl", scope: !321, file: !321, line: 85, type: !387, flags: DIFlagPrototyped, spFlags: 0)
!387 = !DISubroutineType(types: !388)
!388 = !{!389, !389}
!389 = !DIBasicType(name: "long double", size: 64, encoding: DW_ATE_float)
!390 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !391, file: !324, line: 1073)
!391 = !DISubprogram(name: "asinh", scope: !321, file: !321, line: 87, type: !322, flags: DIFlagPrototyped, spFlags: 0)
!392 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !393, file: !324, line: 1074)
!393 = !DISubprogram(name: "asinhf", scope: !321, file: !321, line: 87, type: !132, flags: DIFlagPrototyped, spFlags: 0)
!394 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !395, file: !324, line: 1075)
!395 = !DISubprogram(name: "asinhl", scope: !321, file: !321, line: 87, type: !387, flags: DIFlagPrototyped, spFlags: 0)
!396 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !397, file: !324, line: 1077)
!397 = !DISubprogram(name: "atanh", scope: !321, file: !321, line: 89, type: !322, flags: DIFlagPrototyped, spFlags: 0)
!398 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !399, file: !324, line: 1078)
!399 = !DISubprogram(name: "atanhf", scope: !321, file: !321, line: 89, type: !132, flags: DIFlagPrototyped, spFlags: 0)
!400 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !401, file: !324, line: 1079)
!401 = !DISubprogram(name: "atanhl", scope: !321, file: !321, line: 89, type: !387, flags: DIFlagPrototyped, spFlags: 0)
!402 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !403, file: !324, line: 1081)
!403 = !DISubprogram(name: "cbrt", scope: !321, file: !321, line: 152, type: !322, flags: DIFlagPrototyped, spFlags: 0)
!404 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !405, file: !324, line: 1082)
!405 = !DISubprogram(name: "cbrtf", scope: !321, file: !321, line: 152, type: !132, flags: DIFlagPrototyped, spFlags: 0)
!406 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !407, file: !324, line: 1083)
!407 = !DISubprogram(name: "cbrtl", scope: !321, file: !321, line: 152, type: !387, flags: DIFlagPrototyped, spFlags: 0)
!408 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !409, file: !324, line: 1085)
!409 = !DISubprogram(name: "copysign", scope: !321, file: !321, line: 198, type: !331, flags: DIFlagPrototyped, spFlags: 0)
!410 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !411, file: !324, line: 1086)
!411 = !DISubprogram(name: "copysignf", scope: !321, file: !321, line: 198, type: !144, flags: DIFlagPrototyped, spFlags: 0)
!412 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !413, file: !324, line: 1087)
!413 = !DISubprogram(name: "copysignl", scope: !321, file: !321, line: 198, type: !414, flags: DIFlagPrototyped, spFlags: 0)
!414 = !DISubroutineType(types: !415)
!415 = !{!389, !389, !389}
!416 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !417, file: !324, line: 1089)
!417 = !DISubprogram(name: "erf", scope: !321, file: !321, line: 231, type: !322, flags: DIFlagPrototyped, spFlags: 0)
!418 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !419, file: !324, line: 1090)
!419 = !DISubprogram(name: "erff", scope: !321, file: !321, line: 231, type: !132, flags: DIFlagPrototyped, spFlags: 0)
!420 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !421, file: !324, line: 1091)
!421 = !DISubprogram(name: "erfl", scope: !321, file: !321, line: 231, type: !387, flags: DIFlagPrototyped, spFlags: 0)
!422 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !423, file: !324, line: 1093)
!423 = !DISubprogram(name: "erfc", scope: !321, file: !321, line: 232, type: !322, flags: DIFlagPrototyped, spFlags: 0)
!424 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !425, file: !324, line: 1094)
!425 = !DISubprogram(name: "erfcf", scope: !321, file: !321, line: 232, type: !132, flags: DIFlagPrototyped, spFlags: 0)
!426 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !427, file: !324, line: 1095)
!427 = !DISubprogram(name: "erfcl", scope: !321, file: !321, line: 232, type: !387, flags: DIFlagPrototyped, spFlags: 0)
!428 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !429, file: !324, line: 1097)
!429 = !DISubprogram(name: "exp2", scope: !321, file: !321, line: 130, type: !322, flags: DIFlagPrototyped, spFlags: 0)
!430 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !431, file: !324, line: 1098)
!431 = !DISubprogram(name: "exp2f", scope: !321, file: !321, line: 130, type: !132, flags: DIFlagPrototyped, spFlags: 0)
!432 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !433, file: !324, line: 1099)
!433 = !DISubprogram(name: "exp2l", scope: !321, file: !321, line: 130, type: !387, flags: DIFlagPrototyped, spFlags: 0)
!434 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !435, file: !324, line: 1101)
!435 = !DISubprogram(name: "expm1", scope: !321, file: !321, line: 119, type: !322, flags: DIFlagPrototyped, spFlags: 0)
!436 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !437, file: !324, line: 1102)
!437 = !DISubprogram(name: "expm1f", scope: !321, file: !321, line: 119, type: !132, flags: DIFlagPrototyped, spFlags: 0)
!438 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !439, file: !324, line: 1103)
!439 = !DISubprogram(name: "expm1l", scope: !321, file: !321, line: 119, type: !387, flags: DIFlagPrototyped, spFlags: 0)
!440 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !441, file: !324, line: 1105)
!441 = !DISubprogram(name: "fdim", scope: !321, file: !321, line: 329, type: !331, flags: DIFlagPrototyped, spFlags: 0)
!442 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !443, file: !324, line: 1106)
!443 = !DISubprogram(name: "fdimf", scope: !321, file: !321, line: 329, type: !144, flags: DIFlagPrototyped, spFlags: 0)
!444 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !445, file: !324, line: 1107)
!445 = !DISubprogram(name: "fdiml", scope: !321, file: !321, line: 329, type: !414, flags: DIFlagPrototyped, spFlags: 0)
!446 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !447, file: !324, line: 1109)
!447 = !DISubprogram(name: "fma", scope: !321, file: !321, line: 340, type: !448, flags: DIFlagPrototyped, spFlags: 0)
!448 = !DISubroutineType(types: !449)
!449 = !{!269, !269, !269, !269}
!450 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !451, file: !324, line: 1110)
!451 = !DISubprogram(name: "fmaf", scope: !321, file: !321, line: 340, type: !176, flags: DIFlagPrototyped, spFlags: 0)
!452 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !453, file: !324, line: 1111)
!453 = !DISubprogram(name: "fmal", scope: !321, file: !321, line: 340, type: !454, flags: DIFlagPrototyped, spFlags: 0)
!454 = !DISubroutineType(types: !455)
!455 = !{!389, !389, !389, !389}
!456 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !457, file: !324, line: 1113)
!457 = !DISubprogram(name: "fmax", scope: !321, file: !321, line: 333, type: !331, flags: DIFlagPrototyped, spFlags: 0)
!458 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !459, file: !324, line: 1114)
!459 = !DISubprogram(name: "fmaxf", scope: !321, file: !321, line: 333, type: !144, flags: DIFlagPrototyped, spFlags: 0)
!460 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !461, file: !324, line: 1115)
!461 = !DISubprogram(name: "fmaxl", scope: !321, file: !321, line: 333, type: !414, flags: DIFlagPrototyped, spFlags: 0)
!462 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !463, file: !324, line: 1117)
!463 = !DISubprogram(name: "fmin", scope: !321, file: !321, line: 336, type: !331, flags: DIFlagPrototyped, spFlags: 0)
!464 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !465, file: !324, line: 1118)
!465 = !DISubprogram(name: "fminf", scope: !321, file: !321, line: 336, type: !144, flags: DIFlagPrototyped, spFlags: 0)
!466 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !467, file: !324, line: 1119)
!467 = !DISubprogram(name: "fminl", scope: !321, file: !321, line: 336, type: !414, flags: DIFlagPrototyped, spFlags: 0)
!468 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !469, file: !324, line: 1121)
!469 = !DISubprogram(name: "hypot", scope: !321, file: !321, line: 147, type: !331, flags: DIFlagPrototyped, spFlags: 0)
!470 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !471, file: !324, line: 1122)
!471 = !DISubprogram(name: "hypotf", scope: !321, file: !321, line: 147, type: !144, flags: DIFlagPrototyped, spFlags: 0)
!472 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !473, file: !324, line: 1123)
!473 = !DISubprogram(name: "hypotl", scope: !321, file: !321, line: 147, type: !414, flags: DIFlagPrototyped, spFlags: 0)
!474 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !475, file: !324, line: 1125)
!475 = !DISubprogram(name: "ilogb", scope: !321, file: !321, line: 283, type: !476, flags: DIFlagPrototyped, spFlags: 0)
!476 = !DISubroutineType(types: !477)
!477 = !{!10, !269}
!478 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !479, file: !324, line: 1126)
!479 = !DISubprogram(name: "ilogbf", scope: !321, file: !321, line: 283, type: !186, flags: DIFlagPrototyped, spFlags: 0)
!480 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !481, file: !324, line: 1127)
!481 = !DISubprogram(name: "ilogbl", scope: !321, file: !321, line: 283, type: !482, flags: DIFlagPrototyped, spFlags: 0)
!482 = !DISubroutineType(types: !483)
!483 = !{!10, !389}
!484 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !485, file: !324, line: 1129)
!485 = !DISubprogram(name: "lgamma", scope: !321, file: !321, line: 233, type: !322, flags: DIFlagPrototyped, spFlags: 0)
!486 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !487, file: !324, line: 1130)
!487 = !DISubprogram(name: "lgammaf", scope: !321, file: !321, line: 233, type: !132, flags: DIFlagPrototyped, spFlags: 0)
!488 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !489, file: !324, line: 1131)
!489 = !DISubprogram(name: "lgammal", scope: !321, file: !321, line: 233, type: !387, flags: DIFlagPrototyped, spFlags: 0)
!490 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !491, file: !324, line: 1134)
!491 = !DISubprogram(name: "llrint", scope: !321, file: !321, line: 319, type: !492, flags: DIFlagPrototyped, spFlags: 0)
!492 = !DISubroutineType(types: !493)
!493 = !{!237, !269}
!494 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !495, file: !324, line: 1135)
!495 = !DISubprogram(name: "llrintf", scope: !321, file: !321, line: 319, type: !240, flags: DIFlagPrototyped, spFlags: 0)
!496 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !497, file: !324, line: 1136)
!497 = !DISubprogram(name: "llrintl", scope: !321, file: !321, line: 319, type: !498, flags: DIFlagPrototyped, spFlags: 0)
!498 = !DISubroutineType(types: !499)
!499 = !{!237, !389}
!500 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !501, file: !324, line: 1138)
!501 = !DISubprogram(name: "llround", scope: !321, file: !321, line: 325, type: !492, flags: DIFlagPrototyped, spFlags: 0)
!502 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !503, file: !324, line: 1139)
!503 = !DISubprogram(name: "llroundf", scope: !321, file: !321, line: 325, type: !240, flags: DIFlagPrototyped, spFlags: 0)
!504 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !505, file: !324, line: 1140)
!505 = !DISubprogram(name: "llroundl", scope: !321, file: !321, line: 325, type: !498, flags: DIFlagPrototyped, spFlags: 0)
!506 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !507, file: !324, line: 1143)
!507 = !DISubprogram(name: "log1p", scope: !321, file: !321, line: 122, type: !322, flags: DIFlagPrototyped, spFlags: 0)
!508 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !509, file: !324, line: 1144)
!509 = !DISubprogram(name: "log1pf", scope: !321, file: !321, line: 122, type: !132, flags: DIFlagPrototyped, spFlags: 0)
!510 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !511, file: !324, line: 1145)
!511 = !DISubprogram(name: "log1pl", scope: !321, file: !321, line: 122, type: !387, flags: DIFlagPrototyped, spFlags: 0)
!512 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !513, file: !324, line: 1147)
!513 = !DISubprogram(name: "log2", scope: !321, file: !321, line: 133, type: !322, flags: DIFlagPrototyped, spFlags: 0)
!514 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !515, file: !324, line: 1148)
!515 = !DISubprogram(name: "log2f", scope: !321, file: !321, line: 133, type: !132, flags: DIFlagPrototyped, spFlags: 0)
!516 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !517, file: !324, line: 1149)
!517 = !DISubprogram(name: "log2l", scope: !321, file: !321, line: 133, type: !387, flags: DIFlagPrototyped, spFlags: 0)
!518 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !519, file: !324, line: 1151)
!519 = !DISubprogram(name: "logb", scope: !321, file: !321, line: 125, type: !322, flags: DIFlagPrototyped, spFlags: 0)
!520 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !521, file: !324, line: 1152)
!521 = !DISubprogram(name: "logbf", scope: !321, file: !321, line: 125, type: !132, flags: DIFlagPrototyped, spFlags: 0)
!522 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !523, file: !324, line: 1153)
!523 = !DISubprogram(name: "logbl", scope: !321, file: !321, line: 125, type: !387, flags: DIFlagPrototyped, spFlags: 0)
!524 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !525, file: !324, line: 1155)
!525 = !DISubprogram(name: "lrint", scope: !321, file: !321, line: 317, type: !526, flags: DIFlagPrototyped, spFlags: 0)
!526 = !DISubroutineType(types: !527)
!527 = !{!226, !269}
!528 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !529, file: !324, line: 1156)
!529 = !DISubprogram(name: "lrintf", scope: !321, file: !321, line: 317, type: !254, flags: DIFlagPrototyped, spFlags: 0)
!530 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !531, file: !324, line: 1157)
!531 = !DISubprogram(name: "lrintl", scope: !321, file: !321, line: 317, type: !532, flags: DIFlagPrototyped, spFlags: 0)
!532 = !DISubroutineType(types: !533)
!533 = !{!226, !389}
!534 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !535, file: !324, line: 1159)
!535 = !DISubprogram(name: "lround", scope: !321, file: !321, line: 323, type: !526, flags: DIFlagPrototyped, spFlags: 0)
!536 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !537, file: !324, line: 1160)
!537 = !DISubprogram(name: "lroundf", scope: !321, file: !321, line: 323, type: !254, flags: DIFlagPrototyped, spFlags: 0)
!538 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !539, file: !324, line: 1161)
!539 = !DISubprogram(name: "lroundl", scope: !321, file: !321, line: 323, type: !532, flags: DIFlagPrototyped, spFlags: 0)
!540 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !541, file: !324, line: 1163)
!541 = !DISubprogram(name: "nan", scope: !321, file: !321, line: 203, type: !267, flags: DIFlagPrototyped, spFlags: 0)
!542 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !543, file: !324, line: 1164)
!543 = !DISubprogram(name: "nanf", scope: !321, file: !321, line: 203, type: !275, flags: DIFlagPrototyped, spFlags: 0)
!544 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !545, file: !324, line: 1165)
!545 = !DISubprogram(name: "nanl", scope: !321, file: !321, line: 203, type: !546, flags: DIFlagPrototyped, spFlags: 0)
!546 = !DISubroutineType(types: !547)
!547 = !{!389, !270}
!548 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !549, file: !324, line: 1167)
!549 = !DISubprogram(name: "nearbyint", scope: !321, file: !321, line: 297, type: !322, flags: DIFlagPrototyped, spFlags: 0)
!550 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !551, file: !324, line: 1168)
!551 = !DISubprogram(name: "nearbyintf", scope: !321, file: !321, line: 297, type: !132, flags: DIFlagPrototyped, spFlags: 0)
!552 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !553, file: !324, line: 1169)
!553 = !DISubprogram(name: "nearbyintl", scope: !321, file: !321, line: 297, type: !387, flags: DIFlagPrototyped, spFlags: 0)
!554 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !555, file: !324, line: 1171)
!555 = !DISubprogram(name: "nextafter", scope: !321, file: !321, line: 262, type: !331, flags: DIFlagPrototyped, spFlags: 0)
!556 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !557, file: !324, line: 1172)
!557 = !DISubprogram(name: "nextafterf", scope: !321, file: !321, line: 262, type: !144, flags: DIFlagPrototyped, spFlags: 0)
!558 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !559, file: !324, line: 1173)
!559 = !DISubprogram(name: "nextafterl", scope: !321, file: !321, line: 262, type: !414, flags: DIFlagPrototyped, spFlags: 0)
!560 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !561, file: !324, line: 1175)
!561 = !DISubprogram(name: "nexttoward", scope: !321, file: !321, line: 264, type: !562, flags: DIFlagPrototyped, spFlags: 0)
!562 = !DISubroutineType(types: !563)
!563 = !{!269, !269, !389}
!564 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !565, file: !324, line: 1176)
!565 = !DISubprogram(name: "nexttowardf", scope: !321, file: !321, line: 264, type: !566, flags: DIFlagPrototyped, spFlags: 0)
!566 = !DISubroutineType(types: !567)
!567 = !{!9, !9, !389}
!568 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !569, file: !324, line: 1177)
!569 = !DISubprogram(name: "nexttowardl", scope: !321, file: !321, line: 264, type: !414, flags: DIFlagPrototyped, spFlags: 0)
!570 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !571, file: !324, line: 1179)
!571 = !DISubprogram(name: "remainder", scope: !321, file: !321, line: 275, type: !331, flags: DIFlagPrototyped, spFlags: 0)
!572 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !573, file: !324, line: 1180)
!573 = !DISubprogram(name: "remainderf", scope: !321, file: !321, line: 275, type: !144, flags: DIFlagPrototyped, spFlags: 0)
!574 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !575, file: !324, line: 1181)
!575 = !DISubprogram(name: "remainderl", scope: !321, file: !321, line: 275, type: !414, flags: DIFlagPrototyped, spFlags: 0)
!576 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !577, file: !324, line: 1183)
!577 = !DISubprogram(name: "remquo", scope: !321, file: !321, line: 310, type: !578, flags: DIFlagPrototyped, spFlags: 0)
!578 = !DISubroutineType(types: !579)
!579 = !{!269, !269, !269, !192}
!580 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !581, file: !324, line: 1184)
!581 = !DISubprogram(name: "remquof", scope: !321, file: !321, line: 310, type: !287, flags: DIFlagPrototyped, spFlags: 0)
!582 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !583, file: !324, line: 1185)
!583 = !DISubprogram(name: "remquol", scope: !321, file: !321, line: 310, type: !584, flags: DIFlagPrototyped, spFlags: 0)
!584 = !DISubroutineType(types: !585)
!585 = !{!389, !389, !389, !192}
!586 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !587, file: !324, line: 1187)
!587 = !DISubprogram(name: "rint", scope: !321, file: !321, line: 259, type: !322, flags: DIFlagPrototyped, spFlags: 0)
!588 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !589, file: !324, line: 1188)
!589 = !DISubprogram(name: "rintf", scope: !321, file: !321, line: 259, type: !132, flags: DIFlagPrototyped, spFlags: 0)
!590 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !591, file: !324, line: 1189)
!591 = !DISubprogram(name: "rintl", scope: !321, file: !321, line: 259, type: !387, flags: DIFlagPrototyped, spFlags: 0)
!592 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !593, file: !324, line: 1191)
!593 = !DISubprogram(name: "round", scope: !321, file: !321, line: 301, type: !322, flags: DIFlagPrototyped, spFlags: 0)
!594 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !595, file: !324, line: 1192)
!595 = !DISubprogram(name: "roundf", scope: !321, file: !321, line: 301, type: !132, flags: DIFlagPrototyped, spFlags: 0)
!596 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !597, file: !324, line: 1193)
!597 = !DISubprogram(name: "roundl", scope: !321, file: !321, line: 301, type: !387, flags: DIFlagPrototyped, spFlags: 0)
!598 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !599, file: !324, line: 1195)
!599 = !DISubprogram(name: "scalbln", scope: !321, file: !321, line: 293, type: !600, flags: DIFlagPrototyped, spFlags: 0)
!600 = !DISubroutineType(types: !601)
!601 = !{!269, !269, !226}
!602 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !603, file: !324, line: 1196)
!603 = !DISubprogram(name: "scalblnf", scope: !321, file: !321, line: 293, type: !295, flags: DIFlagPrototyped, spFlags: 0)
!604 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !605, file: !324, line: 1197)
!605 = !DISubprogram(name: "scalblnl", scope: !321, file: !321, line: 293, type: !606, flags: DIFlagPrototyped, spFlags: 0)
!606 = !DISubroutineType(types: !607)
!607 = !{!389, !389, !226}
!608 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !609, file: !324, line: 1199)
!609 = !DISubprogram(name: "scalbn", scope: !321, file: !321, line: 279, type: !353, flags: DIFlagPrototyped, spFlags: 0)
!610 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !611, file: !324, line: 1200)
!611 = !DISubprogram(name: "scalbnf", scope: !321, file: !321, line: 279, type: !229, flags: DIFlagPrototyped, spFlags: 0)
!612 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !613, file: !324, line: 1201)
!613 = !DISubprogram(name: "scalbnl", scope: !321, file: !321, line: 279, type: !614, flags: DIFlagPrototyped, spFlags: 0)
!614 = !DISubroutineType(types: !615)
!615 = !{!389, !389, !10}
!616 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !617, file: !324, line: 1203)
!617 = !DISubprogram(name: "tgamma", scope: !321, file: !321, line: 238, type: !322, flags: DIFlagPrototyped, spFlags: 0)
!618 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !619, file: !324, line: 1204)
!619 = !DISubprogram(name: "tgammaf", scope: !321, file: !321, line: 238, type: !132, flags: DIFlagPrototyped, spFlags: 0)
!620 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !621, file: !324, line: 1205)
!621 = !DISubprogram(name: "tgammal", scope: !321, file: !321, line: 238, type: !387, flags: DIFlagPrototyped, spFlags: 0)
!622 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !623, file: !324, line: 1207)
!623 = !DISubprogram(name: "trunc", scope: !321, file: !321, line: 305, type: !322, flags: DIFlagPrototyped, spFlags: 0)
!624 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !625, file: !324, line: 1208)
!625 = !DISubprogram(name: "truncf", scope: !321, file: !321, line: 305, type: !132, flags: DIFlagPrototyped, spFlags: 0)
!626 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !627, file: !324, line: 1209)
!627 = !DISubprogram(name: "truncl", scope: !321, file: !321, line: 305, type: !387, flags: DIFlagPrototyped, spFlags: 0)
!628 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !629, entity: !630, file: !631, line: 58)
!629 = !DINamespace(name: "__gnu_debug", scope: null)
!630 = !DINamespace(name: "__debug", scope: !125)
!631 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/12/../../../../include/c++/12/debug/debug.h", directory: "")
!632 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !633, file: !635, line: 127)
!633 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !317, line: 63, baseType: !634)
!634 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !317, line: 59, size: 64, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!635 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/12/../../../../include/c++/12/cstdlib", directory: "")
!636 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !637, file: !635, line: 128)
!637 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !317, line: 71, baseType: !638)
!638 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !317, line: 67, size: 128, flags: DIFlagTypePassByValue, elements: !639, identifier: "_ZTS6ldiv_t")
!639 = !{!640, !641}
!640 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !638, file: !317, line: 69, baseType: !226, size: 64)
!641 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !638, file: !317, line: 70, baseType: !226, size: 64, offset: 64)
!642 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !643, file: !635, line: 130)
!643 = !DISubprogram(name: "abort", scope: !317, file: !317, line: 730, type: !644, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!644 = !DISubroutineType(types: !645)
!645 = !{null}
!646 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !647, file: !635, line: 132)
!647 = !DISubprogram(name: "aligned_alloc", scope: !317, file: !317, line: 724, type: !648, flags: DIFlagPrototyped, spFlags: 0)
!648 = !DISubroutineType(types: !649)
!649 = !{!650, !651, !651}
!650 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!651 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !652, line: 46, baseType: !653)
!652 = !DIFile(filename: "/soft/compilers/llvm/release-17.0.6/lib/clang/17/include/stddef.h", directory: "")
!653 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!654 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !655, file: !635, line: 134)
!655 = !DISubprogram(name: "atexit", scope: !317, file: !317, line: 734, type: !656, flags: DIFlagPrototyped, spFlags: 0)
!656 = !DISubroutineType(types: !657)
!657 = !{!10, !658}
!658 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !644, size: 64)
!659 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !660, file: !635, line: 137)
!660 = !DISubprogram(name: "at_quick_exit", scope: !317, file: !317, line: 739, type: !656, flags: DIFlagPrototyped, spFlags: 0)
!661 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !662, file: !635, line: 140)
!662 = !DISubprogram(name: "atof", scope: !317, file: !317, line: 102, type: !267, flags: DIFlagPrototyped, spFlags: 0)
!663 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !664, file: !635, line: 141)
!664 = !DISubprogram(name: "atoi", scope: !317, file: !317, line: 105, type: !665, flags: DIFlagPrototyped, spFlags: 0)
!665 = !DISubroutineType(types: !666)
!666 = !{!10, !270}
!667 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !668, file: !635, line: 142)
!668 = !DISubprogram(name: "atol", scope: !317, file: !317, line: 108, type: !669, flags: DIFlagPrototyped, spFlags: 0)
!669 = !DISubroutineType(types: !670)
!670 = !{!226, !270}
!671 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !672, file: !635, line: 143)
!672 = !DISubprogram(name: "bsearch", scope: !317, file: !317, line: 960, type: !673, flags: DIFlagPrototyped, spFlags: 0)
!673 = !DISubroutineType(types: !674)
!674 = !{!650, !675, !675, !651, !651, !677}
!675 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !676, size: 64)
!676 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!677 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !317, line: 948, baseType: !678)
!678 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !679, size: 64)
!679 = !DISubroutineType(types: !680)
!680 = !{!10, !675, !675}
!681 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !682, file: !635, line: 144)
!682 = !DISubprogram(name: "calloc", scope: !317, file: !317, line: 675, type: !648, flags: DIFlagPrototyped, spFlags: 0)
!683 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !684, file: !635, line: 145)
!684 = !DISubprogram(name: "div", scope: !317, file: !317, line: 992, type: !685, flags: DIFlagPrototyped, spFlags: 0)
!685 = !DISubroutineType(types: !686)
!686 = !{!633, !10, !10}
!687 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !688, file: !635, line: 146)
!688 = !DISubprogram(name: "exit", scope: !317, file: !317, line: 756, type: !689, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!689 = !DISubroutineType(types: !690)
!690 = !{null, !10}
!691 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !692, file: !635, line: 147)
!692 = !DISubprogram(name: "free", scope: !317, file: !317, line: 687, type: !693, flags: DIFlagPrototyped, spFlags: 0)
!693 = !DISubroutineType(types: !694)
!694 = !{null, !650}
!695 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !696, file: !635, line: 148)
!696 = !DISubprogram(name: "getenv", scope: !317, file: !317, line: 773, type: !697, flags: DIFlagPrototyped, spFlags: 0)
!697 = !DISubroutineType(types: !698)
!698 = !{!699, !270}
!699 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !272, size: 64)
!700 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !701, file: !635, line: 149)
!701 = !DISubprogram(name: "labs", scope: !317, file: !317, line: 981, type: !224, flags: DIFlagPrototyped, spFlags: 0)
!702 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !703, file: !635, line: 150)
!703 = !DISubprogram(name: "ldiv", scope: !317, file: !317, line: 994, type: !704, flags: DIFlagPrototyped, spFlags: 0)
!704 = !DISubroutineType(types: !705)
!705 = !{!637, !226, !226}
!706 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !707, file: !635, line: 151)
!707 = !DISubprogram(name: "malloc", scope: !317, file: !317, line: 672, type: !708, flags: DIFlagPrototyped, spFlags: 0)
!708 = !DISubroutineType(types: !709)
!709 = !{!650, !651}
!710 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !711, file: !635, line: 153)
!711 = !DISubprogram(name: "mblen", scope: !317, file: !317, line: 1062, type: !712, flags: DIFlagPrototyped, spFlags: 0)
!712 = !DISubroutineType(types: !713)
!713 = !{!10, !270, !651}
!714 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !715, file: !635, line: 154)
!715 = !DISubprogram(name: "mbstowcs", scope: !317, file: !317, line: 1073, type: !716, flags: DIFlagPrototyped, spFlags: 0)
!716 = !DISubroutineType(types: !717)
!717 = !{!651, !718, !721, !651}
!718 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !719)
!719 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !720, size: 64)
!720 = !DIBasicType(name: "wchar_t", size: 32, encoding: DW_ATE_signed)
!721 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !270)
!722 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !723, file: !635, line: 155)
!723 = !DISubprogram(name: "mbtowc", scope: !317, file: !317, line: 1065, type: !724, flags: DIFlagPrototyped, spFlags: 0)
!724 = !DISubroutineType(types: !725)
!725 = !{!10, !718, !721, !651}
!726 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !727, file: !635, line: 157)
!727 = !DISubprogram(name: "qsort", scope: !317, file: !317, line: 970, type: !728, flags: DIFlagPrototyped, spFlags: 0)
!728 = !DISubroutineType(types: !729)
!729 = !{null, !650, !651, !651, !677}
!730 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !731, file: !635, line: 160)
!731 = !DISubprogram(name: "quick_exit", scope: !317, file: !317, line: 762, type: !689, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!732 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !733, file: !635, line: 163)
!733 = !DISubprogram(name: "rand", scope: !317, file: !317, line: 573, type: !734, flags: DIFlagPrototyped, spFlags: 0)
!734 = !DISubroutineType(types: !735)
!735 = !{!10}
!736 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !737, file: !635, line: 164)
!737 = !DISubprogram(name: "realloc", scope: !317, file: !317, line: 683, type: !738, flags: DIFlagPrototyped, spFlags: 0)
!738 = !DISubroutineType(types: !739)
!739 = !{!650, !650, !651}
!740 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !741, file: !635, line: 165)
!741 = !DISubprogram(name: "srand", scope: !317, file: !317, line: 575, type: !742, flags: DIFlagPrototyped, spFlags: 0)
!742 = !DISubroutineType(types: !743)
!743 = !{null, !15}
!744 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !745, file: !635, line: 166)
!745 = !DISubprogram(name: "strtod", scope: !317, file: !317, line: 118, type: !746, flags: DIFlagPrototyped, spFlags: 0)
!746 = !DISubroutineType(types: !747)
!747 = !{!269, !721, !748}
!748 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !749)
!749 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !699, size: 64)
!750 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !751, file: !635, line: 167)
!751 = !DISubprogram(name: "strtol", linkageName: "__isoc23_strtol", scope: !317, file: !317, line: 215, type: !752, flags: DIFlagPrototyped, spFlags: 0)
!752 = !DISubroutineType(types: !753)
!753 = !{!226, !721, !748, !10}
!754 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !755, file: !635, line: 168)
!755 = !DISubprogram(name: "strtoul", linkageName: "__isoc23_strtoul", scope: !317, file: !317, line: 219, type: !756, flags: DIFlagPrototyped, spFlags: 0)
!756 = !DISubroutineType(types: !757)
!757 = !{!653, !721, !748, !10}
!758 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !759, file: !635, line: 169)
!759 = !DISubprogram(name: "system", scope: !317, file: !317, line: 923, type: !665, flags: DIFlagPrototyped, spFlags: 0)
!760 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !761, file: !635, line: 171)
!761 = !DISubprogram(name: "wcstombs", scope: !317, file: !317, line: 1077, type: !762, flags: DIFlagPrototyped, spFlags: 0)
!762 = !DISubroutineType(types: !763)
!763 = !{!651, !764, !765, !651}
!764 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !699)
!765 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !766)
!766 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !767, size: 64)
!767 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !720)
!768 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !769, file: !635, line: 172)
!769 = !DISubprogram(name: "wctomb", scope: !317, file: !317, line: 1069, type: !770, flags: DIFlagPrototyped, spFlags: 0)
!770 = !DISubroutineType(types: !771)
!771 = !{!10, !699, !720}
!772 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !773, entity: !774, file: !635, line: 200)
!773 = !DINamespace(name: "__gnu_cxx", scope: null)
!774 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !317, line: 81, baseType: !775)
!775 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !317, line: 77, size: 128, flags: DIFlagTypePassByValue, elements: !776, identifier: "_ZTS7lldiv_t")
!776 = !{!777, !778}
!777 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !775, file: !317, line: 79, baseType: !237, size: 64)
!778 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !775, file: !317, line: 80, baseType: !237, size: 64, offset: 64)
!779 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !773, entity: !780, file: !635, line: 206)
!780 = !DISubprogram(name: "_Exit", scope: !317, file: !317, line: 768, type: !689, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!781 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !773, entity: !782, file: !635, line: 210)
!782 = !DISubprogram(name: "llabs", scope: !317, file: !317, line: 984, type: !235, flags: DIFlagPrototyped, spFlags: 0)
!783 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !773, entity: !784, file: !635, line: 216)
!784 = !DISubprogram(name: "lldiv", scope: !317, file: !317, line: 998, type: !785, flags: DIFlagPrototyped, spFlags: 0)
!785 = !DISubroutineType(types: !786)
!786 = !{!774, !237, !237}
!787 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !773, entity: !788, file: !635, line: 227)
!788 = !DISubprogram(name: "atoll", scope: !317, file: !317, line: 113, type: !789, flags: DIFlagPrototyped, spFlags: 0)
!789 = !DISubroutineType(types: !790)
!790 = !{!237, !270}
!791 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !773, entity: !792, file: !635, line: 228)
!792 = !DISubprogram(name: "strtoll", linkageName: "__isoc23_strtoll", scope: !317, file: !317, line: 238, type: !793, flags: DIFlagPrototyped, spFlags: 0)
!793 = !DISubroutineType(types: !794)
!794 = !{!237, !721, !748, !10}
!795 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !773, entity: !796, file: !635, line: 229)
!796 = !DISubprogram(name: "strtoull", linkageName: "__isoc23_strtoull", scope: !317, file: !317, line: 243, type: !797, flags: DIFlagPrototyped, spFlags: 0)
!797 = !DISubroutineType(types: !798)
!798 = !{!799, !721, !748, !10}
!799 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!800 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !773, entity: !801, file: !635, line: 231)
!801 = !DISubprogram(name: "strtof", scope: !317, file: !317, line: 124, type: !802, flags: DIFlagPrototyped, spFlags: 0)
!802 = !DISubroutineType(types: !803)
!803 = !{!9, !721, !748}
!804 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !773, entity: !805, file: !635, line: 232)
!805 = !DISubprogram(name: "strtold", scope: !317, file: !317, line: 127, type: !806, flags: DIFlagPrototyped, spFlags: 0)
!806 = !DISubroutineType(types: !807)
!807 = !{!389, !721, !748}
!808 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !774, file: !635, line: 240)
!809 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !780, file: !635, line: 242)
!810 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !782, file: !635, line: 244)
!811 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !812, file: !635, line: 245)
!812 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !773, file: !635, line: 213, type: !785, flags: DIFlagPrototyped, spFlags: 0)
!813 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !784, file: !635, line: 246)
!814 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !788, file: !635, line: 248)
!815 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !801, file: !635, line: 249)
!816 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !792, file: !635, line: 250)
!817 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !796, file: !635, line: 251)
!818 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !805, file: !635, line: 252)
!819 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !643, file: !820, line: 38)
!820 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/12/../../../../include/c++/12/stdlib.h", directory: "")
!821 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !655, file: !820, line: 39)
!822 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !688, file: !820, line: 40)
!823 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !660, file: !820, line: 43)
!824 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !731, file: !820, line: 46)
!825 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !633, file: !820, line: 51)
!826 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !637, file: !820, line: 52)
!827 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !828, file: !820, line: 54)
!828 = !DISubprogram(name: "abs", linkageName: "_ZSt3absn", scope: !125, file: !318, line: 85, type: !829, flags: DIFlagPrototyped, spFlags: 0)
!829 = !DISubroutineType(types: !830)
!830 = !{!831, !831}
!831 = !DIBasicType(name: "__int128", size: 128, encoding: DW_ATE_signed)
!832 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !662, file: !820, line: 55)
!833 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !664, file: !820, line: 56)
!834 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !668, file: !820, line: 57)
!835 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !672, file: !820, line: 58)
!836 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !682, file: !820, line: 59)
!837 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !812, file: !820, line: 60)
!838 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !692, file: !820, line: 61)
!839 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !696, file: !820, line: 62)
!840 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !701, file: !820, line: 63)
!841 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !703, file: !820, line: 64)
!842 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !707, file: !820, line: 65)
!843 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !711, file: !820, line: 67)
!844 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !715, file: !820, line: 68)
!845 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !723, file: !820, line: 69)
!846 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !727, file: !820, line: 71)
!847 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !733, file: !820, line: 72)
!848 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !737, file: !820, line: 73)
!849 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !741, file: !820, line: 74)
!850 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !745, file: !820, line: 75)
!851 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !751, file: !820, line: 76)
!852 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !755, file: !820, line: 77)
!853 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !759, file: !820, line: 78)
!854 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !761, file: !820, line: 80)
!855 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !6, entity: !769, file: !820, line: 81)
!856 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !857, file: !859, line: 443)
!857 = !DISubprogram(name: "acosf", linkageName: "_ZL5acosff", scope: !858, file: !858, line: 59, type: !132, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!858 = !DIFile(filename: "/soft/compilers/llvm/release-17.0.6/lib/clang/17/include/__clang_cuda_math.h", directory: "")
!859 = !DIFile(filename: "/soft/compilers/llvm/release-17.0.6/lib/clang/17/include/__clang_cuda_cmath.h", directory: "")
!860 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !861, file: !859, line: 444)
!861 = !DISubprogram(name: "acoshf", linkageName: "_ZL6acoshff", scope: !858, file: !858, line: 61, type: !132, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!862 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !863, file: !859, line: 445)
!863 = !DISubprogram(name: "asinf", linkageName: "_ZL5asinff", scope: !858, file: !858, line: 63, type: !132, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!864 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !865, file: !859, line: 446)
!865 = !DISubprogram(name: "asinhf", linkageName: "_ZL6asinhff", scope: !858, file: !858, line: 65, type: !132, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!866 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !867, file: !859, line: 447)
!867 = distinct !DISubprogram(name: "atan2f", linkageName: "_ZL6atan2fff", scope: !858, file: !858, line: 68, type: !144, scopeLine: 68, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !868)
!868 = !{}
!869 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !870, file: !859, line: 448)
!870 = !DISubprogram(name: "atanf", linkageName: "_ZL5atanff", scope: !858, file: !858, line: 69, type: !132, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!871 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !872, file: !859, line: 449)
!872 = !DISubprogram(name: "atanhf", linkageName: "_ZL6atanhff", scope: !858, file: !858, line: 71, type: !132, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!873 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !874, file: !859, line: 450)
!874 = !DISubprogram(name: "cbrtf", linkageName: "_ZL5cbrtff", scope: !858, file: !858, line: 73, type: !132, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!875 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !876, file: !859, line: 451)
!876 = !DISubprogram(name: "ceilf", linkageName: "_ZL5ceilff", scope: !858, file: !858, line: 75, type: !132, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!877 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !878, file: !859, line: 452)
!878 = !DISubprogram(name: "copysignf", linkageName: "_ZL9copysignfff", scope: !858, file: !858, line: 79, type: !144, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!879 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !880, file: !859, line: 453)
!880 = !DISubprogram(name: "cosf", linkageName: "_ZL4cosff", scope: !858, file: !858, line: 83, type: !132, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!881 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !882, file: !859, line: 454)
!882 = !DISubprogram(name: "coshf", linkageName: "_ZL5coshff", scope: !858, file: !858, line: 87, type: !132, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!883 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !884, file: !859, line: 455)
!884 = !DISubprogram(name: "erfcf", linkageName: "_ZL5erfcff", scope: !858, file: !858, line: 96, type: !132, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!885 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !886, file: !859, line: 456)
!886 = !DISubprogram(name: "erff", linkageName: "_ZL4erfff", scope: !858, file: !858, line: 101, type: !132, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!887 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !888, file: !859, line: 457)
!888 = !DISubprogram(name: "exp2f", linkageName: "_ZL5exp2ff", scope: !858, file: !858, line: 108, type: !132, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!889 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !890, file: !859, line: 458)
!890 = !DISubprogram(name: "expf", linkageName: "_ZL4expff", scope: !858, file: !858, line: 109, type: !132, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!891 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !892, file: !859, line: 459)
!892 = !DISubprogram(name: "expm1f", linkageName: "_ZL6expm1ff", scope: !858, file: !858, line: 111, type: !132, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!893 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !894, file: !859, line: 460)
!894 = !DISubprogram(name: "fabsf", linkageName: "_ZL5fabsff", scope: !858, file: !858, line: 112, type: !132, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!895 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !896, file: !859, line: 461)
!896 = !DISubprogram(name: "fdimf", linkageName: "_ZL5fdimfff", scope: !858, file: !858, line: 114, type: !144, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!897 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !898, file: !859, line: 462)
!898 = !DISubprogram(name: "floorf", linkageName: "_ZL6floorff", scope: !858, file: !858, line: 124, type: !132, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!899 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !900, file: !859, line: 463)
!900 = !DISubprogram(name: "fmaf", linkageName: "_ZL4fmaffff", scope: !858, file: !858, line: 128, type: !176, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!901 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !902, file: !859, line: 464)
!902 = !DISubprogram(name: "fmaxf", linkageName: "_ZL5fmaxfff", scope: !858, file: !858, line: 132, type: !144, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!903 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !904, file: !859, line: 465)
!904 = !DISubprogram(name: "fminf", linkageName: "_ZL5fminfff", scope: !858, file: !858, line: 134, type: !144, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!905 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !906, file: !859, line: 466)
!906 = !DISubprogram(name: "fmodf", linkageName: "_ZL5fmodfff", scope: !858, file: !858, line: 136, type: !144, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!907 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !908, file: !859, line: 467)
!908 = !DISubprogram(name: "frexpf", linkageName: "_ZL6frexpffPi", scope: !858, file: !858, line: 138, type: !190, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!909 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !910, file: !859, line: 468)
!910 = !DISubprogram(name: "hypotf", linkageName: "_ZL6hypotfff", scope: !858, file: !858, line: 140, type: !144, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!911 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !912, file: !859, line: 469)
!912 = !DISubprogram(name: "ilogbf", linkageName: "_ZL6ilogbff", scope: !858, file: !858, line: 142, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!913 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !914, file: !859, line: 470)
!914 = !DISubprogram(name: "ldexpf", linkageName: "_ZL6ldexpffi", scope: !858, file: !858, line: 155, type: !229, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!915 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !916, file: !859, line: 471)
!916 = !DISubprogram(name: "lgammaf", linkageName: "_ZL7lgammaff", scope: !858, file: !858, line: 157, type: !132, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!917 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !918, file: !859, line: 472)
!918 = !DISubprogram(name: "llrintf", linkageName: "_ZL7llrintff", scope: !858, file: !858, line: 166, type: !240, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!919 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !920, file: !859, line: 473)
!920 = !DISubprogram(name: "llroundf", linkageName: "_ZL8llroundff", scope: !858, file: !858, line: 168, type: !240, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!921 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !922, file: !859, line: 474)
!922 = !DISubprogram(name: "log10f", linkageName: "_ZL6log10ff", scope: !858, file: !858, line: 173, type: !132, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!923 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !924, file: !859, line: 475)
!924 = !DISubprogram(name: "log1pf", linkageName: "_ZL6log1pff", scope: !858, file: !858, line: 175, type: !132, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!925 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !926, file: !859, line: 476)
!926 = !DISubprogram(name: "log2f", linkageName: "_ZL5log2ff", scope: !858, file: !858, line: 177, type: !132, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!927 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !928, file: !859, line: 477)
!928 = !DISubprogram(name: "logbf", linkageName: "_ZL5logbff", scope: !858, file: !858, line: 181, type: !132, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!929 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !930, file: !859, line: 478)
!930 = !DISubprogram(name: "logf", linkageName: "_ZL4logff", scope: !858, file: !858, line: 182, type: !132, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!931 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !932, file: !859, line: 479)
!932 = !DISubprogram(name: "lrintf", linkageName: "_ZL6lrintff", scope: !858, file: !858, line: 187, type: !254, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!933 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !934, file: !859, line: 480)
!934 = !DISubprogram(name: "lroundf", linkageName: "_ZL7lroundff", scope: !858, file: !858, line: 189, type: !254, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!935 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !936, file: !859, line: 481)
!936 = !DISubprogram(name: "modff", linkageName: "_ZL5modfffPf", scope: !858, file: !858, line: 199, type: !262, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!937 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !938, file: !859, line: 482)
!938 = !DISubprogram(name: "nearbyintf", linkageName: "_ZL10nearbyintff", scope: !858, file: !858, line: 201, type: !132, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!939 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !940, file: !859, line: 483)
!940 = !DISubprogram(name: "nextafterf", linkageName: "_ZL10nextafterfff", scope: !858, file: !858, line: 205, type: !144, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!941 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !942, file: !859, line: 484)
!942 = !DISubprogram(name: "powf", linkageName: "_ZL4powfff", scope: !858, file: !858, line: 231, type: !144, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!943 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !944, file: !859, line: 485)
!944 = !DISubprogram(name: "remainderf", linkageName: "_ZL10remainderfff", scope: !858, file: !858, line: 239, type: !144, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!945 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !946, file: !859, line: 486)
!946 = !DISubprogram(name: "remquof", linkageName: "_ZL7remquofffPi", scope: !858, file: !858, line: 245, type: !287, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!947 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !948, file: !859, line: 487)
!948 = !DISubprogram(name: "rintf", linkageName: "_ZL5rintff", scope: !858, file: !858, line: 256, type: !132, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!949 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !950, file: !859, line: 488)
!950 = !DISubprogram(name: "roundf", linkageName: "_ZL6roundff", scope: !858, file: !858, line: 170, type: !132, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!951 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !952, file: !859, line: 489)
!952 = !DISubprogram(name: "scalblnf", linkageName: "_ZL8scalblnffl", scope: !858, file: !858, line: 286, type: !295, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!953 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !954, file: !859, line: 490)
!954 = !DISubprogram(name: "scalbnf", linkageName: "_ZL7scalbnffi", scope: !858, file: !858, line: 278, type: !229, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!955 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !956, file: !859, line: 491)
!956 = !DISubprogram(name: "sinf", linkageName: "_ZL4sinff", scope: !858, file: !858, line: 306, type: !132, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!957 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !958, file: !859, line: 492)
!958 = !DISubprogram(name: "sinhf", linkageName: "_ZL5sinhff", scope: !858, file: !858, line: 310, type: !132, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!959 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !960, file: !859, line: 493)
!960 = distinct !DISubprogram(name: "sqrtf", linkageName: "_ZL5sqrtff", scope: !858, file: !858, line: 314, type: !132, scopeLine: 314, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !868)
!961 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !962, file: !859, line: 494)
!962 = !DISubprogram(name: "tanf", linkageName: "_ZL4tanff", scope: !858, file: !858, line: 316, type: !132, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!963 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !964, file: !859, line: 495)
!964 = !DISubprogram(name: "tanhf", linkageName: "_ZL5tanhff", scope: !858, file: !858, line: 318, type: !132, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!965 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !966, file: !859, line: 496)
!966 = !DISubprogram(name: "tgammaf", linkageName: "_ZL7tgammaff", scope: !858, file: !858, line: 320, type: !132, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!967 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !968, file: !859, line: 497)
!968 = !DISubprogram(name: "truncf", linkageName: "_ZL6truncff", scope: !858, file: !858, line: 322, type: !132, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!969 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !970, file: !975, line: 47)
!970 = !DIDerivedType(tag: DW_TAG_typedef, name: "int8_t", file: !971, line: 24, baseType: !972)
!971 = !DIFile(filename: "/usr/include/bits/stdint-intn.h", directory: "")
!972 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int8_t", file: !973, line: 37, baseType: !974)
!973 = !DIFile(filename: "/usr/include/bits/types.h", directory: "")
!974 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!975 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/12/../../../../include/c++/12/cstdint", directory: "")
!976 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !977, file: !975, line: 48)
!977 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !971, line: 25, baseType: !978)
!978 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int16_t", file: !973, line: 39, baseType: !979)
!979 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!980 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !981, file: !975, line: 49)
!981 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !971, line: 26, baseType: !982)
!982 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !973, line: 41, baseType: !10)
!983 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !984, file: !975, line: 50)
!984 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !971, line: 27, baseType: !985)
!985 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !973, line: 44, baseType: !226)
!986 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !987, file: !975, line: 52)
!987 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast8_t", file: !988, line: 58, baseType: !974)
!988 = !DIFile(filename: "/usr/include/stdint.h", directory: "")
!989 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !990, file: !975, line: 53)
!990 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast16_t", file: !988, line: 60, baseType: !226)
!991 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !992, file: !975, line: 54)
!992 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast32_t", file: !988, line: 61, baseType: !226)
!993 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !994, file: !975, line: 55)
!994 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast64_t", file: !988, line: 62, baseType: !226)
!995 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !996, file: !975, line: 57)
!996 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least8_t", file: !988, line: 43, baseType: !997)
!997 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least8_t", file: !973, line: 52, baseType: !972)
!998 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !999, file: !975, line: 58)
!999 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least16_t", file: !988, line: 44, baseType: !1000)
!1000 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least16_t", file: !973, line: 54, baseType: !978)
!1001 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1002, file: !975, line: 59)
!1002 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least32_t", file: !988, line: 45, baseType: !1003)
!1003 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least32_t", file: !973, line: 56, baseType: !982)
!1004 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1005, file: !975, line: 60)
!1005 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least64_t", file: !988, line: 46, baseType: !1006)
!1006 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least64_t", file: !973, line: 58, baseType: !985)
!1007 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1008, file: !975, line: 62)
!1008 = !DIDerivedType(tag: DW_TAG_typedef, name: "intmax_t", file: !988, line: 101, baseType: !1009)
!1009 = !DIDerivedType(tag: DW_TAG_typedef, name: "__intmax_t", file: !973, line: 72, baseType: !226)
!1010 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1011, file: !975, line: 63)
!1011 = !DIDerivedType(tag: DW_TAG_typedef, name: "intptr_t", file: !988, line: 87, baseType: !226)
!1012 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1013, file: !975, line: 65)
!1013 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !1014, line: 24, baseType: !1015)
!1014 = !DIFile(filename: "/usr/include/bits/stdint-uintn.h", directory: "")
!1015 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !973, line: 38, baseType: !1016)
!1016 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!1017 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1018, file: !975, line: 66)
!1018 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !1014, line: 25, baseType: !1019)
!1019 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !973, line: 40, baseType: !1020)
!1020 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!1021 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1022, file: !975, line: 67)
!1022 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !1014, line: 26, baseType: !1023)
!1023 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !973, line: 42, baseType: !15)
!1024 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1025, file: !975, line: 68)
!1025 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !1014, line: 27, baseType: !1026)
!1026 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint64_t", file: !973, line: 45, baseType: !653)
!1027 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1028, file: !975, line: 70)
!1028 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast8_t", file: !988, line: 71, baseType: !1016)
!1029 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1030, file: !975, line: 71)
!1030 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast16_t", file: !988, line: 73, baseType: !653)
!1031 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1032, file: !975, line: 72)
!1032 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast32_t", file: !988, line: 74, baseType: !653)
!1033 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1034, file: !975, line: 73)
!1034 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast64_t", file: !988, line: 75, baseType: !653)
!1035 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1036, file: !975, line: 75)
!1036 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least8_t", file: !988, line: 49, baseType: !1037)
!1037 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least8_t", file: !973, line: 53, baseType: !1015)
!1038 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1039, file: !975, line: 76)
!1039 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least16_t", file: !988, line: 50, baseType: !1040)
!1040 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least16_t", file: !973, line: 55, baseType: !1019)
!1041 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1042, file: !975, line: 77)
!1042 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least32_t", file: !988, line: 51, baseType: !1043)
!1043 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least32_t", file: !973, line: 57, baseType: !1023)
!1044 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1045, file: !975, line: 78)
!1045 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least64_t", file: !988, line: 52, baseType: !1046)
!1046 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least64_t", file: !973, line: 59, baseType: !1026)
!1047 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1048, file: !975, line: 80)
!1048 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintmax_t", file: !988, line: 102, baseType: !1049)
!1049 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uintmax_t", file: !973, line: 73, baseType: !653)
!1050 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1051, file: !975, line: 81)
!1051 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintptr_t", file: !988, line: 90, baseType: !653)
!1052 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1053, file: !1056, line: 60)
!1053 = !DIDerivedType(tag: DW_TAG_typedef, name: "clock_t", file: !1054, line: 7, baseType: !1055)
!1054 = !DIFile(filename: "/usr/include/bits/types/clock_t.h", directory: "")
!1055 = !DIDerivedType(tag: DW_TAG_typedef, name: "__clock_t", file: !973, line: 156, baseType: !226)
!1056 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/12/../../../../include/c++/12/ctime", directory: "")
!1057 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1058, file: !1056, line: 61)
!1058 = !DIDerivedType(tag: DW_TAG_typedef, name: "time_t", file: !1059, line: 10, baseType: !1060)
!1059 = !DIFile(filename: "/usr/include/bits/types/time_t.h", directory: "")
!1060 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !973, line: 160, baseType: !226)
!1061 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1062, file: !1056, line: 62)
!1062 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tm", file: !1063, line: 7, size: 448, flags: DIFlagFwdDecl, identifier: "_ZTS2tm")
!1063 = !DIFile(filename: "/usr/include/bits/types/struct_tm.h", directory: "")
!1064 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1065, file: !1056, line: 64)
!1065 = !DISubprogram(name: "clock", scope: !1066, file: !1066, line: 72, type: !1067, flags: DIFlagPrototyped, spFlags: 0)
!1066 = !DIFile(filename: "/usr/include/time.h", directory: "")
!1067 = !DISubroutineType(types: !1068)
!1068 = !{!1053}
!1069 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1070, file: !1056, line: 65)
!1070 = !DISubprogram(name: "difftime", scope: !1066, file: !1066, line: 79, type: !1071, flags: DIFlagPrototyped, spFlags: 0)
!1071 = !DISubroutineType(types: !1072)
!1072 = !{!269, !1058, !1058}
!1073 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1074, file: !1056, line: 66)
!1074 = !DISubprogram(name: "mktime", scope: !1066, file: !1066, line: 83, type: !1075, flags: DIFlagPrototyped, spFlags: 0)
!1075 = !DISubroutineType(types: !1076)
!1076 = !{!1058, !1077}
!1077 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1062, size: 64)
!1078 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1079, file: !1056, line: 67)
!1079 = !DISubprogram(name: "time", scope: !1066, file: !1066, line: 76, type: !1080, flags: DIFlagPrototyped, spFlags: 0)
!1080 = !DISubroutineType(types: !1081)
!1081 = !{!1058, !1082}
!1082 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1058, size: 64)
!1083 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1084, file: !1056, line: 68)
!1084 = !DISubprogram(name: "asctime", scope: !1066, file: !1066, line: 180, type: !1085, flags: DIFlagPrototyped, spFlags: 0)
!1085 = !DISubroutineType(types: !1086)
!1086 = !{!699, !1087}
!1087 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1088, size: 64)
!1088 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1062)
!1089 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1090, file: !1056, line: 69)
!1090 = !DISubprogram(name: "ctime", scope: !1066, file: !1066, line: 184, type: !1091, flags: DIFlagPrototyped, spFlags: 0)
!1091 = !DISubroutineType(types: !1092)
!1092 = !{!699, !1093}
!1093 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1094, size: 64)
!1094 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1058)
!1095 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1096, file: !1056, line: 70)
!1096 = !DISubprogram(name: "gmtime", scope: !1066, file: !1066, line: 133, type: !1097, flags: DIFlagPrototyped, spFlags: 0)
!1097 = !DISubroutineType(types: !1098)
!1098 = !{!1077, !1093}
!1099 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1100, file: !1056, line: 71)
!1100 = !DISubprogram(name: "localtime", scope: !1066, file: !1066, line: 137, type: !1097, flags: DIFlagPrototyped, spFlags: 0)
!1101 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1102, file: !1056, line: 72)
!1102 = !DISubprogram(name: "strftime", scope: !1066, file: !1066, line: 100, type: !1103, flags: DIFlagPrototyped, spFlags: 0)
!1103 = !DISubroutineType(types: !1104)
!1104 = !{!651, !764, !651, !721, !1105}
!1105 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1087)
!1106 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1107, file: !1056, line: 79)
!1107 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timespec", file: !1108, line: 11, size: 128, flags: DIFlagTypePassByValue, elements: !1109, identifier: "_ZTS8timespec")
!1108 = !DIFile(filename: "/usr/include/bits/types/struct_timespec.h", directory: "")
!1109 = !{!1110, !1111}
!1110 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !1107, file: !1108, line: 16, baseType: !1060, size: 64)
!1111 = !DIDerivedType(tag: DW_TAG_member, name: "tv_nsec", scope: !1107, file: !1108, line: 21, baseType: !1112, size: 64, offset: 64)
!1112 = !DIDerivedType(tag: DW_TAG_typedef, name: "__syscall_slong_t", file: !973, line: 197, baseType: !226)
!1113 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1114, file: !1056, line: 80)
!1114 = !DISubprogram(name: "timespec_get", scope: !1066, file: !1066, line: 384, type: !1115, flags: DIFlagPrototyped, spFlags: 0)
!1115 = !DISubroutineType(types: !1116)
!1116 = !{!10, !1117, !10}
!1117 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1107, size: 64)
!1118 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !1119, entity: !1120, file: !1122, line: 1428)
!1119 = !DINamespace(name: "chrono", scope: !125)
!1120 = !DINamespace(name: "chrono_literals", scope: !1121, exportSymbols: true)
!1121 = !DINamespace(name: "literals", scope: !125, exportSymbols: true)
!1122 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/12/../../../../include/c++/12/bits/chrono.h", directory: "")
!1123 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1124, file: !1128, line: 98)
!1124 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !1125, line: 7, baseType: !1126)
!1125 = !DIFile(filename: "/usr/include/bits/types/FILE.h", directory: "")
!1126 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !1127, line: 49, size: 1728, flags: DIFlagFwdDecl, identifier: "_ZTS8_IO_FILE")
!1127 = !DIFile(filename: "/usr/include/bits/types/struct_FILE.h", directory: "")
!1128 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/12/../../../../include/c++/12/cstdio", directory: "")
!1129 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1130, file: !1128, line: 99)
!1130 = !DIDerivedType(tag: DW_TAG_typedef, name: "fpos_t", file: !1131, line: 84, baseType: !1132)
!1131 = !DIFile(filename: "/usr/include/stdio.h", directory: "")
!1132 = !DIDerivedType(tag: DW_TAG_typedef, name: "__fpos_t", file: !1133, line: 14, baseType: !1134)
!1133 = !DIFile(filename: "/usr/include/bits/types/__fpos_t.h", directory: "")
!1134 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_G_fpos_t", file: !1133, line: 10, size: 128, flags: DIFlagFwdDecl, identifier: "_ZTS9_G_fpos_t")
!1135 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1136, file: !1128, line: 101)
!1136 = !DISubprogram(name: "clearerr", scope: !1131, file: !1131, line: 844, type: !1137, flags: DIFlagPrototyped, spFlags: 0)
!1137 = !DISubroutineType(types: !1138)
!1138 = !{null, !1139}
!1139 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1124, size: 64)
!1140 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1141, file: !1128, line: 102)
!1141 = !DISubprogram(name: "fclose", scope: !1131, file: !1131, line: 183, type: !1142, flags: DIFlagPrototyped, spFlags: 0)
!1142 = !DISubroutineType(types: !1143)
!1143 = !{!10, !1139}
!1144 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1145, file: !1128, line: 103)
!1145 = !DISubprogram(name: "feof", scope: !1131, file: !1131, line: 846, type: !1142, flags: DIFlagPrototyped, spFlags: 0)
!1146 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1147, file: !1128, line: 104)
!1147 = !DISubprogram(name: "ferror", scope: !1131, file: !1131, line: 848, type: !1142, flags: DIFlagPrototyped, spFlags: 0)
!1148 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1149, file: !1128, line: 105)
!1149 = !DISubprogram(name: "fflush", scope: !1131, file: !1131, line: 235, type: !1142, flags: DIFlagPrototyped, spFlags: 0)
!1150 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1151, file: !1128, line: 106)
!1151 = !DISubprogram(name: "fgetc", scope: !1131, file: !1131, line: 571, type: !1142, flags: DIFlagPrototyped, spFlags: 0)
!1152 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1153, file: !1128, line: 107)
!1153 = !DISubprogram(name: "fgetpos", scope: !1131, file: !1131, line: 818, type: !1154, flags: DIFlagPrototyped, spFlags: 0)
!1154 = !DISubroutineType(types: !1155)
!1155 = !{!10, !1156, !1157}
!1156 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1139)
!1157 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1158)
!1158 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1130, size: 64)
!1159 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1160, file: !1128, line: 108)
!1160 = !DISubprogram(name: "fgets", scope: !1131, file: !1131, line: 650, type: !1161, flags: DIFlagPrototyped, spFlags: 0)
!1161 = !DISubroutineType(types: !1162)
!1162 = !{!699, !764, !10, !1156}
!1163 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1164, file: !1128, line: 109)
!1164 = !DISubprogram(name: "fopen", scope: !1131, file: !1131, line: 263, type: !1165, flags: DIFlagPrototyped, spFlags: 0)
!1165 = !DISubroutineType(types: !1166)
!1166 = !{!1139, !721, !721}
!1167 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1168, file: !1128, line: 110)
!1168 = !DISubprogram(name: "fprintf", scope: !1131, file: !1131, line: 355, type: !1169, flags: DIFlagPrototyped, spFlags: 0)
!1169 = !DISubroutineType(types: !1170)
!1170 = !{!10, !1156, !721, null}
!1171 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1172, file: !1128, line: 111)
!1172 = !DISubprogram(name: "fputc", scope: !1131, file: !1131, line: 607, type: !1173, flags: DIFlagPrototyped, spFlags: 0)
!1173 = !DISubroutineType(types: !1174)
!1174 = !{!10, !10, !1139}
!1175 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1176, file: !1128, line: 112)
!1176 = !DISubprogram(name: "fputs", scope: !1131, file: !1131, line: 713, type: !1177, flags: DIFlagPrototyped, spFlags: 0)
!1177 = !DISubroutineType(types: !1178)
!1178 = !{!10, !721, !1156}
!1179 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1180, file: !1128, line: 113)
!1180 = !DISubprogram(name: "fread", scope: !1131, file: !1131, line: 733, type: !1181, flags: DIFlagPrototyped, spFlags: 0)
!1181 = !DISubroutineType(types: !1182)
!1182 = !{!651, !1183, !651, !651, !1156}
!1183 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !650)
!1184 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1185, file: !1128, line: 114)
!1185 = !DISubprogram(name: "freopen", scope: !1131, file: !1131, line: 270, type: !1186, flags: DIFlagPrototyped, spFlags: 0)
!1186 = !DISubroutineType(types: !1187)
!1187 = !{!1139, !721, !721, !1156}
!1188 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1189, file: !1128, line: 115)
!1189 = !DISubprogram(name: "fscanf", linkageName: "__isoc23_fscanf", scope: !1131, file: !1131, line: 440, type: !1169, flags: DIFlagPrototyped, spFlags: 0)
!1190 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1191, file: !1128, line: 116)
!1191 = !DISubprogram(name: "fseek", scope: !1131, file: !1131, line: 771, type: !1192, flags: DIFlagPrototyped, spFlags: 0)
!1192 = !DISubroutineType(types: !1193)
!1193 = !{!10, !1139, !226, !10}
!1194 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1195, file: !1128, line: 117)
!1195 = !DISubprogram(name: "fsetpos", scope: !1131, file: !1131, line: 823, type: !1196, flags: DIFlagPrototyped, spFlags: 0)
!1196 = !DISubroutineType(types: !1197)
!1197 = !{!10, !1139, !1198}
!1198 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1199, size: 64)
!1199 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1130)
!1200 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1201, file: !1128, line: 118)
!1201 = !DISubprogram(name: "ftell", scope: !1131, file: !1131, line: 776, type: !1202, flags: DIFlagPrototyped, spFlags: 0)
!1202 = !DISubroutineType(types: !1203)
!1203 = !{!226, !1139}
!1204 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1205, file: !1128, line: 119)
!1205 = !DISubprogram(name: "fwrite", scope: !1131, file: !1131, line: 739, type: !1206, flags: DIFlagPrototyped, spFlags: 0)
!1206 = !DISubroutineType(types: !1207)
!1207 = !{!651, !1208, !651, !651, !1156}
!1208 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !675)
!1209 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1210, file: !1128, line: 120)
!1210 = !DISubprogram(name: "getc", scope: !1131, file: !1131, line: 572, type: !1142, flags: DIFlagPrototyped, spFlags: 0)
!1211 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1212, file: !1128, line: 121)
!1212 = !DISubprogram(name: "getchar", scope: !1131, file: !1131, line: 578, type: !734, flags: DIFlagPrototyped, spFlags: 0)
!1213 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1214, file: !1128, line: 126)
!1214 = !DISubprogram(name: "perror", scope: !1131, file: !1131, line: 862, type: !1215, flags: DIFlagPrototyped, spFlags: 0)
!1215 = !DISubroutineType(types: !1216)
!1216 = !{null, !270}
!1217 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1218, file: !1128, line: 127)
!1218 = !DISubprogram(name: "printf", scope: !1131, file: !1131, line: 361, type: !1219, flags: DIFlagPrototyped, spFlags: 0)
!1219 = !DISubroutineType(types: !1220)
!1220 = !{!10, !721, null}
!1221 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1222, file: !1128, line: 128)
!1222 = !DISubprogram(name: "putc", scope: !1131, file: !1131, line: 608, type: !1173, flags: DIFlagPrototyped, spFlags: 0)
!1223 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1224, file: !1128, line: 129)
!1224 = !DISubprogram(name: "putchar", scope: !1131, file: !1131, line: 614, type: !128, flags: DIFlagPrototyped, spFlags: 0)
!1225 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1226, file: !1128, line: 130)
!1226 = !DISubprogram(name: "puts", scope: !1131, file: !1131, line: 719, type: !665, flags: DIFlagPrototyped, spFlags: 0)
!1227 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1228, file: !1128, line: 131)
!1228 = !DISubprogram(name: "remove", scope: !1131, file: !1131, line: 157, type: !665, flags: DIFlagPrototyped, spFlags: 0)
!1229 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1230, file: !1128, line: 132)
!1230 = !DISubprogram(name: "rename", scope: !1131, file: !1131, line: 159, type: !1231, flags: DIFlagPrototyped, spFlags: 0)
!1231 = !DISubroutineType(types: !1232)
!1232 = !{!10, !270, !270}
!1233 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1234, file: !1128, line: 133)
!1234 = !DISubprogram(name: "rewind", scope: !1131, file: !1131, line: 781, type: !1137, flags: DIFlagPrototyped, spFlags: 0)
!1235 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1236, file: !1128, line: 134)
!1236 = !DISubprogram(name: "scanf", linkageName: "__isoc23_scanf", scope: !1131, file: !1131, line: 443, type: !1219, flags: DIFlagPrototyped, spFlags: 0)
!1237 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1238, file: !1128, line: 135)
!1238 = !DISubprogram(name: "setbuf", scope: !1131, file: !1131, line: 333, type: !1239, flags: DIFlagPrototyped, spFlags: 0)
!1239 = !DISubroutineType(types: !1240)
!1240 = !{null, !1156, !764}
!1241 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1242, file: !1128, line: 136)
!1242 = !DISubprogram(name: "setvbuf", scope: !1131, file: !1131, line: 337, type: !1243, flags: DIFlagPrototyped, spFlags: 0)
!1243 = !DISubroutineType(types: !1244)
!1244 = !{!10, !1156, !764, !10, !651}
!1245 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1246, file: !1128, line: 137)
!1246 = !DISubprogram(name: "sprintf", scope: !1131, file: !1131, line: 363, type: !1247, flags: DIFlagPrototyped, spFlags: 0)
!1247 = !DISubroutineType(types: !1248)
!1248 = !{!10, !764, !721, null}
!1249 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1250, file: !1128, line: 138)
!1250 = !DISubprogram(name: "sscanf", linkageName: "__isoc23_sscanf", scope: !1131, file: !1131, line: 445, type: !1251, flags: DIFlagPrototyped, spFlags: 0)
!1251 = !DISubroutineType(types: !1252)
!1252 = !{!10, !721, !721, null}
!1253 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1254, file: !1128, line: 139)
!1254 = !DISubprogram(name: "tmpfile", scope: !1131, file: !1131, line: 193, type: !1255, flags: DIFlagPrototyped, spFlags: 0)
!1255 = !DISubroutineType(types: !1256)
!1256 = !{!1139}
!1257 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1258, file: !1128, line: 141)
!1258 = !DISubprogram(name: "tmpnam", scope: !1131, file: !1131, line: 210, type: !1259, flags: DIFlagPrototyped, spFlags: 0)
!1259 = !DISubroutineType(types: !1260)
!1260 = !{!699, !699}
!1261 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1262, file: !1128, line: 143)
!1262 = !DISubprogram(name: "ungetc", scope: !1131, file: !1131, line: 726, type: !1173, flags: DIFlagPrototyped, spFlags: 0)
!1263 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1264, file: !1128, line: 144)
!1264 = !DISubprogram(name: "vfprintf", scope: !1131, file: !1131, line: 370, type: !1265, flags: DIFlagPrototyped, spFlags: 0)
!1265 = !DISubroutineType(types: !1266)
!1266 = !{!10, !1156, !721, !1267}
!1267 = !DIDerivedType(tag: DW_TAG_typedef, name: "__gnuc_va_list", file: !1268, line: 14, baseType: !1269)
!1268 = !DIFile(filename: "/soft/compilers/llvm/release-17.0.6/lib/clang/17/include/stdarg.h", directory: "")
!1269 = !DIDerivedType(tag: DW_TAG_typedef, name: "__builtin_va_list", file: !1270, baseType: !699)
!1270 = !DIFile(filename: "GPU_FI/HeCBench/src/colorwheel-cuda/main.cu", directory: "/home/mdunlavy")
!1271 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1272, file: !1128, line: 145)
!1272 = !DISubprogram(name: "vprintf", scope: !1131, file: !1131, line: 376, type: !1273, flags: DIFlagPrototyped, spFlags: 0)
!1273 = !DISubroutineType(types: !1274)
!1274 = !{!10, !721, !1267}
!1275 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1276, file: !1128, line: 146)
!1276 = !DISubprogram(name: "vsprintf", scope: !1131, file: !1131, line: 378, type: !1277, flags: DIFlagPrototyped, spFlags: 0)
!1277 = !DISubroutineType(types: !1278)
!1278 = !{!10, !764, !721, !1267}
!1279 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !773, entity: !1280, file: !1128, line: 175)
!1280 = !DISubprogram(name: "snprintf", scope: !1131, file: !1131, line: 383, type: !1281, flags: DIFlagPrototyped, spFlags: 0)
!1281 = !DISubroutineType(types: !1282)
!1282 = !{!10, !764, !651, !721, null}
!1283 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !773, entity: !1284, file: !1128, line: 176)
!1284 = !DISubprogram(name: "vfscanf", linkageName: "__isoc23_vfscanf", scope: !1131, file: !1131, line: 507, type: !1265, flags: DIFlagPrototyped, spFlags: 0)
!1285 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !773, entity: !1286, file: !1128, line: 177)
!1286 = !DISubprogram(name: "vscanf", linkageName: "__isoc23_vscanf", scope: !1131, file: !1131, line: 512, type: !1273, flags: DIFlagPrototyped, spFlags: 0)
!1287 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !773, entity: !1288, file: !1128, line: 178)
!1288 = !DISubprogram(name: "vsnprintf", scope: !1131, file: !1131, line: 387, type: !1289, flags: DIFlagPrototyped, spFlags: 0)
!1289 = !DISubroutineType(types: !1290)
!1290 = !{!10, !764, !651, !721, !1267}
!1291 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !773, entity: !1292, file: !1128, line: 179)
!1292 = !DISubprogram(name: "vsscanf", linkageName: "__isoc23_vsscanf", scope: !1131, file: !1131, line: 515, type: !1293, flags: DIFlagPrototyped, spFlags: 0)
!1293 = !DISubroutineType(types: !1294)
!1294 = !{!10, !721, !721, !1267}
!1295 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1280, file: !1128, line: 185)
!1296 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1284, file: !1128, line: 186)
!1297 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1286, file: !1128, line: 187)
!1298 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1288, file: !1128, line: 188)
!1299 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1292, file: !1128, line: 189)
!1300 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1301, file: !1305, line: 77)
!1301 = !DISubprogram(name: "memchr", scope: !1302, file: !1302, line: 89, type: !1303, flags: DIFlagPrototyped, spFlags: 0)
!1302 = !DIFile(filename: "/usr/include/string.h", directory: "")
!1303 = !DISubroutineType(types: !1304)
!1304 = !{!675, !675, !10, !651}
!1305 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/12/../../../../include/c++/12/cstring", directory: "")
!1306 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1307, file: !1305, line: 78)
!1307 = !DISubprogram(name: "memcmp", scope: !1302, file: !1302, line: 64, type: !1308, flags: DIFlagPrototyped, spFlags: 0)
!1308 = !DISubroutineType(types: !1309)
!1309 = !{!10, !675, !675, !651}
!1310 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1311, file: !1305, line: 79)
!1311 = !DISubprogram(name: "memcpy", linkageName: "_ZL6memcpyPvPKvm", scope: !1312, file: !1312, line: 1549, type: !1313, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!1312 = !DIFile(filename: "/soft/compilers/llvm/release-17.0.6/lib/clang/17/include/__clang_cuda_device_functions.h", directory: "")
!1313 = !DISubroutineType(types: !1314)
!1314 = !{!650, !650, !675, !651}
!1315 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1316, file: !1305, line: 80)
!1316 = !DISubprogram(name: "memmove", scope: !1302, file: !1302, line: 47, type: !1313, flags: DIFlagPrototyped, spFlags: 0)
!1317 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1318, file: !1305, line: 81)
!1318 = !DISubprogram(name: "memset", linkageName: "_ZL6memsetPvim", scope: !1312, file: !1312, line: 1552, type: !1319, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!1319 = !DISubroutineType(types: !1320)
!1320 = !{!650, !650, !10, !651}
!1321 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1322, file: !1305, line: 82)
!1322 = !DISubprogram(name: "strcat", scope: !1302, file: !1302, line: 149, type: !1323, flags: DIFlagPrototyped, spFlags: 0)
!1323 = !DISubroutineType(types: !1324)
!1324 = !{!699, !764, !721}
!1325 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1326, file: !1305, line: 83)
!1326 = !DISubprogram(name: "strcmp", scope: !1302, file: !1302, line: 156, type: !1231, flags: DIFlagPrototyped, spFlags: 0)
!1327 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1328, file: !1305, line: 84)
!1328 = !DISubprogram(name: "strcoll", scope: !1302, file: !1302, line: 163, type: !1231, flags: DIFlagPrototyped, spFlags: 0)
!1329 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1330, file: !1305, line: 85)
!1330 = !DISubprogram(name: "strcpy", scope: !1302, file: !1302, line: 141, type: !1323, flags: DIFlagPrototyped, spFlags: 0)
!1331 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1332, file: !1305, line: 86)
!1332 = !DISubprogram(name: "strcspn", scope: !1302, file: !1302, line: 293, type: !1333, flags: DIFlagPrototyped, spFlags: 0)
!1333 = !DISubroutineType(types: !1334)
!1334 = !{!651, !270, !270}
!1335 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1336, file: !1305, line: 87)
!1336 = !DISubprogram(name: "strerror", scope: !1302, file: !1302, line: 419, type: !1337, flags: DIFlagPrototyped, spFlags: 0)
!1337 = !DISubroutineType(types: !1338)
!1338 = !{!699, !10}
!1339 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1340, file: !1305, line: 88)
!1340 = !DISubprogram(name: "strlen", scope: !1302, file: !1302, line: 407, type: !1341, flags: DIFlagPrototyped, spFlags: 0)
!1341 = !DISubroutineType(types: !1342)
!1342 = !{!651, !270}
!1343 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1344, file: !1305, line: 89)
!1344 = !DISubprogram(name: "strncat", scope: !1302, file: !1302, line: 152, type: !1345, flags: DIFlagPrototyped, spFlags: 0)
!1345 = !DISubroutineType(types: !1346)
!1346 = !{!699, !764, !721, !651}
!1347 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1348, file: !1305, line: 90)
!1348 = !DISubprogram(name: "strncmp", scope: !1302, file: !1302, line: 159, type: !1349, flags: DIFlagPrototyped, spFlags: 0)
!1349 = !DISubroutineType(types: !1350)
!1350 = !{!10, !270, !270, !651}
!1351 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1352, file: !1305, line: 91)
!1352 = !DISubprogram(name: "strncpy", scope: !1302, file: !1302, line: 144, type: !1345, flags: DIFlagPrototyped, spFlags: 0)
!1353 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1354, file: !1305, line: 92)
!1354 = !DISubprogram(name: "strspn", scope: !1302, file: !1302, line: 297, type: !1333, flags: DIFlagPrototyped, spFlags: 0)
!1355 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1356, file: !1305, line: 93)
!1356 = !DISubprogram(name: "strtok", scope: !1302, file: !1302, line: 356, type: !1323, flags: DIFlagPrototyped, spFlags: 0)
!1357 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1358, file: !1305, line: 94)
!1358 = !DISubprogram(name: "strxfrm", scope: !1302, file: !1302, line: 166, type: !1359, flags: DIFlagPrototyped, spFlags: 0)
!1359 = !DISubroutineType(types: !1360)
!1360 = !{!651, !764, !721, !651}
!1361 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1362, file: !1305, line: 95)
!1362 = !DISubprogram(name: "strchr", scope: !1302, file: !1302, line: 228, type: !1363, flags: DIFlagPrototyped, spFlags: 0)
!1363 = !DISubroutineType(types: !1364)
!1364 = !{!270, !270, !10}
!1365 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1366, file: !1305, line: 96)
!1366 = !DISubprogram(name: "strpbrk", scope: !1302, file: !1302, line: 305, type: !1367, flags: DIFlagPrototyped, spFlags: 0)
!1367 = !DISubroutineType(types: !1368)
!1368 = !{!270, !270, !270}
!1369 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1370, file: !1305, line: 97)
!1370 = !DISubprogram(name: "strrchr", scope: !1302, file: !1302, line: 255, type: !1363, flags: DIFlagPrototyped, spFlags: 0)
!1371 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !125, entity: !1372, file: !1305, line: 98)
!1372 = !DISubprogram(name: "strstr", scope: !1302, file: !1302, line: 332, type: !1367, flags: DIFlagPrototyped, spFlags: 0)
!1373 = !{ptr @_Z5colorPhiiff, !"kernel", i32 1}
!1374 = !{!"clang version 17.0.6 (https://github.com/llvm/llvm-project.git 6009708b4367171ccdbf4b5905cb6a803753fe18)"}
!1375 = !{!"clang version 3.8.0 (tags/RELEASE_380/final)"}
!1376 = distinct !DISubprogram(name: "setcols", linkageName: "_Z7setcolsPA3_iiiii", scope: !1270, file: !1270, line: 24, type: !1377, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !868)
!1377 = !DISubroutineType(types: !1378)
!1378 = !{null, !1379, !10, !10, !10, !10}
!1379 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1380, size: 64)
!1380 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 96, elements: !1381)
!1381 = !{!1382}
!1382 = !DISubrange(count: 3)
!1383 = !DILocalVariable(name: "cw", arg: 1, scope: !1376, file: !1270, line: 24, type: !1379)
!1384 = !DILocation(line: 24, column: 18, scope: !1376)
!1385 = !DILocalVariable(name: "r", arg: 2, scope: !1376, file: !1270, line: 24, type: !10)
!1386 = !DILocation(line: 24, column: 38, scope: !1376)
!1387 = !DILocalVariable(name: "g", arg: 3, scope: !1376, file: !1270, line: 24, type: !10)
!1388 = !DILocation(line: 24, column: 45, scope: !1376)
!1389 = !DILocalVariable(name: "b", arg: 4, scope: !1376, file: !1270, line: 24, type: !10)
!1390 = !DILocation(line: 24, column: 52, scope: !1376)
!1391 = !DILocalVariable(name: "k", arg: 5, scope: !1376, file: !1270, line: 24, type: !10)
!1392 = !DILocation(line: 24, column: 59, scope: !1376)
!1393 = !DILocation(line: 26, column: 14, scope: !1376)
!1394 = !DILocation(line: 26, column: 3, scope: !1376)
!1395 = !DILocation(line: 26, column: 6, scope: !1376)
!1396 = !DILocation(line: 26, column: 12, scope: !1376)
!1397 = !DILocation(line: 27, column: 14, scope: !1376)
!1398 = !DILocation(line: 27, column: 3, scope: !1376)
!1399 = !DILocation(line: 27, column: 6, scope: !1376)
!1400 = !DILocation(line: 27, column: 12, scope: !1376)
!1401 = !DILocation(line: 28, column: 14, scope: !1376)
!1402 = !DILocation(line: 28, column: 3, scope: !1376)
!1403 = !DILocation(line: 28, column: 6, scope: !1376)
!1404 = !DILocation(line: 28, column: 12, scope: !1376)
!1405 = !DILocation(line: 29, column: 1, scope: !1376)
!1406 = distinct !DISubprogram(name: "computeColor", linkageName: "_Z12computeColorffPh", scope: !1270, file: !1270, line: 32, type: !1407, scopeLine: 33, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !868)
!1407 = !DISubroutineType(types: !1408)
!1408 = !{null, !9, !9, !1409}
!1409 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1410, size: 64)
!1410 = !DIDerivedType(tag: DW_TAG_typedef, name: "uchar", file: !1270, line: 21, baseType: !1016)
!1411 = !DILocalVariable(name: "fx", arg: 1, scope: !1406, file: !1270, line: 32, type: !9)
!1412 = !DILocation(line: 32, column: 25, scope: !1406)
!1413 = !DILocalVariable(name: "fy", arg: 2, scope: !1406, file: !1270, line: 32, type: !9)
!1414 = !DILocation(line: 32, column: 35, scope: !1406)
!1415 = !DILocalVariable(name: "pix", arg: 3, scope: !1406, file: !1270, line: 32, type: !1409)
!1416 = !DILocation(line: 32, column: 46, scope: !1406)
!1417 = !DILocalVariable(name: "cw", scope: !1406, file: !1270, line: 34, type: !1418)
!1418 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 5280, elements: !1419)
!1419 = !{!1420, !1382}
!1420 = !DISubrange(count: 55)
!1421 = !DILocation(line: 34, column: 7, scope: !1406)
!1422 = !DILocalVariable(name: "i", scope: !1406, file: !1270, line: 40, type: !10)
!1423 = !DILocation(line: 40, column: 7, scope: !1406)
!1424 = !DILocalVariable(name: "k", scope: !1406, file: !1270, line: 41, type: !10)
!1425 = !DILocation(line: 41, column: 7, scope: !1406)
!1426 = !DILocation(line: 42, column: 10, scope: !1427)
!1427 = distinct !DILexicalBlock(scope: !1406, file: !1270, line: 42, column: 3)
!1428 = !DILocation(line: 42, column: 8, scope: !1427)
!1429 = !DILocation(line: 42, column: 15, scope: !1430)
!1430 = distinct !DILexicalBlock(scope: !1427, file: !1270, line: 42, column: 3)
!1431 = !DILocation(line: 42, column: 17, scope: !1430)
!1432 = !DILocation(line: 42, column: 3, scope: !1427)
!1433 = !DILocation(line: 42, column: 36, scope: !1430)
!1434 = !DILocation(line: 42, column: 53, scope: !1430)
!1435 = !DILocation(line: 42, column: 52, scope: !1430)
!1436 = !DILocation(line: 42, column: 54, scope: !1430)
!1437 = !DILocation(line: 42, column: 71, scope: !1430)
!1438 = !DILocation(line: 42, column: 28, scope: !1430)
!1439 = !DILocation(line: 42, column: 24, scope: !1430)
!1440 = !DILocation(line: 42, column: 3, scope: !1430)
!1441 = distinct !{!1441, !1432, !1442, !1443}
!1442 = !DILocation(line: 42, column: 73, scope: !1427)
!1443 = !{!"llvm.loop.mustprogress"}
!1444 = !DILocation(line: 43, column: 10, scope: !1445)
!1445 = distinct !DILexicalBlock(scope: !1406, file: !1270, line: 43, column: 3)
!1446 = !DILocation(line: 43, column: 8, scope: !1445)
!1447 = !DILocation(line: 43, column: 15, scope: !1448)
!1448 = distinct !DILexicalBlock(scope: !1445, file: !1270, line: 43, column: 3)
!1449 = !DILocation(line: 43, column: 17, scope: !1448)
!1450 = !DILocation(line: 43, column: 3, scope: !1445)
!1451 = !DILocation(line: 43, column: 36, scope: !1448)
!1452 = !DILocation(line: 43, column: 48, scope: !1448)
!1453 = !DILocation(line: 43, column: 47, scope: !1448)
!1454 = !DILocation(line: 43, column: 49, scope: !1448)
!1455 = !DILocation(line: 43, column: 43, scope: !1448)
!1456 = !DILocation(line: 43, column: 71, scope: !1448)
!1457 = !DILocation(line: 43, column: 28, scope: !1448)
!1458 = !DILocation(line: 43, column: 24, scope: !1448)
!1459 = !DILocation(line: 43, column: 3, scope: !1448)
!1460 = distinct !{!1460, !1450, !1461, !1443}
!1461 = !DILocation(line: 43, column: 73, scope: !1445)
!1462 = !DILocation(line: 44, column: 10, scope: !1463)
!1463 = distinct !DILexicalBlock(scope: !1406, file: !1270, line: 44, column: 3)
!1464 = !DILocation(line: 44, column: 8, scope: !1463)
!1465 = !DILocation(line: 44, column: 15, scope: !1466)
!1466 = distinct !DILexicalBlock(scope: !1463, file: !1270, line: 44, column: 3)
!1467 = !DILocation(line: 44, column: 17, scope: !1466)
!1468 = !DILocation(line: 44, column: 3, scope: !1463)
!1469 = !DILocation(line: 44, column: 36, scope: !1466)
!1470 = !DILocation(line: 44, column: 62, scope: !1466)
!1471 = !DILocation(line: 44, column: 61, scope: !1466)
!1472 = !DILocation(line: 44, column: 63, scope: !1466)
!1473 = !DILocation(line: 44, column: 71, scope: !1466)
!1474 = !DILocation(line: 44, column: 28, scope: !1466)
!1475 = !DILocation(line: 44, column: 24, scope: !1466)
!1476 = !DILocation(line: 44, column: 3, scope: !1466)
!1477 = distinct !{!1477, !1468, !1478, !1443}
!1478 = !DILocation(line: 44, column: 73, scope: !1463)
!1479 = !DILocation(line: 45, column: 10, scope: !1480)
!1480 = distinct !DILexicalBlock(scope: !1406, file: !1270, line: 45, column: 3)
!1481 = !DILocation(line: 45, column: 8, scope: !1480)
!1482 = !DILocation(line: 45, column: 15, scope: !1483)
!1483 = distinct !DILexicalBlock(scope: !1480, file: !1270, line: 45, column: 3)
!1484 = !DILocation(line: 45, column: 17, scope: !1483)
!1485 = !DILocation(line: 45, column: 3, scope: !1480)
!1486 = !DILocation(line: 45, column: 36, scope: !1483)
!1487 = !DILocation(line: 45, column: 57, scope: !1483)
!1488 = !DILocation(line: 45, column: 56, scope: !1483)
!1489 = !DILocation(line: 45, column: 58, scope: !1483)
!1490 = !DILocation(line: 45, column: 52, scope: !1483)
!1491 = !DILocation(line: 45, column: 71, scope: !1483)
!1492 = !DILocation(line: 45, column: 28, scope: !1483)
!1493 = !DILocation(line: 45, column: 24, scope: !1483)
!1494 = !DILocation(line: 45, column: 3, scope: !1483)
!1495 = distinct !{!1495, !1485, !1496, !1443}
!1496 = !DILocation(line: 45, column: 73, scope: !1480)
!1497 = !DILocation(line: 46, column: 10, scope: !1498)
!1498 = distinct !DILexicalBlock(scope: !1406, file: !1270, line: 46, column: 3)
!1499 = !DILocation(line: 46, column: 8, scope: !1498)
!1500 = !DILocation(line: 46, column: 15, scope: !1501)
!1501 = distinct !DILexicalBlock(scope: !1498, file: !1270, line: 46, column: 3)
!1502 = !DILocation(line: 46, column: 17, scope: !1501)
!1503 = !DILocation(line: 46, column: 3, scope: !1498)
!1504 = !DILocation(line: 46, column: 36, scope: !1501)
!1505 = !DILocation(line: 46, column: 44, scope: !1501)
!1506 = !DILocation(line: 46, column: 43, scope: !1501)
!1507 = !DILocation(line: 46, column: 45, scope: !1501)
!1508 = !DILocation(line: 46, column: 71, scope: !1501)
!1509 = !DILocation(line: 46, column: 28, scope: !1501)
!1510 = !DILocation(line: 46, column: 24, scope: !1501)
!1511 = !DILocation(line: 46, column: 3, scope: !1501)
!1512 = distinct !{!1512, !1503, !1513, !1443}
!1513 = !DILocation(line: 46, column: 73, scope: !1498)
!1514 = !DILocation(line: 47, column: 10, scope: !1515)
!1515 = distinct !DILexicalBlock(scope: !1406, file: !1270, line: 47, column: 3)
!1516 = !DILocation(line: 47, column: 8, scope: !1515)
!1517 = !DILocation(line: 47, column: 15, scope: !1518)
!1518 = distinct !DILexicalBlock(scope: !1515, file: !1270, line: 47, column: 3)
!1519 = !DILocation(line: 47, column: 17, scope: !1518)
!1520 = !DILocation(line: 47, column: 3, scope: !1515)
!1521 = !DILocation(line: 47, column: 36, scope: !1518)
!1522 = !DILocation(line: 47, column: 64, scope: !1518)
!1523 = !DILocation(line: 47, column: 63, scope: !1518)
!1524 = !DILocation(line: 47, column: 65, scope: !1518)
!1525 = !DILocation(line: 47, column: 59, scope: !1518)
!1526 = !DILocation(line: 47, column: 71, scope: !1518)
!1527 = !DILocation(line: 47, column: 28, scope: !1518)
!1528 = !DILocation(line: 47, column: 24, scope: !1518)
!1529 = !DILocation(line: 47, column: 3, scope: !1518)
!1530 = distinct !{!1530, !1520, !1531, !1443}
!1531 = !DILocation(line: 47, column: 73, scope: !1515)
!1532 = !DILocalVariable(name: "rad", scope: !1406, file: !1270, line: 49, type: !9)
!1533 = !DILocation(line: 49, column: 9, scope: !1406)
!1534 = !DILocation(line: 49, column: 21, scope: !1406)
!1535 = !DILocation(line: 49, column: 26, scope: !1406)
!1536 = !DILocation(line: 49, column: 24, scope: !1406)
!1537 = !DILocation(line: 49, column: 31, scope: !1406)
!1538 = !DILocation(line: 49, column: 36, scope: !1406)
!1539 = !DILocation(line: 49, column: 34, scope: !1406)
!1540 = !DILocation(line: 49, column: 29, scope: !1406)
!1541 = !DILocalVariable(name: "__a", arg: 1, scope: !960, file: !858, line: 314, type: !9)
!1542 = !DILocation(line: 314, column: 30, scope: !960, inlinedAt: !1543)
!1543 = distinct !DILocation(line: 49, column: 15, scope: !1406)
!1544 = !DILocation(line: 314, column: 55, scope: !960, inlinedAt: !1543)
!1545 = !DILocation(line: 314, column: 44, scope: !960, inlinedAt: !1543)
!1546 = !DILocalVariable(name: "a", scope: !1406, file: !1270, line: 50, type: !9)
!1547 = !DILocation(line: 50, column: 9, scope: !1406)
!1548 = !DILocation(line: 50, column: 21, scope: !1406)
!1549 = !DILocation(line: 50, column: 20, scope: !1406)
!1550 = !DILocation(line: 50, column: 26, scope: !1406)
!1551 = !DILocation(line: 50, column: 25, scope: !1406)
!1552 = !DILocalVariable(name: "__a", arg: 1, scope: !867, file: !858, line: 68, type: !9)
!1553 = !DILocation(line: 68, column: 31, scope: !867, inlinedAt: !1554)
!1554 = distinct !DILocation(line: 50, column: 13, scope: !1406)
!1555 = !DILocalVariable(name: "__b", arg: 2, scope: !867, file: !858, line: 68, type: !9)
!1556 = !DILocation(line: 68, column: 42, scope: !867, inlinedAt: !1554)
!1557 = !DILocation(line: 68, column: 68, scope: !867, inlinedAt: !1554)
!1558 = !DILocation(line: 68, column: 73, scope: !867, inlinedAt: !1554)
!1559 = !DILocation(line: 68, column: 56, scope: !867, inlinedAt: !1554)
!1560 = !DILocation(line: 50, column: 30, scope: !1406)
!1561 = !DILocalVariable(name: "fk", scope: !1406, file: !1270, line: 51, type: !9)
!1562 = !DILocation(line: 51, column: 9, scope: !1406)
!1563 = !DILocation(line: 51, column: 15, scope: !1406)
!1564 = !DILocation(line: 51, column: 17, scope: !1406)
!1565 = !DILocation(line: 51, column: 24, scope: !1406)
!1566 = !DILocation(line: 51, column: 30, scope: !1406)
!1567 = !DILocalVariable(name: "k0", scope: !1406, file: !1270, line: 52, type: !10)
!1568 = !DILocation(line: 52, column: 7, scope: !1406)
!1569 = !DILocation(line: 52, column: 17, scope: !1406)
!1570 = !DILocalVariable(name: "k1", scope: !1406, file: !1270, line: 53, type: !10)
!1571 = !DILocation(line: 53, column: 7, scope: !1406)
!1572 = !DILocation(line: 53, column: 13, scope: !1406)
!1573 = !DILocation(line: 53, column: 16, scope: !1406)
!1574 = !DILocation(line: 53, column: 21, scope: !1406)
!1575 = !DILocalVariable(name: "f", scope: !1406, file: !1270, line: 54, type: !9)
!1576 = !DILocation(line: 54, column: 9, scope: !1406)
!1577 = !DILocation(line: 54, column: 13, scope: !1406)
!1578 = !DILocation(line: 54, column: 18, scope: !1406)
!1579 = !DILocation(line: 54, column: 16, scope: !1406)
!1580 = !DILocalVariable(name: "b", scope: !1581, file: !1270, line: 55, type: !10)
!1581 = distinct !DILexicalBlock(scope: !1406, file: !1270, line: 55, column: 3)
!1582 = !DILocation(line: 55, column: 12, scope: !1581)
!1583 = !DILocation(line: 55, column: 8, scope: !1581)
!1584 = !DILocation(line: 55, column: 19, scope: !1585)
!1585 = distinct !DILexicalBlock(scope: !1581, file: !1270, line: 55, column: 3)
!1586 = !DILocation(line: 55, column: 21, scope: !1585)
!1587 = !DILocation(line: 55, column: 3, scope: !1581)
!1588 = !DILocalVariable(name: "col0", scope: !1589, file: !1270, line: 56, type: !9)
!1589 = distinct !DILexicalBlock(scope: !1585, file: !1270, line: 55, column: 31)
!1590 = !DILocation(line: 56, column: 11, scope: !1589)
!1591 = !DILocation(line: 56, column: 21, scope: !1589)
!1592 = !DILocation(line: 56, column: 18, scope: !1589)
!1593 = !DILocation(line: 56, column: 25, scope: !1589)
!1594 = !DILocation(line: 56, column: 28, scope: !1589)
!1595 = !DILocalVariable(name: "col1", scope: !1589, file: !1270, line: 57, type: !9)
!1596 = !DILocation(line: 57, column: 11, scope: !1589)
!1597 = !DILocation(line: 57, column: 21, scope: !1589)
!1598 = !DILocation(line: 57, column: 18, scope: !1589)
!1599 = !DILocation(line: 57, column: 25, scope: !1589)
!1600 = !DILocation(line: 57, column: 28, scope: !1589)
!1601 = !DILocalVariable(name: "col", scope: !1589, file: !1270, line: 58, type: !9)
!1602 = !DILocation(line: 58, column: 11, scope: !1589)
!1603 = !DILocation(line: 58, column: 24, scope: !1589)
!1604 = !DILocation(line: 58, column: 22, scope: !1589)
!1605 = !DILocation(line: 58, column: 29, scope: !1589)
!1606 = !DILocation(line: 58, column: 27, scope: !1589)
!1607 = !DILocation(line: 58, column: 36, scope: !1589)
!1608 = !DILocation(line: 58, column: 40, scope: !1589)
!1609 = !DILocation(line: 58, column: 38, scope: !1589)
!1610 = !DILocation(line: 58, column: 34, scope: !1589)
!1611 = !DILocation(line: 59, column: 9, scope: !1612)
!1612 = distinct !DILexicalBlock(scope: !1589, file: !1270, line: 59, column: 9)
!1613 = !DILocation(line: 59, column: 13, scope: !1612)
!1614 = !DILocation(line: 59, column: 9, scope: !1589)
!1615 = !DILocation(line: 60, column: 19, scope: !1612)
!1616 = !DILocation(line: 60, column: 32, scope: !1612)
!1617 = !DILocation(line: 60, column: 30, scope: !1612)
!1618 = !DILocation(line: 60, column: 23, scope: !1612)
!1619 = !DILocation(line: 60, column: 17, scope: !1612)
!1620 = !DILocation(line: 60, column: 11, scope: !1612)
!1621 = !DILocation(line: 60, column: 7, scope: !1612)
!1622 = !DILocation(line: 62, column: 11, scope: !1612)
!1623 = !DILocation(line: 63, column: 32, scope: !1589)
!1624 = !DILocation(line: 63, column: 30, scope: !1589)
!1625 = !DILocation(line: 63, column: 23, scope: !1589)
!1626 = !DILocation(line: 63, column: 18, scope: !1589)
!1627 = !DILocation(line: 63, column: 5, scope: !1589)
!1628 = !DILocation(line: 63, column: 13, scope: !1589)
!1629 = !DILocation(line: 63, column: 11, scope: !1589)
!1630 = !DILocation(line: 63, column: 16, scope: !1589)
!1631 = !DILocation(line: 64, column: 3, scope: !1589)
!1632 = !DILocation(line: 55, column: 27, scope: !1585)
!1633 = !DILocation(line: 55, column: 3, scope: !1585)
!1634 = distinct !{!1634, !1587, !1635, !1443}
!1635 = !DILocation(line: 64, column: 3, scope: !1581)
!1636 = !DILocation(line: 65, column: 1, scope: !1406)
!1637 = distinct !DISubprogram(name: "color", linkageName: "_Z5colorPhiiff", scope: !1270, file: !1270, line: 68, type: !1638, scopeLine: 69, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !868)
!1638 = !DISubroutineType(types: !1639)
!1639 = !{null, !1409, !10, !10, !9, !9}
!1640 = !DILocalVariable(name: "pix", arg: 1, scope: !1637, file: !1270, line: 68, type: !1409)
!1641 = !DILocation(line: 68, column: 20, scope: !1637)
!1642 = !DILocalVariable(name: "size", arg: 2, scope: !1637, file: !1270, line: 68, type: !10)
!1643 = !DILocation(line: 68, column: 29, scope: !1637)
!1644 = !DILocalVariable(name: "half_size", arg: 3, scope: !1637, file: !1270, line: 68, type: !10)
!1645 = !DILocation(line: 68, column: 39, scope: !1637)
!1646 = !DILocalVariable(name: "range", arg: 4, scope: !1637, file: !1270, line: 68, type: !9)
!1647 = !DILocation(line: 68, column: 56, scope: !1637)
!1648 = !DILocalVariable(name: "truerange", arg: 5, scope: !1637, file: !1270, line: 68, type: !9)
!1649 = !DILocation(line: 68, column: 69, scope: !1637)
!1650 = !DILocalVariable(name: "y", scope: !1637, file: !1270, line: 70, type: !10)
!1651 = !DILocation(line: 70, column: 7, scope: !1637)
!1652 = !DILocation(line: 80, column: 3, scope: !1653, inlinedAt: !1654)
!1653 = distinct !DISubprogram(name: "__fetch_builtin_y", linkageName: "_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_yEv", scope: !36, file: !37, line: 80, type: !40, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !6, declaration: !42)
!1654 = distinct !DILocation(line: 70, column: 11, scope: !1637)
!1655 = !DILocation(line: 67, column: 3, scope: !1656, inlinedAt: !1657)
!1656 = distinct !DISubprogram(name: "__fetch_builtin_y", linkageName: "_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv", scope: !67, file: !37, line: 67, type: !40, scopeLine: 67, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !6, declaration: !70)
!1657 = distinct !DILocation(line: 70, column: 24, scope: !1637)
!1658 = !DILocation(line: 70, column: 22, scope: !1637)
!1659 = !DILocation(line: 54, column: 3, scope: !1660, inlinedAt: !1661)
!1660 = distinct !DISubprogram(name: "__fetch_builtin_y", linkageName: "_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv", scope: !95, file: !37, line: 54, type: !40, scopeLine: 54, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !6, declaration: !98)
!1661 = distinct !DILocation(line: 70, column: 37, scope: !1637)
!1662 = !DILocation(line: 70, column: 35, scope: !1637)
!1663 = !DILocalVariable(name: "x", scope: !1637, file: !1270, line: 71, type: !10)
!1664 = !DILocation(line: 71, column: 7, scope: !1637)
!1665 = !DILocation(line: 79, column: 3, scope: !1666, inlinedAt: !1667)
!1666 = distinct !DISubprogram(name: "__fetch_builtin_x", linkageName: "_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv", scope: !36, file: !37, line: 79, type: !40, scopeLine: 79, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !6, declaration: !39)
!1667 = distinct !DILocation(line: 71, column: 11, scope: !1637)
!1668 = !DILocation(line: 66, column: 3, scope: !1669, inlinedAt: !1670)
!1669 = distinct !DISubprogram(name: "__fetch_builtin_x", linkageName: "_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv", scope: !67, file: !37, line: 66, type: !40, scopeLine: 66, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !6, declaration: !69)
!1670 = distinct !DILocation(line: 71, column: 24, scope: !1637)
!1671 = !DILocation(line: 71, column: 22, scope: !1637)
!1672 = !DILocation(line: 53, column: 3, scope: !1673, inlinedAt: !1674)
!1673 = distinct !DISubprogram(name: "__fetch_builtin_x", linkageName: "_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv", scope: !95, file: !37, line: 53, type: !40, scopeLine: 53, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !6, declaration: !97)
!1674 = distinct !DILocation(line: 71, column: 37, scope: !1637)
!1675 = !DILocation(line: 71, column: 35, scope: !1637)
!1676 = !DILocation(line: 73, column: 7, scope: !1677)
!1677 = distinct !DILexicalBlock(scope: !1637, file: !1270, line: 73, column: 7)
!1678 = !DILocation(line: 73, column: 11, scope: !1677)
!1679 = !DILocation(line: 73, column: 9, scope: !1677)
!1680 = !DILocation(line: 73, column: 16, scope: !1677)
!1681 = !DILocation(line: 73, column: 19, scope: !1677)
!1682 = !DILocation(line: 73, column: 23, scope: !1677)
!1683 = !DILocation(line: 73, column: 21, scope: !1677)
!1684 = !DILocation(line: 73, column: 7, scope: !1637)
!1685 = !DILocalVariable(name: "fx", scope: !1686, file: !1270, line: 74, type: !9)
!1686 = distinct !DILexicalBlock(scope: !1677, file: !1270, line: 73, column: 29)
!1687 = !DILocation(line: 74, column: 11, scope: !1686)
!1688 = !DILocation(line: 74, column: 23, scope: !1686)
!1689 = !DILocation(line: 74, column: 34, scope: !1686)
!1690 = !DILocation(line: 74, column: 25, scope: !1686)
!1691 = !DILocation(line: 74, column: 46, scope: !1686)
!1692 = !DILocation(line: 74, column: 44, scope: !1686)
!1693 = !DILocation(line: 74, column: 54, scope: !1686)
!1694 = !DILocation(line: 74, column: 52, scope: !1686)
!1695 = !DILocalVariable(name: "fy", scope: !1686, file: !1270, line: 75, type: !9)
!1696 = !DILocation(line: 75, column: 11, scope: !1686)
!1697 = !DILocation(line: 75, column: 23, scope: !1686)
!1698 = !DILocation(line: 75, column: 34, scope: !1686)
!1699 = !DILocation(line: 75, column: 25, scope: !1686)
!1700 = !DILocation(line: 75, column: 46, scope: !1686)
!1701 = !DILocation(line: 75, column: 44, scope: !1686)
!1702 = !DILocation(line: 75, column: 54, scope: !1686)
!1703 = !DILocation(line: 75, column: 52, scope: !1686)
!1704 = !DILocation(line: 76, column: 9, scope: !1705)
!1705 = distinct !DILexicalBlock(scope: !1686, file: !1270, line: 76, column: 9)
!1706 = !DILocation(line: 76, column: 14, scope: !1705)
!1707 = !DILocation(line: 76, column: 11, scope: !1705)
!1708 = !DILocation(line: 76, column: 24, scope: !1705)
!1709 = !DILocation(line: 76, column: 27, scope: !1705)
!1710 = !DILocation(line: 76, column: 32, scope: !1705)
!1711 = !DILocation(line: 76, column: 29, scope: !1705)
!1712 = !DILocation(line: 76, column: 9, scope: !1686)
!1713 = !DILocation(line: 76, column: 43, scope: !1705)
!1714 = !DILocalVariable(name: "idx", scope: !1686, file: !1270, line: 77, type: !651)
!1715 = !DILocation(line: 77, column: 12, scope: !1686)
!1716 = !DILocation(line: 77, column: 19, scope: !1686)
!1717 = !DILocation(line: 77, column: 23, scope: !1686)
!1718 = !DILocation(line: 77, column: 21, scope: !1686)
!1719 = !DILocation(line: 77, column: 30, scope: !1686)
!1720 = !DILocation(line: 77, column: 28, scope: !1686)
!1721 = !DILocation(line: 77, column: 33, scope: !1686)
!1722 = !DILocation(line: 77, column: 18, scope: !1686)
!1723 = !DILocation(line: 78, column: 18, scope: !1686)
!1724 = !DILocation(line: 78, column: 21, scope: !1686)
!1725 = !DILocation(line: 78, column: 20, scope: !1686)
!1726 = !DILocation(line: 78, column: 32, scope: !1686)
!1727 = !DILocation(line: 78, column: 35, scope: !1686)
!1728 = !DILocation(line: 78, column: 34, scope: !1686)
!1729 = !DILocation(line: 78, column: 46, scope: !1686)
!1730 = !DILocation(line: 78, column: 50, scope: !1686)
!1731 = !DILocation(line: 78, column: 49, scope: !1686)
!1732 = !DILocation(line: 78, column: 5, scope: !1686)
!1733 = !DILocation(line: 79, column: 3, scope: !1686)
!1734 = !DILocation(line: 80, column: 1, scope: !1637)
