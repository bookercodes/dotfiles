" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.
set pastetoggle=<F2>
set clipboard=unnamed

let mapleader = ";"

" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
" vnoremap < <gv  " better indentation
" vnoremap > >gv  " better indentation

map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Show whitespace
" MUST be inserted BEFORE the colorscheme command
" autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
" au InsertLeave * match ExtraWhitespace /\s\+$/

set t_Co=256
color wombat256mod

" Enable syntax highlighting
" You need to reload this file for the change to apply
" filetype off
" filetype plugin indent on
" syntax on

" Showing line numbers and length
set number  " show line numbers
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233

set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" set backupdir=~/.vim/backup
" set directory=~/.vim/tmp

" Useful settings
set history=700
set undolevels=700

" NeoBundle Setup
if has('vim_starting')
" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
" Required:
call neobundle#begin(expand('~/.vim/bundle/'))
" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'
" My Bundles here:
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Lokaltog/vim-powerline.git'
NeoBundle 'kien/ctrlp.vim.git'
NeoBundle 'nvie/vim-flake8.git'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'scrooloose/nerdtree.git'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }
NeoBundle 'mattn/gist-vim'
NeoBundle 'mattn/webapi-vim' "Gist-vim dependence

call neobundle#end()
" Required:
filetype plugin indent on
" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

nnoremap <leader>cc :VimShellPop<cr>
nnoremap <leader>c :VimShell<cr>
let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
let g:vimshell_prompt =  '$ '
map <C-n> :NERDTreeToggle<CR>
