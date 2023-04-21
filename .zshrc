export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="agnoster"

plugins=(
  git
  fzf
  zsh-autosuggestions
  zsh-syntax-highlighting
)

ZSH_DISABLE_COMPFIX="true"
source $ZSH/oh-my-zsh.sh

# zsh
alias edit-zsh="vim ~/.zshrc"
alias source-zsh="source ~/.zshrc"

# ssh
alias edit-ssh="vim ~/.ssh/config"

# vim
alias edit-initvim="vim ~/.config/nvim/init.vim"
alias vim="nvim"
alias vi="nvim"

# exa
alias ls="exa --icons"
alias ll="exa -l -g --icons"
alias lla="ll -a"

# fzf
function fzfv() {
  fzf --preview '[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (cat {}) 2> /dev/null | head -500'
}

# ripgrep
alias grep="rg"

