{ ... }:
{
  programs.tmux = {
    enable = true;
    extraConfig = ''
            # notifications
            set -sg escape-time 10
            setw -g monitor-activity on
            set -g visual-activity on

            set-option -g default-shell "/home/kengo/.nix-profile/bin/fish"
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

            # mouse
            # set-option -g mouse on
            # bind -n WheelUpPane   select-pane -t= \; copy-mode -e \; send-keys -M
            # bind -n WheelDownPane select-pane -t= \;                 send-keys -M

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

            # panes config
            set-option -g pane-border-status bottom
            set-option -g pane-border-format ""

            # create window
            bind C-c new-window -c '#{pane_current_path}'

            ### synchronized command
            bind s set synchronize-panes on
            bind S set synchronize-panes off

            ### others
            bind r source-file ~/.config/tmux/tmux.conf\; display-message "Reload Config!!"
            set -g display-time 2000
            set -g pane-border-style "fg=#5e81ac"
            set -g pane-active-border-style "fg=#88c0d0" 
            set-option -g status-style bg=default

            # custom kanagawa theme
      #      set -g status-justify "left"
      #      set -g status "on"
      #      set -g status-left-style "none"
      #      set -g message-command-style "fg=#dcd7ba,bg=#252535"
      #      set -g status-right-style "none"
      #      set -g pane-active-border-style "fg=#2e313f"
      #      set -g status-style "none,bg=#1f1f28"
      #      set -g message-style "fg=#dcd7ba,bg=#252535"
      #      set -g pane-border-style "fg=#252535"
      #      set -g status-right-length "100"
      #      set -g status-left-length "100"
      #      setw -g window-status-activity-style "none,fg=#7e9cd8,bg=#1f1f28"
      #      setw -g window-status-separator ""
      #      setw -g window-status-style "none,fg=#dcd7ba,bg=#1f1f28"
      #
            # modules
            module_left="#(whoami)"
            module_right_1="#(ip route get 1 | awk '{print $7}')"
            module_right_2="#H"

            # set -g status-bg "#1f1f28"
            # set -g status-left "#[fg=#1f1f28,bg=#7e9cd8,nobold] $module_left "
            # set -g status-right "#[fg=#6b7089,bg=#252535] $module_right_1 #[fg=#1f1f28,bg=#7e9cd8,nobold] $module_right_2"
            # setw -g window-status-format "#[fg=#727169,bg=#1f1f28,nobold,nounderscore,noitalics]  #W  "
            # setw -g window-status-current-format "#[fg=#dcd7ba,bg=#252535,nobold,nounderscore,noitalics]  #W  "
    '';
  };
}
