eval "$(sheldon source)"

eval "$(starship init zsh)"

# vi mode
bindkey -v
bindkey '^E' end-of-line

export KEYTIMEOUT=15

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[2 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[6 q'
  fi

  zle reset-prompt
}
zle -N zle-keymap-select
zle-line-init() {
    echo -ne "\e[6 q"
}
zle -N zle-line-init

autoload -Uz select-bracketed
zle -N select-bracketed
for m in visual viopp; do
  for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
    bindkey -M $m $c select-bracketed
  done
done

autoload -Uz select-quoted
zle -N select-quoted
for m in visual viopp; do
  for c in {a,i}{\',\",\`}; do
    bindkey -M $m $c select-quoted
  done
done

autoload -Uz surround
zle -N delete-surround surround
zle -N change-surround surround
zle -N add-surround surround
bindkey -a cs change-surround
bindkey -a ds delete-surround
bindkey -a ys add-surround
bindkey -M visual S add-surround

autoload -Uz compinit 
compinit
zstyle ':completion:*' list-colors di=34 ex=33 '=*.(png|svg|jpg|jpeg|gif)=35'
zstyle ':completion:*' menu true select
zstyle ':completion:*' completer _complete _approximate

alias ls="exa"
alias ll="ls -l --git"
alias t="tmux"
alias ta="tmux a"
alias cdj="cd ~/vst-dev/"
alias bb="BinaryBuilder"
alias cat="bat"
alias less="bat"
alias vi="nvim"

alias dev="dev.sh"

export PATH=~/.local/bin/:/opt/homebrew/Cellar/llvm/14.0.6_1/bin/:~/.scripts/:$PATH
