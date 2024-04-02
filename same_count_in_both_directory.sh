##Count in good directory and log directory is same or not.



#!/bin/bash
cd /appl/virtuo/var/loader/spool/nokiagsmbss_rg20/RG20/good
count1=$(ls |wc -l) 
cd /appl/virtuo/var/loader/spool/nokiagsmbss_rg20/RG20/
echo $count1 >> good_count.txt
/appl/virtuo/logs/loader
count2=$(cat 'nokiagsmbss_rg20_stat.txt' | tr ' ' '\n' |grep --count "processing")
cd /appl/virtuo/var/loader/spool/nokiagsmbss_rg20/RG20/
echo $count2 >> txt_count.txt
echo “Count is successfully taken by script”
echo "Count of lif good directory is : $count1"
echo "Count from loader_stat file is : $count2"
