#!/usr/bin/env bash
brew tap bufbuild/buf
brew tap argoproj/tap

declare -a packages=(
	"asdf"
	"autoconf"
	"autojump"      # https://github.com/wting/autojump
	"automake"
	"azure-cli"
	"buf"
	"bzip2"
	"cfssl"
	"colordiff"
	"curl"
	"derailed/k9s/k9s"
	"direnv"
	"editorconfig"
	"findutils"
	"fzf"
	"gh"            # https://github.com/cli/cli
	"git-lfs"       # https://git-lfs.com
	"go-task"       # https://taskfile.dev
	"grpcurl"       # https://github.com/fullstorydev/grpcurl
	"hasura-cli"    # https://github.com/hasura/graphql-engine/issues/8398
	"helm"
	"jq"
	"kind"          # https://kind.sigs.k8s.io
	"kubectx"
	"kubeseal"
	"kustomize"
	"librdkafka"
	"logcli"
	"ngrep"
	"nmap"
	"nvm"
	"openjdk@17"    # https://whichjdk.com
	"openssl"
	"postgresql"    # https://stackoverflow.com/a/24645416 https://www.psycopg.org/psycopg3/docs/basic/install.html#local-installation
	"protobuf"
	"protoc-gen-grpc-web"
	"pyenv"
	"rbenv"
	"readline"
	"redis"
	"ruby-build"    # for rbenv
	"skaffold"      # local k8s clusters
	"stern"
	"terraform"     # https://www.terraform.io
	"tor"
	"tree"
	"watch"
	"watchman"      # https://facebook.github.io/watchman/docs/install.html
	"zlib"
	"zsh"
	"zsh-completions"
 	"kcat"
)

for i in "${packages[@]}"
do
   brew install "$i"
done

brew link --overwrite protobuf

HASURA_WORKING_VERSION=v2.4.0
curl -L "https://github.com/hasura/graphql-engine/releases/download/${HASURA_WORKING_VERSION}/cli-hasura-darwin-arm64" -o "$HOME/bin/hasura"
