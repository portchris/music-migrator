#!/bin/bash

# NPM setup
if [ ! -d /home/www/.npm ]; then
	mkdir /home/www/.npm
fi
if [ ! -d /home/www/.config ]; then
	mkdir /home/www/.config
fi
if [ -d /home/www/src/node_modules ]; then
	chmod -R 755 home/www/src/node_modules
fi
chown -R www:www /home/www/.npm
chown -R www:www /home/www/.config

# Start CRON service
service cron start