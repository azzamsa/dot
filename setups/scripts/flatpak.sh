#!/usr/bin/env bash

# Add Flathub repo if not exists
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Core
core=(
  app.zen_browser.zen
  be.alexandervanhee.gradia
  com.brave.Browser
  com.github.tchx84.Flatseal
  dev.vencord.Vesktop
  io.github.flattool.Warehouse
  net.nokyan.Resources
  org.keepassxc.KeePassXC
  org.mozilla.Thunderbird
  io.github.AllanChain.sane-break
)

# Code
code=(
  io.dbeaver.DBeaverCommunity
  org.gnome.meld
  org.sqlitebrowser.sqlitebrowser
)

# Utilities
utils=(
  com.audacityteam.Audacity
  com.bilingify.readest
  com.calibre_ebook.calibre
  com.dec05eba.gpu_screen_recorder
  com.github.finefindus.eyedropper
  com.github.geigi.cozy
  com.github.IsmaelMartinez.teams_for_linux
  com.github.qarmin.czkawka
  com.github.unrud.VideoDownloader
  com.mattjakeman.ExtensionManager
  ca.desrt.dconf-editor
  io.github.alainm23.planify
  io.github.nokse22.Exhibit
  it.mijorus.gearlever
  org.atheme.audacious
  org.gimp.GIMP
  org.gnome.Evolution
  org.gnome.Firmware
  org.gnome.World.PikaBackup
  org.inkscape.Inkscape
  org.kde.kdenlive
  org.kde.okular
  org.videolan.VLC
  io.gitlab.news_flash.NewsFlash
  us.zoom.Zoom
)

# Combine selected tiers
pkgs=(
  "${core[@]}"
  "${code[@]}"
  "${utils[@]}"
)

# Install Flatpak apps
flatpak install -y flathub "${pkgs[@]}"
