fish_add_path $HOME/.bin

# config paths
set -gx BAT_CONFIG_PATH "~/.config/bat/config"
set -gx RIPGREP_CONFIG_PATH "~/.rgrc"

# defaults
# based on https://github.com/junegunn/fzf#3-interactive-ripgrep-integration
set -gx INITIAL_QUERY ""
set -gx RG_PREFIX "rg --column --line-number --no-heading --color=always --smart-case "
set -gx FZF_DEFAULT_COMMAND "$RG_PREFIX '$INITIAL_QUERY'" \
  fzf --bind "change:reload:$RG_PREFIX {q} || true" \
      --ansi --disabled --query "$INITIAL_QUERY" \
      --height=50% --layout=reverse
set -gx FZF_DEFAULT_OPTS '--color=dark' \
'--color=fg:-1,bg:-1,hl:#c678dd,fg+:#ffffff,bg+:#4b5263,hl+:#d858fe' \
'--color=info:#98c379,prompt:#61afef,pointer:#be5046,marker:#e5c07b,spinner:#61afef,header:#61afef' \
'--cycle --reverse --border --height 50% --preview-window=wrap'
