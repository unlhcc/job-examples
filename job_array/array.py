import time
import os

ARRAY_TASK_ID = os.getenv('SLURM_ARRAY_TASK_ID')

for i in range(1,5):
	time.sleep(60)
	if (i == 1):
		print(f'{i} minute has elapsed in task {ARRAY_TASK_ID}.')
	else:
		print(f'{i} minutes have elapsed in task {ARRAY_TASK_ID}.')
print("Hello World!")
