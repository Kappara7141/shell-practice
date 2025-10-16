#!/bin/bash

USERID= $(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR:: Please run the script with root privilege"
fi

dnf install mysql -y

if [ $? -nq 0 ]; then
    echo "ERROR:: Installating mysql is a failure"
else
    echo "Installating mysql is a success"   
fi     