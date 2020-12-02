call plug#begin('~/.local/share/nvim/plugged')
" -------colorschemes--------
"Plug 'Erichain/vim-monokai-pro'
Plug 'srcery-colors/srcery-vim'
"Plug 'dracula/vim'
Plug 'christianchiarulli/nvcode-color-schemes.vim'
Plug 'glepnir/zephyr-nvim'
" -----------langs-----------
Plug 'sheerun/vim-polyglot' " One for all
" ------------QoL------------
Plug 'tpope/vim-surround' " Surround everything
Plug 'scrooloose/nerdcommenter' " Smart comments
Plug 'honza/vim-snippets' " needed for C/C++ snippets for some reason
Plug 'SirVer/ultisnips'
Plug 'jiangmiao/auto-pairs' " Auto pairs
Plug 'vimwiki/vimwiki'
Plug 'luochen1990/rainbow', {'for': 'clojure'}
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
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'steelsojka/completion-buffers'
Plug 'tjdevries/nlua.nvim'
"-----------telescope---------
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
"------------lsputils---------
Plug 'RishabhRD/popfix'
Plug 'RishabhRD/nvim-lsputils'
" ------------misc------------
Plug 'ron-rs/ron.vim', {'for': 'ron'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'kyazdani42/nvim-web-devicons'
Plug 'norcalli/nvim-colorizer.lua'
call plug#end()
