//Script to count the proccesed file in 24 hours.



#!/bin/bash  
cd /appl/performance_issue_with_loaders/loader
for ((i=0; i < 24; i++))
do
count=$(cat <file_name>.log.2023-03-01-$i* | grep "response \[OK]" | wc -l)
echo "Count at $i : " $count
done
