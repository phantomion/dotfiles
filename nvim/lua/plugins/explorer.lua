local remap = vim.keymap.set

local function on_attach(bufnr)
    local api = require('nvim-tree.api')

    local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end
    api.config.mappings.default_on_attach(bufnr)
    remap('n', '<CR>', api.tree.change_root_to_node, opts('CD'))
    remap('n', 'l', api.node.open.edit, opts('Open'))
    remap('n', 'h', api.node.open.edit, opts('Open'))
end

require 'nvim-tree'.setup {
    on_attach = on_attach,
    update_cwd = true,
    view = {
        width = 27,
    },
    filters = {
        exclude = { '.git', 'node_modules', '.cache', 'target', '.o', 'bin' },
    },
    diagnostics = {
        enable = true
    },
    renderer = {
        highlight_git = true,
        indent_markers = {
            enable = true,
        },
    },
}

remap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

---@diagnostic disable-next-line: lowercase-global
local function open_nvim_tree(data)
    -- buffer is a directory
    local directory = vim.fn.isdirectory(data.file) == 1

    if not directory then
        return
    end

    -- change to the directory
    vim.cmd.cd(data.file)

    -- open the tree
    require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
