{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    alacritty
  ];
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        opacity = lib.mkForce 0.75;
        padding.x = 10;
        padding.y = 10;
      };
      terminal.osc52 = "OnlyCopy";
    };
  };
}