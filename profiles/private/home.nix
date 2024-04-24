{ config, pkgs, userSettings, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = userSettings.username;
  home.homeDirectory = "/home/"+userSettings.username;

  programs.home-manager.enable = true;

  imports = [
              ../../user/wm/hyprland/hyprland.nix # Window manager
              ../../user/shell/sh.nix # zsh and bash config
              ../../user/shell/cli-collection.nix # Useful CLI apps
              ../../user/app/ranger/ranger.nix # Ranger cli file manager
              ../../user/app/git/git.nix # Git config
              ../../user/app/keepass/keepass.nix # Password manager
              ../../user/app/browser/brave.nix # Default web browser
              ../../user/app/virtualization/virtualization.nix # Virtual machines
              ../../user/style/stylix.nix # Styling and themes
              ../../user/lang/cc/cc.nix # C and C++ tools
              ../../user/lang/rust/rust.nix # rust tools
              ../../user/lang/python/python.nix # python tools
              ../../user/lang/python/python-packages.nix # python tools
              ../../user/hardware/bluetooth.nix # Bluetooth
            ];

  home.stateVersion = "23.11"; # Please read the comment before changing.

  home.packages = (with pkgs; [
    # Core
    brave
    syncthing

    # Office
    libreoffice-fresh
    mate.atril
    openboard
    thunderbird
    vscode
    xournalpp

    # Media
    #mediainfo
    #mediainfo-gui
    #mpv
    gimp
    libmediainfo
    vlc

    # Various dev packages
    glib
    libffi
    nodePackages.ungit
    texinfo
    ventoy
    zlib
  ]);

  services.syncthing.enable = true;

  xdg.enable = true;
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
    videos = "${config.home.homeDirectory}/Media/Videos";
    pictures = "${config.home.homeDirectory}/Media/Pictures";
    templates = "${config.home.homeDirectory}/Templates";
    download = "${config.home.homeDirectory}/Downloads";
    documents = "${config.home.homeDirectory}/Documents";
    desktop = null;
    publicShare = null;
    extraConfig = {
      XDG_DOTFILES_DIR = "${config.home.homeDirectory}/.dotfiles";
      XDG_ARCHIVE_DIR = "${config.home.homeDirectory}/Archive";
      XDG_VM_DIR = "${config.home.homeDirectory}/Machines";
      XDG_GAME_DIR = "${config.home.homeDirectory}/Media/Games";
      XDG_GAME_SAVE_DIR = "${config.home.homeDirectory}/Media/Game Saves";
    };
  };
  xdg.mime.enable = true;
  xdg.mimeApps.enable = true;

  home.sessionVariables = {
    EDITOR = userSettings.editor;
    SPAWNEDITOR = userSettings.spawnEditor;
    TERM = userSettings.term;
    BROWSER = userSettings.browser;
  };
}
