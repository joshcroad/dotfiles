PROMPT='%(?.%{$fg[yellow]%}.%{$fg[red]%})λ %{$fg[green]%}%c %{$fg[yellow]%}→ %{$reset_color%}'

# Git prompt appearence
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue]%}git:%{${reset_color}%}"
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_SEPARATOR=" | "
ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg_bold[yellow]%}"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[green]%}%{*%G%}"
ZSH_THEME_GIT_PROMPT_CONFLICTS="%{$fg[red]%}%{✖%G%}"
ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg[blue]%}%{+%G%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{↓%G%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{↑%G%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{…%G%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}%{✔%G%}"
