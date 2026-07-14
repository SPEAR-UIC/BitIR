#!/usr/bin/env python3
import argparse
import os


def main():
    parser = argparse.ArgumentParser(description="Exact binary compare.")
    parser.add_argument("golden")
    parser.add_argument("candidate")
    args = parser.parse_args()

    if not os.path.isfile(args.golden):
        print("golden_missing: %s" % args.golden)
        return 2
    if not os.path.isfile(args.candidate):
        print("candidate_missing: %s" % args.candidate)
        return 2

    size_g = os.path.getsize(args.golden)
    size_c = os.path.getsize(args.candidate)
    if size_g != size_c:
        print("size_mismatch: golden=%d candidate=%d" % (size_g, size_c))
        return 1

    bufsize = 1024 * 1024
    with open(args.golden, "rb") as fg, open(args.candidate, "rb") as fc:
        while True:
            gb = fg.read(bufsize)
            cb = fc.read(bufsize)
            if not gb and not cb:
                break
            if gb != cb:
                print("mismatch")
                return 1
    print("compare_ok")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
