FROM alpine:3.5
MAINTAINER Régis Belson <me@regisbelson.fr>

RUN apk add --no-cache bash

ENV DOCKER_VERSION 17.04.0

RUN set -ex \
    \
	&& apk add --no-cache --virtual .fetch-deps ca-certificates curl \
	&& curl -L "https://get.docker.com/builds/Linux/x86_64/docker-$DOCKER_VERSION-ce.tgz" \
	| tar -xz --strip-components=1 docker/docker -C /usr/local/bin  \
  	&& chmod +x /usr/local/bin/docker \
  	&& apk del .fetch-deps

CMD ["bash"] 