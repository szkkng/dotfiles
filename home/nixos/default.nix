{ pkgs, ... }:
{
  imports = [
    ./../common
    ./neovim
    ./cursor.nix
    ./foot.nix
    ./gtk.nix
    ./hyprland.nix
    ./rofi.nix
    ./waybar.nix
  ];

  home.username = "kengo";
  home.stateVersion = "23.05";
  programs.home-manager.enable = true;
  home.packages = with pkgs; [
    _1password-gui
    act
    brave
    brightnessctl
    bun
    cmake
    cargo
    delta
    discord
    gnused
    ninja
    pavucontrol
    supabase-cli
    spotify
    xdg-desktop-portal-gtk
  ];
}
