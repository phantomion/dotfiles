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
require'lspconfig'.elixirls.setup{on_attach=on_attach_vim}
require'lspconfig'.vuels.setup{
    on_attach=on_attach_vim;
    settings = {
        vetur = {
            completion = {
                autoImport = true;
                useScaffoldSnippets = true;
            }
        }
    }
}
require'lspconfig'.texlab.setup{
    on_attach=on_attach_vim;
    settings = {
        latex = {
            build = {
                args = { "-lualatex", "-interaction=nonstopmode", "-synctex=1", "%f" };
                executable = "latexmk";
                onSave = true;
            },
            lint = {
                onChange = true
            }
        }
    }
}
require'lspconfig'.tsserver.setup{on_attach=on_attach_vim}
require'lspconfig'.pyls.setup{on_attach=on_attach_vim}
require'lspconfig'.hls.setup{on_attach=on_attach_vim}
--require'lspconfig'.jedi_language_server.setup{on_attach=on_attach_vim}
--require('nlua.lsp.nvim').setup(require('lspconfig'), {
    --on_attach = on_attach_vim,
    --globals = {
        --"Color", "c", "Group", "g", "s",
    --}
--})

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

                ["<CR>"] = actions.select_default + actions.center,
                ["<C-x>"] = actions.select_horizontal,
                ["<C-v>"] = actions.select_vertical,
                ["<C-t>"] = actions.select_tab,

                ["<C-u>"] = actions.preview_scrolling_up,
                ["<C-d>"] = actions.preview_scrolling_down,

                ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                ["<C-l>"] = actions.complete_tag
            },

            n = {
                ["<esc>"] = actions.close,
                ["<CR>"] = actions.select_default + actions.center,
                ["<C-x>"] = actions.select_horizontal,
                ["<C-v>"] = actions.select_vertical,
                ["<C-t>"] = actions.select_tab,

                ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

                -- TODO: This would be weird if we switch the ordering.
                ["j"] = actions.move_selection_next,
                ["k"] = actions.move_selection_previous,
                ["H"] = actions.move_to_top,
                ["M"] = actions.move_to_middle,
                ["L"] = actions.move_to_bottom,

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
