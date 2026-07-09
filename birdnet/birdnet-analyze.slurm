#!/bin/bash
#SBATCH --job-name=birdnet-analyze
#SBATCH --partition=batch
#SBATCH --nodes=1
#SBATCH --ntasks-per=node=4
#SBATCH --time=03:00:00
#SBATCH --mem=8G
#SBATCH --output=birdnet-analyze.%j.out
#SBATCH --error=birdnet-analyze.%j.err

module purge
module load apptainer

# Everything lives under one parent directory, but as separate subfolders.
# DATA_DIR (audio/) is the ONLY thing bound to /data, so the downloaded
# model and logs never get scanned as input audio.
BASE_DIR=/home/<GROUP>/<USERNAME>/birdnet_example
CHECKPOINTS_DIR="$BASE_DIR/checkpoints"
DATA_DIR="$BASE_DIR/audio"
LOGS_DIR="$BASE_DIR/logs"

mkdir -p "$CHECKPOINTS_DIR" "$DATA_DIR" "$LOGS_DIR"

apptainer exec \
  --writable-tmpfs \
  --bind "$CHECKPOINTS_DIR":/app/birdnet/birdnet_analyzer/checkpoints \
  --bind "$DATA_DIR":/data \
  docker://unlhcc/birdnet-analyzer \
  python3 -m birdnet_analyzer.analyze /data \
  -o /data \
  --slist /data \
  --min_conf 0.5 \
  --threads "$SLURM_CPUS_PER_TASK"
