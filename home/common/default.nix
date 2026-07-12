{ pkgs, ... }:
{
  imports = [
    ./nixvim
    ./yazi
    ./aerc.nix
    ./eza.nix
    ./fd.nix
    ./fzf.nix
    ./gh.nix
    ./git.nix
    ./lazygit.nix
    ./ripgrep.nix
    ./tmux.nix
    ./zoxide.nix
    ./fish.nix
    ./direnv.nix
    ./wezterm.nix
    ./radicle.nix
  ];

  home.packages = with pkgs; [
    nixd
    nixfmt
    _1password-cli
  ];
}
