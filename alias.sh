# docker alias
alias docker-ps='docker ps -a'
alias docker-clean='docker rm $(docker ps -aq)'
alias docker-force-clean='docker rm -f $(docker ps -aq)'
alias docker-compose-run="docker-compose run --service-ports --rm --all"
alias docker-compose-command="docker-compose run --rm --no-deps"

# git
alias branch-ls="git for-each-ref --sort=-committerdate refs/heads/ --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) -
%(color:red)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:green)%(committerdate:relative)%(color:reset))'"
