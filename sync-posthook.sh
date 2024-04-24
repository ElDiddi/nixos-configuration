#!/bin/sh

# Post hooks to be called after a
# configuration sync

# Mainly just to reload stylix

# hyprland
pgrep Hyprland &> /dev/null && echo "Reloading hyprland" && hyprctl reload
pgrep .waybar-wrapped &> /dev/null && echo "Restarting waybar" && killall .waybar-wrapped && echo "Running waybar" && waybar &> /dev/null & disown;
pgrep fnott &> /dev/null && echo "Restarting fnott" && killall fnott && echo "Running fnott" && fnott &> /dev/null & disown;
pgrep Hyprland &> /dev/null && echo "Reapplying background from stylix via swaybg" && echo "Running ~/.swaybg-stylix" && ~/.swaybg-stylix &> /dev/null & disown;

# emacs
pgrep emacs &> /dev/null && echo "Reloading emacs stylix theme" && echo "Running emacsclient --no-wait --eval \"(load-theme 'doom-stylix t nil)\"" && emacsclient --no-wait --eval "(load-theme 'doom-stylix t nil)" &> /dev/null;
