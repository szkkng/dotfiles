{ pkgs, ... }:
{
  home.pointerCursor = {
    name = "catppuccin-mocha-light-cursors";
    package = pkgs.catppuccin-cursors.mochaLight;
    size = 24;
    gtk.enable = true;
    hyprcursor.enable = true;
    x11.enable = true;
  };
}
