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
  # appimages
  fuse fuse-libs
  # pano/copyous
  ddcutil libgda libgda-sqlite
  # yazi
  ffmpeg p7zip p7zip-plugins jq poppler-utils fzf ImageMagick
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
