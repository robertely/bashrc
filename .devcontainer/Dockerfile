FROM ubuntu:21.04

WORKDIR /root/
COPY . .

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get -y install --no-install-recommends \
  libssl-dev \
  pkg-config \
  curl \
  ca-certificates \
  git \
  gnupg2 \
  jq \
  sudo \
  zsh \
  vim \
  build-essential \
  openssl \
  htop

# Setup Bash
RUN ln -s /workspaces/bashrc.d ~/bashrc.d
RUN rm ~/.bashrc
RUN ln -s /workspaces/bashrc.d/.devcontainer/bashrc.sh ~/.bashrc

## Install rustup and common components
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y 
ENV PATH="/root/.cargo/bin:$PATH"
RUN rustup install nightly
RUN rustup component add rustfmt
RUN rustup component add rustfmt --toolchain nightly
RUN rustup component add clippy 
RUN rustup component add clippy --toolchain nightly

RUN cargo install cargo-expand
RUN cargo install cargo-edit
