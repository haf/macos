#!/usr/bin/env bash
brew tap bufbuild/buf
brew tap argoproj/tap

declare -a packages=(
	"autoconf"
	"autojump"      # https://github.com/wting/autojump
	"automake"
	"buf"
	"bzip2"
	"cfssl"
	"colordiff"
	"curl"
	"direnv"
	"editorconfig"
	"findutils"
	"fzf"
	"gh"            # https://github.com/cli/cli
	"git-lfs"
	"grpcurl"       # https://github.com/fullstorydev/grpcurl
	#"hasura-cli"   # https://github.com/hasura/graphql-engine/issues/8398
	"helm"
	"jq"
	"kubectx"
	"kubeseal"
	"kustomize"
	"librdkafka"
	"logcli"
	"ngrep"
	"nmap"
	"nvm"
	"openjdk@17"    # https://whichjdk.com/
	"openssl"
	"postgresql"    # https://stackoverflow.com/a/24645416 https://www.psycopg.org/psycopg3/docs/basic/install.html#local-installation
	"protobuf"
	"protoc-gen-grpc-web"
	"pyenv"
	"rbenv"
	"readline"
	"ruby-build"    # for rbenv
	"skaffold"      # local k8s clusters
	"stern"
	"terraform"
	"tor"
	"tree"
	"watch"
	"watchman"      # https://facebook.github.io/watchman/docs/install.html
	"zlib"
	"zsh"
	"zsh-completions"
)

for i in "${packages[@]}"
do
   brew install "$i"
done

brew link --overwrite protobuf

HASURA_WORKING_VERSION=v2.4.0
curl -L "https://github.com/hasura/graphql-engine/releases/download/${HASURA_WORKING_VERSION}/cli-hasura-darwin-arm64" -o "$HOME/bin/hasura"
