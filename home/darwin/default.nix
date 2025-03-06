{ pkgs, ... }:
{
  imports = [
    ./../common
    ./ideavim
    ./karabiner
    ./neovim
    ./wezterm.nix
    ./fish.nix
  ];

  programs.home-manager.enable = true;
  home.username = "kengo";
  home.stateVersion = "23.05";
  home.packages = with pkgs; [
    act
    brave
    bun
    cmake
    cargo
    delta
    discord
    gnused
    ninja
    supabase-cli
    spotify
  ];
}
