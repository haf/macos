export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export EDITOR=vim

# brew
export HOMEBREW_NO_ENV_HINTS=1
export HOMEBREW_NO_INSECURE_REDIRECT=1
export HOMEBREW_NO_ANALYTICS=1

# langs
export GOPATH="${HOME}/go"
export GOROOT="$HOMEBREW_PREFIX/opt/go/libexec"
export NVM_DIR="$HOME/.nvm"

path=(~/.pyenv/shims ${GOPATH}/bin ${GOROOT}/bin $path)