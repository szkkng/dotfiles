{ pkgs, ... }:
{
  imports = [
    ./../common
    ./karabiner
    ./wezterm.nix
    ./fish.nix
  ];

  programs.home-manager.enable = true;
  home.username = "kengo";
  home.stateVersion = "23.05";
  home.shell.enableFishIntegration = true;
  home.packages = with pkgs; [
    gnused
  ];
}
