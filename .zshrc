export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="agnoster"
DISABLE_UPDATE_PROMPT="true"
setopt extended_glob

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

# etc
alias sudo='sudo '

export EDITOR=vim
export NODE_TLS_REJECT_UNAUTHORIZED=0
export npm_config_strict_ssl=false

# Windows
export winusers="/mnt/c/Users/20230375"

# repos
function pull-daqs() {
	cd ~/repos/daqs/daqs-v2-web
	git pull
	cd ~/repos/daqs/daqs-v2-api
	git pull
}

alias code-daqs='code ~/repos/daqs/daqs-v2-web && code ~/repos/daqs/daqs-v2-api'

# bun completions
[ -s "/home/ahas/.bun/_bun" ] && source "/home/ahas/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
