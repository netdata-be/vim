"
" ~/.vimrc 
"
" Created by wdh

"""" Load all plugins using pathogen """""""""""""""""""
call pathogen#infect()
call pathogen#helptags()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if !has("gui_running")
	"colorscheme molokai
	colorscheme blackboard
	highlight Pmenu ctermbg=238 gui=bold
elseif has("gui_running")
	colorscheme blackboard
	highlight Pmenu guibg=brown gui=bold
	set guioptions-=T
	set mousemodel=popup
end

set history=700     " Sets how many lines of history VIM has to remember

set hidden
set autoread        " Set to auto read when a file is changed from the outside

syntax on           " Enable syntax highlighting
set hlsearch        " Highlight searches (use <C-L> to temporarily turn off highlighting; see the
                    " mapping of <C-L> below)
set ignorecase      " Use case insensitive search, except when using capital letters
set smartcase
set autoindent      " When opening a new line and no filetype-specific indenting is enabled, keep
                    " the same indent as the line you're currently on. Useful for READMEs, etc.
set ruler           " Display the cursor position on the last line of the screen or in the status
                    " line of a window
set nostartofline   " Stop certain movements from always going to the first character of a line.
                    " While this behaviour deviates from that of Vi, it does what most users
                    " coming from other editors would expect.
set laststatus=2    " Always display the status line, even if only one window is displayed
set visualbell      " Use visual bell instead of beeping when doing something wrong
set t_vb=           " And reset the terminal code for the visual bell.  If visualbell is set, and
                    " this line is also included, vim will neither flash nor beep.  If visualbell
                    " is unset, this does nothing.
set number          " Display line numbers on the left
set numberwidth=5   " The amount of digits reserved for the line numbers 99999 
set pastetoggle=<F12> " Use <F11> to toggle between 'paste' and 'nopaste'
set shiftwidth=2    " An indent tab will be x spaces wide
set tabstop=2       " A normal tab will be x spaces wide
set incsearch       " While typing a search command, show immediately where the
                    " so far typed pattern matches.
set softtabstop=2
set expandtab
set scrolloff=5     " Keep x lines below and above the cursor

set mouse=a
filetype plugin indent on   " Use indentation as specified in the ft plugin
set wildmenu
set wildmode=list:longest,full
set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,*.jpg,*.gif,*.png
set background=dark         " when syntax is on the colors will be best visible on a dark background
set showcmd                 " show the command being typed
set sidescrolloff=5     " Keep 5 lines at the size
set showmatch			      " show matching brackets

" The swap file will be created in the first directory where this is possible.
set dir=~/.vimswap//,/var/tmp//,/tmp//,.

"""""" Mapleader shortcuts """""""""""""""""""""""""""""
let mapleader = ","

map <Leader>r :source ~/.vimrc<cr>
map <Leader>e :edit ~/.vimrc<cr>
nnoremap <silent> <Leader>o :CommandT ~/puppet<CR>
map <leader>q :qa!<CR>
map <leader>s :Gstatus<cr>
map <leader>p :Git push<cr>
map <leader>c :bd!<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""" F function buttons """""""""""""""""""""""""""""""
:map <F7> :NERDTreeToggle<CR>
map <F8> :TagbarToggle<CR>
:nnoremap <F5> :buffers<CR>:buffer<Space>
noremap <F9> :call ToggleMouse() <CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""" Bubble Single Lines """""""""""""""""""""""""""""""
nmap <C-Up> [e
nmap <C-Down> ]e
"""" Bubble Multiple Lines
vmap <C-Up> [egv
vmap <C-Down> ]egv
""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""" Bufftabs optiosn """""""""""""""""""""""""""""""""""
noremap <C-left> :bprev!<CR>
noremap <C-right> :bnext!<CR>
let g:buftabs_only_basename=1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""" Some Handy Shortcuts """""""""""""""""""""""""""""""
cmap w!! w !sudo tee % >/dev/null
nnoremap ; :
nmap <silent> ,/ :nohlsearch<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""" Reload .vimrc  """"""""""""""""""""""""""""""""""""
au! BufWritePost .vimrc source %
au! BufWritePost vimrc source %
""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""" Mark trailing whitespaces as error """""""""""""""""
hi link localWhitespaceError Error
autocmd Syntax * syn match localWhitespaceError excludenl /\s\+\%#\@<!$\| \+\ze\t/ display containedin=ALL
""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""" Window Nav """"""""""""""""""""""""""""""""""""""""
map  <C-h> <C-w>h
map  <C-j> <C-w>j
map  <C-k> <C-w>k
map  <C-l> <C-w>l
""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""" Gist settings  """"""""""""""""""""""""""""""""""""
let gist_show_privates = 1
let gist_post_private = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""" Puppet Integration """""""""""""""""""""""""""""""
command! -nargs=+ Grep execute "noautocmd silent lvimgrep /<args>/gj ~/puppet/**/*.pp" | lopen 10
"set shellcmdflag=-ic
set kp=pi
set iskeyword=-,:,@,48-57,_,192-255
set tags=tags;~/
""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NerdTree Options
let NERDTreeQuitOnOpen = 1

" Set backspace config
set backspace=indent,eol,start
set whichwrap+=<,>,h,l

"""" Status line """""""""""""""""""""""""""""""""""""""
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ path:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c\ \ \ %{fugitive#statusline()}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""" Some Functions """"""""""""""""""""""""""""""""""""
function! CurDir()
    let curdir = substitute(getcwd(), '/home/wdh', "~/", "g")
    return curdir
endfunction

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    else
        return ''
    endif
endfunction

function! ToggleMouse()
	if &mouse == 'a'
		set mouse=
		set nonumber
		echo "Mouse usage disabled"
	else
		set mouse=a
		set number
		echo "Mouse usage enabled"
	endif
endfunction
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
