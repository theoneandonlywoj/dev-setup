FROM ubuntu:24.10

LABEL maintainer="theoneandonlywoj@gmail.com"
LABEL version="1.0.0-rc.2"

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

COPY .config/lazygit/config.yml root/.config/lazygit/config.yml

# Git buffer config
RUN git config --global http.postBuffer 1048576000
RUN git config --global https.postBuffer 1048576000

RUN curl https://mise.run | sh

RUN echo 'eval "$(~/.local/bin/mise activate bash)"' >> ~/.bashrc
RUN echo 'eval "$(~/.local/bin/mise activate zsh)"' >> ~/.zshrc

CMD ["tail", "-f", "/dev/null"]
