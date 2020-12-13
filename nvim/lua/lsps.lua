local nvim_command = vim.api.nvim_command

local on_attach_vim = function(client)
    nvim_command('autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()')
    require'completion'.on_attach(client)
end

--language servers
require'lspconfig'.rust_analyzer.setup{on_attach=on_attach_vim}
require'lspconfig'.clangd.setup{on_attach=on_attach_vim}
require'lspconfig'.clojure_lsp.setup{on_attach=on_attach_vim}
require'lspconfig'.nimls.setup{on_attach=on_attach_vim}
--require'lspconfig'.bashls.setup{on_attach=on_attach_vim}
require'lspconfig'.elixirls.setup{on_attach=on_attach_vim}
require('nlua.lsp.nvim').setup(require('lspconfig'), {
        on_attach = on_attach_vim,
        globals = {
            "Color", "c", "Group", "g", "s",
        }
    })

local actions = require('telescope.actions')
require'telescope'.setup{
    defaults = {
        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,

                ["<C-c>"] = actions.close,

                ["<Down>"] = actions.move_selection_next,
                ["<Up>"] = actions.move_selection_previous,

                ["<CR>"] = actions.goto_file_selection_edit + actions.center,
                ["<TAB>"] = actions.goto_file_selection_edit + actions.center,
                ["<C-x>"] = actions.goto_file_selection_split,
                ["<C-v>"] = actions.goto_file_selection_vsplit,
                ["<C-t>"] = actions.goto_file_selection_tabedit,

                ["<C-u>"] = actions.preview_scrolling_up,
                ["<C-d>"] = actions.preview_scrolling_down,

                -- TODO: When we implement multi-select, you can turn this back on :)
            -- ["<Tab>"] = actions.add_selection,
        },

        n = {
            ["<esc>"] = actions.close,
            ["<CR>"] = actions.goto_file_selection_edit + actions.center,
            ["<C-x>"] = actions.goto_file_selection_split,
            ["<C-v>"] = actions.goto_file_selection_vsplit,
            ["<C-t>"] = actions.goto_file_selection_tabedit,

            -- TODO: This would be weird if we switch the ordering.
                ["j"] = actions.move_selection_next,
                ["k"] = actions.move_selection_previous,

                ["<Down>"] = actions.move_selection_next,
                ["<Up>"] = actions.move_selection_previous,

                ["<C-u>"] = actions.preview_scrolling_up,
                ["<C-d>"] = actions.preview_scrolling_down,
            },
        }
    }
}

--lsputils plugin
vim.lsp.handlers['textDocument/codeAction'] = require'lsputil.codeAction'.code_action_handler
vim.lsp.handlers['textDocument/references'] = require'lsputil.locations'.references_handler
vim.lsp.handlers['textDocument/definition'] = require'lsputil.locations'.definition_handler
vim.lsp.handlers['textDocument/declaration'] = require'lsputil.locations'.declaration_handler
vim.lsp.handlers['textDocument/typeDefinition'] = require'lsputil.locations'.typeDefinition_handler
vim.lsp.handlers['textDocument/implementation'] = require'lsputil.locations'.implementation_handler
vim.lsp.handlers['textDocument/documentSymbol'] = require'lsputil.symbols'.document_handler
vim.lsp.handlers['workspace/symbol'] = require'lsputil.symbols'.workspace_handler

--new diagnostic
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
    underline = true,

    signs = true,

    update_in_insert = false,
  }
)
