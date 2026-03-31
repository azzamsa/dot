#!/bin/bash

CONFIG_FILE="$HOME/.config/emacs/config.el"
FONT="{{font}}"

sed -i "s|(setq +font-family \"[^\"]*\"|(setq +font-family \"$FONT\"|" "$CONFIG_FILE"

echo "Done. set Emacs font to \"$FONT\""
