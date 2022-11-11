require 'nvim-tree'.setup {
    update_cwd = true,
    view = {
        width = 27,
        mappings = {
            list = {
                { key = { "h", "l" }, action = "edit" },
                { key = { "<CR>" }, action = "cd" }
            }
        }
    },
    filters = {
        exclude = { '.git', 'node_modules', '.cache', 'target', '.o', 'bin' },
    },
    diagnostics = {
        enable = true
    },
    renderer = {
        highlight_git = true,
        indent_markers = {
            enable = true,
        },
    },
}

local remap = vim.keymap.set

remap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
