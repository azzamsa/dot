#!/bin/bash

FONT="{{font}}"

sed -i "s|(setq +font-family \"[^\"]*\"|(setq +font-family \"$FONT\"|" "$HOME/.config/emacs/config.el"
echo "Done. Set Emacs font to '$FONT'"

update-desktop-database ~/.local/share/applications
echo "Done. Updated desktop databasese"

matugen json wm/dms/themes/{{wm_theme}}.json
echo "Done. Generated Matugen colors for '{{wm_theme}}'"
