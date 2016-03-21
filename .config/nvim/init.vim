let bundleExists = 1
if (!isdirectory(expand("$HOME/.config/nvim/bundle/neobundle.vim")))
  call system(expand("mkdir -p $HOME/.config/nvim/bundle"))
  call system(expand("git clone https://github.com/Shougo/neobundle.vim ~/.config/nvim/bundle/neobundle.vim"))
  let bundleExists = 0
endif
if 0 | endif
if has('vim_starting')
  if &compatible
    set nocompatible
  endif
  set runtimepath+=~/.config/nvim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.config/nvim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'wellle/tmux-complete.vim'
NeoBundle 'tmux-plugins/vim-tmux'
NeoBundle 'moll/vim-node'
NeoBundle 'ternjs/tern_for_vim'
NeoBundle 'rking/ag.vim'
NeoBundle 'Shougo/dein.vim'
NeoBundle 'Shougo/deoplete.nvim'
NeoBundle 'carlitux/deoplete-ternjs'
NeoBundle 'othree/yajs.vim'
NeoBundle 'othree/es.next.syntax.vim'
NeoBundle 'gavocanov/vim-js-indent'
NeoBundle 'mxw/vim-jsx'
NeoBundle 'othree/html5.vim'
NeoBundle 'christoomey/vim-tmux-navigator'
NeoBundle 'ntpeters/vim-better-whitespace'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'benekastah/neomake'
NeoBundle 'briancollins/vim-jst'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'vim-scripts/camelcasemotion'
NeoBundle 'terryma/vim-expand-region'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'vim-scripts/ReplaceWithRegister'
NeoBundle 'kana/vim-operator-user'
NeoBundle 'haya14busa/vim-operator-flashy'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-eunuch'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tpope/vim-vinegar'
NeoBundle 'Shougo/vimproc.vim', {'build' : 'make'}
NeoBundle 'Shougo/unite.vim', {'depends': 'neomru.vim', 'lazy': 1}
NeoBundle 'Shougo/neomru.vim', {'lazy': 1}

call neobundle#end()
filetype plugin indent on
NeoBundleCheck

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

" Case sensitivity
set ignorecase
set smartcase

" Center search result
set scrolloff=999

" Line numbers
augroup active_relative_number
  au!
  au BufEnter * :setlocal number relativenumber
  au WinEnter * :setlocal number relativenumber
  au FocusGained * :setlocal number relativenumber
  au BufLeave * :setlocal norelativenumber
  au WinLeave * :setlocal norelativenumber
  au FocusLost * :setlocal norelativenumber
augroup END

" Open new split panes more naturally
set splitbelow
set splitright

" Highlight current line and column
set cursorline
set cursorcolumn
autocmd WinEnter    * set cursorline
autocmd WinLeave    * set nocursorline
autocmd InsertEnter * set nocursorline
autocmd InsertLeave * set cursorline
autocmd WinEnter    * set cursorcolumn
autocmd WinLeave    * set nocursorcolumn
autocmd InsertEnter * set nocursorcolumn
autocmd InsertLeave * set cursorcolumn

" Disable swap files
set noswapfile

" Show column guideline @ column #80
set colorcolumn=80
set cc=80

" Disable Neovim welcome message
set shortmess=atTiOI

" Remember undo tree
set undodir=~/.config/nvim/temp/undodir
set undolevels=100
set undofile

" Make '.' count as a word boundary
set iskeyword-=.

" Change cursor shape depending on mode
" let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
if &term =~ "xterm\\|rxvt"
  " use an orange cursor in insert mode
  let &t_SI = "\<Esc>]12;orange\x7"
  " use a red cursor otherwise
  let &t_EI = "\<Esc>]12;red\x7"
  silent !echo -ne "\033]12;red\007"
  " reset cursor when vim exits
  autocmd VimLeave * silent !echo -ne "\033]112\007"
  " use \003]12;gray\007 for gnome-terminal
endif

" Remember cursor position
autocmd BufReadPost *
   \ if line("'\"") > 0 && line("'\"") <= line("$") |
   \   exe "normal! g`\"" |
   \ endif

" Automatically write on focus lost
au FocusLost,WinLeave * :silent! wa

" Automatically read on focus gained
au FocusGained,BufEnter * :silent! !

" Ensure splits have equal width on resize
au VimResized * :wincmd =

" Disable automatic comment insertion
au FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Automatically close quick fix window if it's the last window open
aug QFClose
  au!
  au WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&buftype") == "quickfix"|q|endif
aug END

" Leader key
let mapleader = "\<Space>"

" Centre screen after navigating
nnoremap } }zz
nnoremap { {zz

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
nmap <Leader>p :set paste<CR>"+p<ESC>:set nopaste<CR>
nmap <Leader>P :set paste<CR>"+P<ESC>:set nopaste<CR>

" Convinent key-binding to write file
nnoremap <Leader>w :w<CR>

" Select word under cursor
nnoremap * *N

" Convinent key-binding to remove search matches highlighting
map <esc> :nohl<CR>

" Disable Ex Mode key-binding
noremap Q <NOP>

" Disable vw and viw in favour of v
nmap vw <NOP>
nmap viw <NOP>

" Quicker scrolling
nnoremap <C-e> 8<C-e>
nnoremap <C-y> 8<C-y>

" Convinent key-binding to select just-pasted text
nmap <Leader>v `[v`]

" Convinent key-binding to fix document indentation
map <F2> mzgg=G`z

" (Experimental) Convinent key-binding to fix basic ESLint errors
map <F3> :EsLintFix<CR>:Neomake<CR>

" ..........................................................
" ...................................................Plugins

" scrooloose/nerdtree
nmap <Leader>f :NERDTreeToggle<Enter>
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" autocmd StdinReadPre * let s:std_in=1

" mxw/vim-jsx
let g:jsx_ext_required = 0

" vim-airline/vim-airline
set laststatus=2
set noshowmode
" let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts = 1
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_section_z = '%3p%%'
let g:airline_section_y = ''
let g:airline_section_b = ''
let g:airline_mode_map = {
  \ '__' : '-',
  \ 'n'  : 'N',
  \ 'i'  : 'I',
  \ 'R'  : 'R',
  \ 'c'  : 'C',
  \ 'v'  : 'V',
  \ 'V'  : 'V',
  \ '' : 'V',
  \ 's'  : 'S',
  \ 'S'  : 'S',
  \ '' : 'S',
  \ }
" junegunn/vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" ternjs/tern_for_vim
" set completeopt-=preview
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
let g:tern_show_argument_hints = 'on_hold'
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = 0

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
let g:neomake_open_list = 2
nmap <Leader><e>n :lnext<CR>
" let g:neomake_verbose = 3

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

" ctrlpvim/ctrlp.vim
nnoremap <Leader>o :CtrlP<CR>
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" dhruvasagar/vim-table-mode
let g:table_mode_corner="|"

" rcmdnk/vim-markdown
let g:vim_markdown_folding_disabled = 1

" SirVer/ultisnips
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<s-c-j>"
let g:UltiSnipsSnippetDirectories=['snips']

" othree/javascript-libraries-syntax.vim
let g:used_javascript_libs = 'react'

" mhinz/vim-startify
autocmd User Startified setlocal buftype=
function! s:center_header(lines) abort
  let longest_line   = max(map(copy(a:lines), 'len(v:val)'))
  let centered_lines = map(copy(a:lines), 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
  return centered_lines
endfunction
let g:startify_list_order = [  ['Current Dir: '.getcwd()], 'dir' ]
let g:startify_enable_special         = 0
let g:startify_change_to_dir          = 0
let g:startify_custom_indices = map(range(1,100), 'string(v:val)')
let g:startify_custom_header =
  \ s:center_header(split(system('echo Welcome to Neovim.\\n\\n\"As a guiding principle, life shrinks and life expands in direct\\n proportion to your willingness to assume risk.\" - Casey Neistat\\n'), '\n'))
hi StartifyHeader ctermfg=5 ctermbg=0 cterm=italic

" mattn/emmet-vim
imap <C-E> <C-Y>,

" Raimondi/delimitMate
let delimitMate_expand_cr = 1

" Shougo/deoplete.nvim
let g:deoplete#enable_at_startup = 1

" Shugo/Unite
let g:unite_enable_start_insert = 1
nnoremap <C-f> :Unite -no-split grep:.<cr>
nnoremap <C-p> :Unite -no-split file_rec/async<cr>
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  let b:SuperTabDisabled=1
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
  nmap <buffer> <ESC> <Plug>(unite_exit)
endfunction
call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
  \ 'ignore_pattern', join([
  \ '\.git/',
  \ ], '\|'))
