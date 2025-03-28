#!/bin/bash -euxo pipefail

if [[ ! -f /opt/homebrew/bin/brew ]]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

brew bundle
stow --dotfiles --target "$HOME" --verbose bat delta fish git ideavim karabiner nvim starship wezterm yazi
fish --command "fisher update"
fish --command "yes | fish_config theme save 'Catppuccin Mocha'"
