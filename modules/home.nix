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
    git
    gnused
    jq
    keycastr
    neovim
    ninja
    peco
    ripgrep
    starship
    supabase-cli
    tree
  ];
}

