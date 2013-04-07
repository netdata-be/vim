#!/bin/bash

if [ -f ~/.vimrc ] ; then
  echo "Moving current vimrc to vimrc.old"
  mv ~/.vimcr ~/.vimrc.old
fi

ln -s ~/.vim/vimrc ~/.vimrc

cd ~/.vim
git submodule init
git submodule update
cd ~/.vim
for s in `git submodule  --quiet foreach 'echo $name'` ; do git config submodule.$s.ignore untracked ; done

echo "Setting up font for powerline"

test -d ~/.fonts || mkdir ~/.fonts
cp ~/.vim/bundle/powerline/font/10-powerline-symbols.conf ~/.fonts
fc-cache -vf ~/.font

