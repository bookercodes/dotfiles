augroup AutoCommands
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
  autocmd BufWritePre * :%s/\s\+$//e
augroup END

" Colors
syntax on
let base16colorspace=256
colorscheme base16-gooey
set background=dark

" Leader
let mapleader = "\<Space>"

"
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>

" Line numbers
set number
set relativenumber

" Tabs
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Omnicomplete
set omnifunc=csscomplete#CompleteCSS

" Disable Swap
set noswapfile

" Better code identing
vnoremap < <gv
vnoremap > >gv

" Vim panes
nnoremap <Tab> <c-w>w
nnoremap <bs> <c-w>W

" Neocomplete
let g:deoplete#enable_at_startup = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" :
\ <SID>check_back_space() ? "\<TAB>" :
\ neocomplete#start_manual_complete()
function! s:check_back_space() "{{{
let col = col('.') - 1
return !col || getline('.')[col - 1] =~ '\s'
endfunction"}}}

" NERD Commenter
nmap <Leader>z <Plug>NERDCommenterToggle
vmap <Leader>z <Plug>NERDCommenterToggle

" Nerd TREE
nmap <Leader>f :NERDTreeToggle<Enter>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" Emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
noremap <Leader>e :Emmet

" ControlP
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_map = '<C-p>'

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_aggregate_errors = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 5
" nmap <leader>st :SyntasticToggleMode<cr>

" Neosnippet
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" JSX
let g:jsx_ext_required = 0

" Vim Markdown
au BufRead,BufNewFile *.md setlocal textwidth=80
let g:vim_markdown_folding_disabled = 1
autocmd BufRead,BufNewFile *.md setlocal spell
set complete+=kspell

"let g:formatdef_my_custom_jsx = "'esformatter --indent.value=\"foo\" '.bufname('%')"
"let g:formatters_javascript_jsx = ['my_custom_jsx']
