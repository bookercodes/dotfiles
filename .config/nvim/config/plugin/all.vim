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

if neobundle#is_installed('vim-airline')
  set laststatus=2
  set noshowmode
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#fnamemod = ':t'
  let g:airline_powerline_fonts = 1
  let g:airline_left_sep=''
  let g:airline_right_sep=''
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''
  let g:airline_section_z = '%3p%%'
  let g:airline_section_y = ''
  let g:airline_section_b = ''
  let g:airline_mode_map = {
        \ '__' : '-',
        \ 'n'  : 'N',
        \ 'i'  : 'I',
        \ 'R'  : 'R',
        \ 'c'  : 'C',
        \ 'v'  : 'V',
        \ 'V'  : 'V',
        \ '' : 'V',
        \ 's'  : 'S',
        \ 'S'  : 'S',
        \ '' : 'S',
        \ }
endif

