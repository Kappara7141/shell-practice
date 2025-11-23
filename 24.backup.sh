#!bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
# LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log" # /var/log/shell-script/16-logs.log
LOG_FILE="/var/log/shell-script/backup.log" # Modified to run the script as command
DAYS=${3:- 14};  #if not provided considered as 14 days
SOURCE_DIR=$1
DEST_DIR=$2
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

### check SOURCE_DIR and DEST_DIR passed or not ###
if [ $# -lt 2 ]; then
    USAGE
fi

### check SOURCE_DIR is Exist  ###
if [ ! -d "$SOURCE_DIR" ]; then
    echo -e "$R source $SOURCE_DIR doesn't exist $N"
    exit 1
fi

### check DEST_DIR is Exist  ###
if [ ! -d "$DEST_DIR" ]; then
    echo -e "$R destination DEST_DIR doesn't exist $N"
    exit 1
fi

### Find the Files ###
FILES=$(find "$SOURCE_DIR" -name "*.log" -type f -mtime +"$DAYS")

if [ ! -z "${FILES}" ]; then
    ### Start Archieving ###
    echo "Files found: $FILES"
    TIMESTAMP=$(date +%F-%H-%M)
    ZIP_FILE_NAME="$DEST_DIR/app-logs-$TIMESTAMP.zip"
    echo "Zip file name: $ZIP_FILE_NAME"
    echo "$FILES" | zip -@ "$ZIP_FILE_NAME"

    ### Check Archieval Success or not ###
    if [ -f $ZIP_FILE_NAME ]
    then
        echo -e "Archieval ... $G SUCCESS $N"

        
        ### Delete if Success ###
        while IFS= read -r filepath;
        do
            echo "Deleting the file: $filepath"
            rm -rf $filepath
            echo "Deleted the file: $filepath"

        done <<< "$FILES"
    else
        echo -e "ARCHIEVAL ... $R FAILURE $N"
        exit 1
    fi
else
    echo -e "No files to archive $Y SKIPPING... $N"
fi



