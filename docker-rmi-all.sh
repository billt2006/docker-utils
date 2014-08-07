#!/bin/bash
# This script removes ALL docker images

docker rmi $(docker images -q)
