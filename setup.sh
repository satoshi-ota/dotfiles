#!/bin/zsh

DOT_FILES=(.vimrc .tmux.conf .tmux-powerlinerc .zshrc)

for file in ${DOT_FILES[@]}
do
	ln -s $HOME/dotfiles/$file $HOME/$file
done
