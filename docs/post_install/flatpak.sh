#!/usr/bin/env bash

# Add Flathub repo if not exists
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Core
core=(
  app.zen_browser.zen
  com.brave.Browser
  org.signal.Signal
  dev.vencord.Vesktop
  org.keepassxc.KeePassXC
  be.alexandervanhee.gradia
  com.github.tchx84.Flatseal
  io.github.flattool.Warehouse
  net.nokyan.Resources
  org.mozilla.Thunderbird
  io.github.AllanChain.sane-break
)

# Code
code=(
  dev.zed.Zed
  io.dbeaver.DBeaverCommunity
  org.sqlitebrowser.sqlitebrowser
  org.gnome.meld
)

# Utilities
utils=(
  io.github.alainm23.planify
  org.gnome.Evolution
  com.github.finefindus.eyedropper
  io.gitlab.news_flash.NewsFlash
  org.kde.okular
  org.gimp.GIMP
  org.inkscape.Inkscape
  com.audacityteam.Audacity
  com.dec05eba.gpu_screen_recorder
  com.calibre_ebook.calibre
  com.github.geigi.cozy
  com.bilingify.readest
  com.github.qarmin.czkawka
  ca.desrt.dconf-editor
  com.mattjakeman.ExtensionManager
  it.mijorus.gearlever
  org.gnome.Firmware
  org.gnome.World.PikaBackup
  io.github.nokse22.Exhibit
  org.atheme.audacious
  org.videolan.VLC

  com.github.IsmaelMartinez.teams_for_linux
  us.zoom.Zoom
)

# Optionals (not installed by default)
optionals=(
  org.gramps_project.Gramps
  org.bleachbit.BleachBit
  fr.romainvigier.MetadataCleaner
  com.github.huluti.Curtail
  org.freecad.FreeCAD
)

# Combine selected tiers
pkgs=(
  "${core[@]}"
  "${code[@]}"
  "${utils[@]}"
)

# Install Flatpak apps
flatpak install -y flathub "${pkgs[@]}"
