# Add profile iterm2.profile.json

dirs:
	mkdir ~/.{aws,vim,bin}
	mkdir ~/{bin}

brew:
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

iterm:
	brew update
	brew tap caskroom/cask
	brew cask install iterm2
	brew cleanup

git:
	brew install git bash-completion
	git config --global core.excludesfile ~/.gitexcludes

rg:
	brew install rg

zsh:
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

dotfiles:
	cp .{gitconfig,vimrc,zshrc} ~/
	cp -R .oh-my-zsh/custom/themes/* ~/.oh-my-zsh/custom/themes/

nvim:
	brew install nvim
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	vim +PluginInstall +wqa
	echo 'set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc
' > ~/.config/nvim/init.vim

docker:
	brew install colima

kubectl:
	brew install kubectl

init: dirs brew iterm git rg fasd zsh dotfiles nvim
