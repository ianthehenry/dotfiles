function addpath {
  PATH="$PATH:$1"
}

if [[ -z "$IN_NIX_SHELL" ]]; then
  PATH=""
  addpath "$HOME/bin"
  addpath "./node_modules/.bin"
  addpath "/usr/local/bin"
  addpath "/usr/local/sbin"
  addpath "/usr/bin"
  addpath "/usr/sbin"
  addpath "/bin"
  addpath "/sbin"

  export NIX_PAGER=

  export PATH

  if [[ -e ~/.nix-profile/etc/profile.d/nix.sh ]]; then
    source ~/.nix-profile/etc/profile.d/nix.sh
  fi
fi
