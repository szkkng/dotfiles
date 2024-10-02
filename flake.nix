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
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      nix-darwin,
      home-manager,
      nixvim,
    }:
    {
      darwinConfigurations."kengo-macbook-pro" = nix-darwin.lib.darwinSystem {
        specialArgs = inputs;
        modules = [
          ./modules/darwin.nix
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = false;
            home-manager.backupFileExtension = "backup";
            home-manager.users."kengo" = {
              imports = [
                ./modules/home.nix
                ./modules/fish.nix
                ./modules/git.nix
                ./modules/starship.nix
                ./modules/bat.nix
                ./modules/fzf.nix
                ./modules/fd.nix
                ./modules/jq.nix
                ./modules/ripgrep.nix
                ./modules/eza.nix
                ./modules/wezterm
                ./modules/jetbrains
                ./modules/neovim
                nixvim.homeManagerModules.nixvim
              ];
            };
          }
        ];
      };

      darwinPackages = self.darwinConfigurations."kengo-macbook-pro".pkgs;
    };
}

