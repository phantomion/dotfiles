local actions = require('telescope.actions')
require 'telescope'.setup {
    defaults = {
        file_sorter = require('telescope.sorters').get_fzy_sorter,
        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,

                ["<C-c>"] = actions.close,

                ["<Down>"] = actions.move_selection_next,
                ["<Up>"] = actions.move_selection_previous,

                ["<CR>"] = actions.select_default + actions.center,
                ["<C-x>"] = actions.select_horizontal,
                ["<C-v>"] = actions.select_vertical,
                ["<C-t>"] = actions.select_tab,

                ["<C-u>"] = actions.preview_scrolling_up,
                ["<C-d>"] = actions.preview_scrolling_down,

                ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                ["<C-l>"] = actions.complete_tag
            },

            n = {
                ["<esc>"] = actions.close,
                ["<CR>"] = actions.select_default + actions.center,
                ["<C-x>"] = actions.select_horizontal,
                ["<C-v>"] = actions.select_vertical,
                ["<C-t>"] = actions.select_tab,

                ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

                -- TODO: This would be weird if we switch the ordering.
                ["j"] = actions.move_selection_next,
                ["k"] = actions.move_selection_previous,
                ["H"] = actions.move_to_top,
                ["M"] = actions.move_to_middle,
                ["L"] = actions.move_to_bottom,

                ["<Down>"] = actions.move_selection_next,
                ["<Up>"] = actions.move_selection_previous,

                ["<C-u>"] = actions.preview_scrolling_up,
                ["<C-d>"] = actions.preview_scrolling_down,
            },
        }
    }
}

local remap = vim.keymap.set
-- lsp
remap('n', '<C-p>', ":lua require'telescope.builtin'.git_files{}<CR>", { noremap = true, silent = true })
remap('n', '<leader>pp', ":lua require'telescope.builtin'.find_files{}<CR>", { noremap = true, silent = true })
remap('n', '<leader>pw', ":lua require'telescope.builtin'.grep_string { search = vim.fn.expand('<cword>') }<CR><CR>",
    { noremap = true, silent = true })
remap('n', '<leader>ps', ":lua require('telescope.builtin').grep_string({ search = vim.fn.input('Grep For > ')})<CR>",
    { noremap = true, silent = true })
remap('n', '<leader>dg', ":Telescope diagnostics<CR>", { noremap = true, silent = true })
remap('n', '<leader>cs', ":Telescope colorscheme<CR>", { noremap = true, silent = true })
