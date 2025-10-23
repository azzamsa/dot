#!/usr/bin/env fish

# I prefer to work with `fish` than `bash`
sudo apt install --assume-yes netselect-apt fish flatpak gnome-software-plugin-flatpak

# Find the fastest mirrors.
sudo netselect-apt
# Upgrade The Os
sudo apt update && sudo apt upgrade

#
# Setup Core Packages
set -l pkgs bash git fish curl wl-clipboard \
    emacs aspell libenchant-2-dev \
    vim neovim \
    # Rust
    clang mold libssl-dev \
    # Prompt
    zoxide ffmpeg 7zip poppler-utils imagemagick \
    # Extensions
    ddcutil gir1.2-gda-5.0 gir1.2-gsound-1.0 \
    # Polish
    gnome-tweaks bibata-cursor-theme gnome-shell-pomodoro fastfetch \
    # pandoc will pull a whopping `199.2 MB` deps, because it so powerful it pull latex and everything.
    jq fd-find ripgrep fzf telnet pandoc podman podman-compose shfmt markdown \
    # appimage
    libfuse-dev \
    # utils
    rsync

for pkg in $pkgs
    sudo apt install --assume-yes $pkg
end
