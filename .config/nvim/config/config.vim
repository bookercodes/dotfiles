" Syntax
syntax on
colorscheme base16-gooey
let base16colorspace=256
set background=dark
highlight Error ctermfg=15
highlight Error ctermbg=black

" Indentation
set tabstop=2
set expandtab
set shiftwidth=2

" Case sensitivity for search
set ignorecase
set smartcase

" Line numbers
set number
set relativenumber

" Open new split panes to right and bottom
set splitbelow
set splitright

" Highlight current line and column
set cursorline
set cursorcolumn

" Disable swap file
set noswapfile

" Show column guide
set colorcolumn=95

" Do not highlight code longer than column guide
set synmaxcol=95

" Disable welcome message
set shortmess=atTiOI

" Remember undo tree
set undodir=~/.config/nvim/undodir
set undolevels=100
set undofile

" Automatically source init.vim
autocmd! bufwritepost config.vim,bundle.vim source $MYVIMRC

" Remember cursor position
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Automatically write on focus lost
au FocusLost,WinLeave * :silent! wa

" Automatically read on focus gained
au FocusGained,BufEnter * :silent! !

" Ensure splits have equal width on resize
au VimResized * :wincmd =

" Disable automatic comment insertion
au FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Enable spell check for markdown files
autocmd BufRead,BufNewFile *.md setlocal spell

" Omnifunc
augroup omnifuncs
  autocmd!
  autocmd FileType javascript setlocal omnifunc=tern#Complete
augroup end

" Leader key
let mapleader = "\<Space>"

" Swap ; and :
nnoremap ; :
vnoremap ; :
nnoremap : ;

" Recursively reselect indented text
vnoremap < <gv
vnoremap > >gv

" Convinent key-bindings for accessing the sys clipboard
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" Convinent key-bindings for switching and closing buffers
" nnoremap <C-w> :bd<CR>
nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>

" Convinent key-binding to write file
nnoremap <Leader>w :w<CR>

" Convinent key-binding to reload init.vim
map <F5> ;source $MYVIMRC<CR>

" Convinent key-binding to remove search matches highlighting
map <esc> ;nohl<CR>

" Convinent key-binding to create a new line in normal mode
nnoremap <CR> o<Esc>

" When entering command, automatically expand 'help' to 'tab help'
cabbrev help tab help

" Disable Ex Mode key-binding
noremap Q <NOP>

" Quicker scrolling
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" ..........................................................
" ...................................................Plugins

" scrooloose/nerdtree
nmap <Leader>f ;NERDTreeToggle<Enter>
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" mxw/vim-jsx
let g:jsx_ext_required = 0

" itchyny/lightline
set laststatus=2
set noshowmode
let g:lightline = {
  \ 'colorscheme': 'quack',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'fugitive'],[ 'filename' ] ]
  \ },
  \ 'component_function': {
  \   'fugitive': 'LLFugitive',
  \   'readonly': 'LLReadonly',
  \   'modified': 'LLModified',
  \   'filename': 'LLFilename',
  \   'mode': 'LLMode'
  \ } }
function! LLMode()
  let fname = expand('%:t')
  return fname == '__Tagbar__' ? 'Tagbar' :
    \ fname == 'ControlP' ? 'CtrlP' :
    \ lightline#mode() == 'NORMAL' ? 'N' :
    \ lightline#mode() == 'INSERT' ? 'I' :
    \ lightline#mode() == 'VISUAL' ? 'V' :
    \ lightline#mode() == 'V-LINE' ? 'V' :
    \ lightline#mode() == 'V-BLOCK' ? 'V' :
    \ lightline#mode() == 'REPLACE' ? 'R' : lightline#mode()
endfunction
function! LLModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction
function! LLReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return "!"
  else
    return ""
  endif
endfunction
function! LLFugitive()
  return exists('*fugitive#head') ? ' ' . fugitive#head() : ''
endfunction
function! LLFilename()
  return ('' != LLReadonly() ? LLReadonly() . ' ' : '') .
   \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
   \ ('' != LLModified() ? ' ' . LLModified() : '')
endfunction

" junegunn/vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" ternjs/tern_for_vim
let g:tern_show_argument_hints = 'on_move'
let g:tern_show_signature_in_pum = 1
set completeopt-=preview

" terryma/vim-expand-region
vmap v <Plug>(expand_region_expand)
vmap V <Plug>(expand_region_shrink)

" benekastah/neomake
function! NeomakeESlintChecker()
  let l:npm_bin = ''
  let l:eslint = 'eslint'
  if executable('npm')
    let l:npm_bin = split(system('npm bin'), '\n')[0]
  endif
  if strlen(l:npm_bin) && executable(l:npm_bin . '/eslint')
    let l:eslint = l:npm_bin . '/eslint'
  endif
  let b:neomake_javascript_eslint_exe = l:eslint
endfunction
autocmd FileType javascript :call NeomakeESlintChecker()
autocmd! BufWritePost,BufReadPost * Neomake
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_warning_sign = {
  \ 'text': 'W',
  \ 'texthl': 'WarningMsg',
  \ }
let g:neomake_error_sign = {
  \ 'text': 'E',
  \ 'texthl': 'ErrorMsg',
  \ }

" airblade/vim-gitgutter
let g:gitgutter_sign_column_always = 1
set updatetime=250

" mattn/gist-vim
let g:gist_open_browser_after_post = 1
let g:gist_private = 1

" haya14busa/vim-operator-flashy
map y <Plug>(operator-flashy)
nmap Y <Plug>(operator-flashy)$
hi Flashy ctermbg=magenta

" ntpeters/vim-better-whitespace
autocmd BufWritePre * StripWhitespace

" vim-scripts/camelcasemotion
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e

" junegunn/fzf
nnoremap <Leader>o :GitFiles<CR>

" dhruvasagar/vim-table-mode
let g:table_mode_corner="|"

" rcmdnk/vim-markdown
let g:vim_markdown_folding_disabled = 1

" SirVer/ultisnips
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<s-c-j>"
let g:UltiSnipsSnippetDirectories=['snips']
