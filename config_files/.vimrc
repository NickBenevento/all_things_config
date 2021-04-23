"COLORSCHEME
colorscheme atlantis
" colorscheme personal

syntax on

"spacing for different file types
filetype plugin indent on 
autocmd FileType java setlocal ts=4 sts=4 sw=4
autocmd FileType python setlocal ts=4 sts=4 sw=4
autocmd FileType html setlocal ts=2 sts=2 sw=2
autocmd FileType php setlocal ts=4 sts=4 sw=4
autocmd FileType css setlocal ts=4 sts=4 sw=4
autocmd FileType sql setlocal ts=4 sts=4 sw=4
autocmd FileType javascript setlocal ts=4 sts=4 sw=4
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType sh setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType markdown setlocal ts=4 sts=4 sw=4
autocmd BufRead, BufNewFile *.h, *.c set ts=4 sts=4 sw=4
" "-------------------------------------------------------------------------------------
" " PLUGINS

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'

call vundle#end()            " required
"------------------------------------------------------------------------------------
"QOL

set number			" sets line numbers
set splitbelow
set splitright
set clipboard=unnamedplus	" copy/paste to the system clipboard
set pastetoggle=<F9>		" Go into paste mode
set showcmd		  	" Show(partial) command in status line.
set mouse=a               	" Allow the mouse to be used
set showmatch		  	" Show matching brackets.
set ignorecase            	" Case insensitive matching
set smartcase		  	" Smart case matching
set incsearch		  	" Incremental search
set autowrite             	" Automatically save before commands like :next and :make
set autoindent			" Automatically indent
set hlsearch		  	" Highlights matches when searching for words

"Scrolling starts 5 lines away from the top/bottom of the page
if !&scrolloff
	set scrolloff=5
endif
if !&sidescrolloff
	set sidescrolloff=5
endif

" Jump to the last position when reopening a file
if has("autocmd")
	au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
				\ | exe "normal! g`\"" | endif
endif
"------------------------------------------------------------------------------------ -
" MAPPING

" If two files are loaded, switch to the alternate file, then back.
" That sets # (the alternate file).
if argc() == 2
	n
	e #
endif

" Press Space to turn off highlighting and clear any message already displayed.
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Adds a new line by pressing enter while in normal mode and stays in normal
nnoremap <Enter> o<Esc>
nmap <S-Enter> O<Esc>

" Allows Ctrl-Backspace to delete previous word in insert mode
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>

" autocompletes the matching curly brace and auto - indents after hitting enter
inoremap {<CR> {<CR><BS> }<Esc>= = O

" formats text after pasting
: nnoremap p p==
 
