//Shell Script for checking the pattern
//in multiple files how we can calculate the pattern hourly?


#!/bin/bash
NOW=$(date +%H)
cd /appl/SlownessOfLoader_TelecomSerbia/26_jan_2023
for ((i=0; i < 24; i++))
do
#ans=$(($NOW-$temp))
count=$(cat ericssonlteeutranp_l22.log* |grep "^0$i:.*processing finished"|wc -l)
echo "Count at $i : " $count
done
