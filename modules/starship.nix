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
        "$line_break"
        "$character"
      ];
      directory = {
        style = "blue";
      };
      character = {
        success_symbol = "[ᗌ](#9cabcA)";
        error_symbol = "[ᗌ](#e46876)";
        vicmd_symbol = "[ᗌ](#818596)";
      };
      git_branch = {
        format = "[$branch]($style)";
        style = "bright-black";
      };
      git_status = {
        format = "[[(*$conflicted$untracked$modified$staged$renamed$deleted)](218) ($ahead_behind$stashed)]($style)";
        style = "cyan";
        conflicted = "​";
        untracked = "​";
        modified = "​";
        staged = "​";
        renamed = "​";
        deleted = "​";
        stashed = "≡";
      };
      git_state = {
        format = "\\([$state( $progress_current/$progress_total)]($style)\\) ";
        style = "bright-black";
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