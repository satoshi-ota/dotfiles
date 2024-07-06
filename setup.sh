#!/bin/bash

DOT_FILES=(.vimrc .tmux.conf .tmux-powerlinerc .zshrc)

for file in "${DOT_FILES[@]}"; do
    ln -s "$HOME"/dotfiles/"$file" "$HOME"/"$file"
done

cd "$HOME"/dotfiles/vim/conf || exit
mkdir "$HOME"/.vim/conf

for file in *; do
    ln -s "$HOME"/dotfiles/vim/conf/"$file" "$HOME"/.vim/conf/"$file"
done

cd "$HOME"/dotfiles/vim/dein || exit
mkdir "$HOME"/.vim/dein

for file in *; do
    ln -s "$HOME"/dotfiles/vim/dein/"$file" "$HOME"/.vim/dein/"$file"
done
