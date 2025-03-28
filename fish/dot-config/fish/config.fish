set fish_greeting

fish_add_path /opt/homebrew/bin
fish_add_path $HOME/.ghcup/bin

alias y "yazi"
alias v "nvim"
alias vi "nvim"
alias ls "eza"
alias ll "eza -l --git"
alias la "eza -la"
alias tree "eza -T"
alias cl "clion"
alias ws "webstorm"
alias supa "supabase"
alias sed "gsed"

# catppuccin mocha https://github.com/catppuccin/fzf
set -Ux FZF_DEFAULT_OPTS "\
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#45475a \
--multi"

starship init fish | source
zoxide init fish | source
