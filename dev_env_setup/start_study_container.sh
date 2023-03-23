#!/bin/bash

# To start a new container for study and devlepment 
# just run this script
# source start_study_container.sh


docker run -d \
    -v /var/run/docker.sock:/var/run/docker.sock \
    --name william-dev-container \
    -it ubuntu bash

docker stop william-dev-container
docker rm william-dev-container




docker run -d \
    --name study-container \
    -p 3000:3000 \
    -p 8888:8888 \
    -it ubuntu bash &&

docker exec study-container mkdir /root/.ssh &&
docker cp ~/.ssh/id_rsa study-container:/root/.ssh/id_rsa &&
docker cp ~/.ssh/known_hosts study-container:/root/.ssh/known_hosts &&

docker cp new_container_config.sh study-container:/root/new_container_config.sh &&
docker exec study-container chmod +x /root/new_container_config.sh &&
docker exec study-container /root/new_container_config.sh default




