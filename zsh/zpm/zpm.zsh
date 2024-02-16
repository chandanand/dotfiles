#!/bin/zsh

## DIY zsh package manager: https://github.com/mattmc3/zsh_unplugged.git


##? Clone a plugin, identify its init file, source it, and add it to your fpath.

function zpm-load {
  local repo plugindir initfile initfiles=()
  : ${ZPLUGINDIR:=${ZDOTDIR:-~/.config/zsh}/plugins}
  for repo in $@; do
    plugdir=$ZPLUGINDIR/${repo:t}
    initfile=$plugdir/${repo:t}.plugin.zsh

    # Clone repository for the plugin if isn't there already
    if [[ ! -d $plugdir ]]; then
      echo "Cloning $repo..."
      command git clone -q --depth 1 --recursive --shallow-submodules https://github.com/$repo $plugdir
      [[ $? -eq 0 ]] || { >&2 echo "zpm-load: git clone failed; '$repo'" && continue}
    fi

    # Symlink an init.zsh if there isn't one so the plugin is easy to source
    if [[ ! -e $initfile ]]; then
      initfiles=($plugdir/*.{plugin.zsh,zsh-theme,zsh,sh}(N))
      (( $#initfiles )) || { echo >&2 "zpm-load: no plugin init file found '$repo'." && continue }
      command ln -sf $initfiles[1] $initfile
    fi

    # source the plugin to make it active in the current environment
    source $initfile

    # Modify the path to include the plugin directory
    fpath+=$plugdir
    [[ -d $plugdir/functions ]] && fpath+=$plugdir/functions

    (( $+functions[zsh-defer] )) && zsh-defer . $initfile || . $initfile
  done
}

function zpm-update {
	ZPLUGINDIR=${ZPLUGINDIR:-$HOME/.config/zsh/plugins}
	for d in $ZPLUGINDIR/*/.git(/); do
		echo "Updating ${d:h:t}..."
		command git -C "${d:h}" pull --ff --recurse-submodules --depth 1 --rebase --autostash
	done
}

function zpm-list {
	ZPLUGINDIR=${ZPLUGINDIR:-$HOME/.config/zsh/plugins}
	for d in $ZPLUGINDIR/*/.git(/); do
		command git -C "${d:h}" remote get-url origin
	done
}

function zpm-compile {
	ZPLUGINDIR=${ZPLUGINDIR:-$HOME/.config/zsh/plugins}
	autoload -U zrecompile
	local f
	for f in $ZPLUGINDIR/**/*.zsh{,-theme}(N); do
		zrecompile -pq "$f"
	done
}
