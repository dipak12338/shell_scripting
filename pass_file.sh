#This script will check file Running.sh is present in directory or not.
#if its present then it will create pass.txt and if pass.txt already present then it will delete it.


#!/bin/bash
command=$(ls | grep pass.txt)
if [[ $command = 'pass.txt' ]]
then
        rm -rf pass.txt
        command=$(ls | grep Running.sh)
        if [[ $command = 'Running.sh' ]]
        then                
                echo "Test succided" > pass.txt
        else
                echo "Failed" > fail.txt
        fi
else
        command=$(ls | grep Running.sh)
        if [[ $command = 'Running.sh' ]]
        then
                echo "Test succided" > pass.txt
        else
                echo "Failed" > fail.txt
        fi
fi
