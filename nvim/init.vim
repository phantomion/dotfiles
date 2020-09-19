"===== PLUGINS =====
"{{{
call plug#begin('~/.config/nvim/plugged')
" -----colorschemes-----
"Plug 'Erichain/vim-monokai-pro'
Plug 'srcery-colors/srcery-vim'
Plug 'dracula/vim'
" -----langs----
Plug 'rust-lang/rust.vim', {'for': 'rust'} " rust lang
Plug 'pangloss/vim-javascript', {'for': 'javascript'}
Plug 'zah/nim.vim', {'for': 'nim'}
" -----QoL-----
Plug 'tpope/vim-surround' " Surround everything
Plug 'scrooloose/nerdcommenter' " Smart comments
Plug 'honza/vim-snippets'
Plug 'jiangmiao/auto-pairs' " Auto pairs
Plug 'majutsushi/tagbar'
Plug 'itchyny/lightline.vim' " Status bar
Plug 'mengelbrecht/lightline-bufferline' " bufferline
Plug 'vimwiki/vimwiki'
Plug 'guns/vim-clojure-static', {'for': 'clojure'}
Plug 'frazrepo/vim-rainbow', {'for': 'clojure'}
" -----dev tools----
Plug 'neoclide/coc.nvim', {'branch': 'release'} " GET THIS OR DIE
Plug 'jaxbot/browserlink.vim', {'for': ['html','css','javascript']} " preview
Plug 'tpope/vim-fugitive' " this should be illegal
Plug 'tpope/vim-fireplace', { 'for': 'clojure' } " enables clojure development
" -----misc-----
Plug 'ryanoasis/vim-devicons' " fancy bloat icons
Plug 'mboughaba/i3config.vim'
call plug#end()

let mapleader=" " " Set the map leader to <Space>
" --------------coc.nvim---------------
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
if has('patch8.1.1068')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')
let g:coc_snippet_next = '<C-l>'
let g:coc_snippet_prev = '<C-h>'
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nnoremap <silent> <A-m> :call <SID>show_documentation()<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gi <Plug>(coc-implementation)
nmap <leader>rn <Plug>(coc-rename)
nnoremap <C-n> :CocCommand explorer<CR>
nnoremap <C-p> :CocList --number-select files<CR>
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

"------------clojure---------------
function! Omni_clojure()
    inoremap <silent><expr> <TAB>
                \ pumvisible() ? "\<C-n>" :
                \ <SID>check_back_space() ? "\<TAB>" :
                \ "\<C-X>\<C-O>"
    inoremap <silent><expr> <c-space> "\<C-X>\<C-O>"
endfunction

"------------lightline-------------
let g:lightline = {'colorscheme': 'darcula'}
let g:lightline.active = {
            \ 'left': [ [ 'mode', 'paste' ],
            \           [ 'readonly', 'filename', 'modified', 'branch', 'git'] ],
            \ 'right': [ [ 'lineinfo' ],
            \            [ 'percent' ],
            \            [ 'fileformat', 'fileencoding', 'filetype' ] ] }
let g:lightline.component_function = {'git': 'LightlineGitStatus',
            \ 'branch': 'LightlineGitBranch'}

function! LightlineGitStatus() abort
  let status = get(b:, 'coc_git_status', '')
  " return status
  return winwidth(0) > 80 ? status : ''
endfunction

function! LightlineGitBranch() abort
  let branch = get(g:, 'coc_git_status', '')
  " return branch
  return winwidth(0) > 80 ? branch : ''
endfunction

"------------vimwiki-------------
let g:vimwiki_text_ignore_newline = 0
let g:vimwiki_list = [{
            \ 'path': '$HOME/vimwiki_html',
            \ 'template_path': '$HOME/vimwiki_html/templates',
            \ 'template_default': 'default',
            \ 'template_ext': '.html'}]

" -----lightline-bufferline-----
set showtabline=1
let g:lightline.tabline = {'left': [['buffers']], 'right': [['close']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type = {'buffers': 'tabsel'}
let g:lightline#bufferline#show_number  = 2
let g:lightline#bufferline#min_buffer_count = 2
let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#unicode_symbols = 1
let g:lightline#bufferline#clickable = 1
let g:lightline.component_raw = {'buffers': 1}
nmap <leader>1 <plug>lightline#bufferline#go(1)
nmap <leader>2 <plug>lightline#bufferline#go(2)
nmap <leader>3 <plug>lightline#bufferline#go(3)
nmap <leader>4 <plug>lightline#bufferline#go(4)
nmap <leader>5 <plug>lightline#bufferline#go(5)
nmap <leader>6 <plug>lightline#bufferline#go(6)
nmap <leader>7 <plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)

nnoremap <C-b> :TagbarToggle<CR>

"-------clojure-static------
let g:clojure_fuzzy_indent = 1
let g:clojure_align_multiline_strings = 1
let g:clojure_align_subforms = 1
"}}}

"------EDITOR------
"{{{
" Set true colors
if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
    set termguicolors
endif
set mouse+=a
set nu " Enable line numbers
set modifiable
set autoread
set relativenumber " Enable relative line numbers
syntax on " Enable syntax highlighting
filetype plugin indent on " Enable plugin indent
colorscheme srcery " Set the colorscheme
highlight CocErrorFloat ctermfg=white  guifg=white
"highlight Pmenu guifg=white guibg=dark
set autoindent " Set code autoindentation
set cursorline " Highlight current line
set expandtab " don't use actual tab character (ctrl-v)
set tabstop=4
set shiftwidth=4 " indenting is 4 spaces
set autoindent " turns it on
set smartindent " does the right thing (mostly) in programs
set cindent " stricter rules for C programs
set splitbelow splitright " Splits open at the bottom and right
set noshowmode " Don't show the indicator in insert mode.
set completeopt=longest,menuone,noselect " Improve completion menu
set undofile
set inccommand=split
set clipboard=unnamed
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.d,*.o,*.bin,*.sh,*.svg,*.mkv,*.png,*.mkv,*.avi,*.mp4,*.iso,*.tar.gz,*.jpg,*.pdf,*.class,target/*

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
vnoremap ; :
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
nnoremap <Leader>q %
nnoremap <Leader>vw v%
autocmd BufWritePre * %s/\s\+$//e  "Strip trailing whitespace on file save
nnoremap <C-s> :bd!<CR>
nnoremap <C-e> :bn<CR>
nnoremap <C-q> :bp<CR>
tnoremap <ESC> <C-\><C-n>
nnoremap <silent> <Leader>y  :<C-u>CocList -A --normal yank<cr>
" Clipboard
vnoremap <C-c> "+y
nnoremap <A-v> "+p
"}}}

" ------Autocommands------
" {{{

" Easy Install CocExtensions
" Use :call InstallCoc()
function! InstallCoc()
    CocInstall coc-css coc-dictionary coc-emmet coc-explorer coc-yank
    CocInstall coc-git coc-highlight coc-html coc-java coc-json coc-lists
    CocInstall coc-rls coc-snippets coc-tag coc-template coc-texlab coc-tsserver
    CocInstall coc-marketplace
endfunction

function! Explorer()
    if (@%=='')
        CocCommand explorer
    endif
endfunction

let g:rust_toggle=0
function! Rust_toggle()
    if g:rust_toggle
        nnoremap <F3> :w<CR> :16split term://rustc % && ./%:r<CR>
        nnoremap <F4> :w<CR> :16split term://cargo run<CR>
        nnoremap <F5> :w<CR> :16split term://cargo run
        nnoremap <F6> :w<CR> :16split term://cargo test<CR>
        echom "16sp"
        let g:rust_toggle=0
    else
        nnoremap <F3> :w<CR> :vsplit term://rustc % && ./%:r<CR>
        nnoremap <F4> :w<CR> :vsplit term://cargo run<CR>
        nnoremap <F5> :w<CR> :vsplit term://cargo run
        nnoremap <F6> :w<CR> :vsplit term://cargo test<CR>
        echom "vs"
        let g:rust_toggle=1
    endif
endfunction

let g:nim_toggle=0
function! Nim_toggle()
    if g:nim_toggle
        nnoremap <F3> :w<CR> :16split term://nim c -r %<CR>
        nnoremap <F4> :w<CR> :16split term://nimble run *.nimble<CR>
        nnoremap <F5> :w<CR> :16split term://nimble run *.nimble
        echom "16sp"
        let g:nim_toggle=0
    else
        nnoremap <F3> :w<CR> :vsplit term://nim c -r %<CR>
        nnoremap <F4> :w<CR> :vsplit term://nimble run *.nimble<CR>
        nnoremap <F5> :w<CR> :vsplit term://nimble run *.nimble
        echom "vs"
        let g:nim_toggle=1
    endif
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
    elseif (&ft=='html')
        echom "html"
        echom "F3: open server"
        echom "F4: run on localhost"
    elseif (&ft=='rust')
        echom "rust"
        echom "F3: rustc and run"
        echom "F4: cargo run"
        echom "F5: cargo run + args"
        echom "F6: cargo test"
    elseif (&ft=='vimwiki')
        echom "vimwiki"
        echom "<Leader>h1-5 for headers"
        echom "F3: 2HTML"
        echom "F4: Create table"
        echom "F5: Open HTML"
    elseif (&ft=='nim')
        echom "Nim"
        echom "F3: nim c -r"
        echom "F4: nimble run"
        echom "F5: nimble run + args"
    elseif (&ft=='clojure')
        echom "Clojure"
        echom "F4: lein run"
        echom "F5: lein run + args"
        echom "<Leader>e: eval"
    endif
    echom "CocSession"
    echom "F6: session.load"
    echom "F7: session.save"
endfunction

command! Marketplace execute "CocList marketplace"

augroup general
    autocmd!
    autocmd TermOpen term://* startinsert
    autocmd FileType * nnoremap <Leader>o o<ESC>k
    autocmd FileType * nnoremap <Leader>O O<ESC>j
    autocmd FileType * nnoremap <F9> :call Help()<CR>
    autocmd FileType * nnoremap <F8> :e %<CR>
    autocmd FocusGained * :checktime
    autocmd VimEnter * :call Explorer()
    "autocmd ColorScheme * hi VertSplit ctermfg=bg guifg=bg
augroup END

" ------------fugitive--------------
augroup git
    autocmd!
    autocmd FileType * nnoremap <F1> :Gwrite<CR>
    autocmd FileType * nnoremap <F2> :Gcommit -m ""<Left>
    autocmd FileType * nnoremap <Leader>gs :G<CR>
    autocmd FileType * nnoremap <Leader>gl :GcLog --stat<CR>
    autocmd FileType * nnoremap <Leader>gp :Gpush<CR>
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
    autocmd FileType rust nnoremap <F3> :w<CR> :16split term://rustc % && ./%:r<CR>
    autocmd FileType rust nnoremap <F4> :w<CR> :16split term://cargo run<CR>
    autocmd FileType rust nnoremap <F5> :w<CR> :16split term://cargo run
    autocmd FileType rust nnoremap <F6> :w<CR> :16split term://cargo test<CR>
    autocmd FileType rust nnoremap <Leader>t :call Rust_toggle()<CR>
augroup END

augroup nim
    autocmd!
    autocmd BufNewFile,BufRead *.nim set filetype=nim
    autocmd FileType nim nnoremap <F3> :w<CR> :16split term://nim c -r %<CR>
    autocmd FileType nim nnoremap <F4> :w<CR> :16split term://nimble run *.nimble<CR>
    autocmd FileType nim nnoremap <F5> :w<CR> :16split term://nimble run *.nimble
    autocmd FileType nim nnoremap <Leader>t :call Nim_toggle()<CR>
    autocmd FileType nim colorscheme dracula
augroup END

" ----------C Specific-----------
augroup cc
    autocmd!
    autocmd FileType c nnoremap <F4> :w<CR> :make<CR>
    autocmd FileType c nnoremap <F5> :w<CR> :16split term://./%:r<CR>
augroup END

" --------------vim---------------
augroup nvim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType vim nnoremap <F5> :source ~/.config/nvim/init.vim<CR>
    autocmd FileType vim nnoremap <Leader>b :CocConfig<CR>
augroup END

augroup cloj
    autocmd!
    autocmd FileType clojure call rainbow#load()
    autocmd FileType clojure nnoremap <F3> :FireplaceConnect 127.0.0.1:
    autocmd FileType clojure nnoremap <F4> :16sp term://lein run<CR>
    autocmd FileType clojure nnoremap <F5> :16sp term://lein run
    autocmd FileType clojure nnoremap <Leader>e :%Eval<CR>
    autocmd FileType clojure vnoremap <Leader>e :Eval<CR>
    autocmd FileType clojure nnoremap <Leader>d :Doc <C-R><C-W><CR>
    autocmd FileType clojure setlocal lisp
    autocmd FileType clojure call Omni_clojure()
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
    autocmd FileType vimwiki nnoremap <Leader>h1 I= <ESC>A =<ESC>
    autocmd FileType vimwiki nnoremap <Leader>h2 I== <ESC>A ==<ESC>
    autocmd FileType vimwiki nnoremap <Leader>h3 I=== <ESC>A ===<ESC>
    autocmd FileType vimwiki nnoremap <Leader>h4 I==== <ESC>A ====<ESC>
    autocmd FileType vimwiki nnoremap <Leader>h5 I===== <ESC>A =====<ESC>
augroup END

" -------------remember_folds-------------
augroup remember_folds
    autocmd!
    au BufWinLeave ?* mkview 1
    au BufWinEnter ?* silent! loadview 1
augroup END

" -----------i3-syntax------------
augroup i3syntax
    autocmd!
    autocmd BufRead $HOME/.config/i3/config set ft=i3config
augroup END

" ----------latex----------
augroup tex
    autocmd!
    autocmd FileType tex let b:AutoPairs = AutoPairsDefine({"$": "$"})
    autocmd FileType tex nnoremap <F3> :!setsid zathura %:r.pdf<CR><CR>
    autocmd FileType tex nnoremap <Leader>lor a$\lor$
    autocmd FileType tex nnoremap <Leader>land a$\land$
    autocmd FileType tex nnoremap <Leader>neg a$\neg$
augroup END
" }}}
