if (!isdirectory(expand("$HOME/.config/nvim/repos/github.com/Shougo/dein.vim")))
  call system(expand("mkdir -p $HOME/.config/nvim/repos/github.com"))
  call system(expand("git clone https://github.com/Shougo/dein.vim $HOME/.config/nvim/repos/github.com/Shougo/dein.vim"))
endif
set runtimepath+=~/.config/nvim/repos/github.com/Shougo/dein.vim/

call dein#begin(expand('~/.config/nvim'))

call dein#add('Shougo/dein.vim')

call dein#add('Shougo/deoplete.nvim')
call dein#add('wellle/tmux-complete.vim')
call dein#add('carlitux/deoplete-ternjs')
call dein#add('othree/yajs.vim')
call dein#add('othree/es.next.syntax.vim')
call dein#add('gavocanov/vim-js-indent')
call dein#add('mxw/vim-jsx')
call dein#add('moll/vim-node')
call dein#add('ternjs/tern_for_vim', {
  \ 'build': {'others': 'npm install'},
  \ 'if': 'executable("npm")',
  \ })
call dein#add('tmux-plugins/vim-tmux', {
 \ 'on_ft': 'tmux'
 \ })
call dein#add('othree/html5.vim', {
  \ 'on_ft': 'html'
  \ })
call dein#add('ntpeters/vim-better-whitespace')
call dein#add('ctrlpvim/ctrlp.vim')
call dein#add('christoomey/vim-tmux-navigator')
call dein#add('airblade/vim-gitgutter')
call dein#add('scrooloose/nerdtree')
call dein#add('junegunn/vim-easy-align')
call dein#add('mattn/emmet-vim')
call dein#add('benekastah/neomake')
call dein#add('briancollins/vim-jst', {
 \ 'on_ft': 'jst'
 \ })
call dein#add('ryanoasis/vim-devicons')
call dein#add('mhinz/vim-startify')
call dein#add('vim-airline/vim-airline')
call dein#add('SirVer/ultisnips')
call dein#add('vim-scripts/camelcasemotion')
call dein#add('terryma/vim-expand-region')
call dein#add('Raimondi/delimitMate', {
 \ 'on_i': 1
 \ })
call dein#add('vim-scripts/ReplaceWithRegister')
call dein#add('kana/vim-operator-user')
call dein#add('haya14busa/vim-operator-flashy')
call dein#add('tpope/vim-commentary')
call dein#add('tpope/vim-surround')
call dein#add('tpope/vim-repeat')
call dein#add('tpope/vim-eunuch')
call dein#add('tpope/vim-fugitive')
call dein#add('tpope/vim-unimpaired')
call dein#add('tpope/vim-vinegar')

if dein#check_install()
  call dein#install()
endif
call dein#end()
filetype plugin indent on
