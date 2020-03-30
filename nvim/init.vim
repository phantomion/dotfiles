"===== PLUGINS =====
"{{{
call plug#begin('~/.config/nvim/plugged')
Plug 'Erichain/vim-monokai-pro' " Kalutero sublime theme
Plug 'srcery-colors/srcery-vim'
Plug 'pangloss/vim-javascript' " If you're 555 then I'm 666
Plug 'neoclide/coc.nvim', {'branch': 'release'} " GET THIS OR DIE
Plug 'itchyny/lightline.vim' " Status bar
Plug 'mengelbrecht/lightline-bufferline' " bufferline
Plug 'jiangmiao/auto-pairs' " Auto pairs
Plug 'scrooloose/nerdcommenter' " Smart comments
Plug 'tpope/vim-surround' " Surround everything
Plug 'rust-lang/rust.vim' " rust lang
Plug 'ctrlpvim/ctrlp.vim' " vim fuzzy finder
Plug 'ryanoasis/vim-devicons' " fancy bloat icons
Plug 'jaxbot/browserlink.vim' " live preview
Plug 'tpope/vim-fugitive' " oh well
Plug 'honza/vim-snippets'
Plug 'majutsushi/tagbar'
Plug 'dhruvasagar/vim-table-mode'
Plug 'vimwiki/vimwiki'
call plug#end()

" --------------coc.nvim---------------
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
let g:coc_snippet_next = '<C-l>'
let g:coc_snippet_prev = '<C-h>'
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nnoremap <silent> M :call <SID>show_documentation()<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gi <Plug>(coc-implementation)
nnoremap <C-n> :CocCommand explorer<CR>
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction
set hidden
set updatetime=300
set shortmess+=c
set signcolumn=yes

 "------------Lightline-------------
let g:lightline = {'colorscheme': 'darcula'}
let g:table_mode_corner='|'

 "------------Vimwiki-------------
let g:vimwiki_text_ignore_newline = 0

" ---------CtrlP----------
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_show_hidden = 1
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.d,*.o,*.bin,*.sh,*.svg,*.mkv,*.png,*.mkv,*.avi,*.mp4,*.iso,*.tar.gz,*.jpg,*.pdf,*.class,target/*

" -----Lightline-Bufferline-----
set showtabline=1
let g:lightline.tabline = {'left': [['buffers']], 'right': [['close']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type = {'buffers': 'tabsel'}
let g:lightline#bufferline#show_number  = 2
let g:lightline#bufferline#min_buffer_count = 2
let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#unicode_symbols = 1
nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)

let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
nnoremap <C-b> :TagbarToggle<CR>
"}}}

"------EDITOR------
"{{{
let mapleader=" " " Set the map leader to <Space>
set mouse+=a
nmap <leader>rn <Plug>(coc-rename)
set nu " Enable line numbers
set modifiable
set autoread
set relativenumber " Enable relative line numbers
syntax on " Enable syntax highlighting
colorscheme srcery " Set the colorscheme
highlight CocErrorFloat ctermfg=white  guifg=white
highlight Pmenu guifg=white guibg=dark
set autoindent " Set code autoindentation
set cursorline " Highlight current line
set expandtab " don't use actual tab character (ctrl-v)
set shiftwidth=4 " indenting is 4 spaces
set autoindent " turns it on
set smartindent " does the right thing (mostly) in programs
set cindent " stricter rules for C programs
set splitbelow splitright " Splits open at the bottom and right
set noshowmode " Don't show the indicator in insert mode.
set completeopt=longest,menuone,noselect " Improve completion menu
set undofile
set foldmethod=indent
set foldlevel=20
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
set hlsearch " Highlight search results
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

nnoremap ; :
inoremap jk <esc>

" Alt+Direction moves 6 spaces.
nnoremap <A-h> 5h
nnoremap <A-j> 5j
nnoremap <A-k> 5k
nnoremap <A-l> 5l
vnoremap <A-h> 5h
vnoremap <A-j> 5j
vnoremap <A-k> 5k
vnoremap <A-l> 5l
nnoremap <A-,> :1winc > <CR>
nnoremap <A-.> :1winc < <CR>
"===== KEY REMAPS =====

" General Maps
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
autocmd BufWritePre * %s/\s\+$//e  "Strip trailing whitespace on file save
nnoremap <C-s> :bd!<CR>
nnoremap <C-e> :bn<CR>
nnoremap <C-q> :bp<CR>
tnoremap <ESC> <C-\><C-n>
nnoremap <silent> <Leader>y  :<C-u>CocList -A --normal yank<cr>
"}}}

" ------Autocommands------
" {{{

" Easy Install CocExtensions
function! InstallCoc()
    CocInstall coc-css coc-dictionary coc-emmet coc-explorer coc-yank
    CocInstall coc-git coc-highlight coc-html coc-java coc-json coc-lists
    CocInstall coc-rls coc-snippets coc-tag coc-template coc-texlab coc-tsserver
endfunction

" Get help
function! Help()
    echom "Git"
    echom "F1: Gwrite"
    echom "F2: Gcommit"
    echom "F8: Refresh file"
    if (&ft=='c')
        echom "C"
        echom "F4: make"
        echom "F5: run"
    endif
    if (&ft=='html')
        echom "html"
        echom "F3: open server"
        echom "F4: run on localhost"
    endif
    if (&ft=='rust')
        echom "rust"
        echom "F3: rustc and run"
        echom "F4: cargo run"
        echom "F5: cargo run + args"
        echom "F6: cargo test"
    endif
    if (&ft=='vimwiki')
        echom "vimwiki"
        echom "<Leader>h1-5 for headers"
        echom "F3: 2HTML"
        echom "F4: Create table"
        echom "F5: Open HTML"
    endif
    echom "CocSession"
    echom "F6: session.load"
    echom "F7: session.save"
endfunction
if has('nvim')
    autocmd TermOpen term://* startinsert
endif

augroup general
    autocmd FileType * nnoremap <Leader>cm I/*<Esc>A*/<Esc>
    autocmd FileType * nnoremap <Leader>o o<ESC>k
    autocmd FileType * nnoremap <Leader>O O<ESC>j
    autocmd FileType * nnoremap <F9> :call Help()<CR>
    autocmd FileType * nnoremap <Leader>cf i/<ESC>70a*<ESC>o<ESC>69a*<ESC>a/<ESC>ko*<ESC>ha
    autocmd FileType * nnoremap <F8> :e %<CR>
    autocmd FocusGained * :checktime
augroup END

" ------------fugitive--------------
augroup git
    autocmd!
    autocmd FileType * nnoremap <F1> :Gwrite<CR>
    autocmd FileType * nnoremap <F2> :Gcommit -m ""
augroup END

" -----------html-------------
augroup web
    autocmd!
    autocmd InsertLeave *.css :BLReloadCSS
    autocmd FileType html nnoremap <F3> :!http-server . &<CR><CR>
    autocmd FileType html nnoremap <F4> :!setsid firefox http://localhost:8080/%<CR><CR>
    autocmd VimLeave *.html !killall node
augroup END

" ----------rust------------
augroup rust
    autocmd!
    autocmd BufNewFile,BufRead *.rs set filetype=rust
    autocmd FileType rust nnoremap <F3> :w<CR> :vsplit term://rustc % && ./%:r<CR>
    autocmd FileType rust nnoremap <F4> :w<CR> :vsplit term://cargo run<CR>
    autocmd FileType rust nnoremap <F5> :w<CR> :vsplit term://cargo run
    autocmd FileType rust nnoremap <F6> :w<CR> :vsplit term://cargo test<CR>
augroup END

" ----------C Specific-----------
augroup cc
    autocmd!
    autocmd FileType c nnoremap <F4> :w<CR> :make<CR>
    autocmd FileType c nnoremap <F5> :w<CR> :vsplit term://./%:r<CR>
    autocmd FileType c inoremap <Leader>inpstr char c;<CR>while(c!=EOF){<CR>c=getchar();<CR>}<Esc>O
    autocmd FileType c inoremap <Leader>incl #include <><Esc>i
    autocmd FileType c inoremap <Leader>cm <Esc>A/**/
augroup END

" --------------vim---------------
augroup nvim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType vim nnoremap <F5> :source ~/.config/nvim/init.vim<CR>
augroup END

" --------------coc session------------
augroup session
    autocmd!
    autocmd FileType * nnoremap <F6> :CocCommand session.load<CR>
    autocmd FileType * nnoremap <F7> :CocCommand session.save<CR>
augroup END

" --------------vimwiki------------
augroup vimwik
    autocmd!
    autocmd FileType vimwiki nnoremap <F3> :Vimwiki2HTMLBrowse<CR>
    autocmd FileType vimwiki nnoremap <F4> :VimwikiTable<CR>
    autocmd FileType vimwiki nnoremap <F5> :!setsid firefox ~/vimwiki_html/%:r.html<CR><CR>
    autocmd FileType vimwiki nnoremap <Leader>h1 I=<ESC>A=<ESC>
    autocmd FileType vimwiki nnoremap <Leader>h2 I==<ESC>A==<ESC>
    autocmd FileType vimwiki nnoremap <Leader>h3 I===<ESC>A===<ESC>
    autocmd FileType vimwiki nnoremap <Leader>h4 I====<ESC>A====<ESC>
    autocmd FileType vimwiki nnoremap <Leader>h5 I=====<ESC>A=====<ESC>
augroup END

" -------------remember_folds-------------
augroup remember_folds
  autocmd!
  au BufWinLeave ?* mkview 1
  au BufWinEnter ?* silent! loadview 1
augroup END

" }}}
