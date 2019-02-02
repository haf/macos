export ZSH="/Users/h/.oh-my-zsh"
export TERM="xterm-256color"
ZSH_THEME="bullet-train"
# CASE_SENSITIVE="true"
# HYPHEN_INSENSITIVE="true"
# DISABLE_AUTO_UPDATE="true"
# export UPDATE_ZSH_DAYS=13
# DISABLE_LS_COLORS="true"
# DISABLE_AUTO_TITLE="true"
# ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="false"

# Uncomment the following line if you want to disable marking untracked files under VCS as dirty. This
# makes repository status check for large repositories much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="yyyy-mm-dd"

# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git) # plugins=(git ssh-agent)

source $ZSH/oh-my-zsh.sh

alias l="ls -lah"
alias k="kubectl"
alias g="git"

HOMEBREW_PREFIX="/usr/local"
export HOMEBREW_NO_ANALYTICS=1
export MANPATH="/usr/local/man:$MANPATH"
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$HOME/bin:$PATH"
export LD_LIBRARY_PATH="$HOMEBREW_PREFIX/lib:/usr/lib:/lib"
[ -f "$HOME/.fzf.zsh" ] && source "$HOME/.fzf.zsh"
[ command -v rbenv &> /dev/null ] && eval "$(rbenv init -)"
[ command -v pyenv &> /dev/null ] && eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && source "/usr/local/opt/nvm/nvm.sh"
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && source "/usr/local/opt/nvm/etc/bash_completion"
[ -s "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc" ] && source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
[ -s "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc" ] && source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
ulimit -S -n 2048
