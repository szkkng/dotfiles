{
  description = "kengo's nix-darwin and home-manager configs";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      nix-darwin,
      home-manager,
    }:
    let
      configuration =
        {
          pkgs,
          ...
        }:
        {
          nixpkgs.config.allowUnfree = true;
          nixpkgs.hostPlatform = "aarch64-darwin";
          services.nix-daemon.enable = true;
          nix.package = pkgs.nix;
          nix.settings.experimental-features = "nix-command flakes";
          system.stateVersion = 5;
          system.configurationRevision = self.rev or self.dirtyRev or null;

          users.users.kengo = {
            name = "kengo";
            home = "/Users/kengo";
          };

          programs.fish.enable = true;

          system.defaults = {
            # https://macos-defaults.com/
            dock = {
              autohide = true;
              show-recents = false;
              mineffect = "scale";
              static-only = true;
            };
            finder = {
              AppleShowAllExtensions = true;
              CreateDesktop = false;
              ShowPathbar = true;
              ShowStatusBar = true;
            };
            screencapture = {
              location = "~/screenshots";
            };
            ".GlobalPreferences" = {
              "com.apple.mouse.scaling" = 2.0;
            };
          };
        };
      homeconfig =
        { pkgs, lib, ... }:
        {
          home.username = "kengo";
          home.homeDirectory = lib.mkForce "/Users/kengo";
          # this is internal compatibility configuration
          # for home-manager, don't change this!
          home.stateVersion = "23.05";
          # Let home-manager install and manage itself.
          programs.home-manager.enable = true;

          home.packages = with pkgs; [
            cowsay
          ];
        };
    in
    {
      # Build darwin flake using:
      # $ darwin-rebuild build --flake .#kengo-macbook-pro
      darwinConfigurations."kengo-macbook-pro" = nix-darwin.lib.darwinSystem {
        modules = [
          configuration
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users."kengo" = homeconfig;

            # Optionally, use home-manager.extraSpecialArgs to pass
            # arguments to home.nix
          }
        ];
      };

      # Expose the package set, including overlays, for convenience.
      darwinPackages = self.darwinConfigurations."kengo-macbook-pro".pkgs;
    };
}

