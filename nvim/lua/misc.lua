require'nvim-treesitter.configs'.setup {
        ensure_installed = "maintained",  -- one of "all", "maintained" (parsers with maintainers), or a list of languages
        highlight = {
            enable = true,              -- false will disable the whole extension
        },
        indent = {
            enable = true
        }
    }

require"toggleterm".setup{
        size = 16,
        open_mapping = [[<C-t>]],
        shade_filetypes = {},
        shade_terminals = true,
        persist_size = true,
        direction = 'horizontal'
    }
