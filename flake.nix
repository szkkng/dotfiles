{
  description = "My NixOS and macOS configuration";

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
      nixosConfigurations."tuxedo-gen9" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [ ./hosts/tuxedo-gen9 ];
      };

      darwinConfigurations."macbook-pro-2023" = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        specialArgs = { inherit inputs; };
        modules = [ ./hosts/macbook-pro-2023 ];
      };

      devShells."aarch64-darwin" =
        let
          pkgs = import nixpkgs { system = "aarch64-darwin"; };
        in
        {
          cpp = pkgs.mkShell {
            packages = with pkgs; [
              clang-tools
              cmake
              ninja
            ];
          };
        };

      devShells."x86_64-linux" =
        let
          pkgs = import nixpkgs { system = "x86_64-linux"; };
        in
        {
          cpp =
            pkgs.mkShell.override
              {
                stdenv = pkgs.llvmPackages.stdenv;
              }
              {
                packages = with pkgs; [
                  llvmPackages.clang-tools
                  cmake
                  ninja
                ];
              };

          juce =
            pkgs.mkShell.override
              {
                stdenv = pkgs.llvmPackages.stdenv;
              }
              {
                nativeBuildInputs = with pkgs; [
                  llvmPackages.clang-tools
                  llvmPackages.bintools
                  cmake
                  ninja
                  pkg-config
                ];

                buildInputs = with pkgs; [
                  # https://github.com/juce-framework/JUCE/blob/master/docs/Linux%20Dependencies.md#packages

                  ### juce_audio_devices ###
                  alsa-lib
                  libjack2

                  ### juce_audio_processors ###
                  ladspa-sdk

                  ### juce_core ###
                  curl

                  ### juce_graphics ###
                  fontconfig
                  freetype

                  ### juce_gui_basics ###
                  xorg.libX11
                  xorg.libXcomposite
                  xorg.libXcursor
                  xorg.libXext
                  xorg.libXinerama
                  xorg.libXrandr
                  xorg.libXrender

                  ### juce_gui_extra ###
                  webkitgtk_4_1

                  ### others ###
                  libuuid
                  libxkbcommon
                  libthai
                  libdatrie
                  libepoxy
                  libselinux
                  libsepol
                  libsysprof-capture
                  xorg.libXdmcp
                  xorg.libXtst
                  lerc
                  pcre2
                  sqlite
                ];

                hardeningDisable = [ "fortify" ];

                NIX_LDFLAGS = (
                  toString [
                    "-lX11"
                    "-lXext"
                    "-lXcursor"
                    "-lXinerama"
                    "-lXrandr"
                  ]
                );
              };
        };
    };
}
