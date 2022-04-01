# Overview
Sometimes you just need a very simple API to test connectivity. This is my super simple dotnet version.

# Build
```bash
scripts/publish.bat
```
# Run
```bash
\src\publish\windows\api.exe
```

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