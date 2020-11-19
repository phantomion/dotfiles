vim.cmd [[packadd packer.nvim]]
--vim._update_package_paths()

return require('packer').startup(function()
    use {'wbthomason/packer.nvim', opt = true}
    --"use 'Erichain/vim-monokai-pro'
    use 'srcery-colors/srcery-vim'
    use 'dracula/vim'
    --"use 'ayu-theme/ayu-vim'
    --"use 'christianchiarulli/nvcode-color-schemes.vim'
    --"use 'glepnir/zephyr-nvim'
    -------------langs-----------
    use 'sheerun/vim-polyglot' -- One for all
    --------------QoL------------
    use 'tpope/vim-surround' -- Surround everything
    use 'scrooloose/nerdcommenter' -- Smart comments
    use 'honza/vim-snippets'
    use 'SirVer/ultisnips'
    use 'jiangmiao/auto-pairs' -- Auto pairs
    use 'vimwiki/vimwiki'
    use {'luochen1990/rainbow', ft = 'clojure'}
    use {'Yggdroot/indentLine', ft = 'nim'}
    use 'easymotion/vim-easymotion'
    use 'romgrk/barbar.nvim' -- Best bufferline
    use 'glepnir/galaxyline.nvim'
    use 'farmergreg/vim-lastplace'
    -------------dev tools---------
    use 'majutsushi/tagbar' -- too good to be true
    use {'jaxbot/browserlink.vim', ft = { 'html','css','javascript' }} -- preview
    use {'tpope/vim-fireplace', ft =  'clojure' } -- enables clojure development
    use 'kyazdani42/nvim-tree.lua'
    use {'slashmili/alchemist.vim', ft = 'elixir'}
    ---------------git------------
    use 'tpope/vim-fugitive' -- this should be illegal
    use 'mhinz/vim-signify'
    use 'tpope/vim-rhubarb'
    --------nvim-lsp(now)---------
    use 'neovim/nvim-lspconfig' -- Someday this will be the best
    use 'nvim-lua/diagnostic-nvim'
    use 'nvim-lua/completion-nvim'
    use 'nvim-lua/lsp_extensions.nvim'
    use 'steelsojka/completion-buffers'
    use 'tjdevries/nlua.nvim'
    -------------telescope---------
    use {
        'nvim-lua/telescope.nvim',
        requires = {'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim'}
    }
    -------------lsputils---------

    use {
        'RishabhRD/nvim-lsputils',
        requires = 'RishabhRD/popfix'
    }
    --Debugger plugins
    --use 'puremourning/vimspector'
    --use 'szw/vim-maximizer'
    --------------misc------------
    use {'ron-rs/ron.vim', ft = 'ron'}
    use 'nvim-treesitter/nvim-treesitter'
    use 'kyazdani42/nvim-web-devicons'
    use 'norcalli/nvim-colorizer.lua'
end)
