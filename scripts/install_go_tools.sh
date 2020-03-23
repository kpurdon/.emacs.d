#!/usr/bin/env bash

echo "installing go deps ..."

if go version | grep -q "command not found"; then
    echo "go must be intalled ... exiting"
    exit 1
fi

if brew --version | grep -q "command not found"; then
    echo "homebrew must be intalled ... exiting"
    exit 1
fi

# install golangci-lint
if golangci-lint --version | grep -q "command not found"; then
    echo "installing golangci-lint ..."
    brew install golangci/tap/golangci-lint
else
    # upgrade golangci-lint
    if brew outdated | grep -q "golangci-lint"; then
        echo "upgrading golangci-lint ..."
        brew upgrade golangci/tap/golangci-lint
    fi
fi

# install golint
if golint | grep -q "command not found"; then
    echo "installing golint ..."
    go get -u golang.org/x/lint/golint
fi

# TODO: do we still need this w/ gopls
# go get -u github.com/rogpeppe/godef
# go get -u golang.org/x/tools/cmd/guru
# go get -u github.com/stamblerre/gocode

echo "installing go deps ... done"
