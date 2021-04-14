require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained",  -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    highlight = {
        enable = true,              -- false will disable the whole extension
    },
    indent = {
        enable = true
    }
}

require"toggleterm".setup{
    size = 16,
    open_mapping = [[<C-t>]],
    shade_filetypes = {},
    shade_terminals = true,
    persist_size = true,
    direction = 'horizontal'
}

local tree_cb = require'nvim-tree.config'.nvim_tree_callback
vim.g.nvim_tree_bindings = {
    ["h"] = tree_cb("edit"),
    ["l"] = tree_cb("edit"),
    ["<CR>"] = tree_cb("cd")
}

require'nvim-treesitter.configs'.setup {
    rainbow = {
        enable = true
    }
}
