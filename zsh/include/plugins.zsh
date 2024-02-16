# Set where to store zsh plugins
ZDOTDIR=${HOME}/.config/zsh/
ZPLUGINDIR=${HOME}/.zsh/plugins/

# source zpm
source $ZDOTDIR/zpm/zpm.zsh

plugins=(
	# core plugins
	zsh-users/zsh-autosuggestions
	zsh-users/zsh-completions

	# user plugins
	reegnz/jq-zsh-plugin
	MichaelAquilina/zsh-you-should-use
	rupa/z

	# load these last
	zdharma-continuum/fast-syntax-highlighting
)

zpm-load $plugins

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=242' # Use a lighter gray for the suggested text
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE="20"
FAST_HIGHLIGHT[use_brackets]=1
