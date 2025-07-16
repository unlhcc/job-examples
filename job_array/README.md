# Using job arrays

The included example will run through 5 indices, showing variations in languages using the `$SLURM_ARRAY_TASK_ID` variable. 
The `$SLURM_ARRAY_TASK_ID` is the index of the job array that the secondary job is running. This can be used to index over multiple files, test cases, input combinations, or other expiremental factors.

Details on how to customize the array indexing is available in Slurm's documentation: https://slurm.schedmd.com/job_array.html 
