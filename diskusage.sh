#!/bin/bash
LOGFILE_DIR=/tmp
DATE=$(date +%F)
SCRIPT_NAME=$0
LOGFILE=$LOGFILE_DIR/$SCRIPT_NAME-$DATE.log
DISK_USAGE=$(df -hT|grep -vE 'tmpfs|Filesystem')

