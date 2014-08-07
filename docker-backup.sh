#!/bin/bash
# This script exports ALL docker containers

set -o pipefail

i=0
CONTAINERS=`docker ps -a`
DATE=$(date +"%Y%m%d_%H%M")

IFS=$'\n'$'\r'
for CONTAINER in $CONTAINERS
do
  ((i++))
  # Skip the heading row
  if [ $i -eq 1 ]; then
    continue;
  fi
  docker export $(echo $CONTAINER | awk '{print $1}') |
  gzip -c > $(echo $CONTAINER | awk '{print $NF}')_$DATE.tar.gz
done
