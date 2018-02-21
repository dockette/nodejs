FROM dockette/alpine:edge

MAINTAINER Milan Sulc <sulcmil@gmail.com>

RUN echo '@community http://nl.alpinelinux.org/alpine/edge/community' >> /etc/apk/repositories && \
    apk update && apk upgrade && \
    apk add nodejs-current@community nodejs-npm@community git && \
    rm -rf /var/cache/apk/*

CMD nodejs
