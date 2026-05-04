#!/bin/bash

NUMBER1=100
NUMBER2=200
NAME=DevOps

SUM=$(($NUMBER1+$NUMBER2+$NAME))

echo "Sum is: ${SUM}" 

LEADERS=("Modi" "Putin" "Trudo" "Trump")

echo "All Leaders: ${LEADERS[@]}"
echo "First Leader: ${LEADERS[0]}"