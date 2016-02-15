#!/bin/bash
docker-compose -f /home/jbrouse/projects_git/kiosk/docker-compose.yml up -d
sleep 5
docker exec kiosk xdotool key F11
