if has('vim_starting')
  set runtimepath+=/home/booker/.config/nvim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('/home/booker/.config/nvim/bundle'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'moll/vim-node'
NeoBundle 'ntpeters/vim-better-whitespace'
NeoBundle 'othree/html5.vim'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'tmux-plugins/vim-tmux'
NeoBundle 'christoomey/vim-tmux-navigator'
NeoBundle 'wellle/tmux-complete.vim'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'benekastah/neomake'
NeoBundle 'ternjs/tern_for_vim', {
  \ 'build': {'others': 'npm install'},
  \ 'disabled': ! executable('npm'),
  \ }
NeoBundle 'rcmdnk/vim-markdown', {
  \ 'depends': ['godlygeek/tabular'],
  \ }
NeoBundle 'mattn/gist-vim', {
  \ 'depends': 'mattn/webapi-vim'
  \ }

NeoBundle 'othree/javascript-libraries-syntax.vim'
NeoBundle 'mxw/vim-jsx'
NeoBundle 'othree/es.next.syntax.vim'
NeoBundle 'othree/yajs.vim'
NeoBundle 'gavocanov/vim-js-indent'

" NeoBundle 'tmux-plugins/vim-tmux-focus-events'
NeoBundle 'tpope/vim-eunuch'
NeoBundle 'briancollins/vim-jst'
NeoBundle 'Xuyuanp/nerdtree-git-plugin'
NeoBundle 'ryanoasis/vim-devicons'
NeoBundle 'mhinz/vim-startify'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'vim-scripts/camelcasemotion'
NeoBundle 'alexbooker/vim-eslint-fix'
NeoBundle 'terryma/vim-expand-region'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'vim-scripts/ReplaceWithRegister'
NeoBundle 'dhruvasagar/vim-table-mode'
NeoBundle 'shime/vim-livedown'
NeoBundle 'tpope/vim-vinegar'
NeoBundle 'haya14busa/vim-operator-flashy', {
  \ 'depends': ['kana/vim-operator-user']
  \}

call neobundle#end()
filetype plugin indent on
NeoBundleCheck

