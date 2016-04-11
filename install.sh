#!/bin/bash

`curl -O https://raw.githubusercontent.com/haf/osx/master/Rakefile && rake prepare`

/bin/zsh <<-'EOF'
  rake install
EOF
