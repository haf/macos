# i18n/l10n
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export EDITOR=vim
export ZSH_COMPLETIONS="$HOME/.completions"
export HISTIGNORE="[ \t]*"
export GENCOMPL_FPATH=$ZSH_COMPLETIONS

# Flutter
export ANDROID_HOME="$HOME/Library/Android/sdk"
export FLUTTER_ROOT="$HOMEBREW_PREFIX/Caskroom/flutter/3.19.0/flutter"

# brew
export HOMEBREW_NO_ENV_HINTS=1
export HOMEBREW_NO_INSECURE_REDIRECT=1
export HOMEBREW_NO_ANALYTICS=1

# compilation of C/C++
export CFLAGS="-I/Library/Developer/CommandLineTools/usr/include/c++/v1 -I$HOMEBREW_PREFIX/opt/openssl/include"
#export CPATH="$HOMEBREW_PREFIX/include:$(xcrun --show-sdk-path)/usr/include"
#export CPATH="$HOMEBREW_PREFIX/include"
export CPPFLAGS="-I$HOMEBREW_PREFIX/opt/openssl@3/include -I$HOMEBREW_PREFIX/opt/llvm/include -I$HOMEBREW_PREFIX/opt/mysql-client@5.7/include"
export LDFLAGS="-L$HOMEBREW_PREFIX/opt/openssl@3/lib -L$HOMEBREW_PREFIX/opt/llvm/lib -L$HOMEBREW_PREFIX/opt/mysql-client@5.7/lib"
export LIBRARY_PATH="$HOMEBREW_PREFIX/lib:/usr/lib"

# langs
export GOPATH="${HOME}/go"
export GOROOT="$HOMEBREW_PREFIX/opt/go/libexec"
export NVM_DIR="$HOME/.nvm"
# this dir is only used for binary files (it seems!)
export PNPM_HOME="$HOME/bin"
export VIRTUAL_ENV_DISABLE_PROMPT=1 # https://github.com/Powerlevel9k/powerlevel9k#virtualenv
export AUTOSWITCH_SILENT=1

# grpc build
export GRPC_PYTHON_BUILD_SYSTEM_OPENSSL=1 # https://github.com/grpc/grpc/issues/30723#issuecomment-1301796894
export GRPC_PYTHON_BUILD_SYSTEM_ZLIB=1

# GPG / gcloud
export GPG_TTY=$TTY
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

# Storybook
export STORYBOOK_DISABLE_TELEMETRY=1

path=(~/.pub-cache/bin $ANDROID_HOME/tools $ANDROID_HOME/tools/bin ~/.jenv/shims ~/.jenv/bin ~/.pyenv/shims ~/.rbenv/shims ${GOPATH}/bin ~/bin ${HOMEBREW_PREFIX}/opt/llvm/bin ${HOMEBREW_PREFIX}/opt/sphinx-doc/bin ${HOMEBREW_PREFIX}/opt/mysql-client@5.7/bin $HOMEBREW_PREFIX/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin ${GOROOT}/bin ${HOMEBREW_PREFIX}/opt/openssl@3/bin $path)
