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

References:

* [How to Boost vim](http://nvie.com/posts/how-i-boosted-my-vim/)
