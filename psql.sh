#!/usr/bin/env bash

if [ -f ./env/app/.env ]; then
	set -a
	. ./env/app/.env
	set +a
else
	echo "Error: no ./env/app/.env found!"
	exit
fi

docker-compose exec mmpostgres psql --username=$SQL_PASSWORD --password=$SQL_PASSWORD --dbname=$POSTGRES_DATABASE