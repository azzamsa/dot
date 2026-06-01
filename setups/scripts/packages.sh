#!/usr/bin/env bash

# Enable fastestmirror + bump parallel downloads
sudo dnf config-manager setopt fastestmirror=True max_parallel_downloads=10
# Upgrade the OS
sudo dnf update -y
sudo dnf install --nogpgcheck --repofrompath 'terra,https://repos.fyralabs.com/terra$releasever' terra-release

# cores
cores=(
  niri dms bibata-cursor-theme satty
  fish starship atuin eza
  zoxide bat yazi fd-find ripgrep
  ghostty kitty
)

# editors
editors=(
  emacs enchant2-devel
  vim
  zed
)

# programming
code=(
  clang mold
  # openssl
  pkgconf perl-FindBin perl-IPC-Cmd openssl-devel
  # hurlfmt
  libxml2-devel
  podman-compose telnet mise
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
