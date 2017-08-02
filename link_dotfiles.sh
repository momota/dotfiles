#!/bin/sh

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
ln -sf ~/dotfiles/.zshrc ~/.zshrc

# install neobundle.vim
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > install.sh
sh ./install.sh

ln -sf ~/dotfiles/.vimrc ~/.vimrc

ln -sf ~/dotfiles/.vimperatorrc ~/.vimperatorrc
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.gitignore ~/.gitignore

# for terminator
# ln -sf ~/dotfiles/terminator_config ~/.config/terminator/config
