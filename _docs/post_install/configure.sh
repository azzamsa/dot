#!/usr/bin/env fish

# Atuin
atuin login
atuin sync

# Populate the dotfiles.
just --justfile ~/dot/justfile deploy

#
# Python
curl -sSf https://rye.astral.sh/get | bash

set -l pkgs qmk grip poetry python-lsp-server uv yt-dlp
for pkg in $pkgs
    rye install $pkg
end

#
# Node
fnm use v25
# To get LTS version, see https://endoflife.date/nodejs
npm install --prefix ~/opt/nodebin

#
# ddcutil
# https://github.com/daitj/gnome-display-brightness-ddcutil
sudo modprobe i2c-dev
# ddcutil capabilities | grep "Feature: 10"

#
# Flameshot
# allow Flatpak Flameshot to take screenshots
flatpak permission-set screenshot screenshot org.flameshot.Flameshot yes
# Check if it's working as intended.
# flatpak run --command=flameshot org.flameshot.Flameshot gui

#
# Fish Completions
atuin gen-completions --shell fish --out-dir ~/.config/fish/completions/
just --completions fish >~/.config/fish/completions/just.fish
rg --generate complete-fish >~/.config/fish/completions/rg.fish

#
# More Binaries
eget idursun/jjui --to ~/.local/bin/jjui
eget getzola/zola

#
# Remove bloatware.
#

set -l pkgs \
    firefox

for pkg in $pkgs
    sudo dnf remove --assumeyes $pkg
end

sudo dnf autoremove
