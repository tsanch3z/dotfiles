autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" " Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" " no compatible with vi
set nocompatible

" " no modelines
set modelines=0

set undofile
set undodir^=~/.vim/undodir//

set swapfile
set directory^=~/.vim/swap//
" " Better copy & paste
" " When you want to paste large blocks of code into vim, press F2 before you
" " paste. At the bottom you should see ``-- INSERT (paste) --``.

set pastetoggle=<F2>
set clipboard=unnamed

set scrolloff=10

" " Rebind <Leader> key
let mapleader = ","

inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <Up> <Nop>

inoremap ,, <ESC>

" " Quick quit command
nnoremap <Leader>e :quit<CR>  " Quit current window
nnoremap <Leader>E :qa!<CR>   " Quit all windows

" " Quick save commmand
nnoremap <Leader>w :w<CR>
inoremap <Leader>w <ESC>:w<CR>
noremap <Leader>W :wa<CR>
noremap <Leader>W <ESC>:wa<CR>

" " Bdelete Shortcut
nnoremap <Leader>rm :bdelete<CR>
noremap <Leader>rma :%bdelete<CR>

" " Quick save as root
nnoremap <leader>wr <ESC>:w !sudo tee % > /dev/null<CR>

" " Quick save and exit command
nnoremap <Leader>q :wq<CR>
inoremap <Leader>q <ESC>:wq<CR>

" " Quick redraw command
nnoremap <leader>r :redraw!<CR>

set bs=2

" " Easier moving between buffers
nnoremap <TAB> :bn<CR>
nnoremap <S-TAB> :bp<CR>

" " Easy window movement
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" " easier moving of code blocks
" " Try to go into visual mode (v), thenselect several lines of code here and
" " then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>

" " Enable syntax highlighting
" " You need to reload this file for the change to apply
filetype off
syntax on

" " Showing line numbers and length
set nu  " show line numbers
set relativenumber  " show line numbers
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

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'ctrlpvim/ctrlp.vim'

Plugin 'arcticicestudio/nord-vim'

Plugin 'vim-airline/vim-airline'

Plugin 'tpope/vim-surround'

Plugin 'tpope/vim-obsession'

Plugin 'airblade/vim-gitgutter'

Plugin 'tsanch3z/indent-python.vim'

Plugin 'alvan/vim-closetag'

Plugin 'pangloss/vim-javascript'

Plugin 'jelera/vim-javascript-syntax'

Plugin 'scrooloose/nerdcommenter'

Plugin 'vim-syntastic/syntastic'

Plugin 'maxmellon/vim-jsx-pretty'

Plugin 'editorconfig/editorconfig-vim'

Plugin 'vimwiki/vimwiki'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Set 256 color mode, and theme
set t_Co=256
try
  colorscheme nord
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry

let g:NERDSpaceDelims = 1

let g:vim_jsx_pretty_colorful_config = 1

let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx, *.js'

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
let g:airline_powerline_fonts = 1
set ttimeoutlen=50

" Configure ctrlp
let g:ctrlp_max_height = 30
let g:ctrlp_show_hidden = 1
set wildignore+=*/node_modules
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

" Configure syntastic
set statusline+=%#warningmsg#
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Configure ansible custom playbooks path
au BufRead,BufNewFile */playbooks/*.yml set filetype=yaml.ansible

let g:vimwiki_list = [{ 'path': '~/Projects/tsanch3z/notes' }]

" Remove trailing spaces
fun! TrimWhitespace()
    let l:save = winsaveview()
    %s/\s\+$//e
    call winrestview(l:save)
endfun
autocmd FileType javascript,python autocmd BufWritePre <buffer> :call TrimWhitespace()

if v:version > 703 || v:version == 703 && has('patch541')
  set formatoptions+=j
endif
