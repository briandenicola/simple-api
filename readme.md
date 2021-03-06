# Overview
Sometimes you just need a very simple API to test connectivity. This is my super simple dotnet version.

# Build and Run
```bash
scripts/publish.bat
src/publish/windows/api.exe
```
# Docker Build and Run
```bash
cd src
docker build -t todo:1.0 .
docker run -p 5500:5500 todo:1.0
```

# Azure Container Apps via Github Actions 
* [Trigger Actions](https://github.com/briandenicola/simple-api/actions/workflows/main.yaml)
* [![Trigger deployment to Container Apps](https://github.com/briandenicola/simple-api/actions/workflows/main.yaml/badge.svg)](https://github.com/briandenicola/simple-api/actions/workflows/main.yaml)

# Test
```bash
curl -v http://localhost:5500/
curl -v -X POST http://localhost:5500/todos/ -d '{"Id": 1, "Name": "Take out trash"}' -H "Content-Type: application/json"
curl -v -X POST http://localhost:5500/todos/ -d '{"Id": 2, "Name": "Clean your bathroom"}' -H "Content-Type: application/json"
curl -v http://localhost:5500/todos/1
curl -v -X PUT http://localhost:5500/todos/1 -d '{"Name": "Take out trash", "IsComplete": true }' -H "Content-Type: application/json"
curl -v http://localhost:5500/todos/1
curl -v http://localhost:5500/todos/
```
