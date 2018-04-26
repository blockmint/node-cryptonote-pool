FROM ubuntu:16.04

MAINTAINER Name gcarder@blockmint.ai

#RUN rm /bin/sh && ln -s /bin/bash /bin/sh

ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 0.10.48

RUN apt-get update  \
 && apt-get install curl libboost-all-dev build-essential git nodejs-legacy -y \
 && curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash \
 && mkdir -p /opt/pool

WORKDIR /opt/pool

COPY . .

RUN /usr/local/nvm/v0.10.48/bin/npm install

ENTRYPOINT node init.js
