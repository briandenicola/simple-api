#!/bin/bash

# this runs at Codespace creation - not part of pre-build

echo "$(date)    post-create start" >> ~/status

#Install jq
sudo apt update
sudo apt install -y jq

#Install Task
sudo sh -c "$(curl -sL https://taskfile.dev/install.sh)" -- -d -b /usr/local/bin

#Helpful Utils container
docker pull bjd145/utils:3.20

echo "$(date)    post-create complete" >> ~/status
