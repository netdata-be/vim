"
" ~/.vimrc 
"
" Created by wdh


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
set shiftwidth=4    " An indent tab will be x spaces wide
set tabstop=4       " A normal tab will be x spaces wide
set incsearch       " While typing a search command, show immediately where the
                    " so far typed pattern matches.
set softtabstop=4
					"
" Load all plugins hosted in ~/.vim/bundle
call pathogen#infect()
call pathogen#helptags()

" Start the molokai color scheme
if !has("gui_running")
	colorscheme molokai
	highlight Pmenu ctermbg=238 gui=bold
elseif has("gui_running")
	colorscheme molokai
	highlight Pmenu guibg=brown gui=bold
	set guioptions-=T
	set mousemodel=popup
end

" When typing a | look if we need to allign
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

" If I write virmrc then reload
au! BufWritePost .vimrc source %
au! BufWritePost vimrc source %
map <Leader>r :source ~/.vimrc<cr>

set mouse=a
let mapleader = ","
filetype plugin indent on   " Use indentation as specified in the ft plugin
set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,*.jpg,*.gif,*.png
set background=dark     " when syntax is on the colors will be best visible on a dark background
set showcmd             " show the command being typed
set sidescrolloff=5     " Keep 5 lines at the size
set showmatch			" show matching brackets

" Map F function buttons to different functions
:map <F2> :call UpdateDNSSerialZone()<cr>
:map <F7> :NERDTreeToggle<CR>
:map <F8> :TlistToggle<CR>
:nnoremap <F5> :buffers<CR>:buffer<Space>
noremap <F9> :call ToggleMouse() <CR>


" Map Ctrl-left and Ctrl-right To the next buffer 
noremap <C-left> :bprev!<CR> 
noremap <C-right> :bnext!<CR> 
noremap <tab> :bnext!<CR> 

" Buftabs options, only show the base name
let g:buftabs_only_basename=1

" This saves a LOT of keystrokes
nnoremap ; :
" Clear the search highlight by searching for nothing
" Instead of /dfsfsdfs
nmap <silent> ,/ :nohlsearch<CR>


" Some handy shortcuts "
""""""""""""""""""""""""
map <leader>q :qa!<CR>
" Use sudo to write when using w!!
cmap w!! w !sudo tee % >/dev/null


" Make it possible to create comments
map <leader>c :s/^/# /<CR>
map <leader>C :s/^# //<CR>

" Fugitive Shortcuts
map <leader>s :Gstatus<cr>
map <leader>p :Git push<cr>

" Window naviation shortcuts
map  <C-h> <C-w>h
map  <C-j> <C-w>j
map  <C-k> <C-w>k
map  <C-l> <C-w>l

" Enable bubbling only when we have the 
if exists(':[e') 
	" Bubble single lines
	nmap <C-Up> [e
	nmap <C-Down> ]e
	" Bubble multiple lines
	vmap <C-Up> [egv
	vmap <C-Down> ]egv
endif


set wildmenu
set wildmode=list:longest,full

" NerdTree Options
let NERDTreeQuitOnOpen = 1 

" TagList Options
let Tlist_Use_Right_Window = 1
let Tlist_Enable_Fold_Column = 1
let Tlist_Show_One_File = 1
let Tlist_Sort_Type = "order"

" Set backspace config
set backspace=indent,eol,start
set whichwrap+=<,>,h,l

""""""""""""""""""""""""""""""
" => Statusline
""""""""""""""""""""""""""""""
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ path:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c\ \ \ %{fugitive#statusline()}

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



 
function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction




" This function is used to update the serial in the SOA from a bind file
function! UpdateDNSSerialZone()
	" Initialisation des variables
	let serialZone=0
	let serialZoneUpdated=0
	"Search for a line that start with a year and contains the word Serial
	let numberOfLine = search('\(19\|20\)\d\d\(0[1-9]\|1[012]\)\(0[1-9]\|[12][0-9]\|3[01]\)\d\d.*\(S\|s\)erial.*')
	if numberOfLine == 0
		echo "No bind serial found ! so not updating the file"
	else
		"Get the line contents 
		let line = getline(numberOfLine)
		"Extract the serial number
		let serialZone=strpart(line, match(line,'\(19\|20\)\d\d\(0[1-9]\|1[012]\)\(0[1-9]\|[12][0-9]\|3[01]\)'),match(line,";")-1-match(line,'\(19\|20\)\d\d\(0[1-9]\|1[012]\)\(0[1-9]\|[12][0-9]\|3[01]\)'))
		" Get the text which is before and after the serial number, this will
		" be used to update the serial.
		let pre = strpart(line, 0, match(line,'\(19\|20\)\d\d\(0[1-9]\|1[012]\)\(0[1-9]\|[12][0-9]\|3[01]\)') )
		let post = strpart(line, match(line,'\(19\|20\)\d\d\(0[1-9]\|1[012]\)\(0[1-9]\|[12][0-9]\|3[01]\)')+10, match(line, "$" ) )

		" Create a new server number for today
		let serialZoneUpdated=strftime("%Y%m%d")."01"
       
		" If the found serial date matches the one from today then we have to
		" increment
		if serialZone =~ "^.*".strftime("%Y%m%d").".*"
			let serialZoneUpdated=serialZone+1
		endif
		" Build a new line with the updated serial
		"let line = pre.serialZoneUpdated."\t; Serial HIHI"
		let line = pre.serialZoneUpdated.post
		" Write the line back to the file
		call setline(numberOfLine, line)
		echo "Old serial = \"".serialZone."\" updated serial to = \"".serialZoneUpdated."\""
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
