#!/bin/bash

# this runs as part of pre-build

echo "$(date)    on-create start" >> $HOME/status

#Install k3s.ios
curl -sfL https://get.k3s.io | sh -

# create local registry
docker network create k3d
k3d registry create registry.localhost --port 5500
docker network connect k3d k3d-registry.localhost

# update the base docker images
docker pull mcr.microsoft.com/dotnet/sdk:6.0-alpine
docker pull mcr.microsoft.com/dotnet/aspnet:6.0-alpine
docker pull mcr.microsoft.com/dotnet/sdk:6.0

echo "$(date)    on-create complete" >> $HOME/status
