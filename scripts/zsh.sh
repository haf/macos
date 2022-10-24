#!/usr/bin/env bash

# Install Zsh
grep -q -F "$HOMEBREW_PREFIX/bin/zsh" /etc/shells || sudo sh -c 'echo "$HOMEBREW_PREFIX/bin/zsh" >> /etc/shells'

# Install zsh4humans
echo
echo -e "\033[1m\033[5mType \"exit\" and hit enter if zsh4humans is done installing.\033[0m"
echo
sh -c "$(curl -fsSL https://raw.githubusercontent.com/romkatv/zsh4humans/v5/install)"

# Install Autosuggestions
# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Install Syntax Highlighting
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Install colorls
gem install colorls
rbenv rehash
compaudit | xargs chmod g-w,o-w
compaudit | xargs chmod g-w,o-w $HOMEBREW_PREFIX/share/zsh
compaudit | xargs chmod g-w,o-w $HOMEBREW_PREFIX/share/zsh/site-functions

# Configure zsh theme
$HOMEBREW_PREFIX/bin/zsh -l -c 'omz theme use powerlevel10k/powerlevel10k'
cp config/.p10k.zsh ~

# Install zsh-bench to ensure we are always fast
git clone https://github.com/romkatv/zsh-bench "$HOME/dev/zsh-bench"

# Source again for good measure if we're in ZSH
if $ZSH_NAME; then
    source ~/.zshrc
fi

# Change Zsh to be the default shell
chsh -s $HOMEBREW_PREFIX/bin/zsh
