#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[30m"

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log" # /var/log/shell-script/16-logs.log

if [ $USERID -ne 0 ]; then
    echo "ERROR:: Please run the script with root privilege"
    exit 1 #failure is other than 0
fi

mkdir -p $LOGS_FOLDER
echo "Script started executed at : $(date)" | tee -a $LOG_FILE

VALIDATE(){ #function receive inputs through args just like shell script args
    if [ $1 -ne 0 ]; then
        echo -e "ERROR:: Installating $2 is $R FAILURE $N" | tee -a $LOG_FILE
        exit 1
    else
        echo -e "Installating $2 is $G SUCCESS $N" | tee -a $LOG_FILE
    fi     
}

#$@

for package in $@

do
    #check package is already installed or not
    dnf list installed $package &>>LOG_FILE

    #if exist status is 0, already installed. -ne to 0 need to install it.
    if [ $? -ne 0 ]; then
        dnf install $package -y &>>LOG_FILE
        VALIDATE $? "$package"
    else
        echo -e "$package already installed ... $Y SKIPPING $N"
    fi
done