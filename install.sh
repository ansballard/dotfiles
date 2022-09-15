#!/bin/sh

# Codespaces

# symlink dotfiles directory
test -d /workspaces/.codespaces/.persistedshare/dotfiles &&
  ln -s /workspaces/.codespaces/.persistedshare/dotfiles ~/dotfiles

# .bashrc
test -f /workspaces/.codespaces/.persistedshare/dotfiles/.bashrc &&
  echo >> ~/.bashrc &&
  echo source /workspaces/.codespaces/.persistedshare/dotfiles/.bashrc >> ~/.bashrc

# .tmux.conf
test -f /workspaces/.codespaces/.persistedshare/dotfiles/.tmux.conf &&
  echo >> ~/.tmux.conf &&
  echo source /workspaces/.codespaces/.persistedshare/dotfiles/.tmux.conf >> ~/.tmux.conf

# .rgignore
if [ -d /workspaces/github ]; then
  git config --global core.excludesfile ~/.gitignore.global
  echo .rgignore > ~/.gitignore.global
  cp $(pwd)/.rgignore /workspaces/github/.rgignore
fi
