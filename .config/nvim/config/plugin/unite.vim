let g:unite_enable_auto_select = 1

call unite#custom#profile('default', 'context', {
      \   'start_insert': 1,
      \   'no_split': 1,
      \   'prompt' : '→ ',
      \ })

call unite#custom#profile('navigate,source/grep,source/tag', 'context', {
      \   'start_insert': 0,
      \ })

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

function! s:apply_unite_win_settings()
  imap <silent><buffer> <C-j> <Plug>(unite_select_next_line)
  imap <silent><buffer> <C-k> <Plug>(unite_select_previous_line)
  " Attempt to unbind c-l and c-k so TmuxNavigator can use them...
  " silent! nunmap <buffer> <C-l>
  " silent! nunmap <buffer> <C-k>
endfunction
autocmd FileType unite call s:apply_unite_win_settings()
