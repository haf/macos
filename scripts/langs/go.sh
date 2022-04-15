#!/usr/bin/env bash

GOPATH=${GOPATH:-"${HOME}/go"}

brew install go

test -d "${GOPATH}" || mkdir -p "${GOPATH}/{bin,src,pkg}"
test -d "${GOPATH}/src/github.com" || mkdir -p "${GOPATH}/src/github.com"


# Some key imports for the IDEs
go get golang.org/x/tools/cmd/godoc
go get golang.org/x/tools/cmd/vet
go get github.com/golang/lint/golint
# go get github.com/derekparker/delve/cmd/dlv
# go get github.com/golang/dep/cmd/dep
# go get golang.org/x/tools/cmd/goimports
# go get golang.org/x/tools/cmd/gorename
# go get github.com/sqs/goreturns
# go get github.com/mdempsky/gocode
# go get github.com/alecthomas/gometalinter
# go get github.com/zmb3/gogetdoc
# go get github.com/zmb3/goaddimport
# go get github.com/rogpeppe/godef
# go get golang.org/x/tools/cmd/guru
# go get github.com/fatih/gomodifytags
# go get github.com/tpng/gopkgs
# go get github.com/ramya-rao-a/go-outline

# Utilities
# go get github.com/urfave/cli
# go get github.com/peter-jozsa/jsonpath
# go get github.com/hashicorp/go-multierror

# Install Protobuf and gRPC
brew install protobuf
go get google.golang.org/grpc

# go-kit
# go get github.com/go-kit/kit/...
# go get github.com/kujtimiihoxha/kit/...

# Install the GCP SDK
go get cloud.google.com/go/...
