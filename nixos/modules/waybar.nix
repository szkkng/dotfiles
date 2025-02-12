{ ... }:
{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        spacing = 4;
        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [
          "network"
          "cpu"
          "memory"
          "battery"
          "tray"
        ];
        "hyprland/workspaces" = {
          format = "{name}";
          on-click = "activate";
        };
        clock = {
          format = "{:%I:%M %p}";
        };
        network = {
          format-wifi = "WiFi {signalStrength}%";
          format-ethernet = "ETH";
          format-disconnected = "Disconnected";
        };
        cpu = {
          format = "CPU {usage}%";
        };
        memory = {
          format = "MEM {usage}%";
        };
        battery = {
          format = "{capacity}% {icon}";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
          ];
        };
        clock = {
          format-alt = "{:%a, %d. %b  %H:%M}";
        };
      };
    };
    style = ''
      * {
        color: @text;
      }
      window#waybar {
        background-color: shade(@base, 0.9);
        border: 2px solid alpha(@crust, 0.3);
      }
    '';
  };
}
