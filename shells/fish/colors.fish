#!/usr/bin/env fish

if [ $theme = modus_vivendi ]
    set -g red     "ff5f59"  # 7.48:1,  "#ff5f59"
    set -g green   "44bc44"  # 13.41:1, "#44bc44"
    set -g yellow  "fec43f"  # 13.18:1, "#fec43f"
    set -g orange  "dfaf7a"  # 10.55:1, "#dfaf7a"
    set -g purple  "b6a0ff"  # 9.46:1,  "#b6a0ff"
    set -g cyan    "00d3d0"  # 13.42:1, "#00d3d0"
    set -g pink    "feacd0"  # 12.02:1, "#feacd0"
end

if [ $theme = tokyonight_moon ]
    # Source:
    # - https://github.com/folke/tokyonight.nvim/blob/main/extras/fish/tokyonight_moon.fish

    set -g red     "ff757f"  # 8.1:1,   "#ff757f"
    set -g green   "c3e88d"  # 15.24:1, "#c3e88d"
    set -g yellow  "ffc777"  # 13.68:1, "#ffc777"
    set -g orange  "ff966c"  # 9.83:1,  "#ff966c"
    set -g purple  "fca7ea"  # 11.85:1, "#fca7ea"
    set -g cyan    "86e1fc"  # 14.18:1, "#86e1fc"
    set -g pink    "c099ff"  # 9.24:1,  "#c099ff"
end

# All the colors below are kept across theme.
set -g selection 4a4f69 # #4a4f69 (modus-vivendi bg-active)
set -g comment 989898 # 7.27:1, #989898 (modus-vivendi fg-dim)
set -g foreground ffffff # 21:1, #ffffff
