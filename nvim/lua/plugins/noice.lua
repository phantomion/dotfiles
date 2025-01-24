require("noice").setup({
    popupmenu = {
        backend = "cmp", -- backend to use to show regular cmdline completions
    },
    lsp = {
        signature = {
            enabled = false,
        },
        hover = {
            enabled = false,
        }
    },
    presets = {
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false,       -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false,   -- add a border to hover docs and signature help
    }
})
