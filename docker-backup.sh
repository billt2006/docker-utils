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
  cname=$(echo $CONTAINER | awk '{print $NF}' | sed "s/[^[:alnum:]_]/_/g")
  echo "Backing up $(echo $CONTAINER | awk '{print $NF}')..."
#  echo "${cname}_${DATE}.tar.gz"
  docker export $(echo $CONTAINER | awk '{print $1}') |
  gzip -c > "${cname}_${DATE}.tar.gz" &&
  echo "Done."
done
