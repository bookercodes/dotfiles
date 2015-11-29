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
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'
Plug 'othree/html5.vim'
Plug 'scrooloose/syntastic'
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
nmap <Leader>f :NERDTreeToggle<Enter>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" Emmet
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

"Synastic
"let g:syntastic_javascript_checkers=['standard']
"let g:syntastic_javascript_standard_exec = 'semistandard'
"autocmd bufwritepost *.js silent !semistandard % --format
"set autoread

" More logical panel navigation
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

