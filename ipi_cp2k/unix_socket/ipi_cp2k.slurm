#!/bin/bash
#SBATCH --job-name=ipi_cp2k_example
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=20
#SBATCH --mem-per-cpu=10GB
#SBATCH --time=168:00:00
#SBATCH --error=ipi_cp2k_job.%J.err
#SBATCH --output=ipi_cp2k_job.%J.out

# Test data used from https://github.com/i-pi/tutorials-schools/tree/main/tutorial-1/ex-2
# Run i-PI with UNIX socket, https://www.cp2k.org/howto:ipi
# UNIX socket requries for i-PI and cp2k to run on the same node

# <total_time> setting inside input.xml should specify number of seconds smaller than the time requested via SLURM with --time

module purge
module load i-pi/py39/2.4
module load compiler/gcc/10 openmpi/4.1 cp2k/9.1

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
sed -i "s/HOST.*/HOST $HOST/" cp2k.in
# This will start 20 cp2k jobs with --mem-per-cpu=10G on the same node where i-pi is running
# UNIX socket requries for i-pi and cp2k to run on the same node
mpirun `which cp2k` -i cp2k.in -o cp2k.out
