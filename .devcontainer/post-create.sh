#!/bin/bash

# this runs at Codespace creation - not part of pre-build

echo "$(date)    post-create start" >> ~/status

#Install jq
sudo apt update
sudo apt install -y jq

#Install k3s.ios
wget -q -O - https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash
k3d cluster create myapp

# create local registry
docker network create k3d
k3d registry create registry.localhost --port 5500
docker network connect k3d k3d-registry.localhost

# update the base docker images
docker pull mcr.microsoft.com/dotnet/sdk:7.0-alpine
docker pull mcr.microsoft.com/dotnet/aspnet:7.0-alpine
docker pull bjd145/utils:3.9

echo "$(date)    post-create complete" >> ~/status
