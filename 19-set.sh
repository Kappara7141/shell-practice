#!/bin/bash

set -e

error(){
    echo "There is an error in $LINENO, Command is: $BASH_COMMAND"
}

trap error ERR

echo "Hello..."
echo "Before Error"
dchsdjlhvk;ljsfh # here shell understand there is an error and signal is ERR
echo "After Error"