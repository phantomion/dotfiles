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
    },
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    }
}

vim.g.dap_virtual_text = true

local dap = require('dap')
dap.adapters.lldb = {
    type = 'executable',
    command = '/usr/bin/lldb-vscode', -- adjust as needed
    name = "lldb"
}

dap.configurations.cpp = {
    {
        name = "Launch",
        type = "lldb",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = true,
        args = function()
            return vim.fn.input('Args: ')
        end,

        runInTerminal = false,
    },
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
