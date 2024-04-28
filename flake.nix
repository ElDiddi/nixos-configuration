{
  description = "Flake of NixOS";

  outputs = inputs@{ self, ... }:
    let
      # ---- SYSTEM SETTINGS ---- #
      systemSettings = {
        system = "x86_64-linux"; # system arch
        hostname = "starlight"; # hostname
        profile = "private"; # select a profile defined from profiles directory
        timezone = "Europe/Berlin"; # select timezone
        localeDefault = "en_US.UTF-8"; # i18 default locale
        localeSpecial = "de_DE.UTF-8"; # i18 special locale
        localeShort = "de"; # short locale identifier
        bootMountPath = "/boot"; # mount path for efi boot partition;
        cryptStorageUUID = ""; #
      };

      # ----- USER SETTINGS ----- #
      userSettings = rec {
        username = "ld"; # username
        name = "ld"; # name/identifier
        gitUsername = "ElDiddi"; # username
        email = "l.diederich@gmx.net"; # email (used for certain configurations)
        dotfilesDir = "/home/ld/.dotfiles"; # absolute path of the local repo
        theme = "catppuccin-mocha"; # selcted theme from themes directory (./themes/)
        wm = "hyprland"; # Selected window manager or desktop environment; must select one in both ./user/wm/ and ./system/wm/
        # window manager type (hyprland or x11) translator
        wmType = "wayland";
        browser = "brave"; # Default browser; must select one from ./user/app/browser/
        defaultRoamDir = "Personal.p"; # Default org roam directory relative to ~/Org
        term = "alacritty"; # Default terminal command;
        font = "Intel One Mono"; # Selected font
        fontPkg = pkgs.intel-one-mono; # Font package
        editor = "vim"; # Default editor;
        spawnEditor = "vim";
      };

      pkgs = import inputs.nixpkgs {
        system = systemSettings.system;
        config = {
          allowUnfree = true;
          allowUnfreePredicate = true;
        };
        overlays = [ inputs.rust-overlay.overlays.default ];
      };

      pkgs-stable = import inputs.nixpkgs-stable {
        system = systemSettings.system;
        config = {
          allowUnfree = true;
          allowUnfreePredicate = true;
        };
      };

      # configure lib
      # otherwise use patched nixos-unstable nixpkgs
      lib = inputs.nixpkgs.lib;

      home-manager = inputs.home-manager-unstable;

      # Systems that can run tests:
      supportedSystems = [ "aarch64-linux" "i686-linux" "x86_64-linux" ];

      # Function to generate a set based on supported systems:
      forAllSystems = inputs.nixpkgs.lib.genAttrs supportedSystems;

      # Attribute set of nixpkgs for each system:
      nixpkgsFor =
        forAllSystems (system: import inputs.nixpkgs { inherit system; });

    in {
      homeConfigurations = {
        user = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            (./. + "/profiles" + ("/" + systemSettings.profile) + "/home.nix") # load home.nix from selected PROFILE
          ];
          extraSpecialArgs = {
            # pass config variables from above
            inherit pkgs-stable;
            inherit systemSettings;
            inherit userSettings;
            inherit inputs;
          };
        };
      };
      nixosConfigurations = {
        system = lib.nixosSystem {
          system = systemSettings.system;
          modules = [
            (./. + "/profiles" + ("/" + systemSettings.profile) + "/configuration.nix")
            ./system/bin/os.nix
          ]; # load configuration.nix from selected PROFILE
          specialArgs = {
            # pass config variables from above
            inherit pkgs-stable;
            inherit systemSettings;
            inherit userSettings;
            inherit inputs;
          };
        };
      };

      packages = forAllSystems (system:
        let pkgs = nixpkgsFor.${system};
        in {
          default = self.packages.${system}.install;

          install = pkgs.writeShellApplication {
            name = "install";
            runtimeInputs = with pkgs; [ git ]; # I could make this fancier by adding other deps
            text = ''${./install.sh} "$@"'';
          };
        });

      apps = forAllSystems (system: {
        default = self.apps.${system}.install;

        install = {
          type = "app";
          program = "${self.packages.${system}.install}/bin/install";
        };
      });
    };

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "nixpkgs/nixos-23.11";

    home-manager-unstable.url = "github:nix-community/home-manager/master";
    home-manager-unstable.inputs.nixpkgs.follows = "nixpkgs";

    home-manager-stable.url = "github:nix-community/home-manager/release-23.11";
    home-manager-stable.inputs.nixpkgs.follows = "nixpkgs-stable";

    stylix.url = "github:danth/stylix";
    rust-overlay.url = "github:oxalica/rust-overlay";
  };
}
