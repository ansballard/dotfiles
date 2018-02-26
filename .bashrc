PS1="\[\033[38;5;10m\]\w\[\e[0m\] @ \[\033[38;5;11m\]\h\[\e[0m\]\n\\$ "

# Aliases

alias docker-node="docker run --rm -it --user=$(id -u) --mount type=tmpfs,destination=/.npm --mount type=tmpfs,destination=/.config -v `pwd`:/app -w /app -e \"NPM_CONFIG_PREFIX=/app/global_node/\"  node:8" # docker-node npm i && npm run build
alias hgrep="history | grep"
alias lsgrep="ls -la | grep"

# Git

source ~/git-completion.bash
