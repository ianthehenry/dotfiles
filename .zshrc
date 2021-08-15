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

if [[ -n "$IN_NIX_SHELL" ]]; then
  label="nix-shell"
  if [[ "$name" != "$label" ]]; then
    label="$label:$name"
  fi
  export PS1=$'%{$fg[green]%}'"$label $PS1"
  unset label
fi

# just print a backslash instead of a % or a # character after partial lines
export PROMPT_EOL_MARK='%S\%s'

unsetopt HIST_VERIFY
setopt extendedglob

setopt menucomplete

export VISUAL="subl -w"

export NIX_BUILD_SHELL=$HOME/src/nix-zshell/result

alias ls='ls -Fx'
alias la='ls -AFx'
alias l='ls -loAh'
alias ll='ls -loAh'
alias s='source ~/.zshrc; source ~/.zshenv'
alias e='emacsclient -n'
alias gap='git add -p'
alias gcp='git checkout -p'
alias cp='cp -p'

alias subl.='subl .'
alias xcode='open *.xcworkspace 2&>/dev/null || open *.xcodeproj'
alias d='terminal-notifier -message "done: $?"'

_expand-abbrev() {
  local lastword="${LBUFFER##* }"
  lastword="${lastword#\'}"
  lastword="${lastword#\"}"
  lastword="${lastword#*=}"
  local op=""
  case "$lastword" in
    ".c")
      if git root 2>/dev/null >/dev/null; then
        op="commit"
      fi;;
    ".d")
      if git root 2>/dev/null >/dev/null; then
        op="dirty"
      fi;;
    ".b")
      if git root 2>/dev/null >/dev/null; then
        op="branch"
      fi;;
    ".f") op="file";;
  esac

  if [[ -z "$op" ]]; then
    zle menu-complete
  else
    local result=""
    case "$op" in
      "commit") result=$(git log --oneline --topo-order --decorate -n100 | fzf --exit-0 --select-1 --multi --reverse | cut -d' ' -f1);;
      "dirty")
        local gitroot=$(git root)
        # this is kinda hairy... the perl mess gives you a nice relative path
        # so you can use this with git add, and you don't have to deal with
        # an absolute path since usually you don't need to
        result=$( \
          git -C "$gitroot" ls-files --exclude-standard --modified --others \
        | fzf --exit-0 --select-1 --height 6 --reverse --multi \
        | perl -e 'use File::Spec; while(<STDIN>) { print(File::Spec->abs2rel(File::Spec->catfile($ARGV[0], $_))); }' -- "$gitroot"
        );;
      "branch") result=$(git for-each-ref --sort=-committerdate --format='%(refname:short)' refs/heads | fzf --exit-0 --multi --select-1);;
      "file")  result=$(rg --files | fzf --exit-0 --multi);;
    esac
    replacement=""
    while IFS= read -r line; do
      escaped=$(printf '%q' "$line")
      if [[ ! -z "$replacement" ]]; then
        replacement="$replacement "
      fi
      replacement="$replacement$escaped"
    done <<< "$result"
    LBUFFER="${LBUFFER%"$lastword"}$replacement"
    zle redisplay
  fi
}

zle -N _expand-abbrev
bindkey "\t" _expand-abbrev

jf() {
  pbpaste | jq '.' | pbcopy
}

"="() {
  echo "$@" | bc
}

# opam configuration
test -r /Users/ian/.opam/opam-init/init.zsh && . /Users/ian/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
