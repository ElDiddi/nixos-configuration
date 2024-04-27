{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    vscode
  ];

  home.file.".config/code-flags.conf".text = ''
    --ozone-platform-hint=wayland
    --disable-gpu
  '';
}