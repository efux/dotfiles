dev() {
  local base_dir="/home/efux/Documents/dev"

  if [[ $# -eq 0 ]]; then
    cd "$base_dir" || return
  elif [[ "$1" == "-s" ]]; then
    local selected
    selected=$(find "$base_dir" -mindepth 1 -maxdepth 1 -type d | sed "s|$base_dir/||" | fzf)
    if [[ -n "$selected" ]]; then
      cd "$base_dir/$selected" || return
    fi
  else
    if [[ -d "$base_dir/$1" ]]; then
      cd "$base_dir/$1" || return
    else
      echo "Directory not found: $1"
      return 1
    fi
  fi
}

_dev_completion() {
  local base_dir="$HOME/Documents/dev"
  local -a dirs

  dirs=(${(f)"$(find "$base_dir" -mindepth 1 -maxdepth 1 -type d -exec basename {} \;)"})

  _describe 'dev directories' dirs
}

n() {
  local file
  file=$(find ~/Documents/notes -type f | fzf) || return
  nvim "$file"
}
