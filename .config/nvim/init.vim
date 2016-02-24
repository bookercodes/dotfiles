source $HOME/.config/nvim/bundle.vim

augroup vimrc_autocmds
  autocmd BufEnter * highlight OverLength ctermbg=red
  autocmd BufEnter * match OverLength /\%106v.*/
augroup END

let mapleader = "\<Space>"

nnoremap <C-w> :bd<CR>
nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>
nnoremap <F1> :EsLintFix<CR>

" Syntax colorization
syntax on
colorscheme base16-gooey
let base16colorspace=256
set background=dark

set showcmd
set ignorecase " When query is lowercase, ignore case
set smartcase  " When query contains uppercase, pay attention to case
set number
set relativenumber
set noswapfile
set noshowmode " Do not show mode on last line. Airline already does this.
set laststatus=2
set updatetime=250
set splitbelow
set splitright
set cursorline
set cursorcolumn
set colorcolumn=105

set tabstop=2
set softtabstop=2
set expandtab
set smarttab
set shiftwidth=2
set autoindent
set smartindent

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap ; :
vnoremap ; :
nnoremap : ;
nnoremap <Leader>o :FZF<CR>
nnoremap <Leader>w :w<CR>
" nnoremap <leader>d "_d
" vnoremap <leader>d "_d
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

nnoremap <Leader>c :TComment<cr>
vnoremap <Leader>c :TComment<cr>
nnoremap <Leader>c :TComment<cr>

" Neosnippet
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

" Vim JSX
let g:jsx_ext_required = 0 " Also format .js files

" Vim Markdown
au BufRead,BufNewFile *.md setlocal textwidth=120
let g:vim_markdown_folding_disabled = 1


autocmd BufRead,BufNewFile *.md setlocal spell
set complete+=kspell
" All status line configuration goes here

set cmdheight=2
set display+=lastline

" general config
set laststatus=2 " always show status line
set showtabline=2 " always show tabline
set noshowmode " hide default mode text (e.g. INSERT) as airline already displays it

" Vim Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#fnamemod = ':t'
"
" Vim Easy Align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Tern
set completeopt-=preview " Stop scratch window opening all the time :@

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
" let g:neomake_verbose=3
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

" Gist
let g:gist_open_browser_after_post = 1
let g:gist_private = 1

cabbrev help tab help

set undodir=~/.config/nvim/undodir
set undolevels=100
set undofile

let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

map y <Plug>(operator-flashy)
nmap Y <Plug>(operator-flashy)$
hi Flashy ctermbg=magenta
autocmd BufWritePre * StripWhitespace

highlight Error ctermfg=15
highlight Error ctermbg=black

" camelCase motion settings
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e

