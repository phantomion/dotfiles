local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local general = augroup("general", { clear = true })
autocmd("BufWritePre", {
    group = general,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

autocmd("TermOpen", {
    group = general,
    pattern = "term://*",
    command = 'startinsert',
})

autocmd("FocusGained", {
    group = general,
    pattern = "*",
    command = 'checktime',
})

autocmd("Filetype", {
    group = general,
    pattern = "lua",
    callback = function()
        vim.keymap.set('n', '<leader>nv', ':lua require(\'telescope.builtin\').find_files{ cwd = "~/.config/nvim" }<CR>', { silent = true })
    end,
})

autocmd("Filetype", {
    group = general,
    pattern = "lua",
    command = ":lua require'cmp'.setup.buffer {sources = {{ name = 'nvim_lua' },{ name = 'buffer' }}}",
})

autocmd("Filetype", {
    group = general,
    pattern = "lua",
    callback = function()
        vim.keymap.set('n', '<F5>', ':source ~/.config/nvim/init.lua<CR>', { silent = true })
    end,
})

autocmd("TextYankPost", {
    group = general,
    pattern = "*",
    command = 'silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=500}',
})


local i3 = augroup("i3syntax", { clear = true })
autocmd("BufRead", {
    group = i3,
    pattern = "$HOME/.config/i3/config",
    command = "set ft=i3config",
})

local nvim_dap = augroup("nvim_dap", { clear = true })

autocmd("Filetype", {
    group = nvim_dap,
    pattern = "dap-repl",
    command = "lua require('dap.ext.autocompl').attach()",
})

local pypy = augroup("pypy", { clear = true })

autocmd("Filetype", {
    group = pypy,
    pattern = "python",
    callback = function()
        vim.keymap.set('n', '<F4>', ':16sp term://python %<CR>', { silent = true })
    end,
})

autocmd("Filetype", {
    group = pypy,
    pattern = "python",
    callback = function()
        vim.keymap.set('n', '<leader>fm', ':!autopep8 -i % <CR><CR>:e %<CR>', { silent = true })
    end,
})

local golang = augroup("golang", {clear = true})

autocmd("Filetype", {
    group = golang,
    pattern = "go",
    callback = function()
        vim.keymap.set('n', '<leader>fm', ':GoFmt<CR>', {silent = true})
    end
})
