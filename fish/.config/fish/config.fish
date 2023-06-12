set fish_greeting

fish_add_path /opt/homebrew/bin
fish_add_path $HOME/.scripts

function fish_user_key_bindings
  bind \cr 'peco_select_history (commandline -b)'
end

balias ls "exa"
balias ll "exa -l --git"
balias cdv "cd $HOME/vst-dev/"
balias cdw "cd $HOME/web-dev/"
balias cat "bat"
balias less "bat"
balias vi "nvim"
balias cl "clion"
balias ws "webstorm"

starship init fish | source
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH
