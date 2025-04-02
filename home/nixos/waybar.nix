{ ... }:
{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        # height = 20;
        spacing = 4;
        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [
          "network"
          "battery"
        ];
        "hyprland/workspaces" = {
          format = "{name}";
          on-click = "activate";
        };
        network = {
          format-wifi = "W {signalStrength}%";
        };
        battery = {
          format = "P {capacity}%";
        };
      };
    };
    style = ''
      * {
        color: @text;
      }
      window#waybar {
        background-color: @base;
      }
    '';
  };
}
