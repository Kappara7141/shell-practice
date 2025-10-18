#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[30m"

if [ $USERID -ne 0 ]; then
    echo "ERROR:: Please run the script with root privilege"
    exit 1 #failure is other than 0
fi

VALIDATE(){ #function receive inputs through args just like shell script args
    if [ $1 -ne 0 ]; then
        echo -e "ERROR:: Installating $2 is $R FAILURE"
        exit 1
    else
        echo -e "Installating $2 is $G SUCCESS"   
    fi     
}
dnf list installed mysql
if [ $? -ne 0 ]; then
    dnf install mysql -y
    VALIDATE $? "MySQL"
else 
    echo -e "MySQL already exist ... $Y skipped $N"
fi

dnf list installed nginx
if [ $? -ne 0 ]; then
    dnf install nginx -y
    VALIDATE $? "Nginx"
else 
    echo -e "Nginx already exist ... $Y skipped $N"
fi

dnf list installed python3
if [ $? -ne 0 ]; then
    dnf install python3 -y
    VALIDATE $? "python3"
else
    echo -e "Python3 already exist ... $Y skipped $N"
fi