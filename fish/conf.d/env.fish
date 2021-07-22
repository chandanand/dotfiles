fish_add_path $HOME/.bin

# config paths
set -gx BAT_CONFIG_PATH "$HOME/.config/bat/config"
set -gx RIPGREP_CONFIG_PATH "$HOME/.rgrc"

set -gx EDITOR nvim
set -gx VISUAL nvim

set -gx GOPATH $HOME/gocode

# defaults
# based on https://github.com/junegunn/fzf#3-interactive-ripgrep-integration
set -gx INITIAL_QUERY ""
set -gx RG_PREFIX "rg --column --line-number --no-heading --color=always --smart-case "
set -gx FZF_DEFAULT_COMMAND "$RG_PREFIX '$INITIAL_QUERY'" \
  fzf --bind "change:reload:$RG_PREFIX {q} || true" \
      --ansi --disabled --query "$INITIAL_QUERY"
set -gx FZF_DEFAULT_OPTS "
--layout=reverse
--info=inline
--height=50%
--border
--multi
--preview-window=:hidden
--color='hl:148,hl+:154,pointer:032,marker:010,bg+:237,gutter:008'
--prompt='∼ ' --pointer='▶' --marker='✓'
--bind '?:toggle-preview'
--bind 'ctrl-a:select-all'
--bind 'ctrl-y:execute-silent(echo {+} | pbcopy)'
--bind 'ctrl-e:execute(echo {+} | xargs -o nvim)'
--bind 'ctrl-v:execute(code {+})'
"

set -g fzf_preview_dir_cmd "ls --tree -A -F"
