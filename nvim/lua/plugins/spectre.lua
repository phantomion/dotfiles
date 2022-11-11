require('spectre').setup()
local remap = vim.keymap.set
remap('n', '<leader>prn', "viw:lua require('spectre').open_visual()<CR>", { noremap = true, silent = true })
remap('n', '<leader>S', ":lua require('spectre').open()<CR>", { noremap = true, silent = true })
