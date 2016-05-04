# Pull base image.
FROM debian:latest

MAINTAINER Dominik Hahn <dominik@monostream.com>

# Define working directory.
WORKDIR ["/workspace"]

ENV GOPATH="/usr/local/bin"

# Install cf-cli, golang and zip
RUN apt-get update -q \
  && apt-get upgrade -y -q \
  && apt-get -y -q install wget ca-certificates golang git zip curl xz-utils
RUN wget -O - "http://cli.run.pivotal.io/stable?release=linux64-binary&source=github" | tar -C /usr/local/bin -zxf -
RUN export GOPATH="/usr/local/bin"

# Install autopilot
RUN go get github.com/concourse/autopilot
RUN cf install-plugin $GOPATH/bin/autopilot

# Install Antifreeze
RUN go get github.com/odlp/antifreeze
RUN cf install-plugin $GOPATH/bin/antifreeze

# Cleanup image
RUN apt-get autoremove -y -q
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /var/tmp/*
