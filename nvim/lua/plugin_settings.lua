-- Nvim tree
local remap = vim.keymap.set

remap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- Barbar
remap('n', '<C-s>', ':BufferClose<CR>', { noremap = true, silent = true })
remap('n', '<C-e>', ':BufferNext<CR>', { noremap = true, silent = true })
remap('n', '<C-q>', ':BufferPrevious<CR>', { noremap = true, silent = true })
remap('n', '<leader>1', ':BufferGoto 1<CR>', { noremap = true, silent = true })
remap('n', '<leader>2', ':BufferGoto 2<CR>', { noremap = true, silent = true })
remap('n', '<leader>3', ':BufferGoto 3<CR>', { noremap = true, silent = true })
remap('n', '<leader>4', ':BufferGoto 4<CR>', { noremap = true, silent = true })
remap('n', '<leader>5', ':BufferGoto 5<CR>', { noremap = true, silent = true })
remap('n', '<leader>6', ':BufferGoto 6<CR>', { noremap = true, silent = true })
remap('n', '<leader>7', ':BufferGoto 7<CR>', { noremap = true, silent = true })
remap('n', '<leader>8', ':BufferGoto 8<CR>', { noremap = true, silent = true })
remap('n', '<leader>9', ':BufferGoto 9<CR>', { noremap = true, silent = true })
remap('n', '<leader>0', ':BufferLast<CR>', { noremap = true, silent = true })
remap('n', '<A-,>', ':BufferMovePrevious<CR>', { noremap = true, silent = true })
remap('n', '<A-.>', ' :BufferMoveNext<CR>', { noremap = true, silent = true })

-- Symbols outline
remap('n', '<C-b>', ':LSoutlineToggle<CR>', { noremap = true, silent = true })

-- Neogit
remap('n', '<leader>ng', ':Neogit<CR>', { noremap = true, silent = true })
-- Treesitter
remap('n', '<leader>rr', ':w<CR>:e<CR>:TSBufEnable highlight<CR>', { noremap = true, silent = true })

vim.g.rainbow_active = 1

-- lsp
remap('n', '<leader>gd', ':Telescope lsp_definitions<CR>', { noremap = true, silent = true })
remap('n', '<leader>pd', ":Lspsaga peek_definition<CR>", { noremap = true, silent = true })
remap('n', '<leader>gi', ':Telescope lsp_implementations<CR>', { noremap = true, silent = true })
remap('n', '<leader>gh', ":Lspsaga lsp_finder<CR>", { noremap = true, silent = true })
remap('n', '<leader>gr', ":Telescope lsp_references<CR>", { noremap = true, silent = true })
remap('n', '<leader>rn', ":Lspsaga rename<CR>", { noremap = true, silent = true })
remap('n', '<leader>prn', "viw:lua require('spectre').open_visual()<CR>", { noremap = true, silent = true })
remap('n', '<leader>S', ":lua require('spectre').open()<CR>", { noremap = true, silent = true })
remap('n', '<A-m>', ":Lspsaga hover_doc<CR>", { noremap = true, silent = true })
remap('n', '<leader>ga', ":Lspsaga code_action<CR>", { noremap = true, silent = true })
remap('n', '<C-p>', ":lua require'telescope.builtin'.git_files{}<CR>", { noremap = true, silent = true })
remap('n', '<leader>pp', ":lua require'telescope.builtin'.find_files{}<CR>", { noremap = true, silent = true })
remap('n', '<leader>pw', ":lua require'telescope.builtin'.grep_string { search = vim.fn.expand('<cword>') }<CR><CR>",
    { noremap = true, silent = true })
remap('n', '<leader>ps', ":lua require('telescope.builtin').grep_string({ search = vim.fn.input('Grep For > ')})<CR>",
    { noremap = true, silent = true })
remap('n', '<leader>]', ":Lspsaga diagnostic_jump_next<CR>", { noremap = true, silent = true })
remap('n', '<leader>[', ":Lspsaga diagnostic_jump_prev<CR>", { noremap = true, silent = true })
remap('n', '<leader>dg', ":Telescope diagnostics<CR>", { noremap = true, silent = true })
remap('n', '<leader>cs', ":Telescope colorscheme<CR>", { noremap = true, silent = true })
remap('n', '<leader>fm', ":lua vim.lsp.buf.format({ async = true })<CR>", { noremap = true, silent = true })
