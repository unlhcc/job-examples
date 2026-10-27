#!/bin/bash

module load python/3.12
module load all-pkgs 

python ./rosen_brock_brute_opt.py  $1 $2 $3 $4
