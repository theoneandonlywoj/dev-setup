FROM ubuntu:24.10

LABEL maintainer="theoneandonlywoj@gmail.com"
LABEL version="0.3"

# Disable Prompt During Packages Installation
ARG DEBIAN_FRONTEND=noninteractive

# Updating the package list
RUN apt update

# -------
# Locale
# -------
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

# ----------------
# General Tooling
# ----------------
RUN apt-get install -y \
  # Git
  git \
  # cURL
  curl \ 
  # Timezone data
  tzdata \
  # Internalization and localization
  gettext \
  # Cross-platform make system
  cmake \
  # Fuzzy find for fast file search
  fzf \
  # Ripgrep
  ripgrep \
  # Tree - folder visualisation
  tree

## LazyGit
RUN LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*') \
  && curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz" \
  && tar xf lazygit.tar.gz lazygit \
  && install lazygit /usr/local/bin \
  && rm lazygit.tar.gz

# Git buffer config
RUN git config --global http.postBuffer 1048576000
RUN git config --global https.postBuffer 1048576000

# -----
# ASDF
# -----
  RUN git config --global advice.detachedHead false; \
  git clone https://github.com/asdf-vm/asdf.git $HOME/.asdf --branch v0.10.2; \
  /bin/bash -c 'echo -e "\n\n## Configure ASDF \n. $HOME/.asdf/asdf.sh" >> ~/.bashrc'; \
  /bin/bash -c 'echo -e "\n\n## ASDF Bash Completion: \n. $HOME/.asdf/completions/asdf.bash" >> ~/.bashrc';

## Add asdf to PATH, so it can be run in this Dockerfile
ENV PATH="$PATH:/root/.asdf/bin"

## Add asdf shims to PATH, so installed executables can be run in this Dockerfile
ENV PATH=$PATH:/root/.asdf/shims

# -------
# Erlang
# -------
## Dependencies (source: https://github.com/asdf-vm/asdf-erlang?tab=readme-ov-file#ubuntu-2404-lts)
RUN apt-get -y install \
  build-essential \
  autoconf \
  m4 \
  libncurses5-dev \
  libwxgtk3.2-dev \
  libwxgtk-webview3.2-dev \
  libgl1-mesa-dev \
  libglu1-mesa-dev \
  libpng-dev \
  libssh-dev \
  unixodbc-dev \
  xsltproc \
  fop \
  libxml2-utils \
  libncurses-dev \
  openjdk-11-jdk

## Install
RUN asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git
RUN asdf install erlang 27.1.1
RUN asdf global erlang 27.1.1

## Version
RUN erl -eval '{ok, Version} = file:read_file(filename:join([code:root_dir(), "releases", erlang:system_info(otp_release), "OTP_VERSION"])), io:fwrite(Version), halt().' -noshell

# -------
# Elixir
# -------
## Add Elixir plugin
RUN asdf plugin-add elixir

## Install
RUN asdf install elixir 1.18.0-rc.0-otp-27
RUN asdf global elixir 1.18.0-rc.0-otp-27

## Version
RUN elixir --version

## Hex
RUN mix local.hex --force

## Rebar
RUN mix local.rebar --force

## Phoenix CLI
RUN mix archive.install hex phx_new --force

# -------
# Neovim
# -------
## Dependencies
RUN apt-get -y install \
  ninja-build \
  gettext \
  cmake \
  unzip \
  curl \
  build-essential

## Install from source
RUN mkdir -p /root/TMP
RUN cd /root/TMP && git clone https://github.com/neovim/neovim
RUN cd /root/TMP/neovim && git checkout stable && make -j4 && make install
RUN rm -rf /root/TMP

## Config
### LazyVim
ADD .config/nvim root/.config/nvim

#### Lazy Install
RUN nvim --headless "+Lazy! update" +q!

# --------------
# Project Files
# --------------
RUN mkdir -p /__project
RUN git config --global --add safe.directory /__project
WORKDIR /__project

ENV TERM=xterm-256color

CMD ["tail", "-f", "/dev/null"] 