require 'nvim-tree'.setup {
    update_cwd = true,
    view = {
        width = 27,
        mappings = {
            list = {
                { key = { "h", "l" }, action = "edit" },
                { key = { "<CR>" }, action = "cd" }
            }
        }
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

local remap = vim.keymap.set

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
