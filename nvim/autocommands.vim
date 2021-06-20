let g:rust_toggle=0
function! Rust_toggle()
    if g:rust_toggle
        nnoremap <F3> :w<CR> :16split term://rustc % && ./%:r<CR>
        nnoremap <F4> :w<CR> :16split term://cargo run<CR>
        nnoremap <F5> :w<CR> :16split term://cargo run --
        echom "16sp"
        let g:rust_toggle=0
    else
        nnoremap <F3> :w<CR> :vsplit term://rustc % && ./%:r<CR>
        nnoremap <F4> :w<CR> :vsplit term://cargo run<CR>
        nnoremap <F5> :w<CR> :vsplit term://cargo run --
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
    echom "Session"
    echom "F6: session.load"
    echom "F7: session.save"
endfunction

augroup general
    autocmd!
    autocmd TermOpen term://* startinsert
    autocmd FileType * nnoremap <silent><leader>o o<ESC>k
    autocmd FileType * nnoremap <silent><leader>O O<ESC>j
    autocmd FileType * nnoremap <silent><F9> :call Help()<CR>
    autocmd FileType * nnoremap <silent><F8> :e %<CR>
    autocmd FocusGained * :checktime
    autocmd Filetype vim nnoremap <silent><leader>nv <cmd>lua require'telescope.builtin'.find_files{ cwd = "~/.config/nvim" }<CR>
    autocmd FileType * nnoremap <silent><leader>rr :w<CR>:e<CR>:TSBufEnable highlight<CR>
    autocmd BufWritePost plugins.lua PackerCompile
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
    autocmd FileType rust nnoremap <F5> :w<CR> :16split term://cargo run --<Space>
    autocmd FileType rust nnoremap <leader><F4> :w<CR> :16split term://cargo run --target x86_64-unknown-linux-musl<CR>
    autocmd FileType rust nnoremap <leader>t :call Rust_toggle()<CR>
    autocmd FileType rust nnoremap <silent><leader>. a-><space>
    autocmd InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *.rs :lua require'lsp_extensions'.inlay_hints{ prefix = ' » ', enabled = {"ChainingHint"} }
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
    autocmd FileType c,cpp nnoremap <leader><F3> :w<CR> :16split term://make -B<CR>
    autocmd FileType c,cpp nnoremap <F4> :w<CR> :16split term://make run<CR>
    autocmd FileType c,cpp nnoremap <F5> :w<CR> :16split term://make run ARGS=
    autocmd FileType c,cpp nnoremap <F6> :w<CR> :16split term://./%:r<CR>
    autocmd Filetype c,cpp nnoremap <silent><leader>fm :!clang-format -style="{BasedOnStyle: google, IndentWidth: 4}" -i % <CR><CR>
augroup END

" --------------vim---------------
augroup nvim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType vim setlocal foldlevel=0
    autocmd FileType vim nnoremap <F5> :source ~/.config/nvim/init.vim<CR>
augroup END

augroup cloj
    autocmd!
    autocmd FileType clojure nnoremap <F3> :FireplaceConnect 127.0.0.1:
    autocmd FileType clojure nnoremap <F4> :16sp term://lein run<CR>
    autocmd FileType clojure nnoremap <F5> :16sp term://lein run
    autocmd FileType clojure nnoremap <leader>e :%Eval<CR>
    autocmd FileType clojure vnoremap <leader>e :Eval<CR>
    autocmd FileType clojure nnoremap <leader>dd :Doc <C-R><C-W><CR>
    autocmd FileType clojure setlocal lisp
    "autocmd FileType clojure call Omni_clojure()
augroup END

" --------------session------------
augroup session
    autocmd!
    exec 'nnoremap <F6> :mks! ' . g:sessions_dir . '/*.vim<C-D><BS><BS><BS><BS><BS>'
    exec 'nnoremap <F7> :so ' . g:sessions_dir. '/*.vim<C-D><BS><BS><BS><BS><BS>'
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

"------------highlight_yank--------------
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=500}
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

augroup NvimDap
    autocmd!
    au FileType dap-repl lua require('dap.ext.autocompl').attach()
augroup END

augroup php
    autocmd!
    autocmd BufRead *.php set indentexpr =
    autocmd BufRead *.php set autoindent
    autocmd BufRead *.php set smartindent
augroup END
