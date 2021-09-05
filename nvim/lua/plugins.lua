vim.cmd([[autocmd BufWritePost plugins.lua source % | PackerCompile]])
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
    execute 'packadd packer.nvim'
end
vim.api.nvim_command('packadd packer.nvim')

return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use {'christianchiarulli/nvcode-color-schemes.vim',
        opt = true,
        cond = function() return false end
    }
    use {
        'glepnir/zephyr-nvim',
        config = function()
            require('zephyr')
        end,
        opt = true,
        cond = function() return true end
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
        "blackCauldron7/surround.nvim",
        config = function()
            require "surround".setup {}
            vim.g.surround_mappings_style = "surround"
        end
    }
    use {
        'JoosepAlviste/nvim-ts-context-commentstring',
        config = function()
            require'nvim-treesitter.configs'.setup {
                context_commentstring = {
                    enable = true,
                    enable_autocmd = false,
                }
            }
        end
    }
    use {
        'b3nj5m1n/kommentary',
        config = function()
            vim.g.kommentary_create_default_mappings = false
            require('kommentary.config').configure_language('vue', {
                single_line_comment_string = 'auto',
                multi_line_comment_strings = 'auto',
                hook_function = function()
                    require('ts_context_commentstring.internal').update_commentstring()
                end,
            })
        end
    }
    use {
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup{
                fast_wrap = {
                    end_key = 'e',
                },
            }
            require("nvim-autopairs.completion.cmp").setup({
                map_cr = true, --  map <CR> on insert mode
                map_complete = true, -- it will auto insert `(` after select function or method item
                auto_select = true -- automatically select the first item
            })
        end
    }
    use 'vimwiki/vimwiki'
    use {'p00f/nvim-ts-rainbow', ft = 'clojure'}
    use 'romgrk/barbar.nvim' -- Best bufferline
    use {
        'glepnir/galaxyline.nvim',
        opt = true,
        cond = function() return true end,
        config = function() require('mygalaxyline') end
    }
    use 'farmergreg/vim-lastplace'
    -------------dev tools---------
    use 'simrat39/symbols-outline.nvim'
    use {'tpope/vim-fireplace', ft =  'clojure' } -- enables clojure development
    use {
        'kyazdani42/nvim-tree.lua',
        config = function()
            vim.g.nvim_tree_width = 27
            vim.g.nvim_tree_indent_markers = 1
            vim.g.nvim_tree_ignore = { '.git', 'node_modules', '.cache', 'target', '.o', 'bin' }
            vim.g.nvim_tree_git_hl = 1
            vim.g.nvim_tree_disable_netrw = 0
            vim.g.nvim_tree_hijack_netrw = 0
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
            require('gitsigns').setup{
                signs = {
                    add          = {hl = 'GitSignsAdd'   , text = '+', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
                    change       = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
                    delete       = {hl = 'GitSignsDelete', text = '-', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
                    topdelete    = {hl = 'GitSignsDelete', text = '-', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
                    changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
                },
                current_line_blame_opts = {
                    delay = 10,
                }
            }
        end
    }
    use 'sindrets/diffview.nvim'
    --------nvim-lsp(now)---------
    use {
        'neovim/nvim-lspconfig',
        opt = true,
        cond = function() return true end,
        config = function() require('lsps') end
    }
    use {
        'jasonrhansen/lspsaga.nvim',
        branch = 'finder-preview-fixes',
        config = function()
            local saga = require 'lspsaga'
            saga.init_lsp_saga{
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
    use 'kabouzeid/nvim-lspinstall'
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
            "saadparwaiz1/cmp_luasnip"
        },
        config = function()
            local luasnip = require('luasnip')
            require("luasnip.loaders.from_vscode").lazy_load()

            local check_back_space = function()
                local col = vim.fn.col('.') - 1
                return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s')
            end

            local t = function(str)
                return vim.api.nvim_replace_termcodes(str, true, true, true)
            end

            local cmp = require'cmp'
            cmp.setup({
                snippet = {
                    expand = function(args)
                        require'luasnip'.lsp_expand(args.body)
                    end,
                },
                mapping = {
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.close(),
                    ['<CR>'] = cmp.mapping.confirm(),
                    ['<Tab>'] = cmp.mapping(function(fallback)
                        if vim.fn.pumvisible() == 1 then
                            vim.fn.feedkeys(t('<C-n>'), 'n')
                        elseif check_back_space() then
                            vim.fn.feedkeys(t('<Tab>'), 'n')
                        elseif luasnip and luasnip.expand_or_jumpable() then
                            vim.fn.feedkeys(t('<Plug>luasnip-expand-or-jump'), '')
                        else
                            fallback()
                        end
                    end, {'i', 's'}),
                    ['<S-Tab>'] = cmp.mapping(function(fallback)
                        if vim.fn.pumvisible() == 1 then
                            vim.fn.feedkeys(t("<C-p>"), "n")
                        elseif luasnip and luasnip.jumpable(-1) then
                            vim.fn.feedkeys(t('<Plug>luasnip-jump-prev'), "")
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                },
                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'nvim_lua' },
                    { name = 'path' },
                    { name = 'buffer' },
                    { name = 'luasnip' }
                },
                formatting = {
                    format = function(entry, vim_item)
                        vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind
                        -- set a name for each source
                        vim_item.menu = ({
                            buffer = "[Buffer]",
                            nvim_lsp = "[LSP]",
                            nvim_lua = "[Lua]",
                            path = "[Path]",
                            luasnip = "[LuaSnip]"
                        })[entry.source.name]
                        return vim_item
                    end,
                },
            })
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
    use {'ron-rs/ron.vim', ft = 'ron'}
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function() require('misc') end
    }
    use 'kyazdani42/nvim-web-devicons'
    use {
        'norcalli/nvim-colorizer.lua',
        config = function() require('colorizer').setup() end
    }
    use 'akinsho/nvim-toggleterm.lua'
    use 'mfussenegger/nvim-dap'
    use 'rcarriga/nvim-dap-ui'
    use {
        'simrat39/rust-tools.nvim',
    }
end)
