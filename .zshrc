# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="ian"

PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/usr/local/share/npm/bin"
VISUAL="subl -w"

alias ls="ls -Fx"
alias ll="ls -lAh"
alias la="ls -A"
alias sdiff="hg diff -g > /tmp/hg.diff ; subl /tmp/hg.diff"
alias sd="git diff > /tmp/git.diff ; subl /tmp/git.diff"
alias sdc="git diff --cached > /tmp/git.diff ; subl /tmp/git.diff"
alias subl.='subl .'
alias xcode='open *.xcworkspace'

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

DISABLE_LS_COLORS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git brew cake autojump mercurial sublime)

source $ZSH/oh-my-zsh.sh
source $HOME/src/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

unalias gm # because graphicsmagick
