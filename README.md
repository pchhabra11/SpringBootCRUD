# SpringBootCRUD with MySQL and REST APIs on Docker

# STEP 1

Create Docker Network
- docker network create sqlNetwork

# STEP 2
Create a mysql docker container along with the person data.

- mysql-dataload-dockerfile-master/database.sh build : To fetch the base image and build the docker container
- mysql-dataload-dockerfile-master/database.sh run : To run the docker container and load the data from the given csv file.


# STEP 3
Build the "spring-server" application using maven

- mvn clean install

# STEP 4
Build and run the application as a docker container

- docker build . -t crudapi
- docker run --rm --network=sqlNetwork --link=my-database -p 8080:8080 -td crudapi

# STEP 5
Import Collection from Postman_Requests_Collection/ directory to Postman and run the requests to perform all the API operations.
