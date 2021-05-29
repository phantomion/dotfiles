local nvim_command = vim.api.nvim_command

local on_attach_vim = function(client)
    nvim_command("autocmd CursorHold * lua require'lspsaga.diagnostic'.show_line_diagnostics()")
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspinstall'.setup() -- important

--language servers
require'lspconfig'.rust_analyzer.setup{
    on_attach = on_attach_vim,
    capabilities = capabilities,
}
require'lspconfig'.clangd.setup{
    cmd = { "clangd", "--background-index", "--suggest-missing-includes",
        "--all-scopes-completion", "--completion-style=detailed" },
    on_attach = on_attach_vim,
    capabilities = capabilities,
}
require'lspconfig'.clojure_lsp.setup{
    capabilities = capabilities,
    on_attach = on_attach_vim,
}
require'lspconfig'.nimls.setup{
    on_attach = on_attach_vim,
    capabilities = capabilities,
}
require'lspconfig'.elixirls.setup{on_attach=on_attach_vim}
require'lspconfig'.vuels.setup{
    on_attach = on_attach_vim,
    capabilities = capabilities,
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
    on_attach = on_attach_vim,
    capabilities = capabilities,
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
require'lspconfig'.pyls.setup{
    capabilities = capabilities,
    on_attach = on_attach_vim,
}
require'lspconfig'.intelephense.setup{
    capabilities = capabilities,
    on_attach = on_attach_vim,
}
require'lspconfig'.hls.setup{on_attach=on_attach_vim}

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

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif vim.fn.call("vsnip#available", {1}) == 1 then
    return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
  else
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<c-l>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

local saga = require 'lspsaga'
saga.init_lsp_saga{
    code_action_prompt = {
        enable = false,
        sign = true,
        sign_priority = 20,
        virtual_text = true,
    },
}
