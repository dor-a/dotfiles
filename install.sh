#!/usr/bin/env bash
# Dotfiles installation and setup script for macOS
# Usage: ./install.sh

set -euo pipefail

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Logging functions
log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

log_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES_DIR="$SCRIPT_DIR"

log_info "Starting dotfiles installation from $DOTFILES_DIR"

# ============================================================================
# PRE-INSTALLATION CHECKS
# ============================================================================

log_info "Performing pre-installation checks..."

# Check if we're on macOS
if [[ "$OSTYPE" != "darwin"* ]]; then
    log_error "This script is designed for macOS only"
    exit 1
fi

# Check if Xcode Command Line Tools are installed
if ! command_exists "git"; then
    log_warning "Xcode Command Line Tools not found. Please install them first:"
    log_info "xcode-select --install"
    exit 1
fi

log_success "Pre-installation checks passed"

# ============================================================================
# HOMEBREW INSTALLATION
# ============================================================================

# log_info "Checking for Homebrew..."

# if ! command_exists "brew"; then
#     log_info "Installing Homebrew..."
#     /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
#     # Add Homebrew to PATH for Apple Silicon Macs
#     if [[ -d "/opt/homebrew" ]]; then
#         echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
#         eval "$(/opt/homebrew/bin/brew shellenv)"
#     fi
    
#     log_success "Homebrew installed successfully"
# else
#     log_success "Homebrew already installed"
# fi

# # ============================================================================
# # INSTALL PACKAGES FROM BREWFILE
# # ============================================================================

# log_info "Installing packages from Brewfile..."

# if [[ -f "$DOTFILES_DIR/Brewfile" ]]; then
#     cd "$DOTFILES_DIR"
#     brew bundle install
#     log_success "Homebrew packages installed"
# else
#     log_warning "Brewfile not found, skipping package installation"
# fi

# ============================================================================
# OH-MY-ZSH INSTALLATION
# ============================================================================

log_info "Checking for Oh My Zsh..."

if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
    log_info "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    log_success "Oh My Zsh installed successfully"
else
    log_success "Oh My Zsh already installed"
fi


# ============================================================================
# STOW DOTFILES
# ============================================================================

log_info "Stowing dotfiles..."

if ! command_exists "stow"; then
    log_error "GNU Stow not found. Please install it first: brew install stow"
    exit 1
fi

# Backup existing files
backup_dir="$HOME/.dotfiles-backup-$(date +%Y%m%d-%H%M%S)"
mkdir -p "$backup_dir"

# List of files to backup before stowing
backup_files=(
    "$HOME/.zshrc"
    "$HOME/.zshenv"
    "$HOME/.gitconfig"
    "$HOME/.gitignore_global"
)

for file in "${backup_files[@]}"; do
    if [[ -f "$file" ]] && [[ ! -L "$file" ]]; then
        log_info "Backing up existing $file"
        cp "$file" "$backup_dir/"
        rm "$file"  # Remove the original file so stow can create symlink
    fi
done

# Stow packages
cd "$DOTFILES_DIR"
for package in */; do
    package_name=${package%/}
    if [[ "$package_name" != ".git" ]] && [[ -d "$package_name" ]]; then
        log_info "Stowing $package_name..."
        stow --adopt "$package_name" || {
            log_warning "Conflict detected with $package_name, using --adopt to resolve"
            stow --adopt "$package_name"
        }
    fi
done

log_success "Dotfiles stowed successfully"

if [[ -d "$backup_dir" ]] && [[ -n "$(ls -A "$backup_dir" 2>/dev/null)" ]]; then
    log_info "Original files backed up to: $backup_dir"
fi

# ============================================================================
# CONFIGURE GIT
# ============================================================================

log_info "Configuring Git..."

# Check if git user is configured
if ! git config --global user.name >/dev/null 2>&1; then
    read -p "Enter your Git username: " git_username
    git config --global user.name "$git_username"
fi

if ! git config --global user.email >/dev/null 2>&1; then
    read -p "Enter your Git email: " git_email
    git config --global user.email "$git_email"
fi

log_success "Git configured"

# ============================================================================
# CONFIGURE SHELL
# ============================================================================

log_info "Configuring shell..."

# Set zsh as default shell if it isn't already
if [[ "$SHELL" != "$(which zsh)" ]]; then
    log_info "Setting zsh as default shell..."
    sudo chsh -s "$(which zsh)" "$USER"
    log_success "Default shell changed to zsh (restart required)"
else
    log_success "Zsh is already the default shell"
fi

# ============================================================================
# FINAL SETUP
# ============================================================================

log_info "Running final setup tasks..."

# Reload shell configuration
if [[ -f "$HOME/.zshenv" ]]; then
    source "$HOME/.zshenv"
fi

# Initialize completions
if command_exists "zsh"; then
    zsh -c "autoload -U compinit && compinit"
fi

log_success "Final setup completed"

# ============================================================================
# COMPLETION MESSAGE
# ============================================================================

echo ""
echo "======================================================================"
log_success "Dotfiles installation completed successfully!"
echo "======================================================================"
echo ""
log_info "What was installed/configured:"
echo "  • Homebrew and essential packages"
echo "  • Oh My Zsh with custom plugins"
echo "  • Modular zsh configuration"
echo "  • Git configuration with modern settings"
echo "  • DevOps aliases and completions"
echo "  • FZF with custom keybindings (Ctrl+H, Ctrl+F)"
echo ""
log_info "Next steps:"
echo "  1. Restart your terminal or run: source ~/.zshrc"
echo "  2. Customize any settings in ~/.zshrc.local (optional)"
echo "  3. Configure cloud CLI tools (aws configure, gcloud init, etc.)"
echo ""
log_info "Useful commands:"
echo "  • keys - Show custom keybindings"
echo "  • Show available aliases: alias | fzf"
echo "  • Update dotfiles: cd $DOTFILES_DIR && git pull && stow */"
echo ""
log_warning "If you encounter any issues, check the backup at: $backup_dir"
echo ""
log_success "Happy coding! 🚀"