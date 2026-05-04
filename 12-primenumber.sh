#!/bin/bash

n=$1

echo "please enter the number:"
read n

for ((i=2;i*i<=n;i++)); do
  ((n%i==0)) && echo "Given number $n is Not Prime" && exit
done

((n>1)) && echo " Given number $n is Prime" || echo "Given number $n is Not Prime"
