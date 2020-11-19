#!/bin/bash

IMAGE=davidvergison/theia-hugo:latest
CONTAINER_NAME=theia-hugo

docker stop theia-hugo > /dev/null 2>&1
docker rm theia-hugo > /dev/null 2>&1

docker run -d --name $CONTAINER_NAME \
    -v $PWD/project:/home/project/ \
    -p 3000:3000 \
    -p 1313:1313 \
$IMAGE
