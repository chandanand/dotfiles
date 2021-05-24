#!/bin/bash

set -eo pipefail

color() {
  local colornumber="$1"
  shift
  tput setaf "$colornumber"
  echo "$*"
  tput sgr0
}

# blue = 4
# magenta = 5
red(){ color 1 "$*"; }
green(){ color 2 "$*"; }
yellow(){ color 3 "$*"; }

info(){
  green "=== $@"
}

command_does_not_exist(){
  ! command -v "$1" > /dev/null
}

stay_awake_while(){
  caffeinate -dims "$@"
}


if command_does_not_exist brew; then
  info "Installing Homebrew (if not already installed)..."
  stay_awake_while /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

quietly_brew_bundle(){
  local brewfile=$1
  shift
  local regex='(^Using )|Homebrew Bundle complete|Skipping install of|It is not currently installed|Verifying SHA-256|==> (Downloading|Purging)|Already downloaded:|No SHA-256'
  stay_awake_while brew bundle --no-lock --file="$brewfile" "$@" | (grep -vE "$regex" || true)
}

info "Installing Homebrew packages..."
brew tap homebrew/bundle
for brewfile in Brewfile; do
  quietly_brew_bundle "$brewfile" --verbose
done

quietly_brew_bundle Brewfile.casks || true

info "Installing fish shell..."
if ! grep -q 'fish' /etc/shells; then
  echo /usr/local/bin/fish | sudo tee -a /etc/shells
fi
if [ "$SHELL" != '/usr/local/bin/fish' ];then
  chsh -s /usr/local/bin/fish
fi
