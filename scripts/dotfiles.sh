#!/usr/bin/env bash

# Backup the dotfiles that already exist
function backupDotfiles() {
  if ! test -d ~/.bootstrap-macos-dotfiles-backup; then
    mkdir -p ~/.bootstrap-macos-dotfiles-backup
  else
    echo -e "\033[1mBOOTSTRAP_MACOS:\033[0m A backup of your dotfiles (~/.*)"
    echo    "already exists in your home directory! We cannot run this script"
    echo    "safely as it will overwrite an existing backup or do something you"
    echo    "may not like (e.g. ~/.bootstrap-macos-dotfiles-backup exists will"
    echo    "overwritten and it contains some of your existing dotfiles you"
    echo    "may want to retain). Exiting to protect these files:"
    echo    "./scripts/bootstrap.sh"
    echo
    kill -SIGUSR1 $(ps $$ -o ppid=);exit
  fi

  # Backup only those dotfiles we will replace
  for filename in `ls -A $BOOTSTRAP_MACOS_DIR/dotfiles/`; do
    if [[ -f ~/$filename ]]; then
      /usr/bin/rsync -r ~/$filename ~/.bootstrap-macos-dotfiles-backup/
    fi
  done
}

# Copy over the dotfiles to home
function copyDotfiles() {
  /usr/bin/rsync -r $BOOTSTRAP_MACOS_DIR/dotfiles/ ~/
}

# Create directories for binaries and CLI completions
mkdir -p $HOME/{.completions,bin}

# Backup dotfiles
echo
echo -e "\033[1mBOOTSTRAP_MACOS:\033[0m Backing up ~/.* files to "
echo    "~/.bootstrap-macos-dotfiles-backup/: ./setup.sh"
echo
backupDotfiles || exit $?

# Copy dotfiles
echo
echo -e "\033[1mBOOTSTRAP_MACOS:\033[0m Copying dotfiles/.* to ~/: ./setup.sh"
echo
copyDotfiles

# Configure git for you
echo -n "What is your name (for git commits)? "
read GIT_NAME
git config --global user.name $GIT_NAME

echo -n "What is your e-mail (for git commits)? "
read GIT_EMAIL
git config --global user.email $GIT_EMAIL

echo -n "What is your github username? "
read GITHUB_USERNAME
git config --global github.user $GITHUB_USERNAME
