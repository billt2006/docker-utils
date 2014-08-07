#!/bin/bash
# This script removes ALL docker images
# Originally found at http://jimhoskins.com/2013/07/27/remove-untagged-docker-images.html

docker rmi $(docker images -q)
