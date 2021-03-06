#!/usr/bin/env bash
./create.sh
docker-compose up -d
# Creates empty symfony project and place it in right place
docker-compose run php-fpm symfony new tmp
docker-compose run php-fpm cp -R tmp/. .
docker-compose run php-fpm rm -rf tmp
docker-compose down