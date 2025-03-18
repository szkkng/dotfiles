{ pkgs, ... }:
{
  imports = [
    ./../common
    ./hyprland
    ./cursor.nix
    ./foot.nix
    ./gtk.nix
    ./rofi.nix
    ./waybar.nix
    ./xdg.nix
  ];

  home.username = "kengo";
  home.stateVersion = "23.05";
  programs.home-manager.enable = true;
  home.shell.enableFishIntegration = true;
  home.packages = with pkgs; [
    _1password-gui
    brave
    brightnessctl
    delta
    discord
    pavucontrol
    spotify
    xdg-desktop-portal-gtk
  ];
}
