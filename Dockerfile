FROM alpine:latest

MAINTAINER Leo <liaohuqiu@gmail.com>

RUN apk update && \
    apk add bash openssh rsync
