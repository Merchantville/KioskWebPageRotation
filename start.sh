#!/bin/bash
#startx
xhost +
docker-compose -f /opt/kiosk/docker-compose.yml pull
docker-compose -f /opt/kiosk/docker-compose.yml up -d
sleep 15
docker exec kiosk xdotool key F11
