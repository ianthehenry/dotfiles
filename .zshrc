ZSH="$HOME/.oh-my-zsh"
HYPHEN_INSENSITIVE="true"
DISABLE_LS_COLORS="true"
COMPLETION_WAITING_DOTS="true"
plugins=(zsh-syntax-highlighting)
fpath=(~/bin/completions $fpath)
# This must be separate for (at least) zsh 5.0.2...
export fpath

source "$ZSH/oh-my-zsh.sh"

# use a nonbreaking space so that i can scroll to the end of an
# empty prompt line in tmux
export PS1=$'%{$fg[blue]%}${PWD/#$HOME/~} ➜\U00A0%{$reset_color%}'
export PS2=$'%_ ➜\U00A0'

# just print a backslash instead of a % or a # character after partial lines
export PROMPT_EOL_MARK='%S\%s'

unsetopt HIST_VERIFY
setopt extendedglob

setopt menucomplete

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
alias d='terminal-notifier -message "done: $?"'
alias -g .c='$(git log --oneline --topo-order --decorate -n100 | fzf --reverse | cut -d" " -f1)'
alias -g .d='$(cd $(git root); git ls-files --exclude-standard --modified --others | fzf --height 4 --reverse | xargs -n1 printf "%s/%s\n" $(git root))'

jf() {
  pbpaste | jq '.' | pbcopy
}

"="() {
  echo "$@" | bc
}

# opam configuration
test -r /Users/ian/.opam/opam-init/init.zsh && . /Users/ian/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
