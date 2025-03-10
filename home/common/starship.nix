{ lib, ... }:
{
  programs.starship = {
    enable = true;
    enableTransience = true;
    settings = {
      format = lib.concatStrings [
        "$directory"
        "$git_branch"
        "$git_state"
        "$git_status"
        "$cmd_duration"
        "$line_break"
        "$character"
      ];
      directory = {
        style = "lavender";
      };
      character = {
        success_symbol = "[󰘧](lavender)";
        error_symbol = "[󰘧](red)";
        vimcmd_symbol = "[󰘧](yellow)";
      };
      git_branch = {
        format = "[$branch](surface2)";
      };
      git_status = {
        format = "[[(*$conflicted$untracked$modified$staged$renamed$deleted)](pink) ($ahead_behind$stashed)](lavender)";
        conflicted = "​";
        untracked = "​";
        modified = "​";
        staged = "​";
        renamed = "​";
        deleted = "​";
        stashed = "≡";
      };
      git_state = {
        format = "\\([$state( $progress_current/$progress_total)](blue)\\) ";
      };
      cmd_duration = {
        format = " [$duration](mauve) ";
      };
    };
  };
  programs.fish.interactiveShellInit = "
    function starship_transient_prompt_func
      echo
      starship module character
    end
  ";
}
