scriptencoding utf-8

for i in range(1, 12)
  execute 'map <F' .. (12 + i) .. '> <S-F' .. i .. '>'
endfor
nnoremap i <Cmd>call arctgx#arctgx#insertWithInitialIndentation('i')<CR>
nnoremap a <Cmd>call arctgx#arctgx#insertWithInitialIndentation('a')<CR>
xnoremap <C-Insert> "*y
xnoremap <C-S-Insert> "+y
inoremap <C-q> <C-r>+
nnoremap <Leader>fcc <Cmd>let @+ = expand('%:.')<CR>
noremap <S-Insert> <MiddleMouse>
noremap! <S-Insert> <MiddleMouse>
tnoremap <S-Insert> <C-\><C-N>"*pi
tnoremap <expr> <M-p> '<C-\><C-N>"' .. nr2char(getchar()) .. 'pi'
nnoremap <Tab> <C-w>w
vnoremap <Tab> <C-w>w
nnoremap <C-Tab> <Cmd>tabNext<CR>
inoremap <C-Tab> <Cmd>tabNext<CR>

nnoremap g<Left> <C-o>
nnoremap g<Right> <C-^>

noremap <silent> <A-Up> <Cmd>wincmd k<CR>
noremap <silent> <A-Down> <Cmd>wincmd j<CR>
noremap <silent> <A-Left> <Cmd>wincmd h<CR>
noremap <silent> <A-Right> <Cmd>wincmd l<CR>
inoremap <silent> <A-Up> <Cmd>wincmd k<CR>
inoremap <silent> <A-Down> <Cmd>wincmd j<CR>
inoremap <silent> <A-Left> <Cmd>wincmd h<CR>
inoremap <silent> <A-Right> <Cmd>wincmd l<CR>
inoremap <Insert> <Nop>
cmap <C-BS> <C-w>
inoremap <C-BS> <Cmd>normal db<CR>
inoremap <C-Del> <Cmd>normal dw<CR>
cnoremap <C-Del> <S-Right><C-w>
noremap Q <Nop>
inoremap <F2> <Cmd>update<CR>
noremap <F2> <Cmd>update<CR>
noremap <F3> <Cmd>quit<CR>
inoremap <F3> <Cmd>quit<CR>
noremap <S-F3> <Cmd>quit!<CR>
noremap <F15> <Cmd>quit!<CR>
inoremap <S-F3> <Cmd>quit!<CR>
inoremap <F15> <Cmd>quit!<CR>
inoremap <C-Left> <Cmd>normal b<CR>
inoremap <C-Right> <Cmd>normal w<CR>
inoremap <S-Right> <Cmd>normal v<CR>
inoremap <S-Left> <Cmd>normal v<CR>
noremap <S-Up> <C-y>
noremap <S-Down> <C-e>
inoremap <C-z> <C-x><C-o>
noremap ]q <Cmd>cnext<CR>
noremap [q <Cmd>cprev<CR>
noremap <Leader>co <Cmd>copen<CR>
nnoremap / /\c
noremap <Leader>/ /
nnoremap ? ?\c
nnoremap <Leader>= ggVG=
nnoremap <Leader>hls <Cmd>let @/ = ''<CR>
nmap <silent> <Leader>` <Plug>(jump-last-tab)
set pastetoggle=<Nop>
