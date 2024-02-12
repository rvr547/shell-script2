#!/bin/bash
USER=$(id -u)

VALIDATE()
{
    if [ $1 -ne 0 ]
    then
        echo "Installation ...unsuccessful"
        exit 1
    else
        echo "Installation ..successful"
    fi
}

if [ $USER -ne 0 ]
then
    echo "Error: Please run this as root user"
    exit 1
fi
#to check installation is success or not
yum install mysql -y
VALIDATE $?

yum install postfix -y
VALIDATE $?

