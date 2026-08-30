FROM dockette/alpine:3.23

RUN echo '@community http://nl.alpinelinux.org/alpine/v3.23/community' >> /etc/apk/repositories && \
    apk update && apk upgrade && \
    # DEPENDENCIES #############################################################
    apk add --update git && \
    # NODEJS ###################################################################
    apk add --update nodejs-current@community npm && \
    # CLEAN UP #################################################################
    rm -rf /var/cache/apk/*

CMD nodejs
