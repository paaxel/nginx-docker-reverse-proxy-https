#!/bin/bash

# Change the directory to the desired location
cd /opt/{YOUR-SERVICE-NAME}

echo 'Stopping service using docker compose'
docker compose down
echo 'Stopped service using docker compose'


echo 'Sleep for 30 seconds to be sure the application is stopped'
sleep 30
echo 'Sleep finished'



echo 'Refreshing certificates...START'
sh create-certificates.sh
echo 'Refreshing certificates...DONE'



echo 'Starting service again...START'
docker compose up -d
echo 'Starting service again...DONE'

