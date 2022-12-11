set fish_greeting

fish_add_path /opt/homebrew/bin
fish_add_path $HOME/.scripts

function fish_user_key_bindings
  bind \cr 'peco_select_history (commandline -b)'
end

balias ls "exa"
balias ll "exa -l --git"
balias t "tmux"
balias ta "tmux a"
balias cdj "cd ~/vst-dev/"
balias bb "BinaryBuilder"
balias cat "bat"
balias less "bat"
balias vi "nvim"
balias nv "neovide --frame buttonless --maximized"
balias dev "dev.sh"

starship init fish | source
