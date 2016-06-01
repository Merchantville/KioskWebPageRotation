#!/bin/bash

URLS="assets/urls.txt"

while read URL; do                                                                                                                                 
  RESPONSE_CODE=$(curl --write-out %{http_code} --silent --output /dev/null $URL)                                                                  
  echo -e "\nHTTP_REPONSE_CODE: $RESPONSE_CODE\nFROM: $URL\n" 
 
  if [ "$RESPONSE_CODE" != "200" ]; then                                                                                                           
    echo "Bad URL"                                                                                                                                 
    exit 1
  fi                                                                                                                                               
done <$URLS 
