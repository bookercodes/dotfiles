function! s:apply_vimfiler_win_settings()
  setlocal nonumber norelativenumber

  nmap <buffer> e <Plug>(vimfiler_expand_or_edit)
endfunction
autocmd FileType vimfiler call s:apply_vimfiler_win_settings()
