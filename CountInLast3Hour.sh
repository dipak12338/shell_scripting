for each hour
-------------

#!/bin/sh
NOW=$(date +%H)
date=$(date)
temp=1
ans=$(($NOW-$temp))
cd /appl/Etisalat
count=$(cat huaweiumtsutran_v100r012c10spc510_stat.csv |grep "^$ans:.*lif"|wc -l)
cd /appl/Etisalat
echo "The incomming traffic count at $date is $count" >> count.txt

==================================================================
For previous 3-4 hours:
---------------------

#!/bin/bash
cd /appl/
NOW=$(date +"%m-%d-%Y %T")
count=$(cat huaweiumtsutran_v100r012c10spc510_stat.csv* | grep ".lif" | wc -l)
cd /appl/
echo -e  "Incoming lif count at $NOW is $count " >>  gway_count.txt
echo "Incoming lif count at $NOW is $count"

---------------------------------------------------------------------
