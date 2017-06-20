FROM dockette/alpine:3.6

MAINTAINER Milan Sulc <sulcmil@gmail.com>

RUN apk update && apk upgrade && \
    apk add nodejs-npm && \
    rm -rf /var/cache/apk/*

CMD nodejs
