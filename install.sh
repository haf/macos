#!/bin/bash

`curl -O https://raw.githubusercontent.com/lapponiandevil/osx/master/Rakefile && rake prepare`

/bin/zsh <<-'EOF'
  rake install
EOF
