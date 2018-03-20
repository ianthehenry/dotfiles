function addpath {
  export PATH="$PATH:$1"
}

export PATH=""
addpath "$HOME/.nodenv/shims"
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

export PATH
