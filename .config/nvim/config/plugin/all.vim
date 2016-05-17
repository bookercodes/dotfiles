if neobundle#tap('unite.vim')
  nmap \ [unite]
  nnoremap <silent> [unite]r :UniteResume -no-start-insert -force-redraw<CR>
  nnoremap <silent> [unite]g :Unite grep:.<cr>
  nnoremap <silent> [unite]f :Unite file_rec/async<CR>
  nnoremap <silent> [unite]e :VimFiler -find<cr>
  let neobundle#hooks.on_source = '~/.config/nvim/config/plugin/unite.vim'
  call neobundle#untap()
endif

if neobundle#tap('vimfiler.vim')
  let neobundle#hooks.on_source = '~/.config/nvim/config/plugin/vimfiler.vim'
  call neobundle#untap()
endif

if neobundle#tap('deoplete.nvim') && has('nvim') "{{{
  let g:deoplete#enable_at_startup = 1
  let neobundle#hooks.on_source = '~/.config/nvim/config/plugin/deoplete.vim'
  call neobundle#untap()
endif

if neobundle#is_installed('vim-table-mode')
  let g:table_mode_corner="|"
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

if neobundle#is_installed('vim-markdown')
  let g:vim_markdown_folding_disabled = 1
endif

if neobundle#is_installed('ultisnips')
  let g:UltiSnipsExpandTrigger="<c-k>"
  let g:UltiSnipsJumpForwardTrigger="<c-k>"
  let g:UltiSnipsJumpBackwardTrigger="<s-c-j>"
  let g:UltiSnipsSnippetDirectories=['snips']
endif


if neobundle#is_installed('vim-airline')
  set laststatus=2
  set noshowmode
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

if neobundle#is_installed('neomake')
  function! ResolveESLint()
    let l:npm_bin = ''
    let l:eslint = 'eslint'
    if executable('npm')
      let l:npm_bin = split(system('npm bin'), '\n')[0]
    endif
    if strlen(l:npm_bin) && executable(l:npm_bin . '/eslint')
      let l:eslint = l:npm_bin . '/eslint'
    endif
    let b:neomake_javascript_eslint_exe = l:eslint
  endfunction
  autocmd FileType javascript :call ResolveESLint()
  autocmd! BufWritePost,BufReadPost * Neomake
  let g:neomake_javascript_enabled_makers = ['eslint']
  let g:neomake_warning_sign = {
        \ 'text': 'W',
        \ 'texthl': 'WarningMsg',
        \ }
  let g:neomake_error_sign = {
        \ 'text': 'E',
        \ 'texthl': 'ErrorMsg',
        \ }
  let g:neomake_open_list = 2
endif
