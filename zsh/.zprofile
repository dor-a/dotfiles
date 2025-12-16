# Prefer native Apple Silicon tools first
export PATH="/opt/homebrew/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"

# Load Apple Silicon Homebrew environment
# if [ -x /opt/homebrew/bin/brew ]; then
#   eval "$(/opt/homebrew/bin/brew shellenv)"
# fi

# OrbStack integration (if you use OrbStack for Docker or VMs)
# source ~/.orbstack/shell/init.zsh 2>/dev/null || :