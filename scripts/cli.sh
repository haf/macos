#!/usr/bin/env bash
brew tap bufbuild/buf
brew tap argoproj/tap

declare -a packages=(
	"autoconf"
	"autojump"       # https://github.com/wting/autojump
	"automake"
	"buf"
	"bzip2"
	"colordiff"
	"curl"
	"direnv"
	"editorconfig"
	"findutils"
	"fzf"
	"git-lfs"
	"grpcurl"
	"hasura-cli"
	"helm"
	"jq"
	"kubectx"
	"kubeseal"
	"kustomize"
	"ngrep"
	"nmap"
	"nvm"
	"openjdk@17"  # https://whichjdk.com/
	"openssl"
	"postgresql"  # https://stackoverflow.com/a/24645416 https://www.psycopg.org/psycopg3/docs/basic/install.html#local-installation
	"protobuf"
	"protoc-gen-grpc-web"
	"pyenv"
	"rbenv"
	"readline"
	"ruby-build"  # for rbenv
	"skaffold"    # local k8s clusters
	"stern"
	"tor"
	"tree"
	"watch"
	"watchman"    # https://facebook.github.io/watchman/docs/install.html
	"zlib"
	"zsh"
	"zsh-completions"
)

for i in "${packages[@]}"
do
   brew install "$i"
done

brew link --overwrite protobuf
