FROM dockette/edge

MAINTAINER Milan Sulc <sulcmil@gmail.com>

RUN echo '@edge http://nl.alpinelinux.org/alpine/edge/main' >> /etc/apk/repositories && \
    apk update && apk upgrade && \
    apk add nodejs-current-npm@edge && \
    npm --silent install --global --depth 0 pnpm && \
    rm -rf /var/cache/apk/*

CMD nodejs
