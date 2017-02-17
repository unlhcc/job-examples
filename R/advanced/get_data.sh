#!/bin/sh
###############################################################################
# This script downloads the 2009 Data Expo airline on-time performance dataset 
# files, uncompresses them, and concatenates them into one file with the header 
# intact.
# 
# Source: http://www.bytemining.com/2010/08/taking-r-to-the-limit-part-ii-large-datasets-in-r/
###############################################################################
# This script makes 2 assumptions:
# 1) Bash is located at /bin/bash, if not, change the shebang.
# 2) wget is installed on your system.
# 3) THERE ARE NO OTHER FILES NAMED 19...csv or 20...csv IN THE DIRECTORY!
###############################################################################

mkdir data
cd data

for ((i=1987; i <= 2008 ; i++))
do
	wget http://stat-computing.org/dataexpo/2009/$i.csv.bz2 &
done

wait

for ((i=1987; i <= 2008 ; i++))
do
        bunzip2 $i.csv.bz2 &
done

wait

head -1 1987.csv >> header.tmp
tail --lines=+2 -q *.csv >airline.tmp
cat header.tmp airline.tmp >airline.csv

for ((i=1987; i <= 2008; i++))
do
	rm $i.csv &
done

wait

rm header.tmp airline.tmp
