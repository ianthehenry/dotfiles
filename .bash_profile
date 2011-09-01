export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:$PATH"
export NODE_PATH="/usr/local/lib/node_modules"
export PS1="\033[0;32m\w → \033[0m"
alias ll="ls -lA"
alias la="ls -A"
alias cd..="cd .."
alias sdiff="hg diff -g > /tmp/hg.diff ; subl /tmp/hg.diff"
alias subl='/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl'
shopt -s extglob
