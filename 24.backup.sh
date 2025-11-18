#!bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[30m"

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log" # /var/log/shell-script/16-logs.log
DAYS=${3:- 14};  #if not provided considered as 14 days
mkdir -p $LOGS_FOLDER
echo "Script started executed at : $(date)" | tee -a $LOG_FILE

if [ $USERID -ne 0 ]; then
    echo "ERROR:: Please run the script with root privilege"
    exit 1 #failure is other than 0
fi

USAGE(){
    echo -e "$R USAGE:: sudo sh 24.backup.sh <SOURCE_DIR> <DEST_DIR> <DAYS>[optional, default 14 days]$N"
    exit 1
}

if [ $# -lt 2 ]; then
    USAGE
fi

if [ ! -d SOURCE_DIR ]; then
    echo -e "$R $SOURCE_DIR doesn't exist $N"
    exit 1
fi

if [ ! -d DEST_DIR ]; then
    echo -e "$R DEST_DIR doesn't exist $N"
    exit 1
fi

FILES=$(find $SOURCE_DIR -name "*.log" -type f -mtime +14)

if [ ! -z "${FILES}" ]; then
    echo "Files found"
else
    echo "No files to archive $Y SKIPPING... $N"
fi



