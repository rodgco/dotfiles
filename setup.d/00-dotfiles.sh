#!/bin/sh
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles config --local status.showUntrackedFiles no
git clone --bare https://github.com/rodgco/dotfiles.git $HOME/.dotfiles
dotfiles checkout
