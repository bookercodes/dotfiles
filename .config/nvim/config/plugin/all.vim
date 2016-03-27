if neobundle#tap('unite.vim')
  nmap \ [unite]
  nnoremap <silent> [unite]r :UniteResume -no-start-insert -force-redraw<CR>
  nnoremap <silent> [unite]g :Unite -no-split grep:.<cr>
  nnoremap <silent> [unite]f :Unite -no-split file_rec/async<CR>
  nnoremap <silent> [unite]e :VimFiler<cr>
  let neobundle#hooks.on_source = '~/.config/nvim/config/plugin/unite.vim'
  if executable('ag')
    let s:custom_ag_ignore_arguments= [
          \ '--ignore',
          \ 'node_modules',
          \ '--ignore',
          \ '.git'
          \ ]
    let g:unite_source_rec_async_command = [
          \ 'ag',
          \ '--follow',
          \ '--nocolor',
          \ '--nogroup',
          \ '--hidden',
          \ '--ignore-case',
          \ '-g',
          \ ''
          \ ] + s:custom_ag_ignore_arguments
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts = join([
          \ '--nogroup',
          \ '--vimgrep',
          \ '--nocolor',
          \ '--ignore-case'
          \ ] + s:custom_ag_ignore_arguments)
  endif

  function! s:unite_settings()
    imap <silent><buffer> <C-j> <Plug>(unite_select_next_line)
    imap <silent><buffer> <C-k> <Plug>(unite_select_previous_line)
  endfunction
  autocmd FileType unite call s:unite_settings()

  call neobundle#untap()
endif

if neobundle#tap('vimfiler.vim')
  let neobundle#hooks.on_source = '~/.config/nvim/config/plugin/vimfiler.vim'
  call neobundle#untap()
endif
