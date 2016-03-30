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
syntax enable
if neobundle#is_installed('vim-gotham')
  colorscheme gotham
endif

set number
set relativenumber
set tabstop=2
set expandtab
set shiftwidth=2
set noswapfile
set cc=79
set undofile
set undodir=~/.config/nvim/temp/undodir

autocmd FileType help wincmd L
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
au FocusGained,BufEnter * :silent! !

source ~/.config/nvim/config/plugin/all.vim
source ~/.config/nvim/config/bindings.vim

