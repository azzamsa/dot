#!/usr/bin/env fish

# Upgrade the OS
sudo dnf update

# editors
set -l cores \
    fish

# editors
set -l editors \
    emacs enchant2-devel \
    vim neovim

# programming
# - https://docs.rs/openssl/latest/openssl/#automatic
set -l code \
    clang mold \
    pkgconf perl-FindBin perl-IPC-Cmd openssl-devel \
    podman-compose

# utils
set -l utils \
   gnome-tweaks \
   ddcutil libgda libgda-sqlite \
   fastfetch

set -l pkgs $cores $editors $code $utils
sudo dnf install --assumeyes $pkgs
