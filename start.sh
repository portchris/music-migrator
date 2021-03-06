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

docker-compose up -d --remove-orphans
# docker-compose exec mmapp $WEBROOT/api/manage.py runserver $DJANGO_HOST:$DJANGO_PORT