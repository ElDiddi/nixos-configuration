{ config, lib, pkgs, inputs, userSettings, ... }:

let

in
{
  imports = [
    inputs.nixneovim.nixosModules.default # with Home Manager unstable
  ];

  programs.nixneovim = {
    enable = true;

    plugins = {
      lspconfig = {
        enable = true;
        servers = {
          hls.enable = true;
          rust-analyzer.enable = true;
        };
      };
      treesitter = {
        enable = true;
        indent = true;
      };
      mini = {
        enable = true;
        ai.enable = true;
        jump.enable = true;
      };
    };

    # `pkgs.vimExtraPlugins` is added by the overlay you added at the beginning
    # For a list of available plugins, look here: [available plugins](https://github.com/NixNeovim/NixNeovimPlugins/blob/main/plugins.md)
    extraPlugins = [ pkgs.vimExtraPlugins.lazy-nvim ];
  };
}
