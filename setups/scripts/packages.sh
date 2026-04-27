#!/usr/bin/env bash

# Upgrade the OS
sudo dnf update -y
sudo dnf install --nogpgcheck --repofrompath 'terra,https://repos.fyralabs.com/terra$releasever' terra-release

# cores
cores=(
  fish starship atuin eza
  zoxide bat yazi fd-find
  ghostty
)

# editors
editors=(
  emacs enchant2-devel
  vim neovim
  zed
)

# programming
code=(
  clang mold
  # openssl
  pkgconf perl-FindBin perl-IPC-Cmd openssl-devel
  # hurlfmt
  libxml2-devel
  podman-compose mise
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
  fastfetch tuptime
  # socials
  gurk
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


#
# Python
#
mise use -g uv@latest
