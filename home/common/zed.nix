{ lib, pkgs, ... }:
{
  programs.zed-editor = {
    enable = true;
    extensions = [
      "nix"
      "neocmake"
    ];
    userSettings = {
      auto_update = false;
      autosave = "on_focus_change";
      base_keymap = "VSCode";
      buffer_font_family = "JetBrainsMono Nerd Font";
      buffer_font_size = 15;
      cursor_blink = false;
      scrollbar.show = "never";
      format_on_save = true;
      relative_line_numbers = true;
      terminal = {
        shell = {
          program = "${pkgs.fish}/bin/fish";
        };
      };
      vim_mode = true;
      languages = {
        Nix = {
          language_servers = [
            "nixd"
            "!nil"
          ];
        };
        CMake = {
          formatter.external = {
            command = lib.getExe pkgs.gersemi;
            arguments = [
              "--quiet"
              "-"
            ];
          };
        };
      };
    };
    userKeymaps = [
      {
        context = "VimControl && !menu";
        bindings = {
          "space ," = "workspace::Save";
          "space e" = "workspace::ToggleLeftDock";
          "space f f" = "file_finder::Toggle";
          "space shift-d" = "diagnostics::Deploy";

          "space w v" = "pane::SplitRight";
          "space w h" = [
            "workspace::ActivatePaneInDirection"
            "Left"
          ];
          "space w l" = [
            "workspace::ActivatePaneInDirection"
            "Right"
          ];
          "space w q" = "pane::CloseActiveItem";
        };
      }
      {
        context = "ProjectPanel && not_editing";
        bindings = {
          "space e" = "workspace::ToggleLeftDock";
          "o" = "project_panel::NewDirectory";
          "a" = "project_panel::NewFile";
          "r" = "project_panel::Rename";
          "x" = "project_panel::Cut";
          "y" = "project_panel::Copy";
          "p" = "project_panel::Paste";
          "d" = "project_panel::Delete";
        };
      }
      {
        context = "Terminal";
        bindings = {
          "ctrl-`" = "workspace::ToggleBottomDock";
        };
      }
    ];
  };
}
