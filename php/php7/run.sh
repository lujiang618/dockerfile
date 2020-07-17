#!/bin/sh

docker rm -f api
docker rmi -f php7:1.0
docker build -t php7:1.0 .
docker run -d -p 9801:9801 -v /docker/nginx/conf/:/etc/nginx/conf.d/ -v /www/lifemall:/www  --privileged=true --name mall php7:1.0
docker exec -it mall sh
