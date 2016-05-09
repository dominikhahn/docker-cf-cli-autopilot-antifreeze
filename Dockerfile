# Pull base image.
FROM alpine:latest

MAINTAINER Dominik Hahn <dominik@monostream.com>

# Define working directory.
WORKDIR ["/workspace"]

# Set GOPATH variable
ENV GOPATH /usr/local/bin

# Install cf-cli, golang and zip
RUN apk --update add --quiet --no-cache ca-certificates go git zip \
  && rm -rf /var/cache/apk/*
RUN wget -O - "http://cli.run.pivotal.io/stable?release=linux64-binary&source=github" | tar -C /usr/local/bin -zxf -

# Install autopilot
RUN go get github.com/concourse/autopilot \
  && cf install-plugin $GOPATH/bin/autopilot -f

# Install Antifreeze
RUN go get github.com/odlp/antifreeze \
  && cf install-plugin $GOPATH/bin/antifreeze -f

ENTRYPOINT ["/bin/ash"]
