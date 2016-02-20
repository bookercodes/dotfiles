if has('vim_starting')
	set runtimepath+=/home/booker/.config/nvim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('/home/booker/.config/nvim/bundle'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'wellle/tmux-complete.vim' " Make Omnicomplete aware of adjacent tmux panes
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'easymotion/vim-easymotion'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'godlygeek/tabular'        " Required dependency of vim-markdown
NeoBundle 'millermedeiros/vim-esformatter'
NeoBundle 'mattn/emmet-vim'

NeoBundleLazy 'mattn/gist-vim', {
  \ 'depends': 'mattn/webapi-vim',
  \ 'on_cmd': ['Gist']
  \ }

" NeoBundle 'mattn/webapi-vim'         " Required dependency of gist-vim
" NeoBundle 'mattn/gist-vim'

NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'tpope/vim-fugitive'       " Required dependency of vim-airline
NeoBundle 'terryma/vim-expand-region'
NeoBundle 'mhinz/vim-grepper'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'kien/rainbow_parentheses.vim'

NeoBundleLazy 'benekastah/neomake', {'on_cmd': ['Neomake']}
NeoBundleLazy 'Shougo/deoplete.nvim', { 'on_i': 1 }
NeoBundleLazy 'Shougo/neosnippet.vim', {
  \ 'depends': ['Shougo/neosnippet-snippets'],
  \ 'on_i': 1,
  \ 'on_ft': 'snippet'
  \ }
NeoBundleLazy 'othree/yajs.vim', {'on_ft': 'javascript'}
NeoBundleLazy 'othree/html5.vim', {'on_ft': 'html'}
NeoBundleLazy 'othree/es.next.syntax.vim', {'on_ft': 'javascript'}
NeoBundleLazy 'pangloss/vim-javascript', {'on_ft': 'javascript'} " Augments yajs.vim
NeoBundleLazy 'moll/vim-node', {'on_ft': 'javascript'}
NeoBundleLazy 'tmux-plugins/vim-tmux', {'on_ft': 'tmux'}
NeoBundleLazy 'mxw/vim-jsx', {'on_ft': 'javascript'}
NeoBundleLazy 'rcmdnk/vim-markdown', {'on_ft': 'markdown'}
NeoBundleLazy 'ternjs/tern_for_vim', {
  \ 'build': {'others': 'npm install'},
  \ 'disabled': ! executable('npm'),
  \ 'on_i': 1,
  \ 'on_ft': 'javascript'
  \ }

call neobundle#end()
filetype plugin indent on
NeoBundleCheck

