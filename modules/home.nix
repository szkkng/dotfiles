{ pkgs, ... }:
{
  home.username = "kengo";
  home.stateVersion = "23.05";
  programs.home-manager.enable = true;
  home.packages = with pkgs; [
    act
    bun
    cmake
    cargo
    delta
    gnused
    ninja
    supabase-cli
  ];
}
