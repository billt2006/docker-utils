#!/bin/bash
# This script removes ALL docker containers
# Originally found at http://jimhoskins.com/2013/07/27/remove-untagged-docker-images.html

docker rm $(docker ps -a -q)
