NeoBundleLazy 'Raimondi/delimitMate', {'on_i': 1}
NeoBundle 'christoomey/vim-tmux-navigator'
NeoBundle 'Shougo/vimproc.vim', {'build' : 'make'}
NeoBundle 'airblade/vim-gitgutter'
NeoBundleLazy 'Shougo/unite.vim', {
      \ 'on_cmd': 'Unite'
      \ }
NeoBundleLazy 'Shougo/vimfiler.vim', {
      \ 'depends': 'Shougo/unite.vim',
      \ }
NeoBundle 'whatyouhide/vim-gotham'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tpope/vim-eunuch'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'roman/golden-ratio'
 NeoBundle 'moll/vim-node'
NeoBundleLazy 'mxw/vim-jsx', {'on_ft': 'javascript'}
NeoBundleLazy 'othree/yajs.vim', {'on_ft': 'javascript'}
NeoBundleLazy 'othree/es.next.syntax.vim', {'on_ft': 'javascript'}


NeoBundleLazy 'gavocanov/vim-js-indent', {'on_ft': 'javascript'}
NeoBundle 'kana/vim-operator-user'
NeoBundle 'haya14busa/vim-operator-flashy'
NeoBundleLazy 'haya14busa/vim-operator-flashy', {
      \ 'depends': 'vim-operator-user',
      \ 'on_map': '<Plug>'
      \ }
NeoBundle 'vim-airline/vim-airline'

NeoBundleLazy 'plasticboy/vim-markdown', {'on_ft': 'markdown'}

NeoBundleLazy 'Shougo/deoplete.nvim', { 'on_i': 1 }
NeoBundleLazy 'carlitux/deoplete-ternjs', { 'on_ft': 'javascript', 'on_i': 1 }
NeoBundle 'SirVer/ultisnips'

" NeoBundleLazy 'facebook/vim-flow', {
"       \ 'on_ft': 'javascript',
"       \ 'build': {
"       \     'mac': 'npm install -g flow-bin',
"       \     'unix': 'npm install -g flow-bin'
"       \ }}
