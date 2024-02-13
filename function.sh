#!/bin/bash

DATE=$(date + %F-%H-%M:%S)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log
R="\e[31m"
G="\e[32m"
N="\e[0m"

VALIDATE()
{
    if [ $1 -ne 0 ]
    then
        echo "$2 ...$R unsuccessful$N"
        exit 1
    else
        echo "$2 .. $G successful$N"
    fi
}
USER=$(id -u)

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

