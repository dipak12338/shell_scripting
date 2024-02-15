//When we run the below script then it will generate a file with name as current date and time
Also it automatially changes the content with current time.

  
#!/bin/bash
cd /root/demo
pwd
date=$(date "+%Y%m%d%H%M")
cp PM_IG80112_15_202307141631.Z_01.csv PM_IG80112_15_$(date "+%Y%m%d%H%M").Z_01.csv
pwd
echo $(sed -r "s/([0-9]{1,2})\/([0-9]{2})\/([0-9]{4}) ([012][0-9]:[0-5][0-9])/$(date '+%Y\/%m\/%d %H:%M')/g" PM_IG80112_15_$(date "+%Y%m%d%H%M").Z_01.csv) > PM_IG80112_15_$(date "+%Y%m%d%H%M").Z_01.csv
echo "Data from crontab inserted"

==================================
Output:
=========
cat PM_IG80112_15_202402151631.Z_01.csv
PM_IG80112_15_202402151631.Z_01
PM_IG80112_15_202402151631.Z_01


