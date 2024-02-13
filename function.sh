#!/bin/bash
USER=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"

VALIDATE()
{
    if [ $1 -ne 0 ]
    then
        echo "$R$2 ...unsuccessful$N"
        exit 1
    else
        echo "$G$2 ..successful$N"
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

