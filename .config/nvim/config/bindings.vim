let mapleader = "\<Space>"

noremap Q q
nnoremap gQ <Nop>:

noremap <expr> <C-e> (line("w$") >= line('$') ? "j" : "3\<C-e>")
noremap <expr> <C-y> (line("w0") <= 1         ? "k" : "3\<C-y>")

nnoremap * *N
nnoremap J mzJ`z
nnoremap <Leader>w :w<CR>
nnoremap coh :nohl<CR>
nnoremap n nzz

nmap gp `[v`]
nmap s [Window]
nnoremap <silent> [Window]p :<C-u>vsplit<CR>:wincmd w<CR>
noremap <silent><expr> q winnr('$') != 1 ? ':<C-u>close<CR>' : ""
nnoremap <silent> <Tab> :wincmd w<CR>

autocmd FileType vim nnoremap <F5> :so ~/.config/nvim/init.vim<CR>

nnoremap <Down> :m .+1<CR>==
nnoremap <Up> :m .-2<CR>==
