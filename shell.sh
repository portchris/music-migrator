#!/usr/bin/env bash

docker-compose exec -u root mmapp bash -c 'cd /home/www/; exec "${SHELL:-sh}"'
