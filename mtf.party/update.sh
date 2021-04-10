#!/bin/bash

sdir=$(dirname "$(readlink -f "$BASH_SOURCE")")
cd $sdir

docker build . -t mtfparty_wp --no-cache

docker kill mtf.party
docker rm mtf.party

docker run -d --name mtf.party \
		--security-opt seccomp:/etc/docker/default_seccomp.json \
		-e WORDPRESS_DB_HOST=db:3306 \
		-e WORDPRESS_DB_USER=mtf.party \
		-e WORDPRESS_DB_NAME=mtf.party \
		-e WORDPRESS_DB_PASSWORD=<PASSWORD> \
		--restart=unless-stopped \
		--cpus="2" --memory="512m" --memory-swap="2g" --memory-swappiness=40 \
		--link mysql_db:db -p 8091:8091 \
		-v mtf_party_vol:/var/www/html \
		mtfparty_wp
