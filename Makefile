# Add profile iterm2.profile.json

create-directories:
	mkdir ~/.{aws,vim,bin}
	mkdir ~/{bin,projects}

install-brew:
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

install-iterm2:
	brew update
	brew tap caskroom/cask
	brew cask install iterm2
	brew cleanup

install-git:
	brew install git bash-completion
	git config --global core.excludesfile ~/.gitexcludes

install-rg:
	brew install rg

install-fasd:
	brew install fasd

install-oh-my-zsh:
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

install-coding-environment:
	git clone git@github.com:joshcroad/coding-environment.git ~/projects/
	cp ~/projects/coding-environment/.{zshrc,gitconfig,vimrc}
	cp -R ~/projects/coding-environemtn/.oh-my-zsh/custom/themes/* ~/.oh-my-zsh/custom/themes/

install-vim:
	brew install vim
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	vim +PluginInstall +wqa

install-tfswitch:
	brew install warrensbox/tap/tfswitch

install-kubectl:
	brew install kubectl

install-aws:
	brew install awscli

init:
	create-directories
	install-brew
	install-iterm2
	install-git
	install-rg
	install-fasd
	install-oh-my-zsh
	install-coding-environment
	install-vim
