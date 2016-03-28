if neobundle#tap('unite.vim')
  nmap \ [unite]
  nnoremap <silent> [unite]r :UniteResume -no-start-insert -force-redraw<CR>
  nnoremap <silent> [unite]g :Unite grep:.<cr>
  nnoremap <silent> [unite]f :Unite file_rec/async<CR>
  nnoremap <silent> [unite]e :VimFiler<cr>
  let neobundle#hooks.on_source = '~/.config/nvim/config/plugin/unite.vim'
  call neobundle#untap()
endif

if neobundle#tap('vimfiler.vim')
  let neobundle#hooks.on_source = '~/.config/nvim/config/plugin/vimfiler.vim'
  call neobundle#untap()
endif

if neobundle#is_installed('vim-jsx')
  let g:jsx_ext_required = 0
endif

if neobundle#is_installed('vim-gitgutter')
  let g:gitgutter_sign_column_always = 1
  set updatetime=250
  let g:gitgutter_sign_added = '▎'
  let g:gitgutter_sign_modified = '▎'
  let g:gitgutter_sign_removed= '▎'
endif

if neobundle#is_installed('delimitMate')
  let delimitMate_expand_cr = 1
endif

