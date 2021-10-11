require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained",  -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    highlight = {
        enable = true,              -- false will disable the whole extension
    },
    indent = {
        enable = false
    },
    rainbow = {
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

vim.g.symbols_outline = {
    highlight_hovered_item = true,
    show_guides = true,
    auto_preview = false, -- experimental
    position = 'right',
    keymaps = {
        close = "<Esc>",
        goto_location = "<Cr>",
        focus_location = "o",
        hover_symbol = "<C-space>",
        rename_symbol = "r",
        code_actions = "a",
    },
    lsp_blacklist = {},
}

require("dapui").setup()
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
