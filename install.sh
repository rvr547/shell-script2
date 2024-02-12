#!/bin/bash
USER=$(id -u)

if [ $USER -eq 1]
then
    echo "Error: Please run this as root user"
fi
yum install mysql -y