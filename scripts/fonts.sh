#!/usr/bin/env bash

brew tap homebrew/cask-fonts

# Inconsolata
brew install font-inconsolata

# Hack Nerd Font
brew install font-hack-nerd-font

# Fira Code
brew install font-fira-code

# Monoid
brew install font-monoid font-monoid-nerd-font

# https://github.com/powerline/fonts#powerline-fonts
mkdir -p powerline
pushd powerline
  pip install --user powerline-status
  pip install --user powerline-gitstatus
  git clone https://github.com/powerline/fonts.git --depth 1
  pushd fonts
    ./install.sh
  popd
  rm -rf fonts
popd
rm -rf powerline

# https://github.com/bramstein/homebrew-webfonttools#readme
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2
