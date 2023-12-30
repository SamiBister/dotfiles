# Setup fzf
# ---------
if [[ ! "$PATH" == */opt/homebrew/opt/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/opt/homebrew/opt/fzf/bin"
fi

# Auto-completion
# ---------------
source "/opt/homebrew/opt/fzf/shell/completion.zsh"

# Key bindings
# ------------
source "/opt/homebrew/opt/fzf/shell/key-bindings.zsh"

# Default command options
# -----------------------
FZF_DEFAULT_COMMAND='find . -type f -not \( -path './.git*' -prune -o -path './node_modules*' -prune \) | fzf'

FZF_DEFAULT_OPTS="--preview 'cat {}' --preview-window right:50%"
