{ pkgs, ... }:
{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
      set -g pure_symbol_prompt '󰘧'

      ## Kanagawa Paper Ink
      ## https://github.com/thesimonho/kanagawa-paper.nvim/blob/ecf19800a2673054c19421d82b766f7641688320/palette_colors.md
      set -g pure_color_prompt_on_success c4b28a
      set -g pure_color_prompt_on_error c4746e
      set -g pure_color_prompt_on_vim_normal c3b28a
      set -g pure_color_current_directory c4b28a
      set -g pure_color_git_branch 8ea49e
      set -g pure_color_git_dirty c4746e
      set -g pure_color_git_unpulled_commits b6927b
      set -g pure_color_git_unpushed_commits 699469
      set -g pure_color_command_duration 727169

      set -l foreground dcd7ba normal
      set -l selection 363646 brblack
      set -l comment 727169 brblack
      set -l red c4746e red
      set -l orange b6927b brred
      set -l yellow c4b28a yellow
      set -l green 699469 green
      set -l purple 938aa9 magenta
      set -l cyan 8ea49e cyan
      set -l pink a292a3 brmagenta

      # Syntax Highlighting Colors
      set -g fish_color_normal $foreground
      set -g fish_color_command $cyan
      set -g fish_color_keyword $purple
      set -g fish_color_quote $yellow
      set -g fish_color_redirection $foreground
      set -g fish_color_end $orange
      set -g fish_color_error $red
      set -g fish_color_param $pink
      set -g fish_color_comment $comment
      set -g fish_color_selection --background=$selection
      set -g fish_color_search_match --background=2a2a37
      set -g fish_color_operator $green
      set -g fish_color_escape $purple
      set -g fish_color_autosuggestion $comment
      set -g fish_color_valid_path $green
      set -g fish_color_cwd $yellow
      set -g fish_color_cwd_root $red
      set -g fish_color_option $purple

      # Completion Pager Colors
      set -g fish_pager_color_progress $comment
      set -g fish_pager_color_prefix $cyan
      set -g fish_pager_color_completion $foreground
      set -g fish_pager_color_description $comment
      set -g fish_pager_color_selected_background --background=$selection
    '';
    plugins = [
      {
        name = "autopair";
        src = pkgs.fishPlugins.autopair.src;
      }
      {
        name = "fzf";
        src = pkgs.fishPlugins.fzf.src;
      }
      {
        name = "pure";
        src = pkgs.fishPlugins.pure.src;
      }
    ];
    shellAbbrs = {
      zb = "zig build";
      zbr = "zig build run";
    };
  };
}
