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
