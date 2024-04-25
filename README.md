# Information
- this nix configuration contains content from different public git repos
- the initial configuration based on LibrePhoenix - https://github.com/librephoenix - ty Emmet


# Content
- NixOS 24.05 (nightly) with flakes and home-manager

- Desktop Manager: wayland (nvidia)
- Window Manager: hyprland
  - fnott     # notification daemon
  - fuzzel    # application launcher
  - hyprlock  # screen locking utility
  - rofi
  - stylix    # theme manager
  - swappy    # screenshot tool
  - udiskie   # removable disk automounter
  - waybar    # wyland bar
  - wlogout   # logout menu
- Theme: catppuccin-mocha
- Terminal: alacritty (kitty fallback)
- Shell: zsh - fzf, z