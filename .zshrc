# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="ian"
DISABLE_LS_COLORS="true"
plugins=(brew cake autojump mercurial sublime zsh-syntax-highlighting autojump)
source $ZSH/oh-my-zsh.sh

unsetopt HIST_VERIFY
setopt extendedglob
export PATH="$HOME/.cask/bin:$HOME/.cabal/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/usr/local/share/npm/bin"

export VISUAL="subl -w"

"="() {
  echo "$@" | bc
}

alias ls="ls -Fx"
alias ll="ls -lAh"
alias la="ls -A"
alias subl.='subl .'
alias xcode='open *.xcworkspace'
alias emacs='open -a Emacs'
alias s='source ~/.zshrc'
alias c='cabal install -j --only-dependencies --enable-tests'
alias d='terminal-notifier -message "done"'

fix() {
  git commit $@ --fixup "$(git log --oneline --topo-order --decorate -n30 | fzf --reverse | awk '{print $1}')"
}

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
