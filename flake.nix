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
    catppuccin.url = "github:catppuccin/nix";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      nix-darwin,
      home-manager,
      catppuccin,
      ...
    }:
    {
      nixosConfigurations."kengo-thinkpad" = nixpkgs.lib.nixosSystem {
        specialArgs = inputs;
        system = "x86_64-linux";
        modules = [
          catppuccin.nixosModules.catppuccin
          ./modules/musnix.nix
          ./nixos/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              extraSpecialArgs = inputs;
              useGlobalPkgs = true;
              useUserPackages = false;
              backupFileExtension = "backup";
              users."kengo" = {
                imports = [
                  ./nixos/modules/home.nix
                  ./nixos/modules/hyprland.nix
                  ./nixos/modules/fish.nix
                  ./nixos/modules/rofi.nix
                  ./nixos/modules/waybar.nix
                  ./modules/neovim
                  ./modules/wezterm
                  ./modules/git.nix
                  ./modules/starship.nix
                  ./modules/bat.nix
                  ./modules/fzf.nix
                  ./modules/fd.nix
                  ./modules/gh.nix
                  ./modules/jq.nix
                  ./modules/ripgrep.nix
                  ./modules/eza.nix
                  ./modules/zoxide.nix
                  ./modules/catppuccin.nix
                  ./modules/lazygit.nix
                  ./modules/yazi.nix
                ];
              };
            };
          }
        ];
      };
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
                  ./modules/neovim
                  ./modules/wezterm
                  ./modules/ideavim
                  ./modules/karabiner
                  ./modules/home.nix
                  ./modules/fish.nix
                  ./modules/git.nix
                  ./modules/starship.nix
                  ./modules/bat.nix
                  ./modules/fzf.nix
                  ./modules/fd.nix
                  ./modules/gh.nix
                  ./modules/jq.nix
                  ./modules/ripgrep.nix
                  ./modules/eza.nix
                  ./modules/zoxide.nix
                  ./modules/catppuccin.nix
                  ./modules/lazygit.nix
                  ./modules/yazi.nix
                ];
              };
            };
          }
        ];
      };

      darwinPackages = self.darwinConfigurations."kengo-macbook-pro".pkgs;
    };
}
