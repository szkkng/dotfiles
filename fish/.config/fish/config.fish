set fish_greeting

fish_add_path /opt/homebrew/bin
fish_add_path $HOME/.scripts
fish_add_path $HOME/.ghcup/bin

balias ls "eza"
balias ll "eza -l --git"
balias la "eza -la"
balias tree "eza -T"
balias cdv "cd $HOME/vst-dev/"
balias cdw "cd $HOME/web-dev/"
balias cat "bat"
balias less "bat"
balias vi "nvim"
balias cl "clion"
balias ws "webstorm"
balias supa "supabase"
balias sed "gsed"
balias devch "/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --user-data-dir=~/.chrome-disable-web-security --disable-web-security"

# catppuccin mocha https://github.com/catppuccin/fzf
set -Ux FZF_DEFAULT_OPTS "\
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#45475a \
--multi"

starship init fish | source
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH

zoxide init fish | source

