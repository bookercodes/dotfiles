source $HOME/.config/nvim/bundle.vim

augroup vimrc_autocmds
  autocmd BufEnter * highlight OverLength ctermbg=red
  autocmd BufEnter * match OverLength /\%81v.*/
augroup END

let mapleader = "\<Space>"

nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>

" Syntax colorization
syntax on
colorscheme base16-gooey
let base16colorspace=256
set background=dark

set ignorecase " When query is lowercase, ignore case
set smartcase  " When query contains uppercase, pay attention to case
set number
set relativenumber
set noexpandtab
set softtabstop=2
set shiftwidth=2
set shiftround
set noswapfile
set noshowmode " Do not show mode on last line. Airline already does this.
set laststatus=2
set updatetime=250
set splitbelow
set splitright
set cursorline
set cursorcolumn
set colorcolumn=80

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap ; :
vnoremap ; :
nnoremap : ;
nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P
vnoremap < <gv
vnoremap > >gv
map <esc> ;nohl<CR>
map <F5> ;source $MYVIMRC<CR>
map q: ;q

" Deoplete
let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
" omnifuncs
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
augroup end
let g:tern_show_argument_hints = 'on_hold'
let g:tern_show_signature_in_pum = 1
autocmd FileType javascript setlocal omnifunc=tern#Complete
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
let NERDSpaceDelims=1

" Neosnippet
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

" ControlP
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" Vim JSX
let g:jsx_ext_required = 0 " Also format .js files

" Vim Markdown
au BufRead,BufNewFile *.md setlocal textwidth=80
let g:vim_markdown_folding_disabled = 1


autocmd BufRead,BufNewFile *.md setlocal spell
set complete+=kspell

" Vim Airline
let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#show_tab_nr = 1

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
autocmd! BufReadPost FileType javascript :call NeomakeESlintChecker()
autocmd! BufWritePost,BufReadPost * Neomake
let g:neomake_verbose=3
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_warning_sign = {
  \ 'text': 'W',
  \ 'texthl': 'WarningMsg',
  \ }
let g:neomake_error_sign = {
  \ 'text': 'E',
  \ 'texthl': 'ErrorMsg',
  \ }

nmap <Leader><Space>o ;lopen<CR>      " open location window
nmap <Leader><Space>c ;lclose<CR>     " close location window
nmap <Leader><Space>, ;ll<CR>         " go to current error/warning
nmap <Leader><Space>n ;lnext<CR>      " next error/warning
nmap <Leader><Space>p ;lprev<CR>      " previous error/warning

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

autocmd FileType * autocmd BufWritePre <buffer> ;call <SID>StripTrailingWhitespaces()

" Gist
let g:gist_open_browser_after_post = 1
let g:gist_private = 1


cabbrev help tab help
