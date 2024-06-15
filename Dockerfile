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
WORKDIR /setup_files

# Nvim
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
  ripgrep \
  cargo

### Rust is a dependency of Lunarvim
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
# Add .cargo/bin to PATH
ENV PATH="/root/.cargo/bin:${PATH}"

# Nerdfonts
RUN curl -fsSL https://raw.githubusercontent.com/getnf/getnf/main/install.sh | bash -s -- --branch=release-0.1

# Lunarvim
RUN curl -L https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh > install_lvim.sh
RUN bash install_lvim.sh -y
ENV PATH="/root/.local/bin:$PATH"

## First boot
RUN lvim +'LvimUpdate' +qall

COPY config.lua /root/.config/lvim/config.lua

## Sync all confif packages
RUN lvim --headless +'Lazy sync' +qall

## Treesitter
RUN lvim --headless +'TSInstallSync lua query markdown_inline comment regex gitignore dockerfile markdown yaml html json' +qall

## Linters
### yamllint - YAML files
### markdownlint - Markdown files
### jsonlint - JSON files
### ansible-lint - best practices (https://github.com/ansible/ansible-lint)
RUN apt install python3.12-venv -y
RUN lvim --headless +'MasonInstall yamllint markdownlint jsonlint ansible-lint' +qall

## Formatter
### yamlfmt = YAML files
### jq - command-line JSON processor
RUN lvim --headless +'MasonInstall yamlfmt jq' +qall

# Host files will be here
RUN mkdir -p /__project
RUN git config --global --add safe.directory /__project
WORKDIR /__project

CMD tail -f /dev/null
