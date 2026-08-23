# -*- coding: utf-8 -*-
"""
Utility script to optimize, analyze, vacuum, and verify integrity of the SQLite dictionary database.
Usage:
    python scripts/database/optimize_dictionaries.py
"""

import os
import sqlite3
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
DATABASES = ["dictionary_en_vi.db"]


def optimize_db(db_name: str):
    db_path = ROOT / db_name
    if not db_path.exists():
        print(f"[-] Skipped: {db_name} (file not found)")
        return

    size_before = os.path.getsize(db_path)
    print(f"\n=== Optimizing {db_name} ===")
    print(f"Initial size: {size_before:,} bytes ({size_before / (1024 * 1024):.2f} MB)")

    conn = sqlite3.connect(db_path)
    cur = conn.cursor()

    print("Running PRAGMA optimize...")
    cur.execute("PRAGMA optimize;")

    print("Running ANALYZE...")
    cur.execute("ANALYZE;")

    print("Running VACUUM...")
    cur.execute("VACUUM;")

    print("Running PRAGMA integrity_check...")
    check = cur.execute("PRAGMA integrity_check;").fetchall()
    integrity_ok = len(check) == 1 and check[0][0] == "ok"
    print(f"Integrity check: {'OK' if integrity_ok else 'FAILED: ' + str(check)}")

    conn.close()

    size_after = os.path.getsize(db_path)
    saved = size_before - size_after
    print(f"Final size:   {size_after:,} bytes ({size_after / (1024 * 1024):.2f} MB)")
    print(f"Freed space:  {saved:,} bytes ({saved / (1024 * 1024):.2f} MB)")


def main():
    try:
        sys.stdout.reconfigure(encoding="utf-8")
    except Exception:
        pass
    print("Starting database optimization pipeline...")
    for db_name in DATABASES:
        optimize_db(db_name)
    print("\nDatabase optimization completed successfully!")


if __name__ == "__main__":
    main()
