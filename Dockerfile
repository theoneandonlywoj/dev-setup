FROM ubuntu:24.04

LABEL maintainer="theoneandonlywoj@gmail.com"
LABEL version="0.1"

# Disable Prompt During Packages Installation
ARG DEBIAN_FRONTEND=noninteractive

# Updating the package list
RUN apt update

# Basics
RUN apt-get install -y \
  git \
  curl \
  software-properties-common

RUN mkdir -p /setup_files
WORKDIR /setup_fies

# Nvim
#RUN curl -L https://github.com/neovim/neovim/releases/download/v0.10.0/nvim-linux64.tar.gz > nvim-linux64.tar.gz
#RUN tar xzvf nvim-linux64.tar.gz
#RUN mv ./nvim-linux64/bin/nvim /bin/nvim
RUN add-apt-repository ppa:neovim-ppa/unstable -y
RUN apt update
RUN apt install neovim -y

# Lunarvim
## Dependencies
RUN apt-get install -y \
  python3 \
  pip \
  nodejs \
  npm \
  ripgrep

### Rust is a dependency of Lunarvim
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
# Add .cargo/bin to PATH
ENV PATH="/root/.cargo/bin:${PATH}"

# Lunarvim
RUN curl -L https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh > install_lvim.sh
RUN bash install_lvim.sh -y

ENV PATH="~/.local/bin:$PATH"

# Host files will be here
RUN mkdir -p /Repos
WORKDIR "/Repos"

CMD tail -f /dev/null
