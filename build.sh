#!/usr/bin/env bash

if [ -f ./env/app/.env ]; then
	source ./env/app/.env
else 
	echo "Error: no/env/app/.env found!"
fi

if [ -z ${USER_ID+x} ]; then
	USER_ID=$(id -u)
fi

if [ -z ${GROUP_ID+x} ]; then
	GROUP_ID=$(id -g)
fi

NO_CACHE="--no-cache"
if [[ $* == *-n* ]]; then
	NO_CACHE="--pull"
fi

if [[ $NO_CACHE == "--no-cache" ]]; then
	read -p "Use Docker cache? [Y/y]? " -n 1 -r
	echo # (optional) move to a new line
	if [[ $REPLY =~ ^[Yy]$ ]]; then 
		NO_CACHE="--pull"
	else 
		NO_CACHE="--no-cache"
	fi
fi

docker-compose build $NO_CACHE --build-arg UID=$USER_ID --build-arg GID=$GROUP_ID