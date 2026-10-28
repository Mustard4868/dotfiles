#!/bin/bash

city=$(curl -s 'https://ipinfo.io/city')

weather=$(curl -s "https://wttr.in/$city?format=1")

if [ -z "$weather" ]; then
  echo "󰅤  error"
else
  weather=$(echo "$weather" | tr -s ' ')
  echo "$weather"
fi
