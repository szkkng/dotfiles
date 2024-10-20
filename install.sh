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

stow -v -d ~/dotfiles -t ~ bat fish delta git ideavim karabiner neovim starship wezterm yazi

fish -c "curl -sL https://git.io/fisher | source && fisher update"

curl https://get.volta.sh | bash
~/.volta/bin/volta install node

ghcup install ghc --set
ghcup install stack --set
ghcup install hls --set

