#!/usr/bin/env python3
import argparse
import csv


FIELDS = [
    "run_label", "record_kind", "record_index", "t", "iteration", "bx", "tx",
    "expected_small_block_cols", "actual_small_block_cols", "blkX", "blkXmax",
    "xidx", "validXmin", "validXmax", "isValid", "computed", "final_write",
    "index", "value", "total_computed_threads", "total_final_writes",
    "records_captured", "records_truncated",
]


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--summary", required=True)
    parser.add_argument("--records", required=True)
    parser.add_argument("--output", required=True)
    args = parser.parse_args()
    summary = next(csv.DictReader(open(args.summary, newline="", encoding="utf-8")))
    records = list(csv.DictReader(open(args.records, newline="", encoding="utf-8")))
    label = summary["phase"]
    with open(args.output, "w", newline="", encoding="utf-8") as handle:
        writer = csv.DictWriter(handle, fieldnames=FIELDS, lineterminator="\n")
        writer.writeheader()
        for index, row in enumerate(records):
            writer.writerow({
                "run_label": label, "record_kind": "detail", "record_index": index,
                "t": row["t"], "iteration": row["iteration"], "bx": row["bx"], "tx": row["tx"],
                "expected_small_block_cols": row["expected_small_block_cols_64"],
                "actual_small_block_cols": row["actual_small_block_cols_32"],
                "blkX": row["actual_blkX_32"], "blkXmax": row["actual_blkXmax_32"],
                "xidx": row["actual_xidx_32"], "validXmin": row["validXmin"],
                "validXmax": row["validXmax"], "isValid": row["isValid"],
                "computed": row["computed"], "final_write": row["final_write_executed"],
                "index": row["final_write_index"], "value": row["final_write_value"],
            })
        writer.writerow({
            "run_label": label, "record_kind": "aggregate",
            "total_computed_threads": summary["computed_threads"],
            "total_final_writes": summary["final_writing_threads"],
            "records_captured": summary["detail_records"],
            "records_truncated": summary["dropped_detail_records"],
        })


if __name__ == "__main__":
    main()
