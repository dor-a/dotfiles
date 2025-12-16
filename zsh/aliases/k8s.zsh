#!/usr/bin/env zsh
# Kubernetes (kubectl) aliases and shortcuts

# Basic kubectl commands
alias k='kubectl'
alias kg='kubectl get'
alias kd='kubectl describe'
alias ke='kubectl edit'
alias kdel='kubectl delete'
alias kapp='kubectl apply'
alias kappf='kubectl apply -f'

# Get resources
alias kgp='kubectl get pods'
alias kgs='kubectl get services'
alias kgd='kubectl get deployments'
alias kgn='kubectl get nodes'
alias kgns='kubectl get namespaces'
alias kgi='kubectl get ingress'
alias kgc='kubectl get configmaps'
alias kgsec='kubectl get secrets'
alias kga='kubectl get all'
alias kgpw='kubectl get pods -w'
alias kgpwide='kubectl get pods -o wide'

# Describe resources
alias kdp='kubectl describe pod'
alias kds='kubectl describe service'
alias kdd='kubectl describe deployment'
alias kdn='kubectl describe node'

# Logs and exec
alias kl='kubectl logs'
alias klf='kubectl logs -f'
alias kexec='kubectl exec -it'
alias ksh='kubectl exec -it'

# Context and namespace
alias kctx='kubectx'
alias kns='kubens'

# Port forwarding
alias kpf='kubectl port-forward'

# Top commands
alias ktop='kubectl top'
alias ktopn='kubectl top nodes'
alias ktopp='kubectl top pods'

# Useful shortcuts
alias kwatchpods='kubectl get pods -w'
alias kgetall='kubectl get all --all-namespaces'
alias kdrain='kubectl drain --ignore-daemonsets --delete-emptydir-data'
