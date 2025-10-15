#!/bin/bash

echo "All variables passed to the script:$*"
echo "All variables passed to the script:$@"

echo "script name:$0"
echo "Current working directory: $PWD"
echo "Who is running this: $USER"
echo "Home directory of user: $HOME"
echo "PID of this script: $$"