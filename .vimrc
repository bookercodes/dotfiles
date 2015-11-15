" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.
set pastetoggle=<F2>
set clipboard=unnamed

"noremap <C-n> :nohl<CR>
"vnoremap <C-n> :nohl<CR>
"inoremap <C-n> :nohl<CR>

let mapleader = ";"

" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

" disable swap files
set nobackup
set noswapfile

"map <c-j> <c-w>j
"map <c-k> <c-w>k
"map <c-l> <c-w>l
"map <c-h> <c-w>h

set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set expandtab

" search settings
set hlsearch
set ignorecase
set smartcase

" main color scheme
set background=dark

let base16colorspace=256
syntax on
set t_Co=256 " 256 color mode
" colorscheme OceanicNext
colorscheme base16-oceanicnext

" line numbers
set relativenumber
set number

" neobundle
if 0 | endif
if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'tpope/vim-surround'
NeoBundle 'Valloric/YouCompleteMe'
"NeoBundle 'othree/yajs.vim'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'mxw/vim-jsx'
"NeoBundle 'SirVer/ultisnips'
"NeoBundle 'honza/vim-snippets'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'vim-jsbeautify'
NeoBundle 'mustache/vim-mustache-handlebars'
NeoBundle 'Chiel92/vim-autoformat'
NeoBundle 'christoomey/vim-tmux-navigator'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'bling/vim-airline'
NeoBundle 'tpope/vim-fugitive'
"NeoBundle 'mkitt/tabline.vim'
NeoBundle 'ntpeters/vim-better-whitespace'
NeoBundle 'suan/vim-instant-markdown'
NeoBundle 'junegunn/vim-easy-align'
"NeoBundle 'leafgarland/typescript-vim'
NeoBundle 'Quramy/tsuquyomi'
NeoBundle 'Shougo/vimproc.vim'
NeoBundle 'jistr/vim-nerdtree-tabs'


call neobundle#end()
filetype plugin indent on
NeoBundleCheck

" nerd tree
nnoremap <Leader>f :NERDTreeToggle<Enter>
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" nerd commenter
filetype plugin on
nmap <Leader>z <Plug>NERDCommenterToggle
vmap <Leader>z <Plug>NERDCommenterToggle

" you complete me
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
set completeopt-=preview

set cursorline
map <c-f> :Autoformat<cr>

" spell check for markdown files
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.md setlocal spell
"autocmd BufRead,BufNewFile *.md setlocal fo=cat
set complete+=kspell

augroup vimrc_autocmds
  autocmd BufEnter * highlight OverLength ctermbg=darkgrey guibg=#592929
  autocmd BufEnter * match OverLength /\%80v.*/
augroup END

set wrap
set textwidth=80
set colorcolumn=80

nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
"nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1
set laststatus=2

let g:indentLine_noConcealCursor = 1
let g:indentLine_color_term = 239
let g:indentLine_char = '|'

" Tab navigation like Firefox.
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>
autocmd BufWritePre * StripWhitespace

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" require jsx for files with js plugin
let g:jsx_ext_required = 0
