export ZSH="$HOME/.oh-my-zsh"
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
# DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="yyyy-mm-dd"
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git) # plugins=(git ssh-agent)
[ -f ~/.ssh/id_rsa ] && ssh-add -K ~/.ssh/id_rsa
[ -f ~/.ssh/id_ed25519 ] && ssh-add -K ~/.ssh/id_ed25519
[ -f ~/.ssh/id_ecdsa ] && ssh-add -K ~/.ssh/id_ecdsa

# See ~/.oh-my-zsh/custom/themes/bullet-train.zsh-theme
BULLETTRAIN_KCTX_KCONFIG="$HOME/.kube/config"
BULLETTRAIN_PROMPT_ORDER=(
    time
    status
    custom
    dir
    nvm
    screen
    go
    gcloud
    kctx
    git
    cmd_exec_time
)
# https://github.com/guns/xterm-color-table.vim
BULLETTRAIN_NVM_BG="22"
BULLETTRAIN_NVM_FG="7"
BULLETTRAIN_KCTX_BG="19"
BULLETTRAIN_KCTX_FG="7"
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

function switch() {
  if [[ -z $1 ]]; then
    echo "Pass the name of the gcloud / kubectl context to switch to."
    return
  fi

  if cat $HOME/.kube/config | grep "  name: $1" >/dev/null; then
    kubectl config use-context $1
    local ns=$(kubectl config view --minify --output 'jsonpath={..namespace}')
    echo -n "Changed kubectl context to '$1'."
    if [ ! -z $ns ]; then
      echo -n " In namespace '${ns}'."
    fi
    echo ""
  fi

  file="$HOME/.config/gcloud/configurations/config_$1"
  if [ -f $file ]; then
    gcloud config configurations activate $1
    echo "Changed gcloud configuration to '$1'"
  fi
}
