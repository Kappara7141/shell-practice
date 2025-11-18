#!/bin/bash

# count=5

# echo "Starting Countdown..."

# while [ $count -gt 0 ]
# do
#     echo "Time left: $count"
#     sleep 1 # pause for 1 sec
#     count=$((count - 1)) # Decrement the count
# done

# echo "Times Up!"

while IFS= read -r line; 
do
    # Process each line here
    echo "Line: $line"
    # You can perform other operations with the "$line" variable
    # For example, you could parse data, perform calculations, etc.
done < "20.script-1.sh"
