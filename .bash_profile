# set git completion if available
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

source ~/.git-completion.bash
source ~/.git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
export PS1="\[\e[0;32m\]\u \[\e[0;33m\]\w\[\e[00m\]\$(__git_ps1 ' (%s)')\[\e[00m\] \$\[\e[00m\] "
export PATH=/usr/local/Cellar:/usr/local/bin:$PATH
export NODE_PATH="/usr/local/lib/node_modules"
export DOCKER_PATH="$HOME/.bin"
export PATH="$NODE_PATH:$DOCKER_PATH:$PATH"
export EDITOR="vim"

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# enable color support of ls and also add handy aliases
alias grep='grep --color=auto'
alias ls='ls'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

if [ -f /usr/local/share/bash-completion/bash_completion ]; then
  . /usr/local/share/bash-completion/bash_completion
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm use 8
