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

source ~/.config/nvim/config/plugin/all.vim

filetype plugin indent on
set number
set relativenumber

syntax enable
" Indentation
set tabstop=2
set expandtab
set shiftwidth=2

autocmd FileType help wincmd L

if neobundle#is_installed('vim-gotham')
  colorscheme gotham
endif
