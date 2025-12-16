# initialises p10k
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Homebrew
if [[ -f "/opt/homebrew/bin/brew" ]]; then
  # If you're using macOS, you'll want this enabled
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# install zinit plugins manager
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# install if doesn't exist
if [ ! -d $ZINIT_HOME ]; then
       	mkdir -p "$(dirname $ZINIT_HOME)"
	git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# source/load zinit
source "${ZINIT_HOME}/zinit.zsh"

# add p10k plugin
zinit ice depth=1; zinit light romkatv/powerlevel10k

# zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

# Auto Complete snippets
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

# ============================================================================
# COMPLETION SETUP
# ============================================================================

# Remove Intel Homebrew from fpath and add ARM64 Homebrew
if [[ "$OSTYPE" == darwin* ]]; then
    # Remove /usr/local paths (Intel Homebrew)
    fpath=(${fpath:#/usr/local/*})
    # Add ARM64 Homebrew to the front
    fpath=(/opt/homebrew/share/zsh/site-functions $fpath)
fi

# load completions
autoload -U compinit && compinit

# Load fzf-tab AFTER compinit
zinit light Aloxaf/fzf-tab

# Load fzf configuration (includes fzf-tab zstyles)
source "$HOME/fzf.zsh"

zinit cdreplay -q

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# history
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_find_no_dups

# Essential options only
# setopt auto_cd              # cd by typing directory name
# setopt extended_glob        # use extended globbing syntax
# setopt no_beep             # don't beep on errors

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no






# Load aliases by category
for alias_file in "$HOME/aliases"/*.zsh; do
    [[ -f "$alias_file" ]] && source "$alias_file"
done




# Exports Paths

export PATH="$HOME/.tfenv/bin:$PATH"
# setup gcloud-sdk
export PATH="/usr/local/share/google-cloud-sdk/bin:$PATH"
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

# executable files
export PATH="$HOME/.local/bin:$PATH"

# setup nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export NODE_TLS_REJECT_UNAUTHORIZED=0
