alias l="ls"
alias ..="cd .."
alias cdwl="cd ~/Documents/WhiteLab"
alias cdfh="cd ~/Documents/FutureHouse"
alias cdp="cd ~/Documents/MaykCaldas"

alias gs="git status"
alias gco="git checkout "
alias gpl="git pull origin"
alias gps="git push origin"

alias glogin="gcloud auth application-default login"

alias pc="uv run pre-commit run $1 --all-files"
alias test="uv run pytest -n auto"

autoload -Uz compinit && compinit

. "$HOME/.local/bin/env"
