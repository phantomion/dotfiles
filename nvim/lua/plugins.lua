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
            require("nvim-autopairs.completion.compe").setup{
                map_cr = true, --  map <CR> on insert mode
                map_complete = true -- it will auto insert `(` after select function or method item
            }
        end
    }
    use {
        'hrsh7th/vim-vsnip',
        config = function()
            vim.g.vsnip_snippet_dir = vim.fn.expand('~/.config/nvim/vsnip')
        end
    }
    use 'hrsh7th/vim-vsnip-integ'
    use 'rafamadriz/friendly-snippets'
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
                current_line_blame_delay = 10,
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
        'glepnir/lspsaga.nvim',
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
            }
        end
    }
    use 'nvim-lua/lsp_extensions.nvim'
    use {
        'hrsh7th/nvim-compe',
        config = function()
            require'compe'.setup{
                enabled = true;
                autocomplete = true;
                debug = false;
                min_length = 1;
                preselect = 'enable';
                throttle_time = 80;
                source_timeout = 200;
                incomplete_delay = 400;
                max_abbr_width = 1000;
                max_kind_width = 1000;
                max_menu_width = 1000000;
                documentation = true;
                source = {
                    path = true;
                    buffer = true;
                    calc = true;
                    nvim_lsp = true;
                    nvim_lua = true;
                    vsnip = true;
                    omni = false;
                }
            }
        end
    }  -- Best completion sources
    use 'kabouzeid/nvim-lspinstall'
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
    -------------lsputils---------
    use {
        'RishabhRD/nvim-lsputils',
        requires = 'RishabhRD/popfix'
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
end)
