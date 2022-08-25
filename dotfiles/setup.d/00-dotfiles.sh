#!/bin/sh
alias dotfiles='/usr/bin/git --git-dir=$HOME/dotfiles/.dotfiles/ --work-tree=$HOME'
git clone --bare git:github.com:rodgco/dotfiles.git $HOME/dotfiles/.dotfiles
dotfiles remote set-url origin git@github.com:rodgco/dotfiles.git
dotfiles config --local status.showUntrackedFiles no
dotfiles checkout
