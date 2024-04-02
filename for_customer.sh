#Shell script to count processed data on hourly basis


#    1)	Requirement:
        How does the customer monitor the hourly data?

#    2)	Following lif_count_main.sh shell script is used to monitor data on hourly basis:
#!/bin/sh
NOW=$(date +%H)
date=$(date)
temp=1
ans=$(($NOW-$temp))                             
cd /appl/virtuo/logs/loader
count=$(cat nokiagsmbss_rg20_stat.csv |grep "^$ans:.*lif"|wc -l)
cd /appl/virtuo/var/loader/spool/nokiagsmbss_rg20/RG20/
echo "The incoming traffic count at $date is $count" >> count.txt


#3)	Crontab is used to run shell script at specific time interval. In our case, it is 1 hour of interval. 

# crontab -l
*/60 * * * * /appl/virtuo/var/loader/spool/nokiagsmbss_rg20/RG20/lif_count_main.sh

Or

 

4)	Outputs:

Output from CSV file in console:
	# cat nokiagsmbss_rg20_stat.csv |grep "^10:.*.lif"|wc -l
		816
  # cat nokiagsmbss_rg20_stat.csv |grep "^11:.*.lif"|wc -l
1   632
  # cat nokiagsmbss_rg20_stat.csv |grep "^12:.*.lif"|wc -l
    360



Output of count.txt file as follow:
# cat count.txt

The incomming traffic count at Fri Aug 12 11:00:02 IST 2022 is 816
The incomming traffic count at Fri Aug 12 12:00:01 IST 2022 is 1632
The incomming traffic count at Fri Aug 12 13:00:02 IST 2022 is 360


 




