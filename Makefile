# Add profile iterm2.profile.json

create-directories:
	mkdir ~/.{aws,vim}
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

install-coding-environment:
	git clone git@github.com:joshcroad/coding-environment.git ~/projects/
	cp ~/projects/coding-environment/.{bash_profile,git-prompt.sh,gitconfig,gitexcludes,profile,vimrc} ~

install-vim:
	brew install vim
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	vim +PluginInstall +wqa

init:
	create-directories
	install-brew
	install-iterm2
	install-git
	install-rg
	install-coding-environment
	install-vim
