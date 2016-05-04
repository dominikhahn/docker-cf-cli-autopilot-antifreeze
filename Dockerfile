# Pull base image.
FROM alpine:latest

MAINTAINER Dominik Hahn <dominik@monostream.com>

# Define working directory.
WORKDIR ["/workspace"]

# Set GOPATH variable
ENV GOPATH /usr/local/bin

# Install cf-cli, golang and zip
RUN apk update --quiet \
  && apk upgrade --quiet \
  && apk add --quiet wget ca-certificates go git zip curl \
  && rm -rf /var/cache/apk/*
RUN wget -O - "http://cli.run.pivotal.io/stable?release=linux64-binary&source=github" | tar -C /usr/local/bin -zxf -

# Install autopilot
RUN go get github.com/concourse/autopilot
RUN cf install-plugin $GOPATH/bin/autopilot -f

# Install Antifreeze
RUN go get github.com/odlp/antifreeze
RUN cf install-plugin $GOPATH/bin/antifreeze -f
