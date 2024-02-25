#!/bin/bash

IMGID=ami-0f3c7d07486cad139
INSTANCE_TYPE=""
SEC_GROUP_ID=sg-083fadb585b1228bb
DOMAIN_NAME=preprv.online.com

for i in $@
do
    if [[ $i == "mongodb" || $i == "mysql" ]]
    then
        INSTANCE_TYPE="t3.micro"
    else
        INSTANCE_TYPE="t2.micro"
    fi
echo "Creating instance $i"
IP_ADDRESS=$(aws ec2 run-instances --image-id $IMGID  --instance-type $INSTANCE_TYPE --security-group-ids $SEC_GROUP_ID --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$i}]" |  jq -r '.Instances[0].PrivateIpAddress')
echo "IP address of instance $i: $IP_ADDRESS"
aws route53 change-resource-record-sets --hosted-zone-id Z05567796ESR36J2OFN7 --change-batch '
{
        "Comment": "CREATE/DELETE/UPSERT a record ",
                    "Changes": [{
                    "Action": "UPSERT",
                    "ResourceRecordSet": {
                        "Name": " '$i.$DOMAIN_NAME' ",
                        "Type": "A",
                        "TTL": 1,
                        "ResourceRecords": [{ "Value": " '$IP_ADDRESS' "}]
        }}]
        }'
done