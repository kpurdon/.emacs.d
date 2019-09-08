#!/usr/bin/env bash

# installs all tooling required for golang + emacs

go get -u golang.org/x/tools/cmd/goimports
go get -u github.com/rogpeppe/godef
go get -u golang.org/x/lint/golint
go get -u golang.org/x/tools/cmd/guru
go get -u github.com/stamblerre/gocode

brew install golangci/tap/golangci-lint
brew upgrade golangci/tap/golangci-lint
