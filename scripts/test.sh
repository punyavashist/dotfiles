#!/bin/zsh
set -e

# link to ~ and cd to it
cd ..
cp -rf dotfiles ~/.dotfiles
cd ~/.dotfiles

# setup git credentials
git config --global user.name "dotfiles demo"
git config --global user.email "dotfiles@demo.com"

# load zshrc and check if antibody is working
# shellcheck disable=SC1090
source ~/.zshrc

test "$(antibody list | wc -l)" -gt 10 || {
	echo "expecting 10+ bundles loaded" >&2
	exit 1
}

test -s ~/.zcompdump || {
	echo "zcompdump file is empty" >&2
	exit 1
}