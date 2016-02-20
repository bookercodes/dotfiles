if has('vim_starting')
	set runtimepath+=/home/booker/.config/nvim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('/home/booker/.config/nvim/bundle'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'easymotion/vim-easymotion'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'terryma/vim-expand-region'
NeoBundle 'mhinz/vim-grepper'
NeoBundle 'kien/rainbow_parentheses.vim'
NeoBundleLazy 'mattn/emmet-vim', { 'on_ft': ['html','javascript'] }
NeoBundleLazy 'benekastah/neomake', {'on_cmd': ['Neomake']}
NeoBundleLazy 'Shougo/deoplete.nvim', { 'on_i': 1 }
NeoBundleLazy 'wellle/tmux-complete.vim', { 'on_i': 1 }
NeoBundleLazy 'jiangmiao/auto-pairs', { 'on_i': 1 }
NeoBundleLazy 'othree/yajs.vim', {'on_ft': 'javascript'}
NeoBundleLazy 'millermedeiros/vim-esformatter', { 'on_cmd': ['EsFormatter'] }
NeoBundleLazy 'othree/html5.vim', {'on_ft': 'html'}
NeoBundleLazy 'othree/es.next.syntax.vim', {'on_ft': 'javascript'}
NeoBundleLazy 'pangloss/vim-javascript', {'on_ft': 'javascript'}
NeoBundleLazy 'moll/vim-node', {'on_ft': 'javascript'}
NeoBundleLazy 'tmux-plugins/vim-tmux', {'on_ft': 'tmux'}
NeoBundleLazy 'mxw/vim-jsx', {'on_ft': 'javascript'}
NeoBundleLazy 'ternjs/tern_for_vim', {
  \ 'build': {'others': 'npm install'},
  \ 'disabled': ! executable('npm'),
  \ 'on_i': 1,
  \ 'on_ft': 'javascript'
  \ }
NeoBundleLazy 'rcmdnk/vim-markdown', {
  \ 'depends': ['godlygeek/tabular'],
  \ 'on_ft': 'markdown'
  \ }
NeoBundleLazy 'mattn/gist-vim', {
  \ 'depends': 'mattn/webapi-vim',
  \ 'on_cmd': ['Gist']
  \ }
NeoBundleLazy 'Shougo/neosnippet.vim', {
  \ 'depends': ['Shougo/neosnippet-snippets'],
  \ 'on_i': 1,
  \ 'on_ft': 'snippet'
  \ }

call neobundle#end()
filetype plugin indent on
NeoBundleCheck

