#!/bin/bash
set -x

if [[ "${UID}" -ne 0 ]]
then
        echo 'Please loggin with the ROOT/SUDO user'
else
        echo 'Success'
fi
#User creation atleast provide 1 args
# ${#} means number of arguments

if [[ "${#}" -lt 1 ]]
then
        echo "Please provide atleast 1 argument"
        exit 1
fi

echo "User name is : ${1}"

USER_NAME=${1}
shift

# $@ shows the argument (except first argument)

REST_VAL=${@}

echo  $REST_VAL

useradd -c $REST_VAL -m  $USER_NAME

if [[ "${?}" -ne 0 ]]
then
        echo "Username is created with exception. Please try again."
        exit 1
fi

password1= $(date +%s%N)
password $password1 $USER_NAME

if [[ "${?}" -ne 0 ]]
then
        echo "Password is created with exception. Please try again."
        exit 1
fi

echo $password1


echo "Script ran succeeded, User $USER_NAME create with password $password"
echo "===================================================================="
