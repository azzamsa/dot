#!/usr/bin/env fish

# XDG Base Dirs
set -gx XDG_DATA_HOME "$HOME/.local/share"
set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx XDG_STATE_HOME "$HOME/.local/state"
set -gx XDG_CACHE_HOME "$HOME/.cache"

# History
set -gx HISTFILE "$XDG_STATE_HOME/fish/history"
set -gx HISTSIZE 100000
set -gx HISTFILESIZE 100000
# Note: Fish handles history differently than bash
# HISTTIMEFORMAT and HISTCONTROL are bash-specific

# Editors
set -gx TERM xterm-256color
set -gx VISUAL "{{ editor }}"
set -gx EDITOR "{{ editor }}"

#
# Private envs
if test -f ~/.config/meta/env.fish
    source ~/.config/meta/env.fish
end

#
# Paths
fish_add_path ~/.local/bin
fish_add_path ~/.local/share/go/bin
fish_add_path ~/.local/bin/appimages
fish_add_path ~/.local/bin/node/node_modules/.bin

# Rust
fish_add_path ~/.local/share/cargo/bin
fish_add_path ~/.cargo/bin
# Nvim
fish_add_path ~/.local/share/bob/nvim-bin

set -gx CARGO_HOME "$XDG_DATA_HOME/cargo"
set -gx RUSTUP_HOME "$XDG_DATA_HOME/rustup"

# Python
set -gx RYE_HOME "$XDG_DATA_HOME/rye"
set -gx IPYTHONDIR "$XDG_CONFIG_HOME/ipython"
fish_add_path "$XDG_DATA_HOME/rye/shims"

# Golang
set -gx GOPATH "$XDG_DATA_HOME/go"

# Emacs
set -gx EMACSDIR "$XDG_CONFIG_HOME/emacs"
set -gx LSP_USE_PLISTS true

# Apps
set -gx FZF_DEFAULT_COMMAND 'fd --type f --strip-cwd-prefix'
set -gx HELIX_RUNTIME ~/.config/helix/
set -gx QT_QPA_PLATFORMTHEME qt5ct
set -gx ZDOTDIR ~/.config/zsh
set -gx GNUPGHOME "$XDG_DATA_HOME/gnupg"
set -gx GRIPHOME "$XDG_CONFIG_HOME/grip"
set -gx SQLITE_HISTORY "$XDG_CACHE_HOME/sqlite_history"
set -gx PSQL_HISTORY "$XDG_DATA_HOME/psql_history"
set -gx WINEPREFIX "$XDG_DATA_HOME/wine"
set -gx LESSHISTFILE "$XDG_STATE_HOME/less/history"
set -gx CUDA_CACHE_PATH "$XDG_CACHE_HOME/nv"
set -gx VIRTUALFISH_HOME "$XDG_DATA_HOME/virtualfish"
set -gx TERMINFO "$XDG_DATA_HOME/terminfo"
set -gx TERMINFO_DIRS "$XDG_DATA_HOME/terminfo"
