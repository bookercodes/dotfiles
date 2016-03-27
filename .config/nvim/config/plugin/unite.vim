let g:unite_enable_auto_select = 1

call unite#custom#profile('default', 'context', {
  \   'start_insert': 1,
  \   'prompt' : 'λ: ',
  \ })

call unite#custom#profile('navigate,source/grep,source/tag', 'context', {
  \   'silent': 1,
  \   'start_insert': 0,
  \   'winheight': 20,
  \   'no_empty': 1,
  \ })
