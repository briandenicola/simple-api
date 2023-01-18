# Overview
Sometimes you just need a very simple API to test connectivity. This is my super simple dotnet version.

# Windows Build and Run
```bash
scripts/publish.bat
src/publish/windows/api.exe
```

# Docker Build and Run
```bash
cd src
docker build -t todo:1.0 .
docker run -p 5501:5501 todo:1.0
```

# Azure Container Apps via Github Actions 
* [Trigger Actions](https://github.com/briandenicola/simple-api/actions/workflows/main.yaml)
* [![Trigger deployment to Container Apps](https://github.com/briandenicola/simple-api/actions/workflows/main.yaml/badge.svg)](https://github.com/briandenicola/simple-api/actions/workflows/main.yaml)

# Test
## Localhost
```bash
cd scripts
./validate.sh
```

## Container Apps
```bash
cd scripts
./validate.sh https://${AZURE_CONTAINER_APP_URI}
```
