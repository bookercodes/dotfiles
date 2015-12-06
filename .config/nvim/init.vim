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
Plug 'Chiel92/vim-autoformat'
Plug 'cakebaker/scss-syntax.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'ternjs/tern_for_vim'
call plug#end()

autocmd FileType javascript setlocal omnifunc=tern#Complete
let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

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
" imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")


" Switch between panes
nnoremap <Tab> <c-w>w
nnoremap <bs> <c-w>W

" Syntatsic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_scss_checkers = ['scss_lint']

let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3

