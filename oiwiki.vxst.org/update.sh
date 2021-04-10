#!/bin/bash

sdir=$(dirname "$(readlink -f "$BASH_SOURCE")")
cd $sdir

rm -rf html
git clone https://gitee.com/OI-wiki/OI-wiki.git -b gh-pages html --depth 1
rm -rf html/.git

docker pull httpd:alpine
docker build . -t oiwiki.vxst.org --no-cache
rm -rf html

docker kill oiwiki.vxst.org
docker rm oiwiki.vxst.org

docker run --name oiwiki.vxst.org -d -p 8086:8086 \
		--security-opt seccomp:/etc/docker/default_seccomp.json \
		--restart=unless-stopped\
		--cpus="3" --memory="128m" --memory-swap="1g" --memory-swappiness=40 \
		oiwiki.vxst.org
