#!/bin/bash
# This script removes ALL docker containers

docker rm $(docker ps -a -q)
