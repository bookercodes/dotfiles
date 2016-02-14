" Syntax colorization
syntax on
colorscheme base16-gooey
let base16colorspace=256
set background=dark

let mapleader = "\<Space>"

set ignorecase " When query is lowercase, ignore case
set smartcase  " When query contains uppercase, pay attention to case
set number
set relativenumber
set expandtab
set softtabstop=2
set shiftwidth=2
set shiftround
set noswapfile
set noshowmode " Do not show mode on last line. Airline already does this.
set laststatus=2
set omnifunc=csscomplete#CompleteCSS

vnoremap < <gv
vnoremap > >gv

nnoremap <Tab> <c-w>w " When Tab is pressed, cycle panes

map <C-n> :nohl<CR> " When Control + n is pressed, remove search highlighting
map <F5> :source $MYVIMRC<CR> " When F5 is pressed, reload Vim settings
