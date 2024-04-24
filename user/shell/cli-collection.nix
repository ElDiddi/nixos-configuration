{ pkgs, ... }:
{
  # Collection of useful CLI apps
  home.packages = with pkgs; [
    # Command Line
    cava
    killall
    libnotify
    brightnessctl
    gnugrep    
    bottom 
    ripgrep
    rsync
    unzip
    pandoc
    hwinfo
    pciutils
    vim
    fastfetch
    neovim
    gnugrep
    gnused
    bat
    eza
    fd
    bc
    direnv
    nix-direnv    
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
