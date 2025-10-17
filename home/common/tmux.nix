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
      bind K  "kill-window"

      bind -n S-Up resize-pane -U 2
      bind -n S-Down resize-pane -D 2
      bind -n S-Left resize-pane -L 2
      bind -n S-Right resize-pane -R 2

      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      bind g display-popup -d "#{pane_current_path}" -w 90% -h 90% -E "lazygit"

      set -g status-style ""
      set -g status-left "#S"
      set -g status-right ""
      set -g status-justify absolute-centre
      set -g window-status-format "#[fg=#{@thm_bg},bg=#{@thm_overlay_0},nobold,nounderscore,noitalics] #I #[fg=#{@thm_surface_2},bg=#{@thm_bg},nobold,nounderscore,noitalics] #W "
      set -g window-status-current-format "#[fg=#{@thm_bg},bg=#{@thm_lavender},nobold,nounderscore,noitalics] #I #[fg=#{@thm_fg},bg=#{@thm_bg},nobold,nounderscore,noitalics] #W "
    '';
  };
}
