#!/bin/bash

# Download the JSON file from the GitHub repository
curl https://raw.githubusercontent.com/BGLCorp/devops-interview-tests/main/ec2-describe-instances.json -o ec2-describe-instances.json

# Parse the JSON file using jq and filter for instances launched before 2022-04-12T13:00:00
INSTANCE_IDS=$(jq '.Reservations[].Instances[] | select(.LaunchTime < "2022-04-12T13:00:00").InstanceId' ec2-describe-instances.json)

# Print the InstanceIds
echo "InstanceIds launched before 2022-04-12T13:00:00:"
echo $INSTANCE_IDS
