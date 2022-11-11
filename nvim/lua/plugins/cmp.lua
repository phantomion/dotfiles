local luasnip = require('luasnip')
require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./snips" } })
local has_words_before = function()
    if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
        return false
    end
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and
    vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local cmp = require 'cmp'
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

cmp.setup {
    snippet = {
        expand = function(args)
            require 'luasnip'.lsp_expand(args.body)
        end,
    },
    mapping = {
        ['<C-b>']     = cmp.mapping.scroll_docs(-4),
        ['<C-f>']     = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>']     = cmp.mapping.abort(),
        ['<CR>']      = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
        ['<Tab>']     = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>']   = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'luasnip' },
        { name = 'copilot' },
        { name = 'path' },
        { name = 'buffer' }
    },
    formatting = {
        format = require("lspkind").cmp_format({ with_text = true, menu = ({
            buffer = "[Buffer]",
            nvim_lsp = "[LSP]",
            nvim_lua = "[Lua]",
            path = "[Path]",
            luasnip = "[LuaSnip]",
            copilot = "[Copilot]"
        }) }),
    },
}
cmp.setup.cmdline('/', {
    sources = {
        { name = 'buffer' }
    }
})
cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    }),
    mapping = cmp.mapping.preset.cmdline({}),
})

vim.cmd([[
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

