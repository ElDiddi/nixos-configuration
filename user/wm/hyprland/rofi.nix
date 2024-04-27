{ pkgs, ... }:

{
  home.packages = with pkgs; [
    rofi
    oranchelo-icon-theme
    tela-circle-icon-theme
  ];

  home.file.".config/rofi/config.rasi".text = ''
    configuration{
      modi: "run,drun,window";
      icon-theme: "Oranchelo";
      show-icons: true;
      terminal: "alacritty";
      drun-display-format: "{icon} {name}";
      location: 0;
      disable-history: false;
      hide-scrollbar: true;
      display-drun: "   Apps ";
      display-run: "   Run ";
      display-window: "    Window";
      sidebar-mode: true;
    }

    @theme "catppuccin-mocha"
  '';

  home.file.".config/rofi/clipboard.rasi".text = ''
    // Config //
    configuration {
        modi:                        "drun";
        show-icons:                  false;
    }

    @theme "~/.config/rofi/themes/theme.rasi"

    // Main //
    window {
        width:                       23em;
        height:                      30em;
        transparency:                "real";
        fullscreen:                  false;
        enabled:                     true;
        cursor:                      "default";
        spacing:                     0em;
        padding:                     0em;
        border-color:                @main-br;
        background-color:            @main-bg;
    }

    mainbox {
        enabled:                     true;
        spacing:                     0em;
        padding:                     0.5em;
        orientation:                 vertical;
        children:                    [ "wallbox" , "listbox" ];
        background-color:            transparent;
    }

    wallbox {
        spacing:                     0em;
        padding:                     0em;
        expand:                      false;
        orientation:                 horizontal;
        background-color:            transparent;
        children:                    [ "wallframe" , "inputbar" ];
    }

    wallframe {
        width:                       5em;
        spacing:                     0em;
        padding:                     0em;
        expand:                      false;
        background-color:            @main-bg;
    }

    // Inputs //
    inputbar {
        enabled:                     true;
        padding:                     0em;
        children:                    [ "entry" ];
        background-color:            @main-bg;
        expand:                      true;
    }
    entry {
        enabled:                     true;
        padding:                     1.8em;
        text-color:                  @main-fg;
        background-color:            transparent;
    }

    // Lists //
    listbox {
        spacing:                     0em;
        padding:                     0em;
        orientation:                 vertical;
        children:                    [ "dummy" , "listview" , "dummy" ];
        background-color:            transparent;
    }

    listview {
        enabled:                     true;
        padding:                     0.5em;
        columns:                     1;
        lines:                       11;
        cycle:                       true;
        fixed-height:                true;
        fixed-columns:               false;
        expand:                      false;
        cursor:                      "default";
        background-color:            transparent;
        text-color:                  @main-fg;
    }

    dummy {
        spacing:                     0em;
        padding:                     0em;
        background-color:            transparent;
    }

    // Elements //
    element {
        enabled:                     true;
        padding:                     0.5em;
        cursor:                      pointer;
        background-color:            transparent;
        text-color:                  @main-fg;
    }

    element selected.normal {
        background-color:            @select-bg;
        text-color:                  @select-fg;
    }

    element-text {
        vertical-align:              0.0;
        horizontal-align:            0.0;
        cursor:                      inherit;
        background-color:            transparent;
        text-color:                  inherit;
    }
  '';

  home.file.".config/rofi/keybindshint.rasi".text = ''
    // Config //
    configuration {
        modi:                        "drun";
        show-icons:                  false;
    }

    @theme "~/.config/rofi/themes/theme.rasi"

    // Main //
    window {
        width:                       23em;
        height:                      25em;
        transparency:                "real";
        fullscreen:                  false;
        enabled:                     true;
        cursor:                      "default";
        spacing:                     0em;
        padding:                     0em;
        border-color:                @main-br;
        background-color:            @main-bg;
    }

    mainbox {
        enabled:                     true;
        spacing:                     0em;
        padding:                     0.5em;
        orientation:                 vertical;
        children:                    [ "wallbox" , "listbox" ];
        background-color:            transparent;
    }

    wallbox {
        spacing:                     0em;
        padding:                     0em;
        expand:                      false;
        orientation:                 horizontal;
        background-color:            transparent;
        children:                    [ "wallframe" , "inputbar" ];
    }

    wallframe {
        width:                       5em;
        spacing:                     0em;
        padding:                     0em;
        expand:                      false;
        background-color:            @main-bg;
    }

    // Inputs //
    inputbar {
        enabled:                     true;
        padding:                     0em;
        children:                    [ "entry" ];
        background-color:            @main-bg;
        expand:                      true;
    }
    entry {
        enabled:                     true;
        padding:                     0.5em;
        text-color:                  @main-fg;
        background-color:            transparent;
    }

    // Lists //
    listbox {
        spacing:                     0em;
        padding:                     0em;
        orientation:                 vertical;
        children:                    [ "dummy" , "listview" , "dummy" ];
        background-color:            transparent;
    }

    listview {
        enabled:                     true;
        padding:                     0.5em;
        columns:                     1;
        lines:                       22;
        cycle:                       true;
        fixed-height:                true;
        fixed-columns:               false;
        expand:                      false;
        cursor:                      "default";
        background-color:            transparent;
        text-color:                  @main-fg;
    }

    dummy {
        spacing:                     0em;
        padding:                     0em;
        background-color:            transparent;
    }

    // Elements //
    element {
        enabled:                     true;
        padding:                     0.5em;
        cursor:                      pointer;
        background-color:            transparent;
        text-color:                  @main-fg;
    }

    element selected.normal {
        background-color:            @select-bg;
        text-color:                  @select-fg;
    }

    element-text {
        vertical-align:              0.0;
        horizontal-align:            0.0;
        cursor:                      inherit;
        background-color:            transparent;
        text-color:                  inherit;
    }
  '';

  home.file.".config/rofi/styles/style_1.rasi".text = ''
    // Config //
    configuration {
        modi:                        "drun,filebrowser,window,run";
        show-icons:                  true;
        display-drun:                " ";
        display-run:                 " ";
        display-filebrowser:         " ";
        display-window:              " ";
        drun-display-format:         "{name}";
        window-format:               "{w}{t}";
        font:                        "JetBrainsMono Nerd Font 10";
        icon-theme:                  "Tela-circle-dracula";
    }

    @theme "~/.config/rofi/themes/theme.rasi"

    // Main //
    window {
        height:                      33em;
        width:                       63em;
        transparency:                "real";
        fullscreen:                  false;
        enabled:                     true;
        cursor:                      "default";
        spacing:                     0em;
        padding:                     0em;
        border-color:                @main-br;
        background-color:            @main-bg;
    }
    mainbox {
        enabled:                     true;
        spacing:                     0em;
        padding:                     0em;
        orientation:                 horizontal;
        children:                    [ "dummywall" , "listbox" ];
        background-color:            transparent;
    }
    dummywall {
        spacing:                     0em;
        padding:                     0em;
        width:                       37em;
        expand:                      false;
        orientation:                 horizontal;
        children:                    [ "mode-switcher" , "inputbar" ];
        background-color:            transparent;
        background-image:            url("~/.cache/hyde/wall.thmb", height);
    }


    // Modes //
    mode-switcher{
        orientation:                 vertical;
        enabled:                     true;
        width:                       3.8em;
        padding:                     9.2em 0.5em 9.2em 0.5em;
        spacing:                     1.2em;
        background-color:            transparent;
        background-image:            url("~/.cache/hyde/wall.blur", height);
    }
    button {
        cursor:                      pointer;
        border-radius:               2em;
        background-color:            @main-bg;
        text-color:                  @main-fg;
    }
    button selected {
        background-color:            @main-fg;
        text-color:                  @main-bg;
    }


    // Inputs //
    inputbar {
        enabled:                     true;
        children:                    [ "entry" ];
        background-color:            transparent;
    }
    entry {
        enabled:                     false;
    }


    // Lists //
    listbox {
        spacing:                     0em;
        padding:                     2em;
        children:                    [ "dummy" , "listview" , "dummy" ];
        background-color:            transparent;
    }
    listview {
        enabled:                     true;
        spacing:                     0em;
        padding:                     0em;
        columns:                     1;
        lines:                       8;
        cycle:                       true;
        dynamic:                     true;
        scrollbar:                   false;
        layout:                      vertical;
        reverse:                     false;
        expand:                      false;
        fixed-height:                true;
        fixed-columns:               true;
        cursor:                      "default";
        background-color:            transparent;
        text-color:                  @main-fg;
    }
    dummy {
        background-color:            transparent;
    }


    // Elements //
    element {
        enabled:                     true;
        spacing:                     0.8em;
        padding:                     0.4em 0.4em 0.4em 1.5em;
        cursor:                      pointer;
        background-color:            transparent;
        text-color:                  @main-fg;
    }
    element selected.normal {
        background-color:            @select-bg;
        text-color:                  @select-fg;
    }
    element-icon {
        size:                        2.8em;
        cursor:                      inherit;
        background-color:            transparent;
        text-color:                  inherit;
    }
    element-text {
        vertical-align:              0.5;
        horizontal-align:            0.0;
        cursor:                      inherit;
        background-color:            transparent;
        text-color:                  inherit;
    }
  '';

  home.file.".config/rofi/styles/style_2.rasi".text = ''
    // Config //
    configuration {
        modi:                        "drun,filebrowser,window,run";
        show-icons:                  true;
        display-drun:                " ";
        display-run:                 " ";
        display-filebrowser:         " ";
        display-window:              " ";
        drun-display-format:         "{name}";
        window-format:               "{w}{t}";
        font:                        "JetBrainsMono Nerd Font 10";
        icon-theme:                  "Tela-circle-dracula";
    }

    @theme "~/.config/rofi/themes/theme.rasi"


    // Main //
    window {
        height:                      35em;
        width:                       56em;
        transparency:                "real";
        fullscreen:                  false;
        enabled:                     true;
        cursor:                      "default";
        spacing:                     0em;
        padding:                     0em;
        border-color:                @main-br;
        background-color:            @main-bg;
    }
    mainbox {
        enabled:                     true;
        spacing:                     0em;
        padding:                     0em;
        orientation:                 vertical;
        children:                    [ "inputbar" , "listbox" ];
        background-color:            transparent;
        background-image:            url("~/.cache/hyde/wall.blur", height);
    }


    // Inputs //
    inputbar {
        enabled:                     true;
        spacing:                     0em;
        padding:                     5em;
        children:                    [ "entry" ];
        background-color:            transparent;
        background-image:            url("~/.cache/hyde/wall.thmb", width);
    }
    entry {
        border-radius:               2em;
        enabled:                     true;
        spacing:                     1em;
        padding:                     1em;
        text-color:                  @main-fg;
        background-color:            @main-bg;
    }


    // Lists //
    listbox {
        padding:                     0em;
        spacing:                     0em;
        orientation:                 horizontal;
        children:                    [ "listview" , "mode-switcher" ];
        background-color:            @main-bg;
    }
    listview {
        padding:                     1.5em;
        spacing:                     0.5em;
        enabled:                     true;
        columns:                     2;
        lines:                       3;
        cycle:                       true;
        dynamic:                     true;
        scrollbar:                   false;
        layout:                      vertical;
        reverse:                     false;
        fixed-height:                true;
        fixed-columns:               true;
        cursor:                      "default";
        background-color:            transparent;
        text-color:                  @main-fg;
    }


    // Modes //
    mode-switcher {
        orientation:                 vertical;
        width:                       6.6em;
        enabled:                     true;
        padding:                     1.5em;
        spacing:                     1.5em;
        background-color:            transparent;
    }
    button {
        cursor:                      pointer;
        border-radius:               2em;
        background-color:            @main-bg;
        text-color:                  @main-fg;
    }
    button selected {
        background-color:            @main-fg;
        text-color:                  @main-bg;
    }


    // Elements //
    element {
        enabled:                     true;
        spacing:                     0em;
        padding:                     0.5em;
        cursor:                      pointer;
        background-color:            transparent;
        text-color:                  @main-fg;
    }
    @media(max-aspect-ratio: 1.8) {
        element {
            orientation:             vertical;
        }
    }
    element selected.normal {
        background-color:            @select-bg;
        text-color:                  @select-fg;
    }
    element-icon {
        size:                        3em;
        cursor:                      inherit;
        background-color:            transparent;
        text-color:                  inherit;
    }
    element-text {
        vertical-align:              0.5;
        horizontal-align:            0.0;
        cursor:                      inherit;
        background-color:            transparent;
        text-color:                  inherit;
    }
  '';

  home.file.".config/rofi/styles/style_3.rasi".text = ''
    // Config //
    configuration {
        modi:                        "drun,filebrowser,window,run";
        show-icons:                  true;
        display-drun:                " ";
        display-run:                 " ";
        display-filebrowser:         " ";
        display-window:              " ";
        drun-display-format:         "{name}";
        window-format:               "{w}{t}";
        font:                        "JetBrainsMono Nerd Font 10";
        icon-theme:                  "Tela-circle-dracula";
    }

    @theme "~/.config/rofi/themes/theme.rasi"


    // Main //
    window {
        height:                      30em;
        width:                       37em;
        transparency:                "real";
        fullscreen:                  false;
        enabled:                     true;
        cursor:                      "default";
        spacing:                     0em;
        padding:                     0em;
        border-color:                @main-br;
        background-color:            @main-bg;
    }
    mainbox {
        enabled:                     true;
        spacing:                     0em;
        padding:                     0em;
        orientation:                 vertical;
        children:                    [ "inputbar" , "dummybox" ];
        background-color:            transparent;
        background-image:            url("~/.cache/hyde/wall.blur", height);
    }
    dummybox {
        padding:                     0.5em;
        spacing:                     0em;
        orientation:                 horizontal;
        children:                    [ "mode-switcher" , "listbox" ];
        background-color:            transparent;
        background-image:            transparent;
    }


    // Inputs //
    inputbar {
        enabled:                     false;
    }


    // Lists //
    listbox {
        padding:                     0em;
        spacing:                     0em;
        children:                    [ "dummy" , "listview" , "dummy" ];
        background-color:            transparent;
        background-image:            transparent;
    }
    listview {
        padding:                     1em;
        spacing:                     0em;
        enabled:                     true;
        columns:                     1;
        lines:                       7;
        cycle:                       true;
        dynamic:                     true;
        scrollbar:                   false;
        layout:                      vertical;
        reverse:                     false;
        expand:                      false;
        fixed-height:                true;
        fixed-columns:               true;
        cursor:                      "default";
        background-color:            @main-bg;
        text-color:                  @main-fg;
        border-radius:               1.5em;
    }
    dummy {
        background-color:            transparent;
    }


    // Modes //
    mode-switcher {
        orientation:                 vertical;
        width:                       6.8em;
        enabled:                     true;
        padding:                     3.2em 1em 3.2em 1em;
        spacing:                     1em;
        background-color:            transparent;
    }
    button {
        cursor:                      pointer;
        border-radius:               3em;
        background-color:            @main-bg;
        text-color:                  @main-fg;
    }
    button selected {
        background-color:            @main-fg;
        text-color:                  @main-bg;
    }


    // Elements //
    element {
        enabled:                     true;
        spacing:                     1em;
        padding:                     0.4em;
        cursor:                      pointer;
        background-color:            transparent;
        text-color:                  @main-fg;
    }
    @media(max-aspect-ratio: 1.8) {
        element {
            orientation:             vertical;
        }
    }
    element selected.normal {
        background-color:            @select-bg;
        text-color:                  @select-fg;
    }
    element-icon {
        size:                        3em;
        cursor:                      inherit;
        background-color:            transparent;
        text-color:                  inherit;
    }
    element-text {
        vertical-align:              0.5;
        horizontal-align:            0.0;
        cursor:                      inherit;
        background-color:            transparent;
        text-color:                  inherit;
    }
  '';

  home.file.".config/rofi/styles/style_4.rasi".text = ''
    // Config //
    configuration {
        modi:                        "drun,filebrowser,window,run";
        show-icons:                  true;
        display-drun:                " ";
        display-run:                 " ";
        display-filebrowser:         " ";
        display-window:              " ";
        drun-display-format:         "{name}";
        window-format:               "{w}{t}";
        font:                        "JetBrainsMono Nerd Font 10";
        icon-theme:                  "Tela-circle-dracula";
    }

    @theme "~/.config/rofi/themes/theme.rasi"


    // Main //
    window {
        height:                      30em;
        width:                       46em;
        transparency:                "real";
        fullscreen:                  false;
        enabled:                     true;
        cursor:                      "default";
        spacing:                     0em;
        padding:                     0em;
        border-color:                @main-br;
        background-color:            @main-bg;
    }
    mainbox {
        enabled:                     true;
        spacing:                     0em;
        padding:                     0em;
        orientation:                 horizontal;
        children:                    [ "inputbar" , "mode-switcher" , "listbox" ];
        background-color:            transparent;
        background-image:            url("~/.cache/hyde/wall.blur", height);
    }


    // Inputs //
    inputbar {
        enabled:                     true;
        width:                       8em;
        children:                    [ "entry" ];
        background-color:            transparent;
        background-image:            url("~/.cache/hyde/wall.thmb", height);
    }
    entry {
        enabled:                     false;
    }


    // Modes //
    mode-switcher{
        orientation:                 vertical;
        enabled:                     true;
        width:                       7em;
        spacing:                     1em;
        padding:                     3.4em 1em 3.4em 1em;
        background-color:            transparent;
    }
    button {
        cursor:                      pointer;
        border-radius:               3em;
        background-color:            @main-bg;
        text-color:                  @main-fg;
    }
    button selected {
        background-color:            @main-fg;
        text-color:                  @main-bg;
    }


    // Lists //
    listbox {
        spacing:                     0em;
        padding:                     0.5em;
        children:                    [ "dummy" , "listview" , "dummy" ];
        background-color:            transparent;
    }
    listview {
        spacing:                     0em;
        padding:                     1em;
        enabled:                     true;
        columns:                     1;
        lines:                       7;
        cycle:                       true;
        dynamic:                     true;
        scrollbar:                   false;
        layout:                      vertical;
        reverse:                     false;
        expand:                      false;
        fixed-height:                true;
        fixed-columns:               true;
        cursor:                      "default";
        background-color:            @main-bg;
        text-color:                  @main-fg;
        border-radius:               1.5em;
    }
    dummy {
        background-color:            transparent;
    }


    // Elements //
    element {
        enabled:                     true;
        spacing:                     1em;
        padding:                     0.4em;
        cursor:                      pointer;
        background-color:            transparent;
        text-color:                  @main-fg;
    }
    element selected.normal {
        background-color:            @select-bg;
        text-color:                  @select-fg;
    }
    element-icon {
        size:                        3em;
        cursor:                      inherit;
        background-color:            transparent;
        text-color:                  inherit;
    }
    element-text {
        vertical-align:              0.5;
        horizontal-align:            0.0;
        cursor:                      inherit;
        background-color:            transparent;
        text-color:                  inherit;
    }
  '';

  home.file.".config/rofi/styles/style_5.rasi".text = ''
    // Config //
    configuration {
        modi:                        "drun,filebrowser,window,run";
        show-icons:                  true;
        display-drun:                " ";
        display-run:                 " ";
        display-filebrowser:         " ";
        display-window:              " ";
        drun-display-format:         "{name}";
        window-format:               "{w}{t}";
        font:                        "JetBrainsMono Nerd Font 10";
        icon-theme:                  "Tela-circle-dracula";
    }

    @theme "~/.config/rofi/themes/theme.rasi"


    // Main //
    window {
        height:                      31em;
        width:                       50em;
        transparency:                "real";
        fullscreen:                  false;
        enabled:                     true;
        cursor:                      "default";
        spacing:                     0em;
        padding:                     0em;
        border-color:                @main-br;
        background-color:            @main-bg;
    }
    mainbox {
        enabled:                     true;
        spacing:                     0em;
        padding:                     0em;
        orientation:                 vertical;
        children:                    [ "inputbar" , "listbox" , "mode-switcher" ];
        background-color:            transparent;
    }


    // Inputs //
    inputbar {
        enabled:                     true;
        children:                    [ "entry" ];
    }
    entry {
        enabled:                     false;
    }


    // Lists //
    listbox {
        padding:                     0em;
        spacing:                     0em;
        orientation:                 horizontal;
        children:                    [ "listview" ];
        background-color:            transparent;
        background-image:            url("~/.cache/hyde/wall.blur", width);
    }
    listview {
        padding:                     2em;
        spacing:                     1em;
        enabled:                     true;
        columns:                     5;
        cycle:                       true;
        dynamic:                     true;
        scrollbar:                   false;
        layout:                      vertical;
        reverse:                     false;
        fixed-height:                true;
        fixed-columns:               true;
        cursor:                      "default";
        background-color:            @main-bg;
        text-color:                  @main-fg;
    }


    // Modes //
    mode-switcher {
        orientation:                 horizontal;
        enabled:                     true;
        padding:                     2em 9.8em 2em 9.8em;
        spacing:                     2em;
        background-color:            transparent;
    }
    button {
        cursor:                      pointer;
        padding:                     2.5em;
        spacing:                     0em;
        border-radius:               3em;
        background-color:            @main-bg;
        text-color:                  @main-fg;
    }
    button selected {
        background-color:            @main-fg;
        text-color:                  @main-bg;
    }


    // Elements //
    element {
        orientation:                 vertical;
        enabled:                     true;
        spacing:                     0.2em;
        padding:                     0.5em;
        cursor:                      pointer;
        background-color:            transparent;
        text-color:                  @main-fg;
    }
    @media(max-aspect-ratio: 1.8) {
        element {
            orientation:             vertical;
        }
    }
    element selected.normal {
        background-color:            @select-bg;
        text-color:                  @select-fg;
    }
    element-icon {
        size:                        5.5em;
        cursor:                      inherit;
        background-color:            transparent;
        text-color:                  inherit;
    }
    element-text {
        vertical-align:              0.5;
        horizontal-align:            0.5;
        cursor:                      inherit;
        background-color:            transparent;
        text-color:                  inherit;
    }
  '';

  home.file.".config/rofi/styles/style_6.rasi".text = ''
    // Config //
    configuration {
        modi:                        "drun,filebrowser,window,run";
        show-icons:                  true;
        display-drun:                " ";
        display-run:                 " ";
        display-filebrowser:         " ";
        display-window:              " ";
        drun-display-format:         "{name}";
        window-format:               "{w}{t}";
        font:                        "JetBrainsMono Nerd Font 10";
        icon-theme:                  "Tela-circle-dracula";
    }

    @theme "~/.config/rofi/themes/theme.rasi"


    // Main //
    window {
        height:                      31em;
        width:                       37em;
        transparency:                "real";
        fullscreen:                  false;
        enabled:                     true;
        cursor:                      "default";
        spacing:                     0em;
        padding:                     0em;
        border-color:                @main-br;
        background-color:            @main-bg;
    }
    mainbox {
        enabled:                     true;
        spacing:                     0em;
        padding:                     0em;
        orientation:                 horizontal;
        children:                    [ "inputbar" , "mode-switcher" , "listbox" ];
        background-color:            @main-bg;
    }


    // Inputs //
    inputbar {
        width:                       0em;
        enabled:                     true;
        children:                    [ "entry" ];
    }
    entry {
        enabled:                     false;
    }


    // Modes //
    mode-switcher {
        width:                       9em;
        orientation:                 vertical;
        enabled:                     true;
        padding:                     3em 1.8em 3em 1.8em;
        spacing:                     1em;
        background-color:            @main-bg;
    }
    button {
        cursor:                      pointer;
        border-radius:               3em;
        background-color:            @main-bg;
        text-color:                  @main-fg;
    }
    button selected {
        border-radius:               3em;
        background-color:            @main-fg;
        text-color:                  @main-bg;
    }


    // Lists //
    listbox {
        padding:                     0em;
        spacing:                     0em;
        orientation:                 vertical;
        children:                    [ "dummy" , "listview" , "dummy" ];
        background-color:            transparent;
    }
    listview {
        padding:                     1em;
        spacing:                     0em;
        enabled:                     true;
        columns:                     1;
        lines:                       7;
        cycle:                       true;
        dynamic:                     true;
        scrollbar:                   false;
        layout:                      vertical;
        reverse:                     false;
        expand:                      false;
        fixed-height:                true;
        fixed-columns:               true;
        cursor:                      "default";
        background-color:            transparent;
        text-color:                  @main-fg;
    }
    dummy {
        background-color:            transparent;
    }


    // Elements //
    element {
        orientation:                 horizontal;
        enabled:                     true;
        spacing:                     1.5em;
        padding:                     0.5em;
        cursor:                      pointer;
        background-color:            transparent;
        text-color:                  @main-fg;
    }
    @media(max-aspect-ratio: 1.8) {
        element {
            orientation:             vertical;
        }
    }
    element selected.normal {
        background-color:            @select-bg;
        text-color:                  @select-fg;
    }
    element-icon {
        size:                        3em;
        cursor:                      inherit;
        background-color:            transparent;
        text-color:                  inherit;
    }
    element-text {
        vertical-align:              0.5;
        horizontal-align:            0;
        cursor:                      inherit;
        background-color:            transparent;
        text-color:                  inherit;
    }
  '';

  home.file.".config/rofi/styles/style_7.rasi".text = ''
    // Config //
    configuration {
        modi:                        "drun,filebrowser,window";
        show-icons:                  true;
        display-drun:                " ";
        display-run:                 " ";
        display-filebrowser:         " ";
        display-window:              " ";
        drun-display-format:         "{name}";
        window-format:               "{w}{t}";
        font:                        "JetBrainsMono Nerd Font 10";
        icon-theme:                  "Tela-circle-dracula";
    }

    @theme "~/.config/rofi/themes/theme.rasi"


    // Main //
    window {
        height:                      12em;
        width:                       38em;
        transparency:                "real";
        fullscreen:                  false;
        enabled:                     true;
        cursor:                      "default";
        spacing:                     0em;
        padding:                     0em;
        border-color:                @main-br;
        background-color:            @main-bg;
    }
    mainbox {
        enabled:                     true;
        spacing:                     0em;
        padding:                     0em;
        orientation:                 vertical;
        children:                    [ "listbox" , "inputmode" ];
        background-color:            transparent;
    }


    // Lists //
    listbox {
        padding:                     0em;
        spacing:                     0em;
        orientation:                 horizontal;
        children:                    [ "listview" ];
        background-color:            transparent;
        background-image:            url("~/.cache/hyde/wall.blur", width);
    }
    listview {
        padding:                     0.5em;
        spacing:                     0.2em;
        enabled:                     true;
        columns:                     5;
        cycle:                       true;
        dynamic:                     true;
        scrollbar:                   false;
        reverse:                     false;
        fixed-height:                true;
        fixed-columns:               true;
        cursor:                      "default";
        background-color:            @main-bg;
        text-color:                  @main-fg;
    }


    // Inputs //
    inputmode {
        padding:                     0em;
        spacing:                     0em;
        orientation:                 horizontal;
        children:                    [ "inputbar" , "mode-switcher" ];
        background-color:            transparent;
    }
    inputbar {
        enabled:                     true;
        width:                       24em;
        padding:                     0em;
        spacing:                     0em;
        padding:                     1.5em 1em 1.5em 2.5em;
        children:                    [ "entry" ];
        background-color:            transparent;
    }
    entry {
        vertical-align:              0.5;
        border-radius:               3em;
        enabled:                     true;
        spacing:                     0em;
        padding:                     1em;
        text-color:                  @main-fg;
        background-color:            @main-bg;
    }


    // Modes //
    mode-switcher {
        width:                       13em;
        orientation:                 horizontal;
        enabled:                     true;
        padding:                     1.5em 2.5em 1.5em 0em;
        spacing:                     1em;
        background-color:            transparent;
    }
    button {
        cursor:                      pointer;
        padding:                     0em;
        border-radius:               3em;
        background-color:            @main-bg;
        text-color:                  @main-fg;
    }
    button selected {
        background-color:            @main-fg;
        text-color:                  @main-bg;
    }


    // Elements //
    element {
        orientation:                 vertical;
        enabled:                     true;
        spacing:                     0.2em;
        padding:                     0.5em;
        cursor:                      pointer;
        background-color:            transparent;
        text-color:                  @main-fg;
    }
    @media(max-aspect-ratio: 1.8) {
        element {
            orientation:             vertical;
        }
    }
    element selected.normal {
        background-color:            @select-bg;
        text-color:                  @select-fg;
    }
    element-icon {
        size:                        2.5em;
        cursor:                      inherit;
        background-color:            transparent;
        text-color:                  inherit;
    }
    element-text {
        vertical-align:              0.5;
        horizontal-align:            0.5;
        cursor:                      inherit;
        background-color:            transparent;
        text-color:                  inherit;
    }
  '';

  home.file.".config/rofi/styles/style_8.rasi".text = ''
    // Config //
    configuration {
        modi:                        "drun,filebrowser,window,run";
        show-icons:                  true;
        display-drun:                " ";
        display-run:                 " ";
        display-filebrowser:         " ";
        display-window:              " ";
        drun-display-format:         "{name}";
        window-format:               "{w}{t}";
        font:                        "JetBrainsMono Nerd Font 10";
        icon-theme:                  "Tela-circle-dracula";
    }

    @theme "~/.config/rofi/themes/theme.rasi"


    // Main //
    window {
        height:                      30em;
        width:                       37em;
        transparency:                "real";
        fullscreen:                  false;
        enabled:                     true;
        cursor:                      "default";
        spacing:                     0em;
        padding:                     0em;
        border-color:                @main-br;
        background-color:            @main-bg;
    }
    mainbox {
        enabled:                     true;
        spacing:                     0em;
        orientation:                 horizontal;
        children:                    [ "listmode" , "inputbar" ];
        background-color:            transparent;
        background-image:            url("~/.cache/hyde/wall.thmb", height);
    }


    // Lists //
    listmode {
        enabled:                     true;
        children:                    [ "listbox" , "mode-switcher" ];
        background-color:            transparent;
        background-image:            url("~/.cache/hyde/wall.blur", height);
    }
    listbox {
        spacing:                     0em;
        padding:                     1em;
        children:                    [ "dummy" , "listview" , "dummy" ];
        background-color:            transparent;
    }
    listview {
        enabled:                     true;
        spacing:                     0em;
        padding:                     0.5em;
        columns:                     1;
        lines:                       6;
        cycle:                       true;
        dynamic:                     true;
        scrollbar:                   false;
        layout:                      vertical;
        reverse:                     false;
        expand:                      false;
        fixed-height:                true;
        fixed-columns:               true;
        cursor:                      "default";
        background-color:            @main-bg;
        text-color:                  @main-fg;
        border-radius:               1em;
    }
    dummy {
        background-color:            transparent;
    }


    // Modes //
    mode-switcher{
        orientation:                 horizontal;
        enabled:                     true;
        spacing:                     1em;
        padding:                     0em 9.5em 2em 2em;
        background-color:            transparent;
    }
    button {
        padding:                     1em;
        cursor:                      pointer;
        border-radius:               3em;
        background-color:            @main-bg;
        text-color:                  @main-fg;
    }
    button selected {
        background-color:            @main-fg;
        text-color:                  @main-bg;
    }


    // Inputs //
    inputbar {
        enabled:                     true;
        width:                       10em;
        children:                    [ "entry" ];
        background-color:            transparent;
    }
    entry {
        enabled:                     false;
    }


    // Elements //
    element {
        enabled:                     true;
        spacing:                     1em;
        padding:                     0.3em;
        cursor:                      pointer;
        background-color:            transparent;
        text-color:                  @main-fg;
    }
    @media(max-aspect-ratio: 1.8) {
        element {
            orientation:             vertical;
        }
    }
    element selected.normal {
        background-color:            @select-bg;
        text-color:                  @select-fg;
    }
    element-icon {
        size:                        3em;
        cursor:                      inherit;
        background-color:            transparent;
        text-color:                  inherit;
    }
    element-text {
        vertical-align:              0.5;
        horizontal-align:            0.0;
        cursor:                      inherit;
        background-color:            transparent;
        text-color:                  inherit;
    }
  '';

  home.file.".config/rofi/styles/style_9.rasi".text = ''
    // Config //
    configuration {
        modi:                        "drun,filebrowser,window,run";
        show-icons:                  true;
        display-drun:                " ";
        display-run:                 " ";
        display-filebrowser:         " ";
        display-window:              " ";
        drun-display-format:         "{name}";
        window-format:               "{w}{t}";
        font:                        "JetBrainsMono Nerd Font 10";
        icon-theme:                  "Tela-circle-dracula";
    }

    @theme "~/.config/rofi/themes/theme.rasi"


    // Main //
    window {
        height:                      30em;
        width:                       57em;
        transparency:                "real";
        fullscreen:                  false;
        enabled:                     true;
        cursor:                      "default";
        spacing:                     0em;
        padding:                     0em;
        border-color:                @main-br;
        background-color:            @main-bg;
    }
    mainbox {
        enabled:                     true;
        spacing:                     1em;
        padding:                     1em;
        orientation:                 horizontal;
        children:                    [ "inputbar" , "listbox" ];
        background-color:            transparent;
    }


    // Inputs //
    inputbar {
        enabled:                     true;
        width:                       27em;
        spacing:                     0em;
        padding:                     0em;
        children:                    [ "entry" ];
        background-color:            transparent;
        background-image:            url("~/.cache/hyde/wall.sqre", height);
        border-radius:               1em;
    }
    entry {
        enabled:                     false;
    }


    // Lists //
    listbox {
        spacing:                     0em;
        padding:                     0em;
        children:                    [ "dummy" , "listview" , "dummy" ];
        background-color:            transparent;
    }
    listview {
        enabled:                     true;
        spacing:                     0em;
        padding:                     1em;
        columns:                     1;
        lines:                       7;
        cycle:                       true;
        dynamic:                     true;
        scrollbar:                   false;
        layout:                      vertical;
        reverse:                     false;
        expand:                      false;
        fixed-height:                true;
        fixed-columns:               true;
        cursor:                      "default";
        background-color:            transparent;
        text-color:                  @main-fg;
    }
    dummy {
        background-color:            transparent;
    }


    // Elements //
    element {
        enabled:                     true;
        spacing:                     1em;
        padding:                     0.5em 0.5em 0.5em 1.5em;
        cursor:                      pointer;
        background-color:            transparent;
        text-color:                  @main-fg;
    }
    @media(max-aspect-ratio: 1.8) {
        element {
            orientation:             vertical;
        }
    }
    element selected.normal {
        background-color:            @select-bg;
        text-color:                  @select-fg;
    }
    element-icon {
        size:                        2.7em;
        cursor:                      inherit;
        background-color:            transparent;
        text-color:                  inherit;
    }
    element-text {
        vertical-align:              0.5;
        horizontal-align:            0.0;
        cursor:                      inherit;
        background-color:            transparent;
        text-color:                  inherit;
    }
  '';

  home.file.".config/rofi/styles/style_10.rasi".text = ''
    // Config //
    configuration {
        modi:                        "drun,filebrowser,window,run";
        show-icons:                  true;
        display-drun:                " ";
        display-run:                 " ";
        display-filebrowser:         " ";
        display-window:              " ";
        drun-display-format:         "{name}";
        window-format:               "{w}{t}";
        font:                        "JetBrainsMono Nerd Font 10";
        icon-theme:                  "Tela-circle-dracula";
    }

    @theme "~/.config/rofi/themes/theme.rasi"


    // Main //
    window {
        height:                      40em;
        width:                       25em;
        transparency:                "real";
        fullscreen:                  false;
        enabled:                     true;
        cursor:                      "default";
        spacing:                     0em;
        padding:                     0em;
        border-color:                @main-br;
        background-color:            @main-bg;
    }
    mainbox {
        enabled:                     true;
        spacing:                     0em;
        padding:                     1em;
        orientation:                 vertical;
        children:                    [ "inputbar" , "listbox" ];
        background-color:            transparent;
    }


    // Inputs //
    inputbar {
        enabled:                     true;
        spacing:                     0em;
        padding:                     4em;
        children:                    [ "entry" ];
        background-color:            @main-bg;
        background-image:            url("~/.cache/hyde/wall.thmb", width);
        border-radius:               1em 1em 0em 0em;
    }
    entry {
        enabled:                     false;
    }


    // Lists //
    listbox {
        spacing:                     0em;
        padding:                     0em;
        children:                    [ "dummyt" , "listview" , "dummyb" ];
        background-color:            @main-bg;
        border-radius:               0em 0em 1em 1em;
    }
    listview {
        enabled:                     true;
        spacing:                     0.4em;
        padding:                     1em;
        columns:                     1;
        lines:                       10;
        cycle:                       true;
        dynamic:                     true;
        scrollbar:                   false;
        layout:                      vertical;
        reverse:                     false;
        expand:                      false;
        fixed-height:                true;
        fixed-columns:               true;
        cursor:                      "default";
        background-color:            @main-bg;
        text-color:                  @main-fg;
    }
    dummyt {
        spacing:                     0em;
        padding:                     0em;
        background-color:            @main-bg;
    }
    dummyb {
        spacing:                     0em;
        padding:                     0em;
        background-color:            @main-bg;
        border-radius:               0em 0em 1em 1em;
    }


    // Elements //
    element {
        enabled:                     true;
        spacing:                     1em;
        padding:                     0.2em 0.2em 0.2em 1.5em;
        cursor:                      pointer;
        background-color:            transparent;
        text-color:                  @main-fg;
    }
    @media(max-aspect-ratio: 1.8) {
        element {
            orientation:             vertical;
        }
    }
    element selected.normal {
        background-color:            @select-bg;
        text-color:                  @select-fg;
    }
    element-icon {
        size:                        2em;
        cursor:                      inherit;
        background-color:            transparent;
        text-color:                  inherit;
    }
    element-text {
        vertical-align:              0.5;
        horizontal-align:            0.0;
        cursor:                      inherit;
        background-color:            transparent;
        text-color:                  inherit;
    }
  '';

  home.file.".config/rofi/styles/style_11.rasi".text = ''
    // Config //
    configuration {
        modi:                        "drun,filebrowser,window,run";
        show-icons:                  true;
        display-drun:                " ";
        display-run:                 " ";
        display-filebrowser:         " ";
        display-window:              " ";
        drun-display-format:         "{name}";
        window-format:               "{w}{t}";
        font:                        "JetBrainsMono Nerd Font 10";
        icon-theme:                  "Tela-circle-dracula";
    }

    @theme "~/.config/rofi/themes/theme.rasi"


    // Main //
    window {
        height:                      30em;
        width:                       58em;
        transparency:                "real";
        fullscreen:                  false;
        enabled:                     true;
        cursor:                      "default";
        spacing:                     0em;
        padding:                     0em;
        border-color:                @main-br;
        background-color:            transparent;
    }
    mainbox {
        enabled:                     true;
        spacing:                     0em;
        padding:                     0.8em;
        orientation:                 horizontal;
        children:                    [ "inputbar" , "listbox" ];
        background-color:            #00000003;
    }


    // Inputs //
    inputbar {
        enabled:                     true;
        width:                       28.5em;
        spacing:                     0em;
        padding:                     0em;
        children:                    [ "entry" ];
        expand:                      false;
        background-color:            @main-bg;
        background-image:            url("~/.cache/hyde/wall.quad", width);
        border-radius:               1em 0em 0em 1em;
    }
    entry {
        enabled:                     false;
    }


    // Lists //
    listbox {
        spacing:                     0em;
        padding:                     0em;
        children:                    [ "dummy" , "listview" , "dummy" ];
        background-color:            @main-bg;
        border-radius:               0em 1em 1em 0em;
    }
    listview {
        enabled:                     true;
        spacing:                     0em;
        padding:                     1em 2em 1em 2em;
        columns:                     1;
        lines:                       8;
        cycle:                       true;
        dynamic:                     true;
        scrollbar:                   false;
        layout:                      vertical;
        reverse:                     false;
        expand:                      false;
        fixed-height:                true;
        fixed-columns:               true;
        cursor:                      "default";
        background-color:            transparent;
        text-color:                  @main-fg;
    }
    dummy {
        background-color:            transparent;
    }


    // Elements //
    element {
        enabled:                     true;
        spacing:                     1em;
        padding:                     0.5em 0.5em 0.5em 1.5em;
        cursor:                      pointer;
        background-color:            transparent;
        text-color:                  @main-fg;
    }
    @media(max-aspect-ratio: 1.8) {
        element {
            orientation:             vertical;
        }
    }
    element selected.normal {
        background-color:            @select-bg;
        text-color:                  @select-fg;
    }
    element-icon {
        size:                        2.2em;
        cursor:                      inherit;
        background-color:            transparent;
        text-color:                  inherit;
    }
    element-text {
        vertical-align:              0.5;
        horizontal-align:            0.0;
        cursor:                      inherit;
        background-color:            transparent;
        text-color:                  inherit;
    }
  '';

  home.file.".config/rofi/styles/style_12.rasi".text = ''
    // Config //
    configuration {
        modi:                        "drun,filebrowser,window,run";
        show-icons:                  true;
        display-drun:                " ";
        display-run:                 " ";
        display-filebrowser:         " ";
        display-window:              " ";
        drun-display-format:         "{name}";
        window-format:               "{w}{t}";
        font:                        "JetBrainsMono Nerd Font 10";
        icon-theme:                  "Tela-circle-dracula";
    }

    @theme "~/.config/rofi/themes/theme.rasi"


    // Main //
    window {
        height:                      30em;
        width:                       60em;
        transparency:                "real";
        fullscreen:                  false;
        enabled:                     true;
        cursor:                      "default";
        spacing:                     0em;
        padding:                     0em;
        border-color:                transparent;
        background-color:            transparent;
    }
    mainbox {
        enabled:                     true;
        spacing:                     0em;
        padding:                     0em;
        orientation:                 horizontal;
        children:                    [ "listbox" , "inputbar" ];
        background-color:            transparent;
    }


    // Inputs //
    inputbar {
        enabled:                     true;
        width:                       30em;
        spacing:                     0em;
        padding:                     0em;
        children:                    [ "entry" ];
        expand:                      false;
        background-color:            transparent;
        background-image:            url("~/.cache/hyde/wall.quad", width);
    }
    entry {
        enabled:                     false;
    }


    // Lists //
    listbox {
        spacing:                     0em;
        padding:                     0em;
        children:                    [ "dummy" , "listview" , "dummy" ];
        background-color:            @main-bg;
        expand:                      false;
        width:                       27em;
    }
    listview {
        enabled:                     true;
        spacing:                     0em;
        padding:                     1em 2em 1em 2em;
        columns:                     1;
        lines:                       8;
        cycle:                       true;
        dynamic:                     true;
        scrollbar:                   false;
        layout:                      vertical;
        reverse:                     false;
        expand:                      false;
        fixed-height:                true;
        fixed-columns:               true;
        cursor:                      "default";
        background-color:            transparent;
        text-color:                  @main-fg;
    }
    dummy {
        background-color:            transparent;
        expand:                      true;
    }


    // Elements //
    element {
        enabled:                     true;
        spacing:                     1em;
        padding:                     0.5em;
        cursor:                      pointer;
        background-color:            transparent;
        text-color:                  @main-fg;
    }
    @media(max-aspect-ratio: 1.8) {
        element {
            orientation:             vertical;
        }
    }
    element selected.normal {
        background-color:            @select-bg;
        text-color:                  @select-fg;
    }
    element-icon {
        size:                        2.2em;
        cursor:                      inherit;
        background-color:            transparent;
        text-color:                  inherit;
    }
    element-text {
        vertical-align:              0.5;
        horizontal-align:            0.0;
        cursor:                      inherit;
        background-color:            transparent;
        text-color:                  inherit;
    }
  '';

  home.file.".config/rofi/themes/theme.rasi".text = ''
    * {
        main-bg:            #11111be6;
        main-fg:            #cdd6f4ff;
        main-br:            #cba6f7ff;
        main-ex:            #f5e0dcff;
        select-bg:          #b4befeff;
        select-fg:          #11111bff;
        separatorcolor:     transparent;
        border-color:       transparent;
    }
  '';

  home.file.".config/rofi/themes/catppuccin-mocha.rasi".text = ''
    * {
        bg-col:  #1e1e2e;
        bg-col-light: #1e1e2e;
        border-col: #1e1e2e;
        selected-col: #1e1e2e;
        blue: #89b4fa;
        fg-col: #cdd6f4;
        fg-col2: #f38ba8;
        grey: #6c7086;

        width: 600;
        font: "JetBrainsMono Nerd Font 10";
    }

    element-text, element-icon , mode-switcher {
        background-color: inherit;
        text-color:       inherit;
    }

    window {
        height: 360px;
        border: 3px;
        border-color: @border-col;
        background-color: @bg-col;
    }

    mainbox {
        background-color: @bg-col;
    }

    inputbar {
        children: [prompt,entry];
        background-color: @bg-col;
        border-radius: 5px;
        padding: 2px;
    }

    prompt {
        background-color: @blue;
        padding: 6px;
        text-color: @bg-col;
        border-radius: 3px;
        margin: 20px 0px 0px 20px;
    }

    textbox-prompt-colon {
        expand: false;
        str: ":";
    }

    entry {
        padding: 6px;
        margin: 20px 0px 0px 10px;
        text-color: @fg-col;
        background-color: @bg-col;
    }

    listview {
        border: 0px 0px 0px;
        padding: 6px 0px 0px;
        margin: 10px 0px 0px 20px;
        columns: 2;
        lines: 5;
        background-color: @bg-col;
    }

    element {
        padding: 5px;
        background-color: @bg-col;
        text-color: @fg-col  ;
    }

    element-icon {
        size: 25px;
    }

    element selected {
        background-color:  @selected-col ;
        text-color: @fg-col2  ;
    }

    mode-switcher {
        spacing: 0;
      }

    button {
        padding: 10px;
        background-color: @bg-col-light;
        text-color: @grey;
        vertical-align: 0.5;
        horizontal-align: 0.5;
    }

    button selected {
      background-color: @bg-col;
      text-color: @blue;
    }

    message {
        background-color: @bg-col-light;
        margin: 2px;
        padding: 2px;
        border-radius: 5px;
    }

    textbox {
        padding: 6px;
        margin: 20px 0px 0px 20px;
        text-color: @blue;
        background-color: @bg-col-light;
    }
  '';
}