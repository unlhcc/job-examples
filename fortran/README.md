# Submit a Fortran job on HCC

Before submitting the job please compile Fortran code with : 
```
module load compiler/gcc/11
gfortran demo_f_serial.f90 -o demo_f_serial.x

```
or 
```
module load compiler/gcc/11 openmpi/4.1
mpif90 demo_f_mpi.f90 -o demo_f_mpi.x
```
