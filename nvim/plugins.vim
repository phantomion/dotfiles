call plug#begin('~/.local/share/nvim/plugged')
" -------colorschemes--------
Plug 'srcery-colors/srcery-vim'
Plug 'christianchiarulli/nvcode-color-schemes.vim'
Plug 'glepnir/zephyr-nvim'
Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }
" -----------langs-----------
Plug 'sheerun/vim-polyglot' " One for all
" ------------QoL------------
Plug 'tpope/vim-surround' " Surround everything
Plug 'scrooloose/nerdcommenter' " Smart comments
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'rafamadriz/friendly-snippets'
Plug 'jiangmiao/auto-pairs' " Auto pairs
Plug 'vimwiki/vimwiki'
Plug 'p00f/nvim-ts-rainbow', {'for': 'clojure'}
Plug 'Yggdroot/indentLine', {'for': 'nim'}
Plug 'easymotion/vim-easymotion'
Plug 'romgrk/barbar.nvim' " Best bufferline
Plug 'glepnir/galaxyline.nvim'
Plug 'farmergreg/vim-lastplace'
" -----------dev tools---------
Plug 'liuchengxu/vista.vim'
Plug 'jaxbot/browserlink.vim', {'for': ['html','css','javascript']} " preview
Plug 'tpope/vim-fireplace', { 'for': 'clojure' } " enables clojure development
Plug 'kyazdani42/nvim-tree.lua'
Plug 'slashmili/alchemist.vim', { 'for': 'elixir'}
" -------------git------------
Plug 'tpope/vim-fugitive' " this should be illegal
Plug 'mhinz/vim-signify'
"-------nvim-lsp(now)---------
Plug 'neovim/nvim-lspconfig' " Someday this will be the best
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'hrsh7th/nvim-compe'  " Best completion sources
Plug 'tjdevries/nlua.nvim'
"-----------telescope---------
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'windwp/nvim-spectre'
"------------lsputils---------
Plug 'RishabhRD/popfix'
Plug 'RishabhRD/nvim-lsputils'
" ------------misc------------
Plug 'ron-rs/ron.vim', {'for': 'ron'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'kyazdani42/nvim-web-devicons'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'akinsho/nvim-toggleterm.lua'
call plug#end()
