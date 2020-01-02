#################################################
# Set editor to be vim
#################################################
export EDITOR="vim"

#################################################
# Set useful aliases
#################################################
alias grep='grep --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

#################################################
# Bash prompt configuration
#################################################
[ -f "$HOME/.git-prompt.sh" ] && source $HOME/.git-prompt.sh
export GPG_TTY=$(tty)
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
export RUBY="/usr/local/opt/ruby/bin"
export PUBLIC_BIN="/usr/local/bin:/usr/local/sbin"
export PATH="$PRIVATE_BIN:$RUST:$NODE:$DOCKER:$BREW:$RUBY:$PUBLIC_BIN:$PATH"

#################################################
# Setup GOPATH variable
#################################################
export GOPATH="$HOME/go"

#################################################
# Set auto-completion if available
#################################################
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
type u >/dev/null && eval "$(u --completion-script-bash)"
type kubectl >/dev/null && source <(kubectl completion bash)

#################################################
# Set up Node Version Manager
#################################################
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
nvm alias default 12
