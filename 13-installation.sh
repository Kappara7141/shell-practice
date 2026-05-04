#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR: Please run this script with root privilege"
    exit 1
fi

dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "ERROR: Installing MYSQL is failure"
    exit 1
else
    echo "Installing MYSQL is SUCCESS"
fi