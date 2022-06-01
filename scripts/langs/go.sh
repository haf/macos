#!/usr/bin/env bash

GOPATH=${GOPATH:-"${HOME}/go"}

brew install go

test -d "${GOPATH}" || mkdir -p "${GOPATH}/{bin,src,pkg}"
test -d "${GOPATH}/src/github.com" || mkdir -p "${GOPATH}/src/github.com"


# Some key imports for the IDEs
go install golang.org/x/tools/cmd/godoc@latest
go install golang.org/x/tools/cmd/vet@latest
go install github.com/golang/lint/golint@latest
# go install github.com/derekparker/delve/cmd/dlv
# go install github.com/golang/dep/cmd/dep
# go install golang.org/x/tools/cmd/goimports
# go install golang.org/x/tools/cmd/gorename
# go install github.com/sqs/goreturns
# go install github.com/mdempsky/gocode
# go install github.com/alecthomas/gometalinter
# go install github.com/zmb3/gogetdoc
# go install github.com/zmb3/goaddimport
# go install github.com/rogpeppe/godef
# go install golang.org/x/tools/cmd/guru
# go install github.com/fatih/gomodifytags
# go install github.com/tpng/gopkgs
# go install github.com/ramya-rao-a/go-outline

# Utilities
# go install github.com/urfave/cli
# go install github.com/peter-jozsa/jsonpath
# go install github.com/hashicorp/go-multierror

# Install Protobuf and gRPC
brew install protobuf
go install google.golang.org/grpc@latest

# go-kit
# go install github.com/go-kit/kit/...
# go install github.com/kujtimiihoxha/kit/...

# Install the GCP SDK
# go install cloud.google.com/go/...@latest
