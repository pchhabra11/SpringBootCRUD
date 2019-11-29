#!/bin/bash
echo "\n Removing Docker Network:-"
docker network rm sqlNetwork

echo "\n Done..."

echo "Removing Mysql Container..."

docker container stop my-database

echo "\n Done..."

echo "Removing Build artifact Container..."
cd spring-server 
mvn clean
echo "\n Done..."

echo "Removing CRUD API Container..."
cd ..
docker container stop crudapi

echo "\n Done..."
