Script for counting the file last hour
-------------

#!/bin/sh
NOW=$(date +%H)
date=$(date)
temp=1
ans=$(($NOW-$temp))
cd <go to perticular path>
count=$(cat <File_name>.csv |grep "^$ans:.*lif"|wc -l)
echo "The incomming traffic count at $date is $count" >> count.txt


Here, 
Lif is file format. 
^ is for indicating the starting charachter.

==================================================================
For previous 3-4 hours:
---------------------

#!/bin/bash
cd /appl/
NOW=$(date +"%m-%d-%Y %T")
count=$(cat <file_name>.csv* | grep ".lif" | wc -l)
cd /appl/
echo -e  "Incoming lif count at $NOW is $count " >>  gway_count.txt
echo "Incoming lif count at $NOW is $count"

---------------------------------------------------------------------
