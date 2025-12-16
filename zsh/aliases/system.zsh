#!/usr/bin/env zsh
# System utilities and navigation aliases

# ============================================================================
# NAVIGATION & DIRECTORY LISTING
# ============================================================================

# alias cat='bat --color=always'
# Enhanced ls commands
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'


# Directory shortcuts
alias desk='cd ~/Desktop'
alias docs='cd ~/Documents'
alias down='cd ~/Downloads'
alias dev='cd ~/Developer'

alias vim='nvim'  # Use nvim instead of vim if available
alias vi='nvim'  # Use nvim instead of vim if available
# ============================================================================
# FILE OPERATIONS
# ============================================================================
# File operations with confirmation
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# Better file operations
alias mkdir='mkdir -p'
alias md='mkdir -p'
alias rd='rmdir'

# Find files
alias ff='find . -name'
alias fh='find . -name ".*"'

# ============================================================================
# SYSTEM UTILITIES
# ============================================================================

# System information
alias df='df -h'
alias du='du -h'
alias free='free -h'
alias ps='ps aux'
alias psg='ps aux | grep'

# Process management
alias j='jobs -l'
alias h='history'
alias path='echo -e ${PATH//:/\\n}'

# macOS specific
if [[ "$OSTYPE" == darwin* ]]; then
    alias update='brew update; brew upgrade; brew cleanup'
    alias flushdns='sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder'
fi

# ============================================================================
# NETWORK UTILITIES
# ============================================================================

# Network
alias myip='curl -s ifconfig.me && echo'
alias localip='ipconfig getifaddr en0'
alias ips='ifconfig -a | grep -o "inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)" | awk "{ sub(/inet6? (addr:)? ?/, \"\"); print }"'
alias ping='ping -c 5'
alias ports='netstat -tuln'

# ============================================================================
# TEXT PROCESSING
# ============================================================================

# Text processing
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Archive extraction
alias extract='tar -xvf'
alias unzip='unzip -q'

# ============================================================================
# QUICK EDITS & SHORTCUTS
# ============================================================================

# Quick edits
alias zshrc='${EDITOR:-nvim} ~/.zshrc'
alias hosts='sudo ${EDITOR:-nvim} /etc/hosts'

# Reload shell
alias reload='source ~/.zshrc'
alias rl='source ~/.zshrc'

# Clear screen
alias c='clear'
alias cls='clear'
