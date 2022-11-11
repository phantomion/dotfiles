local remap = vim.keymap.set

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
