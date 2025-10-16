#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR:: Please run the script with root privilege"
fi

dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "ERROR:: Installating MySQL is FAILURE"
else
    echo "Installating MySQL is SUCCESS"   
fi     