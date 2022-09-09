#!/bin/bash

export API_URI=${1:-"http://localhost:5501"}

echo Health Check
curl -w '\n' ${API_URI}/

echo Post Sample Items
curl -sX POST ${API_URI}/todos/ -d '{"Id": "1", "Name": "Take out trash"}' -H "Content-Type: application/json" 
curl -sX POST ${API_URI}/todos/ -d '{"Id": "2", "Name": "Clean your bathroom"}' -H "Content-Type: application/json" 
echo

echo Get Todo ID# 1
curl -s ${API_URI}/todos/1 | jq

echo Update Todo# 2
curl -sX PUT ${API_URI}/todos/2 -d '{"Id": "2", "Name": "Clean your bathroom", "IsComplete": true }' -H "Content-Type: application/json" 
curl -s ${API_URI}/todos/2 | jq

echo Get All
curl -s ${API_URI}/todos | jq