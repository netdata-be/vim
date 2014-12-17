"
"
" ~/.vimrc
"
" Created by wdh

""" Load Plugins using Vundle {{{
set runtimepath+=~/.vim/bundle/vundle
call vundle#rc()
Bundle 'gmarik/vundle'

Bundle 'dirkwallenstein/vim-autocomplpop'
Bundle 'vim-scripts/L9'
Bundle 'vim-scripts/AutoTag'
Bundle 'vim-scripts/buftabs'
Bundle 'lilydjwg/colorizer'
Bundle 'altercation/vim-colors-solarized'
Bundle 'kien/ctrlp.vim'
Bundle 'endel/ctrlp-filetype.vim'
Bundle 'vim-scripts/DetectIndent'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'Yggdroot/indentLine'
Bundle 'dirkwallenstein/vim-localcomplete'
Bundle 'Shougo/neocomplcache'
Bundle 'JazzCore/neocomplcache-ultisnips'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-pathogen'
Bundle 'Lokaltog/powerline'
Bundle 'SirVer/ultisnips'
Bundle 'vim-scripts/HTML-AutoCloseTag'
Bundle 'netdata/vim-bind'
Bundle 'nelstrom/vim-blackboard'
Bundle 'tpope/vim-fugitive'
Bundle 'tmatilai/gitolite'
Bundle 'netdata/vim-puppet'
Bundle 'airblade/vim-rooter'
Bundle 'tpope/vim-surround'
Bundle 'godlygeek/tabular'
Bundle 'majutsushi/tagbar'
Bundle 'tpope/vim-unimpaired'



}}}


"""" Load all plugins using pathogen {{{
source ~llenstein/vim-autocomplpop.git/.vim/bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()
" }}}

" Settings for the gui_running {{{
if has("gui_running")
    " GUI is running or is about to start.
    " Maximize GVim window.
    set lines=37 columns=135
    " remove the menu bar
    set guioptions-=m
    " and remove the toolbar
    set guioptions-=T
    " and enable the horizontal scrollbar
    "set guioptions+=b
    " and remove the vertical scrollbar
    set guioptions-=r
    " no left scrollbar
    set guioptions-=L
    " use console style dialogs
    set guioptions+=c
    " but always show the tabline (window otherwise resizes when first showing tabline)
    set showtabline=2

    if has("win32") || has("win64")
        set guifont=Consolas:h10:cANSI
    endif
end
" }}}

" color scheme {{{
colorscheme solarized
let g:solarized_termcolors=256
" }}}

" first some settings copied from Debian config
set showtabline=2
set nocompatible                      " no compatibility with old-skool vi
set history=1000                      " keep more history (was 50 in Debian config)

set hidden                            " allow Vim to switch to another buffer while the current is not saved
set autoread                          " Set to auto read when a file is changed from the outside
"set spell


set list                              " show special chars, such as tab and eol
set listchars=tab:→\ ,eol:·,trail:☐,extends:❱,precedes:❰ " chars to show for list

syntax on                             " Enable syntax highlighting
set hlsearch                          " Highlight searches (use <C-L> to temporarily turn off highlighting; see the
                                      " mapping of <C-L> below)
set ignorecase                        " Use case insensitive search, except when using capital letters
set smartcase
set autoindent                        " When opening a new line and no filetype-specific indenting is enabled, keep
set nowrap                            " disable wrapping of text
set showbreak=…\                      " when soft-wrapping, start lines which continue the previous line with these chars
set ruler                             " Display the cursor position on the last line of the screen or in the status
set title                             " set the title
set linebreak                         " only wrap after words, not inside words
                                      " line of a window
set nostartofline                     " Stop certain movements from always going to the first character of a line.
set cursorline                        " highlight the current line
set cursorcolumn                      " highlight the current column
set completeopt=menu,longest,preview  " options for insert mode completion
                                      " While this behaviour deviates from that of Vi, it does what most users
                                      " coming from other editors would expect.
set laststatus=2                      " Always display the status line, even if only one window is displayed
set visualbell                        " Use visual bell instead of beeping when doing something wrong
set t_vb=                             " And reset the terminal code for the visual bell.  If visualbell is set, and
                                      " this line is also included, vim will neither flash nor beep.  If visualbell
                                      " is unset, this does nothing.
set number                            " Display line numbers on the left

set diffopt+=iwhite                   " diff options: ignore whitespace
set t_Co=256                          " force the terminal to use 256 colors
set display+=lastline                 " display wrapped lines at bottom instead of @ symbols
set numberwidth=5                     " The amount of digits reserved for the line numbers 99999 
set foldlevelstart=99                 " by default, open all folds
set foldmethod=indent                 " indent fold method by default
set pastetoggle=<F12>                 " Use <F11> to toggle between 'paste' and 'nopaste'
set incsearch                         " While typing a search command, show immediately where the
" Tabs / spaces options {{{
set shiftwidth=2                      " An indent tab will be x spaces wide
set tabstop=2                         " A normal tab will be x spaces wide
                                      " so far typed pattern matches.
set softtabstop=2
set expandtab
" }}}

set scrolloff=5                       " Keep x lines below and above the cursor

set noswapfile                        " disable swap files, most of the time they are just annoying
set nobackup                          " don't make a (permanent) backup when saving files
set dir=~/.vimswap//,/var/tmp//,/tmp//, " The swap file will be created in the first directory where this is possible.

set fillchars=vert:\ ,fold:-          " fill vertical splitlines with spaces instead of the ugly |-char; Default - for folds
set mouse=a
filetype plugin indent on   " Use indentation as specified in the ft plugin
set wildmenu
set wildmode=list:longest,full
set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,*.jpg,*.gif,*.png
set background=dark                   " when syntax is on the colors will be best visible on a dark background
set showcmd                           " show the command being typed
set sidescrolloff=5                   " Keep 5 lines at the size
set showmatch			                    " show matching brackets 

set encoding=utf-8

let g:acp_enableAtStartup = 1              " Disable AutoComplPop.
let g:acp_completeoptPreview = 1
"let g:neocomplcache_enable_at_startup = 1  " Launches neocomplcache automatically on vim startup.
"let g:neocomplcache_enable_auto_select = 1 " AutoComplPop like behavior
"let g:neocomplcache_min_syntax_length = 3  " Sets minimum char length of syntax keyword
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"



" Option for newer vim version {{{
if v:version > '702'
    if $VIM !~ 'vimtouch'             " check that we are not running on Android (VimTouch)
        set undofile                  " save undo history to an external file
    endif
    set undodir=~/.vimundo,.,/tmp     " where to save undo history files
    set relativenumber                " use relative line numbering
    set nonumber                      " and disable default line numbering
    set cryptmethod=blowfish          " use stronger blowfish encryption algorithm
    set colorcolumn=80,120            " show a vertical line at these positions
endif
" }}}

" title string {{{
set titlestring=                      " completely reset titlestring
set titlestring+=%t                   " the current filename
set titlestring+=%(\ %M%)             " modified flag
set titlestring+=%(\ (%{expand(\"%:~:h\")})%)  " relative path to current file
set titlestring+=%(\ %a%)             " extra attributes
" }}}

" run the rooter plugin after a session is loaded
autocmd BufRead,BufNewFile * Rooter

" Mapleader shortcuts {{{
let mapleader = ","

map <Leader>r :source ~/.vimrc<cr>
map <Leader>e :edit ~/.vimrc<cr>
nnoremap <silent> <Leader>o :CommandT ~/puppet<CR>
map <leader>q :qa!<CR>
map <leader>s :Gstatus<cr>
map <leader>p :Git push<cr>
map <leader>c :bd!<CR>
" }}}

"F function buttons {{{
:map <F7> :NERDTreeToggle<CR>
map <F8> :TagbarToggle<CR>
:nnoremap <F5> :buffers<CR>:buffer<Space>
noremap <F9> :call ToggleMouse() <CR>
" }}}

" Bubbling {{{
"""" Bubble Single Lines """""""""""""""""""""""""""""""
nmap <C-Up> [e
nmap <C-Down> ]e
"""" Bubble Multiple Lines
vmap <C-Up> [egv
vmap <C-Down> ]egv
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" }}}

" Bufftabs optiosn {{{
noremap <C-left> :bprev!<CR>
noremap <C-right> :bnext!<CR>
let g:buftabs_only_basename=1
" }}}

" Some Handy Shortcuts {{{
cmap w!! w !sudo tee % >/dev/null
nnoremap ; :
nnoremap <silent> ,/ :nohlsearch<CR>
nnoremap <silent> <Esc><Esc> :nohlsearch<CR>
nnoremap <Space> za
map <F3> :set expandtab!<CR>
" }}}

" Auto Reload .vimrc {{{
"au! BufWritePost .vimrc source %
au! BufWritePost vimrc source %
" }}}

" Mark trailing whitespaces as error {{{
hi link localWhitespaceError Error
autocmd Syntax * syn match localWhitespaceError excludenl /\s\+\%#\@<!$\| \+\ze\t/ display containedin=ALL
" }}}

" Settings for detectindent {{{
:let g:detectindent_preferred_expandtab = 1
:let g:detectindent_preferred_indent = 2
:autocmd BufReadPost * :DetectIndent
" }}}

" Settings for indentLine {{{
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#A4E57E'
let g:indentLine_char = '┆'
" }}}


" Window Nav - withouth ctrl-w {{{
map  <C-h> <C-w>h
map  <C-j> <C-w>j
map  <C-k> <C-w>k
map  <C-l> <C-w>l
" }}}

" Puppet Integration {{{
command! -nargs=+ Grep execute "noautocmd silent lvimgrep /<args>/gj ~/puppet/**/*.pp" | lopen 10
"set shellcmdflag=-ic
set kp=pi
set iskeyword=-,:,@,48-57,_,192-255
set tags=tags;~/
" }}}

" settings for ultisnips {{{
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "snippets"]
let g:UltiSnipsNoPythonWarning = 1
" }}}

" NerdTree Options
let NERDTreeQuitOnOpen = 1

" Set backspace config
set backspace=indent,eol,start
set whichwrap+=<,>,h,l

" Configuration of plugins, syntax, colorschemes {{{
" settings for ctrlp {{{
let g:ctrlp_show_hidden = 0
let g:ctrlp_map = '<leader>t'
let g:ctrlp_max_height = 25
let g:ctrlp_switch_buffer = 'ET'
let g:ctrlp_extensions = ['tag', 'buffertag', 'filetype']
noremap <leader>] :CtrlPTag<CR>
noremap <leader>} :CtrlPBufTag<CR>
noremap <leader>f :CtrlPFiletype<CR>
" }}}
" }}}

" Powerline settings {{{
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
set noshowmode            " Hide the default mode text (e.g. -- INSERT -- below the statusline)
" }}}

" the following line makes vim ignore camelCase and CamelCase words so they
" are not highlighted as spelling mistakes
autocmd Syntax * syn match CamelCase "\(\<\|_\)\%(\u\l*\)\{2,}\(\>\|_\)\|\<\%(\l\l*\)\%(\u\l*\)\{1,}\>" transparent containedin=.*Comment.*,.*String.*,VimwikiLink contains=@NoSpell contained

" Some Functions {{{
function! CurDir()
    let curdir = substitute(getcwd(), '/home/wdh', "~/", "g")
    return curdir
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

" Enable relativenumber only when in normal mode
if exists('+relativenumber')
    autocmd InsertEnter * setlocal number
    autocmd InsertLeave * setlocal relativenumber
endif

" }}}
" vim: fdm=marker fdl=0
