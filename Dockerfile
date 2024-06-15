FROM ubuntu:24.04

LABEL maintainer="theoneandonlywoj@gmail.com"
LABEL version="0.1"

# Disable Prompt During Packages Installation
ARG DEBIAN_FRONTEND=noninteractive

# Updating the package list
RUN apt update

# Basics
RUN apt-get install -y \
        git

RUN mkdir -p /Repos
# Come back to the main folder
WORKDIR "/"

CMD tail -f /dev/null
