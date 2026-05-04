#!/bin/bash

NUMBER=$1
is_prime=1

if [ $NUMBER -le  1]; then
    is_prime=0
else 
    i=2
    while [ $i -le $(echo "sqrt($NUMBER)" | bc) ];do
        if [ $($NUMBER % i) -eq 0 ]; then
            is_prime=0
        break
        i=$((i+1))
    done
fi

if [ $is_prime -eq 1 ]; then
    echo "Prime"
else
    echo "NOT prime"
fi
    
