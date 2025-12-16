#!/usr/bin/env zsh
# Terraform aliases and shortcuts

# Basic Terraform commands
alias tf='terraform'
alias tfi='terraform init'
alias tfp='terraform plan'
alias tfa='terraform apply'
alias tfd='terraform destroy'
alias tfs='terraform state'
alias tfsh='terraform show'
alias tfo='terraform output'

# Terraform with common flags
alias tfaa='terraform apply -auto-approve'
alias tfda='terraform destroy -auto-approve'
alias tfp='terraform plan -out=tfplan'
alias tfpa='terraform apply tfplan'

# Terraform workspace management
alias tfw='terraform workspace'
alias tfwl='terraform workspace list'
alias tfws='terraform workspace select'
alias tfwn='terraform workspace new'
alias tfwd='terraform workspace delete'

# Terraform state management
alias tfsl='terraform state list'
alias tfss='terraform state show'
alias tfsm='terraform state mv'
alias tfsr='terraform state rm'
alias tfsi='terraform state pull'
alias tfsp='terraform state push'

# Terraform import and taint
alias tfim='terraform import'
alias tft='terraform taint'
alias tfu='terraform untaint'

# Terraform validation and formatting
alias tfv='terraform validate'
alias tff='terraform fmt'
alias tffr='terraform fmt -recursive'

# Terraform console and graph
alias tfc='terraform console'
alias tfg='terraform graph'

# Terraform providers
alias tfpr='terraform providers'
alias tfpl='terraform providers lock'

# Common Terraform workflows
alias tfplan='terraform plan -out=tfplan'
alias tfapply='terraform apply tfplan && rm tfplan'
alias tfcheck='terraform fmt -check=true -diff=true && terraform validate'
alias tfinit='terraform init -upgrade'
alias tfrefresh='terraform apply -refresh-only'

# Terraform with target
alias tfpt='terraform plan -target'
alias tfat='terraform apply -target'
alias tfdt='terraform destroy -target'