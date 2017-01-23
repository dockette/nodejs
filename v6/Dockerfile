FROM dockette/edge

RUN echo '@edge http://nl.alpinelinux.org/alpine/edge/main' >> /etc/apk/repositories && \
    apk update && apk upgrade && \
    apk add nodejs@edge && \
    rm -rf /var/cache/apk/*
