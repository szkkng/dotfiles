{ pkgs, ... }:
{
  home.username = "kengo";
  home.stateVersion = "23.05";
  programs.home-manager.enable = true;
  home.packages = with pkgs; [
    bat
    cmake
    eza
    fd
    fira-code-nerdfont
    gnused
    jq
    keycastr
    ninja
    ripgrep
    supabase-cli
    tree
  ];
}

