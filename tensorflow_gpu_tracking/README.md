# Track GPU Performance for a GPU-enabled TensorFlow job in HCC

This script submits a basic "Hello World" TensorFlow job to GPU resources, with GPU performance tracking enabled via `nvidia-smi`.
This script can be modified to submit other GPU-enabled jobs by changing the module(s) and running script(s).

To submit this job, use the command `sbatch tf-example-nvidia-smi.submit`.
