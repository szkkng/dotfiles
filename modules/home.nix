{ pkgs, ... }:
{
  home.username = "kengo";
  home.stateVersion = "23.05";
  programs.home-manager.enable = true;
  home.packages = with pkgs; [
    cmake
    fd
    delta
    gnused
    jq
    ninja
    ripgrep
    supabase-cli
  ];
}

