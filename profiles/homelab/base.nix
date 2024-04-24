{ lib, pkgs, systemSettings, userSettings, ... }:

{
  imports = [
    ../../system/hardware-configuration.nix
    ../../system/hardware/time.nix # Network time sync
    ../../system/security/firewall.nix
    ../../system/security/doas.nix
    ../../system/security/gpg.nix
    ( import ../../system/app/docker.nix {storageDriver = null; inherit pkgs userSettings lib;} )
  ];

  # Fix nix path
  nix.nixPath = [
    "nixpkgs=/nix/var/nix/profiles/per-user/root/channels/nixos"
    "nixos-config=$HOME/dotfiles/system/configuration.nix"
    "/nix/var/nix/profiles/per-user/root/channels"
  ];

  # Ensure nix flakes are enabled
  nix.package = pkgs.nixFlakes;
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  # Kernel modules
  boot.kernelModules = [ "i2c-dev" "i2c-piix4" ];

  # Bootloader
  # Use systemd-boot if uefi, default to grub otherwise
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = systemSettings.bootMountPath; # does nothing if running bios rather than uefi
  boot.loader.grub.enable = false;

  # Networking
  networking.hostName = systemSettings.hostname; # Define your hostname.
  networking.networkmanager.enable = true; # Use networkmanager

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

  # User account
  users.users.${userSettings.username} = {
    isNormalUser = true;
    description = userSettings.name;
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
    uid = 1000;
  };

  # System packages
  environment.systemPackages = with pkgs; [
    vim
    wget
    zsh
    git
    rclone
    rdiff-backup
    rsnapshot
    cryptsetup
    gocryptfs
  ];

  programs.fuse.userAllowOther = true;

  services.haveged.enable = true;

  # I use zsh btw
  environment.shells = with pkgs; [ zsh ];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  # It is ok to leave this unchanged for compatibility purposes
  system.stateVersion = "22.11";

}
