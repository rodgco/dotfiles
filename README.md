https://antelo.medium.com/how-to-manage-your-dotfiles-with-git-f7aeed8adf8b

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

sh -c "$(curl -fsSL https://raw.githubusercontent.com/rodgco/dotfiles/main/setup.d/00-dotfiles.sh)"
