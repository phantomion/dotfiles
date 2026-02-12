vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "plugins.lua",
    command = 'source % | PackerCompile',
})

local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'lewis6991/impatient.nvim'
    use {
        'glepnir/zephyr-nvim',
        config = function()
            vim.cmd [[colorscheme zephyr]]
        end,
        opt = true,
        cond = function() return true end
    }
    --------------QoL------------
    use {
        'JoosepAlviste/nvim-ts-context-commentstring',
    }
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('plugins.comment')
        end
    }
    use {
        'windwp/nvim-autopairs',
        config = function()
            require('plugins.autopairs')
        end
    }
    use { 'p00f/nvim-ts-rainbow', ft = { 'clojure', 'html', 'vue' } }
    use {
        'romgrk/barbar.nvim',
        config = function()
            require('plugins.bufferline')
        end
    }
    use {
        'glepnir/galaxyline.nvim',
        opt = true,
        cond = function() return true end,
        config = function() require('plugins.statusline') end
    }
    use 'farmergreg/vim-lastplace'
    -------------dev tools---------
    use {
        'kyazdani42/nvim-tree.lua',
        config = function()
            require('plugins.explorer')
        end
    }
    ---------------git------------
    use {
        'TimUntersberger/neogit',
        config = function()
            require('plugins.neogit')
        end
    }
    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('plugins.gitsigns')
        end
    }
    --------nvim-lsp---------
    use {
        'junnplus/lsp-setup.nvim',
        requires = {
            'neovim/nvim-lspconfig',
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
        },
        config = function() require('plugins.lsps') end
    }
    use {
        'nvimdev/lspsaga.nvim',
        after = 'nvim-lspconfig',
        config = function()
            require('plugins.lspsaga')
        end
    }
    use {
        "zbirenbaum/copilot.lua",
        event = { "VimEnter" },
        config = function()
            vim.defer_fn(function()
                require("copilot").setup()
            end, 100)
        end,
    }
    use {
        "zbirenbaum/copilot-cmp",
        after = { "copilot.lua" },
        config = function()
            require("copilot_cmp").setup()
        end
    }
    use {
        "hrsh7th/nvim-cmp",
        requires = {
            "L3MON4D3/LuaSnip",
            "rafamadriz/friendly-snippets",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-path",
            "onsails/lspkind-nvim",
            'hrsh7th/cmp-cmdline',
            "saadparwaiz1/cmp_luasnip"
        },
        config = function()
            require('plugins.cmp')
        end
    }
    use {
        "ray-x/lsp_signature.nvim",
        config = function()
            require "lsp_signature".setup()
        end
    }
    -------------telescope---------
    use {
        'nvim-lua/telescope.nvim',
        config = function()
            require('plugins.telescope')
        end
    }
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use {
        'nvim-pack/nvim-spectre',
        config = function()
            require('plugins.spectre')
        end
    }
    --------------misc------------
    use({
        "folke/noice.nvim",
        event = "VimEnter",
        config = function()
            require('plugins.noice')
        end,
        requires = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        }
    })
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function() require('plugins.treesitter') end
    }
    use {
        'kyazdani42/nvim-web-devicons',
        config = function()
            require('nvim-web-devicons').setup {
                default = true
            }
        end
    }
    use {
        'norcalli/nvim-colorizer.lua',
        config = function() require('colorizer').setup() end
    }
    use {
        'akinsho/nvim-toggleterm.lua',
        config = function()
            require('plugins.toggleterm')
        end
    }
    use 'mfussenegger/nvim-dap'
    use {
        'rcarriga/nvim-dap-ui',
        requires = {
            'nvim-neotest/nvim-nio'
        },
        config = function()
            require('plugins.dap')
        end
    }
    use {
        'ray-x/go.nvim',
        ft = { 'go' },
        requires = {
            'ray-x/guihua.lua'
        },
        config = function()
            require('go').setup({
                gopls_cmd = { vim.fn.stdpath 'data' .. '/mason/packages/gopls/gopls' },
            })
        end,
    }
    use {
        "OXY2DEV/markview.nvim",
        lazy = false,
        opts = {
            preview = {
                filetypes = { "markdown", "codecompanion" },
                ignore_buftypes = {},
            },
        },
        ft = { 'markdown', 'codecompanion' }
    }
    use {
        "olimorris/codecompanion.nvim",
        config = function()
            require("codecompanion").setup({
                extensions = {
                    mcphub = {
                        callback = "mcphub.extensions.codecompanion",
                        opts = {
                            make_vars = true,
                            make_slash_commands = true,
                            show_result_in_chat = true
                        }
                    },
                    history = {
                        enabled = true, -- defaults to true
                        opts = {
                            history_file = vim.fn.stdpath("data") .. "/codecompanion_chats.json",
                            continue_last_chat = true,
                        }
                    },
                },
                strategies = {
                    chat = {
                        name = "copilot",
                        model = "claude_code",
                        variables = {
                            ["buffer"] = {
                                opts = {
                                    default_params = 'pin', -- or 'pin'
                                },
                            },
                        },
                    },
                    inline = {
                        adapter = "copilot",
                    },
                },
            })
            vim.keymap.set({ "n", "v" }, "<leader>cc", "<cmd>CodeCompanionChat Toggle<cr>",
                { noremap = true, silent = true })
        end,
        requires = {
            "ravitemer/mcphub.nvim",
            "ravitemer/codecompanion-history.nvim"
        }
    }
    if packer_bootstrap then
        require('packer').sync()
    end
end)
