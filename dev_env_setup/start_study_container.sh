#!/bin/bash

docker run -d \
    --name study-container \
    -p 3000:3000 \
    -it ubuntu bash &&

docker exec study-container mkdir /root/.ssh &&
docker cp ~/.ssh/id_rsa study-container:/root/.ssh/id_rsa &&
docker cp ~/.ssh/known_hosts study-container:/root/.ssh/known_hosts &&

docker cp new_container_config.sh study-container:/root/new_container_config.sh &&
docker exec study-container chmod +x /root/new_container_config.sh &&
docker exec study-container /root/new_container_config.sh default




