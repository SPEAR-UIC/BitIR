Fresh Frontier AMD remap notes from local `sites_metadata.csv`.

Rows with exact semantic matches:
- `entropy` aligned indices `273`, `260`
- `randomAccess` aligned indices `65`, `837`, `870`, `804`

Rows using a unique one-line local source rebase under fresh HIP debug info:
- `layout` aligned index `161`: manifest `icmp` at `46:20` -> fresh local `45:20`
- `layout` aligned index `498`: manifest `add` at `46:33` -> fresh local `45:33`
- `layout` aligned index `530`: manifest `load` at `50:17` -> fresh local `49:17`
- `layout` aligned index `753`: manifest `add` at `58:38` -> fresh local `57:38`
- `randomAccess` aligned index `99`: manifest `load` at `27:19` -> fresh local `26:19`

Preflight proof run:
- `randomAccess` aligned index `65`, bit `0`
- fresh local AMD `site_id=51`
- semantic row: `icmp`, line `27`, column `12`, function `_Z11HPCC_startsx`, `result`, `int`, `bitwidth=1`, `signature_ordinal=2`
- `compare_mode=exact`
