#!/bin/bash
#check if the number is greater 10 than or not
NUM=$1

if [ $NUM -gt 10 ]
then
    echo "$1 is greater than 10"
else
    echo "$1 is less than 10"
fi