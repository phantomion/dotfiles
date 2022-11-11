local saga = require 'lspsaga'
saga.init_lsp_saga({
    code_action_lightbulb = {
        enable = false,
    },
    max_preview_lines = 20,
    border_style = "rounded"
})

vim.cmd([[
    au ColorScheme * highlight LspSagaDiagnosticWarning guifg='#ff922b'
    au ColorScheme * highlight LspSagaDiagnosticError guifg='#C33027'
    au ColorScheme * highlight LspSagaDiagnosticHint guifg='#15aabf'
    au ColorScheme * highlight LspSagaDiagnosticInformation guifg='#fab005'
    ]])

local remap = vim.keymap.set
remap('n', '<leader>gd', ':Telescope lsp_definitions<CR>', { noremap = true, silent = true })
remap('n', '<leader>gi', ':Telescope lsp_implementations<CR>', { noremap = true, silent = true })
remap('n', '<leader>gr', ":Telescope lsp_references<CR>", { noremap = true, silent = true })
remap('n', '<leader>pd', ":Lspsaga peek_definition<CR>", { noremap = true, silent = true })
remap('n', '<leader>gh', ":Lspsaga lsp_finder<CR>", { noremap = true, silent = true })
remap('n', '<leader>rn', ":Lspsaga rename<CR>", { noremap = true, silent = true })
remap('n', '<A-m>', ":Lspsaga hover_doc<CR>", { noremap = true, silent = true })
remap('n', '<leader>ga', ":Lspsaga code_action<CR>", { noremap = true, silent = true })
remap('n', '<leader>]', ":Lspsaga diagnostic_jump_next<CR>", { noremap = true, silent = true })
remap('n', '<leader>[', ":Lspsaga diagnostic_jump_prev<CR>", { noremap = true, silent = true })
-- Symbols outline
remap('n', '<C-b>', ':LSoutlineToggle<CR>', { noremap = true, silent = true })

local signs = {
    Error = ' ',
    Warn = ' ',
    Info = ' ',
    Hint = 'ﴞ ',
}
for type, icon in pairs(signs) do
    local hl = 'DiagnosticSign' .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
    signs = true,
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    virtual_text = false,
})
