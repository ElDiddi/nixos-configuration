{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gamemode
    steam
    (lutris.override {
      extraLibraries =  pkgs: [
        # List library dependencies here
      ];
       extraPkgs = pkgs: [
         # List package dependencies here
       ];
    })
  ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };

  # GameMode optimization
  programs.gamemode.enable = true;
}
