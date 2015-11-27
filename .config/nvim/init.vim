" Plug
call plug#begin('~/.config/nvim/plugged')
Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdtree'
Plug 'pangloss/vim-javascript'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'plasticboy/vim-markdown'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdcommenter'
Plug 'spf13/vim-autoclose'
Plug 'bling/vim-airline'
call plug#end()

" Leader
let mapleader = "\<Space>"

" Line Numbers
set number
set relativenumber

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

" NERD Commenter Settings
nmap <Leader>z <Plug>NERDCommenterToggle
vmap <Leader>z <Plug>NERDCommenterToggle

" NERD Tree Settings
nnoremap <Leader>f :NERDTreeToggle<Enter>
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
