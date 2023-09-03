#!/bin/bash

FILE=/var/www/html/index.html

nc -z localhost 80 

if [ $? -eq 0 ] && [ -f "$FILE" ]; then
exit "0"
else
exit "1"
fi