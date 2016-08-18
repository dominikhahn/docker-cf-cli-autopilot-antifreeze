# Pull base image.
FROM alpine:latest

MAINTAINER Dominik Hahn <dominik@monostream.com>

# Define working directory.
WORKDIR /workspace

# Set GOPATH variable
ENV GOPATH /usr/local/bin

# Install openssl
  RUN apk --update add --quiet --no-cache openssl go zip

# Install build dependencies
RUN apk --update add --quiet --no-cache --virtual build-dependencies git

# Install cf cli
RUN wget -O - "https://cli.run.pivotal.io/stable?release=linux64-binary&source=github" | tar -C /usr/local/bin -zxf -

# Install Diego-Enabler, Antifreeze and autopilot
RUN cf install-plugin Diego-Enabler -f -r CF-Community && \
    go get github.com/contraband/autopilot && \
    cf install-plugin $GOPATH/bin/autopilot -f && \
    go get github.com/odlp/antifreeze && \
    cf install-plugin $GOPATH/bin/antifreeze -f

# Removing build dependencies
RUN apk del build-dependencies && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["/bin/ash"]
