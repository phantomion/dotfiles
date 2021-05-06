let g:completion_enable_auto_paren = 1
lua require('telescope').setup({defaults = {file_sorter = require('telescope.sorters').get_fzy_sorter}})
nnoremap <silent><leader>gd :lua vim.lsp.buf.definition()<CR>
nnoremap <silent><leader>gi :lua vim.lsp.buf.implementation()<CR>
nnoremap <silent><leader>gh :lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent><leader>gr :lua vim.lsp.buf.references()<CR>
nnoremap <silent><leader>rn :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>prn viw:lua require('spectre').open_visual()<CR>
nnoremap <leader>S :lua require('spectre').open()<CR>
nnoremap <silent><A-m> :call <SID>show_documentation()<CR>
nnoremap <silent><leader>ga :lua vim.lsp.buf.code_action()<CR>
nnoremap <silent><C-p> :lua require'telescope.builtin'.git_files{}<CR>
nnoremap <silent><Leader>pp :lua require'telescope.builtin'.find_files{}<CR>
nnoremap <silent><leader>pw :lua require'telescope.builtin'.grep_string { search = vim.fn.expand("<cword>") }<CR><CR>
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <silent><leader>] :lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <silent><leader>[ :lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent><leader>dg :lua vim.lsp.diagnostic.set_loclist()<CR>
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        :lua vim.lsp.buf.hover()
    endif
endfunction

"-------------Compe && Snippets-------------
"let g:UltiSnipsExpandTrigger = " "
"let g:UltiSnipsJumpForwardTrigger = "<c-l>"
"let g:UltiSnipsJumpBackwardTrigger = "<c-h>"
"
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 1000
let g:compe.max_kind_width = 1000
let g:compe.max_menu_width = 1000000
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.omni = v:false
"let g:compe.source.ultisnips = v:true
let g:compe.source.vsnip = v:true
highlight link CompeDocumentation NormalFloat
