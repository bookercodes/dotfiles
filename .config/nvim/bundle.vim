" General
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tpope/vim-eunuch'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'airblade/vim-gitgutter'
NeoBundleLazy 'benekastah/neomake', {'on_cmd': 'Neomake'}
NeoBundle 'christoomey/vim-tmux-navigator'
NeoBundleLazy 'Raimondi/delimitMate', {'on_i': 1}
NeoBundleLazy 'Shougo/deoplete.nvim', { 'on_i': 1 }

" Unite
NeoBundle     'Shougo/vimproc.vim', { 'build' : 'make' }
NeoBundleLazy 'Shougo/unite.vim', { 'on_cmd': 'Unite' }
NeoBundleLazy 'Shougo/vimfiler.vim', { 'depends': 'Shougo/unite.vim', }

" JavaScript
NeoBundle 'moll/vim-node'
NeoBundleLazy 'mxw/vim-jsx', {'on_ft': 'javascript'}
NeoBundleLazy 'othree/yajs.vim', {'on_ft': 'javascript'}
NeoBundleLazy 'othree/es.next.syntax.vim', {'on_ft': 'javascript'}
NeoBundleLazy 'gavocanov/vim-js-indent', {'on_ft': 'javascript'}
NeoBundleLazy 'carlitux/deoplete-ternjs', { 'on_ft': 'javascript', 'on_i': 1 }

" Markdown
NeoBundleLazy 'plasticboy/vim-markdown', {'on_ft': 'markdown'}
NeoBundleLazy 'dhruvasagar/vim-table-mode', {'on_ft': 'markdown'}
NeoBundleLazy 'junegunn/goyo.vim', {'on_cmd': 'Goyo'}

" Syntax
NeoBundleLazy 'tmux-plugins/vim-tmux', {'on_ft': 'tmux'}
