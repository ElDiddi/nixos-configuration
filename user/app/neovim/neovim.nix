{
  inputs.neovim-flake.url = "github:jordanisaacs/neovim-flake";

  outputs = {
    nixpkgs,
    neovim-flake,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    lib = nixpkgs.lib;

    configModule = {
      config.vim.theme.name = "dracula-nvim";
      config.vim.languages.nix.enable = false;
    };

    configModule2 = {
      config.vim.theme.name = lib.mkForce "catppuccin";
      config.vim.languages.nix.enable = lib.mkForce true;
    };

    baseNeovim = neovim-flake.packages.${system}.maximal;
    neovimExtended = baseNeovim.extendConfiguration {modules = [configModule];};
    finalNeovim = neovimExtended.extendConfiguration {
      modules = [configModule2];
      inherit pkgs;
    };
  in {
    packages.${system}.neovim = finalNeovim;
  };
}