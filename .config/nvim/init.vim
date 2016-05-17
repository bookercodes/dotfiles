function! s:install_neobundle()
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
call s:install_neobundle()

let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
filetype plugin indent on
let base16colorspace=256
syntax enable
colorscheme base16-gooey

set background=dark
set number
set clipboard=unnamed
set relativenumber
set tabstop=2
set smartcase
set expandtab
set shiftwidth=2
set noswapfile
set cc=79
set undofile
set undodir=~/.config/nvim/temp/undodir
set completeopt-=preview

source ~/.config/nvim/config/plugin/all.vim
source ~/.config/nvim/config/bindings.vim
source ~/.config/nvim/config/autocmds.vim
