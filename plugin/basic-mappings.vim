scriptencoding utf-8
nnoremap i :call arctgx#arctgx#insertWithInitialIndentation('i')<CR>
nnoremap a :call arctgx#arctgx#insertWithInitialIndentation('a')<CR>
xnoremap <C-Insert> "*y
inoremap <C-q> <C-r>+
noremap <S-Insert> <MiddleMouse>
noremap! <S-Insert> <MiddleMouse>
tnoremap <S-Insert> <C-\><C-N>"*pi
tnoremap <expr> <M-p> '<C-\><C-N>"'.nr2char(getchar()).'pi'
nnoremap <Tab> <C-w>w
nnoremap <C-Tab> :tabNext<CR>
inoremap <C-Tab> <C-o>:tabNext<CR>
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

nnoremap <silent> <A-Up> :wincmd k<CR>
nnoremap <silent> <A-Down> :wincmd j<CR>
nnoremap <silent> <A-Left> :wincmd h<CR>
nnoremap <silent> <A-Right> :wincmd l<CR>

nnoremap g<Left> <C-o>
nnoremap g<Right> <C-^>

inoremap <silent> <A-Up> <C-o>:wincmd k<CR>
inoremap <silent> <A-Down> <C-o>:wincmd j<CR>
inoremap <silent> <A-Left> <C-o>:wincmd h<CR>
inoremap <silent> <A-Right> <C-o>:wincmd l<CR>
inoremap <Insert> <Nop>
noremap Q <Nop>
inoremap <F2> <C-o>:update<CR>
noremap <F2> <ESC>:update<CR>
noremap <F3> <ESC>:q<CR>
inoremap <F3> <C-o>:q<CR>
noremap <S-F3> <ESC>:q!<CR>
noremap <F15> <ESC>:q!<CR>
inoremap <S-F3> <C-o>:q!<CR>
inoremap <F15> <C-o>:q!<CR>
inoremap <C-Left> <C-o>b
inoremap <C-Right> <C-o>w
inoremap <S-Right> <C-o>v
inoremap <S-Left> <C-o>v
noremap <S-Up> <C-y>
noremap <S-Down> <C-e>
inoremap <C-z> <C-x><C-o>
noremap ]q :cnext<CR>
noremap [q :cprev<CR>
noremap <Leader>co :copen<CR>
noremap / /\c
noremap <Leader>/ /
noremap ? ?\c
nnoremap <Leader>= ggVG=
nnoremap <Leader>hls :let @/ = ''<CR>
noremap zDDD zD
noremap zddd zd
noremap zEEE zE
noremap zD <Nop>
noremap zd <Nop>
noremap zE <Nop>
nmap <silent> <Leader>` <Plug>(jump-last-tab)
set pastetoggle=<Nop>
