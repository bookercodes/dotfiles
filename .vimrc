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
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>  

set relativenumber
" set tw=79   " width of document (used by gd)
" set nowrap  " don't automatically wrap on load
" set fo-=t   " don't automatically wrap text when typing
" set colorcolumn=80
" set formatoptions+=t
" highlight ColorColumn ctermbg=233"
set noswapfile

map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

" Enable syntax highlighting
" You need to reload this file for the change to apply
filetype off
filetype plugin indent on

set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set expandtab

set hlsearch
set incsearch
set ignorecase
set smartcase
set cursorline
set history=700
set undolevels=700

 " Note: Skip initialization for vim-tiny or vim-small.
 if 0 | endif

 if has('vim_starting')
   if &compatible
     set nocompatible               " Be iMproved
   endif

   " Required:
   set runtimepath+=~/.vim/bundle/neobundle.vim/
 endif

 " Required:
 call neobundle#begin(expand('~/.vim/bundle/'))

 " Let NeoBundle manage NeoBundle
 " Required:
 NeoBundleFetch 'Shougo/neobundle.vim'

 " My Bundles here:
 " Refer to |:NeoBundle-examples|.
 " Note: You don't set neobundle setting in .gvimrc!
 NeoBundle 'scrooloose/nerdtree.git'
 NeoBundle 'Xuyuanp/nerdtree-git-plugin.git'
 NeoBundle 'jelera/vim-javascript-syntax'
 NeoBundle 'pangloss/vim-javascript'
 NeoBundle 'mxw/vim-jsx'
 NeoBundle 'Raimondi/delimitMate'
 NeoBundle 'scrooloose/syntastic'
 NeoBundle 'marijnh/tern_for_vim'
 NeoBundle 'Valloric/YouCompleteMe'
 NeoBundle 'tpope/vim-surround'
 NeoBundle 'bling/vim-airline' 
 NeoBundle 'kien/ctrlp.vim' 
 NeoBundle 'chriskempson/base16-vim'
 call neobundle#end()

 " Required:
 filetype plugin indent on

 " If there are uninstalled bundles found on startup,
 " this will conveniently prompt you to install them.
 NeoBundleCheck

nnoremap <Leader>f :NERDTreeToggle<Enter>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
set completeopt-=preview

let base16colorspace=256 " Access colors present in 256 colorspace"
set t_Co=256 " 256 color mode"
set background=dark
colorscheme base16-oceanicnext

let g:airline_theme="tomorrow"
let g:jsx_ext_required = 0
set laststatus=2
