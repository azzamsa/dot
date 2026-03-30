#!/usr/bin/env bash

# Atuin
atuin login
atuin sync

# Populate the dotfiles
just --justfile "$HOME/dot/justfile" deploy

#
# Python (Rye)
#
curl -sSf https://rye.astral.sh/get | bash

pkgs=(qmk grip poetry python-lsp-server uv yt-dlp)
for pkg in "${pkgs[@]}"; do
  rye install "$pkg"
done

#
# Node
#
fnm use v25
# To get LTS version, see https://endoflife.date/nodejs
npm install --prefix "$HOME/.local/bin/node"

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
