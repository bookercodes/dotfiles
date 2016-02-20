source $HOME/.config/nvim/bundles.vim

let mapleader = "\<Space>"

" Syntax colorization
syntax on
colorscheme base16-gooey
let base16colorspace=256
set background=dark

set ignorecase " When query is lowercase, ignore case
set smartcase  " When query contains uppercase, pay attention to case
set number
set noeol
set relativenumber
set expandtab
set softtabstop=2
set shiftwidth=2
set shiftround
set noswapfile
set noshowmode " Do not show mode on last line. Airline already does this.
set laststatus=2
set omnifunc=csscomplete#CompleteCSS
set updatetime=250

" Remap : -> ;
nnoremap ; :
vnoremap ; :
nnoremap : ;

vnoremap < <gv
vnoremap > >gv

map <C-n> ;nohl<CR>
map <F5> ;source $MYVIMRC<CR>
map q: ;q

set cursorline
set cursorcolumn

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%121v.\+/
set colorcolumn=120
" Deoplete
let g:deoplete#enable_at_startup = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" :
\ <SID>check_back_space() ? "\<TAB>" :
\ neocomplete#start_manual_complete()
function! s:check_back_space() "{{{
let col = col('.') - 1
return !col || getline('.')[col - 1] =~ '\s'
endfunction"}}}

" NERD Tree
 nmap <Leader>f ;NERDTreeToggle<Enter>
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" NERD Commenter
let NERDSpaceDelims=1 " Add space after commentugar pulled from janus... This ensures that it opens in current
" folder and remembers recent folder and other things that are awkward with
" basic nerdtree

" Neosnippet
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
let g:neosnippet#enable_snipmate_compatibility = 1

" ControlP
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_map = '<C-p>'

" Vim JSX
let g:jsx_ext_required = 0 " Also format .js files

" Vim Markdown
au BufRead,BufNewFile *.md setlocal textwidth=80
let g:vim_markdown_folding_disabled = 1
autocmd BufRead,BufNewFile *.md setlocal spell
set complete+=kspell

" Vim Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1

" Vim Easy Align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Tern
set completeopt-=preview " Stop scratch window opening all the time :@

" Grepper
nnoremap <leader>g :Grepper -tool git<cr>

" Rainbow
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Vim expand region
vmap v <Plug>(expand_region_expand)
vmap V <Plug>(expand_region_shrink)

" Neomake
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

nmap <Leader><Space>o :lopen<CR>      " open location window
nmap <Leader><Space>c :lclose<CR>     " close location window
nmap <Leader><Space>, :ll<CR>         " go to current error/warning
nmap <Leader><Space>n :lnext<CR>      " next error/warning
nmap <Leader><Space>p :lprev<CR>      " previous error/warning

" Git Gutter
let g:gitgutter_sign_column_always = 1

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/

autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" start: automatically trim trailing whitespace
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd FileType * autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" Gist
let g:gist_open_browser_after_post = 1
let g:gist_private = 1
