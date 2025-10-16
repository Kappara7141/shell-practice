#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR:: Please run the script with root privilege"
    exit 1 #failure is other than 0
fi

VALIDATE(){ #function receive inputs through args just like shell script args
    if [ $1 -ne 0 ]; then
        echo "ERROR:: Installating $2 is FAILURE"
        exit 1
    else
        echo "Installating $2 is SUCCESS"   
    fi     
}

dnf install mysql -y
VALIDATE $? "MySQL"

dnf install nginx -y
VALIDATE $? "Nginx"

dnf install mongodb-mongosh -y
VALIDATE $? "mongosh"
