"======Plugins======
"{{{
source $HOME/.config/nvim/plugins.vim
"lua require('plugins')

colorscheme zephyr " Set the colorscheme
"colorscheme neon " Set the colorscheme
"let g:neon_style = "doom"

let mapleader=" " " Set the map leader to <Space>
if (has("termguicolors"))
    set termguicolors
endif

"--------------LuaTree-------------
nnoremap <silent><C-n> :NvimTreeToggle<CR>
let g:nvim_tree_width = 27
let g:nvim_tree_indent_markers = 1
let g:nvim_tree_ignore = ['.git', 'node_modules', '.cache', 'target', '.o', 'bin']
let g:nvim_tree_git_hl = 1
let g:nvim_tree_disable_netrw = 0
let g:nvim_tree_hijack_netrw = 0

"-----------LuaColorizer-----------
lua require'colorizer'.setup()

"------------galaxyline------------
lua require('mygalaxyline')

"------------lspconfig-------------
lua require('lsps')
source $HOME/.config/nvim/lsps.vim

"------------treesitter------------
lua require('misc')

"------------vimwiki-------------
let g:vimwiki_text_ignore_newline = 0
let g:vimwiki_table_mappings = 0
let g:vimwiki_list = [{
            \ 'path': '$HOME/vimwiki_html',
            \ 'template_path': '$HOME/vimwiki_html/templates',
            \ 'template_default': 'default',
            \ 'template_ext': '.html'}]

" -----barbar.nvim-----
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

"----------symbols outline------------
nnoremap <C-b> :SymbolsOutline<CR>

"--------vimspector----------
source $HOME/.config/nvim/debugging.vim

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
let g:rainbow_active = 1
let g:sessions_dir = '$HOME/.config/nvim/sessions'
"---------signify-----------
let g:signify_sign_change = '~'

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
set hidden
set updatetime=50
set shortmess+=c
set mouse+=a
set nu " Enable line numbers
set modifiable
set autoread
set relativenumber " Enable relative line numbers
set nowrap
syntax on " Enable syntax highlighting
filetype plugin indent on " Enable plugin indent
set autoindent " Set code autoindentation
set cursorline " Highlight current line
set expandtab " don't use actual tab character (ctrl-v)
set tabstop=4
set softtabstop=4
set shiftwidth=4 " indenting is 4 spaces
set smartindent " does the right thing (mostly) in programs
set cindent " stricter rules for C programs
set splitbelow splitright " Splits open at the bottom and right
set noshowmode " Don't show the indicator in insert mode.
set completeopt=noinsert,menuone,noselect " Improve completion menu
set undofile
set inccommand=split
set clipboard=unnamedplus
set nobackup
set nowritebackup
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.d,*.o,*.bin,*.sh,*.svg,*.mkv,*.png,*.mkv,*.avi,*.mp4,*.iso,*.tar.gz,*.jpg,*.pdf,*.class,target/*
set so=12
set ttimeoutlen=0
set signcolumn=yes
set colorcolumn=80

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

" H and L navigate to start or end of line
nnoremap H ^
vnoremap H ^
nnoremap L $
vnoremap L $
nnoremap w W
nnoremap W w
nnoremap e E
nnoremap E e
nnoremap b B
nnoremap B b
nnoremap ' ;
nnoremap Y y$

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
inoremap <C-l> <Right>
nnoremap <silent><leader>tt :<c-u>exe v:count1 . "ToggleTerm"<CR>
" Clipboard
vnoremap <C-c> "+y
nnoremap <A-v> "+p

highlight LuaTreeFolderIcon guifg=#488847
highlight LspDiagnosticsDefaultWarning guifg=#ff922b
highlight LspDiagnosticsDefaultError guifg=#C33027
highlight LspDiagnosticsDefaultHint guifg=#15aabf
highlight LspDiagnosticsDefaultInformation guifg=#fab005
sign define LspDiagnosticsSignError text= texthl=LspDiagnosticsSignError linehl= numhl=
sign define LspDiagnosticsSignWarning text= texthl=LspDiagnosticsSignWarning linehl= numhl=
sign define LspDiagnosticsSignInformation text= texthl=LspDiagnosticsSignInformation linehl= numhl=
sign define LspDiagnosticsSignHint text= texthl=LspDiagnosticsSignHint linehl= numhl=
"highlight! link LspDiagnosticsUnderlineError CocErrorHighlight
"highlight! link LspDiagnosticsUnderlineHint CocHintHighlight
"highlight! link LspDiagnosticsUnderlineInformation CocInfoHighlight
"highlight! link LspDiagnosticsUnderlineWarning CocWarningHighlight

"}}}

"=======Autocommands=======
" {{{
source $HOME/.config/nvim/autocommands.vim
" }}}
