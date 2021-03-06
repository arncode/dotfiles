export HISTCONTROL=ignoredups:erasedups
export HISTSIZE=10000
export HISTFILESIZE=10000
shopt -s histappend
PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# Common aliases
alias ls='ls --color=auto -h'
alias ll='ls --color=auto -hl'
alias la='ls --color=auto -hlA'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff -u --color'

fnd () {
  find ./ -iname "*$1*"
}

mcd () {
  mkdir -p $1 && cd $1
}

#https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
source ~/.config/git-prompt.sh

lambda=$'\u03bb'
#export PS1="\[\033[1;37m\]\w \`_EXIT=\$?;if [ \$_EXIT != 0 ];then echo \"\033[0;31m(\$_EXIT) \";fi\`\[\033[1;34m\]$lambda\[\033[0m\] "
export PS1="\[\033[1;37m\]\w\$(__git_ps1) \[\033[1;34m\]$lambda\[\033[0m\] "
unset lambda

#inject additional environment specific settings if present
if [ -f ".bashrc.local" ]; then
  source .bashrc.local
fi

if [ ! -z "$SSH_CONNECTION" ]; then
  export PS1="\[\033[1;37m\]\u@\h\[\033[0m\] $PS1"
fi

if [ -z "$TMUX" ] && [ -z "$SSH_CONNECTION" ]; then
  exec tmux
fi

