#!/usr/bin/env fish
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Tier 1: Core Daily Tools
set -l cores \
    app.zen_browser.zen \
    dev.zed.Zed \
    com.brave.Browser \
    org.signal.Signal \
    com.github.IsmaelMartinez.teams_for_linux \
    us.zoom.Zoom \
    dev.vencord.Vesktop \
    org.keepassxc.KeePassXC \
    io.dbeaver.DBeaverCommunity \
    org.flameshot.Flameshot \
    com.github.tchx84.Flatseal \
    io.github.flattool.Warehouse

# Tier 2: Frequent Task-Specific Tools
set -l tasks \
    org.mozilla.Thunderbird \
    org.gnome.Evolution \
    io.gitlab.news_flash.NewsFlash \
    net.nokyan.Resources \
    com.github.finefindus.eyedropper \
    org.kde.okular \
    org.sqlitebrowser.sqlitebrowser \
    org.gnome.meld

# Tier 3: Project and Creative Tools
set -l projects \
    org.gimp.GIMP \
    org.inkscape.Inkscape \
    com.audacityteam.Audacity \
    com.dec05eba.gpu_screen_recorder \
    com.calibre_ebook.calibre \
    com.github.geigi.cozy \
    com.github.johnfactotum.Foliate \
    com.github.qarmin.czkawka \
    ca.desrt.dconf-editor \
    com.mattjakeman.ExtensionManager

# Tier 4: System Maintenance and Utilities
set -l utils \
    it.mijorus.gearlever \
    org.gnome.Firmware \
    org.gnome.World.PikaBackup \
    io.github.pieterdd.StretchBreak \
    io.github.nokse22.Exhibit \
    org.atheme.audacious \
    org.videolan.VLC

# Optionals
set -l optionals \
    org.gramps_project.Gramps \
    org.bleachbit.BleachBit \
    fr.romainvigier.MetadataCleaner \
    com.github.huluti.Curtail \
    org.freecad.FreeCAD

# Combine all packages into a single list for installation
set -l pkgs $cores $tasks $projects $utils
sudo dnf install --assumeyes $pkgs
