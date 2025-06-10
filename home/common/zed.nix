{ lib, pkgs, ... }:
{
  programs.zed-editor = {
    enable = true;
    extensions = [
      "nix"
      "neocmake"
      "git-firefly"
      "toml"
      "sql"
    ];
    userSettings = {
      auto_update = false;
      autosave = "on_focus_change";
      base_keymap = "VSCode";
      buffer_font_family = "JetBrainsMono Nerd Font";
      buffer_font_size = 15;
      cursor_blink = false;
      scrollbar.show = "never";
      features.edit_prediction_provider = "copilot";
      format_on_save = "on";
      file_types = {
        "C++" = [ "gen" ];
      };
      relative_line_numbers = true;
      terminal.shell.program = lib.getExe pkgs.fish;
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
        JavaScript = {
          code_actions_on_format."source.fixAll.eslint" = true;
        };
        JSX = {
          code_actions_on_format."source.fixAll.eslint" = true;
        };
        TypeScript = {
          code_actions_on_format."source.fixAll.eslint" = true;
        };
        TSX = {
          code_actions_on_format."source.fixAll.eslint" = true;
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

          "space g p" = "editor::ToggleSelectedDiffHunks";
          "space g r" = "git::Restore";
          "space g R" = "git::RestoreFile";

          "space s h" = "editor::SwitchSourceHeader";

          "space l r" = "editor::Rename";
          "space l a" = "editor::ToggleCodeActions";
        };
      }
      {
        context = "Editor && renaming";
        bindings = {
          "ctrl-[" = "editor::Cancel";
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
        context = "EmptyPane || SharedScreen";
        bindings = {
          "space f f" = "file_finder::Toggle";
        };
      }
      {
        context = "BufferSearchBar";
        bindings = {
          "ctrl-[" = "buffer_search::Dismiss";
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
