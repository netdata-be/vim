#!/bin/bash

if [ -f ~/.vimrc ] ; then
	echo "Removin already existant .vimrc"
	rm ~/.vimcr
fi

ln -s ~/.vim/vimrc ~/.vimrc

cd ~/.vim
git submodule init
git submodule update
cd ~/.vim/bundle/vim-command-t/ruby/command-t/
( ruby extconf.rb && make clean && make) || echo "Ruby compilation failed. Ruby not installed, maybe?"
echo "Installed and configured .vim, have fun."
cd ~/.vim
for s in `git submodule  --quiet foreach 'echo $name'` ; do git config submodule.$s.ignore untracked ; done
