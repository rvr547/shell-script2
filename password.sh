#!/bin/bash

#to read password from command line in linux

echo "Please enter Username:"
read USERNAME

echo "User name is : $USERNAME"

echo "Please enter password:"
read -s PASSWORD
#-s is to not show password 
echo "Password  is : $PASSWORD"
