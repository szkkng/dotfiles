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
    wezterm = {
      url = "github:wez/wezterm?dir=nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin.url = "github:catppuccin/nix";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      nix-darwin,
      home-manager,
      ...
    }:
    {
      darwinConfigurations."kengo-macbook-pro" = nix-darwin.lib.darwinSystem {
        specialArgs = inputs;
        modules = [
          ./modules/darwin.nix
          home-manager.darwinModules.home-manager
          {
            home-manager = {
              extraSpecialArgs = inputs;
              useGlobalPkgs = true;
              useUserPackages = false;
              backupFileExtension = "backup";
              users."kengo" = {
                imports = [
                  ./modules/nixvim
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
                  ./modules/zoxide.nix
                  ./modules/wezterm.nix
                  ./modules/ideavim.nix
                  ./modules/karabiner.nix
                  ./modules/catppuccin.nix
                ];
              };
            };
          }
        ];
      };

      darwinPackages = self.darwinConfigurations."kengo-macbook-pro".pkgs;
    };
}

