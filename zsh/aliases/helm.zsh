#!/usr/bin/env zsh
# Helm aliases and shortcuts

# Basic Helm commands
alias h='helm'
alias hls='helm list'
alias hlsa='helm list --all-namespaces'
alias hst='helm status'
alias hget='helm get'
alias hshow='helm show'

# Helm install/upgrade
alias hi='helm install'
alias hu='helm upgrade'
alias hup='helm upgrade --install'
alias hun='helm uninstall'
alias hd='helm delete'

# Helm repository management
alias hra='helm repo add'
alias hrr='helm repo remove'
alias hru='helm repo update'
alias hrl='helm repo list'
alias hrs='helm search repo'

# Helm chart management
alias hc='helm create'
alias hl='helm lint'
alias hp='helm package'
alias ht='helm template'
alias hdep='helm dependency'
alias hdeps='helm dependency update'

# Helm debugging
alias hdry='helm install --dry-run --debug'
alias hdiff='helm diff'
alias htest='helm test'

# Helm values
alias hv='helm get values'
alias hva='helm get values --all'

# Helm history and rollback
alias hh='helm history'
alias hr='helm rollback'

# Helm plugins
alias hpl='helm plugin list'
alias hpi='helm plugin install'
alias hpu='helm plugin update'