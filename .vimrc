autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" " Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" " no compatible with vi
set nocompatible

" " no modelines
set modelines=0

set relativenumber
set undofile

" " Better copy & paste
" " When you want to paste large blocks of code into vim, press F2 before you
" " paste. At the bottom you should see ``-- INSERT (paste) --``.

set pastetoggle=<F2>
set clipboard=unnamed

set scrolloff=10

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
vnoremap <up> <nop>
vnoremap <down> <nop>
vnoremap <left> <nop>
vnoremap <right> <nop>

" " Rebind <Leader> key
let mapleader = ","

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

inoremap jj <ESC>

" " Quick quit command
noremap <Leader>e :quit<CR>  " Quit current window
noremap <Leader>E :qa!<CR>   " Quit all windows
noremap <Leader>w :w<CR>
noremap <Leader>wa :wa<CR>

set bs=2

" " easier moving between buffers
map <Leader>j <esc>:bp<CR>
map <Leader>k <esc>:bn<CR>

" " easier moving of code blocks
" " Try to go into visual mode (v), thenselect several lines of code here and
" " then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>

" " Enable syntax highlighting
" " You need to reload this file for the change to apply
filetype off
syntax on

" " Showing line numbers and length
set number  " show line numbers
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
set colorcolumn=80
set autoindent

" " Easier split
set splitbelow
set splitright

" " Useful settings
set history=700
set undolevels=700

" " Tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab
set smartindent

" " Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" " disable backup and swap files
set nobackup
set nowritebackup
set noswapfile

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'kien/ctrlp.vim'

Plugin 'wombat256.vim'

Plugin 'bling/vim-airline'

Plugin 'airblade/vim-gitgutter'

Plugin 'Valloric/YouCompleteMe'

Plugin 'scrooloose/syntastic'

Plugin 'tsanch3z/indent-python.vim'

Plugin 'tpope/vim-surround'

Plugin 'pangloss/vim-javascript'

Plugin 'editorconfig/editorconfig-vim'

Plugin 'scrooloose/nerdcommenter'

Plugin 'marijnh/tern_for_vim'

Plugin 'Raimondi/delimitMate'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Set 256 color mode, use wombat theme
set t_Co=256
color wombat256mod

let g:NERDSpaceDelims = 1

" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Set 80 char line to black color
highlight ColorColumn ctermbg=black

" Configure airline
set laststatus=2
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
" List buffers and tab
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 0
let g:airline_theme='wombat'
set ttimeoutlen=50

" Configure ctrlp
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*
set wildignore+=*/.*

" Configure YCM
nnoremap <leader>g :YcmCompleter GoTo<CR>
