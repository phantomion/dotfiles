local impatient_ok, impatient = pcall(require, "impatient")
if impatient_ok then impatient.enable_profile() end
require('plugins')

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
vim.opt.shortmess:append({ c = true })
vim.opt.mouse:append({ a = true })
vim.o.nu = true -- Enable line numbers
vim.o.modifiable = true
vim.o.autoread = true
vim.o.relativenumber = true -- Enable relative line numbers
vim.o.wrap = false
vim.o.syntax = "on" -- Enable syntax highlighting
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
vim.opt.completeopt = ({ "noinsert", "menuone", "noselect" }) -- Improve completion menu
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


local remap = vim.keymap.set
remap('n', '<leader>o', 'o<ESC>k', { noremap = true, silent = true })
remap('n', '<leader>O', 'O<ESC>j', { noremap = true, silent = true })
remap('n', '<F8>', ':e %<CR>', { noremap = true, silent = true })

remap({ 'n', 'v' }, 'H', '^', { noremap = true, silent = true })
remap({ 'n', 'v' }, 'L', '$', { noremap = true, silent = true })
remap({ 'n', 'v' }, 'w', 'W', { noremap = true, silent = true })
remap({ 'n', 'v' }, 'W', 'w', { noremap = true, silent = true })
remap({ 'n', 'v' }, 'e', 'E', { noremap = true, silent = true })
remap({ 'n', 'v' }, 'E', 'e', { noremap = true, silent = true })
remap({ 'n', 'v' }, 'b', 'B', { noremap = true, silent = true })
remap({ 'n', 'v' }, 'B', 'b', { noremap = true, silent = true })
remap({ 'n', 'v' }, "'", ';', { noremap = true, silent = true })
remap('n', 'Y', 'y$', { noremap = true, silent = true })
remap({ 'n', 'v' }, ';', ':', { noremap = true })
remap('i', ',', ',<c-g>u', { noremap = true, silent = true })
remap('i', '.', '.<c-g>u', { noremap = true, silent = true })
remap('i', '!', '!<c-g>u', { noremap = true, silent = true })
remap('i', '?', '?<c-g>u', { noremap = true, silent = true })
remap('n', 'n', 'nzzzv', { noremap = true, silent = true })
remap('n', 'N', 'Nzzzv', { noremap = true, silent = true })
remap('n', '<leader>j', ':m .+1<CR>==', { noremap = true, silent = true })
remap('n', '<leader>k', ':m .-2<CR>==', { noremap = true, silent = true })

remap({ 'n', 'v' }, '<A-h>', '5h', { noremap = true, silent = true })
remap({ 'n', 'v' }, '<A-j>', '5j', { noremap = true, silent = true })
remap({ 'n', 'v' }, '<A-k>', '5k', { noremap = true, silent = true })
remap({ 'n', 'v' }, '<A-l>', '5l', { noremap = true, silent = true })

remap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
remap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
remap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
remap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })
remap('n', '<leader>q', '%', { noremap = true, silent = true })
remap('n', '<leader>vw', 'v%', { noremap = true, silent = true })
remap('t', '<ESC>', '<C-\\><C-n>', { noremap = true, silent = true })
remap('i', '<C-l>', '<Right>', { noremap = true, silent = true })

remap('v', '<C-c>', '"+y', { noremap = true, silent = true })
remap('n', '<A-v>', '"+p', { noremap = true, silent = true })
vim.cmd([[
    au ColorScheme * highlight LspSagaDiagnosticWarning guifg='#ff922b'
    au ColorScheme * highlight LspSagaDiagnosticError guifg='#C33027'
    au ColorScheme * highlight LspSagaDiagnosticHint guifg='#15aabf'
    au ColorScheme * highlight LspSagaDiagnosticInformation guifg='#fab005'
    " gray
    au ColorScheme * highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
    " blue
    au ColorScheme * highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
    au ColorScheme * highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
    " light blue
    au ColorScheme * highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
    au ColorScheme * highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE
    au ColorScheme * highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE
    " pink
    au ColorScheme * highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
    au ColorScheme * highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0
    " front
    au ColorScheme * highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
    au ColorScheme * highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4
    au ColorScheme * highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4
    ]])

require('autocommands')
require('debugging')
