{ pkgs, ... }:
{
  imports = [
    ./neovim
    ./ideavim
    ./bat.nix
    ./catppuccin.nix
    ./eza.nix
    ./fd.nix
    ./fzf.nix
    ./gh.nix
    ./git.nix
    ./lazygit.nix
    ./opencode.nix
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
    jetbrains.clion
    jetbrains.webstorm
    jetbrains.idea-ultimate
  ];
}
