FROM alpine

MAINTAINER Frederic Darmstädter <docker@darmstaedter.org>

ENV CLONE_FROM https://github.com/darmstaedter/welcome-project.git
ENV CLONE_TO /usr/share/nginx
ENV ADD_KNOWN_HOSTS github.com bitbucket.org
ENV BRANCH master 

RUN apk update && \
    apk upgrade && \
    apk add --no-cache bash git openssh-client && \
    mkdir ~/.ssh && \
    ssh-keyscan $ADD_KNOWN_HOSTS >> ~/.ssh/known_hosts && \
    mkdir -p $CLONE_TO/html/html && \
    rm -r $CLONE_TO/*
    
CMD git clone --single-branch --branch $BRANCH $CLONE_FROM $CLONE_TO
