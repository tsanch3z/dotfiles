" " Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" " Better copy & paste
" " When you want to paste large blocks of code into vim, press F2 before you
" " paste. At the bottom you should see ``-- INSERT (paste) --``.

set pastetoggle=<F2>
set clipboard=unnamed

" " Rebind <Leader> key
let mapleader = ","

" " Quick quit command
noremap <Leader>e :quit<CR>  " Quit current window
noremap <Leader>E :qa!<CR>   " Quit all windows

set bs=2

" " easier moving between tabs
map <Leader>k <esc>:tabprevious<CR>
map <Leader>l <esc>:tabnext<CR>
" "Uncomment for qwerty"
" " map <Leader>n <esc>:tabprevious<CR>
" " map <Leader>m <esc>:tabnext<CR>

" " easier moving of code blocks
" " Try to go into visual mode (v), thenselect several lines of code here and
" " then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation


" Show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/


" " Color scheme
" " mkdir -p ~/.vim/colors && cd ~/.vim/colors
" " wget -O wombat256mod.vim
" http://www.vim.org/scripts/download_script.php?src_id=13400
set t_Co=256
color wombat256mod

" " Enable syntax highlighting
" " You need to reload this file for the change to apply
filetype off
filetype plugin indent on
syntax on

" " Showing line numbers and length
set number  " show line numbers
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233

" " Useful settings
set history=700
set undolevels=700

" " Tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" " Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" " disable backup and swap files
set nobackup
set nowritebackup
set noswapfile

" " Setup Pathogen
" " mkdir -p ~/.vim/autoload ~/.vim/bundle
" " wget https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim
" " Install any plugin into a .vim/bundle/plugin-name/ folder
execute pathogen#infect()

" ============================================================================
" " Plugins
" "
" ============================================================================
" "" vim airline
" git clone https://github.com/bling/vim-airline ~/.vim/bundle/vim-airline
" "" set laststatus=2


" " Settings for ctrlp
" " cd ~/.vim/bundle
" " git clone https://github.com/kien/ctrlp.vim.git
" "" let g:ctrlp_max_height = 30
" "" set wildignore+=*.pyc
" "" set wildignore+=*_build/*
" "" set wildignore+=*/coverage/*

" " cd ~/.vim/bundle/ && git clone --recursive
" https://github.com/davidhalter/jedi-vim.git
" "" let g:jedi#popup_on_dot = 0
" "" let g:jedi#popup_select_first = 0

" Python folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
" "" set nofoldenable

" GitGutter (signs for modifications)
" cd ~/.vim/bundle
" git clone git://github.com/airblade/vim-gitgutter.git
