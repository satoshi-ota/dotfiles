#!/bin/bash

DOT_FILES=(.vimrc .tmux.conf .tmux-powerlinerc .zshrc)

for file in "${DOT_FILES[@]}"; do
    ln -s "$HOME"/dotfiles/"$file" "$HOME"/"$file"
done

cd "$HOME"/dotfiles/vim/conf || exit
mkdir -p "$HOME"/.vim/conf

for file in *; do
    ln -s "$HOME"/dotfiles/vim/conf/"$file" "$HOME"/.vim/conf/"$file"
done

cd "$HOME"/dotfiles/vim/dein || exit
mkdir -p "$HOME"/.vim/dein

for file in *; do
    ln -s "$HOME"/dotfiles/vim/dein/"$file" "$HOME"/.vim/dein/"$file"
done

cd "$HOME"/dotfiles/vim/after/syntax || exit
mkdir -p "$HOME"/.vim/after/syntax

for file in *; do
    ln -s "$HOME"/dotfiles/vim/after/syntax/"$file" "$HOME"/.vim/after/syntax/"$file"
done

cd "$HOME"/dotfiles/zsh/custom || exit

for file in *; do
    ln -s "$HOME"/dotfiles/zsh/custom/"$file" "$HOME"/.oh-my-zsh/custom/"$file"
done
