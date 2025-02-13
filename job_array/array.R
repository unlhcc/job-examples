ARRAY_TASK_ID <- Sys.getenv("SLURM_ARRAY_TASK_ID")

for (i in 1:5) {
	print(paste("Hello from the for loop in job array index ", ARRAY_TASK_ID, "!"))
}
