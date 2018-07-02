FROM dockette/alpine:3.7

MAINTAINER Milan Sulc <sulcmil@gmail.com>

RUN echo '@edge http://nl.alpinelinux.org/alpine/edge/main' >> /etc/apk/repositories && \
    apk update && apk upgrade && \
    apk add nodejs-current npm@edge git && \
    npm install -g npm@latest && \
    npm cache clean --force && \
    rm -rf /var/cache/apk/*

CMD node
