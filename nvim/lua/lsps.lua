require('lsp-setup').setup({
    installer = {},
    default_mappings = false,
    mappings = {},
    on_attach = function(client)
        vim.api.nvim_create_autocmd("CursorHold", {
            group = general,
            pattern = "*",
            command = 'Lspsaga show_cursor_diagnostics',
        })
        client.server_capabilities.document_formatting = true
    end,
    -- Global capabilities
    capabilities = vim.lsp.protocol.make_client_capabilities(),
    -- Configuration of LSP servers
    servers = {
        html = {},
        clangd = {
            cmd = { "clangd", "--background-index", "--suggest-missing-includes",
                "--all-scopes-completion", "--completion-style=detailed" },
        },
        pylsp = {},
        gopls = {
            settings = {
                gopls = {
                    gofumpt = true,
                    experimentalPostfixCompletions = true,
                    analyses = {
                        unusedparams = true,
                    },
                    staticcheck = true
                }
            }
        },
        texlab = {
            settings = {
                latex = {
                    build = {
                        args = { "-lualatex", "-pvc", "-view=pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
                        executable = "latexmk",
                        onSave = true,
                        isContinuous = true,
                    },
                    lint = {
                        onChange = true
                    }
                }
            }
        },
        vuels = {
            settings = {
                vetur = {
                    completion = {
                        autoImport = true;
                        useScaffoldSnippets = true;
                    },
                    format = {
                        enable = true,
                        options = {
                            tabSize = 4
                        },
                        defaultFormatter = {
                            js = "prettier",
                            html = "prettier",
                            css = "prettier",
                            scss = "prettier",
                            ts = "prettier"
                        },
                    },
                },
            },
        },
        sumneko_lua = {
            settings = {
                Lua = {
                    runtime = {
                        path = runtime_path,
                    },
                    diagnostics = {
                        globals = { 'vim', 'capabilities', 'use' },
                    },
                    workspace = {
                        -- Make the server aware of Neovim runtime files
                        library = vim.api.nvim_get_runtime_file("", true),
                    },
                    telemetry = {
                        enable = false,
                    },
                },
            },
        },
        tsserver = {},
        angularls = {},
        cssls = {},
        dockerls = {},
        golangci_lint_ls = {},
        jsonls = {},
        rust_analyzer = require('lsp-setup.rust-tools').setup({
            server = {
                settings = {
                    ['rust-analyzer'] = {
                        cargo = {
                            loadOutDirsFromCheck = true,
                        },
                        procMacro = {
                            enable = true,
                        },
                    },
                },
            },
        })
    },
})

local actions = require('telescope.actions')
require 'telescope'.setup {
    defaults = {
        file_sorter = require('telescope.sorters').get_fzy_sorter,
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
