#!/usr/bin/env zsh
# Docker aliases and shortcuts

# Basic Docker commands
alias d='docker'
alias dps='docker ps'
alias dpsa='docker ps -a'
alias di='docker images'
alias drm='docker rm'
alias drmi='docker rmi'
alias dprune='docker system prune -a'
alias dvprune='docker volume prune'
alias dnprune='docker network prune'

# Docker run shortcuts
alias drun='docker run --rm -it'
alias drund='docker run -d'
alias dexec='docker exec -it'
alias dlogs='docker logs'
alias dlogsf='docker logs -f'
alias dinspect='docker inspect'

# Docker Compose
alias dc='docker-compose'
alias dcu='docker-compose up'
alias dcud='docker-compose up -d'
alias dcd='docker-compose down'
alias dcb='docker-compose build'
alias dcl='docker-compose logs'
alias dclf='docker-compose logs -f'
alias dcp='docker-compose ps'
alias dce='docker-compose exec'
alias dcr='docker-compose restart'
alias dcs='docker-compose stop'
alias dcstart='docker-compose start'

# Docker utility functions
alias docker-clean='docker system prune -a --volumes'
alias docker-stop-all='docker stop $(docker ps -q)'
alias docker-rm-all='docker rm $(docker ps -aq)'
alias docker-rmi-all='docker rmi $(docker images -q)'