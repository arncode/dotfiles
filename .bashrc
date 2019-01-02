export HISTCONTROL=ignoredups:erasedups
export HISTSIZE=10000
export HISTFILESIZE=10000
shopt -s histappend

# Common aliases
alias ls='ls --color=auto -h'
alias ll='ls --color=auto -hl'
alias la='ls --color=auto -hlA'

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'

lambda=$'\u03bb'
#export PS1="\[\033[1;37m\]\w \`_EXIT=\$?;if [ \$_EXIT != 0 ];then echo \"\033[0;31m(\$_EXIT) \";fi\`\[\033[1;34m\]$lambda\[\033[0m\] "
export PS1="\[\033[1;37m\]\w \[\033[1;34m\]$lambda\[\033[0m\] "
unset lambda

mcd () {
  mkdir -p $1 && cd $1
}

#inject additional environment specific settings if present
if [ -f ".bashrc.local" ]; then
  source .bashrc.local
fi

if [ -z "$TMUX" ]; then
  exec tmux
fi

