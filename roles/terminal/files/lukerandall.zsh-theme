# ZSH Theme - Preview: https://cl.ly/f701d00760f8059e06dc
# Thanks to gallifrey, upon whose theme this is based

local return_code="%(?..%{$fg_bold[red]%}%? ↵%{$reset_color%})"

function my_git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  GIT_STATUS=$(git_prompt_status)
  [[ -n $GIT_STATUS ]] && GIT_STATUS=" $GIT_STATUS"
  echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$GIT_STATUS$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

GETIP="$(dig @resolver4.opendns.com myip.opendns.com +short)"

#PROMPT='%{$fg[cyan]%}[%W %*]%{$fg[magenta]%} [${GETIP}] %{$fg[green]%}%n%{$reset_color%} %{$fg[yellow]%}%2~%{$reset_color%} $(my_git_prompt_info)%{$reset_color%}%B»%b '
PROMPT='%{$fg[cyan]%}[%W %*]%{$fg[magenta]%} [${GETIP}] %{$fg[green]%}%n%{$reset_color%} %{$fg[yellow]%}%2~%{$reset_color%} $(my_git_prompt_info)%{$reset_color%}%B$%b '


precmd() { print "" }

RPS1="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=") %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%%"
ZSH_THEME_GIT_PROMPT_ADDED="+"
ZSH_THEME_GIT_PROMPT_MODIFIED="*"
ZSH_THEME_GIT_PROMPT_RENAMED="~"
ZSH_THEME_GIT_PROMPT_DELETED="!"
ZSH_THEME_GIT_PROMPT_UNMERGED="?"

