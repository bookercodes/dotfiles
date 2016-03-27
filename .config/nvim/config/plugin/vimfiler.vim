let g:vimfiler_as_default_explorer = 1
call vimfiler#custom#profile('default', 'context', {
      \  'safe': 0,
      \  'explorer': 1,
      \  'winwidth': 25,
      \  'split': 1,
      \  'direction': 'topleft',
      \  'auto_expand': 1,
      \  'no_quit': 1,
      \  'force_hide': 1,
      \  'parent': 0,
      \  'toggle': 1,
      \ })
