#!/bin/bash

IMAGE="merchantville/kiosk"
CONTAINER_ID=$(docker ps | grep $IMAGE | awk '{print $1}')
COMPOSE_FILE="/home/$(whoami)/projects_git/kiosk/docker-compose.yml"
DOCKER_COMPOSE="docker-compose -f $COMPOSE_FILE"

docker pull $IMAGE

LATEST=$(docker inspect --format "{{.Id}}" $IMAGE)
RUNNING=$(docker inspect --format "{{.Image}}" $CONTAINER_ID)
STATUS=$(docker ps | grep kiosk)


if [ "$RUNNING" != "$LATEST" ] || [ -z "$STATUS" ]; then
  xhost +local:

  echo "Upgrading/starting $IMAGE"

  #TODO Create upstart scripts
  #stop kiosk
  #start kiosk

  $DOCKER_COMPOSE kill && $DOCKER_COMPOSE rm -f
  $DOCKER_COMPOSE pull && $DOCKER_COMPOSE up -d

  echo "Waiting for the container to come up..."
  sleep 25

  docker exec kiosk xdotool key F11
else
  echo "$IMAGE is up to date."
fi
