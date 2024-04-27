{ config, pkgs, userSettings, ... }:

{
  home.packages = with pkgs; [
    git
    onefetch
  ];

  programs.git.enable = true;
  programs.git.userName = userSettings.gitUsername;
  programs.git.userEmail = userSettings.email;
  programs.git.extraConfig = {
    init.defaultBranch = "main";
    http.postBuffer = 524288000;
    safe.directory = "/home/" + userSettings.username + "/.dotfiles";
  };
}
