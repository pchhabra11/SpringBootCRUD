#!/bin/sh
# CREATE DOCKER CONTAINER NETWORK
echo "\n Creating Docker Container Network..."
docker network create sqlNetwork
echo "\n Done..."

relativePath=`pwd`

echo "\n Working directory is : "$relativePath

echo "\n Fetching image to build docker container..."
cd mysql-dataload-dockerfile-master
sh database.sh build start

echo "\n Done..."

echo "\n Run the docker container and load the data from the given csv file..."
sh  database.sh start 
echo  "\n Done..."

echo "\n Build Jar File using the Spring-Server project..."
cd ../spring-server
mvn install
echo  "\n Done..."



echo "\n Build Docker image using the Spring-Server project..."
docker build . -t crudapi
echo  "\n Done..."


echo "\n Running the docker container as crudapi container on port:8080 and host:localhost..."
docker run --rm --network=sqlNetwork --link=my-database -p 8080:8080 -td --name crudapi crudapi
echo  "\n Done..."
