# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="ian"
DISABLE_LS_COLORS="true"
plugins=(zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

addpath() {
  export PATH="$PATH:$1"
}

unsetopt HIST_VERIFY
setopt extendedglob

export PATH="$HOME/.nodenv/shims"
addpath "$HOME/.local/bin"
addpath "$HOME/.pyenv/shims"
addpath "$HOME/.rbenv/shims"
addpath "$HOME/bin"
addpath "/usr/local/bin"
addpath "/usr/local/sbin"
addpath "/bin"
addpath "/sbin"
addpath "/usr/bin"
addpath "/usr/sbin"
addpath "./node_modules/.bin"
addpath "$HOME/.cabal/bin"
addpath "$HOME/src/httprintf/scripts"

export VISUAL="subl -w"

alias ls="ls -Fx"
alias ll="ls -loAh"
alias l="ll"
alias la="ls -A"
alias subl.='subl .'
alias xcode='open *.xcworkspace 2&>/dev/null || open *.xcodeproj'
alias emacs='open -a Emacs'
alias s='source ~/.zshrc'
alias c='cabal install -j --only-dependencies --enable-tests'
alias d='terminal-notifier -message "done"'
alias srd='perl -pe'
alias -g .c='$(git log --oneline --topo-order --decorate -n100 | fzf --reverse | cut -d" " -f1)'
alias -g .d='$(git diff-index --name-only HEAD | fzf | xargs -n1 printf "%s/%s\n" $(git root))'
alias gap="git add -p"
alias gcp="git checkout -p"
alias words='pbpaste | wc -w'

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

"="() {
  echo "$@" | bc
}
