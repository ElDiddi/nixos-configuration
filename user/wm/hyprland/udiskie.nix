{ pkgs, ... }:

{
  home.packages = with pkgs; [
    udisks
    udiskie
  ];

  services.udiskie.enable = true;
  services.udiskie.tray = "never";
}