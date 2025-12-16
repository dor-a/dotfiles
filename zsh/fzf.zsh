#!/usr/bin/env zsh
# FZF configuration - Simple and efficient
# Usage: sourced by .zshrc

# ============================================================================
# FZF INSTALLATION CHECK
# ============================================================================

# Check if fzf is installed, if not provide installation instructions
if ! command -v fzf &> /dev/null; then
    echo "FZF not found. Install with: brew install fzf"
    return 1
fi

# ============================================================================
# FZF BASIC SETUP
# ============================================================================

# Load fzf completions and key bindings
source <(fzf --zsh)

# ============================================================================
# FZF-TAB CONFIGURATION
# ============================================================================
# Note: fzf-tab must be loaded in .zshrc AFTER compinit
# These zstyles configure how fzf-tab behaves

# Preview directory contents when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'

# Preview directory contents when completing zoxide (z command)
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza -1 --color=always $realpath'

# Use tmux popup for fzf-tab (better UX in tmux)
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup

# Disable sort when completing options with =
zstyle ':completion:complete:*:options' sort false

# Preview when completing environment variables
zstyle ':fzf-tab:complete:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*' fzf-preview 'echo ${(P)word}'

# Preview when completing kill/killall
zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-preview \
  '[[ $group == "[process ID]" ]] && ps --pid=$word -o cmd --no-headers -w -w'
zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-flags '--preview-window=down:3:wrap'

# FZF configuration
export FZF_CTRL_T_COMMAND='rg --color=never --files --hidden --follow -g "!.git"'
export FZF_CTRL_T_OPTS='--preview "bat --color=always --style=numbers,changes {}"'
export FZF_CTRL_R_OPTS="--ansi --color=hl:underline,hl+:underline --preview 'echo {2..} | bat --color=always -pl bash' --preview-window 'down:4:wrap' --bind 'ctrl-/:toggle-preview'"

# ============================================================================
# CUSTOM FZF FUNCTIONS
# ============================================================================

# ============================================================================
# ALIASES FOR FZF FUNCTIONS
# ============================================================================

#!/usr/bin/env zsh
# Keybindings configuration
# Usage: sourced by .zshrc

# ============================================================================
# UNBIND DEFAULT FZF KEYBINDINGS
# ============================================================================

# Unbind default FZF keybindings
bindkey -r '^T'  # Unbind Ctrl+T (file search)
bindkey -r '^R'  # Unbind Ctrl+R (history search)

# ============================================================================
# CUSTOM FZF KEYBINDINGS
# ============================================================================

# Ctrl+H - FZF History search
bindkey '^H' fzf-history-widget

# Ctrl+F - FZF File finder
fzf-find-widget() {
    setopt localoptions pipefail no_aliases 2> /dev/null
    local file
    file=$(find . -type f -not -path '*/\.git/*' 2>/dev/null | fzf --preview 'bat --color=always --style=numbers,changes {}' --height 40% --reverse --border)
    if [[ -n $file ]]; then
        LBUFFER="${LBUFFER}${file}"
    fi
    local ret=$?
    zle reset-prompt
    return $ret
}
zle -N fzf-find-widget
bindkey '^F' fzf-find-widget