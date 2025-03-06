{ ... }:
{
  xdg.configFile."wallpaper.png".source = ./wallpaper.png;

  services.hyprpaper =
    let
      wallpaper = "$XDG_CONFIG_HOME/wallpaper.png";
    in
    {
      enable = true;
      settings = {
        preload = [ wallpaper ];
        wallpaper = [ ",${wallpaper}" ];
      };
    };
}
