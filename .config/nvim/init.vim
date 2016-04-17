function! s:init_neobundle()
  if (!isdirectory(expand("$HOME/.config/nvim/bundle/neobundle.vim")))
    echo 'Downloading NeoBundle. Please wait...'
    call system(expand("mkdir -p $HOME/.config/nvim/bundle"))
    call system(expand("git clone https://github.com/Shougo/neobundle.vim ~/.config/nvim/bundle/neobundle.vim"))
    echo 'NeoBundle has been downloaded...'
  endif
  if has('vim_starting')
    set runtimepath+=/home/booker/.config/nvim/bundle/neobundle.vim/
  endif
  call neobundle#begin()
  NeoBundleFetch 'Shougo/neobundle.vim'
  source ~/.config/nvim/bundle.vim
  call neobundle#end()
  NeoBundleCheck
endfunction
call s:init_neobundle()

let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
filetype plugin indent on
let base16colorspace=256
syntax enable
colorscheme base16-gooey
set background=dark

set number
set relativenumber
set tabstop=2
set expandtab
set shiftwidth=2
set noswapfile
set cc=79
set undofile
set undodir=~/.config/nvim/temp/undodir
set completeopt-=preview

autocmd FileType help wincmd L
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
au FocusGained,BufEnter * :silent! !
au VimResized * :wincmd =

" let g:VimuxRunnerType = "window"
let test#strategy = 'vimux'

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
" let g:neomake_verbose = 3

hi Search cterm=NONE ctermfg=Black ctermbg=Yellow

" autocmd FileType qf hi Search cterm=NONE ctermfg=grey ctermbg=Black
 
source ~/.config/nvim/config/plugin/all.vim
source ~/.config/nvim/config/bindings.vim

let test#javascript#mocha#executable = 'npm run test'
set clipboard^=unnamed
aug QFClose
  au!
  au WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&buftype") == "quickfix"|q|endif
aug END
