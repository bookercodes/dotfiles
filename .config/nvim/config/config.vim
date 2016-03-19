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
autocmd WinEnter    * set cc=80
autocmd WinLeave    * set cc=

" Disable Neovim welcome message
set shortmess=atTiOI

" Remember undo tree
set undodir=~/.config/nvim/undodir
set undolevels=100
set undofile

" Make '.' count as a word boundary
set iskeyword-=.

" Change cursor shape depending on mode
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

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

" Omnifunc
augroup omnifuncs
  autocmd!
  autocmd FileType javascript setlocal omnifunc=tern#Complete
augroup end

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
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
  exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
  exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('gitconfig', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('bashrc', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('bashprofile', 'Gray', 'none', '#686868', '#151515')

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
