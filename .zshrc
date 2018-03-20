ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="ian"
HYPHEN_INSENSITIVE="true"
DISABLE_LS_COLORS="true"
COMPLETION_WAITING_DOTS="true"
plugins=(zsh-syntax-highlighting)
fpath=(~/bin/completions $fpath)
# This must be separate for (at least) zsh 5.0.2...
export fpath

source "$ZSH/oh-my-zsh.sh"

unsetopt HIST_VERIFY
setopt extendedglob

export VISUAL="subl -w"

alias ls='ls -Fx'
alias la='ls -AFx'
alias l='ls -loAh'
alias ll='ls -loAh'
alias s='source ~/.zshrc; source ~/.zshenv'
alias srd='perl -pe'
alias e='emacsclient -n'
alias -g .f='$(fzf)'
alias gap='git add -p'
alias gcp='git checkout -p'
alias cp='cp -p'

alias subl.='subl .'
alias xcode='open *.xcworkspace 2&>/dev/null || open *.xcodeproj'
alias emacs='open -a Emacs'
alias d='terminal-notifier -message "done: $?"'
alias -g .c='$(git log --oneline --topo-order --decorate -n100 | fzf --reverse | cut -d" " -f1)'
alias -g .d='$(git diff-index --name-only HEAD | fzf | xargs -n1 printf "%s/%s\n" $(git root))'

sd() {
  git diff --no-ext-diff "$@" > /tmp/git.diff
  subl /tmp/git.diff
}

sdc() {
  git diff --no-ext-diff --cached "$@" > /tmp/git.diff
  subl /tmp/git.diff
}

jf() {
  pbpaste | jq '.' | pbcopy
}

"="() {
  echo "$@" | bc
}
