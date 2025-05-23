#!/bin/bash
PPATH=$(realpath ..)
. ../../../testdata_tools/gen.sh


use_solution generate_data.cpp

compile random_generator.py # Arguments: n l s j max_a seed
compile sequence_generator.py # Arguments: n l s j max_a seed

samplegroup
sample 1

group 1-small-brute 9
tc 1
tc small-brute-small-1 random_generator 10 11 1000 1000
tc small-brute-small-2 random_generator 10 11 1000 1000

tc small-brute-mid-1 random_generator 100 1000 1000 1000
tc small-brute-mid-2 random_generator 100 1000 1000 1000
tc small-brute-mid-3 random_generator 100 300 1000 1000
tc small-brute-mid-4 random_generator 100 300 1000 1000

tc small-brute-large-1 random_generator 500 1000 1000 1000
tc small-brute-large-2 random_generator 500 1000 1000 1000
tc small-brute-large-3 random_generator 700 1000 1000 1000
tc small-brute-large-4 random_generator 700 1000 1000 1000
tc small-brute-large-5 random_generator 1000 1000 1000 0
tc small-brute-large-6 sequence_generator 1000 1000 1000 0

group 2-small-scoring 17
tc small-scoring-small random_generator 50000 100000 1 0
tc small-scoring-mid random_generator 70000 100000 1 0
tc small-scoring-large random_generator 90000 100000 1 0
tc small-scoring-large-2 sequence_generator 90000 100000 1 0

group 3-large-scoring 14
include_group 2-small-scoring
tc large-scoring-small-1 random_generator 100000 10000000 1 0
tc large-scoring-small-2 sequence_generator 100000 10000000 1 0
tc large-scoring-mid-1 random_generator 100000 30000000 1 0
tc large-scoring-mid-2 sequence_generator 100000 30000000 1 0
tc large-scoring-large-1 random_generator 100000 1000000000 1 0
tc large-scoring-large-2 sequence_generator 100000 1000000000 1 0

group 4-mid-brute 38
include_group 1-small-brute
include_group 2-small-scoring
tc mid-brute-small random_generator 50000 100000 100000 100000
tc mid-brute-mid random_generator 70000 100000 100000 100000
tc mid-brute-large random_generator 90000 100000 100000 100000
tc mid-brute-large-2 sequence_generator 90000 100000 100000 100000

group 5-large-brute 22
include_group 4-mid-brute
include_group 3-large-scoring
tc large-brute-small-1 random_generator 100000 10000000 100000 100000
tc large-brute-small-2 sequence_generator 100000 10000000 100000 100000
tc large-brute-mid-1 random_generator 100000 30000000 100000 100000
tc large-brute-mid-2 sequence_generator 100000 30000000 100000 100000
tc large-brute-large-1 random_generator 100000 1000000000 100000 100000
tc large-brute-large-2 sequence_generator 100000 1000000000 100000 100000
