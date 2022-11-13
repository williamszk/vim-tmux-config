FROM ubuntu:latest

WORKDIR /root/

RUN mkdir ~/.ssh
COPY ~/.ssh/id_rsa /root/.ssh/id_rsa

COPY ./new_container_config.sh ./new_container_config.sh

RUN chmod +x /root/new_container_cofig.sh && \
    /root/new_container_cofig.sh default

CMD ["bash"]
