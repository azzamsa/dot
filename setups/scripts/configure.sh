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
atuin gen-completions --shell fish --out-dir "$HOME/.config/fish/completions/"
just --completions fish > "$HOME/.config/fish/completions/just.fish"
rg --generate complete-fish > "$HOME/.config/fish/completions/rg.fish"

#
# Remove bloatware
#
remove_pkgs=(firefox)

for pkg in "${remove_pkgs[@]}"; do
  sudo dnf remove -y "$pkg"
done

sudo dnf autoremove -y
