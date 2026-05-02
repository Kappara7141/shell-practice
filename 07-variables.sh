#!bin/bash

#DATE=$(date)

START_TIME=$(date +%s)

sleep 20
END_TIME=$(date +%s)
TOTAL_TIME=$(($END_TIME-$START_TIME))
echo "Script executed in: $TOTAL_TIME seconds"
