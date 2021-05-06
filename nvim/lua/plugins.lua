vim.api.nvim_command('packadd packer.nvim')

return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'christianchiarulli/nvcode-color-schemes.vim'
    use 'glepnir/zephyr-nvim'
    -------------langs-----------
    use 'sheerun/vim-polyglot' -- One for all
    --------------QoL------------
    use 'tpope/vim-surround' -- Surround everything
    use 'scrooloose/nerdcommenter' -- Smart comments
    use 'jiangmiao/auto-pairs' -- Auto pairs
    use 'hrsh7th/vim-vsnip'
    use 'hrsh7th/vim-vsnip-integ'
    use 'rafamadriz/friendly-snippets'
    use 'vimwiki/vimwiki'
    use {'p00f/nvim-ts-rainbow', ft = 'clojure'}
    use {
        'Yggdroot/indentLine',
        ft = {'nim', 'python'},
        setup = function() vim.g.indentLine_char = '|' end
    }
    use 'easymotion/vim-easymotion'
    use 'romgrk/barbar.nvim' -- Best bufferline
    use 'glepnir/galaxyline.nvim'
    use 'farmergreg/vim-lastplace'
    -------------dev tools---------
    use 'liuchengxu/vista.vim'
    use {'jaxbot/browserlink.vim', ft = { 'html','css','javascript' }} -- preview
    use {'tpope/vim-fireplace', ft =  'clojure' } -- enables clojure development
    use 'kyazdani42/nvim-tree.lua'
    use {'slashmili/alchemist.vim', ft = 'elixir'}
    ---------------git------------
    use 'tpope/vim-fugitive' -- this should be illegal
    use 'mhinz/vim-signify'
    --------nvim-lsp(now)---------
    use 'neovim/nvim-lspconfig' -- Someday this will be the best
    use 'nvim-lua/lsp_extensions.nvim'
    use 'hrsh7th/nvim-compe'  -- Best completion sources
    use 'tjdevries/nlua.nvim'
    -------------telescope---------
    use 'nvim-lua/telescope.nvim'
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
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use 'kyazdani42/nvim-web-devicons'
    use 'norcalli/nvim-colorizer.lua'
    use 'akinsho/nvim-toggleterm.lua'
end)
