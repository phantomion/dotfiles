local nvim_command = vim.api.nvim_command

local on_attach_vim = function(client)
    nvim_command("autocmd CursorHold * lua require'lspsaga.diagnostic'.show_line_diagnostics()")
end

require'rust-tools'.setup({
    server = {
        capabilities = capabilities,
        on_attach = on_attach_vim
    }
})

local function make_config()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    return {
        -- enable snippet support
        capabilities = capabilities,
        -- map buffer local keybindings when the language server attaches
        on_attach = on_attach_vim,
    }
end

local function setup_servers()
    require'lspinstall'.setup()
    local servers = require'lspinstall'.installed_servers()

    for _, server in pairs(servers) do
        --print(server)
        local config = make_config()
        if server == "clangd" then
            config.cmd = { "clangd", "--background-index", "--suggest-missing-includes",
            "--all-scopes-completion", "--completion-style=detailed" }
        end
        if server == "vuels" then
            config.settings = {
                vetur = {
                    completion = {
                        autoImport = true;
                        useScaffoldSnippets = true;
                    }
                }
            }
        end
        if server == "texlab" then
            config.settings = {
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
        end
        require'lspconfig'[server].setup(config)
    end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function ()
    setup_servers() -- reload installed servers
    vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end


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

--new diagnostic
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false,
        underline = true,

        signs = true,

        update_in_insert = false,
    }
)
