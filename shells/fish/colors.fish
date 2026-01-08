if [ $theme = modus_vivendi ]
    set -g red     "ff5f59"  # 7.48:1,  "#ff5f59"
    set -g green   "44bc44"  # 13.41:1, "#44bc44"
    set -g yellow  "fec43f"  # 13.18:1, "#fec43f"
    set -g orange  "dfaf7a"  # 10.55:1, "#dfaf7a"
    set -g purple  "b6a0ff"  # 9.46:1,  "#b6a0ff"
    set -g cyan    "00d3d0"  # 13.42:1, "#00d3d0"
    set -g pink    "feacd0"  # 12.02:1, "#feacd0"

else if [ $theme = catppuccin_mocha ]
    # Source:
    # - https://catppuccin.com/palette

    set -g red     "f38ba8"  # 9.06:1,  "#f38ba8"
    set -g green   "a6e3a1"  # 14.12:1, "#a6e3a1"
    set -g yellow  "f9e2af"  # 16.52:1, "#f9e2af"
    set -g orange  "fab387"  # 11.86:1, "#fab387"
    set -g purple  "cba6f7"  # 10.33:1, "#cba6f7"
    set -g cyan    "94e2d5"  # 14.09:1, "#94e2d5"
    set -g pink    "f5c2e7"  # 13.75:1, "#f5c2e7"

else if [ $theme = tokyonight_moon ]
    # Source:
    # - https://github.com/folke/tokyonight.nvim/blob/main/extras/fish/tokyonight_moon.fish

    set -g red     "ff757f"  # 8.1:1,   "#ff757f"
    set -g green   "c3e88d"  # 15.24:1, "#c3e88d"
    set -g yellow  "ffc777"  # 13.68:1, "#ffc777"
    set -g orange  "ff966c"  # 9.83:1,  "#ff966c"
    set -g purple  "fca7ea"  # 11.85:1, "#fca7ea"
    set -g cyan    "86e1fc"  # 14.18:1, "#86e1fc"
    set -g pink    "c099ff"  # 9.24:1,  "#c099ff"

else if [ $theme = tokyonight_night ]
    set -g red     "f7768e"  # 7.93:1,  "#f7768e"
    set -g green   "9ece6a"  # 11.49:1, "#9ece6a"
    set -g yellow  "e0af68"  # 10.5:1,  "#e0af68"
    set -g orange  "ff9e64"  # 10.32:1, "#ff9e64"
    set -g purple  "9d7cd8"  # 6.3:1,   "#9d7cd8"
    set -g cyan    "7dcfff"  # 12.24:1, "#7dcfff"
    set -g pink    "bb9af7"  # 9.07:1,  "#bb9af7"

else if [ $theme = dracula ]
    # Source:
    # - https://github.com/dracula/fish/blob/master/themes/Dracula%20Official.theme

    set -g red     "ff5555"  # 6.68:1 (AA), "#ff5555"
    set -g green   "50fa7b"  # 15.3:1,      "#50fa7b"
    set -g yellow  "f1fa8c"  # 18.79:1,     "#f1fa8c"
    set -g orange  "ffb86c"  # 12.32:1,     "#ffb86c"
    set -g purple  "bd93f9"  # 8.7:1,       "#bd93f9"
    set -g cyan    "8be9fd"  # 15.17:1,     "#8be9fd"
    set -g pink    "ff79c6"  # 8.8:1,       "#ff79c6"

else if [ $theme = github ]
    # Github Dark Default
    # https://github.com/primer/primitives/blob/main/src/tokens/base/color/dark/dark.json5

    set -g red     "ff7b72"  # 9.06:1,  "#ff7b72"
    set -g green   "7ee787"  # 14.12:1, "#7ee787"
    set -g yellow  "f2cc60"  # 16.52:1, "#f2cc60"
    set -g orange  "ffa657"  # 11.86:1, "#ffa657"
    set -g purple  "d2a8ff"  # 10.33:1, "#d2a8ff"
    set -g cyan    "79c0ff"  # 14.09:1, "#79c0ff"
    set -g pink    "ffbedd"  # 13.75:1, "#ffbedd"
end

# All the colors below are kept across theme.
set -g selection  "1e1e2e"  # "#1e1e2e"  (Catppuccin Mocha Base)
# Catppuccin Mocha Subtext 1 ("#bac2de") is too bright (11.85:1)
set -g comment    "a6adc8"  # 9.43:1,    "#a6adc8" (Catppuccin Mocha Subtext 0)
set -g foreground "ffffff"  # 21:1,      "#ffffff"
