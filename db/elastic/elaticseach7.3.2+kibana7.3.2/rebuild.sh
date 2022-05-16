# /bin/bash

docker-compose stop
docker-compose rm
docker-compose up -d
watch -n 1 docker-compose ps