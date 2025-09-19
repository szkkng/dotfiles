{ pkgs, ... }:
{
  imports = [
    ./nixvim
    ./bat.nix
    ./catppuccin.nix
    ./eza.nix
    ./fd.nix
    ./fzf.nix
    ./gh.nix
    ./git.nix
    ./lazygit.nix
    ./ripgrep.nix
    ./starship.nix
    ./tmux.nix
    ./yazi.nix
    ./zoxide.nix
    ./fish.nix
    ./direnv.nix
    ./zed.nix
  ];

  home.packages = with pkgs; [
    nixd
    nixfmt-rfc-style
  ];
}
