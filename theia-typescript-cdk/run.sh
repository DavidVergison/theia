#!/bin/bash

CONTAINER_NAME=theia-cdk
IMAGE_NAME=davidvergison/theia-cdk:latest

docker stop $CONTAINER_NAME > /dev/null 2>&1
docker rm $CONTAINER_NAME > /dev/null 2>&1

docker run -d --name $CONTAINER_NAME -v $PWD/project:/home/project/ -p 3000:3000 $IMAGE_NAME
