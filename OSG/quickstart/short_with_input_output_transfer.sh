#!/bin/bash
# short.sh: a short discovery job
printf "Start time: "; /bin/date
printf "Job is running on node: "; /bin/hostname
printf "Job running as user: "; /usr/bin/id
printf "Job is running in directory: "; /bin/pwd
printf "The command line argument is: "; echo $1
printf "Contents of $1 is "; cat $1
cat $1 > output.txt
printf "Working hard..."
ls -l $PWD
sleep 20
echo "Science complete!"
