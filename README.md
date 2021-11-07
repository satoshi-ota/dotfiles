# dotfiles

```sh
git clone https://github.com/erikw/tmux-powerline.git
git clone https://github.com/powerline/fonts.git
cd fonts
./install.sh
pip install powerline-status

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cd  vim-colors-solarized
mkdir -p ~/.vim/colors/
cp colors/solarized.vim ~/.vim/colors/
```
