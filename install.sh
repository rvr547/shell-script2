#!/bin/bash
USER=$(id -u)

if [ $USER -ne 0 ]
then
    echo "Error: Please run this as root user"
    exit 1
fi
#to check installation is success or not
yum install mysql -y

if [ $? -ne 0 ]
then
    echo "Installation unsuccessful"
else
    echo "Installation successful"
fi
