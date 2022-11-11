require('neogit').setup {}
-- Neogit
local remap = vim.keymap.set
remap('n', '<leader>ng', ':Neogit<CR>', { noremap = true, silent = true })
