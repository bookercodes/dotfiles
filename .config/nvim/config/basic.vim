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
nmap <Leader>f :NERDTreeToggle<Enter>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" NERD Commenter
let NERDSpaceDelims=1 " Add space after comment symbol

" Neosnippet
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
let g:neosnippet#enable_snipmate_compatibility = 1

" ControlP
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_map = '<C-p>'

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_aggregate_errors = 1

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
