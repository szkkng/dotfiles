{ pkgs, ... }:
{
  home.username = "kengo";
  home.stateVersion = "23.05";
  programs.home-manager.enable = true;
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
