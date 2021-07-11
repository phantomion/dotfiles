-- Nvim tree
vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', {noremap = true, silent = true})

vim.g.nvim_tree_width = 27
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_ignore = { '.git', 'node_modules', '.cache', 'target', '.o', 'bin' }
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_disable_netrw = 0
vim.g.nvim_tree_hijack_netrw = 0

-- Vimwiki
vim.g.vimwiki_text_ignore_newline = 0
vim.g.vimwiki_table_mappings = 0

-- Barbar
vim.api.nvim_set_keymap('n', '<C-s>', ':BufferClose<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-e>', ':BufferNext<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-q>', ':BufferPrevious<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>1', ':BufferGoto 1<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>2', ':BufferGoto 2<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>3', ':BufferGoto 3<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>4', ':BufferGoto 4<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>5', ':BufferGoto 5<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>6', ':BufferGoto 6<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>7', ':BufferGoto 7<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>8', ':BufferGoto 8<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>9', ':BufferGoto 9<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>0', ':BufferLast<CR>', {noremap = true, silent = true})

-- Symbols outline
vim.api.nvim_set_keymap('n', '<C-b>', ':SymbolsOutline<CR>', {noremap = true, silent = true})

-- Neogit
vim.api.nvim_set_keymap('n', '<leader>ng', ':Neogit<CR>', {noremap = true, silent = true})
-- Treesitter
vim.api.nvim_set_keymap('n', '<leader>rr', ':w<CR>:e<CR>:TSBufEnable highlight<CR>', {noremap = true, silent = true})

vim.g.rainbow_active = 1
vim.g.signify_sign_change = '~'

-- lsp
vim.api.nvim_set_keymap('n', '<leader>gd', ':lua vim.lsp.buf.definition()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gi', ':lua vim.lsp.buf.implementation()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gh', ":lua require('lspsaga.signaturehelp').signature_help()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gr', ':lua vim.lsp.buf.references()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>rn', ":lua require('lspsaga.rename').rename()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>prn', "viw:lua require('spectre').open_visual()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>S', ":lua require('spectre').open()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<A-m>', ":lua require('lspsaga.hover').render_hover_doc()", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>ga', ":lua require('lspsaga.codeaction').code_action()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-p>', ":lua require'telescope.builtin'.git_files{}<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>pp', ":lua require'telescope.builtin'.find_files{}<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>pw', ":lua require'telescope.builtin'.grep_string { search = vim.fn.expand('<cword>') }<CR><CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>ps', ":lua require('telescope.builtin').grep_string({ search = vim.fn.input('Grep For > ')})<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>]', ":lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>[', ":lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>dg', ":lua vim.lsp.diagnostic.set_loclist()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>fm', ":lua vim.lsp.buf.formatting()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-f>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-b>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", {noremap = true, silent = true})

vim.api.nvim_set_keymap('i', '<C-Space>', 'compe#complete()', {noremap = true, silent = true, expr = true})
vim.api.nvim_set_keymap('i', '<CR>', "compe#confirm('<CR>')", {noremap = true, silent = true, expr = true})
vim.api.nvim_set_keymap('i', '<C-e>', "compe#close('<C-e>')", {noremap = true, silent = true, expr = true})
vim.api.nvim_set_keymap('i', '<C-f>', "compe#scroll({ 'delta': +4 })", {noremap = true, silent = true, expr = true})
vim.api.nvim_set_keymap('i', '<C-d>', "compe#scroll({ 'delta': -4 })", {noremap = true, silent = true, expr = true})

vim.cmd([[ highlight link CompeDocumentation NormalFloat ]])
