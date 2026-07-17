# Original Intel campaign artifacts

Collected on Aurora for divergence realignment. This tree intentionally excludes selected-case reruns, debug traces, top10 outputs, oneoff traces, paper-derived case lists, build directories, dumps, binaries, and later exploratory/debug-scale result roots as evidence.

Each benchmark directory contains the original Intel site inventory (`sites.csv`, `sites_metadata.csv`), worklists where present, normalized SYCL result tables from acceptable original-campaign sources where found, and benchmark-local phase summaries where available.

`artifact_inventory.csv` records source path, copied path, row count, header, SHA-256, and whether a file was regenerated. `benchmark_status.csv` records remaining gaps. No `sites_metadata.csv` files were regenerated because all eight were present.

Known gap: layout normalized SYCL outcome tables were not copied because the only normalized tables found locally were under `layout-sycl-debugscale-r1`, which is treated as later/debug-scale evidence rather than original campaign evidence.
