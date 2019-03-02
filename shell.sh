#!/usr/bin/env bash

docker-compose exec -u root mmnodejs bash -c 'cd /home/www/; exec "${SHELL:-sh}"'
