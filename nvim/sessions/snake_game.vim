let SessionLoad = 1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/Desktop/random/rust/snake_game
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +1 src/main.rs
argglobal
%argdel
$argadd src/main.rs
edit src/main.rs
set splitbelow splitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=20
setlocal fml=1
setlocal fdn=20
setlocal fen
43
normal! zo
45
normal! zo
59
normal! zo
62
normal! zo
72
normal! zo
74
normal! zo
95
normal! zo
99
normal! zo
106
normal! zo
107
normal! zo
108
normal! zo
129
normal! zo
141
normal! zo
144
normal! zo
145
normal! zo
150
normal! zo
155
normal! zo
160
normal! zo
187
normal! zo
195
normal! zo
196
normal! zo
202
normal! zo
209
normal! zo
210
normal! zo
211
normal! zo
222
normal! zo
223
normal! zo
224
normal! zo
234
normal! zo
235
normal! zo
236
normal! zo
264
normal! zo
270
normal! zo
283
normal! zo
285
normal! zo
288
normal! zo
289
normal! zo
311
normal! zo
314
normal! zo
317
normal! zo
333
normal! zo
let s:l = 179 - ((16 * winheight(0) + 20) / 41)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
179
normal! 064|
tabnext 1
if exists('s:wipebuf') && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 winminheight=1 winminwidth=1 shortmess=filnxtToOFc
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
