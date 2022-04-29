vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "plugins.lua",
    command = 'source % | PackerCompile',
})
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path })
    execute 'packadd packer.nvim'
end
vim.api.nvim_command('packadd packer.nvim')

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
        config = function()
            require 'nvim-treesitter.configs'.setup {
                context_commentstring = {
                    enable = true,
                    enable_autocmd = false,
                }
            }
        end
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
    use 'simrat39/symbols-outline.nvim'
    use { 'tpope/vim-fireplace', ft = 'clojure' } -- enables clojure development
    use {
        'kyazdani42/nvim-tree.lua',
        config = function()
            vim.g.nvim_tree_git_hl = 1
            vim.g.nvim_tree_highlight_opened_files = 1
            vim.g.nvim_tree_respect_buf_cwd = 1
            local tree_cb = require 'nvim-tree.config'.nvim_tree_callback
            require 'nvim-tree'.setup {
                update_cwd = true,
                view = {
                    width = 27,
                    mappings = {
                        list = {
                            { key = { "h", "l" }, cb = tree_cb("edit") },
                            { key = { "<CR>" }, cb = tree_cb("cd") }
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
            require('neogit').setup {
                integrations = {
                    diffview = true
                },
            }
        end
    }
    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup {
                signs = {
                    add          = { hl = 'GitSignsAdd', text = '+', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
                    change       = { hl = 'GitSignsChange', text = '~', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
                    delete       = { hl = 'GitSignsDelete', text = '-', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
                    topdelete    = { hl = 'GitSignsDelete', text = '-', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
                    changedelete = { hl = 'GitSignsChange', text = '~', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
                },
                current_line_blame_opts = {
                    delay = 10,
                }
            }
        end
    }
    use {
        'sindrets/diffview.nvim',
        config = function()
            local cb = require 'diffview.config'.diffview_callback

            require 'diffview'.setup {
                diff_binaries = false, -- Show diffs for binaries
                use_icons = true, -- Requires nvim-web-devicons
                file_panel = {
                    width = 35,
                },
                key_bindings = {
                    disable_defaults = false, -- Disable the default key bindings
                    -- The `view` bindings are active in the diff buffers, only when the current
                    -- tabpage is a Diffview.
                    view = {
                        ["<tab>"]     = cb("select_next_entry"), -- Open the diff for the next file
                        ["<s-tab>"]   = cb("select_prev_entry"), -- Open the diff for the previous file
                        ["<leader>e"] = cb("focus_files"), -- Bring focus to the files panel
                        ["<leader>b"] = cb("toggle_files"), -- Toggle the files panel.
                    },
                    file_panel = {
                        ["j"]             = cb("next_entry"), -- Bring the cursor to the next file entry
                        ["<down>"]        = cb("next_entry"),
                        ["k"]             = cb("prev_entry"), -- Bring the cursor to the previous file entry.
                        ["<up>"]          = cb("prev_entry"),
                        ["<cr>"]          = cb("select_entry"), -- Open the diff for the selected entry.
                        ["o"]             = cb("select_entry"),
                        ["<2-LeftMouse>"] = cb("select_entry"),
                        ["-"]             = cb("toggle_stage_entry"), -- Stage / unstage the selected entry.
                        ["S"]             = cb("stage_all"), -- Stage all entries.
                        ["U"]             = cb("unstage_all"), -- Unstage all entries.
                        ["R"]             = cb("refresh_files"), -- Update stats and entries in the file list.
                        ["<tab>"]         = cb("select_next_entry"),
                        ["<s-tab>"]       = cb("select_prev_entry"),
                        ["<leader>e"]     = cb("focus_files"),
                        ["<leader>b"]     = cb("toggle_files"),
                    }
                }
            }
        end
    }
    --------nvim-lsp---------
    use {
        'neovim/nvim-lspconfig',
        opt = true,
        cond = function() return true end,
        config = function() require('lsps') end
    }
    use {
        'tami5/lspsaga.nvim',
        config = function()
            local saga = require 'lspsaga'
            saga.init_lsp_saga {
                error_sign = '',
                warn_sign = '',
                hint_sign = '',
                infor_sign = '',
                code_action_prompt = {
                    enable = false,
                    sign = true,
                    sign_priority = 20,
                    virtual_text = true,
                },
                max_preview_lines = 20,
                border_style = "round"
            }
        end
    }
    use 'williamboman/nvim-lsp-installer'
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
                return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
            end

            local cmp = require 'cmp'
            local cmp_autopairs = require('nvim-autopairs.completion.cmp')
            cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
            cmp_autopairs.lisp[#cmp_autopairs.lisp + 1] = "racket"

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
                        luasnip = "[LuaSnip]"
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
        config = function()
            require('telescope').setup({
                defaults = {
                    file_sorter = require('telescope.sorters').get_fzy_sorter
                }
            })
        end
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
        'nvim-treesitter/nvim-treesitter',
        -- commit = '668de0951a36ef17016074f1120b6aacbe6c4515',
        run = ':TSUpdate',
        config = function() require('misc') end
    }
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use 'kyazdani42/nvim-web-devicons'
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
end)
