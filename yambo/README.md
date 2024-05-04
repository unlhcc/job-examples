Example job script for [YAMBO](https://github.com/yambo-code/yambo).

YAMBO number of cores are specified in the input .in file and the SLURM script.
There are multiple keywords in the YAMBO input file that need to be modified to support multiple cores.
More detailed information is available [here](https://www.yambo-code.eu/wiki/index.php/Using_Yambo_in_parallel).

This example runs 8 core parallel job with 2GBs of RAM per core.
Thus, the input file has:
```
SE_CPU= "1 2 4"                  # [PARALLEL] CPUs for each role
SE_ROLEs= "q qp b"               # [PARALLEL] CPUs roles (q,qp,b)
```
