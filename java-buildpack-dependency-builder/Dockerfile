FROM alpine:latest

RUN apk add --update \
    bash \
    coreutils \
    curl \
    jq \
    py2-pip \
    unzip \
    openjfx \
 && rm -rf /var/cache/apk/*

RUN pip install awscli --ignore-installed six
