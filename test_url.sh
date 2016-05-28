#!/bin/bash

URLS="assets/data/urls.txt"

while read URL; do                                                                                                                                 
  echo $URL                                                                                                                                        
  RESPONSE_CODE=$(curl --write-out %{http_code} --silent --output /dev/null $URL)                                                                  
  if [ "$RESPONSE_CODE" != "200" ]; then                                                                                                           
    echo "Bad URL"                                                                                                                                 
  fi                                                                                                                                               
done <$URLS 
