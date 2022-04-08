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

