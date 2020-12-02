let g:completion_enable_auto_paren = 1
lua require('telescope').setup({defaults = {file_sorter = require('telescope.sorters').get_fzy_sorter}})
nnoremap <silent><leader>gd :lua vim.lsp.buf.definition()<CR>
nnoremap <silent><leader>gi :lua vim.lsp.buf.implementation()<CR>
nnoremap <silent><leader>gh :lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent><leader>gr :lua vim.lsp.buf.references()<CR>
nnoremap <silent><leader>rn :lua vim.lsp.buf.rename()<CR>
nnoremap <silent><A-m> :call <SID>show_documentation()<CR>
nnoremap <silent><leader>ga :lua vim.lsp.buf.code_action()<CR>
imap <silent><tab> <Plug>(completion_smart_tab)
imap <silent><s-tab> <Plug>(completion_smart_s_tab)
imap <silent> <c-space> <Plug>(completion_trigger)
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

"-------------snippets-------------
let g:completion_auto_change_source = 1
let g:completion_enable_snippet = 'UltiSnips'
let g:completion_chain_complete_list = [
    \{'complete_items': ['lsp', 'snippet']},
    \{'complete_items': ['buffers', 'path']},
    \{'mode': '<c-p>'},
    \{'mode': '<c-n>'}
\]
imap <c-j> <Plug>(completion_next_source)
imap <c-k> <Plug>(completion_prev_source)
let g:UltiSnipsExpandTrigger = "<CR>"
let g:UltiSnipsJumpForwardTrigger = "<c-l>"
let g:UltiSnipsJumpBackwardTrigger = "<c-h>"
