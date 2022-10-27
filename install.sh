#!/bin/bash -eu

if [[ ! -f /opt/homebrew/bin/brew ]]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

if [[ ! -d ~/dotfiles ]]; then
    cd
    git clone https://github.com/szkkng/dotfiles.git
fi

brew bundle -v --file="~/dotfiles/Brewfile"

if [[ ! -d ~/.config ]]; then
    mkdir ~/.config
fi

stow -v -d ~/dotfiles/tools -t ~ zsh starship tmux neovim wezterm sheldon
