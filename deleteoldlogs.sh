APP_LOGS_DIR=/home/centos/app-logs
LOGSDIR=/home/centos/shell-script-logs
DATE=$(date +%F)
SCRIPT_NAME=$0
LOGFILE=$LOGSDIR/$SCRIPT_NAME-$DATE.log
FILES_TO_DELETE=$(find $APP_LOGS_DIR -name "*.log" -type f -mtime +15)
echo " $FILES_TO_DELETE "

while read line
do
    echo "Deleting $line " &>> $LOGFILE
done <<< FILES_TO_DELETE