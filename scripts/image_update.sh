#!/bin/bash

IMAGE="merchantville/kiosk"
CONTAINER_ID=$(docker ps | grep $IMAGE | awk '{print $1}')

docker pull $IMAGE

LATEST=`docker inspect --format "{{.Id}}" $IMAGE`
RUNNING=`docker inspect --format "{{.Image}}" $CONTAINER_ID`

if [ "$RUNNING" != "$LATEST" ]; then
  echo "Upgrading $IMAGE"
  stop kiosk
  start kiosk
else
  echo "$IMAGE is up to date."
fi
