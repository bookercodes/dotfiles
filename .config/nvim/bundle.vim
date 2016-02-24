if has('vim_starting')
  set runtimepath+=/home/booker/.config/nvim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('/home/booker/.config/nvim/bundle'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'haya14busa/vim-operator-flashy', {
  \ 'depends': ['kana/vim-operator-user']
  \}
NeoBundle 'vim-scripts/camelcasemotion'
NeoBundle 'ntpeters/vim-better-whitespace'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'junegunn/fzf', { 'dir': '~/.fzf' }
NeoBundle 'junegunn/fzf.vim'
NeoBundle 'alexbooker/vim-eslint-fix'
NeoBundle 'othree/yajs.vim'
NeoBundle 'othree/es.next.syntax.vim'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'moll/vim-node'
NeoBundle 'mxw/vim-jsx'
NeoBundle 'ternjs/tern_for_vim', {
  \ 'build': {'others': 'npm install'},
  \ 'disabled': ! executable('npm'),
  \ }
NeoBundle 'othree/html5.vim'
NeoBundle 'tmux-plugins/vim-tmux'
NeoBundle 'christoomey/vim-tmux-navigator'
NeoBundle 'wellle/tmux-complete.vim'
NeoBundle 'Shougo/neosnippet.vim', {
  \ 'depends': ['Shougo/neosnippet-snippets'],
  \ }
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'easymotion/vim-easymotion'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'terryma/vim-expand-region'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'benekastah/neomake'
NeoBundle 'Shougo/deoplete.nvim'
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'vim-airline/vim-airline', {
  \ 'depends': ['tpope/vim-fugitive']
  \}
NeoBundle 'rcmdnk/vim-markdown', {
  \ 'depends': ['godlygeek/tabular'],
  \ }
NeoBundle 'mattn/gist-vim', {
  \ 'depends': 'mattn/webapi-vim'
  \ }

call neobundle#end()
filetype plugin indent on
NeoBundleCheck

