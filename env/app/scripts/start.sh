#!/bin/bash

WEBROOT="/home/www/src/music-migrator"

# NPM setup
if [ ! -d $WEBROOT/app/.npm ]; then
	mkdir $WEBROOT/app/.npm
fi
if [ ! -d $WEBROOT/app/.config ]; then
	mkdir $WEBROOT/app/.config
fi
if [ -d $WEBROOT/app/node_modules ]; then
	chmod -R 755 $WEBROOT/app/node_modules
fi
chown -R www:www $WEBROOT/app/.npm
chown -R www:www $WEBROOT/app/.config

# Start CRON service
service cron start

# Start Virtual Env & GUnicorn optimised for portchris server with 2 CPUs (2 Workers * CPU Cores) + 1
virtualenv $WEBROOT/api/music_migrator_env
source $WEBROOT/api/music_migrator_env/bin/activate
gunicorn --name music_migrator --workers=5 -b 0.0.0.0:8000 $WEBROOT/api/wsgi.py
