{ config, pkgs, userSettings, ... }:

{
  home.packages = with pkgs; [
    wlogout
  ];

  programs.wlogout = {
    enable = true;
    layout = [
      {
        label = "lock";
        action = "hyprlock";
        text = "Lock";
        keybind = "l";
      }
      {
        label = "logout";
        action = "hyprctl dispatch exit 0";
        text = "Logout";
        keybind = "e";
      }
      {
        label = "shutdown";
        action = "systemctl poweroff";
        text = "Shutdown";
        keybind= "s";
      }
      {
        label = "reboot";
        action = "systemctl reboot";
        text = "Reboot";
        keybind =  "r";
      }
    ];
    style = ''

  * {
        background-image: none;
        font-size: 60px;
    }

    window {
        background-color: transparent;
    }

    button {
        color: white;
        background-color: #11111b;
        outline-style: none;
        border: none;
        border-width: 0px;
        background-repeat: no-repeat;
        background-position: center;
        background-size: 10%;
        border-radius: 0px;
        box-shadow: none;
        text-shadow: none;
        animation: gradient_f 20s ease-in infinite;
    }

    button:focus {
        background-color: #11111b;
        background-size: 15%;
    }

    button:hover {
        background-color: #'' + config.lib.stylix.colors.base02 + '';
        background-size: 20%;
        border-radius: 25px;
        animation: gradient_f 20s ease-in infinite;
        transition: all 0.3s cubic-bezier(.55,0.0,.28,1.682);
    }

    button:hover#lock {
        border-radius: 25px 25px 0px 25px;
        margin : 30px 0px 0px 30px;
    }

    button:hover#logout {
        border-radius: 25px 0px 25px 25px;
        margin : 0px 0px 30px 30px;
    }

    button:hover#shutdown {
        border-radius: 25px 25px 25px 0px;
        margin : 30px 30px 0px 0px;
    }

    button:hover#reboot {
        border-radius: 0px 25px 25px 25px;
        margin : 0px 30px 30px 0px;
    }

    #lock {
        background-image: image(url("/home/''+userSettings.username+''/.dotfiles/themes/wlogout/icons/lock_white.png"));
        border-radius: 25px 0px 0px 0px;
        margin : 30px 0px 0px 30px;
    }

    #logout {
        background-image: image(url("/home/''+userSettings.username+''/.dotfiles/themes/wlogout/icons/logout_white.png"));
        border-radius: 0px 0px 0px 25px;
        margin : 0px 0px 30px 30px;
    }

    #shutdown {
        background-image: image(url("/home/''+userSettings.username+''/.dotfiles/themes/wlogout/icons/shutdown_white.png"));
        border-radius: 0px 25px 0px 0px;
        margin : 30px 30px 0px 0px;
    }

    #reboot {
        background-image: image(url("/home/''+userSettings.username+''/.dotfiles/themes/wlogout/icons/reboot_white.png"));
        border-radius: 0px 0px 25px 0px;
        margin : 0px 30px 30px 0px;
    }
    '';
  };
}