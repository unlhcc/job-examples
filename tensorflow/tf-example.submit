#!/bin/bash
#SBATCH --job-name=tensorflow_gpu_example
#SBATCH --ntasks=4
#SBATCH --mem=4g
#SBATCH --time=00:15:00
#SBATCH --error=tf_job.%J.err
#SBATCH --output=tf_job.%J.out
#SBATCH --partition=gpu
#SBATCH --gres=gpu

module purge
module load tensorflow-gpu/py39/2.9

python tf_hello.py
