#!/usr/bin/env fish

if [ $theme = modus_vivendi ] || [ $theme = modus_vivendi_tinted ]
    set -g red     "ff5f59"  # 7.48:1   #ff5f59
    set -g green   "44bc44"  # 13.41:1  #44bc44
    set -g yellow  "fec43f"  # 13.18:1  #fec43f
    set -g orange  "dfaf7a"  # 10.55:1  #dfaf7a
    set -g purple  "b6a0ff"  # 9.46:1   #b6a0ff
    set -g cyan    "00d3d0"  # 13.42:1  #00d3d0
    set -g pink    "feacd0"  # 12.02:1  #feacd0

    if [ $theme = modus_vivendi_tinted ]
        set -g comment "ef8386"  # 8.26:1   #ef8386
    else
        set -g comment "989898"  # 7.27:1   #989898
    end
end

# Based on folke's tokyonight moon
if [ $theme = tokyo_black ]
    set -g red     "ff757f"  # 8.1:1    #ff757f
    set -g green   "c3e88d"  # 15.24:1  #c3e88d
    set -g yellow  "ffc777"  # 13.68:1  #ffc777
    set -g orange  "ff966c"  # 9.83:1   #ff966c
    set -g purple  "fca7ea"  # 11.85:1  #fca7ea
    set -g cyan    "86e1fc"  # 14.18:1  #86e1fc
    set -g pink    "c099ff"  # 9.24:1   #c099ff
    set -g comment "9aa5ce"  # 8.65:1   #9aa5ce
end

if [ $theme = salmon_black ]
    set -g red     "ff757f"  # 8.1:1    #ff757f
    set -g green   "c3e88d"  # 15.24:1  #c3e88d
    set -g yellow  "ffc777"  # 13.68:1  #ffc777
    set -g orange  "ff966c"  # 9.83:1   #ff966c
    set -g purple  "fca7ea"  # 11.85:1  #fca7ea
    set -g cyan    "86e1fc"  # 14.18:1  #86e1fc
    set -g pink    "eda792"  # 10.54:1  #eda792
    set -g comment "9aa5ce"  # 8.65:1   #9aa5ce
end

# https://catppuccin.com/palette
if [ $theme = catppuccin_mocha ]
    set -g red     "f38ba8"  # 9.06:1,  #f38ba8
    set -g green   "a6e3a1"  # 14.12:1, #a6e3a1
    set -g yellow  "f9e2af"  # 16.52:1, #f9e2af
    set -g orange  "fab387"  # 11.86:1, #fab387
    set -g purple  "cba6f7"  # 10.33:1, #cba6f7
    set -g cyan    "94e2d5"  # 14.09:1, #94e2d5
    set -g pink    "f5c2e7"  # 13.75:1, #f5c2e7
    set -g comment "9399b2"  # 7.43:1   #9399b2
end

# Dracula
# https://draculatheme.com/
if [ $theme = dracula ]
    set -g red     "ff5555"  # 6.68:1   #ff5555
    set -g green   "50fa7b"  # 15.30:1  #50fa7b
    set -g yellow  "f1fa8c"  # 18.79:1  #f1fa8c
    set -g orange  "ffb86c"  # 12.32:1  #ffb86c
    set -g purple  "bd93f9"  # 8.71:1   #bd93f9
    set -g cyan    "8be9fd"  # 15.17:1  #8be9fd
    set -g pink    "ff79c6"  # 8.80:1   #ff79c6
    # set -g comment "6272a4"  # 4.46:1   #6272a4
    set -g comment "9399b2"  # 7.43:1   #9399b2
end

# GitHub Dark High Contrast
# https://github.com/primer/github-vscode-theme
if [ $theme = github_dark ]
    set -g red     "ff9492"  # 9.90:1   #ff9492
    set -g green   "72f088"  # 14.54:1  #72f088
    set -g yellow  "f0b72f"  # 11.52:1  #f0b72f
    set -g orange  "ffb757"  # 12.16:1  #ffb757
    set -g purple  "dbb7ff"  # 12.23:1  #dbb7ff
    # set -g cyan    "91cbff"  # 12.19:1  #91cbff
    set -g cyan    "79c0ff"  # 9.73:1   #79c0ff  (GitHub uses blue here)
    set -g pink    "ff7eb6"  # 8.91:1   #ff7eb6
    set -g comment "9198a1"  # 7.21:1   #9198a1
end

