#!/bin/bash

echo "All variables passed to the script: $@"
echo "All variables passed to the script: $*"
echo "Script name: $0"
echo "current directory: $PWD"
echo "who is running this file: $USER"
echo "Home directory of the user: $HOME"
echo "PID of this script: $$"
sleep 50 &
echo "PID of the last command in the background: $!"