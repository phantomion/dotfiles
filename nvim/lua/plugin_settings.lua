-- Nvim tree
local remap = vim.api.nvim_set_keymap

remap('n', '<C-n>', ':NvimTreeToggle<CR>', {noremap = true, silent = true})

-- Vimwiki
vim.g.vimwiki_text_ignore_newline = 0
vim.g.vimwiki_table_mappings = 0

-- Barbar
remap('n', '<C-s>', ':BufferClose<CR>', {noremap = true, silent = true})
remap('n', '<C-e>', ':BufferNext<CR>', {noremap = true, silent = true})
remap('n', '<C-q>', ':BufferPrevious<CR>', {noremap = true, silent = true})
remap('n', '<leader>1', ':BufferGoto 1<CR>', {noremap = true, silent = true})
remap('n', '<leader>2', ':BufferGoto 2<CR>', {noremap = true, silent = true})
remap('n', '<leader>3', ':BufferGoto 3<CR>', {noremap = true, silent = true})
remap('n', '<leader>4', ':BufferGoto 4<CR>', {noremap = true, silent = true})
remap('n', '<leader>5', ':BufferGoto 5<CR>', {noremap = true, silent = true})
remap('n', '<leader>6', ':BufferGoto 6<CR>', {noremap = true, silent = true})
remap('n', '<leader>7', ':BufferGoto 7<CR>', {noremap = true, silent = true})
remap('n', '<leader>8', ':BufferGoto 8<CR>', {noremap = true, silent = true})
remap('n', '<leader>9', ':BufferGoto 9<CR>', {noremap = true, silent = true})
remap('n', '<leader>0', ':BufferLast<CR>', {noremap = true, silent = true})
remap('n', '<A-,>', ':BufferMovePrevious<CR>', {noremap = true, silent = true})
remap('n', '<A-.>', ' :BufferMoveNext<CR>', {noremap = true, silent = true})
remap("n", "<leader>ci", "<Plug>kommentary_line_default", {})
remap("n", "<leader>c", "<Plug>kommentary_motion_default", {})
remap("x", "<leader>c", "<Plug>kommentary_visual_default", {})

-- Symbols outline
remap('n', '<C-b>', ':SymbolsOutline<CR>', {noremap = true, silent = true})

-- Neogit
remap('n', '<leader>ng', ':Neogit<CR>', {noremap = true, silent = true})
-- Treesitter
remap('n', '<leader>rr', ':w<CR>:e<CR>:TSBufEnable highlight<CR>', {noremap = true, silent = true})

vim.g.rainbow_active = 1

-- lsp
remap('n', '<leader>gd', ':lua vim.lsp.buf.definition()<CR>', {noremap = true, silent = true})
remap('n', '<leader>pd', ":lua require'lspsaga.provider'.preview_definition()<CR>", {noremap = true, silent = true})
remap('n', '<leader>gi', ':lua vim.lsp.buf.implementation()<CR>', {noremap = true, silent = true})
remap('n', '<leader>gh', ":lua require('lspsaga.signaturehelp').signature_help()<CR>", {noremap = true, silent = true})
remap('n', '<leader>gr', ":lua require'lspsaga.provider'.lsp_finder()<CR>", {noremap = true, silent = true})
remap('n', '<leader>rn', ":lua require('lspsaga.rename').rename()<CR>", {noremap = true, silent = true})
remap('n', '<leader>prn', "viw:lua require('spectre').open_visual()<CR>", {noremap = true, silent = true})
remap('n', '<leader>S', ":lua require('spectre').open()<CR>", {noremap = true, silent = true})
remap('n', '<A-m>', ":lua require('lspsaga.hover').render_hover_doc()<CR>", {noremap = true, silent = true})
remap('n', '<leader>ga', ":lua require('lspsaga.codeaction').code_action()<CR>", {noremap = true, silent = true})
remap('n', '<C-p>', ":lua require'telescope.builtin'.git_files{}<CR>", {noremap = true, silent = true})
remap('n', '<leader>pp', ":lua require'telescope.builtin'.find_files{}<CR>", {noremap = true, silent = true})
remap('n', '<leader>pw', ":lua require'telescope.builtin'.grep_string { search = vim.fn.expand('<cword>') }<CR><CR>", {noremap = true, silent = true})
remap('n', '<leader>ps', ":lua require('telescope.builtin').grep_string({ search = vim.fn.input('Grep For > ')})<CR>", {noremap = true, silent = true})
remap('n', '<leader>]', ":lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>", {noremap = true, silent = true})
remap('n', '<leader>[', ":lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>", {noremap = true, silent = true})
remap('n', '<leader>dg', ":lua vim.lsp.diagnostic.set_loclist()<CR>", {noremap = true, silent = true})
remap('n', '<leader>fm', ":lua vim.lsp.buf.formatting()<CR>", {noremap = true, silent = true})
remap('n', '<C-f>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", {noremap = true, silent = true})
remap('n', '<C-b>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", {noremap = true, silent = true})

remap('i', '<C-Space>', 'compe#complete()', {noremap = true, silent = true, expr = true})
remap('i', '<CR>', "compe#confirm('<CR>')", {noremap = true, silent = true, expr = true})
remap('i', '<C-e>', "compe#close('<C-e>')", {noremap = true, silent = true, expr = true})
remap('i', '<C-f>', "compe#scroll({ 'delta': +4 })", {noremap = true, silent = true, expr = true})
remap('i', '<C-d>', "compe#scroll({ 'delta': -4 })", {noremap = true, silent = true, expr = true})

vim.cmd([[ highlight link CompeDocumentation NormalFloat ]])
