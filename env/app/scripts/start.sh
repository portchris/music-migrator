#!/bin/bash

WEBROOT="/home/www/music-migrator/src"

if [ -f /var/env/app/.env ]; then
	source /var/env/app/.env
else 
	echo "Error: no /var/env/app/.env found!"
fi

# NPM setup
if [ ! -d $WEBROOT/app/.npm ]; then
	mkdir -p $WEBROOT/app/.npm
fi
if [ ! -d $WEBROOT/app/.config ]; then
	mkdir -p $WEBROOT/app/.config
fi
if [ -d $WEBROOT/app/node_modules ]; then
	chmod -R 755 $WEBROOT/app/node_modules
fi
chown -R www:www $WEBROOT/app/.npm
chown -R www:www $WEBROOT/app/.config

# Start CRON service
service cron start

# Start Virtual Env & GUnicorn optimised for portchris server with 2 CPUs (2 Workers * CPU Cores) + 1
alias python=python3
virtualenv $WEBROOT/api/music_migrator_env
chown -R $USER_ID:$GROUP_ID $WEBROOT/api/music_migrator_env
source $WEBROOT/api/music_migrator_env/bin/activate
pip install -r /var/env/app/requirements.txt
gunicorn --name music_migrator --workers=5 --bind $DJANGO_HOST:$DJANGO_PORT music_migrator.wsgi:application

