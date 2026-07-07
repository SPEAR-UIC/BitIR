; ModuleID = '/var/tmp/pbs.7238636.polaris-pbs-01.hsn.cm.polaris.alcf.anl.gov/bitir_nvidia_entropy_site9_bit3/device.injected.bc'
source_filename = "/home/mdunlavy/GPU_FI/HeCBench/src/entropy-cuda/main.cu"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

%struct.__cuda_builtin_threadIdx_t = type { i8 }
%struct.__cuda_builtin_blockIdx_t = type { i8 }
%struct.__cuda_builtin_blockDim_t = type { i8 }

$_Z11entropy_optILi16ELi16EEvPfPKcPKfii = comdat any

$_ZZ11entropy_optILi16ELi16EEvPfPKcPKfiiE8sd_count = comdat any

@threadIdx = extern_weak dso_local addrspace(1) global %struct.__cuda_builtin_threadIdx_t, align 1
@blockIdx = extern_weak dso_local addrspace(1) global %struct.__cuda_builtin_blockIdx_t, align 1
@blockDim = extern_weak dso_local addrspace(1) global %struct.__cuda_builtin_blockDim_t, align 1
@_ZZ11entropy_optILi16ELi16EEvPfPKcPKfiiE8sd_count = linkonce_odr dso_local addrspace(3) global [16 x [256 x i32]] undef, comdat, align 4, !dbg !0
@.str = private unnamed_addr constant [11 x i8] c"__CUDA_FTZ\00", align 1

; Function Attrs: convergent noinline norecurse nounwind optnone
define dso_local void @_Z7entropyPfPKcii(ptr noalias noundef %d_entropy, ptr noalias noundef %d_val, i32 noundef %height, i32 noundef %width) #0 !dbg !1152 {
entry:
  %__a.addr.i60 = alloca float, align 4
  %__a.addr.i = alloca float, align 4
  %__b.addr.i = alloca float, align 4
  %d_entropy.addr = alloca ptr, align 8
  %d_val.addr = alloca ptr, align 8
  %height.addr = alloca i32, align 4
  %width.addr = alloca i32, align 4
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %count = alloca [16 x i8], align 1
  %i = alloca i32, align 4
  %total = alloca i8, align 1
  %dy = alloca i32, align 4
  %dx = alloca i32, align 4
  %xx = alloca i32, align 4
  %yy = alloca i32, align 4
  %entropy = alloca float, align 4
  %k = alloca i32, align 4
  %p = alloca float, align 4
  store ptr %d_entropy, ptr %d_entropy.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %d_entropy.addr, metadata !1155, metadata !DIExpression()), !dbg !1156
  store ptr %d_val, ptr %d_val.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %d_val.addr, metadata !1157, metadata !DIExpression()), !dbg !1158
  store i32 %height, ptr %height.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %height.addr, metadata !1159, metadata !DIExpression()), !dbg !1160
  store i32 %width, ptr %width.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %width.addr, metadata !1161, metadata !DIExpression()), !dbg !1162
  call void @llvm.dbg.declare(metadata ptr %x, metadata !1163, metadata !DIExpression()), !dbg !1165
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !dbg !1166
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !dbg !1169
  %2 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x(), !dbg !1172
  %mul = mul i32 %1, %2, !dbg !1175
  %add = add i32 %0, %mul, !dbg !1176
  store i32 %add, ptr %x, align 4, !dbg !1165
  call void @llvm.dbg.declare(metadata ptr %y, metadata !1177, metadata !DIExpression()), !dbg !1178
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.y(), !dbg !1179
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !dbg !1182
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.y(), !dbg !1185
  %mul6 = mul i32 %4, %5, !dbg !1188
  %fi_flip = xor i32 %mul6, 8, !dbg !1189
  %add7 = add i32 %3, %fi_flip, !dbg !1189
  store i32 %add7, ptr %y, align 4, !dbg !1178
  %6 = load i32, ptr %y, align 4, !dbg !1190
  %7 = load i32, ptr %height.addr, align 4, !dbg !1192
  %cmp = icmp sge i32 %6, %7, !dbg !1193
  br i1 %cmp, label %if.then, label %lor.lhs.false, !dbg !1194

lor.lhs.false:                                    ; preds = %entry
  %8 = load i32, ptr %x, align 4, !dbg !1195
  %9 = load i32, ptr %width.addr, align 4, !dbg !1196
  %cmp8 = icmp sge i32 %8, %9, !dbg !1197
  br i1 %cmp8, label %if.then, label %if.end, !dbg !1198

if.then:                                          ; preds = %lor.lhs.false, %entry
  br label %return, !dbg !1199

if.end:                                           ; preds = %lor.lhs.false
  call void @llvm.dbg.declare(metadata ptr %count, metadata !1200, metadata !DIExpression()), !dbg !1203
  call void @llvm.dbg.declare(metadata ptr %i, metadata !1204, metadata !DIExpression()), !dbg !1206
  store i32 0, ptr %i, align 4, !dbg !1206
  br label %for.cond, !dbg !1207

for.cond:                                         ; preds = %for.inc, %if.end
  %10 = load i32, ptr %i, align 4, !dbg !1208
  %cmp9 = icmp slt i32 %10, 16, !dbg !1210
  br i1 %cmp9, label %for.body, label %for.end, !dbg !1211

for.body:                                         ; preds = %for.cond
  %11 = load i32, ptr %i, align 4, !dbg !1212
  %idxprom = sext i32 %11 to i64, !dbg !1213
  %arrayidx = getelementptr inbounds [16 x i8], ptr %count, i64 0, i64 %idxprom, !dbg !1213
  store i8 0, ptr %arrayidx, align 1, !dbg !1214
  br label %for.inc, !dbg !1213

for.inc:                                          ; preds = %for.body
  %12 = load i32, ptr %i, align 4, !dbg !1215
  %inc = add nsw i32 %12, 1, !dbg !1215
  store i32 %inc, ptr %i, align 4, !dbg !1215
  br label %for.cond, !dbg !1216, !llvm.loop !1217

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata ptr %total, metadata !1220, metadata !DIExpression()), !dbg !1221
  store i8 0, ptr %total, align 1, !dbg !1221
  call void @llvm.dbg.declare(metadata ptr %dy, metadata !1222, metadata !DIExpression()), !dbg !1224
  store i32 -2, ptr %dy, align 4, !dbg !1224
  br label %for.cond10, !dbg !1225

for.cond10:                                       ; preds = %for.inc37, %for.end
  %13 = load i32, ptr %dy, align 4, !dbg !1226
  %cmp11 = icmp sle i32 %13, 2, !dbg !1228
  br i1 %cmp11, label %for.body12, label %for.end39, !dbg !1229

for.body12:                                       ; preds = %for.cond10
  call void @llvm.dbg.declare(metadata ptr %dx, metadata !1230, metadata !DIExpression()), !dbg !1233
  store i32 -2, ptr %dx, align 4, !dbg !1233
  br label %for.cond13, !dbg !1234

for.cond13:                                       ; preds = %for.inc34, %for.body12
  %14 = load i32, ptr %dx, align 4, !dbg !1235
  %cmp14 = icmp sle i32 %14, 2, !dbg !1237
  br i1 %cmp14, label %for.body15, label %for.end36, !dbg !1238

for.body15:                                       ; preds = %for.cond13
  call void @llvm.dbg.declare(metadata ptr %xx, metadata !1239, metadata !DIExpression()), !dbg !1241
  %15 = load i32, ptr %x, align 4, !dbg !1242
  %16 = load i32, ptr %dx, align 4, !dbg !1243
  %add16 = add nsw i32 %15, %16, !dbg !1244
  store i32 %add16, ptr %xx, align 4, !dbg !1241
  call void @llvm.dbg.declare(metadata ptr %yy, metadata !1245, metadata !DIExpression()), !dbg !1246
  %17 = load i32, ptr %y, align 4, !dbg !1247
  %18 = load i32, ptr %dy, align 4, !dbg !1248
  %add17 = add nsw i32 %17, %18, !dbg !1249
  store i32 %add17, ptr %yy, align 4, !dbg !1246
  %19 = load i32, ptr %xx, align 4, !dbg !1250
  %cmp18 = icmp sge i32 %19, 0, !dbg !1252
  br i1 %cmp18, label %land.lhs.true, label %if.end33, !dbg !1253

land.lhs.true:                                    ; preds = %for.body15
  %20 = load i32, ptr %yy, align 4, !dbg !1254
  %cmp19 = icmp sge i32 %20, 0, !dbg !1255
  br i1 %cmp19, label %land.lhs.true20, label %if.end33, !dbg !1256

land.lhs.true20:                                  ; preds = %land.lhs.true
  %21 = load i32, ptr %yy, align 4, !dbg !1257
  %22 = load i32, ptr %height.addr, align 4, !dbg !1258
  %cmp21 = icmp slt i32 %21, %22, !dbg !1259
  br i1 %cmp21, label %land.lhs.true22, label %if.end33, !dbg !1260

land.lhs.true22:                                  ; preds = %land.lhs.true20
  %23 = load i32, ptr %xx, align 4, !dbg !1261
  %24 = load i32, ptr %width.addr, align 4, !dbg !1262
  %cmp23 = icmp slt i32 %23, %24, !dbg !1263
  br i1 %cmp23, label %if.then24, label %if.end33, !dbg !1264

if.then24:                                        ; preds = %land.lhs.true22
  %25 = load ptr, ptr %d_val.addr, align 8, !dbg !1265
  %26 = load i32, ptr %yy, align 4, !dbg !1267
  %27 = load i32, ptr %width.addr, align 4, !dbg !1268
  %mul25 = mul nsw i32 %26, %27, !dbg !1269
  %28 = load i32, ptr %xx, align 4, !dbg !1270
  %add26 = add nsw i32 %mul25, %28, !dbg !1271
  %idxprom27 = sext i32 %add26 to i64, !dbg !1265
  %arrayidx28 = getelementptr inbounds i8, ptr %25, i64 %idxprom27, !dbg !1265
  %29 = load i8, ptr %arrayidx28, align 1, !dbg !1265
  %idxprom29 = sext i8 %29 to i64, !dbg !1272
  %arrayidx30 = getelementptr inbounds [16 x i8], ptr %count, i64 0, i64 %idxprom29, !dbg !1272
  %30 = load i8, ptr %arrayidx30, align 1, !dbg !1273
  %inc31 = add i8 %30, 1, !dbg !1273
  store i8 %inc31, ptr %arrayidx30, align 1, !dbg !1273
  %31 = load i8, ptr %total, align 1, !dbg !1274
  %inc32 = add i8 %31, 1, !dbg !1274
  store i8 %inc32, ptr %total, align 1, !dbg !1274
  br label %if.end33, !dbg !1275

if.end33:                                         ; preds = %if.then24, %land.lhs.true22, %land.lhs.true20, %land.lhs.true, %for.body15
  br label %for.inc34, !dbg !1276

for.inc34:                                        ; preds = %if.end33
  %32 = load i32, ptr %dx, align 4, !dbg !1277
  %inc35 = add nsw i32 %32, 1, !dbg !1277
  store i32 %inc35, ptr %dx, align 4, !dbg !1277
  br label %for.cond13, !dbg !1278, !llvm.loop !1279

for.end36:                                        ; preds = %for.cond13
  br label %for.inc37, !dbg !1281

for.inc37:                                        ; preds = %for.end36
  %33 = load i32, ptr %dy, align 4, !dbg !1282
  %inc38 = add nsw i32 %33, 1, !dbg !1282
  store i32 %inc38, ptr %dy, align 4, !dbg !1282
  br label %for.cond10, !dbg !1283, !llvm.loop !1284

for.end39:                                        ; preds = %for.cond10
  call void @llvm.dbg.declare(metadata ptr %entropy, metadata !1286, metadata !DIExpression()), !dbg !1287
  store float 0.000000e+00, ptr %entropy, align 4, !dbg !1287
  %34 = load i8, ptr %total, align 1, !dbg !1288
  %conv = sext i8 %34 to i32, !dbg !1288
  %cmp40 = icmp slt i32 %conv, 1, !dbg !1290
  br i1 %cmp40, label %if.then41, label %if.else, !dbg !1291

if.then41:                                        ; preds = %for.end39
  store i8 1, ptr %total, align 1, !dbg !1292
  br label %if.end55, !dbg !1294

if.else:                                          ; preds = %for.end39
  call void @llvm.dbg.declare(metadata ptr %k, metadata !1295, metadata !DIExpression()), !dbg !1298
  store i32 0, ptr %k, align 4, !dbg !1298
  br label %for.cond42, !dbg !1299

for.cond42:                                       ; preds = %for.inc52, %if.else
  %35 = load i32, ptr %k, align 4, !dbg !1300
  %cmp43 = icmp slt i32 %35, 16, !dbg !1302
  br i1 %cmp43, label %for.body44, label %for.end54, !dbg !1303

for.body44:                                       ; preds = %for.cond42
  call void @llvm.dbg.declare(metadata ptr %p, metadata !1304, metadata !DIExpression()), !dbg !1306
  %36 = load i32, ptr %k, align 4, !dbg !1307
  %idxprom45 = sext i32 %36 to i64, !dbg !1308
  %arrayidx46 = getelementptr inbounds [16 x i8], ptr %count, i64 0, i64 %idxprom45, !dbg !1308
  %37 = load i8, ptr %arrayidx46, align 1, !dbg !1308
  %conv47 = sitofp i8 %37 to float, !dbg !1308
  %38 = load i8, ptr %total, align 1, !dbg !1309
  %conv48 = sitofp i8 %38 to float, !dbg !1309
  store float %conv47, ptr %__a.addr.i, align 4
  call void @llvm.dbg.declare(metadata ptr %__a.addr.i, metadata !1310, metadata !DIExpression()), !dbg !1313
  store float %conv48, ptr %__b.addr.i, align 4
  call void @llvm.dbg.declare(metadata ptr %__b.addr.i, metadata !1315, metadata !DIExpression()), !dbg !1316
  %39 = load float, ptr %__a.addr.i, align 4, !dbg !1317
  %40 = load float, ptr %__b.addr.i, align 4, !dbg !1318
  %41 = call float @llvm.nvvm.div.approx.f(float %39, float %40), !dbg !1319
  store float %41, ptr %p, align 4, !dbg !1306
  %42 = load float, ptr %p, align 4, !dbg !1320
  %43 = load float, ptr %p, align 4, !dbg !1321
  store float %43, ptr %__a.addr.i60, align 4
  call void @llvm.dbg.declare(metadata ptr %__a.addr.i60, metadata !1322, metadata !DIExpression()), !dbg !1324
  %44 = load float, ptr %__a.addr.i60, align 4, !dbg !1326
  %45 = call float @llvm.nvvm.lg2.approx.f(float %44) #4, !dbg !1327
  %mul51 = fmul contract float %42, %45, !dbg !1328
  %46 = load float, ptr %entropy, align 4, !dbg !1329
  %sub = fsub contract float %46, %mul51, !dbg !1329
  store float %sub, ptr %entropy, align 4, !dbg !1329
  br label %for.inc52, !dbg !1330

for.inc52:                                        ; preds = %for.body44
  %47 = load i32, ptr %k, align 4, !dbg !1331
  %inc53 = add nsw i32 %47, 1, !dbg !1331
  store i32 %inc53, ptr %k, align 4, !dbg !1331
  br label %for.cond42, !dbg !1332, !llvm.loop !1333

for.end54:                                        ; preds = %for.cond42
  br label %if.end55

if.end55:                                         ; preds = %for.end54, %if.then41
  %48 = load float, ptr %entropy, align 4, !dbg !1335
  %49 = load ptr, ptr %d_entropy.addr, align 8, !dbg !1336
  %50 = load i32, ptr %y, align 4, !dbg !1337
  %51 = load i32, ptr %width.addr, align 4, !dbg !1338
  %mul56 = mul nsw i32 %50, %51, !dbg !1339
  %52 = load i32, ptr %x, align 4, !dbg !1340
  %add57 = add nsw i32 %mul56, %52, !dbg !1341
  %idxprom58 = sext i32 %add57 to i64, !dbg !1336
  %arrayidx59 = getelementptr inbounds float, ptr %49, i64 %idxprom58, !dbg !1336
  store float %48, ptr %arrayidx59, align 4, !dbg !1342
  br label %return, !dbg !1343

return:                                           ; preds = %if.end55, %if.then
  ret void, !dbg !1343
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.y() #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ntid.y() #1

; Function Attrs: convergent noinline norecurse nounwind optnone
define dso_local void @_Z11entropy_optILi16ELi16EEvPfPKcPKfii(ptr noalias noundef %d_entropy, ptr noalias noundef %d_val, ptr noalias noundef %d_logTable, i32 noundef %height, i32 noundef %width) #0 comdat !dbg !2 {
entry:
  %__a.addr.i = alloca float, align 4
  %d_entropy.addr = alloca ptr, align 8
  %d_val.addr = alloca ptr, align 8
  %d_logTable.addr = alloca ptr, align 8
  %height.addr = alloca i32, align 4
  %width.addr = alloca i32, align 4
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %idx = alloca i32, align 4
  %i = alloca i32, align 4
  %total = alloca i8, align 1
  %dy = alloca i32, align 4
  %dx = alloca i32, align 4
  %xx = alloca i32, align 4
  %yy = alloca i32, align 4
  %entropy = alloca float, align 4
  %k = alloca i32, align 4
  store ptr %d_entropy, ptr %d_entropy.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %d_entropy.addr, metadata !1344, metadata !DIExpression()), !dbg !1345
  store ptr %d_val, ptr %d_val.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %d_val.addr, metadata !1346, metadata !DIExpression()), !dbg !1347
  store ptr %d_logTable, ptr %d_logTable.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %d_logTable.addr, metadata !1348, metadata !DIExpression()), !dbg !1349
  store i32 %height, ptr %height.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %height.addr, metadata !1350, metadata !DIExpression()), !dbg !1351
  store i32 %width, ptr %width.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %width.addr, metadata !1352, metadata !DIExpression()), !dbg !1353
  call void @llvm.dbg.declare(metadata ptr %x, metadata !1354, metadata !DIExpression()), !dbg !1355
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !dbg !1356
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !dbg !1358
  %2 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x(), !dbg !1360
  %mul = mul i32 %1, %2, !dbg !1362
  %add = add i32 %0, %mul, !dbg !1363
  store i32 %add, ptr %x, align 4, !dbg !1355
  call void @llvm.dbg.declare(metadata ptr %y, metadata !1364, metadata !DIExpression()), !dbg !1365
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.y(), !dbg !1366
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !dbg !1368
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.y(), !dbg !1370
  %mul6 = mul i32 %4, %5, !dbg !1372
  %add7 = add i32 %3, %mul6, !dbg !1373
  store i32 %add7, ptr %y, align 4, !dbg !1365
  %6 = load i32, ptr %y, align 4, !dbg !1374
  %7 = load i32, ptr %height.addr, align 4, !dbg !1376
  %cmp = icmp sge i32 %6, %7, !dbg !1377
  br i1 %cmp, label %if.then, label %lor.lhs.false, !dbg !1378

lor.lhs.false:                                    ; preds = %entry
  %8 = load i32, ptr %x, align 4, !dbg !1379
  %9 = load i32, ptr %width.addr, align 4, !dbg !1380
  %cmp8 = icmp sge i32 %8, %9, !dbg !1381
  br i1 %cmp8, label %if.then, label %if.end, !dbg !1382

if.then:                                          ; preds = %lor.lhs.false, %entry
  br label %return, !dbg !1383

if.end:                                           ; preds = %lor.lhs.false
  call void @llvm.dbg.declare(metadata ptr %idx, metadata !1384, metadata !DIExpression()), !dbg !1385
  %10 = call i32 @llvm.nvvm.read.ptx.sreg.tid.y(), !dbg !1386
  %mul10 = mul i32 %10, 16, !dbg !1388
  %11 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !dbg !1389
  %add12 = add i32 %mul10, %11, !dbg !1391
  store i32 %add12, ptr %idx, align 4, !dbg !1385
  call void @llvm.dbg.declare(metadata ptr %i, metadata !1392, metadata !DIExpression()), !dbg !1394
  store i32 0, ptr %i, align 4, !dbg !1394
  br label %for.cond, !dbg !1395

for.cond:                                         ; preds = %for.inc, %if.end
  %12 = load i32, ptr %i, align 4, !dbg !1396
  %cmp13 = icmp slt i32 %12, 16, !dbg !1398
  br i1 %cmp13, label %for.body, label %for.end, !dbg !1399

for.body:                                         ; preds = %for.cond
  %13 = load i32, ptr %i, align 4, !dbg !1400
  %idxprom = sext i32 %13 to i64, !dbg !1401
  %arrayidx = getelementptr inbounds [16 x [256 x i32]], ptr addrspacecast (ptr addrspace(3) @_ZZ11entropy_optILi16ELi16EEvPfPKcPKfiiE8sd_count to ptr), i64 0, i64 %idxprom, !dbg !1401
  %14 = load i32, ptr %idx, align 4, !dbg !1402
  %idxprom14 = sext i32 %14 to i64, !dbg !1401
  %arrayidx15 = getelementptr inbounds [256 x i32], ptr %arrayidx, i64 0, i64 %idxprom14, !dbg !1401
  store i32 0, ptr %arrayidx15, align 4, !dbg !1403
  br label %for.inc, !dbg !1401

for.inc:                                          ; preds = %for.body
  %15 = load i32, ptr %i, align 4, !dbg !1404
  %inc = add nsw i32 %15, 1, !dbg !1404
  store i32 %inc, ptr %i, align 4, !dbg !1404
  br label %for.cond, !dbg !1405, !llvm.loop !1406

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata ptr %total, metadata !1408, metadata !DIExpression()), !dbg !1409
  store i8 0, ptr %total, align 1, !dbg !1409
  call void @llvm.dbg.declare(metadata ptr %dy, metadata !1410, metadata !DIExpression()), !dbg !1412
  store i32 -2, ptr %dy, align 4, !dbg !1412
  br label %for.cond16, !dbg !1413

for.cond16:                                       ; preds = %for.inc45, %for.end
  %16 = load i32, ptr %dy, align 4, !dbg !1414
  %cmp17 = icmp sle i32 %16, 2, !dbg !1416
  br i1 %cmp17, label %for.body18, label %for.end47, !dbg !1417

for.body18:                                       ; preds = %for.cond16
  call void @llvm.dbg.declare(metadata ptr %dx, metadata !1418, metadata !DIExpression()), !dbg !1421
  store i32 -2, ptr %dx, align 4, !dbg !1421
  br label %for.cond19, !dbg !1422

for.cond19:                                       ; preds = %for.inc42, %for.body18
  %17 = load i32, ptr %dx, align 4, !dbg !1423
  %cmp20 = icmp sle i32 %17, 2, !dbg !1425
  br i1 %cmp20, label %for.body21, label %for.end44, !dbg !1426

for.body21:                                       ; preds = %for.cond19
  call void @llvm.dbg.declare(metadata ptr %xx, metadata !1427, metadata !DIExpression()), !dbg !1429
  %18 = load i32, ptr %x, align 4, !dbg !1430
  %19 = load i32, ptr %dx, align 4, !dbg !1431
  %add22 = add nsw i32 %18, %19, !dbg !1432
  store i32 %add22, ptr %xx, align 4, !dbg !1429
  call void @llvm.dbg.declare(metadata ptr %yy, metadata !1433, metadata !DIExpression()), !dbg !1434
  %20 = load i32, ptr %y, align 4, !dbg !1435
  %21 = load i32, ptr %dy, align 4, !dbg !1436
  %add23 = add nsw i32 %20, %21, !dbg !1437
  store i32 %add23, ptr %yy, align 4, !dbg !1434
  %22 = load i32, ptr %xx, align 4, !dbg !1438
  %cmp24 = icmp sge i32 %22, 0, !dbg !1440
  br i1 %cmp24, label %land.lhs.true, label %if.end41, !dbg !1441

land.lhs.true:                                    ; preds = %for.body21
  %23 = load i32, ptr %yy, align 4, !dbg !1442
  %cmp25 = icmp sge i32 %23, 0, !dbg !1443
  br i1 %cmp25, label %land.lhs.true26, label %if.end41, !dbg !1444

land.lhs.true26:                                  ; preds = %land.lhs.true
  %24 = load i32, ptr %yy, align 4, !dbg !1445
  %25 = load i32, ptr %height.addr, align 4, !dbg !1446
  %cmp27 = icmp slt i32 %24, %25, !dbg !1447
  br i1 %cmp27, label %land.lhs.true28, label %if.end41, !dbg !1448

land.lhs.true28:                                  ; preds = %land.lhs.true26
  %26 = load i32, ptr %xx, align 4, !dbg !1449
  %27 = load i32, ptr %width.addr, align 4, !dbg !1450
  %cmp29 = icmp slt i32 %26, %27, !dbg !1451
  br i1 %cmp29, label %if.then30, label %if.end41, !dbg !1452

if.then30:                                        ; preds = %land.lhs.true28
  %28 = load ptr, ptr %d_val.addr, align 8, !dbg !1453
  %29 = load i32, ptr %yy, align 4, !dbg !1455
  %30 = load i32, ptr %width.addr, align 4, !dbg !1456
  %mul31 = mul nsw i32 %29, %30, !dbg !1457
  %31 = load i32, ptr %xx, align 4, !dbg !1458
  %add32 = add nsw i32 %mul31, %31, !dbg !1459
  %idxprom33 = sext i32 %add32 to i64, !dbg !1453
  %arrayidx34 = getelementptr inbounds i8, ptr %28, i64 %idxprom33, !dbg !1453
  %32 = load i8, ptr %arrayidx34, align 1, !dbg !1453
  %idxprom35 = sext i8 %32 to i64, !dbg !1460
  %arrayidx36 = getelementptr inbounds [16 x [256 x i32]], ptr addrspacecast (ptr addrspace(3) @_ZZ11entropy_optILi16ELi16EEvPfPKcPKfiiE8sd_count to ptr), i64 0, i64 %idxprom35, !dbg !1460
  %33 = load i32, ptr %idx, align 4, !dbg !1461
  %idxprom37 = sext i32 %33 to i64, !dbg !1460
  %arrayidx38 = getelementptr inbounds [256 x i32], ptr %arrayidx36, i64 0, i64 %idxprom37, !dbg !1460
  %34 = load i32, ptr %arrayidx38, align 4, !dbg !1462
  %inc39 = add nsw i32 %34, 1, !dbg !1462
  store i32 %inc39, ptr %arrayidx38, align 4, !dbg !1462
  %35 = load i8, ptr %total, align 1, !dbg !1463
  %inc40 = add i8 %35, 1, !dbg !1463
  store i8 %inc40, ptr %total, align 1, !dbg !1463
  br label %if.end41, !dbg !1464

if.end41:                                         ; preds = %if.then30, %land.lhs.true28, %land.lhs.true26, %land.lhs.true, %for.body21
  br label %for.inc42, !dbg !1465

for.inc42:                                        ; preds = %if.end41
  %36 = load i32, ptr %dx, align 4, !dbg !1466
  %inc43 = add nsw i32 %36, 1, !dbg !1466
  store i32 %inc43, ptr %dx, align 4, !dbg !1466
  br label %for.cond19, !dbg !1467, !llvm.loop !1468

for.end44:                                        ; preds = %for.cond19
  br label %for.inc45, !dbg !1470

for.inc45:                                        ; preds = %for.end44
  %37 = load i32, ptr %dy, align 4, !dbg !1471
  %inc46 = add nsw i32 %37, 1, !dbg !1471
  store i32 %inc46, ptr %dy, align 4, !dbg !1471
  br label %for.cond16, !dbg !1472, !llvm.loop !1473

for.end47:                                        ; preds = %for.cond16
  call void @llvm.dbg.declare(metadata ptr %entropy, metadata !1475, metadata !DIExpression()), !dbg !1476
  store float 0.000000e+00, ptr %entropy, align 4, !dbg !1476
  call void @llvm.dbg.declare(metadata ptr %k, metadata !1477, metadata !DIExpression()), !dbg !1479
  store i32 0, ptr %k, align 4, !dbg !1479
  br label %for.cond48, !dbg !1480

for.cond48:                                       ; preds = %for.inc57, %for.end47
  %38 = load i32, ptr %k, align 4, !dbg !1481
  %cmp49 = icmp slt i32 %38, 16, !dbg !1483
  br i1 %cmp49, label %for.body50, label %for.end59, !dbg !1484

for.body50:                                       ; preds = %for.cond48
  %39 = load ptr, ptr %d_logTable.addr, align 8, !dbg !1485
  %40 = load i32, ptr %k, align 4, !dbg !1486
  %idxprom51 = sext i32 %40 to i64, !dbg !1487
  %arrayidx52 = getelementptr inbounds [16 x [256 x i32]], ptr addrspacecast (ptr addrspace(3) @_ZZ11entropy_optILi16ELi16EEvPfPKcPKfiiE8sd_count to ptr), i64 0, i64 %idxprom51, !dbg !1487
  %41 = load i32, ptr %idx, align 4, !dbg !1488
  %idxprom53 = sext i32 %41 to i64, !dbg !1487
  %arrayidx54 = getelementptr inbounds [256 x i32], ptr %arrayidx52, i64 0, i64 %idxprom53, !dbg !1487
  %42 = load i32, ptr %arrayidx54, align 4, !dbg !1487
  %idxprom55 = sext i32 %42 to i64, !dbg !1485
  %arrayidx56 = getelementptr inbounds float, ptr %39, i64 %idxprom55, !dbg !1485
  %43 = load float, ptr %arrayidx56, align 4, !dbg !1485
  %44 = load float, ptr %entropy, align 4, !dbg !1489
  %sub = fsub contract float %44, %43, !dbg !1489
  store float %sub, ptr %entropy, align 4, !dbg !1489
  br label %for.inc57, !dbg !1490

for.inc57:                                        ; preds = %for.body50
  %45 = load i32, ptr %k, align 4, !dbg !1491
  %inc58 = add nsw i32 %45, 1, !dbg !1491
  store i32 %inc58, ptr %k, align 4, !dbg !1491
  br label %for.cond48, !dbg !1492, !llvm.loop !1493

for.end59:                                        ; preds = %for.cond48
  %46 = load float, ptr %entropy, align 4, !dbg !1495
  %47 = load i8, ptr %total, align 1, !dbg !1496
  %conv = sext i8 %47 to i32, !dbg !1496
  %conv60 = sitofp i32 %conv to float, !dbg !1496
  %div = fdiv contract float %46, %conv60, !dbg !1497
  %48 = load i8, ptr %total, align 1, !dbg !1498
  %conv61 = sitofp i8 %48 to float, !dbg !1498
  store float %conv61, ptr %__a.addr.i, align 4
  call void @llvm.dbg.declare(metadata ptr %__a.addr.i, metadata !1322, metadata !DIExpression()), !dbg !1499
  %49 = load float, ptr %__a.addr.i, align 4, !dbg !1501
  %50 = call float @llvm.nvvm.lg2.approx.f(float %49) #4, !dbg !1502
  %add63 = fadd contract float %div, %50, !dbg !1503
  store float %add63, ptr %entropy, align 4, !dbg !1504
  %51 = load float, ptr %entropy, align 4, !dbg !1505
  %52 = load ptr, ptr %d_entropy.addr, align 8, !dbg !1506
  %53 = load i32, ptr %y, align 4, !dbg !1507
  %54 = load i32, ptr %width.addr, align 4, !dbg !1508
  %mul64 = mul nsw i32 %53, %54, !dbg !1509
  %55 = load i32, ptr %x, align 4, !dbg !1510
  %add65 = add nsw i32 %mul64, %55, !dbg !1511
  %idxprom66 = sext i32 %add65 to i64, !dbg !1506
  %arrayidx67 = getelementptr inbounds float, ptr %52, i64 %idxprom66, !dbg !1506
  store float %51, ptr %arrayidx67, align 4, !dbg !1512
  br label %return, !dbg !1513

return:                                           ; preds = %for.end59, %if.then
  ret void, !dbg !1513
}

; Function Attrs: convergent nounwind
declare i32 @__nvvm_reflect(ptr) #2

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare float @llvm.nvvm.div.approx.ftz.f(float, float) #3

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare float @llvm.nvvm.div.approx.f(float, float) #3

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare float @llvm.nvvm.lg2.approx.ftz.f(float) #3

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare float @llvm.nvvm.lg2.approx.f(float) #3

attributes #0 = { convergent noinline norecurse nounwind optnone "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="sm_80" "target-features"="+ptx78,+sm_80" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { convergent nounwind "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="sm_80" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nocallback nofree nosync nounwind willreturn memory(none) }
attributes #4 = { nounwind }

!llvm.module.flags = !{!1142, !1143, !1144, !1145, !1146, !1147}
!llvm.dbg.cu = !{!17}
!nvvm.annotations = !{!1148, !1149}
!llvm.ident = !{!1150, !1151}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression(DW_OP_constu, 8, DW_OP_swap, DW_OP_xderef))
!1 = distinct !DIGlobalVariable(name: "sd_count", scope: !2, file: !3, line: 57, type: !1138, isLocal: false, isDefinition: true)
!2 = distinct !DISubprogram(name: "entropy_opt<16, 16>", linkageName: "_Z11entropy_optILi16ELi16EEvPfPKcPKfii", scope: !3, file: !3, line: 51, type: !4, scopeLine: 56, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, templateParams: !1135, retainedNodes: !1134)
!3 = !DIFile(filename: "HeCBench/src/entropy-cuda/main.cu", directory: "/home/mdunlavy/GPU_FI")
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
!17 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !18, producer: "clang version 17.0.6 (https://github.com/llvm/llvm-project.git 6009708b4367171ccdbf4b5905cb6a803753fe18)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !19, globals: !132, imports: !133, splitDebugInlining: false, nameTableKind: None)
!18 = !DIFile(filename: "/home/mdunlavy/GPU_FI/HeCBench/src/entropy-cuda/main.cu", directory: "/home/mdunlavy/GPU_FI")
!19 = !{!8, !20, !45, !76, !104}
!20 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dim3", file: !21, line: 418, size: 96, flags: DIFlagTypePassByValue | DIFlagNonTrivial, elements: !22, identifier: "_ZTS4dim3")
!21 = !DIFile(filename: "/soft/compilers/cudatoolkit/cuda-11.8.0/include/vector_types.h", directory: "")
!22 = !{!23, !25, !26, !27, !31, !40}
!23 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !20, file: !21, line: 420, baseType: !24, size: 32)
!24 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!25 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !20, file: !21, line: 420, baseType: !24, size: 32, offset: 32)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !20, file: !21, line: 420, baseType: !24, size: 32, offset: 64)
!27 = !DISubprogram(name: "dim3", scope: !20, file: !21, line: 423, type: !28, scopeLine: 423, flags: DIFlagPrototyped, spFlags: 0)
!28 = !DISubroutineType(types: !29)
!29 = !{null, !30, !24, !24, !24}
!30 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!31 = !DISubprogram(name: "dim3", scope: !20, file: !21, line: 424, type: !32, scopeLine: 424, flags: DIFlagPrototyped, spFlags: 0)
!32 = !DISubroutineType(types: !33)
!33 = !{null, !30, !34}
!34 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint3", file: !21, line: 384, baseType: !35)
!35 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "uint3", file: !21, line: 192, size: 96, flags: DIFlagTypePassByValue, elements: !36, identifier: "_ZTS5uint3")
!36 = !{!37, !38, !39}
!37 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !35, file: !21, line: 194, baseType: !24, size: 32)
!38 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !35, file: !21, line: 194, baseType: !24, size: 32, offset: 32)
!39 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !35, file: !21, line: 194, baseType: !24, size: 32, offset: 64)
!40 = !DISubprogram(name: "operator uint3", linkageName: "_ZNK4dim3cv5uint3Ev", scope: !20, file: !21, line: 425, type: !41, scopeLine: 425, flags: DIFlagPrototyped, spFlags: 0)
!41 = !DISubroutineType(types: !42)
!42 = !{!34, !43}
!43 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !44, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!44 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !20)
!45 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__cuda_builtin_threadIdx_t", file: !46, line: 52, size: 8, flags: DIFlagTypePassByReference, elements: !47, identifier: "_ZTS26__cuda_builtin_threadIdx_t")
!46 = !DIFile(filename: "/soft/compilers/llvm/release-17.0.6/lib/clang/17/include/__clang_cuda_builtin_vars.h", directory: "")
!47 = !{!48, !51, !52, !53, !58, !61, !65, !69, !72}
!48 = !DISubprogram(name: "__fetch_builtin_x", linkageName: "_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv", scope: !45, file: !46, line: 53, type: !49, scopeLine: 53, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!49 = !DISubroutineType(types: !50)
!50 = !{!24}
!51 = !DISubprogram(name: "__fetch_builtin_y", linkageName: "_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv", scope: !45, file: !46, line: 54, type: !49, scopeLine: 54, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!52 = !DISubprogram(name: "__fetch_builtin_z", linkageName: "_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_zEv", scope: !45, file: !46, line: 55, type: !49, scopeLine: 55, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!53 = !DISubprogram(name: "operator dim3", linkageName: "_ZNK26__cuda_builtin_threadIdx_tcv4dim3Ev", scope: !45, file: !46, line: 58, type: !54, scopeLine: 58, flags: DIFlagPrototyped, spFlags: 0)
!54 = !DISubroutineType(types: !55)
!55 = !{!20, !56}
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!57 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !45)
!58 = !DISubprogram(name: "operator uint3", linkageName: "_ZNK26__cuda_builtin_threadIdx_tcv5uint3Ev", scope: !45, file: !46, line: 59, type: !59, scopeLine: 59, flags: DIFlagPrototyped, spFlags: 0)
!59 = !DISubroutineType(types: !60)
!60 = !{!35, !56}
!61 = !DISubprogram(name: "__cuda_builtin_threadIdx_t", scope: !45, file: !46, line: 62, type: !62, scopeLine: 62, flags: DIFlagPrivate | DIFlagPrototyped, spFlags: DISPFlagDeleted)
!62 = !DISubroutineType(types: !63)
!63 = !{null, !64}
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !45, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!65 = !DISubprogram(name: "__cuda_builtin_threadIdx_t", scope: !45, file: !46, line: 62, type: !66, scopeLine: 62, flags: DIFlagPrivate | DIFlagPrototyped, spFlags: DISPFlagDeleted)
!66 = !DISubroutineType(types: !67)
!67 = !{null, !64, !68}
!68 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !57, size: 64)
!69 = !DISubprogram(name: "operator=", linkageName: "_ZNK26__cuda_builtin_threadIdx_taSERKS_", scope: !45, file: !46, line: 62, type: !70, scopeLine: 62, flags: DIFlagPrivate | DIFlagPrototyped, spFlags: DISPFlagDeleted)
!70 = !DISubroutineType(types: !71)
!71 = !{null, !56, !68}
!72 = !DISubprogram(name: "operator&", linkageName: "_ZNK26__cuda_builtin_threadIdx_tadEv", scope: !45, file: !46, line: 62, type: !73, scopeLine: 62, flags: DIFlagPrivate | DIFlagPrototyped, spFlags: DISPFlagDeleted)
!73 = !DISubroutineType(types: !74)
!74 = !{!75, !56}
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !45, size: 64)
!76 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__cuda_builtin_blockIdx_t", file: !46, line: 65, size: 8, flags: DIFlagTypePassByReference, elements: !77, identifier: "_ZTS25__cuda_builtin_blockIdx_t")
!77 = !{!78, !79, !80, !81, !86, !89, !93, !97, !100}
!78 = !DISubprogram(name: "__fetch_builtin_x", linkageName: "_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv", scope: !76, file: !46, line: 66, type: !49, scopeLine: 66, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!79 = !DISubprogram(name: "__fetch_builtin_y", linkageName: "_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv", scope: !76, file: !46, line: 67, type: !49, scopeLine: 67, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!80 = !DISubprogram(name: "__fetch_builtin_z", linkageName: "_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_zEv", scope: !76, file: !46, line: 68, type: !49, scopeLine: 68, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!81 = !DISubprogram(name: "operator dim3", linkageName: "_ZNK25__cuda_builtin_blockIdx_tcv4dim3Ev", scope: !76, file: !46, line: 71, type: !82, scopeLine: 71, flags: DIFlagPrototyped, spFlags: 0)
!82 = !DISubroutineType(types: !83)
!83 = !{!20, !84}
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !85, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!85 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !76)
!86 = !DISubprogram(name: "operator uint3", linkageName: "_ZNK25__cuda_builtin_blockIdx_tcv5uint3Ev", scope: !76, file: !46, line: 72, type: !87, scopeLine: 72, flags: DIFlagPrototyped, spFlags: 0)
!87 = !DISubroutineType(types: !88)
!88 = !{!35, !84}
!89 = !DISubprogram(name: "__cuda_builtin_blockIdx_t", scope: !76, file: !46, line: 75, type: !90, scopeLine: 75, flags: DIFlagPrivate | DIFlagPrototyped, spFlags: DISPFlagDeleted)
!90 = !DISubroutineType(types: !91)
!91 = !{null, !92}
!92 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!93 = !DISubprogram(name: "__cuda_builtin_blockIdx_t", scope: !76, file: !46, line: 75, type: !94, scopeLine: 75, flags: DIFlagPrivate | DIFlagPrototyped, spFlags: DISPFlagDeleted)
!94 = !DISubroutineType(types: !95)
!95 = !{null, !92, !96}
!96 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !85, size: 64)
!97 = !DISubprogram(name: "operator=", linkageName: "_ZNK25__cuda_builtin_blockIdx_taSERKS_", scope: !76, file: !46, line: 75, type: !98, scopeLine: 75, flags: DIFlagPrivate | DIFlagPrototyped, spFlags: DISPFlagDeleted)
!98 = !DISubroutineType(types: !99)
!99 = !{null, !84, !96}
!100 = !DISubprogram(name: "operator&", linkageName: "_ZNK25__cuda_builtin_blockIdx_tadEv", scope: !76, file: !46, line: 75, type: !101, scopeLine: 75, flags: DIFlagPrivate | DIFlagPrototyped, spFlags: DISPFlagDeleted)
!101 = !DISubroutineType(types: !102)
!102 = !{!103, !84}
!103 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 64)
!104 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__cuda_builtin_blockDim_t", file: !46, line: 78, size: 8, flags: DIFlagTypePassByReference, elements: !105, identifier: "_ZTS25__cuda_builtin_blockDim_t")
!105 = !{!106, !107, !108, !109, !114, !117, !121, !125, !128}
!106 = !DISubprogram(name: "__fetch_builtin_x", linkageName: "_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv", scope: !104, file: !46, line: 79, type: !49, scopeLine: 79, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!107 = !DISubprogram(name: "__fetch_builtin_y", linkageName: "_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_yEv", scope: !104, file: !46, line: 80, type: !49, scopeLine: 80, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!108 = !DISubprogram(name: "__fetch_builtin_z", linkageName: "_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_zEv", scope: !104, file: !46, line: 81, type: !49, scopeLine: 81, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!109 = !DISubprogram(name: "operator dim3", linkageName: "_ZNK25__cuda_builtin_blockDim_tcv4dim3Ev", scope: !104, file: !46, line: 84, type: !110, scopeLine: 84, flags: DIFlagPrototyped, spFlags: 0)
!110 = !DISubroutineType(types: !111)
!111 = !{!20, !112}
!112 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !113, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!113 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !104)
!114 = !DISubprogram(name: "operator uint3", linkageName: "_ZNK25__cuda_builtin_blockDim_tcv5uint3Ev", scope: !104, file: !46, line: 85, type: !115, scopeLine: 85, flags: DIFlagPrototyped, spFlags: 0)
!115 = !DISubroutineType(types: !116)
!116 = !{!35, !112}
!117 = !DISubprogram(name: "__cuda_builtin_blockDim_t", scope: !104, file: !46, line: 88, type: !118, scopeLine: 88, flags: DIFlagPrivate | DIFlagPrototyped, spFlags: DISPFlagDeleted)
!118 = !DISubroutineType(types: !119)
!119 = !{null, !120}
!120 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !104, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!121 = !DISubprogram(name: "__cuda_builtin_blockDim_t", scope: !104, file: !46, line: 88, type: !122, scopeLine: 88, flags: DIFlagPrivate | DIFlagPrototyped, spFlags: DISPFlagDeleted)
!122 = !DISubroutineType(types: !123)
!123 = !{null, !120, !124}
!124 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !113, size: 64)
!125 = !DISubprogram(name: "operator=", linkageName: "_ZNK25__cuda_builtin_blockDim_taSERKS_", scope: !104, file: !46, line: 88, type: !126, scopeLine: 88, flags: DIFlagPrivate | DIFlagPrototyped, spFlags: DISPFlagDeleted)
!126 = !DISubroutineType(types: !127)
!127 = !{null, !112, !124}
!128 = !DISubprogram(name: "operator&", linkageName: "_ZNK25__cuda_builtin_blockDim_tadEv", scope: !104, file: !46, line: 88, type: !129, scopeLine: 88, flags: DIFlagPrivate | DIFlagPrototyped, spFlags: DISPFlagDeleted)
!129 = !DISubroutineType(types: !130)
!130 = !{!131, !112}
!131 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !104, size: 64)
!132 = !{!0}
!133 = !{!134, !140, !144, !146, !148, !150, !152, !156, !158, !160, !162, !164, !166, !168, !170, !172, !174, !176, !178, !180, !182, !184, !188, !190, !192, !194, !198, !203, !205, !207, !212, !216, !218, !220, !222, !224, !226, !228, !230, !232, !237, !241, !243, !248, !252, !254, !256, !258, !260, !262, !266, !268, !270, !274, !279, !283, !285, !287, !289, !291, !295, !297, !299, !303, !305, !307, !309, !311, !313, !315, !317, !319, !321, !325, !331, !333, !335, !339, !341, !343, !345, !347, !349, !351, !353, !357, !361, !363, !365, !370, !372, !374, !376, !378, !380, !382, !385, !387, !389, !391, !396, !398, !400, !402, !404, !406, !408, !410, !412, !414, !416, !418, !422, !424, !426, !428, !430, !432, !434, !436, !438, !440, !442, !444, !446, !448, !450, !452, !456, !458, !462, !464, !466, !468, !470, !472, !474, !476, !478, !480, !484, !486, !490, !492, !494, !496, !500, !502, !506, !508, !510, !512, !514, !516, !518, !520, !522, !524, !526, !528, !530, !534, !536, !540, !542, !544, !546, !548, !550, !554, !556, !558, !560, !562, !564, !566, !570, !574, !576, !578, !580, !582, !586, !588, !592, !594, !596, !598, !600, !602, !604, !608, !610, !614, !616, !618, !622, !624, !626, !628, !630, !632, !634, !638, !642, !648, !652, !660, !665, !667, !669, !673, !677, !687, !689, !693, !697, !701, !706, !708, !712, !716, !720, !727, !731, !735, !737, !741, !745, !749, !755, !759, !763, !765, !773, !777, !784, !786, !788, !792, !796, !800, !805, !809, !813, !814, !815, !816, !818, !819, !820, !821, !822, !823, !824, !826, !827, !828, !829, !830, !831, !832, !837, !838, !839, !840, !841, !842, !843, !844, !845, !846, !847, !848, !849, !850, !851, !852, !853, !854, !855, !856, !857, !858, !859, !860, !861, !865, !867, !869, !871, !873, !875, !877, !879, !881, !883, !885, !887, !889, !891, !893, !895, !897, !899, !901, !903, !905, !907, !909, !911, !913, !915, !917, !919, !921, !923, !925, !927, !929, !931, !933, !935, !937, !939, !941, !943, !945, !947, !949, !951, !953, !955, !957, !959, !961, !963, !965, !967, !969, !971, !973, !975, !980, !987, !991, !994, !997, !1000, !1002, !1004, !1006, !1009, !1012, !1015, !1018, !1021, !1023, !1028, !1032, !1035, !1038, !1040, !1042, !1044, !1046, !1049, !1052, !1055, !1058, !1061, !1063, !1068, !1072, !1075, !1080, !1084, !1089, !1094, !1100, !1106, !1110, !1112, !1117, !1124, !1129}
!134 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !136, file: !137, line: 200)
!135 = !DINamespace(name: "std", scope: null)
!136 = !DISubprogram(name: "abs", linkageName: "_ZL3absi", scope: !137, file: !137, line: 30, type: !138, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!137 = !DIFile(filename: "/soft/compilers/llvm/release-17.0.6/lib/clang/17/include/__clang_cuda_math_forward_declares.h", directory: "")
!138 = !DISubroutineType(types: !139)
!139 = !{!16, !16}
!140 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !141, file: !137, line: 201)
!141 = !DISubprogram(name: "acos", linkageName: "_ZL4acosf", scope: !137, file: !137, line: 32, type: !142, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!142 = !DISubroutineType(types: !143)
!143 = !{!8, !8}
!144 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !145, file: !137, line: 202)
!145 = !DISubprogram(name: "acosh", linkageName: "_ZL5acoshf", scope: !137, file: !137, line: 34, type: !142, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!146 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !147, file: !137, line: 203)
!147 = !DISubprogram(name: "asin", linkageName: "_ZL4asinf", scope: !137, file: !137, line: 36, type: !142, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!148 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !149, file: !137, line: 204)
!149 = !DISubprogram(name: "asinh", linkageName: "_ZL5asinhf", scope: !137, file: !137, line: 38, type: !142, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!150 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !151, file: !137, line: 205)
!151 = !DISubprogram(name: "atan", linkageName: "_ZL4atanf", scope: !137, file: !137, line: 42, type: !142, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!152 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !153, file: !137, line: 206)
!153 = !DISubprogram(name: "atan2", linkageName: "_ZL5atan2ff", scope: !137, file: !137, line: 40, type: !154, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!154 = !DISubroutineType(types: !155)
!155 = !{!8, !8, !8}
!156 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !157, file: !137, line: 207)
!157 = !DISubprogram(name: "atanh", linkageName: "_ZL5atanhf", scope: !137, file: !137, line: 44, type: !142, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!158 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !159, file: !137, line: 208)
!159 = !DISubprogram(name: "cbrt", linkageName: "_ZL4cbrtf", scope: !137, file: !137, line: 46, type: !142, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!160 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !161, file: !137, line: 209)
!161 = !DISubprogram(name: "ceil", linkageName: "_ZL4ceilf", scope: !137, file: !137, line: 48, type: !142, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!162 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !163, file: !137, line: 210)
!163 = !DISubprogram(name: "copysign", linkageName: "_ZL8copysignff", scope: !137, file: !137, line: 50, type: !154, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!164 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !165, file: !137, line: 211)
!165 = !DISubprogram(name: "cos", linkageName: "_ZL3cosf", scope: !137, file: !137, line: 52, type: !142, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!166 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !167, file: !137, line: 212)
!167 = !DISubprogram(name: "cosh", linkageName: "_ZL4coshf", scope: !137, file: !137, line: 54, type: !142, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!168 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !169, file: !137, line: 213)
!169 = !DISubprogram(name: "erf", linkageName: "_ZL3erff", scope: !137, file: !137, line: 58, type: !142, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!170 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !171, file: !137, line: 214)
!171 = !DISubprogram(name: "erfc", linkageName: "_ZL4erfcf", scope: !137, file: !137, line: 56, type: !142, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!172 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !173, file: !137, line: 215)
!173 = !DISubprogram(name: "exp", linkageName: "_ZL3expf", scope: !137, file: !137, line: 62, type: !142, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!174 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !175, file: !137, line: 216)
!175 = !DISubprogram(name: "exp2", linkageName: "_ZL4exp2f", scope: !137, file: !137, line: 60, type: !142, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!176 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !177, file: !137, line: 217)
!177 = !DISubprogram(name: "expm1", linkageName: "_ZL5expm1f", scope: !137, file: !137, line: 64, type: !142, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!178 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !179, file: !137, line: 218)
!179 = !DISubprogram(name: "fabs", linkageName: "_ZL4fabsf", scope: !137, file: !137, line: 66, type: !142, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!180 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !181, file: !137, line: 219)
!181 = !DISubprogram(name: "fdim", linkageName: "_ZL4fdimff", scope: !137, file: !137, line: 68, type: !154, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!182 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !183, file: !137, line: 220)
!183 = !DISubprogram(name: "floor", linkageName: "_ZL5floorf", scope: !137, file: !137, line: 70, type: !142, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!184 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !185, file: !137, line: 221)
!185 = !DISubprogram(name: "fma", linkageName: "_ZL3fmafff", scope: !137, file: !137, line: 72, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!186 = !DISubroutineType(types: !187)
!187 = !{!8, !8, !8, !8}
!188 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !189, file: !137, line: 222)
!189 = !DISubprogram(name: "fmax", linkageName: "_ZL4fmaxff", scope: !137, file: !137, line: 74, type: !154, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!190 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !191, file: !137, line: 223)
!191 = !DISubprogram(name: "fmin", linkageName: "_ZL4fminff", scope: !137, file: !137, line: 76, type: !154, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!192 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !193, file: !137, line: 224)
!193 = !DISubprogram(name: "fmod", linkageName: "_ZL4fmodff", scope: !137, file: !137, line: 78, type: !154, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!194 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !195, file: !137, line: 225)
!195 = !DISubprogram(name: "fpclassify", linkageName: "_ZL10fpclassifyf", scope: !137, file: !137, line: 80, type: !196, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!196 = !DISubroutineType(types: !197)
!197 = !{!16, !8}
!198 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !199, file: !137, line: 226)
!199 = !DISubprogram(name: "frexp", linkageName: "_ZL5frexpfPi", scope: !137, file: !137, line: 82, type: !200, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!200 = !DISubroutineType(types: !201)
!201 = !{!8, !8, !202}
!202 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!203 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !204, file: !137, line: 227)
!204 = !DISubprogram(name: "hypot", linkageName: "_ZL5hypotff", scope: !137, file: !137, line: 84, type: !154, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!205 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !206, file: !137, line: 228)
!206 = !DISubprogram(name: "ilogb", linkageName: "_ZL5ilogbf", scope: !137, file: !137, line: 86, type: !196, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!207 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !208, file: !137, line: 229)
!208 = !DISubprogram(name: "isfinite", linkageName: "_ZL8isfinitef", scope: !137, file: !137, line: 91, type: !209, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!209 = !DISubroutineType(types: !210)
!210 = !{!211, !8}
!211 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!212 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !213, file: !137, line: 230)
!213 = !DISubprogram(name: "isgreater", linkageName: "_ZL9isgreaterff", scope: !137, file: !137, line: 95, type: !214, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!214 = !DISubroutineType(types: !215)
!215 = !{!211, !8, !8}
!216 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !217, file: !137, line: 231)
!217 = !DISubprogram(name: "isgreaterequal", linkageName: "_ZL14isgreaterequalff", scope: !137, file: !137, line: 94, type: !214, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!218 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !219, file: !137, line: 232)
!219 = !DISubprogram(name: "isinf", linkageName: "_ZL5isinff", scope: !137, file: !137, line: 100, type: !209, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!220 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !221, file: !137, line: 233)
!221 = !DISubprogram(name: "isless", linkageName: "_ZL6islessff", scope: !137, file: !137, line: 104, type: !214, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!222 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !223, file: !137, line: 234)
!223 = !DISubprogram(name: "islessequal", linkageName: "_ZL11islessequalff", scope: !137, file: !137, line: 103, type: !214, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!224 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !225, file: !137, line: 235)
!225 = !DISubprogram(name: "islessgreater", linkageName: "_ZL13islessgreaterff", scope: !137, file: !137, line: 106, type: !214, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!226 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !227, file: !137, line: 236)
!227 = !DISubprogram(name: "isnan", linkageName: "_ZL5isnanf", scope: !137, file: !137, line: 111, type: !209, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!228 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !229, file: !137, line: 237)
!229 = !DISubprogram(name: "isnormal", linkageName: "_ZL8isnormalf", scope: !137, file: !137, line: 113, type: !209, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!230 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !231, file: !137, line: 238)
!231 = !DISubprogram(name: "isunordered", linkageName: "_ZL11isunorderedff", scope: !137, file: !137, line: 115, type: !214, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!232 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !233, file: !137, line: 239)
!233 = !DISubprogram(name: "labs", linkageName: "_ZL4labsl", scope: !137, file: !137, line: 116, type: !234, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!234 = !DISubroutineType(types: !235)
!235 = !{!236, !236}
!236 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!237 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !238, file: !137, line: 240)
!238 = !DISubprogram(name: "ldexp", linkageName: "_ZL5ldexpfi", scope: !137, file: !137, line: 118, type: !239, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!239 = !DISubroutineType(types: !240)
!240 = !{!8, !8, !16}
!241 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !242, file: !137, line: 241)
!242 = !DISubprogram(name: "lgamma", linkageName: "_ZL6lgammaf", scope: !137, file: !137, line: 120, type: !142, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!243 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !244, file: !137, line: 242)
!244 = !DISubprogram(name: "llabs", linkageName: "_ZL5llabsx", scope: !137, file: !137, line: 121, type: !245, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!245 = !DISubroutineType(types: !246)
!246 = !{!247, !247}
!247 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!248 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !249, file: !137, line: 243)
!249 = !DISubprogram(name: "llrint", linkageName: "_ZL6llrintf", scope: !137, file: !137, line: 123, type: !250, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!250 = !DISubroutineType(types: !251)
!251 = !{!247, !8}
!252 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !253, file: !137, line: 244)
!253 = !DISubprogram(name: "log", linkageName: "_ZL3logf", scope: !137, file: !137, line: 133, type: !142, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!254 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !255, file: !137, line: 245)
!255 = !DISubprogram(name: "log10", linkageName: "_ZL5log10f", scope: !137, file: !137, line: 125, type: !142, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!256 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !257, file: !137, line: 246)
!257 = !DISubprogram(name: "log1p", linkageName: "_ZL5log1pf", scope: !137, file: !137, line: 127, type: !142, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!258 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !259, file: !137, line: 247)
!259 = !DISubprogram(name: "log2", linkageName: "_ZL4log2f", scope: !137, file: !137, line: 129, type: !142, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!260 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !261, file: !137, line: 248)
!261 = !DISubprogram(name: "logb", linkageName: "_ZL4logbf", scope: !137, file: !137, line: 131, type: !142, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!262 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !263, file: !137, line: 249)
!263 = !DISubprogram(name: "lrint", linkageName: "_ZL5lrintf", scope: !137, file: !137, line: 135, type: !264, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!264 = !DISubroutineType(types: !265)
!265 = !{!236, !8}
!266 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !267, file: !137, line: 250)
!267 = !DISubprogram(name: "lround", linkageName: "_ZL6lroundf", scope: !137, file: !137, line: 137, type: !264, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!268 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !269, file: !137, line: 251)
!269 = !DISubprogram(name: "llround", linkageName: "_ZL7llroundf", scope: !137, file: !137, line: 138, type: !250, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!270 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !271, file: !137, line: 252)
!271 = !DISubprogram(name: "modf", linkageName: "_ZL4modffPf", scope: !137, file: !137, line: 140, type: !272, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!272 = !DISubroutineType(types: !273)
!273 = !{!8, !8, !7}
!274 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !275, file: !137, line: 253)
!275 = !DISubprogram(name: "nan", linkageName: "_ZL3nanPKc", scope: !137, file: !137, line: 141, type: !276, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!276 = !DISubroutineType(types: !277)
!277 = !{!278, !10}
!278 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!279 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !280, file: !137, line: 254)
!280 = !DISubprogram(name: "nanf", linkageName: "_ZL4nanfPKc", scope: !137, file: !137, line: 142, type: !281, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!281 = !DISubroutineType(types: !282)
!282 = !{!8, !10}
!283 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !284, file: !137, line: 255)
!284 = !DISubprogram(name: "nearbyint", linkageName: "_ZL9nearbyintf", scope: !137, file: !137, line: 144, type: !142, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!285 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !286, file: !137, line: 256)
!286 = !DISubprogram(name: "nextafter", linkageName: "_ZL9nextafterff", scope: !137, file: !137, line: 146, type: !154, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!287 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !288, file: !137, line: 257)
!288 = !DISubprogram(name: "pow", linkageName: "_ZL3powfi", scope: !137, file: !137, line: 150, type: !239, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!289 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !290, file: !137, line: 258)
!290 = !DISubprogram(name: "remainder", linkageName: "_ZL9remainderff", scope: !137, file: !137, line: 152, type: !154, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!291 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !292, file: !137, line: 259)
!292 = !DISubprogram(name: "remquo", linkageName: "_ZL6remquoffPi", scope: !137, file: !137, line: 154, type: !293, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!293 = !DISubroutineType(types: !294)
!294 = !{!8, !8, !8, !202}
!295 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !296, file: !137, line: 260)
!296 = !DISubprogram(name: "rint", linkageName: "_ZL4rintf", scope: !137, file: !137, line: 156, type: !142, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!297 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !298, file: !137, line: 261)
!298 = !DISubprogram(name: "round", linkageName: "_ZL5roundf", scope: !137, file: !137, line: 158, type: !142, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!299 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !300, file: !137, line: 262)
!300 = !DISubprogram(name: "scalbln", linkageName: "_ZL7scalblnfl", scope: !137, file: !137, line: 160, type: !301, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!301 = !DISubroutineType(types: !302)
!302 = !{!8, !8, !236}
!303 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !304, file: !137, line: 263)
!304 = !DISubprogram(name: "scalbn", linkageName: "_ZL6scalbnfi", scope: !137, file: !137, line: 162, type: !239, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!305 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !306, file: !137, line: 264)
!306 = !DISubprogram(name: "signbit", linkageName: "_ZL7signbitf", scope: !137, file: !137, line: 167, type: !209, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!307 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !308, file: !137, line: 265)
!308 = !DISubprogram(name: "sin", linkageName: "_ZL3sinf", scope: !137, file: !137, line: 169, type: !142, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!309 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !310, file: !137, line: 266)
!310 = !DISubprogram(name: "sinh", linkageName: "_ZL4sinhf", scope: !137, file: !137, line: 171, type: !142, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!311 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !312, file: !137, line: 267)
!312 = !DISubprogram(name: "sqrt", linkageName: "_ZL4sqrtf", scope: !137, file: !137, line: 173, type: !142, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!313 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !314, file: !137, line: 268)
!314 = !DISubprogram(name: "tan", linkageName: "_ZL3tanf", scope: !137, file: !137, line: 175, type: !142, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!315 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !316, file: !137, line: 269)
!316 = !DISubprogram(name: "tanh", linkageName: "_ZL4tanhf", scope: !137, file: !137, line: 177, type: !142, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!317 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !318, file: !137, line: 270)
!318 = !DISubprogram(name: "tgamma", linkageName: "_ZL6tgammaf", scope: !137, file: !137, line: 179, type: !142, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!319 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !320, file: !137, line: 271)
!320 = !DISubprogram(name: "trunc", linkageName: "_ZL5truncf", scope: !137, file: !137, line: 181, type: !142, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!321 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !322, file: !324, line: 52)
!322 = !DISubprogram(name: "abs", scope: !323, file: !323, line: 980, type: !138, flags: DIFlagPrototyped, spFlags: 0)
!323 = !DIFile(filename: "/usr/include/stdlib.h", directory: "")
!324 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/12/../../../../include/c++/12/bits/std_abs.h", directory: "")
!325 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !326, file: !330, line: 83)
!326 = !DISubprogram(name: "acos", scope: !327, file: !327, line: 53, type: !328, flags: DIFlagPrototyped, spFlags: 0)
!327 = !DIFile(filename: "/usr/include/bits/mathcalls.h", directory: "")
!328 = !DISubroutineType(types: !329)
!329 = !{!278, !278}
!330 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/12/../../../../include/c++/12/cmath", directory: "")
!331 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !332, file: !330, line: 102)
!332 = !DISubprogram(name: "asin", scope: !327, file: !327, line: 55, type: !328, flags: DIFlagPrototyped, spFlags: 0)
!333 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !334, file: !330, line: 121)
!334 = !DISubprogram(name: "atan", scope: !327, file: !327, line: 57, type: !328, flags: DIFlagPrototyped, spFlags: 0)
!335 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !336, file: !330, line: 140)
!336 = !DISubprogram(name: "atan2", scope: !327, file: !327, line: 59, type: !337, flags: DIFlagPrototyped, spFlags: 0)
!337 = !DISubroutineType(types: !338)
!338 = !{!278, !278, !278}
!339 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !340, file: !330, line: 161)
!340 = !DISubprogram(name: "ceil", scope: !327, file: !327, line: 159, type: !328, flags: DIFlagPrototyped, spFlags: 0)
!341 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !342, file: !330, line: 180)
!342 = !DISubprogram(name: "cos", scope: !327, file: !327, line: 62, type: !328, flags: DIFlagPrototyped, spFlags: 0)
!343 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !344, file: !330, line: 199)
!344 = !DISubprogram(name: "cosh", scope: !327, file: !327, line: 71, type: !328, flags: DIFlagPrototyped, spFlags: 0)
!345 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !346, file: !330, line: 218)
!346 = !DISubprogram(name: "exp", scope: !327, file: !327, line: 95, type: !328, flags: DIFlagPrototyped, spFlags: 0)
!347 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !348, file: !330, line: 237)
!348 = !DISubprogram(name: "fabs", scope: !327, file: !327, line: 162, type: !328, flags: DIFlagPrototyped, spFlags: 0)
!349 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !350, file: !330, line: 256)
!350 = !DISubprogram(name: "floor", scope: !327, file: !327, line: 165, type: !328, flags: DIFlagPrototyped, spFlags: 0)
!351 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !352, file: !330, line: 275)
!352 = !DISubprogram(name: "fmod", scope: !327, file: !327, line: 168, type: !337, flags: DIFlagPrototyped, spFlags: 0)
!353 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !354, file: !330, line: 296)
!354 = !DISubprogram(name: "frexp", scope: !327, file: !327, line: 98, type: !355, flags: DIFlagPrototyped, spFlags: 0)
!355 = !DISubroutineType(types: !356)
!356 = !{!278, !278, !202}
!357 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !358, file: !330, line: 315)
!358 = !DISubprogram(name: "ldexp", scope: !327, file: !327, line: 101, type: !359, flags: DIFlagPrototyped, spFlags: 0)
!359 = !DISubroutineType(types: !360)
!360 = !{!278, !278, !16}
!361 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !362, file: !330, line: 334)
!362 = !DISubprogram(name: "log", scope: !327, file: !327, line: 104, type: !328, flags: DIFlagPrototyped, spFlags: 0)
!363 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !364, file: !330, line: 353)
!364 = !DISubprogram(name: "log10", scope: !327, file: !327, line: 107, type: !328, flags: DIFlagPrototyped, spFlags: 0)
!365 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !366, file: !330, line: 372)
!366 = !DISubprogram(name: "modf", scope: !327, file: !327, line: 110, type: !367, flags: DIFlagPrototyped, spFlags: 0)
!367 = !DISubroutineType(types: !368)
!368 = !{!278, !278, !369}
!369 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !278, size: 64)
!370 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !371, file: !330, line: 384)
!371 = !DISubprogram(name: "pow", scope: !327, file: !327, line: 140, type: !337, flags: DIFlagPrototyped, spFlags: 0)
!372 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !373, file: !330, line: 421)
!373 = !DISubprogram(name: "sin", scope: !327, file: !327, line: 64, type: !328, flags: DIFlagPrototyped, spFlags: 0)
!374 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !375, file: !330, line: 440)
!375 = !DISubprogram(name: "sinh", scope: !327, file: !327, line: 73, type: !328, flags: DIFlagPrototyped, spFlags: 0)
!376 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !377, file: !330, line: 459)
!377 = !DISubprogram(name: "sqrt", scope: !327, file: !327, line: 143, type: !328, flags: DIFlagPrototyped, spFlags: 0)
!378 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !379, file: !330, line: 478)
!379 = !DISubprogram(name: "tan", scope: !327, file: !327, line: 66, type: !328, flags: DIFlagPrototyped, spFlags: 0)
!380 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !381, file: !330, line: 497)
!381 = !DISubprogram(name: "tanh", scope: !327, file: !327, line: 75, type: !328, flags: DIFlagPrototyped, spFlags: 0)
!382 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !383, file: !330, line: 1065)
!383 = !DIDerivedType(tag: DW_TAG_typedef, name: "double_t", file: !384, line: 164, baseType: !278)
!384 = !DIFile(filename: "/usr/include/math.h", directory: "")
!385 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !386, file: !330, line: 1066)
!386 = !DIDerivedType(tag: DW_TAG_typedef, name: "float_t", file: !384, line: 163, baseType: !8)
!387 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !388, file: !330, line: 1069)
!388 = !DISubprogram(name: "acosh", scope: !327, file: !327, line: 85, type: !328, flags: DIFlagPrototyped, spFlags: 0)
!389 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !390, file: !330, line: 1070)
!390 = !DISubprogram(name: "acoshf", scope: !327, file: !327, line: 85, type: !142, flags: DIFlagPrototyped, spFlags: 0)
!391 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !392, file: !330, line: 1071)
!392 = !DISubprogram(name: "acoshl", scope: !327, file: !327, line: 85, type: !393, flags: DIFlagPrototyped, spFlags: 0)
!393 = !DISubroutineType(types: !394)
!394 = !{!395, !395}
!395 = !DIBasicType(name: "long double", size: 64, encoding: DW_ATE_float)
!396 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !397, file: !330, line: 1073)
!397 = !DISubprogram(name: "asinh", scope: !327, file: !327, line: 87, type: !328, flags: DIFlagPrototyped, spFlags: 0)
!398 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !399, file: !330, line: 1074)
!399 = !DISubprogram(name: "asinhf", scope: !327, file: !327, line: 87, type: !142, flags: DIFlagPrototyped, spFlags: 0)
!400 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !401, file: !330, line: 1075)
!401 = !DISubprogram(name: "asinhl", scope: !327, file: !327, line: 87, type: !393, flags: DIFlagPrototyped, spFlags: 0)
!402 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !403, file: !330, line: 1077)
!403 = !DISubprogram(name: "atanh", scope: !327, file: !327, line: 89, type: !328, flags: DIFlagPrototyped, spFlags: 0)
!404 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !405, file: !330, line: 1078)
!405 = !DISubprogram(name: "atanhf", scope: !327, file: !327, line: 89, type: !142, flags: DIFlagPrototyped, spFlags: 0)
!406 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !407, file: !330, line: 1079)
!407 = !DISubprogram(name: "atanhl", scope: !327, file: !327, line: 89, type: !393, flags: DIFlagPrototyped, spFlags: 0)
!408 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !409, file: !330, line: 1081)
!409 = !DISubprogram(name: "cbrt", scope: !327, file: !327, line: 152, type: !328, flags: DIFlagPrototyped, spFlags: 0)
!410 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !411, file: !330, line: 1082)
!411 = !DISubprogram(name: "cbrtf", scope: !327, file: !327, line: 152, type: !142, flags: DIFlagPrototyped, spFlags: 0)
!412 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !413, file: !330, line: 1083)
!413 = !DISubprogram(name: "cbrtl", scope: !327, file: !327, line: 152, type: !393, flags: DIFlagPrototyped, spFlags: 0)
!414 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !415, file: !330, line: 1085)
!415 = !DISubprogram(name: "copysign", scope: !327, file: !327, line: 198, type: !337, flags: DIFlagPrototyped, spFlags: 0)
!416 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !417, file: !330, line: 1086)
!417 = !DISubprogram(name: "copysignf", scope: !327, file: !327, line: 198, type: !154, flags: DIFlagPrototyped, spFlags: 0)
!418 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !419, file: !330, line: 1087)
!419 = !DISubprogram(name: "copysignl", scope: !327, file: !327, line: 198, type: !420, flags: DIFlagPrototyped, spFlags: 0)
!420 = !DISubroutineType(types: !421)
!421 = !{!395, !395, !395}
!422 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !423, file: !330, line: 1089)
!423 = !DISubprogram(name: "erf", scope: !327, file: !327, line: 231, type: !328, flags: DIFlagPrototyped, spFlags: 0)
!424 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !425, file: !330, line: 1090)
!425 = !DISubprogram(name: "erff", scope: !327, file: !327, line: 231, type: !142, flags: DIFlagPrototyped, spFlags: 0)
!426 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !427, file: !330, line: 1091)
!427 = !DISubprogram(name: "erfl", scope: !327, file: !327, line: 231, type: !393, flags: DIFlagPrototyped, spFlags: 0)
!428 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !429, file: !330, line: 1093)
!429 = !DISubprogram(name: "erfc", scope: !327, file: !327, line: 232, type: !328, flags: DIFlagPrototyped, spFlags: 0)
!430 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !431, file: !330, line: 1094)
!431 = !DISubprogram(name: "erfcf", scope: !327, file: !327, line: 232, type: !142, flags: DIFlagPrototyped, spFlags: 0)
!432 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !433, file: !330, line: 1095)
!433 = !DISubprogram(name: "erfcl", scope: !327, file: !327, line: 232, type: !393, flags: DIFlagPrototyped, spFlags: 0)
!434 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !435, file: !330, line: 1097)
!435 = !DISubprogram(name: "exp2", scope: !327, file: !327, line: 130, type: !328, flags: DIFlagPrototyped, spFlags: 0)
!436 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !437, file: !330, line: 1098)
!437 = !DISubprogram(name: "exp2f", scope: !327, file: !327, line: 130, type: !142, flags: DIFlagPrototyped, spFlags: 0)
!438 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !439, file: !330, line: 1099)
!439 = !DISubprogram(name: "exp2l", scope: !327, file: !327, line: 130, type: !393, flags: DIFlagPrototyped, spFlags: 0)
!440 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !441, file: !330, line: 1101)
!441 = !DISubprogram(name: "expm1", scope: !327, file: !327, line: 119, type: !328, flags: DIFlagPrototyped, spFlags: 0)
!442 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !443, file: !330, line: 1102)
!443 = !DISubprogram(name: "expm1f", scope: !327, file: !327, line: 119, type: !142, flags: DIFlagPrototyped, spFlags: 0)
!444 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !445, file: !330, line: 1103)
!445 = !DISubprogram(name: "expm1l", scope: !327, file: !327, line: 119, type: !393, flags: DIFlagPrototyped, spFlags: 0)
!446 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !447, file: !330, line: 1105)
!447 = !DISubprogram(name: "fdim", scope: !327, file: !327, line: 329, type: !337, flags: DIFlagPrototyped, spFlags: 0)
!448 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !449, file: !330, line: 1106)
!449 = !DISubprogram(name: "fdimf", scope: !327, file: !327, line: 329, type: !154, flags: DIFlagPrototyped, spFlags: 0)
!450 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !451, file: !330, line: 1107)
!451 = !DISubprogram(name: "fdiml", scope: !327, file: !327, line: 329, type: !420, flags: DIFlagPrototyped, spFlags: 0)
!452 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !453, file: !330, line: 1109)
!453 = !DISubprogram(name: "fma", scope: !327, file: !327, line: 340, type: !454, flags: DIFlagPrototyped, spFlags: 0)
!454 = !DISubroutineType(types: !455)
!455 = !{!278, !278, !278, !278}
!456 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !457, file: !330, line: 1110)
!457 = !DISubprogram(name: "fmaf", scope: !327, file: !327, line: 340, type: !186, flags: DIFlagPrototyped, spFlags: 0)
!458 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !459, file: !330, line: 1111)
!459 = !DISubprogram(name: "fmal", scope: !327, file: !327, line: 340, type: !460, flags: DIFlagPrototyped, spFlags: 0)
!460 = !DISubroutineType(types: !461)
!461 = !{!395, !395, !395, !395}
!462 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !463, file: !330, line: 1113)
!463 = !DISubprogram(name: "fmax", scope: !327, file: !327, line: 333, type: !337, flags: DIFlagPrototyped, spFlags: 0)
!464 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !465, file: !330, line: 1114)
!465 = !DISubprogram(name: "fmaxf", scope: !327, file: !327, line: 333, type: !154, flags: DIFlagPrototyped, spFlags: 0)
!466 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !467, file: !330, line: 1115)
!467 = !DISubprogram(name: "fmaxl", scope: !327, file: !327, line: 333, type: !420, flags: DIFlagPrototyped, spFlags: 0)
!468 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !469, file: !330, line: 1117)
!469 = !DISubprogram(name: "fmin", scope: !327, file: !327, line: 336, type: !337, flags: DIFlagPrototyped, spFlags: 0)
!470 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !471, file: !330, line: 1118)
!471 = !DISubprogram(name: "fminf", scope: !327, file: !327, line: 336, type: !154, flags: DIFlagPrototyped, spFlags: 0)
!472 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !473, file: !330, line: 1119)
!473 = !DISubprogram(name: "fminl", scope: !327, file: !327, line: 336, type: !420, flags: DIFlagPrototyped, spFlags: 0)
!474 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !475, file: !330, line: 1121)
!475 = !DISubprogram(name: "hypot", scope: !327, file: !327, line: 147, type: !337, flags: DIFlagPrototyped, spFlags: 0)
!476 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !477, file: !330, line: 1122)
!477 = !DISubprogram(name: "hypotf", scope: !327, file: !327, line: 147, type: !154, flags: DIFlagPrototyped, spFlags: 0)
!478 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !479, file: !330, line: 1123)
!479 = !DISubprogram(name: "hypotl", scope: !327, file: !327, line: 147, type: !420, flags: DIFlagPrototyped, spFlags: 0)
!480 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !481, file: !330, line: 1125)
!481 = !DISubprogram(name: "ilogb", scope: !327, file: !327, line: 283, type: !482, flags: DIFlagPrototyped, spFlags: 0)
!482 = !DISubroutineType(types: !483)
!483 = !{!16, !278}
!484 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !485, file: !330, line: 1126)
!485 = !DISubprogram(name: "ilogbf", scope: !327, file: !327, line: 283, type: !196, flags: DIFlagPrototyped, spFlags: 0)
!486 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !487, file: !330, line: 1127)
!487 = !DISubprogram(name: "ilogbl", scope: !327, file: !327, line: 283, type: !488, flags: DIFlagPrototyped, spFlags: 0)
!488 = !DISubroutineType(types: !489)
!489 = !{!16, !395}
!490 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !491, file: !330, line: 1129)
!491 = !DISubprogram(name: "lgamma", scope: !327, file: !327, line: 233, type: !328, flags: DIFlagPrototyped, spFlags: 0)
!492 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !493, file: !330, line: 1130)
!493 = !DISubprogram(name: "lgammaf", scope: !327, file: !327, line: 233, type: !142, flags: DIFlagPrototyped, spFlags: 0)
!494 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !495, file: !330, line: 1131)
!495 = !DISubprogram(name: "lgammal", scope: !327, file: !327, line: 233, type: !393, flags: DIFlagPrototyped, spFlags: 0)
!496 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !497, file: !330, line: 1134)
!497 = !DISubprogram(name: "llrint", scope: !327, file: !327, line: 319, type: !498, flags: DIFlagPrototyped, spFlags: 0)
!498 = !DISubroutineType(types: !499)
!499 = !{!247, !278}
!500 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !501, file: !330, line: 1135)
!501 = !DISubprogram(name: "llrintf", scope: !327, file: !327, line: 319, type: !250, flags: DIFlagPrototyped, spFlags: 0)
!502 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !503, file: !330, line: 1136)
!503 = !DISubprogram(name: "llrintl", scope: !327, file: !327, line: 319, type: !504, flags: DIFlagPrototyped, spFlags: 0)
!504 = !DISubroutineType(types: !505)
!505 = !{!247, !395}
!506 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !507, file: !330, line: 1138)
!507 = !DISubprogram(name: "llround", scope: !327, file: !327, line: 325, type: !498, flags: DIFlagPrototyped, spFlags: 0)
!508 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !509, file: !330, line: 1139)
!509 = !DISubprogram(name: "llroundf", scope: !327, file: !327, line: 325, type: !250, flags: DIFlagPrototyped, spFlags: 0)
!510 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !511, file: !330, line: 1140)
!511 = !DISubprogram(name: "llroundl", scope: !327, file: !327, line: 325, type: !504, flags: DIFlagPrototyped, spFlags: 0)
!512 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !513, file: !330, line: 1143)
!513 = !DISubprogram(name: "log1p", scope: !327, file: !327, line: 122, type: !328, flags: DIFlagPrototyped, spFlags: 0)
!514 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !515, file: !330, line: 1144)
!515 = !DISubprogram(name: "log1pf", scope: !327, file: !327, line: 122, type: !142, flags: DIFlagPrototyped, spFlags: 0)
!516 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !517, file: !330, line: 1145)
!517 = !DISubprogram(name: "log1pl", scope: !327, file: !327, line: 122, type: !393, flags: DIFlagPrototyped, spFlags: 0)
!518 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !519, file: !330, line: 1147)
!519 = !DISubprogram(name: "log2", scope: !327, file: !327, line: 133, type: !328, flags: DIFlagPrototyped, spFlags: 0)
!520 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !521, file: !330, line: 1148)
!521 = !DISubprogram(name: "log2f", scope: !327, file: !327, line: 133, type: !142, flags: DIFlagPrototyped, spFlags: 0)
!522 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !523, file: !330, line: 1149)
!523 = !DISubprogram(name: "log2l", scope: !327, file: !327, line: 133, type: !393, flags: DIFlagPrototyped, spFlags: 0)
!524 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !525, file: !330, line: 1151)
!525 = !DISubprogram(name: "logb", scope: !327, file: !327, line: 125, type: !328, flags: DIFlagPrototyped, spFlags: 0)
!526 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !527, file: !330, line: 1152)
!527 = !DISubprogram(name: "logbf", scope: !327, file: !327, line: 125, type: !142, flags: DIFlagPrototyped, spFlags: 0)
!528 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !529, file: !330, line: 1153)
!529 = !DISubprogram(name: "logbl", scope: !327, file: !327, line: 125, type: !393, flags: DIFlagPrototyped, spFlags: 0)
!530 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !531, file: !330, line: 1155)
!531 = !DISubprogram(name: "lrint", scope: !327, file: !327, line: 317, type: !532, flags: DIFlagPrototyped, spFlags: 0)
!532 = !DISubroutineType(types: !533)
!533 = !{!236, !278}
!534 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !535, file: !330, line: 1156)
!535 = !DISubprogram(name: "lrintf", scope: !327, file: !327, line: 317, type: !264, flags: DIFlagPrototyped, spFlags: 0)
!536 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !537, file: !330, line: 1157)
!537 = !DISubprogram(name: "lrintl", scope: !327, file: !327, line: 317, type: !538, flags: DIFlagPrototyped, spFlags: 0)
!538 = !DISubroutineType(types: !539)
!539 = !{!236, !395}
!540 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !541, file: !330, line: 1159)
!541 = !DISubprogram(name: "lround", scope: !327, file: !327, line: 323, type: !532, flags: DIFlagPrototyped, spFlags: 0)
!542 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !543, file: !330, line: 1160)
!543 = !DISubprogram(name: "lroundf", scope: !327, file: !327, line: 323, type: !264, flags: DIFlagPrototyped, spFlags: 0)
!544 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !545, file: !330, line: 1161)
!545 = !DISubprogram(name: "lroundl", scope: !327, file: !327, line: 323, type: !538, flags: DIFlagPrototyped, spFlags: 0)
!546 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !547, file: !330, line: 1163)
!547 = !DISubprogram(name: "nan", scope: !327, file: !327, line: 203, type: !276, flags: DIFlagPrototyped, spFlags: 0)
!548 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !549, file: !330, line: 1164)
!549 = !DISubprogram(name: "nanf", scope: !327, file: !327, line: 203, type: !281, flags: DIFlagPrototyped, spFlags: 0)
!550 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !551, file: !330, line: 1165)
!551 = !DISubprogram(name: "nanl", scope: !327, file: !327, line: 203, type: !552, flags: DIFlagPrototyped, spFlags: 0)
!552 = !DISubroutineType(types: !553)
!553 = !{!395, !10}
!554 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !555, file: !330, line: 1167)
!555 = !DISubprogram(name: "nearbyint", scope: !327, file: !327, line: 297, type: !328, flags: DIFlagPrototyped, spFlags: 0)
!556 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !557, file: !330, line: 1168)
!557 = !DISubprogram(name: "nearbyintf", scope: !327, file: !327, line: 297, type: !142, flags: DIFlagPrototyped, spFlags: 0)
!558 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !559, file: !330, line: 1169)
!559 = !DISubprogram(name: "nearbyintl", scope: !327, file: !327, line: 297, type: !393, flags: DIFlagPrototyped, spFlags: 0)
!560 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !561, file: !330, line: 1171)
!561 = !DISubprogram(name: "nextafter", scope: !327, file: !327, line: 262, type: !337, flags: DIFlagPrototyped, spFlags: 0)
!562 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !563, file: !330, line: 1172)
!563 = !DISubprogram(name: "nextafterf", scope: !327, file: !327, line: 262, type: !154, flags: DIFlagPrototyped, spFlags: 0)
!564 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !565, file: !330, line: 1173)
!565 = !DISubprogram(name: "nextafterl", scope: !327, file: !327, line: 262, type: !420, flags: DIFlagPrototyped, spFlags: 0)
!566 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !567, file: !330, line: 1175)
!567 = !DISubprogram(name: "nexttoward", scope: !327, file: !327, line: 264, type: !568, flags: DIFlagPrototyped, spFlags: 0)
!568 = !DISubroutineType(types: !569)
!569 = !{!278, !278, !395}
!570 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !571, file: !330, line: 1176)
!571 = !DISubprogram(name: "nexttowardf", scope: !327, file: !327, line: 264, type: !572, flags: DIFlagPrototyped, spFlags: 0)
!572 = !DISubroutineType(types: !573)
!573 = !{!8, !8, !395}
!574 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !575, file: !330, line: 1177)
!575 = !DISubprogram(name: "nexttowardl", scope: !327, file: !327, line: 264, type: !420, flags: DIFlagPrototyped, spFlags: 0)
!576 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !577, file: !330, line: 1179)
!577 = !DISubprogram(name: "remainder", scope: !327, file: !327, line: 275, type: !337, flags: DIFlagPrototyped, spFlags: 0)
!578 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !579, file: !330, line: 1180)
!579 = !DISubprogram(name: "remainderf", scope: !327, file: !327, line: 275, type: !154, flags: DIFlagPrototyped, spFlags: 0)
!580 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !581, file: !330, line: 1181)
!581 = !DISubprogram(name: "remainderl", scope: !327, file: !327, line: 275, type: !420, flags: DIFlagPrototyped, spFlags: 0)
!582 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !583, file: !330, line: 1183)
!583 = !DISubprogram(name: "remquo", scope: !327, file: !327, line: 310, type: !584, flags: DIFlagPrototyped, spFlags: 0)
!584 = !DISubroutineType(types: !585)
!585 = !{!278, !278, !278, !202}
!586 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !587, file: !330, line: 1184)
!587 = !DISubprogram(name: "remquof", scope: !327, file: !327, line: 310, type: !293, flags: DIFlagPrototyped, spFlags: 0)
!588 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !589, file: !330, line: 1185)
!589 = !DISubprogram(name: "remquol", scope: !327, file: !327, line: 310, type: !590, flags: DIFlagPrototyped, spFlags: 0)
!590 = !DISubroutineType(types: !591)
!591 = !{!395, !395, !395, !202}
!592 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !593, file: !330, line: 1187)
!593 = !DISubprogram(name: "rint", scope: !327, file: !327, line: 259, type: !328, flags: DIFlagPrototyped, spFlags: 0)
!594 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !595, file: !330, line: 1188)
!595 = !DISubprogram(name: "rintf", scope: !327, file: !327, line: 259, type: !142, flags: DIFlagPrototyped, spFlags: 0)
!596 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !597, file: !330, line: 1189)
!597 = !DISubprogram(name: "rintl", scope: !327, file: !327, line: 259, type: !393, flags: DIFlagPrototyped, spFlags: 0)
!598 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !599, file: !330, line: 1191)
!599 = !DISubprogram(name: "round", scope: !327, file: !327, line: 301, type: !328, flags: DIFlagPrototyped, spFlags: 0)
!600 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !601, file: !330, line: 1192)
!601 = !DISubprogram(name: "roundf", scope: !327, file: !327, line: 301, type: !142, flags: DIFlagPrototyped, spFlags: 0)
!602 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !603, file: !330, line: 1193)
!603 = !DISubprogram(name: "roundl", scope: !327, file: !327, line: 301, type: !393, flags: DIFlagPrototyped, spFlags: 0)
!604 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !605, file: !330, line: 1195)
!605 = !DISubprogram(name: "scalbln", scope: !327, file: !327, line: 293, type: !606, flags: DIFlagPrototyped, spFlags: 0)
!606 = !DISubroutineType(types: !607)
!607 = !{!278, !278, !236}
!608 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !609, file: !330, line: 1196)
!609 = !DISubprogram(name: "scalblnf", scope: !327, file: !327, line: 293, type: !301, flags: DIFlagPrototyped, spFlags: 0)
!610 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !611, file: !330, line: 1197)
!611 = !DISubprogram(name: "scalblnl", scope: !327, file: !327, line: 293, type: !612, flags: DIFlagPrototyped, spFlags: 0)
!612 = !DISubroutineType(types: !613)
!613 = !{!395, !395, !236}
!614 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !615, file: !330, line: 1199)
!615 = !DISubprogram(name: "scalbn", scope: !327, file: !327, line: 279, type: !359, flags: DIFlagPrototyped, spFlags: 0)
!616 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !617, file: !330, line: 1200)
!617 = !DISubprogram(name: "scalbnf", scope: !327, file: !327, line: 279, type: !239, flags: DIFlagPrototyped, spFlags: 0)
!618 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !619, file: !330, line: 1201)
!619 = !DISubprogram(name: "scalbnl", scope: !327, file: !327, line: 279, type: !620, flags: DIFlagPrototyped, spFlags: 0)
!620 = !DISubroutineType(types: !621)
!621 = !{!395, !395, !16}
!622 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !623, file: !330, line: 1203)
!623 = !DISubprogram(name: "tgamma", scope: !327, file: !327, line: 238, type: !328, flags: DIFlagPrototyped, spFlags: 0)
!624 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !625, file: !330, line: 1204)
!625 = !DISubprogram(name: "tgammaf", scope: !327, file: !327, line: 238, type: !142, flags: DIFlagPrototyped, spFlags: 0)
!626 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !627, file: !330, line: 1205)
!627 = !DISubprogram(name: "tgammal", scope: !327, file: !327, line: 238, type: !393, flags: DIFlagPrototyped, spFlags: 0)
!628 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !629, file: !330, line: 1207)
!629 = !DISubprogram(name: "trunc", scope: !327, file: !327, line: 305, type: !328, flags: DIFlagPrototyped, spFlags: 0)
!630 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !631, file: !330, line: 1208)
!631 = !DISubprogram(name: "truncf", scope: !327, file: !327, line: 305, type: !142, flags: DIFlagPrototyped, spFlags: 0)
!632 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !633, file: !330, line: 1209)
!633 = !DISubprogram(name: "truncl", scope: !327, file: !327, line: 305, type: !393, flags: DIFlagPrototyped, spFlags: 0)
!634 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !635, entity: !636, file: !637, line: 58)
!635 = !DINamespace(name: "__gnu_debug", scope: null)
!636 = !DINamespace(name: "__debug", scope: !135)
!637 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/12/../../../../include/c++/12/debug/debug.h", directory: "")
!638 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !639, file: !641, line: 127)
!639 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !323, line: 63, baseType: !640)
!640 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !323, line: 59, size: 64, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!641 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/12/../../../../include/c++/12/cstdlib", directory: "")
!642 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !643, file: !641, line: 128)
!643 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !323, line: 71, baseType: !644)
!644 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !323, line: 67, size: 128, flags: DIFlagTypePassByValue, elements: !645, identifier: "_ZTS6ldiv_t")
!645 = !{!646, !647}
!646 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !644, file: !323, line: 69, baseType: !236, size: 64)
!647 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !644, file: !323, line: 70, baseType: !236, size: 64, offset: 64)
!648 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !649, file: !641, line: 130)
!649 = !DISubprogram(name: "abort", scope: !323, file: !323, line: 730, type: !650, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!650 = !DISubroutineType(types: !651)
!651 = !{null}
!652 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !653, file: !641, line: 132)
!653 = !DISubprogram(name: "aligned_alloc", scope: !323, file: !323, line: 724, type: !654, flags: DIFlagPrototyped, spFlags: 0)
!654 = !DISubroutineType(types: !655)
!655 = !{!656, !657, !657}
!656 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!657 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !658, line: 46, baseType: !659)
!658 = !DIFile(filename: "/soft/compilers/llvm/release-17.0.6/lib/clang/17/include/stddef.h", directory: "")
!659 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!660 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !661, file: !641, line: 134)
!661 = !DISubprogram(name: "atexit", scope: !323, file: !323, line: 734, type: !662, flags: DIFlagPrototyped, spFlags: 0)
!662 = !DISubroutineType(types: !663)
!663 = !{!16, !664}
!664 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !650, size: 64)
!665 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !666, file: !641, line: 137)
!666 = !DISubprogram(name: "at_quick_exit", scope: !323, file: !323, line: 739, type: !662, flags: DIFlagPrototyped, spFlags: 0)
!667 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !668, file: !641, line: 140)
!668 = !DISubprogram(name: "atof", scope: !323, file: !323, line: 102, type: !276, flags: DIFlagPrototyped, spFlags: 0)
!669 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !670, file: !641, line: 141)
!670 = !DISubprogram(name: "atoi", scope: !323, file: !323, line: 105, type: !671, flags: DIFlagPrototyped, spFlags: 0)
!671 = !DISubroutineType(types: !672)
!672 = !{!16, !10}
!673 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !674, file: !641, line: 142)
!674 = !DISubprogram(name: "atol", scope: !323, file: !323, line: 108, type: !675, flags: DIFlagPrototyped, spFlags: 0)
!675 = !DISubroutineType(types: !676)
!676 = !{!236, !10}
!677 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !678, file: !641, line: 143)
!678 = !DISubprogram(name: "bsearch", scope: !323, file: !323, line: 960, type: !679, flags: DIFlagPrototyped, spFlags: 0)
!679 = !DISubroutineType(types: !680)
!680 = !{!656, !681, !681, !657, !657, !683}
!681 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !682, size: 64)
!682 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!683 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !323, line: 948, baseType: !684)
!684 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !685, size: 64)
!685 = !DISubroutineType(types: !686)
!686 = !{!16, !681, !681}
!687 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !688, file: !641, line: 144)
!688 = !DISubprogram(name: "calloc", scope: !323, file: !323, line: 675, type: !654, flags: DIFlagPrototyped, spFlags: 0)
!689 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !690, file: !641, line: 145)
!690 = !DISubprogram(name: "div", scope: !323, file: !323, line: 992, type: !691, flags: DIFlagPrototyped, spFlags: 0)
!691 = !DISubroutineType(types: !692)
!692 = !{!639, !16, !16}
!693 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !694, file: !641, line: 146)
!694 = !DISubprogram(name: "exit", scope: !323, file: !323, line: 756, type: !695, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!695 = !DISubroutineType(types: !696)
!696 = !{null, !16}
!697 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !698, file: !641, line: 147)
!698 = !DISubprogram(name: "free", scope: !323, file: !323, line: 687, type: !699, flags: DIFlagPrototyped, spFlags: 0)
!699 = !DISubroutineType(types: !700)
!700 = !{null, !656}
!701 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !702, file: !641, line: 148)
!702 = !DISubprogram(name: "getenv", scope: !323, file: !323, line: 773, type: !703, flags: DIFlagPrototyped, spFlags: 0)
!703 = !DISubroutineType(types: !704)
!704 = !{!705, !10}
!705 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!706 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !707, file: !641, line: 149)
!707 = !DISubprogram(name: "labs", scope: !323, file: !323, line: 981, type: !234, flags: DIFlagPrototyped, spFlags: 0)
!708 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !709, file: !641, line: 150)
!709 = !DISubprogram(name: "ldiv", scope: !323, file: !323, line: 994, type: !710, flags: DIFlagPrototyped, spFlags: 0)
!710 = !DISubroutineType(types: !711)
!711 = !{!643, !236, !236}
!712 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !713, file: !641, line: 151)
!713 = !DISubprogram(name: "malloc", scope: !323, file: !323, line: 672, type: !714, flags: DIFlagPrototyped, spFlags: 0)
!714 = !DISubroutineType(types: !715)
!715 = !{!656, !657}
!716 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !717, file: !641, line: 153)
!717 = !DISubprogram(name: "mblen", scope: !323, file: !323, line: 1062, type: !718, flags: DIFlagPrototyped, spFlags: 0)
!718 = !DISubroutineType(types: !719)
!719 = !{!16, !10, !657}
!720 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !721, file: !641, line: 154)
!721 = !DISubprogram(name: "mbstowcs", scope: !323, file: !323, line: 1073, type: !722, flags: DIFlagPrototyped, spFlags: 0)
!722 = !DISubroutineType(types: !723)
!723 = !{!657, !724, !9, !657}
!724 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !725)
!725 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !726, size: 64)
!726 = !DIBasicType(name: "wchar_t", size: 32, encoding: DW_ATE_signed)
!727 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !728, file: !641, line: 155)
!728 = !DISubprogram(name: "mbtowc", scope: !323, file: !323, line: 1065, type: !729, flags: DIFlagPrototyped, spFlags: 0)
!729 = !DISubroutineType(types: !730)
!730 = !{!16, !724, !9, !657}
!731 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !732, file: !641, line: 157)
!732 = !DISubprogram(name: "qsort", scope: !323, file: !323, line: 970, type: !733, flags: DIFlagPrototyped, spFlags: 0)
!733 = !DISubroutineType(types: !734)
!734 = !{null, !656, !657, !657, !683}
!735 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !736, file: !641, line: 160)
!736 = !DISubprogram(name: "quick_exit", scope: !323, file: !323, line: 762, type: !695, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!737 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !738, file: !641, line: 163)
!738 = !DISubprogram(name: "rand", scope: !323, file: !323, line: 573, type: !739, flags: DIFlagPrototyped, spFlags: 0)
!739 = !DISubroutineType(types: !740)
!740 = !{!16}
!741 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !742, file: !641, line: 164)
!742 = !DISubprogram(name: "realloc", scope: !323, file: !323, line: 683, type: !743, flags: DIFlagPrototyped, spFlags: 0)
!743 = !DISubroutineType(types: !744)
!744 = !{!656, !656, !657}
!745 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !746, file: !641, line: 165)
!746 = !DISubprogram(name: "srand", scope: !323, file: !323, line: 575, type: !747, flags: DIFlagPrototyped, spFlags: 0)
!747 = !DISubroutineType(types: !748)
!748 = !{null, !24}
!749 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !750, file: !641, line: 166)
!750 = !DISubprogram(name: "strtod", scope: !323, file: !323, line: 118, type: !751, flags: DIFlagPrototyped, spFlags: 0)
!751 = !DISubroutineType(types: !752)
!752 = !{!278, !9, !753}
!753 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !754)
!754 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !705, size: 64)
!755 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !756, file: !641, line: 167)
!756 = !DISubprogram(name: "strtol", linkageName: "__isoc23_strtol", scope: !323, file: !323, line: 215, type: !757, flags: DIFlagPrototyped, spFlags: 0)
!757 = !DISubroutineType(types: !758)
!758 = !{!236, !9, !753, !16}
!759 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !760, file: !641, line: 168)
!760 = !DISubprogram(name: "strtoul", linkageName: "__isoc23_strtoul", scope: !323, file: !323, line: 219, type: !761, flags: DIFlagPrototyped, spFlags: 0)
!761 = !DISubroutineType(types: !762)
!762 = !{!659, !9, !753, !16}
!763 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !764, file: !641, line: 169)
!764 = !DISubprogram(name: "system", scope: !323, file: !323, line: 923, type: !671, flags: DIFlagPrototyped, spFlags: 0)
!765 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !766, file: !641, line: 171)
!766 = !DISubprogram(name: "wcstombs", scope: !323, file: !323, line: 1077, type: !767, flags: DIFlagPrototyped, spFlags: 0)
!767 = !DISubroutineType(types: !768)
!768 = !{!657, !769, !770, !657}
!769 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !705)
!770 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !771)
!771 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !772, size: 64)
!772 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !726)
!773 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !774, file: !641, line: 172)
!774 = !DISubprogram(name: "wctomb", scope: !323, file: !323, line: 1069, type: !775, flags: DIFlagPrototyped, spFlags: 0)
!775 = !DISubroutineType(types: !776)
!776 = !{!16, !705, !726}
!777 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !778, entity: !779, file: !641, line: 200)
!778 = !DINamespace(name: "__gnu_cxx", scope: null)
!779 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !323, line: 81, baseType: !780)
!780 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !323, line: 77, size: 128, flags: DIFlagTypePassByValue, elements: !781, identifier: "_ZTS7lldiv_t")
!781 = !{!782, !783}
!782 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !780, file: !323, line: 79, baseType: !247, size: 64)
!783 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !780, file: !323, line: 80, baseType: !247, size: 64, offset: 64)
!784 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !778, entity: !785, file: !641, line: 206)
!785 = !DISubprogram(name: "_Exit", scope: !323, file: !323, line: 768, type: !695, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!786 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !778, entity: !787, file: !641, line: 210)
!787 = !DISubprogram(name: "llabs", scope: !323, file: !323, line: 984, type: !245, flags: DIFlagPrototyped, spFlags: 0)
!788 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !778, entity: !789, file: !641, line: 216)
!789 = !DISubprogram(name: "lldiv", scope: !323, file: !323, line: 998, type: !790, flags: DIFlagPrototyped, spFlags: 0)
!790 = !DISubroutineType(types: !791)
!791 = !{!779, !247, !247}
!792 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !778, entity: !793, file: !641, line: 227)
!793 = !DISubprogram(name: "atoll", scope: !323, file: !323, line: 113, type: !794, flags: DIFlagPrototyped, spFlags: 0)
!794 = !DISubroutineType(types: !795)
!795 = !{!247, !10}
!796 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !778, entity: !797, file: !641, line: 228)
!797 = !DISubprogram(name: "strtoll", linkageName: "__isoc23_strtoll", scope: !323, file: !323, line: 238, type: !798, flags: DIFlagPrototyped, spFlags: 0)
!798 = !DISubroutineType(types: !799)
!799 = !{!247, !9, !753, !16}
!800 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !778, entity: !801, file: !641, line: 229)
!801 = !DISubprogram(name: "strtoull", linkageName: "__isoc23_strtoull", scope: !323, file: !323, line: 243, type: !802, flags: DIFlagPrototyped, spFlags: 0)
!802 = !DISubroutineType(types: !803)
!803 = !{!804, !9, !753, !16}
!804 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!805 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !778, entity: !806, file: !641, line: 231)
!806 = !DISubprogram(name: "strtof", scope: !323, file: !323, line: 124, type: !807, flags: DIFlagPrototyped, spFlags: 0)
!807 = !DISubroutineType(types: !808)
!808 = !{!8, !9, !753}
!809 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !778, entity: !810, file: !641, line: 232)
!810 = !DISubprogram(name: "strtold", scope: !323, file: !323, line: 127, type: !811, flags: DIFlagPrototyped, spFlags: 0)
!811 = !DISubroutineType(types: !812)
!812 = !{!395, !9, !753}
!813 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !779, file: !641, line: 240)
!814 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !785, file: !641, line: 242)
!815 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !787, file: !641, line: 244)
!816 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !817, file: !641, line: 245)
!817 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !778, file: !641, line: 213, type: !790, flags: DIFlagPrototyped, spFlags: 0)
!818 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !789, file: !641, line: 246)
!819 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !793, file: !641, line: 248)
!820 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !806, file: !641, line: 249)
!821 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !797, file: !641, line: 250)
!822 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !801, file: !641, line: 251)
!823 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !810, file: !641, line: 252)
!824 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !649, file: !825, line: 38)
!825 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/12/../../../../include/c++/12/stdlib.h", directory: "")
!826 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !661, file: !825, line: 39)
!827 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !694, file: !825, line: 40)
!828 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !666, file: !825, line: 43)
!829 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !736, file: !825, line: 46)
!830 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !639, file: !825, line: 51)
!831 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !643, file: !825, line: 52)
!832 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !833, file: !825, line: 54)
!833 = !DISubprogram(name: "abs", linkageName: "_ZSt3absn", scope: !135, file: !324, line: 85, type: !834, flags: DIFlagPrototyped, spFlags: 0)
!834 = !DISubroutineType(types: !835)
!835 = !{!836, !836}
!836 = !DIBasicType(name: "__int128", size: 128, encoding: DW_ATE_signed)
!837 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !668, file: !825, line: 55)
!838 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !670, file: !825, line: 56)
!839 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !674, file: !825, line: 57)
!840 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !678, file: !825, line: 58)
!841 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !688, file: !825, line: 59)
!842 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !817, file: !825, line: 60)
!843 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !698, file: !825, line: 61)
!844 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !702, file: !825, line: 62)
!845 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !707, file: !825, line: 63)
!846 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !709, file: !825, line: 64)
!847 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !713, file: !825, line: 65)
!848 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !717, file: !825, line: 67)
!849 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !721, file: !825, line: 68)
!850 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !728, file: !825, line: 69)
!851 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !732, file: !825, line: 71)
!852 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !738, file: !825, line: 72)
!853 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !742, file: !825, line: 73)
!854 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !746, file: !825, line: 74)
!855 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !750, file: !825, line: 75)
!856 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !756, file: !825, line: 76)
!857 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !760, file: !825, line: 77)
!858 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !764, file: !825, line: 78)
!859 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !766, file: !825, line: 80)
!860 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !774, file: !825, line: 81)
!861 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !862, file: !864, line: 443)
!862 = !DISubprogram(name: "acosf", linkageName: "_ZL5acosff", scope: !863, file: !863, line: 59, type: !142, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!863 = !DIFile(filename: "/soft/compilers/llvm/release-17.0.6/lib/clang/17/include/__clang_cuda_math.h", directory: "")
!864 = !DIFile(filename: "/soft/compilers/llvm/release-17.0.6/lib/clang/17/include/__clang_cuda_cmath.h", directory: "")
!865 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !866, file: !864, line: 444)
!866 = !DISubprogram(name: "acoshf", linkageName: "_ZL6acoshff", scope: !863, file: !863, line: 61, type: !142, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!867 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !868, file: !864, line: 445)
!868 = !DISubprogram(name: "asinf", linkageName: "_ZL5asinff", scope: !863, file: !863, line: 63, type: !142, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!869 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !870, file: !864, line: 446)
!870 = !DISubprogram(name: "asinhf", linkageName: "_ZL6asinhff", scope: !863, file: !863, line: 65, type: !142, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!871 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !872, file: !864, line: 447)
!872 = !DISubprogram(name: "atan2f", linkageName: "_ZL6atan2fff", scope: !863, file: !863, line: 68, type: !154, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!873 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !874, file: !864, line: 448)
!874 = !DISubprogram(name: "atanf", linkageName: "_ZL5atanff", scope: !863, file: !863, line: 69, type: !142, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!875 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !876, file: !864, line: 449)
!876 = !DISubprogram(name: "atanhf", linkageName: "_ZL6atanhff", scope: !863, file: !863, line: 71, type: !142, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!877 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !878, file: !864, line: 450)
!878 = !DISubprogram(name: "cbrtf", linkageName: "_ZL5cbrtff", scope: !863, file: !863, line: 73, type: !142, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!879 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !880, file: !864, line: 451)
!880 = !DISubprogram(name: "ceilf", linkageName: "_ZL5ceilff", scope: !863, file: !863, line: 75, type: !142, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!881 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !882, file: !864, line: 452)
!882 = !DISubprogram(name: "copysignf", linkageName: "_ZL9copysignfff", scope: !863, file: !863, line: 79, type: !154, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!883 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !884, file: !864, line: 453)
!884 = !DISubprogram(name: "cosf", linkageName: "_ZL4cosff", scope: !863, file: !863, line: 83, type: !142, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!885 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !886, file: !864, line: 454)
!886 = !DISubprogram(name: "coshf", linkageName: "_ZL5coshff", scope: !863, file: !863, line: 87, type: !142, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!887 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !888, file: !864, line: 455)
!888 = !DISubprogram(name: "erfcf", linkageName: "_ZL5erfcff", scope: !863, file: !863, line: 96, type: !142, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!889 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !890, file: !864, line: 456)
!890 = !DISubprogram(name: "erff", linkageName: "_ZL4erfff", scope: !863, file: !863, line: 101, type: !142, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!891 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !892, file: !864, line: 457)
!892 = !DISubprogram(name: "exp2f", linkageName: "_ZL5exp2ff", scope: !863, file: !863, line: 108, type: !142, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!893 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !894, file: !864, line: 458)
!894 = !DISubprogram(name: "expf", linkageName: "_ZL4expff", scope: !863, file: !863, line: 109, type: !142, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!895 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !896, file: !864, line: 459)
!896 = !DISubprogram(name: "expm1f", linkageName: "_ZL6expm1ff", scope: !863, file: !863, line: 111, type: !142, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!897 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !898, file: !864, line: 460)
!898 = !DISubprogram(name: "fabsf", linkageName: "_ZL5fabsff", scope: !863, file: !863, line: 112, type: !142, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!899 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !900, file: !864, line: 461)
!900 = !DISubprogram(name: "fdimf", linkageName: "_ZL5fdimfff", scope: !863, file: !863, line: 114, type: !154, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!901 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !902, file: !864, line: 462)
!902 = !DISubprogram(name: "floorf", linkageName: "_ZL6floorff", scope: !863, file: !863, line: 124, type: !142, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!903 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !904, file: !864, line: 463)
!904 = !DISubprogram(name: "fmaf", linkageName: "_ZL4fmaffff", scope: !863, file: !863, line: 128, type: !186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!905 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !906, file: !864, line: 464)
!906 = !DISubprogram(name: "fmaxf", linkageName: "_ZL5fmaxfff", scope: !863, file: !863, line: 132, type: !154, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!907 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !908, file: !864, line: 465)
!908 = !DISubprogram(name: "fminf", linkageName: "_ZL5fminfff", scope: !863, file: !863, line: 134, type: !154, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!909 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !910, file: !864, line: 466)
!910 = !DISubprogram(name: "fmodf", linkageName: "_ZL5fmodfff", scope: !863, file: !863, line: 136, type: !154, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!911 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !912, file: !864, line: 467)
!912 = !DISubprogram(name: "frexpf", linkageName: "_ZL6frexpffPi", scope: !863, file: !863, line: 138, type: !200, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!913 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !914, file: !864, line: 468)
!914 = !DISubprogram(name: "hypotf", linkageName: "_ZL6hypotfff", scope: !863, file: !863, line: 140, type: !154, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!915 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !916, file: !864, line: 469)
!916 = !DISubprogram(name: "ilogbf", linkageName: "_ZL6ilogbff", scope: !863, file: !863, line: 142, type: !196, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!917 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !918, file: !864, line: 470)
!918 = !DISubprogram(name: "ldexpf", linkageName: "_ZL6ldexpffi", scope: !863, file: !863, line: 155, type: !239, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!919 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !920, file: !864, line: 471)
!920 = !DISubprogram(name: "lgammaf", linkageName: "_ZL7lgammaff", scope: !863, file: !863, line: 157, type: !142, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!921 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !922, file: !864, line: 472)
!922 = !DISubprogram(name: "llrintf", linkageName: "_ZL7llrintff", scope: !863, file: !863, line: 166, type: !250, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!923 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !924, file: !864, line: 473)
!924 = !DISubprogram(name: "llroundf", linkageName: "_ZL8llroundff", scope: !863, file: !863, line: 168, type: !250, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!925 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !926, file: !864, line: 474)
!926 = !DISubprogram(name: "log10f", linkageName: "_ZL6log10ff", scope: !863, file: !863, line: 173, type: !142, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!927 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !928, file: !864, line: 475)
!928 = !DISubprogram(name: "log1pf", linkageName: "_ZL6log1pff", scope: !863, file: !863, line: 175, type: !142, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!929 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !930, file: !864, line: 476)
!930 = !DISubprogram(name: "log2f", linkageName: "_ZL5log2ff", scope: !863, file: !863, line: 177, type: !142, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!931 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !932, file: !864, line: 477)
!932 = !DISubprogram(name: "logbf", linkageName: "_ZL5logbff", scope: !863, file: !863, line: 181, type: !142, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!933 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !934, file: !864, line: 478)
!934 = !DISubprogram(name: "logf", linkageName: "_ZL4logff", scope: !863, file: !863, line: 182, type: !142, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!935 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !936, file: !864, line: 479)
!936 = !DISubprogram(name: "lrintf", linkageName: "_ZL6lrintff", scope: !863, file: !863, line: 187, type: !264, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!937 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !938, file: !864, line: 480)
!938 = !DISubprogram(name: "lroundf", linkageName: "_ZL7lroundff", scope: !863, file: !863, line: 189, type: !264, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!939 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !940, file: !864, line: 481)
!940 = !DISubprogram(name: "modff", linkageName: "_ZL5modfffPf", scope: !863, file: !863, line: 199, type: !272, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!941 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !942, file: !864, line: 482)
!942 = !DISubprogram(name: "nearbyintf", linkageName: "_ZL10nearbyintff", scope: !863, file: !863, line: 201, type: !142, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!943 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !944, file: !864, line: 483)
!944 = !DISubprogram(name: "nextafterf", linkageName: "_ZL10nextafterfff", scope: !863, file: !863, line: 205, type: !154, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!945 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !946, file: !864, line: 484)
!946 = !DISubprogram(name: "powf", linkageName: "_ZL4powfff", scope: !863, file: !863, line: 231, type: !154, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!947 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !948, file: !864, line: 485)
!948 = !DISubprogram(name: "remainderf", linkageName: "_ZL10remainderfff", scope: !863, file: !863, line: 239, type: !154, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!949 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !950, file: !864, line: 486)
!950 = !DISubprogram(name: "remquof", linkageName: "_ZL7remquofffPi", scope: !863, file: !863, line: 245, type: !293, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!951 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !952, file: !864, line: 487)
!952 = !DISubprogram(name: "rintf", linkageName: "_ZL5rintff", scope: !863, file: !863, line: 256, type: !142, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!953 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !954, file: !864, line: 488)
!954 = !DISubprogram(name: "roundf", linkageName: "_ZL6roundff", scope: !863, file: !863, line: 170, type: !142, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!955 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !956, file: !864, line: 489)
!956 = !DISubprogram(name: "scalblnf", linkageName: "_ZL8scalblnffl", scope: !863, file: !863, line: 286, type: !301, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!957 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !958, file: !864, line: 490)
!958 = !DISubprogram(name: "scalbnf", linkageName: "_ZL7scalbnffi", scope: !863, file: !863, line: 278, type: !239, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!959 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !960, file: !864, line: 491)
!960 = !DISubprogram(name: "sinf", linkageName: "_ZL4sinff", scope: !863, file: !863, line: 306, type: !142, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!961 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !962, file: !864, line: 492)
!962 = !DISubprogram(name: "sinhf", linkageName: "_ZL5sinhff", scope: !863, file: !863, line: 310, type: !142, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!963 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !964, file: !864, line: 493)
!964 = !DISubprogram(name: "sqrtf", linkageName: "_ZL5sqrtff", scope: !863, file: !863, line: 314, type: !142, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!965 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !966, file: !864, line: 494)
!966 = !DISubprogram(name: "tanf", linkageName: "_ZL4tanff", scope: !863, file: !863, line: 316, type: !142, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!967 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !968, file: !864, line: 495)
!968 = !DISubprogram(name: "tanhf", linkageName: "_ZL5tanhff", scope: !863, file: !863, line: 318, type: !142, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!969 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !970, file: !864, line: 496)
!970 = !DISubprogram(name: "tgammaf", linkageName: "_ZL7tgammaff", scope: !863, file: !863, line: 320, type: !142, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!971 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !972, file: !864, line: 497)
!972 = !DISubprogram(name: "truncf", linkageName: "_ZL6truncff", scope: !863, file: !863, line: 322, type: !142, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!973 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !833, file: !974, line: 38)
!974 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/12/../../../../include/c++/12/math.h", directory: "")
!975 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !976, file: !974, line: 54)
!976 = !DISubprogram(name: "modf", linkageName: "_ZSt4modfePe", scope: !135, file: !330, line: 380, type: !977, flags: DIFlagPrototyped, spFlags: 0)
!977 = !DISubroutineType(types: !978)
!978 = !{!395, !395, !979}
!979 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !395, size: 64)
!980 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !981, file: !986, line: 47)
!981 = !DIDerivedType(tag: DW_TAG_typedef, name: "int8_t", file: !982, line: 24, baseType: !983)
!982 = !DIFile(filename: "/usr/include/bits/stdint-intn.h", directory: "")
!983 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int8_t", file: !984, line: 37, baseType: !985)
!984 = !DIFile(filename: "/usr/include/bits/types.h", directory: "")
!985 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!986 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/12/../../../../include/c++/12/cstdint", directory: "")
!987 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !988, file: !986, line: 48)
!988 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !982, line: 25, baseType: !989)
!989 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int16_t", file: !984, line: 39, baseType: !990)
!990 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!991 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !992, file: !986, line: 49)
!992 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !982, line: 26, baseType: !993)
!993 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !984, line: 41, baseType: !16)
!994 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !995, file: !986, line: 50)
!995 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !982, line: 27, baseType: !996)
!996 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !984, line: 44, baseType: !236)
!997 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !998, file: !986, line: 52)
!998 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast8_t", file: !999, line: 58, baseType: !985)
!999 = !DIFile(filename: "/usr/include/stdint.h", directory: "")
!1000 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !1001, file: !986, line: 53)
!1001 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast16_t", file: !999, line: 60, baseType: !236)
!1002 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !1003, file: !986, line: 54)
!1003 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast32_t", file: !999, line: 61, baseType: !236)
!1004 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !1005, file: !986, line: 55)
!1005 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast64_t", file: !999, line: 62, baseType: !236)
!1006 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !1007, file: !986, line: 57)
!1007 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least8_t", file: !999, line: 43, baseType: !1008)
!1008 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least8_t", file: !984, line: 52, baseType: !983)
!1009 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !1010, file: !986, line: 58)
!1010 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least16_t", file: !999, line: 44, baseType: !1011)
!1011 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least16_t", file: !984, line: 54, baseType: !989)
!1012 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !1013, file: !986, line: 59)
!1013 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least32_t", file: !999, line: 45, baseType: !1014)
!1014 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least32_t", file: !984, line: 56, baseType: !993)
!1015 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !1016, file: !986, line: 60)
!1016 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least64_t", file: !999, line: 46, baseType: !1017)
!1017 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least64_t", file: !984, line: 58, baseType: !996)
!1018 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !1019, file: !986, line: 62)
!1019 = !DIDerivedType(tag: DW_TAG_typedef, name: "intmax_t", file: !999, line: 101, baseType: !1020)
!1020 = !DIDerivedType(tag: DW_TAG_typedef, name: "__intmax_t", file: !984, line: 72, baseType: !236)
!1021 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !1022, file: !986, line: 63)
!1022 = !DIDerivedType(tag: DW_TAG_typedef, name: "intptr_t", file: !999, line: 87, baseType: !236)
!1023 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !1024, file: !986, line: 65)
!1024 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !1025, line: 24, baseType: !1026)
!1025 = !DIFile(filename: "/usr/include/bits/stdint-uintn.h", directory: "")
!1026 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !984, line: 38, baseType: !1027)
!1027 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!1028 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !1029, file: !986, line: 66)
!1029 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !1025, line: 25, baseType: !1030)
!1030 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !984, line: 40, baseType: !1031)
!1031 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!1032 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !1033, file: !986, line: 67)
!1033 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !1025, line: 26, baseType: !1034)
!1034 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !984, line: 42, baseType: !24)
!1035 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !1036, file: !986, line: 68)
!1036 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !1025, line: 27, baseType: !1037)
!1037 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint64_t", file: !984, line: 45, baseType: !659)
!1038 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !1039, file: !986, line: 70)
!1039 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast8_t", file: !999, line: 71, baseType: !1027)
!1040 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !1041, file: !986, line: 71)
!1041 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast16_t", file: !999, line: 73, baseType: !659)
!1042 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !1043, file: !986, line: 72)
!1043 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast32_t", file: !999, line: 74, baseType: !659)
!1044 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !1045, file: !986, line: 73)
!1045 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast64_t", file: !999, line: 75, baseType: !659)
!1046 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !1047, file: !986, line: 75)
!1047 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least8_t", file: !999, line: 49, baseType: !1048)
!1048 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least8_t", file: !984, line: 53, baseType: !1026)
!1049 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !1050, file: !986, line: 76)
!1050 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least16_t", file: !999, line: 50, baseType: !1051)
!1051 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least16_t", file: !984, line: 55, baseType: !1030)
!1052 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !1053, file: !986, line: 77)
!1053 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least32_t", file: !999, line: 51, baseType: !1054)
!1054 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least32_t", file: !984, line: 57, baseType: !1034)
!1055 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !1056, file: !986, line: 78)
!1056 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least64_t", file: !999, line: 52, baseType: !1057)
!1057 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least64_t", file: !984, line: 59, baseType: !1037)
!1058 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !1059, file: !986, line: 80)
!1059 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintmax_t", file: !999, line: 102, baseType: !1060)
!1060 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uintmax_t", file: !984, line: 73, baseType: !659)
!1061 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !1062, file: !986, line: 81)
!1062 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintptr_t", file: !999, line: 90, baseType: !659)
!1063 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !1064, file: !1067, line: 60)
!1064 = !DIDerivedType(tag: DW_TAG_typedef, name: "clock_t", file: !1065, line: 7, baseType: !1066)
!1065 = !DIFile(filename: "/usr/include/bits/types/clock_t.h", directory: "")
!1066 = !DIDerivedType(tag: DW_TAG_typedef, name: "__clock_t", file: !984, line: 156, baseType: !236)
!1067 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/12/../../../../include/c++/12/ctime", directory: "")
!1068 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !1069, file: !1067, line: 61)
!1069 = !DIDerivedType(tag: DW_TAG_typedef, name: "time_t", file: !1070, line: 10, baseType: !1071)
!1070 = !DIFile(filename: "/usr/include/bits/types/time_t.h", directory: "")
!1071 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !984, line: 160, baseType: !236)
!1072 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !1073, file: !1067, line: 62)
!1073 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tm", file: !1074, line: 7, size: 448, flags: DIFlagFwdDecl, identifier: "_ZTS2tm")
!1074 = !DIFile(filename: "/usr/include/bits/types/struct_tm.h", directory: "")
!1075 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !1076, file: !1067, line: 64)
!1076 = !DISubprogram(name: "clock", scope: !1077, file: !1077, line: 72, type: !1078, flags: DIFlagPrototyped, spFlags: 0)
!1077 = !DIFile(filename: "/usr/include/time.h", directory: "")
!1078 = !DISubroutineType(types: !1079)
!1079 = !{!1064}
!1080 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !1081, file: !1067, line: 65)
!1081 = !DISubprogram(name: "difftime", scope: !1077, file: !1077, line: 79, type: !1082, flags: DIFlagPrototyped, spFlags: 0)
!1082 = !DISubroutineType(types: !1083)
!1083 = !{!278, !1069, !1069}
!1084 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !1085, file: !1067, line: 66)
!1085 = !DISubprogram(name: "mktime", scope: !1077, file: !1077, line: 83, type: !1086, flags: DIFlagPrototyped, spFlags: 0)
!1086 = !DISubroutineType(types: !1087)
!1087 = !{!1069, !1088}
!1088 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1073, size: 64)
!1089 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !1090, file: !1067, line: 67)
!1090 = !DISubprogram(name: "time", scope: !1077, file: !1077, line: 76, type: !1091, flags: DIFlagPrototyped, spFlags: 0)
!1091 = !DISubroutineType(types: !1092)
!1092 = !{!1069, !1093}
!1093 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1069, size: 64)
!1094 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !1095, file: !1067, line: 68)
!1095 = !DISubprogram(name: "asctime", scope: !1077, file: !1077, line: 180, type: !1096, flags: DIFlagPrototyped, spFlags: 0)
!1096 = !DISubroutineType(types: !1097)
!1097 = !{!705, !1098}
!1098 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1099, size: 64)
!1099 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1073)
!1100 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !1101, file: !1067, line: 69)
!1101 = !DISubprogram(name: "ctime", scope: !1077, file: !1077, line: 184, type: !1102, flags: DIFlagPrototyped, spFlags: 0)
!1102 = !DISubroutineType(types: !1103)
!1103 = !{!705, !1104}
!1104 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1105, size: 64)
!1105 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1069)
!1106 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !1107, file: !1067, line: 70)
!1107 = !DISubprogram(name: "gmtime", scope: !1077, file: !1077, line: 133, type: !1108, flags: DIFlagPrototyped, spFlags: 0)
!1108 = !DISubroutineType(types: !1109)
!1109 = !{!1088, !1104}
!1110 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !1111, file: !1067, line: 71)
!1111 = !DISubprogram(name: "localtime", scope: !1077, file: !1077, line: 137, type: !1108, flags: DIFlagPrototyped, spFlags: 0)
!1112 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !1113, file: !1067, line: 72)
!1113 = !DISubprogram(name: "strftime", scope: !1077, file: !1077, line: 100, type: !1114, flags: DIFlagPrototyped, spFlags: 0)
!1114 = !DISubroutineType(types: !1115)
!1115 = !{!657, !769, !657, !9, !1116}
!1116 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1098)
!1117 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !1118, file: !1067, line: 79)
!1118 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timespec", file: !1119, line: 11, size: 128, flags: DIFlagTypePassByValue, elements: !1120, identifier: "_ZTS8timespec")
!1119 = !DIFile(filename: "/usr/include/bits/types/struct_timespec.h", directory: "")
!1120 = !{!1121, !1122}
!1121 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !1118, file: !1119, line: 16, baseType: !1071, size: 64)
!1122 = !DIDerivedType(tag: DW_TAG_member, name: "tv_nsec", scope: !1118, file: !1119, line: 21, baseType: !1123, size: 64, offset: 64)
!1123 = !DIDerivedType(tag: DW_TAG_typedef, name: "__syscall_slong_t", file: !984, line: 197, baseType: !236)
!1124 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !135, entity: !1125, file: !1067, line: 80)
!1125 = !DISubprogram(name: "timespec_get", scope: !1077, file: !1077, line: 384, type: !1126, flags: DIFlagPrototyped, spFlags: 0)
!1126 = !DISubroutineType(types: !1127)
!1127 = !{!16, !1128, !16}
!1128 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1118, size: 64)
!1129 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !1130, entity: !1131, file: !1133, line: 1428)
!1130 = !DINamespace(name: "chrono", scope: !135)
!1131 = !DINamespace(name: "chrono_literals", scope: !1132, exportSymbols: true)
!1132 = !DINamespace(name: "literals", scope: !135, exportSymbols: true)
!1133 = !DIFile(filename: "/usr/lib64/gcc/x86_64-suse-linux/12/../../../../include/c++/12/bits/chrono.h", directory: "")
!1134 = !{}
!1135 = !{!1136, !1137}
!1136 = !DITemplateValueParameter(name: "bsize_x", type: !16, value: i32 16)
!1137 = !DITemplateValueParameter(name: "bsize_y", type: !16, value: i32 16)
!1138 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 131072, elements: !1139)
!1139 = !{!1140, !1141}
!1140 = !DISubrange(count: 16)
!1141 = !DISubrange(count: 256)
!1142 = !{i32 2, !"SDK Version", [2 x i32] [i32 11, i32 8]}
!1143 = !{i32 7, !"Dwarf Version", i32 2}
!1144 = !{i32 2, !"Debug Info Version", i32 3}
!1145 = !{i32 1, !"wchar_size", i32 4}
!1146 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!1147 = !{i32 7, !"frame-pointer", i32 2}
!1148 = !{ptr @_Z7entropyPfPKcii, !"kernel", i32 1}
!1149 = !{ptr @_Z11entropy_optILi16ELi16EEvPfPKcPKfii, !"kernel", i32 1}
!1150 = !{!"clang version 17.0.6 (https://github.com/llvm/llvm-project.git 6009708b4367171ccdbf4b5905cb6a803753fe18)"}
!1151 = !{!"clang version 3.8.0 (tags/RELEASE_380/final)"}
!1152 = distinct !DISubprogram(name: "entropy", linkageName: "_Z7entropyPfPKcii", scope: !3, file: !3, line: 9, type: !1153, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !1134)
!1153 = !DISubroutineType(types: !1154)
!1154 = !{null, !6, !9, !16, !16}
!1155 = !DILocalVariable(name: "d_entropy", arg: 1, scope: !1152, file: !3, line: 10, type: !6)
!1156 = !DILocation(line: 10, column: 29, scope: !1152)
!1157 = !DILocalVariable(name: "d_val", arg: 2, scope: !1152, file: !3, line: 11, type: !9)
!1158 = !DILocation(line: 11, column: 29, scope: !1152)
!1159 = !DILocalVariable(name: "height", arg: 3, scope: !1152, file: !3, line: 12, type: !16)
!1160 = !DILocation(line: 12, column: 9, scope: !1152)
!1161 = !DILocalVariable(name: "width", arg: 4, scope: !1152, file: !3, line: 12, type: !16)
!1162 = !DILocation(line: 12, column: 21, scope: !1152)
!1163 = !DILocalVariable(name: "x", scope: !1152, file: !3, line: 14, type: !1164)
!1164 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !16)
!1165 = !DILocation(line: 14, column: 13, scope: !1152)
!1166 = !DILocation(line: 53, column: 3, scope: !1167, inlinedAt: !1168)
!1167 = distinct !DISubprogram(name: "__fetch_builtin_x", linkageName: "_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv", scope: !45, file: !46, line: 53, type: !49, scopeLine: 53, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, declaration: !48)
!1168 = distinct !DILocation(line: 14, column: 17, scope: !1152)
!1169 = !DILocation(line: 66, column: 3, scope: !1170, inlinedAt: !1171)
!1170 = distinct !DISubprogram(name: "__fetch_builtin_x", linkageName: "_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv", scope: !76, file: !46, line: 66, type: !49, scopeLine: 66, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, declaration: !78)
!1171 = distinct !DILocation(line: 14, column: 31, scope: !1152)
!1172 = !DILocation(line: 79, column: 3, scope: !1173, inlinedAt: !1174)
!1173 = distinct !DISubprogram(name: "__fetch_builtin_x", linkageName: "_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv", scope: !104, file: !46, line: 79, type: !49, scopeLine: 79, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, declaration: !106)
!1174 = distinct !DILocation(line: 14, column: 44, scope: !1152)
!1175 = !DILocation(line: 14, column: 42, scope: !1152)
!1176 = !DILocation(line: 14, column: 29, scope: !1152)
!1177 = !DILocalVariable(name: "y", scope: !1152, file: !3, line: 15, type: !1164)
!1178 = !DILocation(line: 15, column: 13, scope: !1152)
!1179 = !DILocation(line: 54, column: 3, scope: !1180, inlinedAt: !1181)
!1180 = distinct !DISubprogram(name: "__fetch_builtin_y", linkageName: "_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv", scope: !45, file: !46, line: 54, type: !49, scopeLine: 54, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, declaration: !51)
!1181 = distinct !DILocation(line: 15, column: 17, scope: !1152)
!1182 = !DILocation(line: 67, column: 3, scope: !1183, inlinedAt: !1184)
!1183 = distinct !DISubprogram(name: "__fetch_builtin_y", linkageName: "_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv", scope: !76, file: !46, line: 67, type: !49, scopeLine: 67, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, declaration: !79)
!1184 = distinct !DILocation(line: 15, column: 31, scope: !1152)
!1185 = !DILocation(line: 80, column: 3, scope: !1186, inlinedAt: !1187)
!1186 = distinct !DISubprogram(name: "__fetch_builtin_y", linkageName: "_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_yEv", scope: !104, file: !46, line: 80, type: !49, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, declaration: !107)
!1187 = distinct !DILocation(line: 15, column: 44, scope: !1152)
!1188 = !DILocation(line: 15, column: 42, scope: !1152)
!1189 = !DILocation(line: 15, column: 29, scope: !1152)
!1190 = !DILocation(line: 16, column: 7, scope: !1191)
!1191 = distinct !DILexicalBlock(scope: !1152, file: !3, line: 16, column: 7)
!1192 = !DILocation(line: 16, column: 12, scope: !1191)
!1193 = !DILocation(line: 16, column: 9, scope: !1191)
!1194 = !DILocation(line: 16, column: 19, scope: !1191)
!1195 = !DILocation(line: 16, column: 22, scope: !1191)
!1196 = !DILocation(line: 16, column: 27, scope: !1191)
!1197 = !DILocation(line: 16, column: 24, scope: !1191)
!1198 = !DILocation(line: 16, column: 7, scope: !1152)
!1199 = !DILocation(line: 16, column: 34, scope: !1191)
!1200 = !DILocalVariable(name: "count", scope: !1152, file: !3, line: 19, type: !1201)
!1201 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 128, elements: !1202)
!1202 = !{!1140}
!1203 = !DILocation(line: 19, column: 8, scope: !1152)
!1204 = !DILocalVariable(name: "i", scope: !1205, file: !3, line: 20, type: !16)
!1205 = distinct !DILexicalBlock(scope: !1152, file: !3, line: 20, column: 3)
!1206 = !DILocation(line: 20, column: 12, scope: !1205)
!1207 = !DILocation(line: 20, column: 8, scope: !1205)
!1208 = !DILocation(line: 20, column: 19, scope: !1209)
!1209 = distinct !DILexicalBlock(scope: !1205, file: !3, line: 20, column: 3)
!1210 = !DILocation(line: 20, column: 21, scope: !1209)
!1211 = !DILocation(line: 20, column: 3, scope: !1205)
!1212 = !DILocation(line: 20, column: 38, scope: !1209)
!1213 = !DILocation(line: 20, column: 32, scope: !1209)
!1214 = !DILocation(line: 20, column: 41, scope: !1209)
!1215 = !DILocation(line: 20, column: 28, scope: !1209)
!1216 = !DILocation(line: 20, column: 3, scope: !1209)
!1217 = distinct !{!1217, !1211, !1218, !1219}
!1218 = !DILocation(line: 20, column: 43, scope: !1205)
!1219 = !{!"llvm.loop.mustprogress"}
!1220 = !DILocalVariable(name: "total", scope: !1152, file: !3, line: 23, type: !12)
!1221 = !DILocation(line: 23, column: 8, scope: !1152)
!1222 = !DILocalVariable(name: "dy", scope: !1223, file: !3, line: 26, type: !16)
!1223 = distinct !DILexicalBlock(scope: !1152, file: !3, line: 26, column: 3)
!1224 = !DILocation(line: 26, column: 11, scope: !1223)
!1225 = !DILocation(line: 26, column: 7, scope: !1223)
!1226 = !DILocation(line: 26, column: 20, scope: !1227)
!1227 = distinct !DILexicalBlock(scope: !1223, file: !3, line: 26, column: 3)
!1228 = !DILocation(line: 26, column: 23, scope: !1227)
!1229 = !DILocation(line: 26, column: 3, scope: !1223)
!1230 = !DILocalVariable(name: "dx", scope: !1231, file: !3, line: 27, type: !16)
!1231 = distinct !DILexicalBlock(scope: !1232, file: !3, line: 27, column: 5)
!1232 = distinct !DILexicalBlock(scope: !1227, file: !3, line: 26, column: 35)
!1233 = !DILocation(line: 27, column: 13, scope: !1231)
!1234 = !DILocation(line: 27, column: 9, scope: !1231)
!1235 = !DILocation(line: 27, column: 22, scope: !1236)
!1236 = distinct !DILexicalBlock(scope: !1231, file: !3, line: 27, column: 5)
!1237 = !DILocation(line: 27, column: 25, scope: !1236)
!1238 = !DILocation(line: 27, column: 5, scope: !1231)
!1239 = !DILocalVariable(name: "xx", scope: !1240, file: !3, line: 28, type: !16)
!1240 = distinct !DILexicalBlock(scope: !1236, file: !3, line: 27, column: 37)
!1241 = !DILocation(line: 28, column: 11, scope: !1240)
!1242 = !DILocation(line: 28, column: 16, scope: !1240)
!1243 = !DILocation(line: 28, column: 20, scope: !1240)
!1244 = !DILocation(line: 28, column: 18, scope: !1240)
!1245 = !DILocalVariable(name: "yy", scope: !1240, file: !3, line: 29, type: !16)
!1246 = !DILocation(line: 29, column: 11, scope: !1240)
!1247 = !DILocation(line: 29, column: 16, scope: !1240)
!1248 = !DILocation(line: 29, column: 20, scope: !1240)
!1249 = !DILocation(line: 29, column: 18, scope: !1240)
!1250 = !DILocation(line: 30, column: 10, scope: !1251)
!1251 = distinct !DILexicalBlock(scope: !1240, file: !3, line: 30, column: 10)
!1252 = !DILocation(line: 30, column: 13, scope: !1251)
!1253 = !DILocation(line: 30, column: 18, scope: !1251)
!1254 = !DILocation(line: 30, column: 21, scope: !1251)
!1255 = !DILocation(line: 30, column: 24, scope: !1251)
!1256 = !DILocation(line: 30, column: 29, scope: !1251)
!1257 = !DILocation(line: 30, column: 32, scope: !1251)
!1258 = !DILocation(line: 30, column: 37, scope: !1251)
!1259 = !DILocation(line: 30, column: 35, scope: !1251)
!1260 = !DILocation(line: 30, column: 44, scope: !1251)
!1261 = !DILocation(line: 30, column: 47, scope: !1251)
!1262 = !DILocation(line: 30, column: 52, scope: !1251)
!1263 = !DILocation(line: 30, column: 50, scope: !1251)
!1264 = !DILocation(line: 30, column: 10, scope: !1240)
!1265 = !DILocation(line: 31, column: 15, scope: !1266)
!1266 = distinct !DILexicalBlock(scope: !1251, file: !3, line: 30, column: 59)
!1267 = !DILocation(line: 31, column: 21, scope: !1266)
!1268 = !DILocation(line: 31, column: 26, scope: !1266)
!1269 = !DILocation(line: 31, column: 24, scope: !1266)
!1270 = !DILocation(line: 31, column: 34, scope: !1266)
!1271 = !DILocation(line: 31, column: 32, scope: !1266)
!1272 = !DILocation(line: 31, column: 9, scope: !1266)
!1273 = !DILocation(line: 31, column: 38, scope: !1266)
!1274 = !DILocation(line: 32, column: 14, scope: !1266)
!1275 = !DILocation(line: 33, column: 7, scope: !1266)
!1276 = !DILocation(line: 34, column: 5, scope: !1240)
!1277 = !DILocation(line: 27, column: 33, scope: !1236)
!1278 = !DILocation(line: 27, column: 5, scope: !1236)
!1279 = distinct !{!1279, !1238, !1280, !1219}
!1280 = !DILocation(line: 34, column: 5, scope: !1231)
!1281 = !DILocation(line: 35, column: 3, scope: !1232)
!1282 = !DILocation(line: 26, column: 31, scope: !1227)
!1283 = !DILocation(line: 26, column: 3, scope: !1227)
!1284 = distinct !{!1284, !1229, !1285, !1219}
!1285 = !DILocation(line: 35, column: 3, scope: !1223)
!1286 = !DILocalVariable(name: "entropy", scope: !1152, file: !3, line: 37, type: !8)
!1287 = !DILocation(line: 37, column: 9, scope: !1152)
!1288 = !DILocation(line: 38, column: 7, scope: !1289)
!1289 = distinct !DILexicalBlock(scope: !1152, file: !3, line: 38, column: 7)
!1290 = !DILocation(line: 38, column: 13, scope: !1289)
!1291 = !DILocation(line: 38, column: 7, scope: !1152)
!1292 = !DILocation(line: 39, column: 11, scope: !1293)
!1293 = distinct !DILexicalBlock(scope: !1289, file: !3, line: 38, column: 18)
!1294 = !DILocation(line: 40, column: 3, scope: !1293)
!1295 = !DILocalVariable(name: "k", scope: !1296, file: !3, line: 41, type: !16)
!1296 = distinct !DILexicalBlock(scope: !1297, file: !3, line: 41, column: 5)
!1297 = distinct !DILexicalBlock(scope: !1289, file: !3, line: 40, column: 10)
!1298 = !DILocation(line: 41, column: 13, scope: !1296)
!1299 = !DILocation(line: 41, column: 9, scope: !1296)
!1300 = !DILocation(line: 41, column: 20, scope: !1301)
!1301 = distinct !DILexicalBlock(scope: !1296, file: !3, line: 41, column: 5)
!1302 = !DILocation(line: 41, column: 22, scope: !1301)
!1303 = !DILocation(line: 41, column: 5, scope: !1296)
!1304 = !DILocalVariable(name: "p", scope: !1305, file: !3, line: 42, type: !8)
!1305 = distinct !DILexicalBlock(scope: !1301, file: !3, line: 41, column: 33)
!1306 = !DILocation(line: 42, column: 13, scope: !1305)
!1307 = !DILocation(line: 42, column: 41, scope: !1305)
!1308 = !DILocation(line: 42, column: 35, scope: !1305)
!1309 = !DILocation(line: 42, column: 52, scope: !1305)
!1310 = !DILocalVariable(name: "__a", arg: 1, scope: !1311, file: !1312, line: 221, type: !8)
!1311 = distinct !DISubprogram(name: "__fdividef", linkageName: "_ZL10__fdividefff", scope: !1312, file: !1312, line: 221, type: !154, scopeLine: 221, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !17, retainedNodes: !1134)
!1312 = !DIFile(filename: "/soft/compilers/llvm/release-17.0.6/lib/clang/17/include/__clang_cuda_device_functions.h", directory: "")
!1313 = !DILocation(line: 221, column: 35, scope: !1311, inlinedAt: !1314)
!1314 = distinct !DILocation(line: 42, column: 17, scope: !1305)
!1315 = !DILocalVariable(name: "__b", arg: 2, scope: !1311, file: !1312, line: 221, type: !8)
!1316 = !DILocation(line: 221, column: 46, scope: !1311, inlinedAt: !1314)
!1317 = !DILocation(line: 222, column: 29, scope: !1311, inlinedAt: !1314)
!1318 = !DILocation(line: 222, column: 34, scope: !1311, inlinedAt: !1314)
!1319 = !DILocation(line: 222, column: 10, scope: !1311, inlinedAt: !1314)
!1320 = !DILocation(line: 43, column: 18, scope: !1305)
!1321 = !DILocation(line: 43, column: 30, scope: !1305)
!1322 = !DILocalVariable(name: "__a", arg: 1, scope: !1323, file: !1312, line: 491, type: !8)
!1323 = distinct !DISubprogram(name: "__log2f", linkageName: "_ZL7__log2ff", scope: !1312, file: !1312, line: 491, type: !142, scopeLine: 491, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !17, retainedNodes: !1134)
!1324 = !DILocation(line: 491, column: 32, scope: !1323, inlinedAt: !1325)
!1325 = distinct !DILocation(line: 43, column: 22, scope: !1305)
!1326 = !DILocation(line: 491, column: 62, scope: !1323, inlinedAt: !1325)
!1327 = !DILocation(line: 491, column: 46, scope: !1323, inlinedAt: !1325)
!1328 = !DILocation(line: 43, column: 20, scope: !1305)
!1329 = !DILocation(line: 43, column: 15, scope: !1305)
!1330 = !DILocation(line: 44, column: 5, scope: !1305)
!1331 = !DILocation(line: 41, column: 29, scope: !1301)
!1332 = !DILocation(line: 41, column: 5, scope: !1301)
!1333 = distinct !{!1333, !1303, !1334, !1219}
!1334 = !DILocation(line: 44, column: 5, scope: !1296)
!1335 = !DILocation(line: 47, column: 30, scope: !1152)
!1336 = !DILocation(line: 47, column: 3, scope: !1152)
!1337 = !DILocation(line: 47, column: 13, scope: !1152)
!1338 = !DILocation(line: 47, column: 17, scope: !1152)
!1339 = !DILocation(line: 47, column: 15, scope: !1152)
!1340 = !DILocation(line: 47, column: 25, scope: !1152)
!1341 = !DILocation(line: 47, column: 23, scope: !1152)
!1342 = !DILocation(line: 47, column: 28, scope: !1152)
!1343 = !DILocation(line: 48, column: 1, scope: !1152)
!1344 = !DILocalVariable(name: "d_entropy", arg: 1, scope: !2, file: !3, line: 52, type: !6)
!1345 = !DILocation(line: 52, column: 28, scope: !2)
!1346 = !DILocalVariable(name: "d_val", arg: 2, scope: !2, file: !3, line: 53, type: !9)
!1347 = !DILocation(line: 53, column: 28, scope: !2)
!1348 = !DILocalVariable(name: "d_logTable", arg: 3, scope: !2, file: !3, line: 54, type: !13)
!1349 = !DILocation(line: 54, column: 28, scope: !2)
!1350 = !DILocalVariable(name: "height", arg: 4, scope: !2, file: !3, line: 55, type: !16)
!1351 = !DILocation(line: 55, column: 7, scope: !2)
!1352 = !DILocalVariable(name: "width", arg: 5, scope: !2, file: !3, line: 55, type: !16)
!1353 = !DILocation(line: 55, column: 19, scope: !2)
!1354 = !DILocalVariable(name: "x", scope: !2, file: !3, line: 59, type: !1164)
!1355 = !DILocation(line: 59, column: 13, scope: !2)
!1356 = !DILocation(line: 53, column: 3, scope: !1167, inlinedAt: !1357)
!1357 = distinct !DILocation(line: 59, column: 17, scope: !2)
!1358 = !DILocation(line: 66, column: 3, scope: !1170, inlinedAt: !1359)
!1359 = distinct !DILocation(line: 59, column: 31, scope: !2)
!1360 = !DILocation(line: 79, column: 3, scope: !1173, inlinedAt: !1361)
!1361 = distinct !DILocation(line: 59, column: 44, scope: !2)
!1362 = !DILocation(line: 59, column: 42, scope: !2)
!1363 = !DILocation(line: 59, column: 29, scope: !2)
!1364 = !DILocalVariable(name: "y", scope: !2, file: !3, line: 60, type: !1164)
!1365 = !DILocation(line: 60, column: 13, scope: !2)
!1366 = !DILocation(line: 54, column: 3, scope: !1180, inlinedAt: !1367)
!1367 = distinct !DILocation(line: 60, column: 17, scope: !2)
!1368 = !DILocation(line: 67, column: 3, scope: !1183, inlinedAt: !1369)
!1369 = distinct !DILocation(line: 60, column: 31, scope: !2)
!1370 = !DILocation(line: 80, column: 3, scope: !1186, inlinedAt: !1371)
!1371 = distinct !DILocation(line: 60, column: 44, scope: !2)
!1372 = !DILocation(line: 60, column: 42, scope: !2)
!1373 = !DILocation(line: 60, column: 29, scope: !2)
!1374 = !DILocation(line: 61, column: 7, scope: !1375)
!1375 = distinct !DILexicalBlock(scope: !2, file: !3, line: 61, column: 7)
!1376 = !DILocation(line: 61, column: 12, scope: !1375)
!1377 = !DILocation(line: 61, column: 9, scope: !1375)
!1378 = !DILocation(line: 61, column: 19, scope: !1375)
!1379 = !DILocation(line: 61, column: 22, scope: !1375)
!1380 = !DILocation(line: 61, column: 27, scope: !1375)
!1381 = !DILocation(line: 61, column: 24, scope: !1375)
!1382 = !DILocation(line: 61, column: 7, scope: !2)
!1383 = !DILocation(line: 61, column: 34, scope: !1375)
!1384 = !DILocalVariable(name: "idx", scope: !2, file: !3, line: 63, type: !1164)
!1385 = !DILocation(line: 63, column: 13, scope: !2)
!1386 = !DILocation(line: 54, column: 3, scope: !1180, inlinedAt: !1387)
!1387 = distinct !DILocation(line: 63, column: 19, scope: !2)
!1388 = !DILocation(line: 63, column: 30, scope: !2)
!1389 = !DILocation(line: 53, column: 3, scope: !1167, inlinedAt: !1390)
!1390 = distinct !DILocation(line: 63, column: 41, scope: !2)
!1391 = !DILocation(line: 63, column: 39, scope: !2)
!1392 = !DILocalVariable(name: "i", scope: !1393, file: !3, line: 65, type: !16)
!1393 = distinct !DILexicalBlock(scope: !2, file: !3, line: 65, column: 3)
!1394 = !DILocation(line: 65, column: 11, scope: !1393)
!1395 = !DILocation(line: 65, column: 7, scope: !1393)
!1396 = !DILocation(line: 65, column: 18, scope: !1397)
!1397 = distinct !DILexicalBlock(scope: !1393, file: !3, line: 65, column: 3)
!1398 = !DILocation(line: 65, column: 20, scope: !1397)
!1399 = !DILocation(line: 65, column: 3, scope: !1393)
!1400 = !DILocation(line: 65, column: 39, scope: !1397)
!1401 = !DILocation(line: 65, column: 30, scope: !1397)
!1402 = !DILocation(line: 65, column: 42, scope: !1397)
!1403 = !DILocation(line: 65, column: 47, scope: !1397)
!1404 = !DILocation(line: 65, column: 26, scope: !1397)
!1405 = !DILocation(line: 65, column: 3, scope: !1397)
!1406 = distinct !{!1406, !1399, !1407, !1219}
!1407 = !DILocation(line: 65, column: 49, scope: !1393)
!1408 = !DILocalVariable(name: "total", scope: !2, file: !3, line: 67, type: !12)
!1409 = !DILocation(line: 67, column: 8, scope: !2)
!1410 = !DILocalVariable(name: "dy", scope: !1411, file: !3, line: 68, type: !16)
!1411 = distinct !DILexicalBlock(scope: !2, file: !3, line: 68, column: 3)
!1412 = !DILocation(line: 68, column: 11, scope: !1411)
!1413 = !DILocation(line: 68, column: 7, scope: !1411)
!1414 = !DILocation(line: 68, column: 20, scope: !1415)
!1415 = distinct !DILexicalBlock(scope: !1411, file: !3, line: 68, column: 3)
!1416 = !DILocation(line: 68, column: 23, scope: !1415)
!1417 = !DILocation(line: 68, column: 3, scope: !1411)
!1418 = !DILocalVariable(name: "dx", scope: !1419, file: !3, line: 69, type: !16)
!1419 = distinct !DILexicalBlock(scope: !1420, file: !3, line: 69, column: 5)
!1420 = distinct !DILexicalBlock(scope: !1415, file: !3, line: 68, column: 35)
!1421 = !DILocation(line: 69, column: 13, scope: !1419)
!1422 = !DILocation(line: 69, column: 9, scope: !1419)
!1423 = !DILocation(line: 69, column: 22, scope: !1424)
!1424 = distinct !DILexicalBlock(scope: !1419, file: !3, line: 69, column: 5)
!1425 = !DILocation(line: 69, column: 25, scope: !1424)
!1426 = !DILocation(line: 69, column: 5, scope: !1419)
!1427 = !DILocalVariable(name: "xx", scope: !1428, file: !3, line: 70, type: !16)
!1428 = distinct !DILexicalBlock(scope: !1424, file: !3, line: 69, column: 37)
!1429 = !DILocation(line: 70, column: 11, scope: !1428)
!1430 = !DILocation(line: 70, column: 16, scope: !1428)
!1431 = !DILocation(line: 70, column: 20, scope: !1428)
!1432 = !DILocation(line: 70, column: 18, scope: !1428)
!1433 = !DILocalVariable(name: "yy", scope: !1428, file: !3, line: 71, type: !16)
!1434 = !DILocation(line: 71, column: 11, scope: !1428)
!1435 = !DILocation(line: 71, column: 16, scope: !1428)
!1436 = !DILocation(line: 71, column: 20, scope: !1428)
!1437 = !DILocation(line: 71, column: 18, scope: !1428)
!1438 = !DILocation(line: 73, column: 10, scope: !1439)
!1439 = distinct !DILexicalBlock(scope: !1428, file: !3, line: 73, column: 10)
!1440 = !DILocation(line: 73, column: 13, scope: !1439)
!1441 = !DILocation(line: 73, column: 18, scope: !1439)
!1442 = !DILocation(line: 73, column: 21, scope: !1439)
!1443 = !DILocation(line: 73, column: 24, scope: !1439)
!1444 = !DILocation(line: 73, column: 29, scope: !1439)
!1445 = !DILocation(line: 73, column: 32, scope: !1439)
!1446 = !DILocation(line: 73, column: 37, scope: !1439)
!1447 = !DILocation(line: 73, column: 35, scope: !1439)
!1448 = !DILocation(line: 73, column: 44, scope: !1439)
!1449 = !DILocation(line: 73, column: 47, scope: !1439)
!1450 = !DILocation(line: 73, column: 52, scope: !1439)
!1451 = !DILocation(line: 73, column: 50, scope: !1439)
!1452 = !DILocation(line: 73, column: 10, scope: !1428)
!1453 = !DILocation(line: 74, column: 18, scope: !1454)
!1454 = distinct !DILexicalBlock(scope: !1439, file: !3, line: 73, column: 59)
!1455 = !DILocation(line: 74, column: 24, scope: !1454)
!1456 = !DILocation(line: 74, column: 27, scope: !1454)
!1457 = !DILocation(line: 74, column: 26, scope: !1454)
!1458 = !DILocation(line: 74, column: 33, scope: !1454)
!1459 = !DILocation(line: 74, column: 32, scope: !1454)
!1460 = !DILocation(line: 74, column: 9, scope: !1454)
!1461 = !DILocation(line: 74, column: 38, scope: !1454)
!1462 = !DILocation(line: 74, column: 42, scope: !1454)
!1463 = !DILocation(line: 75, column: 14, scope: !1454)
!1464 = !DILocation(line: 76, column: 7, scope: !1454)
!1465 = !DILocation(line: 77, column: 5, scope: !1428)
!1466 = !DILocation(line: 69, column: 33, scope: !1424)
!1467 = !DILocation(line: 69, column: 5, scope: !1424)
!1468 = distinct !{!1468, !1426, !1469, !1219}
!1469 = !DILocation(line: 77, column: 5, scope: !1419)
!1470 = !DILocation(line: 78, column: 3, scope: !1420)
!1471 = !DILocation(line: 68, column: 31, scope: !1415)
!1472 = !DILocation(line: 68, column: 3, scope: !1415)
!1473 = distinct !{!1473, !1417, !1474, !1219}
!1474 = !DILocation(line: 78, column: 3, scope: !1411)
!1475 = !DILocalVariable(name: "entropy", scope: !2, file: !3, line: 80, type: !8)
!1476 = !DILocation(line: 80, column: 9, scope: !2)
!1477 = !DILocalVariable(name: "k", scope: !1478, file: !3, line: 81, type: !16)
!1478 = distinct !DILexicalBlock(scope: !2, file: !3, line: 81, column: 3)
!1479 = !DILocation(line: 81, column: 11, scope: !1478)
!1480 = !DILocation(line: 81, column: 7, scope: !1478)
!1481 = !DILocation(line: 81, column: 18, scope: !1482)
!1482 = distinct !DILexicalBlock(scope: !1478, file: !3, line: 81, column: 3)
!1483 = !DILocation(line: 81, column: 20, scope: !1482)
!1484 = !DILocation(line: 81, column: 3, scope: !1478)
!1485 = !DILocation(line: 82, column: 16, scope: !1482)
!1486 = !DILocation(line: 82, column: 36, scope: !1482)
!1487 = !DILocation(line: 82, column: 27, scope: !1482)
!1488 = !DILocation(line: 82, column: 39, scope: !1482)
!1489 = !DILocation(line: 82, column: 13, scope: !1482)
!1490 = !DILocation(line: 82, column: 5, scope: !1482)
!1491 = !DILocation(line: 81, column: 27, scope: !1482)
!1492 = !DILocation(line: 81, column: 3, scope: !1482)
!1493 = distinct !{!1493, !1484, !1494, !1219}
!1494 = !DILocation(line: 82, column: 43, scope: !1478)
!1495 = !DILocation(line: 84, column: 13, scope: !2)
!1496 = !DILocation(line: 84, column: 23, scope: !2)
!1497 = !DILocation(line: 84, column: 21, scope: !2)
!1498 = !DILocation(line: 84, column: 39, scope: !2)
!1499 = !DILocation(line: 491, column: 32, scope: !1323, inlinedAt: !1500)
!1500 = distinct !DILocation(line: 84, column: 31, scope: !2)
!1501 = !DILocation(line: 491, column: 62, scope: !1323, inlinedAt: !1500)
!1502 = !DILocation(line: 491, column: 46, scope: !1323, inlinedAt: !1500)
!1503 = !DILocation(line: 84, column: 29, scope: !2)
!1504 = !DILocation(line: 84, column: 11, scope: !2)
!1505 = !DILocation(line: 85, column: 26, scope: !2)
!1506 = !DILocation(line: 85, column: 3, scope: !2)
!1507 = !DILocation(line: 85, column: 13, scope: !2)
!1508 = !DILocation(line: 85, column: 15, scope: !2)
!1509 = !DILocation(line: 85, column: 14, scope: !2)
!1510 = !DILocation(line: 85, column: 21, scope: !2)
!1511 = !DILocation(line: 85, column: 20, scope: !2)
!1512 = !DILocation(line: 85, column: 24, scope: !2)
!1513 = !DILocation(line: 86, column: 1, scope: !2)
