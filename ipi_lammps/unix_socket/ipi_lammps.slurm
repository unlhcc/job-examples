#!/bin/bash
#SBATCH --job-name=ipi_lammps_example
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=20
#SBATCH --mem-per-cpu=10GB
#SBATCH --time=168:00:00
#SBATCH --error=ipi_lammps_job.%J.err
#SBATCH --output=ipi_lammps_job.%J.out

# Test data used from https://github.com/i-pi/i-pi/tree/c6d1ec69664860d41d2f0811359284e32e8c391b/examples/clients/lammps/h2o-pimd.4
# UNIX socket requries for i-PI and lammps to run on the same node

# <total_time> setting inside input.xml should specify number of seconds smaller than the time requested via SLURM with --time

module purge
module load compiler/gcc/11 openmpi/4.1 lammps/23June2022

# print i-pi log
export PYTHONUNBUFFERED=1

# for no CUDA support set
export PSM2_CUDA=0
# for CUDA support set
# export PSM2_CUDA=1

HOST=$(hostname)

# UNIX socket requires only address modification
sed -i "s/address>[^<]*</address>$HOST</" input.xml
i-pi input.xml &> log.ipi &
sleep 20

# UNIX socket requires only address modification
sed -i "s/localhost/$HOST/" in.lmp
# This will start 20 lammps jobs with --mem-per-cpu=10G on the same node where i-pi is running
# UNIX socket requries for i-pi and lammps to run on the same node
mpirun `which lmp` < in.lmp > lammps.out
