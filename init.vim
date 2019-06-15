call plug#begin('~/.config/nvim/plugged')
Plug 'w0rp/ale' "Linting
Plug 'ErichDonGubler/vim-sublime-monokai' "Kalutero isws sublime
Plug 'pangloss/vim-javascript' "Javascript
Plug 'scrooloose/nerdtree' " File manager
Plug 'Valloric/YouCompleteMe' " autocomplete
Plug 'itchyny/lightline.vim' " Status bar
Plug 'mengelbrecht/lightline-bufferline' " bufferline
Plug 'jiangmiao/auto-pairs' " Auto pairs
Plug 'scrooloose/nerdcommenter' " Smart comments
Plug 'tpope/vim-surround' " Surround everything
Plug 'mattn/emmet-vim'  " html help
Plug 'rust-lang/rust.vim' " rust lang
Plug 'ctrlpvim/ctrlp.vim' " vim fuzzy finder
call plug#end()

map <C-n> :NERDTreeToggle<CR>
let g:lightline = {'colorscheme': 'molokai'}
let g:ycm_global_ycm_extra_conf='/home/kwstas/.config/nvim/plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
let g:user_emmet_leader_key=',' " new leader for emmet
"---------CtrlP----------
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.d,*.o,*.bin,*.sh,*.svg,*.mkv,*.png,*.mkv,*.avi,*.mp4,*.iso

" Lightline-Bufferline
set showtabline=1
let g:lightline.tabline = {'left': [['buffers']], 'right': [['close']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type = {'buffers': 'tabsel'}
let g:lightline#bufferline#show_number  = 2
let g:lightline#bufferline#min_buffer_count = 2
nmap ,1 <Plug>lightline#bufferline#go(1)
nmap ,2 <Plug>lightline#bufferline#go(2)
nmap ,3 <Plug>lightline#bufferline#go(3)
nmap ,4 <Plug>lightline#bufferline#go(4)
nmap ,5 <Plug>lightline#bufferline#go(5)
nmap ,6 <Plug>lightline#bufferline#go(6)
nmap ,7 <Plug>lightline#bufferline#go(7)
nmap ,8 <Plug>lightline#bufferline#go(8)
nmap ,9 <Plug>lightline#bufferline#go(9)
nmap ,0 <Plug>lightline#bufferline#go(10)

"------EDITOR------
let mapleader="," " Set the map leader to ,
set hidden
set nu " Enable line numbers
set relativenumber " Enable relative line numbers
set background=dark " Set the background theme to dark
syntax on " Enable syntax highlighting
colorscheme sublimemonokai " Set the colorscheme
highlight Pmenu guifg=white guibg=dark
set autoindent " Set code autoindentation
set cursorline " Highlight current line
set expandtab " don't use actual tab character (ctrl-v)
set shiftwidth=5 " indenting is 4 spaces
set autoindent " turns it on
set smartindent " does the right thing (mostly) in programs
set cindent " stricter rules for C programs
set splitbelow splitright " Splits open at the bottom and right
set noshowmode " Don't show the indicator in insert mode.
set completeopt=longest,menuone,noselect " Improve completion menu
set undofile
" set whichwrap+=<,>,h,l
let g:clipboard = {
      \   'name': 'myClipboard',
      \   'copy': {
      \      '+': 'xclip',
      \      '*': 'xclip',
      \   },
      \   'paste': {
      \      '+': '+',
      \      '*': '*',
      \   },
      \   'cache_enabled': 1,
      \ }
set clipboard+=unnamedplus,unnamed

" Set the backup/undo/swap files to be in /tmp
set backupdir=/tmp//
set directory=/tmp//
set undodir=/tmp//

set ruler " Always show current position
set ignorecase " Ignore case when searching
set smartcase " Smart Casing
set hlsearch " Highlight search resu:lts
set incsearch " Modern search
set showmatch " Show matching brackets when text indicator is over them

" Set true colors
if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
  set termguicolors
endif

"Wildmode
set wildmenu
set wildmode=list:longest,full

" H and L navigate to start or end of line
nnoremap H ^
vnoremap H ^
nnoremap L $
vnoremap L $

" J and K navigate to start or end of screen
nnoremap K H
vnoremap K H
nnoremap J L
vnoremap J L

nnoremap <C-J> J
nnoremap <F2> K
nnoremap ; :

" Alt+Direction moves 6 spaces.
nnoremap <A-h> 5h
nnoremap <A-j> 5j
nnoremap <A-k> 5k
nnoremap <A-l> 5l
nnoremap <A-,> :1winc > <CR>
nnoremap <A-.> :1winc < <CR>
"===== KEY REMAPS =====

" General Maps
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
autocmd BufWritePre * %s/\s\+$//e  "Strip trailing whitespace on file save
map <C-s> :w<CR>
map <C-e> :bn<CR>

" General commands
autocmd FileType * inoremap ,if if(){<CR><CR>}<Esc>2kf)i
autocmd FileType * inoremap ,for for(int i = 0;;i++){<CR><CR>}<Esc>2kf;a
autocmd FileType * inoremap ,wh while(){<CR><CR>}<Esc>2kf)i
autocmd FileType * nnoremap ,cm I/*<Esc>A*/<Esc>
autocmd FileType * inoremap ,br {<CR>}<Esc>O
autocmd FileType * nnoremap ,o o<ESC>k

" html
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" rust
autocmd BufNewFile,BufRead *.rs set filetype=rust
autocmd FileType rust nnoremap <F5> :w<CR> :!cargo run<CR>

" C Specific
autocmd FileType c nnoremap <F5> :w<CR> :!gcc -ansi -pedantic -Wall -g % -o %:r<CR>
autocmd FileType c nnoremap <F6> :!./%:r<CR>
autocmd FileType c inoremap ,pr printf("");<Esc>F"i
autocmd FileType c inoremap ,inpstr char c;<CR>while(c!=EOF){<CR>c=getchar();<CR>}<Esc>O
autocmd FileType c inoremap ,incl #include <><Esc>i
autocmd FileType c inoremap ,cm <Esc>A/**/
