# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, lib, systemSettings, userSettings, ... }:
{
  imports = [
    ../../system/hardware-configuration.nix
    ../../system/hardware/systemd.nix # systemd config
    ../../system/hardware/kernel.nix # Kernel config
    ../../system/hardware/power.nix # Power management
    ../../system/hardware/time.nix # Network time sync
    ../../system/hardware/opengl.nix
    ../../system/hardware/printing.nix
    ../../system/hardware/bluetooth.nix
    ../../system/hardware/nvidia.nix
    ../../system/wm/hyprland.nix
    #../../system/app/virtualization.nix
    ../../system/security/doas.nix
    ../../system/security/gpg.nix
    ../../system/security/firewall.nix
    ../../system/security/automount.nix
    ../../system/style/stylix.nix
    ./nfs-client.nix
  ];

  # Fix nix path
  nix.nixPath = [ "nixpkgs=/nix/var/nix/profiles/per-user/root/channels/nixos"
                  "nixos-config=$HOME/dotfiles/system/configuration.nix"
                  "/nix/var/nix/profiles/per-user/root/channels"
                ];

  # Ensure nix flakes are enabled
  nix.package = pkgs.nixFlakes;
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  # Kernel modules
  boot.kernelModules = [ "i2c-dev" "i2c-piix4" "cpufreq_powersave" ];

  # Bootloader
  # Use systemd-boot if uefi, default to grub otherwise
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = systemSettings.bootMountPath; # does nothing if running bios rather than uefi
  boot.loader.grub.enable = false;
  
  # Networking
  networking.hostName = systemSettings.hostname; # Define your hostname.
  networking.networkmanager.enable = true; # Use networkmanager
  networking.networkmanager.wifi.backend = "iwd"; # wpa_supplicant broken :(

  # Timezone and locale
  time.timeZone = systemSettings.timezone; # time zone
  i18n.defaultLocale = systemSettings.localeDefault;
  i18n.extraLocaleSettings = {
    LC_ADDRESS = systemSettings.localeSpecial;
    LC_IDENTIFICATION = systemSettings.localeSpecial;
    LC_MEASUREMENT = systemSettings.localeSpecial;
    LC_MONETARY = systemSettings.localeSpecial;
    LC_NAME = systemSettings.localeSpecial;
    LC_NUMERIC = systemSettings.localeSpecial;
    LC_PAPER = systemSettings.localeSpecial;
    LC_TELEPHONE = systemSettings.localeSpecial;
    LC_TIME = systemSettings.localeSpecial;
  };

  # System packages
  environment.systemPackages = with pkgs; [
    vim
    wget
    zsh
    git
    cryptsetup
    home-manager
    wpa_supplicant
  ];

  # User account
  users.users.${userSettings.username} = {
      isNormalUser = true;
      description = userSettings.name;
      extraGroups = [ "networkmanager" "wheel" "input" "dialout" ];
      packages = [];
      uid = 1000;
  };

  # I use zsh btw
  environment.shells = with pkgs; [ zsh ];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  fonts.fontDir.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal
      pkgs.xdg-desktop-portal-gtk
    ];
  };

  # It is ok to leave this unchanged for compatibility purposes
  system.stateVersion = "23.11";
}