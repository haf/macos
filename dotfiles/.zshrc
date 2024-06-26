# Personal Zsh configuration file. It is strongly recommended to keep all
# shell customization and configuration in this file or in files sourced from it.
#
# Documentation: https://github.com/romkatv/zsh4humans/blob/v5/README.md.

# Periodic auto-update on Zsh startup: 'ask' or 'no'.
# You can manually run `z4h update` to update everything.
zstyle ':z4h:' auto-update      'no'
# Ask whether to auto-update this often; has no effect if auto-update is 'no'.
zstyle ':z4h:' auto-update-days '28'

# Keyboard type: 'mac' or 'pc'.
zstyle ':z4h:bindkey' keyboard  'mac'

# Don't start tmux.
zstyle ':z4h:' start-tmux       no

# Mark up shell's output with semantic information.
zstyle ':z4h:' term-shell-integration 'yes'

# Right-arrow key accepts one character ('partial-accept') from
# command autosuggestions or the whole thing ('accept')?
zstyle ':z4h:autosuggestions' forward-char 'accept'

# Recursively traverse directories when TAB-completing files.
zstyle ':z4h:fzf-complete' recurse-dirs 'yes'

# Enable ('yes') or disable ('no') automatic teleportation of z4h over
# SSH when connecting to these hosts.
#zstyle ':z4h:ssh:ssh.example.com'           enable 'yes'
# The default value if none of the overrides above match the hostname.
zstyle ':z4h:ssh:*'                   enable 'no'

# Send these files over to the remote host when connecting over SSH to the
# enabled hosts.
zstyle ':z4h:ssh:*' send-extra-files '~/.vimrc' '~/.env.zsh'

# Clone additional Git repositories from GitHub.
#
# This doesn't do anything apart from cloning the repository and keeping it
# up-to-date. Cloned files can be used after `z4h init`. This is just an
# example. If you don't plan to use Oh My Zsh, delete this line.
z4h install ohmyzsh/ohmyzsh || return
z4h install MichaelAquilina/zsh-autoswitch-virtualenv || return
z4h install RobSis/zsh-completion-generator || return

# https://github.com/romkatv/zsh4humans/blob/master/tips.md#completions
zstyle :plugin:zsh-completion-generator programs   colorls

# Install or update core components (fzf, zsh-autosuggestions, etc.) and
# initialize Zsh. After this point console I/O is unavailable until Zsh
# is fully initialized. Everything that requires user interaction or can
# perform network I/O must be done above. Everything else is best done below.
z4h init || return

#############################
# Extend PATH in ~/.env.zsh #
#############################

# Extend FPATH
fpath=(~/.completions $fpath)
# You sometimes have to run this manually:
autoload -U compinit
compinit -i

# Source additional local files if they exist.
z4h source ~/.env.zsh
z4h source ~/.env.secrets.zsh

# Open file descriptors
ulimit -S -n 2048

# autojump
[ -f $HOMEBREW_PREFIX/etc/profile.d/autojump.sh ] && . $HOMEBREW_PREFIX/etc/profile.d/autojump.sh

# asdf
source $HOMEBREW_PREFIX/opt/asdf/libexec/asdf.sh

# az (requires bash-completion compatibility)
source $HOMEBREW_PREFIX/etc/bash_completion.d/az

# pyenv
[ command -v pyenv &> /dev/null ] && eval "$(pyenv init -) &> /dev/null"

# rbenv
[ command -v rbenv &> /dev/null ] && eval "$(rbenv init -) &> /dev/null"

# jenv
eval "$(jenv init -) &> /dev/null"

# ghcup
z4h source "/Users/h/.ghcup/env" # ghcup-env

# process-poster (this eval needs bash-completion compatibility)
[ -f ~/bin/process-poster  ] && eval "$(register-python-argcomplete process-poster)"

# nvm
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && source "/opt/homebrew/opt/nvm/nvm.sh"
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && source "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

# Use additional Git repositories pulled in with `z4h install`.
z4h source ohmyzsh/ohmyzsh/lib/diagnostics.zsh       # source an individual file
z4h load   ohmyzsh/ohmyzsh/plugins/1password
z4h source MichaelAquilina/zsh-autoswitch-virtualenv/autoswitch_virtualenv.plugin.zsh
z4h source RobSis/zsh-completion-generator/zsh-completion-generator.plugin.zsh

# Define key bindings.
z4h bindkey undo Ctrl+/   Shift+Tab  # undo the last command line change
z4h bindkey redo Option+/            # redo the last undone command line change

z4h bindkey z4h-cd-back    Shift+Left   # cd into the previous directory
z4h bindkey z4h-cd-forward Shift+Right  # cd into the next directory
z4h bindkey z4h-cd-up      Shift+Up     # cd into the parent directory
z4h bindkey z4h-cd-down    Shift+Down   # cd into a child directory

# Autoload functions.
autoload -Uz zmv

# Define functions and completions.
function md() { [[ $# == 1 ]] && mkdir -p -- "$1" && cd -- "$1" }
compdef _directories md

# Define named directories: ~w <=> Windows home directory on WSL.
[[ -z $z4h_win_home ]] || hash -d w=$z4h_win_home

# Define aliases.
alias tree='tree -a -I .git'
alias g='git'
alias l='ls -lah --color'
alias ls='ls --color'
alias k='kubectl'
alias dc='docker compose'
alias tf='terraform'

# Add flags to existing aliases.
alias ls="${aliases[ls]:-ls} -A"

# Set shell options: http://zsh.sourceforge.net/Doc/Release/Options.html.
setopt glob_dots     # no special treatment for file names with a leading dot
setopt no_auto_menu  # require an extra TAB press to open the completion menu
export JAVA_HOME=$(/usr/libexec/java_home)
