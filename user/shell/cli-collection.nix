{ config, pkgs, ... }:
{
  # Collection of useful CLI apps
  home.packages = with pkgs; [
    # Command Line
    bat
    bc
    bottom
    brightnessctl
    cava
    direnv
    eza
    fastfetch
    fd
    gnugrep
    gnugrep
    gnused
    hwinfo
    jq
    killall
    libnotify
    neovim
    nix-direnv
    pandoc
    pciutils
    ripgrep
    rsync
    unzip
    vim
    zoxide
    (pkgs.writeShellScriptBin "airplane-mode" ''
      #!/bin/sh
      connectivity="$(nmcli n connectivity)"
      if [ "$connectivity" == "full" ]
      then
          nmcli n off
      else
          nmcli n on
      fi
    '')
  ];
}
