#Script for Argumnent examples 
#And comments 

#!/bin/bash
echo "First argument is $1 "
echo "Second argument is $2"

shift
echo "All the arguments are $@"
echo "Number of Argument are: $#"

<<mycomment
mkdir backup_file

for filename in $@
do
        cp  $filename backup_file
done
mycomment
