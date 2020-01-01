#################################################
# Set editor to be vim
#################################################
export EDITOR="vim"

#################################################
# Set useful aliases
#################################################
alias grep='grep --color=auto'
alias ls='ls'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

#################################################
# Set GIT completion if available
#################################################
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

#################################################
# Bash prompt configuration
#################################################
[ -f "$HOME/.git-prompt.sh" ] && source $HOME/.git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
export PS1="\[\e[0;32m\]\u \[\e[0;33m\]\w\[\e[00m\]\$(__git_ps1 ' (%s)')\[\e[00m\] \$\[\e[00m\] "

#################################################
# Setup PATH variable
#################################################
export PRIVATE_BIN="$HOME/bin"
export RUST="$HOME/.cargo/bin"
export NODE="/usr/local/lib/node_modules"
export DOCKER="$HOME/.bin"
export BREW="/usr/local/Cellar"
export PUBLIC_BIN="/usr/local/bin"
export PATH="$PRIVATE_BIN:$RUST:$NODE:$DOCKER:$BREW:$PUBLIC_BIN:$PATH"

#################################################
# Set up Node Version Manager
#################################################
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
nvm alias default 12
