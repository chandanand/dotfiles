function git -d "run `git status` by default, acts like `git` with arguments"
  if test (count $argv) -gt 0
    command git $argv
  else
    command git st
  end
end
