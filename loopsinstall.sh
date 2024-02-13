#!/bin/bash
#add improvemnts
USER=$(id -u)
DATE=$(date +%F)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"
VALIDATE()
{
    if [ $1 -ne 0 ]
    then
        echo -e "$2 ... $R unsuccessful $N"
    else
        echo -e "$2 ... $G successful $N"
    fi
}
if [ $USER -ne 0 ]
then
    echo -e "ERROR: $R USE Root access to use this command $N"
    exit 1
else
    for i in $@
    do
    yum list installed $i &>>$LOGFILE
        if [ $? -ne 0]
        then
            echo "Installing $i"
            yum install $i -y &>>$LOGFILE
            VALIDATE $? "Installation of $i"
            exit 1
        else
            echo -e "$Y $i package already exists $N"
        fi
    done
fi