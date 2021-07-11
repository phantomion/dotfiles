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
    use 'glepnir/zephyr-nvim'
    -------------langs-----------
    use 'sheerun/vim-polyglot' -- One for all
    --------------QoL------------
    use 'tpope/vim-surround' -- Surround everything
    use 'scrooloose/nerdcommenter' -- Smart comments
    use 'jiangmiao/auto-pairs' -- Auto pairs
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
    use {
        'Yggdroot/indentLine',
        ft = {'nim', 'python'},
        setup = function() vim.g.indentLine_char = '|' end
    }
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
    use {'jaxbot/browserlink.vim', ft = { 'html','css','javascript' }} -- preview
    use {'tpope/vim-fireplace', ft =  'clojure' } -- enables clojure development
    use 'kyazdani42/nvim-tree.lua'
    use {'slashmili/alchemist.vim', ft = 'elixir'}
    ---------------git------------
    use {
        'TimUntersberger/neogit',
        config = function()
            local neogit = require('neogit')

            neogit.setup {
                integrations = {
                    diffview = true
                },
            }
        end
    }
    use 'mhinz/vim-signify'
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
    use 'tjdevries/nlua.nvim'
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
    use 'windwp/nvim-spectre'
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
