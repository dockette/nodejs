FROM node:10-alpine

MAINTAINER Milan Sulc <sulcmil@gmail.com>

ENV TERM xterm

ENV USER_UID 1000
ENV USER_NAME dfx
ENV USER_HOME /home/dfx

RUN apk update && \
    apk upgrade && \
    apk --no-cache add shadow && \
    usermod -l $USER_NAME node && \
    apk del shadow && \
    rm -rf /var/cache/apk/*

CMD node
