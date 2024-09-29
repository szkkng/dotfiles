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
    in
    {
      darwinConfigurations."kengo-macbook-pro" = nix-darwin.lib.darwinSystem {
        modules = [
          configuration
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = false;
            home-manager.backupFileExtension = "backup";
            home-manager.users."kengo" = {
              imports = [
                ./modules/home.nix
                ./modules/fish.nix
                ./modules/starship.nix
              ];
            };
          }
        ];
      };

      darwinPackages = self.darwinConfigurations."kengo-macbook-pro".pkgs;
    };
}

