
# use a nonbreaking space so that i can scroll to the end of an
# empty prompt line in tmux
export PS1=$'%F{blue}%~ ➜\U00A0%f'
export PS2=$'%F{blue}%_ ➜\U00A0%f'

if [[ -n "$IN_NIX_SHELL" ]]; then
  label="nix-shell"
  if [[ "$name" != "$label" ]]; then
    label="$label:$name"
  fi
  export PS1="%F{green}$label $PS1"
  unset label
fi

# completion

fpath+=(~/src/sd ~/.nix-profile/share/zsh/site-functions)
autoload -U compinit
compinit

setopt menu_complete
setopt auto_menu
setopt complete_in_word
setopt always_to_end
zstyle ':completion:*' menu select
zstyle ':completion:*' accept-exact-dirs true

bindkey "${terminfo[kcbt]}" reverse-menu-complete # shift-tab

# history

HISTFILE="$HOME/.zsh_history"
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt share_history          # share command history data

# general interaction stuff

WORDCHARS=''
setopt extendedglob
setopt interactivecomments
setopt long_list_jobs
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus

# print a backslash instead of a % or a # character after partial lines
export PROMPT_EOL_MARK='%S\%s'

export PAGER=less
export LESS='-R -S'
export VISUAL="subl -w"
export SD_EDITOR="subl"

source ~/.zsh_plugins/zsh-autoquoter/zsh-autoquoter.plugin.zsh
source ~/.zsh_plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
source ~/.zsh_plugins/zsh-expander/zsh-expander.plugin.zsh

ZAQ_PREFIXES=('git commit( [^ ]##)# -[^ -]#m' 'ssh( [^ ]##)# [^ -][^ ]#' 'sd [^ ]* --new' 'note' 'to do' 'to did')
ZSH_HIGHLIGHT_HIGHLIGHTERS+=(zaq)

export NIX_BUILD_SHELL=$HOME/src/nix-zshell/result

alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

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

jf() {
  pbpaste | jq '.' | pbcopy
}

"="() {
  echo "$@" | bc
}

# opam configuration
test -r /Users/ian/.opam/opam-init/init.zsh && . /Users/ian/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
