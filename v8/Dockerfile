FROM dockette/alpine:edge

MAINTAINER Milan Sulc <sulcmil@gmail.com>

RUN apk update && apk upgrade && \
    apk add nodejs-current-npm && \
    rm -rf /var/cache/apk/*

CMD nodejs
