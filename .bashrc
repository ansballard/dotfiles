PS1="\[\033[38;5;10m\]\w\[\e[0m\] @ \[\033[38;5;11m\]\h\[\e[0m\]\n\\$ "

# Aliases

alias hgrep="history | grep"
alias lsgrep="ls -la | grep"
alias where="echo \"it's which, stupid\" && which"

# nvm globals

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# autocompletion scripts

test -d /workspaces/.codespaces/.persistedshare/dotfiles &&
  source /workspaces/.codespaces/.persistedshare/dotfiles/.completion/git.bash
test -d ~/.completion &&
  source ~/.completion/git.bash

