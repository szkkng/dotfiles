{
  pkgs,
  ...
}:
{
  programs.tmux = {
    enable = true;
    extraConfig = ''
      # notifications
      set -sg escape-time 10
      setw -g monitor-activity on
      set -g visual-activity on

      set-option -g default-shell "${pkgs.fish}/bin/fish"
      set-option -g default-terminal "screen-256color"
      set-option -ga terminal-overrides ',xterm-256color:Tc'

      # clock
      setw -g clock-mode-style 24

      # prefix
      set -g prefix C-j

      # vi mode
      setw -g mode-keys vi

      # index
      set -g base-index 1

      # buffer
      set -g buffer-limit 32
      set -g history-limit 96000
      bind b choose-buffer

      # kill
      bind K  "kill-window"

      # split -v |
      bind | split-window -h -c '#{pane_current_path}'

      # split -v -
      bind - split-window -c '#{pane_current_path}'

      # move windows
      bind -n M-Right next-window
      bind -n M-Left  previous-window

      # resize panes
      bind -n S-Up resize-pane -U 2
      bind -n S-Down resize-pane -D 2
      bind -n S-Left resize-pane -L 2
      bind -n S-Right resize-pane -R 2

      # move panes
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      ### others
      bind r source-file ~/.config/tmux/tmux.conf\; display-message "Reload Config!!"
      set -g display-time 2000

      set -g status-style "bg=#{@thm_bg}"
      set -g status-left ""
      set -g status-right ""
      set -g window-status-format "#[fg=#{@thm_bg},bg=#{@thm_overlay_0},nobold,nounderscore,noitalics] #I #[fg=#{@thm_surface_2},bg=#{@thm_bg},nobold,nounderscore,noitalics] #W "
      set -g window-status-current-format "#[fg=#{@thm_bg},bg=#{@thm_lavender},nobold,nounderscore,noitalics] #I #[fg=#{@thm_fg},bg=#{@thm_bg},nobold,nounderscore,noitalics] #W "
    '';
  };
}
