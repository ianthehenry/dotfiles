# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="ian"

export VISUAL="subl -w"

alias ls="ls -Fx"
alias ll="ls -lAh"
alias la="ls -A"
alias subl.='subl .'
alias xcode='open *.xcworkspace'
alias emacs='open -a Emacs'
alias s='source ~/.zshrc'

sd() {
    git diff "$@" > /tmp/git.diff
    subl /tmp/git.diff
}

sdc() {
    git diff --cached "$@" > /tmp/git.diff
    subl /tmp/git.diff
}

jf() {
    pbpaste | jq '.' | pbcopy
}

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

DISABLE_LS_COLORS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(brew cake autojump mercurial npm sublime zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

unsetopt HIST_VERIFY
setopt extendedglob
export PATH="$HOME/.cask/bin:$HOME/.cabal/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/usr/local/share/npm/bin"
