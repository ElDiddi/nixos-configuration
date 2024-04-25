{ config, systemSettings, ... }:

{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        mod = "dock";
        exclusive = true;
        passthrough = false;
        gtk-layer-shell = true;
        reload_style_on_change = true;
        height = 31;

        output = [ "DP-3" ]; # set waybar to main monitor only

        modules-left = [ "custom/os" ];
        modules-center = [ ];
        modules-right = ["network" "pulseaudio" "pulseaudio#microphone" "clock"];

        "custom/os" = {
          format = " {} ";
          exec = ''echo "" '';
          on-click = "wlogout --layout ~/.config/wlogout/layout -css ~/.config/wlogout/style.css -b 2 -P";
          interval = 86400;
          tooltip = true;
        };
        tray = {
          icon-size = 15;
          spacing = 10;
        };
        clock = {
          interval = 60;
          format = " {0:%H:%M} 󰸗 {0:%a, %b %e}";
          timezone = ''+systemSettings.timezone+'';
          tooltip-format = ''
            <big>{:%Y %B}</big>
            <tt><small>{calendar}</small></tt>'';
        };
        pulseaudio = {
          format = "{icon} {volume}%";
          tooltip = false;
          format-muted = " Muted";
          on-click = "pamixer -t";
          on-click-right = "pypr toggle volume && hyprctl dispatch bringactivetotop";
          on-scroll-up = "pamixer -i 5";
          on-scroll-down = "pamixer -d 5";
          scroll-step= 5;
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = ["" "" ""];
          };
        };
        "pulseaudio#microphone" = {
          format = "{format_source}";
          format-source = " {volume}%";
          format-source-muted = " Muted";
          on-click = "pamixer --default-source -t";
          on-click-right = "pypr toggle volume && hyprctl dispatch bringactivetotop";
          on-scroll-up = "pamixer --default-source -i 5";
          on-scroll-down = "pamixer --default-source -d 5";
          scroll-step = 5;
        };
        network = {
          tooltip = true;
          format-wifi = " ";
          rotate = 0;
          format-ethernet = "󰈀 ";
          tooltip-format = "Network: <big><b>{essid}</b></big>\nSignal strength: <b>{signaldBm}dBm ({signalStrength}%)</b>\nFrequency: <b>{frequency}MHz</b>\nInterface: <b>{ifname}</b>\nIP: <b>{ipaddr}/{cidr}</b>\nGateway: <b>{gwaddr}</b>\nNetmask: <b>{netmask}</b>";
          format-linked = "󰈀 {ifname} (No IP)";
          format-disconnected = "󰖪 ";
          tooltip-format-disconnected = "Disconnected";
          format-alt = "<span foreground='#b4befe'> {bandwidthDownBytes}</span> <span foreground='#b4befe'> {bandwidthUpBytes}</span>";
          interval = 2;
          on-click-right = "networkmanager_dmenu && hyprctl dispatch bringactivetotop";
        };
      };
    };
    style = ''
    * {
        border: none;
        border-radius: 0px;
        font-family: JetBrainsMono Nerd Font;
        font-weight: bold;
        font-size: 14px;
        min-height: 0;
        transition: 0.3s;
      }

      window#waybar {
        background: rgba(21, 18, 27, 0);
        color: #cdd6f4;
      }

      tooltip {
        background: #1e1e2e;
        border-radius: 10px;
        border-width: 1.5px;
        border-style: solid;
        border-color: #11111b;
        transition: 0.3s;
      }

      #workspaces button {
        padding: 5px;
        color: #313244;
        margin-right: 5px;
      }

      #workspaces button.active {
        color: #a6adc8;
      }

      #workspaces button.focused {
        color: #a6adc8;
        background: #eba0ac;
        border-radius: 20px;
      }

      #workspaces button.urgent {
        color: #11111b;
        background: #a6e3a1;
        border-radius: 20px;
      }

      #workspaces button:hover {
        background: #11111b;
        color: #cdd6f4;
        border-radius: 20px;
      }

      #custom-power_profile,
      #custom-weather,
      #window,
      #clock,
      #battery,
      #pulseaudio,
      #network,
      #bluetooth,
      #temperature,
      #workspaces,
      #tray,
      #backlight {
        background: #1e1e2e;
        opacity: 0.8;
        padding: 0px 10px;
        margin: 0;
        margin-top: 5px;
        border: 1px solid #181825;
      }

      #temperature {
        border-radius: 20px 0px 0px 20px;
      }

      #temperature.critical {
        color: #eba0ac;
      }

      #backlight {
        border-radius: 20px 0px 0px 20px;
        padding-left: 7px;
      }

      #tray {
        border-radius: 20px;
        margin-right: 5px;
        padding: 0px 4px;
      }

      #workspaces {
        background: #1e1e2e;
        border-radius: 20px;
        margin-left: 5px;
        padding-right: 0px;
        padding-left: 5px;
      }

      #custom-power_profile {
        color: #a6e3a1;
        border-left: 0px;
        border-right: 0px;
      }

      #custom-os {
        color: #'' + config.lib.stylix.colors.base07 + '';
        margin-top: 4px;
        font-size: 18px;
      }

      #window {
        border-radius: 20px;
        margin-left: 5px;
        margin-right: 5px;
      }

      #clock {
        color: #'' + config.lib.stylix.colors.base07 + '';
        border-radius: 20px;
        margin-left: 5px;
        border-right: 0px;
        transition: 0.3s;
        padding-left: 7px;
      }

      #network {
        color: #'' + config.lib.stylix.colors.base07 + '';
        border-radius: 20px 0px 0px 20px;
        border-left: 0px;
        border-right: 0px;
      }

      #bluetooth {
        color: #89b4fa;
        border-radius: 20px;
        margin-right: 10px
      }

      #pulseaudio {
        color: #89b4fa;
        border-left: 0px;
        border-right: 0px;
      }

      #pulseaudio.microphone {
        color: #'' + config.lib.stylix.colors.base07 + '';
        border-left: 0px;
        border-right: 0px;
        border-radius: 0px 20px 20px 0px;
        margin-right: 5px;
        padding-right: 8px;
      }

      #battery {
        color: #a6e3a1;
        border-radius: 0 20px 20px 0;
        margin-right: 5px;
        border-left: 0px;
      }

      #custom-weather {
        border-radius: 20px;
        border-right: 0px;
        margin-left: 0px;
      }
    '';
  };
}