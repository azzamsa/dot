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
code=(
  clang mold
  # openssl
  pkgconf perl-FindBin perl-IPC-Cmd openssl-devel
  # hurlfmt
  libxml2-devel
  podman-compose
)

# utils
utils=(
  gnome-tweaks
  # pano/copyous
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
