#!/usr/bin/python3
import sys

data = []

for line in sys.stdin:
    if line.strip() != "":
        data.append(line.strip())

assert len(data) == 2

N = int(data[0])
assert 1 <= N <= 9

days = list(map(int, data[1].split()))
assert len(days) == N

assert all(0 <= day <= 10 for day in days)

sys.exit(42)
