# Coding environment

* Install `oh-my-zsh`
* Install `brew`

## Oh My Zsh configuration

```bash
cp .zshrc ~/.zshrc
cp .oh-my-zsh/custom/themes/norm.zsh-theme
```

## Command-line auto-completion

Install auto-completion scripts for ZSH in the following directory, prefixed with an `underscore`.

```bash
~/.oh-my-zsh/cache/completions
```

For example:
```bash
~/.oh-my-zsh/cache/completions/_gh
~/.oh-my-zsh/cache/completions/_kubectl
~/.oh-my-zsh/cache/completions/_pscale
```

## Vim configuration

```bash
brew install neovim
cp .vimrc ~/.vimrc
```

Add the following script to `~/.config/nvim`

```bash
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
```

## CLIs

```bash
brew install awscli
brew install pscale
brew install terraform
```

## Directory configuration

```bash
cp .gitconfig ~/.gitconfig
mkdir ~/.{config}
mkdir ~/{bin,code}
```
