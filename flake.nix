{
  description = "kengo's nix-darwin and home-manager configs";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    wezterm = {
      url = "github:wez/wezterm?dir=nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    musnix = {
      url = "github:musnix/musnix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ghostty.url = "github:ghostty-org/ghostty";
    catppuccin.url = "github:catppuccin/nix";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      nix-darwin,
      home-manager,
      catppuccin,
      ghostty,
      ...
    }:
    {
      nixosConfigurations."tuxedo-gen9" = nixpkgs.lib.nixosSystem {
        specialArgs = inputs;
        system = "x86_64-linux";
        modules = [
          ./hosts/tuxedo-gen9
          catppuccin.nixosModules.catppuccin
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              extraSpecialArgs = inputs;
              useGlobalPkgs = true;
              useUserPackages = false;
              backupFileExtension = "backup";
              users."kengo" = {
                imports = [
                  ./home/nixos
                ];
              };
            };
          }
        ];
      };
      darwinConfigurations."kengo-macbook-pro" = nix-darwin.lib.darwinSystem {
        specialArgs = inputs;
        modules = [
          ./hosts/kengo-macbook-pro
          home-manager.darwinModules.home-manager
          {
            home-manager = {
              extraSpecialArgs = inputs;
              useGlobalPkgs = true;
              useUserPackages = false;
              backupFileExtension = "backup";
              users."kengo" = {
                imports = [
                  ./home/darwin
                ];
              };
            };
          }
        ];
      };

      darwinPackages = self.darwinConfigurations."kengo-macbook-pro".pkgs;
    };
}
