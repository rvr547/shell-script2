#!/bin/bash
USER=$(id -u)

if [ $USER -ne 0 ]
then
    echo "Error: Please run this as root user"
    exit 1
fi
yum install mysql -y