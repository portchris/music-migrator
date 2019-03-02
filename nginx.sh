#!/usr/bin/env bash

docker-compose exec mmnginx bash -c 'cd /etc/nginx; exec "${SHELL:-sh}"'
