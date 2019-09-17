#!/bin/bash

has_lua=$(lua -v)
[[ -z $has_lua ]] && echo "lua is not installed" && exit 1

has_luarocks=$(luarocks --version)
[[ -z $has_luarocks ]] && echo "luarocks is not installed" && exit 1

echo "creating a local directory on home"
mkdir -p ~/.local

echo "creating a bin directory in ~/.local"
mkdir -p ~/.local/bin

echo "Please add bin to \$PATH in ~/.bashrc ~/.zshrc or config.fish"

echo "PATH=\$PATH:~/.local/bin"
echo "set PATH ~/.local/bin \$PATH"

fileContents=$(cat lpm.lua)
prefix="#!/usr/bin/env lua\npackage.path=package.path .. \";$HOME/.local/lpm/?.lua\""

finalContent="$prefix\n$fileContents"
printf "$finalContent" > bin/lpm

chmod +x bin/lpm

cp -r ../lpm ~/.local/
cp ../lpm/bin/lpm ~/.local/bin

echo "done"
