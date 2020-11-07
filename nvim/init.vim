"======Plugins======
"{{{
call plug#begin('~/.config/nvim/plugged')
" -------colorschemes--------
Plug 'Erichain/vim-monokai-pro'
Plug 'srcery-colors/srcery-vim'
Plug 'dracula/vim'
" -----------langs-----------
Plug 'sheerun/vim-polyglot' " One for all
" ------------QoL------------
Plug 'tpope/vim-surround' " Surround everything
Plug 'scrooloose/nerdcommenter' " Smart comments
Plug 'honza/vim-snippets'
Plug 'jiangmiao/auto-pairs' " Auto pairs
"Plug 'itchyny/lightline.vim' " Status bar
Plug 'vimwiki/vimwiki'
Plug 'frazrepo/vim-rainbow', {'for': 'clojure'}
Plug 'Yggdroot/indentLine', {'for': 'nim'}
Plug 'easymotion/vim-easymotion'
Plug 'romgrk/barbar.nvim' " Best bufferline
Plug 'glepnir/galaxyline.nvim'
" -----------dev tools---------
Plug 'majutsushi/tagbar' " too good to be true
Plug 'neoclide/coc.nvim', {'branch': 'release'} " GET THIS OR DIE
Plug 'jaxbot/browserlink.vim', {'for': ['html','css','javascript']} " preview
Plug 'tpope/vim-fugitive' " this should be illegal
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fireplace', { 'for': 'clojure' } " enables clojure development
Plug 'kyazdani42/nvim-tree.lua'
Plug 'tpope/vim-rhubarb'
" ------------misc------------
Plug 'ron-rs/ron.vim', {'for': 'ron'}
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'norcalli/nvim-colorizer.lua'
call plug#end()

let mapleader=" " " Set the map leader to <Space>
if (has("termguicolors"))
    set termguicolors
endif
lua require('mygalaxyline')
" --------------coc.nvim---------------
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" Use enter to select autocomplete choice. If none select first.
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')
let g:coc_snippet_next = '<C-l>'
let g:coc_snippet_prev = '<C-h>'
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nnoremap <silent> <A-m> :call <SID>show_documentation()<CR>
nmap <silent><leader>gd <Plug>(coc-definition)
nmap <silent><leader>gy <Plug>(coc-type-definition)
nmap <silent><leader>gr <Plug>(coc-references)
nmap <silent><leader>gi <Plug>(coc-implementation)
nmap <leader>rn <Plug>(coc-rename)
nnoremap <leader>prn :CocSearch <C-R>=expand("<cword>")<CR><CR>
nnoremap <nowait><expr> <C-f> coc#util#has_float() ? coc#util#float_scroll(1) : ""
nnoremap <nowait><expr> <C-c> coc#util#has_float() ? coc#util#float_scroll(0) : ""
"nnoremap <leader>qf <Plug>(coc-fix-current)
nnoremap <C-p> :CocList --number-select files<CR>
nnoremap <silent><leader>m :CocList marketplace<CR>
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction
set hidden
set updatetime=100
set shortmess+=c

"--------------LuaTree-------------
nnoremap <silent><C-n> :LuaTreeToggle<CR>
let g:lua_tree_bindings = {
    \ 'edit': ['h','l'],
    \ 'cd': '<CR>',
    \}
let g:lua_tree_width = 27
let g:lua_tree_indent_markers = 1
let g:lua_tree_ignore = ['.git', 'node_modules', '.cache', 'target', '.o']

"-----------LuaColorizer-----------
lua require'colorizer'.setup()

"------------treesitter------------
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",  -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
}
EOF

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
            \ 'left': [[ 'mode', 'paste' ],
            \          [ 'readonly', 'filename', 'modified'],
            \          ['branch', 'git']] }
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

" -----barbar.nvim-----
set showtabline=1
nnoremap <silent><C-s> :BufferClose<CR>
nnoremap <silent><C-e> :BufferNext<CR>
nnoremap <silent><C-q> :BufferPrevious<CR>
nmap <silent><leader>1 :BufferGoto 1<CR>
nmap <silent><leader>2 :BufferGoto 2<CR>
nmap <silent><leader>3 :BufferGoto 3<CR>
nmap <silent><leader>4 :BufferGoto 4<CR>
nmap <silent><leader>5 :BufferGoto 5<CR>
nmap <silent><leader>6 :BufferGoto 6<CR>
nmap <silent><leader>7 :BufferGoto 7<CR>
nmap <silent><leader>8 :BufferGoto 8<CR>
nmap <silent><leader>9 :BufferGoto 9<CR>
nmap <silent><leader>0 :BufferLast<CR>

"----------tagbar------------
nnoremap <C-b> :TagbarToggle<CR>

"---------polyglot-----------
"------------cpp-------------
let g:cpp_attributes_highlight = 1
let g:cpp_member_highlight = 1
let g:cpp_simple_highlight = 1

"-------clojure-static------
let g:clojure_fuzzy_indent = 1
let g:clojure_align_multiline_strings = 1
let g:clojure_align_subforms = 1

let g:indentLine_char = '|'


"--------easymotion---------
nmap <leader><leader> <Plug>(easymotion-prefix)
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1 " US layout

"}}}

"=======Editor=======
"{{{
" Set true colors
if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
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
set nobackup
set nowritebackup
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.d,*.o,*.bin,*.sh,*.svg,*.mkv,*.png,*.mkv,*.avi,*.mp4,*.iso,*.tar.gz,*.jpg,*.pdf,*.class,target/*
set so=17
set ttimeoutlen=0
set signcolumn=number

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
nnoremap <leader>q %
nnoremap <leader>vw v%
autocmd BufWritePre * %s/\s\+$//e  "Strip trailing whitespace on file save
tnoremap <ESC> <C-\><C-n>
nnoremap <silent> <leader>y  :<C-u>CocList -A --normal yank<cr>
inoremap <C-l> <Right>
" Clipboard
vnoremap <C-c> "+y
nnoremap <A-v> "+p
"}}}

"=======Autocommands=======
" {{{

" Easy Install CocExtensions
" Use :call InstallCoc()
function! InstallCoc()
    CocInstall coc-css coc-dictionary coc-emmet coc-yank
    CocInstall coc-git coc-highlight coc-html coc-java coc-json coc-lists
    CocInstall coc-rust-analyzer coc-snippets coc-tag coc-template
    CocInstall coc-marketplace coc-texlab coc-tsserver coc-clangd
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
    if (&ft=='c' || &ft=='cpp')
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
        echom "<leader>h1-5 for headers"
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
        echom "<leader>e: eval"
        echom "<leader>d: doc"
    endif
    echom "CocSession"
    echom "F6: session.load"
    echom "F7: session.save"
endfunction

command! Marketplace execute "CocList marketplace"

augroup general
    autocmd!
    autocmd TermOpen term://* startinsert
    autocmd FileType * nnoremap <leader>o o<ESC>k
    autocmd FileType * nnoremap <leader>O O<ESC>j
    autocmd FileType * nnoremap <silent><leader>- :CocRestart<CR>
    autocmd FileType * nnoremap <F9> :call Help()<CR>
    autocmd FileType * nnoremap <F8> :e %<CR>
    autocmd FocusGained * :checktime
augroup END

" ------------fugitive--------------
augroup git
    autocmd!
    autocmd FileType * nnoremap <F1> :Gwrite<CR>
    autocmd FileType * nnoremap <F2> :Gcommit -m ""<Left>
    autocmd FileType * nnoremap <leader>gs :G<CR>
    autocmd FileType * nnoremap <leader>gl :GcLog --stat<CR>
    autocmd FileType * nnoremap <leader>gp :Gpush<CR>
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
    autocmd FileType rust nnoremap <leader><F4> :w<CR> :16split term://cargo run --target x86_64-unknown-linux-musl<CR>
    autocmd FileType rust nnoremap <leader>t :call Rust_toggle()<CR>
    autocmd FileType rust nnoremap <silent><leader>. a-><space>
augroup END

augroup nim
    autocmd!
    autocmd BufNewFile,BufRead *.nim set filetype=nim
    autocmd FileType nim nnoremap <F3> :w<CR> :16split term://nim c -r %<CR>
    autocmd FileType nim nnoremap <F4> :w<CR> :16split term://nimble run *.nimble<CR>
    autocmd FileType nim nnoremap <F5> :w<CR> :16split term://nimble run *.nimble
    autocmd FileType nim nnoremap <leader>t :call Nim_toggle()<CR>
    "autocmd FileType nim colorscheme dracula
augroup END

" ----------C Specific-----------
augroup cc
    autocmd!
    autocmd FileType c,cpp nnoremap <F3> :w<CR> :16split term://make<CR>
    autocmd FileType c,cpp nnoremap <F4> :w<CR> :16split term://make run<CR>
    autocmd FileType c,cpp nnoremap <F5> :w<CR> :16split term://./%:r<CR>
augroup END

" --------------vim---------------
augroup nvim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType vim nnoremap <F5> :source ~/.config/nvim/init.vim<CR>
    autocmd FileType vim nnoremap <leader>b :CocConfig<CR>
augroup END

augroup cloj
    autocmd!
    autocmd FileType clojure call rainbow#load()
    autocmd FileType clojure nnoremap <F3> :FireplaceConnect 127.0.0.1:
    autocmd FileType clojure nnoremap <F4> :16sp term://lein run<CR>
    autocmd FileType clojure nnoremap <F5> :16sp term://lein run
    autocmd FileType clojure nnoremap <leader>e :%Eval<CR>
    autocmd FileType clojure vnoremap <leader>e :Eval<CR>
    autocmd FileType clojure nnoremap <leader>d :Doc <C-R><C-W><CR>
    autocmd FileType clojure setlocal lisp
    "autocmd FileType clojure call Omni_clojure()
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
    autocmd FileType vimwiki nnoremap <leader>h1 I= <ESC>A =<ESC>
    autocmd FileType vimwiki nnoremap <leader>h2 I== <ESC>A ==<ESC>
    autocmd FileType vimwiki nnoremap <leader>h3 I=== <ESC>A ===<ESC>
    autocmd FileType vimwiki nnoremap <leader>h4 I==== <ESC>A ====<ESC>
    autocmd FileType vimwiki nnoremap <leader>h5 I===== <ESC>A =====<ESC>
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
    autocmd FileType tex nnoremap <leader>lor a$\lor$
    autocmd FileType tex nnoremap <leader>land a$\land$
    autocmd FileType tex nnoremap <leader>neg a$\neg$
augroup END
" }}}
