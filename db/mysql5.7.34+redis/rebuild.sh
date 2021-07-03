# /bin/bash

docker-compose down
docker-compose up -d
docker logs redis
watch -n 1 docker-compose ps
