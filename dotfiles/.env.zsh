export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export EDITOR=vim
export ZSH_COMPLETIONS="$HOME/.completions"
export GENCOMPL_FPATH=$ZSH_COMPLETIONS

# brew
export HOMEBREW_NO_ENV_HINTS=1
export HOMEBREW_NO_INSECURE_REDIRECT=1
export HOMEBREW_NO_ANALYTICS=1

# compilation of C/C++
export LIBRARY_PATH="$HOMEBREW_PREFIX/lib:/usr/lib"
export CPATH="$HOMEBREW_PREFIX/include:$(xcrun --show-sdk-path)/usr/include"

# langs
export GOPATH="${HOME}/go"
export GOROOT="$HOMEBREW_PREFIX/opt/go/libexec"
export NVM_DIR="$HOME/.nvm"
export VIRTUAL_ENV_DISABLE_PROMPT=1 # https://github.com/Powerlevel9k/powerlevel9k#virtualenv
export AUTOSWITCH_SILENT=1

path=(~/.pyenv/shims ~/.rbenv/shims ${GOPATH}/bin ${GOROOT}/bin $path)
