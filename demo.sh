
#!/bin/bash
cd /appl/etisalat/
NOW=$(date +"%m-%d-%Y %T")
count=$(cat *huaweiumtsutran_v100r012c10spc510_stat.txt* |grep "processing" | wc -l)
echo -e  "Incoming lif count at $NOW is $count " >>  count.txt
echo "Incoming lif count at $NOW is $count"
echo ".................................................."


#!/bin/bash
cd /appl/etisalat/
NOW=$(date +"%m-%d-%Y %T")
count=$(cat *huaweiumtsutran_v100r012c10spc510_05* |grep "processing" | wc -l)
echo -e  "Incoming lif count at $NOW is $count " >>  count_all.txt
echo "Incoming lif count at $NOW is $count"
echo ".................................................."

Get files count from gateway log files
---------------------------

#!/bin/bash
cd /appl/virtuo/logs/loader/
NOW=$(date +"%m-%d-%Y %T")
count=$(cat 'nokiagsmbss_rg20_stat.txt'|grep --count "processing")
cd /appl/
echo -e  "Incoming lif count at $NOW is $count \n " >>  gway_count.txt
echo "Incoming lif count at $NOW is $count"
echo ".................................................."

===========================================
lif file count from gateway log files 
-------------------------------------
#!/bin/bash
cd /appl/virtuo/logs/gway/
NOW=$(date +"%m-%d-%Y %T")
count=$(cat 'nokiagsmbss_rg20_stat.txt' | tr ' ' '\n' |grep --count ".lif' copied")
echo $count >> gway_count.txt
echo "Incoming lif count at $NOW : $count "
echo "Count is successfully taken by script"

=========================================================
lif file count from good and loader.txt file

lif_count.sh
#!/bin/bash
cd /appl/virtuo/var/loader/spool/nokiagsmbss_rg20/RG20/good
count1=$(ls |wc -l) 
cd /appl/virtuo/var/loader/spool/nokiagsmbss_rg20/RG20/
echo $count1 >> good_count.txt
cd /appl/virtuo/logs/loader
count2=$(cat 'nokiagsmbss_rg20_stat.txt' | tr ' ' '\n' |grep --count "processing")
cd /appl/virtuo/var/loader/spool/nokiagsmbss_rg20/RG20/
echo $count2 >> txt_count.txt
echo “Count is successfully taken by script”
echo "Count of lif good directory is : $count1"
echo "Count from loader_stat file is : $count2"

=====================================================
count before processing lif(failed files)

processing.sh

#!/bin/bash
cd /appl/virtuo/var/loader/spool/nokiagsmbss_rg20/RG20/
count=$(ls *.lif |wc -l)
echo $count

===============================================

-rw-r--r--. 1 virtuo virtuo  5830389 Jul 29 20:59 nokiagsmbss_rg20_stat.txt

/appl/virtuo/logs/loader
cat 'nokiagsmbss_rg20_stat.txt' | tr ' ' '\n' |grep --count "processing"


========================
When the below script un run then it will generate a file with name as current date and time
Also it automatially changes the content with current time.
-

#!/bin/bash
cd /root/demo
pwd
date=$(date "+%Y%m%d%H%M")
cp PM_IG80112_15_202307141631.Z_01.csv PM_IG80112_15_$(date "+%Y%m%d%H%M").Z_01.csv
pwd
echo $(sed -r "s/([0-9]{1,2})\/([0-9]{2})\/([0-9]{4}) ([012][0-9]:[0-5][0-9])/$(date '+%Y\/%m\/%d %H:%M')/g" PM_IG80112_15_$(date "+%Y%m%d%H%M").Z_01.csv) > PM_IG80112_15_$(date "+%Y%m%d%H%M").Z_01.csv
echo "Data from crontab inserted"

=================================

=============||
Shell Script ||
=============||
Script to count the proccesed file in 24 hours.


#!/bin/bash  
cd /appl/performance_issue_with_loaders/loader
for ((i=0; i < 24; i++))
do
count=$(cat nc_cache.log.2023-03-01-$i* | grep "response \[OK]" | wc -l)
echo "Count at $i : " $count
done


---------------
This script is use to count the file with loading time.
All the fileas listed with processing time (in second).
Ex. There is file and it is taking 3 second for loading. 


Firstly, count=$(cat loader_ericsson_lte_1.log.2023-*  |grep -F "loading time [$i] sec"|wc -l) 
This command will count the file which are taking 0,1,2,3,4,5 seconds. And storet the values into count var.



#!/bin/bash
n=130
temp=0
cd /appl/performance_issue_with_loaders/loader
> count.txt
for ((i=0; i < n; i++))
do
        cd /appl/performance_issue_with_loaders/loader
        count=$(cat loader_ericsson_lte_1.log.2023-*  |grep -F "loading time [$i] sec"|wc -l)
                if [ $count -eq $temp ]
                then
                        cd /appl/dip/
                        echo "demo" >> count.txt
                        sed -i "/\bdemo\b/d" count.txt    ----Delete the line containing 'demo' string
                else
                        cd /appl/dip/
                        echo "The $i sec time taken by $count lifs" >> count.txt
                fi
done

Refer log file : loader_ericsson_lte_1.log.2023-03-01-00.1677628803290


==========================================================================================================

In only works for files those taking 10 sec or more than 10 seconds processing time.

Shell Script
#!/bin/bash
cd /appl/performance_issue_with_loaders/loader
for ((i=10; i < 200; i++))
do
count=$(cat loader_ericsson_lte_1.log* | grep -F "loading time [$i] sec"|wc -l)
echo "The $i sec time taken by $count lifs"
done

=======================================================


#!/bin/bash
NOW=$(date +%H)
cd /appl/performance_issue_with_loaders/nccachelog/
for ((i=0; i < 45; i++))
do
count=$(cat nc_cache.log.2023-03-01-00.167762* |grep "^2023-03-01 00:00:0$i"|wc -l)
echo "Count at $i : " $count
done

===================================================================
Count the files taking durations like 9500 sec to 10000 secs.


#!/bin/bash
temp=0
cd /appl/performance_issue_with_loaders/nccachelog/
for ((i=9500; i < 10000; i++))
do
count=$(cat  nc_cache.log.2023-03-01* |grep -F "duration [$i]" | wc -l)
if [ $count -eq $temp ]
then
        echo " "
else
echo "Count for $i : " $count
fi
done

=====================================================================================================

The following script is use to calculate how many lif files are come when we run lif generator.
count_new.sh

#!/bin/bash
old_count=$(cat "old_good_lif_count.txt")
echo "old_count = $old_count"                 #previous count of good lif file 9803
cd /appl/virtuo/var/loader/spool/nokiagsmbss_rg20/RG20/good
new_count=$(ls |wc -l)
echo "new_count = $new_count" 	              #current count of good lif file 6539(after  loading)
cd /appl/virtuo/var/loader/spool/nokiagsmbss_rg20/RG20/
echo "new_count = $new_count"
current=$(($new_count - $old_count))                      #13067 - 9803 = 3264
echo "$new_count - $old_count = $current"
echo $current >> new_good_lif_count.txt                # (updated each time)
truncate -s 0 old_good_lif_count.txt
echo $new_count >> old_good_lif_count.txt              #old_count=13067

=====================================================================================================


This script is use to count total number of lif file present in the good directory and store that value into one txt file. So we can use that value as variable.

good_lif_cnt.sh
#!/bin/bash
cd /appl/virtuo/var/loader/spool/nokiagsmbss_rg20/RG20/good
count=$(ls |wc -l) 
cd /appl/virtuo/var/loader/spool/nokiagsmbss_rg20/RG20/
truncate -s  0 old_good_lif_count.txt                              
echo $count >> old_good_lif_count.txt
echo “Count is successfully taken by script”


=====================================================================================================

This script is use to count total number of lif file present in the good directory and store that value into one txt file.

good_lif_count.sh
#!/bin/bash
cd /appl/virtuo/var/loader/spool/nokiagsmbss_rg20/RG20/good
count=$(ls |wc -l) 
cd /appl/virtuo/var/loader/spool/nokiagsmbss_rg20/RG20/
echo $count >> count_lif.txt
echo $count
echo “Count is successfully taken by script”

==============================

good_lif_cnt.sh

#!/bin/bash
cd /appl/virtuo/var/loader/spool/nokiagsmbss_rg20/RG20/good
count=$(ls |wc -l) 
cd /appl/virtuo/var/loader/spool/nokiagsmbss_rg20/RG20/
truncate -s 0 old_good_lif_count.txt
echo $count >> old_good_lif_count.txt
echo “Count is successfully taken by script”


truncate -s 0 good_lif_count.txt
echo > good_lif_count.txt (cancelled)
>good_lif_count.txt
:>good_lif_count.txt

=====================================================================================================


FIRST SCRIPT =========

#!/bin/bash
#Shell script to count lif files
HOST='10.55.236.113'
USER='virtuo'
PASSWD='Virtuo01'
echo "Host connected successfully..."
cd /appl/virtuo/var/loader/spool/nokiagsmbss_rg20/RG20/good
count=$(ls -lrt | wc -l)
echo $count
cd /appl/virtuo/var/loader/spool/nokiagsmbss_rg20/RG20/good
ls -lrt|wc -l >> lifcount.txt
mv lifcount.txt ../
rm -rf lifcount.txt
echo "Successfully take the count of lifs from good directory"

=====================================================================================================


GOOD COUNT STORED IN VAR===========

#!/bin/bash
cd /appl/virtuo/var/loader/spool/nokiagsmbss_rg20/RG20/good
count=$(ls |wc -l)
echo "This is good file count = $count"
cd /appl/virtuo/var/loader/spool/nokiagsmbss_rg20/RG20/
truncate -s 0 good_lif_count.txt
echo "file deleted successfully..."
echo $count >> good_lif_count.txt
echo “successfully take the count of lifs from good directory”


#!/bin/bash
cd /appl/virtuo/logs/loader/
NOW=$(date +"%m-%d-%Y %T")
count=$(cat '<loader_stats.csv*>' | grep "^$ans:.*lif" |wc -l)
cd /appl/
echo -e  "Incoming lif count at $NOW is $count \n ............." >>  lif_count.txt
echo "Incoming lif count at $NOW is $count"


Get files count from loader og files from all csv files for 10MB of data (for 4 hours of csv file)
---------------------------

#!/bin/bash
cd /appl/virtuo/logs/loader/
NOW=$(date +"%m-%d-%Y %T")
count=$(cat 'nokiagsmbss_rg20_stat.csv*'|grep ".lif" |wc -l)
cd /appl/
echo -e  "Incoming lif count at $NOW is $count \n ............." >>  lif_count.txt
echo "Incoming lif count at $NOW is $count"
echo ".................................................."
===========================================================
lif_count2.sh

#!/bin/bash
NOW=$(date +%H)                    
temp=1
ans=$(($NOW-$temp))                   
cd /appl/virtuo/logs/loader
count=$(cat nokiagsmbss_rg20_stat.csv* |grep "^$ans:.*lif"|wc -l)
echo $count


=========================================================
#!/bin/bash
NOW=$(date +%H)                    
temp=3
ans=$(($NOW+$temp))                   
cd /appl/virtuo/logs/loader
count=$(cat nokiagsmbss_rg20_stat.csv* |grep "^$ans:.*lif"|wc -l)
echo $count


The incomming traffic count at Tue Aug 9 <> IST 2022 is 484
The incomming traffic count at Tue Aug 9 <> IST 2022 is 483


'''
#!/bin/sh
NOW=$(date +%H)
date=$(date)
temp=1
ans=$(($NOW-$temp))
cd /appl/virtuo/logs/loader
count=$(cat nokiagsmbss_rg20_stat.csv* |grep "^$ans:.*lif"|wc -l)
cd /appl/virtuo/var/loader/spool/nokiagsmbss_rg20/RG20/
echo "The incomming traffic count at $date is $count" >> count.txt




lif_count.sh              --------------------  MAIN SCRIPT 


#!/bin/bash
NOW=$(date +%H)                                     
cd /appl/virtuo/logs/loader
for ((temp=0; temp < 3; temp++))
do
ans=$(($NOW-$temp))
count=$(cat nokiagsmbss_rg20_stat.csv* |grep "^$ans:.*lif"|wc -l)
echo $count


done

AIX
=====

#!/bin/bash
NOW=$(date +%H)
temp=0
ans=$(($NOW-$temp))
cd /appl/Etisalat
count=$(cat nokiagsmbss_rg20_stat.csv* |grep "^$ans:.*lif"|wc -l)
echo $count

 =========================================================
 
#!/bin/bash
NOW=$(date +%H)
temp=1
ans=$(($NOW-$temp))
cd /appl/Etisalat
count=$(cat demo.csv |grep "$ans:.*lif"  |wc -l)
echo $count

=============================
Count incomming files using <loader_stats.csv> (on local lab)for each hour)

#!/bin/bash
NOW=$(date +%H)
date=$(date)
temp=1
ans=$(($NOW-$temp))
cd /appl/virtuo/logs/loader
count=$(cat <loader_stats>.csv* |grep "^$ans:.*lif"|wc -l)
echo The incomming traffic count at $date is $count

===========================================================


Count incomming files using <loader_stats.csv> (for 4-5 hours)


#!/bin/bash
cd /appl/virtuo/logs/loader
count=$(cat <loader_stats>.csv* |grep ".lif"|wc -l)
echo The incomming traffic count at $date is $count


===========================================================


Count incomming files using <loader_stats.csv> (for 4-5 hours)


bash-4.2$ vi gway_count.sh
#!/bin/bash
cd /appl/
NOW=$(date +"%m-%d-%Y %T")
count=$(cat <gway.log>*|grep ".lif' copied" | wc -l)
cd /appl/
echo -e  "Incoming lif count at $NOW is $count " >>  gway_count.txt
echo "Incoming lif count at $NOW is $count"


============================================================

Count incomming files using <loader_stats.csv> (on local lab)previous 3-4 hour)

#!/bin/bash
NOW=$(date +%H)
date=$(date)
temp=1
temp=2
temp=3
ans1=$(($NOW-$temp1))
ans2=$(($NOW-$temp2))
ans3=$(($NOW-$temp3))
cd /appl/virtuo/logs/loader
count=$(cat <loader_stats>.csv* |grep "^$ans:.*lif"|wc -l)
echo The incomming traffic count at $date is $count1
