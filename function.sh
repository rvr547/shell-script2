#!/bin/bash
USER=$(id -u)
RED

VALIDATE()
{
    if [ $1 -ne 0 ]
    then
        echo "$2 ...unsuccessful"
        exit 1
    else
        echo "$2 ..successful"
    fi
}

if [ $USER -ne 0 ]
then
    echo "Error: Please run this as root user"
    exit 1
fi
#to check installation is success or not
yum install mysql -y
VALIDATE $? "Installing Mysql"

yum install postfix -y
VALIDATE $? "Installing Postfix"

