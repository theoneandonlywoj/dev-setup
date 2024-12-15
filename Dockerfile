FROM ubuntu:24.04

LABEL maintainer="theoneandonlywoj@gmail.com"
LABEL version="0.1"

# Disable Prompt During Packages Installation
ARG DEBIAN_FRONTEND=noninteractive

# Updating the package list
RUN apt update

# Locale
RUN apt-get install -y \
  locales \
  locales-all
ENV LC_ALL=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US.UTF-8
ENV TZ=Europe/Warsaw

# Expose some ports to host by default.
EXPOSE 4000 8080 8081 8082 8083 8084 8085

RUN apt-get update 
RUN apt-get -y install curl \
    tree \
    git \
    xclip \
    tzdata \
    ninja-build \
    gettext \
    libtool \
    libtool-bin \
    autoconf \
    automake \
    cmake \
    g++ \
    pkg-config \
    zip \
    unzip

# ASDF
RUN git config --global advice.detachedHead false; \
  git clone https://github.com/asdf-vm/asdf.git $HOME/.asdf --branch v0.10.2; \
  /bin/bash -c 'echo -e "\n\n## Configure ASDF \n. $HOME/.asdf/asdf.sh" >> ~/.bashrc'; \
  /bin/bash -c 'echo -e "\n\n## ASDF Bash Completion: \n. $HOME/.asdf/completions/asdf.bash" >> ~/.bashrc';

## Add asdf to PATH, so it can be run in this Dockerfile
ENV PATH="$PATH:/root/.asdf/bin"

## Add asdf shims to PATH, so installed executables can be run in this Dockerfile
ENV PATH=$PATH:/root/.asdf/shims

## Deps
RUN apt install -y \
  automake \
  autoconf \
  libreadline-dev \
  libncurses-dev \
  libssl-dev \
  libyaml-dev \
  libxslt-dev \
  libffi-dev \
  libtool \
  unixodbc-dev \
  unzip

# Elixir and Erlang
ENV KERL_CONFIGURE_OPTIONS="--disable-debug --without-javac"
RUN asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git
RUN asdf plugin-add elixir
RUN asdf install erlang 27.1.1
RUN asdf global erlang 27.1.1
RUN asdf install elixir 1.17.3-otp-27
RUN asdf global elixir 1.17.3-otp-27
RUN mix local.hex --force
RUN mix local.rebar --force
RUN mix archive.install hex phx_new --force

# Neovim
## Install from source
RUN mkdir -p /root/TMP
RUN cd /root/TMP && git clone https://github.com/neovim/neovim
RUN cd /root/TMP/neovim && git checkout stable && make -j4 && make install
RUN rm -rf /root/TMP

# Config
COPY .config/ /root/.config/
RUN chmod +x /root/.config/elixir_ls/language_server.sh

# Host files will be here
RUN mkdir -p /__project
RUN git config --global --add safe.directory /__project
WORKDIR /__project

ENV TERM=xterm-256color

CMD ["tail", "-f", "/dev/null"] 