function _has_subdirs
  if test -d $argv[1]
    set -l result 1
    for whatever in $argv[1]/*/
      set -l result 0
      break
    end
    return $result
  else
    return 1
  end
end

function _add_dir_to_cdpath
  if test -d $argv[1]
    set -g cdpath $cdpath $argv[1]
  end
end

function _add_subdirs_to_cdpath
  if _has_subdirs $argv[1]
    for subdir in $argv[1]/*/
      set -g cdpath $cdpath $subdir
    end
  end
end

_add_dir_to_cdpath "$HOME/code"
set -g CDPATH $cdpath "."

set -gx PROJECT_DIRECTORIES $CDPATH
