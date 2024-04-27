{ config, lib, pkgs, userSettings, systemSettings, ... }:

{
  imports = [
    ../../app/terminal/alacritty.nix
    ../../app/terminal/kitty.nix
    (import ../../app/dmenu-scripts/networkmanager-dmenu.nix {
      dmenu_command = "fuzzel -d"; inherit config lib pkgs;
    })
    ./fnott.nix
    ./fuzzel.nix
    ./hypridle.nix
    ./hyprlock.nix
    ./pyprland.nix
    ./rofi.nix
    ./swappy.nix
    ./udiskie.nix
    ./waybar.nix
    ./wlogout.nix
    #./swaylock.nix
  ];

  gtk.cursorTheme = {
    package = pkgs.quintom-cursor-theme;
    name = if (config.stylix.polarity == "light") then "Quintom_Ink" else "Quintom_Snow";
    size = 36;
  };

  wayland.windowManager.hyprland = {
    enable = true;
    plugins = [ ];
    settings = { };
    extraConfig = ''

  # █▀▄▀█ █▀█ █▄░█ █ ▀█▀ █▀█ █▀█
  # █░▀░█ █▄█ █░▀█ █ ░█░ █▄█ █▀▄

  # See https://wiki.hyprland.org/Configuring/Monitors/
  monitor = ,preferred,auto,auto


  # █░░ ▄▀█ █░█ █▄░█ █▀▀ █░█
  # █▄▄ █▀█ █▄█ █░▀█ █▄▄ █▀█

  # See https://wiki.hyprland.org/Configuring/Keywords/
  exec-once = dbus-update-activation-environment DISPLAY XAUTHORITY WAYLAND_DISPLAY
  exec-once = dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP # for XDPH
  exec-once = dbus-update-activation-environment --systemd --all # for XDPH
  exec-once = systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP # for XDPH

  exec-once = waybar # launch the system bar
  exec-once = blueman-applet # systray app for Bluetooth
  exec-once = udiskie --no-automount --smart-tray # front-end that allows to manage removable media
  exec-once = nm-applet --indicator # systray app for Network/Wifi

  exec-once = pypr
  exec-once = ydotoold
  # exec-once = STEAM_FRAME_FORCE_CLOSE=1 steam -silent
  # exec-once = GOMAXPROCS=1 syncthing --no-browser
  # exec-once = hypridle
  # exec-once = hyprdim -d 450 -s 0.25 -D 0.25 -p
  exec = ~/.swaybg-stylix
  exec-once = hyprctl setcursor '' + config.gtk.cursorTheme.name + " " + builtins.toString config.gtk.cursorTheme.size + ''



  # █░░ ▄▀█ █▄█ █▀█ █░█ ▀█▀ █▀
  # █▄▄ █▀█ ░█░ █▄█ █▄█ ░█░ ▄█

  general {
    layout = master
    cursor_inactive_timeout = 30
    border_size = 4
    no_cursor_warps = false
    col.active_border = 0xfff38ba8
    col.inactive_border = 0x331e1e2e
    resize_on_border = true
    gaps_in = 7
    gaps_out = 7
  }

  decoration {
    rounding = 8
    blur {
      enabled = true
      size = 5
      passes = 2
      ignore_opacity = true
      contrast = 1.17
      brightness = 0.8
    }
  }


  # █▀▀ █▄░█ █░█
  # ██▄ █░▀█ ▀▄▀

  # See https://wiki.hyprland.org/Configuring/Environment-variables/

  #env = PATH,$PATH:$scrPath
  env = XDG_CURRENT_DESKTOP,Hyprland
  env = XDG_SESSION_TYPE,wayland
  env = XDG_SESSION_DESKTOP,Hyprland
  env = QT_QPA_PLATFORM,wayland
  env = QT_QPA_PLATFORMTHEME,qt6ct
  env = QT_WAYLAND_DISABLE_WINDOWDECORATION,1
  env = QT_AUTO_SCREEN_SCALE_FACTOR,1
  env = MOZ_ENABLE_WAYLAND,1
  env = GDK_SCALE,1


  # █ █▄░█ █▀█ █░█ ▀█▀
  # █ █░▀█ █▀▀ █▄█ ░█░

  # See https://wiki.hyprland.org/Configuring/Variables/

  input {
    kb_layout = de
    kb_options = caps:escape
    repeat_delay = 350
    repeat_rate = 50
    follow_mouse = 1
    sensitivity = 0
    force_no_accel = 1
  }

  # See https://wiki.hyprland.org/Configuring/Keywords/#executing

  device {
    name = epic mouse V1
    sensitivity = -0.5
  }


  # █▀▄▀█ █ █▀ █▀▀
  # █░▀░█ █ ▄█ █▄▄

  # See https://wiki.hyprland.org/Configuring/Variables/

  misc {
    vrr = 0
    disable_hyprland_logo = true
    disable_splash_rendering = true
    force_default_wallpaper = 0
    mouse_move_enables_dpms = false
  }

  xwayland {
    force_zero_scaling = true
  }


  # █▀ █▀█ █░█ █▀█ █▀▀ █▀▀
  # ▄█ █▄█ █▄█ █▀▄ █▄▄ ██▄

  source = ~/.dotfiles/user/wm/hyprland/animations.conf
  source = ~/.dotfiles/user/wm/hyprland/keybindings.conf
  source = ~/.dotfiles/user/wm/hyprland/windowrules.conf
  source = ~/.dotfiles/user/wm/hyprland/monitors.conf # initially empty, to be configured by user and remains static
    '';
    xwayland = { enable = true; };
    systemd.enable = true;
  };

  home.packages = with pkgs; [
    alacritty
    dmenu
    feh
    gnome.adwaita-icon-theme
    gnome.file-roller
    gnome.gnome-calendar
    gnome.gnome-maps
    gnome.nautilus
    gnome.seahorse
    gnome.zenity
    grim
    gsettings-desktop-schemas
    hyprdim
    hyprland-protocols
    hyprnome
    hyprpicker
    keepmenu
    killall
    kitty
    libsForQt5.kio-extras
    libsForQt5.qt5.qtwayland
    libva-utils
    pamixer
    pavucontrol
    pinentry-gnome3
    polkit_gnome
    qt6.qtwayland
    shared-mime-info
    slurp
    swaybg
    tesseract4
    wev
    wl-clipboard
    wlr-randr
    wlsunset
    wtype
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
    xdg-utils
    ydotool
    (pkgs.writeScriptBin "screenshot-ocr" ''
      #!/bin/sh
      imgname="/tmp/screenshot-ocr-$(date +%Y%m%d%H%M%S).png"
      txtname="/tmp/screenshot-ocr-$(date +%Y%m%d%H%M%S)"
      txtfname=$txtname.txt
      grim -g "$(slurp)" $imgname;
      tesseract $imgname $txtname;
      wl-copy -n < $txtfname
    '')
    (pkgs.writeScriptBin "sct" ''
      #!/bin/sh
      killall wlsunset &> /dev/null;
      if [ $# -eq 1 ]; then
        temphigh=$(( $1 + 1 ))
        templow=$1
        wlsunset -t $templow -T $temphigh &> /dev/null &
      else
        killall wlsunset &> /dev/null;
      fi
    '')
    (pkgs.writeScriptBin "suspend-unless-render" ''
      #!/bin/sh
      if pgrep -x nixos-rebuild > /dev/null || pgrep -x home-manager > /dev/null || pgrep -x kdenlive > /dev/null || pgrep -x FL64.exe > /dev/null || pgrep -x blender > /dev/null || pgrep -x flatpak > /dev/null;
      then echo "Shouldn't suspend"; sleep 10; else echo "Should suspend"; systemctl suspend; fi
    '')
    (pkgs.writeScriptBin "hyprworkspace" ''
      #!/bin/sh
      # from https://github.com/taylor85345/hyprland-dotfiles/blob/master/hypr/scripts/workspace
      monitors=/tmp/hypr/monitors_temp
      hyprctl monitors > $monitors

      if [[ -z $1 ]]; then
        workspace=$(grep -B 5 "focused: no" "$monitors" | awk 'NR==1 {print $3}')
      else
        workspace=$1
      fi

      activemonitor=$(grep -B 11 "focused: yes" "$monitors" | awk 'NR==1 {print $2}')
      passivemonitor=$(grep  -B 6 "($workspace)" "$monitors" | awk 'NR==1 {print $2}')
      #activews=$(grep -A 2 "$activemonitor" "$monitors" | awk 'NR==3 {print $1}' RS='(' FS=')')
      passivews=$(grep -A 6 "Monitor $passivemonitor" "$monitors" | awk 'NR==3 {print $1}' RS='(' FS=')')

      if [[ $workspace -eq $passivews ]] && [[ $activemonitor != "$passivemonitor" ]]; then
       hyprctl dispatch workspace "$workspace" && hyprctl dispatch swapactiveworkspaces "$activemonitor" "$passivemonitor" && hyprctl dispatch workspace "$workspace"
        echo $activemonitor $passivemonitor
      else
        hyprctl dispatch moveworkspacetomonitor "$workspace $activemonitor" && hyprctl dispatch workspace "$workspace"
      fi

      exit 0

    '')
  ];
}
