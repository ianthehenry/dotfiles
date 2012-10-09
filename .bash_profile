export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:/usr/local/git/bin:/usr/bin:/usr/sbin:/bin:/sbin"
export NODE_PATH="/usr/local/lib/node_modules"
export PS1="\[\033[0;32m\]\w → \[\033[0m\]"
export VISUAL="subl -w"
alias ls="ls -F"
alias ll="ls -lAh"
alias la="ls -A"
alias cd..="cd .."
alias ..="cd .."
alias sdiff="hg diff -g > /tmp/hg.diff ; subl /tmp/hg.diff"
alias subl.='subl .'
alias lust='ssh ian@lust.cs.utexas.edu'
alias xcode='open Trellis.xcodeproj'
shopt -s extglob

