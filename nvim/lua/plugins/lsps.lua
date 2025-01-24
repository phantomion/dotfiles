require('lsp-setup').setup({
    inlay_hints = {
        enabled = true,
        highlight = 'Comment',
    },
    installer = {},
    default_mappings = false,
    mappings = {},
    on_attach = function(client)
        client.server_capabilities.document_formatting = true
    end,
    -- Global capabilities
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
    -- Configuration of LSP servers
    servers = {
        psalm = {},
        html = {},
        clangd = {
            cmd = { "clangd", "--offset-encoding=utf-16", "--background-index", "--suggest-missing-includes",
                "--all-scopes-completion", "--completion-style=detailed" },
        },
        pylsp = {},
        gopls = {
            settings = {
                gopls = {
                    hints = {
                        rangeVariableTypes = true,
                        parameterNames = true,
                        constantValues = true,
                        -- assignVariableTypes = true,
                        compositeLiteralFields = true,
                        compositeLiteralTypes = true,
                        functionTypeParameters = true,
                    },
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
        volar = {
            init_options = {
                vue = {
                    hybridMode = false,
                },
            },
        },
        lua_ls = {
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
        ts_ls = {
            init_options = {
                plugins = {
                    {
                        name = "@vue/typescript-plugin",
                        location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
                        languages = { "javascript", "typescript", "vue" },
                    },
                },
                preferences = {
                    disableSuggestions = true,
                }
            },
            filetypes = {
                "javascript",
                "typescript",
                "vue",
            },
        },
        angularls = {},
        cssls = {},
        dockerls = {},
        jsonls = {},
        bashls = {},
    },
})

require('rust-tools').setup({
    server = {
        settings = {
            ['rust-analyzer'] = {
                imports = {
                    granularity = {
                        group = "module",
                    },
                    prefix = "self",
                },
                cargo = {
                    buildScripts = {
                        enable = true,
                    },
                },
                procMacro = {
                    enable = true
                },
            },
        },
    },
})

local remap = vim.keymap.set
remap('n', '<leader>fm', ":lua vim.lsp.buf.format({ async = true })<CR>", { noremap = true, silent = true })
