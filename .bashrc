PS1="\[\033[38;5;10m\]\w\[$(tput sgr0)\] @ \[\033[38;5;11m\]\h\[$(tput sgr0)\]\n\\$ "

# Aliases

alias docker-node "docker --rm -it -v `pwd`:/app -w /app node:8" # docker-node npm i && npm run build
