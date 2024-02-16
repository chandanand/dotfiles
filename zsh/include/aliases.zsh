#!/bin/zsh

alias s='source ~/.config/zsh/.zshrc'

# {{{1 Edit Aliases
alias ez='$EDITOR ~/.config/zsh/.zshrc'
alias ea='$EDITOR ~/.config/zsh/include/aliases.zsh'
# }}}

# {{{1 General Aliases
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -i'
alias rmd='rm -rf'
alias mkdir='mkdir -pv'
alias ..='cd ../'
alias ~='cd ~'

if [[ $(command -v ls) =~ gnubin || $OSTYPE =~ linux ]]; then
    alias ls="ls --color=auto"
    alias ll='ls -FlAhpv --color=auto'
    alias ltt='ls -FlAhpv| grep "$(date +"%d %b")"'
else
    alias ls="ls -G"
    alias ll='ls -FGlAhpv'
    alias ltt='ls -FlAhpv| grep "$(date +"%d %b")"'
fi
# }}}

alias vim=nvim
alias v=vim

alias bup='brew update'
alias bug='brew upgrade'

alias t='tmux'
alias ta='tmux attach -t'
alias tn='tmux new -s'
alias tl='tmux ls'
alias tk='tmux kill-session -t'

alias g='git'
alias ga='git add'
alias gaa='git add --all'
alias gp='git push'
alias gpl='git pull'
