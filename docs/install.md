# Installation Guide

The steps I need to install fresh GNU/Linux distro on my machine.

## Current Machine

- Fedora + GNOME

## Before Migration

Look for what to backup in your notes. See "What To Backup?".

```bash
~/bin/snapshot
```

## Preparing The ISO image

Go to the distro’s website and download the **GNOME-flavored LIVE ISO**, use Fedora Media Writer to put it on USB stick.

Verify the checksum.

```shell
sha256sum -c CHECKSUM
```

## Installation

Always preview and double-check the password during installation. You don’t want to repeat the entire process just because of a typo.

Enable encrypted volumes (LUKS). Don’t make life harder by using manual partitioning.
Just go with guided mode and use the full Samsung 250 GB disk. I dedicate a separate disk for installation.
Even though I could split off `/home`, I always make sure to back everything up before reinstalling.
By doing this, I don’t have to worry about accidentally wiping important files.
I also use symlinks to my larger SSD so applications still see everything under `~/` instead of `/media/user/...`.

Stick with the defaults for everything, including locales, to avoid running into edge cases. You can always change the locale later in GNOME settings.

## Setting Up Core Packages

⚠️ Restore your previous backup.
See "Fresh Install Linux Distro" note.

```bash
$ ./packages.sh

# Set fish as default $SHELL
$ chsh -s /usr/bin/fish

$ # Wait until flatpak installed,
Then in new terminal
$ ./flatpak.sh

$ ./cargo.sh
```

## Configure Apps

```bash
./configure.sh
./dconf.sh
```

### Discord / Vestop

Change the default chat scale.
Then zoom using `Ctrl +`

### Firefox

Copy the content from previous machine to `/ect/host` to be able to access certain websites.
Change the default scale to 130%.

### KeePassXC

Increase the default value of "clear clipboard after" in KeepassXC

### Copyous

Enable `Sync to Primary clipboard`.
Increase history limit to `400`.
Disable `Keep search entry`, `Paste on copy`.

## Setting Up DNS

On laptop.

- `Setting` -> `Wifi` -> `DNS`
  - IPv4: `1.1.1.1,1.0.0.1`
  - IPv6: `2606:4700:4700::1111,2606:4700:4700::1001`

## Setup GNOME

### Tweaks

Fonts:

- Hinting : Slight
- Antialiasing: Standard (greyscale)
- Scaling Factor: 1.00

### Locale

Set time, paper size, and units in British.

Go to `Settings` -> `Region and Languages`. Set format to `United Kingdom`.

### Date & Time

`Settings` -> `Date & Time`.

Enable `Automatic Time Zone`.
Set `Time Format` to `AM/PM`.

### Shortcut / Keymap

Go to `Settings` -> `Keyboard`.

- Switch applications Disabled
- Switch windows Alt+Tab
- Switch to workspace 1	 Super+1
- Switch to workspace 2	 Super+2
- Switch to workspace 3	 Super+3
- Switch to workspace 4	 Super+4

Custom shortcut:

- Flameshot
  - name: `Grardia`
  - command: `flatpak run be.alexandervanhee.gradia --screenshot=INTERACTIVE`
  - shortcut: `Ctrl + PrtScn`

- Task
  - name: `Task`
  - command: `flatpak run --command=io.github.alainm23.planify.quick-add io.github.alainm23.planify`
  - shortcut: `Super + t`

### Multitasking

- Workspace: Fixed number. 4 workspaces.
- Application switching: include only applications from the current workspace.
- Multi-monitor: workspace on primary display only.

To prevent Apps to move to the Laptop monitor during suspension, go to `Display` and set it to `Mirror`.

### Text Editor

- Disable "Restore session"

## Finish 🎉

Go to `~/bin` and run `post_install.sh`
