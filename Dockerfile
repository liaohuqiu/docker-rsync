FROM alpine:latest
MAINTAINER Leo <liaohuqiu@gmail.com>

EXPOSE 22
ENTRYPOINT ["/entrypoint.sh"]

RUN apk update && \
    apk add bash openssh rsync && \
    rm -rf /var/cache/apk/*

COPY ./entrypoint.sh /
