export RUBY_LATEST=$(rbenv install -l 2>/dev/null | awk '$1 ~ /^[0-9.]*$/ {latest=$1} END {print latest}')

export CFLAGS="-I$(brew --prefix readline)/include -I$(brew --prefix openssl)/include"
export LDFLAGS="-L$(brew --prefix readline)/lib -L$(brew --prefix openssl)/lib"
export CPPFLAGS="-I$(brew --prefix zlib)/include"
if [ -d "$(xcrun --show-sdk-path)/usr/include)" ]; then
  export CFLAGS="$CFLAGS -I$(xcrun --show-sdk-path)/usr/include"
fi

RUBY_CONFIGURE_OPTS=--with-readline-dir="$(brew --prefix readline)" rbenv install  $RUBY_LATEST
rbenv global $RUBY_LATEST
eval "$(rbenv init -)"

# Install bundler
gem install bundler

rbenv rehash

gem install colorls
gem install cocoapods