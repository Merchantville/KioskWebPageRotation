#!/bin/bash

IMAGE="merchantville/kiosk"
CONTAINER_ID=$(docker ps | grep $IMAGE | awk '{print $1}')
COMPOSE_FILE="/home/jbrouse/projects_git/kiosk/docker-compose.yml"
DOCKER_COMPOSE="docker-compose -f $COMPOSE_FILE"

docker pull $IMAGE

LATEST=`docker inspect --format "{{.Id}}" $IMAGE`
RUNNING=`docker inspect --format "{{.Image}}" $CONTAINER_ID`

if [ "$RUNNING" != "$LATEST" ]; then
  echo "Upgrading $IMAGE"
  #stop kiosk
  #start kiosk
  $DOCKER_COMPOSE kill
  $DOCKER_COMPOSE rm -f
  $DOCKER_COMPOSE pull
  $DOCKER_COMPOSE up -d
else
  echo "$IMAGE is up to date."
fi
