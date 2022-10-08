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
    use { 'christianchiarulli/nvcode-color-schemes.vim',
        opt = true,
        cond = function() return false end
    }
    use {
        'titanzero/zephyrium',
        config = function()
            vim.cmd [[colorscheme zephyrium]]
        end,
        opt = true,
        cond = function() return true end
    }
    use {
        'rebelot/kanagawa.nvim',
        config = function()
            vim.cmd [[colorscheme kanagawa]]
        end,
        opt = true,
        cond = function() return false end
    }
    use {
        'EdenEast/nightfox.nvim',
        config = function()
            vim.g.nightfox_style = "palefox"
            require('nightfox').set()
        end,
        opt = true,
        cond = function() return false end
    }
    --------------QoL------------
    use {
        'JoosepAlviste/nvim-ts-context-commentstring',
    }
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup({
                toggler = {
                    line = '<leader>cl',
                },
                opleader = {
                    ---Block-comment keymap
                    block = '<leader>ci',
                },
                pre_hook = function(ctx)
                    local U = require 'Comment.utils'

                    local location = nil
                    if ctx.ctype == U.ctype.block then
                        location = require('ts_context_commentstring.utils').get_cursor_location()
                    elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
                        location = require('ts_context_commentstring.utils').get_visual_start_location()
                    end

                    return require('ts_context_commentstring.internal').calculate_commentstring {
                        key = ctx.ctype == U.ctype.line and '__default' or '__multiline',
                        location = location,
                    }
                end,
            })
        end
    }
    use {
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup {
                fast_wrap = {},
            }
        end
    }
    use { 'p00f/nvim-ts-rainbow', ft = { 'clojure', 'html', 'vue' } }
    use 'romgrk/barbar.nvim' -- Best bufferline
    use {
        'NTBBloodbath/galaxyline.nvim',
        opt = true,
        cond = function() return true end,
        config = function() require('mygalaxyline') end
    }
    use 'farmergreg/vim-lastplace'
    -------------dev tools---------
    use {
        'kyazdani42/nvim-tree.lua',
        config = function()
            require 'nvim-tree'.setup {
                update_cwd = true,
                view = {
                    width = 27,
                    mappings = {
                        list = {
                            { key = { "h", "l" }, action = "edit" },
                            { key = { "<CR>" }, action = "cd" }
                        }
                    }
                },
                filters = {
                    exclude = { '.git', 'node_modules', '.cache', 'target', '.o', 'bin' },
                },
                diagnostics = {
                    enable = true
                },
                renderer = {
                    highlight_git = true,
                    indent_markers = {
                        enable = true,
                    },
                },
            }
        end
    }
    ---------------git------------
    use {
        'TimUntersberger/neogit',
        config = function()
            require('neogit').setup {}
        end
    }
    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup {
                signs = {
                    add          = { hl = 'GitSignsAdd', text = '+', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
                    change       = { hl = 'GitSignsChange', text = '~', numhl = 'GitSignsChangeNr',
                        linehl = 'GitSignsChangeLn' },
                    delete       = { hl = 'GitSignsDelete', text = '-', numhl = 'GitSignsDeleteNr',
                        linehl = 'GitSignsDeleteLn' },
                    topdelete    = { hl = 'GitSignsDelete', text = '-', numhl = 'GitSignsDeleteNr',
                        linehl = 'GitSignsDeleteLn' },
                    changedelete = { hl = 'GitSignsChange', text = '~', numhl = 'GitSignsChangeNr',
                        linehl = 'GitSignsChangeLn' },
                },
                current_line_blame_opts = {
                    delay = 10,
                }
            }
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
        config = function() require('lsps') end
    }
    use {
        'glepnir/lspsaga.nvim',
        branch = "main",
        config = function()
            local saga = require 'lspsaga'
            saga.init_lsp_saga({
                code_action_lightbulb = {
                    enable = false,
                },
                max_preview_lines = 20,
                border_style = "rounded"
            })
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

            local luasnip = require('luasnip')
            require("luasnip.loaders.from_vscode").lazy_load()
            require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./snips" } })
            local has_words_before = function()
                if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
                    return false
                end
                local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                return col ~= 0 and
                    vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
            end

            local cmp = require 'cmp'
            local cmp_autopairs = require('nvim-autopairs.completion.cmp')
            cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

            cmp.setup {
                snippet = {
                    expand = function(args)
                        require 'luasnip'.lsp_expand(args.body)
                    end,
                },
                mapping = {
                    ['<C-b>']     = cmp.mapping.scroll_docs(-4),
                    ['<C-f>']     = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>']     = cmp.mapping.close(),
                    ['<CR>']      = cmp.mapping.confirm {
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = true,
                    },
                    ['<Tab>']     = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        elseif has_words_before() then
                            cmp.complete()
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                    ['<S-Tab>']   = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                },
                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'nvim_lua' },
                    { name = 'luasnip' },
                    { name = 'cmp_tabnine' },
                    { name = 'copilot' },
                    { name = 'path' },
                    { name = 'buffer' }
                },
                formatting = {
                    format = require("lspkind").cmp_format({ with_text = true, menu = ({
                        buffer = "[Buffer]",
                        nvim_lsp = "[LSP]",
                        nvim_lua = "[Lua]",
                        path = "[Path]",
                        cmp_tabnine = "[TabNine]",
                        luasnip = "[LuaSnip]",
                        copilot = "[Copilot]"
                    }) }),
                },
            }

            -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline('/', {
                sources = {
                    { name = 'buffer' }
                }
            })

            -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline(':', {
                sources = cmp.config.sources({
                    { name = 'path' }
                }, {
                    { name = 'cmdline' }
                }),
                mapping = cmp.mapping.preset.cmdline({}), -- This line
            })
        end
    }
    use { 'tzachar/cmp-tabnine', run = './install.sh' }
    use {
        "ray-x/lsp_signature.nvim",
        config = function()
            require "lsp_signature".setup()
        end
    }
    -------------telescope---------
    use {
        'nvim-lua/telescope.nvim',
    }
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use {
        'windwp/nvim-spectre',
        config = function()
            require('spectre').setup()
        end
    }
    --------------misc------------
    use { 'ron-rs/ron.vim', ft = 'ron' }
    use {
        'rcarriga/nvim-notify',
        config = function() vim.notify = require("notify") end
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function() require('misc') end
    }
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use {
        'kyazdani42/nvim-web-devicons',
        config = function() require('nvim-web-devicons').setup{
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
            require("toggleterm").setup {
                open_mapping = [[<A-d>]],
                direction = 'float',
                float_opts = {
                    border = 'curved',
                },
            }
        end
    }
    use 'mfussenegger/nvim-dap'
    use {
        'rcarriga/nvim-dap-ui',
        config = function()
            require("dapui").setup()
        end
    }
    use {
        'simrat39/rust-tools.nvim',
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
    if packer_bootstrap then
        require('packer').sync()
    end
end)
