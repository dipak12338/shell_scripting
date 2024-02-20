##Archiving those files having size more than 100KB 
#Tue Feb 20 15:14:00 IST 2024



#!/bin/bash
set -e

BASE='/root/demo/Archiving/'
file_size=$(find $BASE -maxdepth 1 -type f -size +100k)
echo "File size is activated"

if [[ ! -d $BASE/archive ]]
then
                echo "BASE directory is not defined"
                mkdir archive
fi

for  i in $file_size
do
        #cd $BASE
        gzip $i
        mv $i.gz $BASE/archive
done
echo "File zize greater than 100KB converted in old files."
