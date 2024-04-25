{ pkgs, ... }:

{
  home.packages = with pkgs; [
    pyprland
  ];

  home.file.".config/hypr/pyprland.toml".text = ''
    [pyprland]
    plugins = [
      "expose",
      "magnify",
      "scratchpads",
    ]

    [scratchpads.term]
    animation = "fromTop"
    command = "kitty --class kitty-dropterm"
    class = "kitty-dropterm"
    lazy = false
    size = "75% 60%"

    [scratchpads.ranger]
    animation = "fromTop"
    command = "kitty --class kitty-ranger -e ranger"
    class = "kitty-ranger"
    lazy = false
    size = "75% 60%"

    [scratchpads.volume]
    animation = "fromTop"
    command = "pavucontrol -t 3"
    class = "pavucontrol"
    lazy = true
    size = "40% 50%"
    unfocused = "hide"
  '';
}