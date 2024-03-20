# Ex. Script to count the proccesed file in 24 hours.



#!/bin/bash  
cd /appl/performance_issue_with_loaders/loader
for ((i=0; i < 24; i++))
do
count=$(cat <file_name>.log.2023-03-01-$i* | grep "Return Code \[OK]" | wc -l)
echo "Count at $i : " $count
done



Sample log file:
loader_ericsson_lte_1.log.2023-03-01-15.1677676283571


2023-03-01 15:00:15.286 INFO  [NcMasterCache] Master Cache processing file [processRequest started  loader [ericsson_lte_1] file [/spool/ericsson-lte/load_1/INUSE.PDF_pmUe-20230228151346915-62_1.lif]]
2023-03-01 15:00:15.286 INFO  [MasterCacheRequest] Master Request. No Blocks [166 Diffs 0].
2023-03-01 15:00:15.286 INFO  [MasterCacheRequest]      Table [NC_EUTRANCELL] version[157967980]. Number of lookups [0]. Number of diff [0]. Times []
2023-03-01 15:00:15.286 INFO  [MasterCacheResponse] Master Response. Return Code [OK]



