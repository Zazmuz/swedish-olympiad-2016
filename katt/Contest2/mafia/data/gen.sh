#!/bin/bash
PPATH=$(realpath ..)
. ../../../../testdata_tools/gen.sh


use_solution ../sol.cpp

compile gen.py # Arguments: comps n m g seed

samplegroup
sample 1

# N <= 20, M <= 30, G <= 2,000
group 1-tiny 11
tc 1
tc tiny-1 gen 1 20 30 2000
tc tiny-2 gen 5 20 30 2000
tc tiny-3 gen 10 20 30 2000
tc tiny-4 gen 19 20 30 2000

# N <= 2,000, M <= 70,000, G <= 2,000. The graph is connected.
group 2-connected 13
tc connected-1 gen 1 2 70000 2000
tc connected-2 gen 1 2 70000 2000
tc connected-3 gen 1 2 70000 2000
tc connected-4 gen 1 2000 70000 2000

# N <= 2,000, M <= 70,000, G <= 1
group 3-singlequery 22
tc singlequery-1 gen 1 2000 70000 1
tc singlequery-2 gen 50 2000 70000 1
tc singlequery-6 gen 70 2000 70000 1
tc singlequery-4 gen 1999 2000 70000 1
tc singlequery-5 gen 1999 2000 70000 1

# N <= 100, M <= 10,000, G <= 200
group 4-medium 21
tc medium-1 gen 1 100 10000 200
tc medium-2 gen 10 100 10000 200
tc medium-3 gen 40 100 10000 200
tc medium-4 gen 99 100 10000 200

# N <= 2,000, M <= 70,000, G <= 2,000
group 5-large 33
include_group 1-tiny
include_group 4-medium
include_group 3-singlequery
include_group 2-connected
tc large-1 gen 1 2000 70000 2000
tc large-2 gen 50 2000 70000 2000
tc large-3 gen 100 2000 70000 2000
tc large-4 gen 1999 2000 70000 2000
