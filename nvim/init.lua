require('plugins')

vim.g.colors_name = 'zephyr'
vim.g.mapleader = ' '
if (vim.fn.has('termguicolors')) then
    vim.o.termguicolors = true
end

if (vim.fn.has('nvim')) then
    vim.cmd('let $NVIM_TUI_ENABLE_TRUE_COLOR=1')
end

require('plugin_settings')
-- Editor
--
vim.o.hidden = true
vim.o.updatetime = 50
vim.opt.shortmess:append({c = true})
vim.opt.mouse:append({ a = true })
vim.o.nu = true -- Enable line numbers
vim.o.modifiable = true
vim.o.autoread = true
vim.o.relativenumber = true -- Enable relative line numbers
vim.o.wrap = false
vim.o.syntax =  "on" -- Enable syntax highlighting
vim.cmd('filetype plugin indent on')
vim.o.autoindent = true -- Set code autoindentation
vim.o.cursorline = true -- Highlight current line
vim.o.expandtab = true -- don't use actual tab character (ctrl-v)
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4 -- indenting is 4 spaces
vim.o.smartindent = true -- does the right thing (mostly) in programs
vim.o.cindent = true -- stricter rules for C programs
vim.o.splitbelow = true
vim.o.splitright = true -- Splits open at the bottom and right
vim.o.showmode = false -- Don't show the indicator in insert mode.
vim.opt.completeopt:append({"noinsert", "menuone", "noselect"}) -- Improve completion menu
vim.o.undofile = true
vim.o.inccommand = "split"
vim.o.clipboard = "unnamedplus"
vim.o.backup = false
vim.o.writebackup = false
vim.opt.wildignore:append({
        "*/tmp/*", "*.so", "*.swp", "*.zip", "*.d", "*.o",
        "*.bin", "*.sh", "*.svg", "*.mkv", "*.png", "*.mkv",
        "*.avi", "*.mp4", "*.iso", "*.tar.gz", "*.jpg", "*.pdf",
        "*.class", "target/*"
    })
vim.o.so = 12
vim.o.ttimeoutlen = 0
vim.o.signcolumn = "yes"
vim.o.colorcolumn = "80"

--" Set the backup/undo/swap files to be in /tmp
vim.o.backupdir = "/tmp//"
vim.o.directory = "/tmp//"
vim.o.undodir = "/tmp//"

vim.o.ruler = true -- Always show current position
vim.o.ignorecase = true -- Ignore case when searching
vim.o.smartcase = true -- Smart Casing
vim.o.hlsearch = true -- Highlight search results
vim.o.incsearch = true -- Modern search
vim.o.showmatch = true -- Show matching brackets when text indicator is over them
vim.o.foldmethod = "indent"
vim.o.foldlevel = 20


local remap = vim.api.nvim_set_keymap
remap('n', '<leader>o', 'o<ESC>k', {noremap = true, silent = true})
remap('n', '<leader>O', 'O<ESC>j', {noremap = true, silent = true})
remap('n', '<F8>', ':e %<CR>', {noremap = true, silent = true})

remap('n', 'H', '^', {noremap = true, silent = true})
remap('v', 'H', '^', {noremap = true, silent = true})
remap('n', 'L', '$', {noremap = true, silent = true})
remap('v', 'L', '$', {noremap = true, silent = true})
remap('n', 'w', 'W', {noremap = true, silent = true})
remap('n', 'W', 'w', {noremap = true, silent = true})
remap('n', 'e', 'E', {noremap = true, silent = true})
remap('n', 'E', 'e', {noremap = true, silent = true})
remap('n', 'b', 'B', {noremap = true, silent = true})
remap('n', 'B', 'b', {noremap = true, silent = true})
remap('n', "'", ';', {noremap = true, silent = true})
remap('n', 'Y', 'y$', {noremap = true, silent = true})
remap('n', ';', ':', {noremap = true})
remap('v', ';', ':', {noremap = true})

remap('n', '<A-h>', '5h', {noremap = true, silent = true})
remap('n', '<A-j>', '5j', {noremap = true, silent = true})
remap('n', '<A-k>', '5k', {noremap = true, silent = true})
remap('n', '<A-l>', '5l', {noremap = true, silent = true})
remap('v', '<A-h>', '5h', {noremap = true, silent = true})
remap('v', '<A-j>', '5j', {noremap = true, silent = true})
remap('v', '<A-k>', '5k', {noremap = true, silent = true})
remap('v', '<A-l>', '5l', {noremap = true, silent = true})
remap('n', '<A-,>', ':1winc > <CR>', {noremap = true, silent = true})
remap('n', '<A-.>', ':1winc < <CR>', {noremap = true, silent = true})

remap('n', '<C-h>', '<C-w>h', {noremap = true, silent = true})
remap('n', '<C-j>', '<C-w>j', {noremap = true, silent = true})
remap('n', '<C-k>', '<C-w>k', {noremap = true, silent = true})
remap('n', '<C-l>', '<C-w>l', {noremap = true, silent = true})
remap('n', '<leader>q', '%', {noremap = true, silent = true})
remap('n', '<leader>vw', 'v%', {noremap = true, silent = true})
vim.cmd([[autocmd BufWritePre * %s/\s\+$//e]])
remap('t', '<ESC>', '<C-\\><C-n>', {noremap = true, silent = true})
remap('i', '<C-l>', '<Right>', {noremap = true, silent = true})
remap('n', '<leader>tt', ':<c-u>exe v:count1 . "ToggleTerm"<CR>', {noremap = true, silent = true})

remap('v', '<C-c>', '"+y', {noremap = true, silent = true})
remap('n', '<A-v>', '"+p', {noremap = true, silent = true})
vim.cmd([[
    highlight LuaTreeFolderIcon guifg=#488847
    highlight LspDiagnosticsDefaultWarning guifg=#ff922b
    highlight LspDiagnosticsDefaultError guifg=#C33027
    highlight LspDiagnosticsDefaultHint guifg=#15aabf
    highlight LspDiagnosticsDefaultInformation guifg=#fab005
    ]])

require('autocommands')
require('debugging')
