import time

for i in range(1,5):
	time.sleep(60)
	if (i == 1):
		print(str(i) + " minute has elapsed.")
	else:
		print(str(i) + " minutes have elapsed.")
print("Hello World!")
