FROM dockette/alpine:edge

RUN echo '@community http://nl.alpinelinux.org/alpine/edge/community' >> /etc/apk/repositories && \
    apk update && apk upgrade && \
    # DEPENDENCIES #############################################################
    apk add --update git && \
    # NODEJS ###################################################################
    apk add --update nodejs-current@community npm@community && \
    # CLEAN UP #################################################################
    rm -rf /var/cache/apk/*

CMD nodejs
