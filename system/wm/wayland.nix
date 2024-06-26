{ config, pkgs, systemSettings, ... }:

{
  imports = [
    ./pipewire.nix
    ./dbus.nix
    ./gnome-keyring.nix
    ./fonts.nix
  ];

  environment.systemPackages = with pkgs; [
    wayland (
      sddm-chili-theme.override {
        themeConfig = {
          background = config.stylix.image;
          ScreenWidth = 1920;
          ScreenHeight = 1080;
          blur = true;
          recursiveBlurLoops = 3;
          recursiveBlurRadius = 5;
        };
      }
    )
  ];

  # Configure xwayland
  services.xserver = {
    enable = true;
    xkb = {
      layout = systemSettings.localeShort;
      variant = "";
      options = "caps:escape";
    };
  };
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    enableHidpi = true;
    theme = "chili";
    package = pkgs.sddm;
  };
}