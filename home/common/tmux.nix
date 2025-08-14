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
    historyLimit = 5000;
    keyMode = "vi";
    prefix = "C-j";
    shell = "${pkgs.fish}/bin/fish";
    terminal = "tmux-256color";
    extraConfig = ''
      set-option -ga terminal-overrides ',xterm-256color:Tc'
      bind c new-window -c "#{pane_current_path}"
      bind | split-window -h -c '#{pane_current_path}'
      bind - split-window -c '#{pane_current_path}'
      bind K  "kill-window"

      bind -n M-Right next-window
      bind -n M-Left  previous-window

      bind -n S-Up resize-pane -U 2
      bind -n S-Down resize-pane -D 2
      bind -n S-Left resize-pane -L 2
      bind -n S-Right resize-pane -R 2

      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      bind G display-popup -d "#{pane_current_path}" -w 80% -h 80% -E "lazygit"

      set -g status-style "bg=#{@thm_bg}"
      set -g status-left ""
      set -g status-right ""
      set -g window-status-format "#[fg=#{@thm_bg},bg=#{@thm_overlay_0},nobold,nounderscore,noitalics] #I #[fg=#{@thm_surface_2},bg=#{@thm_bg},nobold,nounderscore,noitalics] #W "
      set -g window-status-current-format "#[fg=#{@thm_bg},bg=#{@thm_lavender},nobold,nounderscore,noitalics] #I #[fg=#{@thm_fg},bg=#{@thm_bg},nobold,nounderscore,noitalics] #W "
    '';
  };
}
