#!/bin/bash

if [ -f ~/.vimrc ] ; then
  echo "Moving current vimrc to vimrc.old"
  mv ~/.vimcr ~/.vimrc.old
fi

ln -s ~/.vim/vimrc ~/.vimrc

vim +PluginInstall +qall

echo "Setting up font for powerline"

test -d ~/.fonts || mkdir ~/.fonts
cp ~/.vim/bundle/powerline/font/10-powerline-symbols.conf ~/.fonts
fc-cache -vf ~/.font

test -d ~/.vimundo || mkdir ~/.vimundo

