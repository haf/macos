#!/usr/bin/env bash

# This is needed for some of the shells underlying scripting
brew install pyenv-virtualenv

export PYTHON_LATEST=$(pyenv install -l 2>/dev/null | awk '$1 ~ /^[0-9.]*$/ {latest=$1} END {print latest}')

# export CFLAGS="-I$(brew --prefix openssl)/include -I$(xcrun --show-sdk-path)/usr/include" LDFLAGS="-L$(brew --prefix openssl)/lib"
export CFLAGS="-I$(brew --prefix readline)/include -I$(brew --prefix openssl)/include -I$(brew --prefix bzip2)/include"
export LDFLAGS="-L$(brew --prefix readline)/lib -L$(brew --prefix openssl)/lib -L$(brew --prefix zlib)/lib -L$(brew --prefix bzip2)/lib"
export CPPFLAGS="-I$(brew --prefix zlib)/include"
if [ -d "$(xcrun --show-sdk-path)/usr/include)" ]; then
  export CFLAGS="$CFLAGS -I$(xcrun --show-sdk-path)/usr/include"
fi

# Install Python versions
pyenv install --skip-existing $PYTHON_LATEST
pyenv global $PYTHON_LATEST
eval "$(pyenv init -)"
pyenv rehash

# Install pip
pip install --upgrade pip setuptools wheel

# Install virtualenv
# https://github.com/python-poetry/poetry/issues/5445#issuecomment-1100386712
pip install virtualenv poetry==1.1.12

# .completions/ created by ../zsh.sh
# https://python-poetry.org/docs/
poetry completions zsh > $HOME/.completions/_poetry