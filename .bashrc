PS1="\[\033[38;5;10m\]\w\[\e[0m\] @ \[\033[38;5;11m\]\h\[\e[0m\]\n\\$ "

# Aliases

alias docker-node="docker run --rm -it --user=$(id -u) --mount type=tmpfs,destination=/.npm --mount type=tmpfs,destination=/.config -v `pwd`:/app -w /app -e \"NPM_CONFIG_PREFIX=/app/global_node/\" node:8" # docker-node npm i && npm run build
alias hgrep="history | grep"
alias lsgrep="ls -la | grep"
alias where="echo \"it's which, stupid\" && which"

# nvm globals

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# autocompletion scripts

source ~/completion/git.bash
source ~/completion/volt.bash
