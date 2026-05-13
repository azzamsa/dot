#!/usr/bin/env bash

#
# ddcutil
#
# https://github.com/daitj/gnome-display-brightness-ddcutil
sudo modprobe i2c-dev
# ddcutil capabilities | grep "Feature: 10"


#
# Fish Completions
#
mkdir -p ~/.config/fish/completions
atuin gen-completions --shell fish --out-dir ~/.config/fish/completions/
just --completions fish > ~/.config/fish/completions/just.fish
rg --generate complete-fish > ~/.config/fish/completions/rg.fish
bob complete fish > ~/.config/fish/completions/bob.fish

#
# Remove bloatware
#
remove_pkgs=(firefox)

for pkg in "${remove_pkgs[@]}"; do
  sudo dnf remove -y "$pkg"
done

sudo dnf autoremove -y
