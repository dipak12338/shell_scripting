#!/bin/bash
#Shell script to count lif files
echo "Host connected successfully..."
cd /appl/virtuo/var/loader/spool/nokiagsmbss_rg20/RG20/good
count=$(ls |wc -l)
echo "This is good file count"
echo $count  
$temp=3000
if [ "$count" -gt "$temp" ]
then
echo "Lif violation occured"       
else 
echo "Count is $count"
fi
cd /appl/virtuo/var/loader/spool/nokiagsmbss_rg20/RG20/
echo $count >> lif_count.txt
