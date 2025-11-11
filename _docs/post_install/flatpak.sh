#!/usr/bin/env fish
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Tier 1: Core Daily Tools
set -l core_pkgs (
# editors
dev.zed.Zed

    com.google.Chrome
    org.telegram.desktop
    com.github.IsmaelMartinez.teams_for_linux
    us.zoom.Zoom
    dev.vencord.Vesktop
    org.keepassxc.KeePassXC
    io.dbeaver.DBeaverCommunity
    org.flameshot.Flameshot
    com.github.tchx84.Flatseal
    io.github.flattool.Warehouse
)

# Tier 2: Frequent Task-Specific Tools
set -l task_pkgs (
    org.mozilla.Thunderbird
    org.gnome.Evolution
    io.gitlab.news_flash.NewsFlash
    net.nokyan.Resources
    com.github.finefindus.eyedropper
    org.kde.okular
    org.sqlitebrowser.sqlitebrowser
    org.gnome.meld
    app.zen_browser.zen
)

# Tier 3: Project and Creative Tools
set -l project_pkgs (
    org.gimp.GIMP
    org.inkscape.Inkscape
    com.audacityteam.Audacity
    com.dec05eba.gpu_screen_recorder
    com.calibre_ebook.calibre
    com.github.johnfactotum.Foliate
    com.github.qarmin.czkawka
    ca.desrt.dconf-editor
    com.mattjakeman.ExtensionManager
    it.mijorus.gearlever
)

# Tier 4: System Maintenance and Utilities
set -l utility_pkgs (
    org.gnome.Firmware
    org.gnome.World.PikaBackup
    io.github.pieterdd.StretchBreak
    io.github.nokse22.Exhibit
    org.atheme.audacious
)

# Combine all packages into a single list for installation
set -l pkgs $core_pkgs $task_pkgs $project_pkgs $utility_pkgs

for pkg in $pkgs
    flatpak install flathub --assumeyes "$pkg"
end

# Optionals
# org.gramps_project.Gramps org.bleachbit.BleachBit fr.romainvigier.MetadataCleaner com.github.huluti.Curtail
