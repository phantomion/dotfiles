require 'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "bash",
        "c",
        "css",
        "dockerfile",
        "go",
        "gomod",
        "html",
        "javascript",
        "json",
        "json5",
        "jsonc",
        "latex",
        "lua",
        "php",
        "python",
        "rust",
        "r",
        "regex",
        "scss",
        "svelte",
        "toml",
        "typescript",
        "vim",
        "vue",
        "markdown",
        "markdown_inline",
        "yaml"
    }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    auto_install = true,
    highlight = {
        enable = true, -- false will disable the whole extension
        disable = { "html" },
    },
    indent = {
        enable = false
    },
    rainbow = {
        enable = true,
        extended_mode = false
    },
    textobjects = {
        swap = {
            enable = true,
            swap_next = {
                ["<leader>e"] = "@parameter.inner",
            },
            swap_previous = {
                ["<leader>w"] = "@parameter.inner",
            },
        },
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
        },
    }
}

require('ts_context_commentstring').setup{
    enable_autocmd = false
}

local remap = vim.keymap.set
-- Treesitter
remap('n', '<leader>rr', ':w<CR>:e<CR>:TSBufEnable highlight<CR>', { noremap = true, silent = true })
