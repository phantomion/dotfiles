require('lsp-setup').setup({
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
        html = {},
        clangd = {
            cmd = { "clangd", "--offset-encoding=utf-16", "--background-index", "--suggest-missing-includes",
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
    },
})

local remap = vim.keymap.set
remap('n', '<leader>fm', ":lua vim.lsp.buf.format({ async = true })<CR>", { noremap = true, silent = true })
