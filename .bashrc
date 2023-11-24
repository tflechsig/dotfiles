# T. Flechsig
alias ls="ls -lath --color --group-directories-first"
alias vim=nvim
alias poff="systemctl poweroff"
# Manage dot files with bare git repo 
alias gid="git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME/"
alias spotify="spotify --no-zygote"

# case insensitive tab completion
bind "set completion-ignore-case on"

# prevents additional space added when expanding
shopt -s direxpand

# enable vi movements within shell
set -o vi

# map k j to Esc in vi mode of bash shell
bind '"kj":vi-movement-mode'

# git completion
source /usr/share/bash-completion/completions/git

################################################################################
# Bash prompt function
################################################################################
set_PS1 () {
  # if in home directory, git status should use dotfile bare git repo
  if [ $(pwd) == $HOME ]
  then
    git_stat=$(gid status -uno 2>&1 | grep -o "fatal\|nothing")
    git_branch=$(gid branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/')
  else
    git_stat=$(git status -uno 2>&1 | grep -o "fatal\|nothing")
    git_branch=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/')
  fi
  
  # color coding:
  # \e is the beginning escape sequence and m signifies the end of the
  # formatting the formatting is 3 numbers separated by semicolons in which the
  # order does not matter since the number represent unique formatting
  # characteristics font formatting => 0 - regular, 1 - bold, 4 - underline
  green="\[\e[1;32m\]"
  blue="\[\e[1;36m\]"
  red="\[\e[1;31m\]"
  purple="\[\e[1;35m\]"
  std_color="\[\e[0m\]"
  
  if [ "$git_stat" == "nothing" ]
  then
    export PS1="${green}\w${blue}${git_branch}${green} \n${purple} ${std_color}"
  elif [ "$git_stat" == "fatal" ]
  then
    export PS1="${green}\w\n${purple} ${std_color}"
  else
    export PS1="${green}\w${blue}${git_branch}${red} \n${purple} ${std_color}"
  fi
}

PROMPT_COMMAND=set_PS1

################################################################################

