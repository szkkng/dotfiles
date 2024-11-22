{ pkgs, ... }:
{
  home.username = "kengo";
  home.stateVersion = "23.05";
  programs.home-manager.enable = true;
  home.packages = with pkgs; [
    arc-browser
    cmake
    delta
    discord
    gnused
    keycastr
    ninja
    obsidian
    raycast
    reaper
    spotify
    supabase-cli
    karabiner-elements
  ];
}

