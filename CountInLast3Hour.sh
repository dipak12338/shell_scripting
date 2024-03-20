
Ex. Processed file in Last hour
-------------

#!/bin/sh
NOW=$(date +%H)                     #date in hour format- Ex. 23 
date=$(date)
temp=1
ans=$(($NOW-$temp))
cd <go to perticular path>              #working directory path
count=$(cat <Log_File_name>.csv |grep "^$ans:.*lif"|wc -l)
echo "The incomming traffic count at $date is $count" >> count.txt


Here, 
Lif is file format. Ex Loader input file. 
^ is for indicating the starting charachter.

<Log file.csv>
22:45:03,033 INFO  [LoaderAlarmCache] Sending alarm[new_test001], ObjectName[BS_1-2-1-1-2-1-1-TRX_1-2-1-1], Severity[Major], Value[1000] , Time [Tue Jan 08 21:30:00 IST 2019]
22:45:03,033 DEBUG [AlarmConnectionImpl] calling sendAlarms
22:45:03,034 DEBUG [AlarmConnectionImpl] Creating Object Message
22:45:03,034 DEBUG [AlarmConnectionImpl] setting message object for alarms
22:45:03,035 DEBUG [AlarmConnectionImpl] Creating a publisher
22:45:03,035 DEBUG [AlarmConnectionImpl] Publishing 




==================================================================
For previous 3-4 hours:
-------------------------

#!/bin/bash
cd /appl/
NOW=$(date +"%m-%d-%Y %T")
count=$(cat <file_name>.csv* | grep ".lif" | wc -l)
cd /appl/
echo -e  "Incoming lif count at $NOW is $count " >>  gway_count.txt
echo "Incoming lif count at $NOW is $count"
---------------------------------------------------------------------
