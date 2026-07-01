{
  pkgs,
  ...
}:
{
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    clock24 = true;
    escapeTime = 0;
    historyLimit = 50000;
    keyMode = "vi";
    prefix = "C-SPACE";
    shell = "${pkgs.fish}/bin/fish";
    terminal = "$TERM";
    extraConfig = ''
      bind r source-file ~/.config/tmux/tmux.conf \; display-message "Configuration reloaded"

      set -sa terminal-features "$TERM:RGB"
      set -g renumber-windows on

      bind c new-window -c "#{pane_current_path}"
      bind | split-window -h -c '#{pane_current_path}'
      bind - split-window -c '#{pane_current_path}'
      bind K kill-window

      bind -n S-Up resize-pane -U 2
      bind -n S-Down resize-pane -D 2
      bind -n S-Left resize-pane -L 2
      bind -n S-Right resize-pane -R 2

      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      # bind g display-popup -d "#{pane_current_path}" -w 90% -h 90% -E "lazygit"

      # Kanagawa Paper Ink
      # https://github.com/thesimonho/kanagawa-paper.nvim/blob/ecf19801a2673054c19421d82b766f7641688320/palette_colors.md
      set -g status-style ""
      set -g status-left "#S"
      set -g status-right ""
      set -g status-justify absolute-centre

      set -g window-status-format "#[fg=#1f1f28,bg=#363646,nobold,nounderscore,noitalics] #I #[fg=#9e9b93,bg=#1f1f28,nobold,nounderscore,noitalics] #W "
      set -g window-status-current-format "#[fg=#1f1f28,bg=#c4b28a,nobold,nounderscore,noitalics] #I #[fg=#dcd7ba,bg=#1f1f28,nobold,nounderscore,noitalics] #W "

      set -g message-style "fg=#dcd7ba,bg=#1f1f28"
      set -g message-command-style "fg=#dcd7ba,bg=#1f1f28"
      set -g mode-style "fg=#c4b28a,bg=#363646"
    '';
  };
}
