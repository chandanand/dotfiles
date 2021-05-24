function _not_inside_tmux
  test -z "$TMUX"
end

if _not_inside_tmux
  tat
end
