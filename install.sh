#!/bin/bash
USER=$(id -u)

if [ $USER -ne 0 ]
then
    echo "Error: Please run this as root user"
fi
yum install mysql -y