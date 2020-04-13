#!/usr/bin/env bash

if [ -f ./env/app/.env ]; then
	source ./env/app/.env
else 
	echo "Error: no/env/app/.env found!"
fi

SHELL_USER="root"
if [[ $* == *-n* ]]; then
	SHELL_USER="www"
fi

if [[ $SHELL_USER == "root" ]]; then
	read -p "Login as root? [Y/y]? " -n 1 -r
	echo # (optional) move to a new line
	if [[ $REPLY =~ ^[Yy]$ ]]; then 
		SHELL_USER="root"
	else 
		SHELL_USER="www"
	fi
fi

docker-compose exec -u $SHELL_USER mmapp bash -c 'source $WEBROOT/api/music_migrator_env/bin/activate && cd /home/www/; exec "${SHELL:-sh}"'
