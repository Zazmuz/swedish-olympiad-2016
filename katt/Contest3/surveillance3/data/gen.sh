#!/bin/bash
PPATH=$(realpath ..)
. ../../../../testdata_tools/gen.sh


use_solution ../johan.cpp

compile random_generator.py # Arguments: N M lim1 lim2 (yes/no) seed
compile flat_generator.py # Arguments: N M K1 K2 I1 I2 seed

samplegroup
sample 1

group 1-equal 7
tc equal1 random_generator 500 500 5e8 2e8 yes
tc equal2 random_generator 800 800 5e8 2e8 yes
tc equal3 random_generator 1000 1000 5e8 2e8 yes
tc equal4 random_generator 1000 1000 5e8 2e8 yes
tc equal5 random_generator 1000 1000 5e8 2e8 no

# values <= 1
group 2-binary 14
tc flat1 flat_generator 800 300 1 0 1 0
tc flat2 flat_generator 1000 500 2 0 0 1
tc flat3 flat_generator 1000 500 20 1 1 1
tc binary1 random_generator 800 300 2 0 no
tc binary2 random_generator 1000 500 2 0 no
tc binary3 random_generator 1000 300 2 0 yes
tc binary4 random_generator 1000 500 2 0 yes
tc binary5 random_generator 1000 500 2 0 yes
tc binary6 random_generator 1000 700 2 0 yes

# values < 128
group 3-ascii 24
include_group 2-binary
tc 1
tc asciiflat1 flat_generator 1000 500 2 0 2 8
tc ascii1 random_generator 800 300 8 4 no
tc ascii2 random_generator 1000 500 8 4 no
tc ascii3 random_generator 1000 300 8 4 yes
tc ascii4 random_generator 1000 500 8 4 yes
tc ascii5 random_generator 1000 500 2 7 yes
tc ascii6 random_generator 1000 500 2 1 yes
tc ascii7 random_generator 1000 700 8 4 yes

# values <= 10^9
group 4-full 55
include_group 1-equal
include_group 3-ascii
tc fullflat1 flat_generator 1000 500 2 0 8 536870912
tc full1 random_generator 800 300 5e8 2e8 no
tc full2 random_generator 1000 500 5e8 2e8 no
tc full3 random_generator 1000 300 5e8 2e8 yes
tc full4 random_generator 1000 500 5e8 2e8 yes
tc full5 random_generator 1000 500 2 4e8 yes
tc full6 random_generator 1000 700 5e8 2e8 yes
