#!/usr/bin/env bash

# Upgrade the OS
sudo dnf update -y

# cores
cores=(
  fish
)

# editors
editors=(
  emacs enchant2-devel
  vim neovim
)

# programming
# - https://docs.rs/openssl/latest/openssl/#automatic
code=(
  clang mold
  pkgconf perl-FindBin perl-IPC-Cmd openssl-devel
  podman-compose
)

# utils
utils=(
  gnome-tweaks
  ddcutil libgda libgda-sqlite
  fastfetch
)

# combine all arrays
pkgs=(
  "${cores[@]}"
  "${editors[@]}"
  "${code[@]}"
  "${utils[@]}"
)

# install packages
sudo dnf install -y "${pkgs[@]}"
