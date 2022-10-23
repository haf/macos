#!/usr/bin/env bash
set -eo pipefail

# Install Homebrew if not installed - brew.sh
if ! hash brew 2>/dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Enforce no analytics from core utilities
touch "$HOME/.homebrew_analytics_user_uuid" && chmod 000 "$HOME/.homebrew_analytics_user_uuid"

# Enable the 'brew' command
[ command -v brew &> /dev/null ] || eval "$(/opt/homebrew/bin/brew shellenv)"

# Turn off Google Analytics
brew analytics off

# Install git (we do this because of a bug that appears if you already had homebrew and git)
brew reinstall git || true
brew install git

# Make sure we are using the latest Homebrew
brew update

# Upgrade existing packages
brew upgrade

# Remove outdated packages
brew cleanup

# Run some diagnostics
brew doctor
