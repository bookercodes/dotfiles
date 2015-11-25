" Plug
call plug#begin('~/.config/nvim/plugged')
Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdtree'
Plug 'pangloss/vim-javascript'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'plasticboy/vim-markdown'
call plug#end()

" Leader
let mapleader = "\<Space>"

" NERDTree
nnoremap <Leader>f :NERDTreeToggle<Enter>
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" Line Numbers
set number

" Easy Align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Theme
set background=dark
let base16colorspace=256
colorscheme base16-gooey

" Highlight current line
set cursorline

" Remove input lag
set timeoutlen=1000 ttimeoutlen=0

" Markdown
let g:vim_markdown_folding_disabled=1
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.md setlocal spell
set complete+=kspell

" Column
set wrap
set colorcolumn=80
set tw=80
set formatoptions+=t

" Tab Settings
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set expandtab

