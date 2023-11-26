#!/usr/bin/env bash

set_os() {
	if [ -f /etc/os-release ]; then
		. /etc/os-release
		OS=$NAME
	elif type lsb_release >/dev/null 2>&1; then
		OS=$(lsb_release -si)
	elif [ -f /etc/lsb-release ]; then
		. /etc/lsb-release
		OS=$DISTRIB_ID
	elif [ -f /etc/debian_version ]; then
		OS=debian
	elif [ -f /etc/SuSe-release ]; then
		OS=suse
	elif [ -f /etc/redhat-release ]; then
		OS=redhat
	else
		OS=$(uname -s)
	fi
}

set_install_command() {
	if [[ $OS == "Ubuntu" ]]; then
		INSTALL="sudo apt install -y"
		sudo apt remove neovim -y
		sudo add-apt-repository ppa:neovim-ppa/stable
		sudo apt update -y
	elif [[ $OS == "Fedora Linux" ]]; then
		INSTALL="sudo dnf install -y"
	fi
}

install_zsh() {
	ZSH=
	$INSTALL zsh
	chsh -s /bin/zsh
}

install_ohmyzsh() {
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
	curl -o ~/.zshrc https://raw.githubusercontent.com/ahas/common-env/main/.zshrc
	source ~/.zshrc
}

install_utils() {
	$INSTALL exa
	$INSTALL fzf
	$INSTALL ripgrep
}

install_neovim() {
	$INSTALL neovim
	# vim plug
	sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
				 https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	# my init.vim
	mkdir -p ~/.config/nvim
	curl -o ~/.config/nvim/init.vim https://raw.githubusercontent.com/ahas/init.vim/main/init.vim
}

install_nodejs() {
	$INSTALL nodejs npm
	sudo npm install -g n
	sudo n stable
	sudo npm install -g npm
}

install_python() {
	$INSTALL python3
	$INSTALL python3-pip
}

install_git() {
	$INSTALL git
	git config --global core.editor /usr/bin/nvim
}

set_os
set_install_command
install_utils
install_neovim
install_nodejs
install_python
install_git
install_zsh
install_ohmyzsh
