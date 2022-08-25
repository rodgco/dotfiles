#!/bin/sh
chsh -s /bin/zsh
mv ~/.oh-my-zsh ~/.oh-my-zsh-dotfiles
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cp -r ~/.oh-my-zsh-dotfiles/* ~/.oh-my-zsh
rm -rf ~/.oh-my-zsh-dotfiles
rm ~/.zshrc
mv ~/.zshrc.pre-oh-my-zsh ~/.zshrc

