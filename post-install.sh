#!/usr/bin/env bash
. $(brew --prefix nvm)/nvm.sh
set -e
set -x
echo ${PATH}
brew install libuv --universal
nvm install 5.10.1
npm install -g generator-fsharp npm-check-updates
