# =========================================================
# fzf
# =========================================================

# Use fd as the default source for fzf
# --strip-cwd-prefix removes leading ./ from results
export FZF_DEFAULT_COMMAND='fd --type f --hidden --strip-cwd-prefix'

# UI
export FZF_DEFAULT_OPTS='
  --height=60%
  --layout=reverse
  --border=rounded
  --prompt="  "
  --pointer="  "
  --preview-window=right:65%:wrap:border-left
'

# Preview command
export _FZF_PREVIEW_CMD='bat --color=always --style=plain,numbers --line-range=:500 {}'

# Ctrl+F: file picker excluding hidden files
_fzf_file_no_hidden() {
  local cmd result

  # Remove --hidden from the command
  cmd="${FZF_DEFAULT_COMMAND/--hidden /}"

  result=$(eval "${cmd:-find . -type f}" | \
    fzf --preview "$_FZF_PREVIEW_CMD") \
    && LBUFFER+="$result"

  zle reset-prompt
}

# Register widget
zle -N _fzf_file_no_hidden

# Bind Ctrl+F
bindkey '^F' _fzf_file_no_hidden
