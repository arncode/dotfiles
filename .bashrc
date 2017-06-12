# Common aliases
alias ls='ls -hF --color=tty'
alias ll='ls -lh'
alias la='ls -A'

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'

lambda=$'\u03bb'
export PS1="\[\033[1;37m\]\w \`_EXIT=\$?;if [ \$_EXIT != 0 ];then echo \"\033[0;31m(\$_EXIT) \";fi\`\[\033[1;34m\]$lambda\[\033[0m\] "
unset lambda

