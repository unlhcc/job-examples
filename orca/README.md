Example job script for [ORCA](https://orcaforum.kofo.mpg.de/app.php/portal).

ORCA memory and number of cores are specified in the input .inp file and the SLURM script.
The PAL keyword defines the number of cores; the MAXCORE keyword defines the memory per core in MBs.

This example runs 8 core parallel job with 2GBs of RAM per core.
Thus, the input file has:
```
%maxcore 2000
%PAL NPROCS 8 END
```
