FROM ubuntu:25.04

LABEL maintainer="theoneandonlywoj@gmail.com"
LABEL version="0.1"

# Disable Prompt During Packages Installation
ARG DEBIAN_FRONTEND=noninteractive

# Updating the package list
RUN apt update

# Locale
RUN apt-get install -y locales locales-all
ENV LC_ALL=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US.UTF-8
ENV TZ=Europe/Warsaw

# ----- #
# Shell #
# ----- #
# Zsh
RUN apt install -y zsh

# Oh-my-zh - Zsh config
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Tooling
RUN apt install -y \
  git \
  gettext \
  curl \
  tree \
  tzdata \
  autoconf \
  automake \
  cmake \
  pkg-config \
  zip \
  unzip \
  libtool \
  libtool-bin \
  g++ \
  software-properties-common

# ------------ #
# Text Editing #
# ------------ #
# Neovim
RUN add-apt-repository ppa:neovim-ppa/unstable
RUN apt install -y neovim

# AstroVim
RUN git clone --depth 1 https://github.com/AstroNvim/template ~/.config/nvim

# --------------------- #
# Programming Languages #
# --------------------- #
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

# Expose some ports to host by default.
EXPOSE 4000 8080 8081 8082 8083 8084 8085

ENV TERM=xterm-256color

CMD ["tail", "-f", "/dev/null"] 