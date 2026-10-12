# Alpine ships no Node.js 25 package (3.22 has 23, 3.23 has 24), use the official image
FROM node:25-alpine

LABEL maintainer="Milan Sulc <sulcmil@gmail.com>"

RUN apk update && apk upgrade && \
    # DEPENDENCIES #############################################################
    apk add --update git && \
    # CLEAN UP #################################################################
    rm -rf /var/cache/apk/*

CMD node
