# Dotfiles - macOS Development Environment

A comprehensive dotfiles repository for bootstrapping a complete modern development environment on macOS. This includes shell configuration, Neovim setup, Git workflows, and DevOps/Cloud tools.

## Introduction

This repository contains a carefully curated collection of configuration files and installation scripts designed to set up a productive development environment on macOS from scratch. It includes:

- **Shell Configuration**: Zsh with Powerlevel10k prompt, Zinit plugin manager, fzf integration, and organized category-specific aliases
- **Editor Setup**: Neovim with Lua configuration, lazy.nvim plugin manager, and LSP support via Mason
- **Version Control**: Git configuration with delta diff viewer and helpful aliases
- **DevOps/Cloud Tools**: Pre-configured aliases and tools for Docker, Kubernetes, Terraform, Helm, AWS, Azure, and Google Cloud
- **Package Management**: Homebrew bundle with 100+ carefully selected development dependencies

## Getting Started

### Prerequisites

- **macOS** (tested on Apple Silicon and Intel Macs)
- **Xcode Command Line Tools** (installed automatically if missing)
- **Internet connection** for package downloads

### Installation Process

1. **Clone this repository**:

```bash
git clone https://github.com/dor-a/dotfiles.git ~/Developer/dotfiles
cd ~/Developer/dotfiles
```

2. **Run the installation script**:

```bash
chmod +x install.sh
./install.sh
```

The installation script will:

- Verify you're on macOS and have Xcode Command Line Tools
- Install Homebrew (if not already installed)
- Install all packages from `Brewfile`
- Install and configure Oh My Zsh with plugins
- Install fzf and configure shell integrations
- Create symlinks using GNU Stow for all dotfiles

3. **Restart your terminal** or reload the shell:

```bash
source ~/.zshrc
```

### Software Dependencies

The installation manages dependencies through Homebrew. Key packages include:

**Core Tools**: stow, git, zsh, bash, curl, wget, fd, fzf, ripgrep, bat, jq, yq, tree, htop, ncdu, glances

**Development**: neovim, node, python@3.13, visual-studio-code, sublime-text, postman, mongodb-compass, redis-insight

**Version Control**: gh (GitHub CLI), git-delta

**DevOps & Cloud**:

- **Container**: orbstack (Docker Desktop alternative), docker-compose
- **Kubernetes**: kubectl, kubectx, helm, k9s, kind, eksctl
- **Infrastructure as Code**: tfenv, terragrunt, ansible, crossplane
- **Cloud CLIs**: aws-cli, azure-cli, gcloud-cli
- **Security**: trivy (container vulnerability scanner)
- **GitOps**: argocd

**Neovim Dependencies**: tree-sitter, luajit, lpeg, unibilium, libuv, libsodium

### Project Structure

```
dotfiles/
├── zsh/                          # Shell configuration
│   ├── .zshrc                   # Main zsh configuration
│   ├── .zprofile                # Shell login profile
│   ├── fzf.zsh                  # FZF fuzzy finder setup
│   └── aliases/                 # Organized aliases by category
│       ├── docker.zsh           # Docker aliases
│       ├── git.zsh              # Git aliases
│       ├── helm.zsh             # Helm aliases
│       ├── k8s.zsh              # Kubernetes aliases
│       ├── system.zsh           # System aliases
│       └── terraform.zsh        # Terraform aliases
├── nvim/                        # Neovim configuration
│   └── .config/nvim/
│       ├── init.lua             # Neovim entry point
│       └── lua/                 # Lua configuration and plugins
├── git/                         # Git configuration
│   ├── .gitconfig               # Git settings with delta
│   └── .gitignore_global        # Global gitignore patterns
├── images/                      # Documentation images
├── Brewfile                     # Homebrew bundle manifest
├── install.sh                   # Installation and setup script
├── .stowrc                      # GNU Stow configuration
└── README.md                    # This file
```

## Key Features

### Shell & Terminal

- **Powerlevel10k**: Multi-line prompt with git status integration
- **Zinit**: Fast zsh plugin manager with lazy-loading
- **FZF Integration**: Fuzzy searching for files, directories, and command history
- **FZF-Tab**: Interactive completion with previews
- **Syntax Highlighting**: Real-time zsh syntax validation
- **Auto-suggestions**: Command completions based on history
- **Extended History**: 5000-line history with per-directory history support
- **Organized Aliases**: Category-specific aliases for Docker, Kubernetes, Git, Terraform, and system commands

### Neovim

- **Lazy.nvim**: Lightning-fast plugin manager with auto-loading
- **LSP Support**: Language Server Protocol via Mason and mason-lspconfig for multiple languages
- **Telescope**: Fuzzy finder for files, buffers, and grep searches
- **Trouble**: Diagnostics window for errors and warnings
- **Lua-based**: Modern, extensible configuration in Lua
- **Tree-sitter**: Advanced syntax highlighting and code navigation
- **Hot Reload**: Automatic plugin updates and configuration reload

### Git

- **Delta**: Beautiful, syntax-highlighted diffs
- **Custom Aliases**: Productivity-focused git shortcuts
- **Global Gitignore**: Centralized ignore patterns
- **GPG Signing**: Support for signed commits

## Usage

### Shell Aliases

Access organized aliases through the shell:

```bash
# Git operations
git-log-pretty      # Pretty git log view
git-branch-delete   # Delete merged branches

# Kubernetes
k                   # kubectl shortcut
kgp                 # Get pods
kgd                 # Get deployments

# Docker
docker-clean        # Remove unused containers and images
docker-logs         # Tail container logs

# Terraform
tf                  # Terraform shortcut
tf-plan             # Terraform plan with output
tf-apply            # Terraform apply with confirmation
```

### Neovim

Launch Neovim and start coding:

```bash
nvim filename.ext
```

Common keybindings:

- `<leader>ff`: Find files with Telescope
- `<leader>fg`: Live grep
- `<leader>xx`: Open Trouble diagnostics

### FZF

Use fuzzy finder for enhanced navigation:

- `Ctrl+T`: Fuzzy find files in current directory
- `Ctrl+R`: Search command history
- `cd` + `Tab`: Interactive directory completion

## Build and Test

This is a dotfiles repository without traditional builds or tests. However, you can verify the setup:

```bash
# Verify all packages installed
brew bundle check

# Check zsh configuration
zsh -ic 'echo $ZSH_VERSION'

# Test Neovim configuration
nvim --version
nvim -c 'checkhealth'
```

## Contribute

Contributions are welcome! To contribute:

1. **Fork the repository** on GitHub
2. **Create a feature branch**: `git checkout -b feature/your-feature`
3. **Test your changes** on macOS
4. **Commit with clear messages**: `git commit -m "Add/update: description"`
5. **Push and open a Pull Request** with a description of changes

### Guidelines

- Keep configurations modular and organized by tool/category
- Add comments explaining non-obvious configuration choices
- Update this README if adding new tools or aliases
- Test installation from scratch on a clean macOS environment
- Ensure all scripts are POSIX-compliant or explicitly use bash/zsh

## License

This project is provided as-is for personal and educational use. See LICENSE file if present.

## Acknowledgments

Built with inspiration from:

- [Powerlevel10k](https://github.com/romkatv/powerlevel10k)
- [Neovim](https://neovim.io/)
- [Lazy.nvim](https://github.com/folke/lazy.nvim)
- [FZF](https://github.com/junegunn/fzf)
- [Oh My Zsh](https://ohmyz.sh/)
