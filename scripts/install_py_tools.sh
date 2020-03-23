#!/usr/bin/env bash

echo "installing py deps ..."

if python --version | grep -q "command not found"; then
    echo "py must be intalled ... exiting"
    exit 1
fi

pip install elpy rope jedi isort flake8 flake8-isort autopep8

echo "installing py deps ... done"
