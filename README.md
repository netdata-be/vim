Installation:

    git clone git@github.com:netdata/vim.git ~/.vim

Create symlinks:

    ln -s ~/.vim/vimrc ~/.vimrc

Switch to the `~/.vim` directory, and fetch submodules:

    cd ~/.vim
    git submodule init
    git submodule update

Now build the vim-command-t switch to dir `~/.vim/bundle/vim-command-t/ruby/`

	cd ~/.vim/bundle/vim-command-t/ruby/command-t/
	ruby extconf.rb
	make

In order for gists to work do the following steps:

    git config --global github.user netdata

Now use the following README to continue configuring gist: https://github.com/mattn/gist-vim

run the following command to ignore untracked changes:

    for s in `git submodule  --quiet foreach 'echo $name'` ; do git config submodule.$s.ignore untracked ; done

To have support for ctags in puppet create the following config : ~/.ctags and add this:

    $ less  ~/.ctags
    --langdef=puppet
    --langmap=puppet:.pp
    --regex-puppet=/^class[ \t]*([:a-zA-Z0-9_\-]+)[ \t]*/\1/c,class/
    --regex-puppet=/^site[ \t]*([a-zA-Z0-9_\-]+)[ \t]*/\1/s,site/
    --regex-puppet=/^node[ \t]*([a-zA-Z0-9_\-]+)[ \t]*/\1/n,node/
    --regex-puppet=/^node[ \t]*['"]([a-zA-Z0-9_\-]+)['"][ \t]*\{/\1/n,node/
    --regex-puppet=/^define[ \t]*([:a-zA-Z0-9_\-]+)[ \t]*/\1/d,definition/

Next run the following command inside the puppet dir:

    ctags -R

References:

* [How to Boost vim](http://nvie.com/posts/how-i-boosted-my-vim/)
