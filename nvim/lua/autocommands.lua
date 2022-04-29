local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local general = augroup("general", { clear = true })
autocmd("BufWritePre", {
    group = general,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

autocmd("TermOpen", {
    group = general,
    pattern = "term://*",
    command = 'startinsert',
})

autocmd("FocusGained", {
    group = general,
    pattern = "*",
    command = 'checktime',
})

autocmd("Filetype", {
    group = general,
    pattern = "lua",
    callback = function()
        vim.keymap.set('n', '<leader>nv', ':lua require(\'telescope.builtin\').find_files{ cwd = "~/.config/nvim" }<CR>', { silent = true })
    end,
})

autocmd("Filetype", {
    group = general,
    pattern = "lua",
    command = ":lua require'cmp'.setup.buffer {sources = {{ name = 'nvim_lua' },{ name = 'buffer' }}}",
})

autocmd("Filetype", {
    group = general,
    pattern = "lua",
    callback = function()
        vim.keymap.set('n', '<F5>', ':source ~/.config/nvim/init.lua<CR>', { silent = true })
    end,
})

autocmd("TextYankPost", {
    group = general,
    pattern = "*",
    command = 'silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=500}',
})


i3 = augroup("i3syntax", { clear = true })
autocmd("BufRead", {
    group = i3,
    pattern = "$HOME/.config/i3/config",
    command = "set ft=i3config",
})

nvim_dap = augroup("nvim_dap", { clear = true })

autocmd("Filetype", {
    group = nvim_dap,
    pattern = "dap-repl",
    command = "lua require('dap.ext.autocompl').attach()",
})

pypy = augroup("pypy", { clear = true })

autocmd("Filetype", {
    group = pypy,
    pattern = "python",
    callback = function()
        vim.keymap.set('n', '<F4>', ':16sp term://python %<CR>', { silent = true })
    end,
})

autocmd("Filetype", {
    group = pypy,
    pattern = "python",
    callback = function()
        vim.keymap.set('n', '<leader>fm', ':!autopep8 -i % <CR><CR>:e %<CR>', { silent = true })
    end,
})

--[[ vim.cmd([[
    augroup rust
    autocmd!
    autocmd BufNewFile,BufRead *.rs set filetype=rust
    autocmd FileType rust nnoremap <F3> :w<CR> :16split term://rustc % && ./%:r<CR>
    autocmd FileType rust nnoremap <F4> :w<CR> :16split term://cargo run<CR>
    autocmd FileType rust nnoremap <F5> :w<CR> :16split term://cargo run --<Space>
    autocmd FileType rust nnoremap <leader><F4> :w<CR> :16split term://cargo run --target x86_64-unknown-linux-musl<CR>
    autocmd FileType rust nnoremap <silent><leader>. a-><space>
    augroup END

vim.cmd([[
    augroup cc
    autocmd!
    autocmd FileType c,cpp nnoremap <F3> :w<CR> :16split term://make<CR>
    autocmd FileType c,cpp nnoremap <leader><F3> :w<CR> :16split term://make -B<CR>
    autocmd FileType c,cpp nnoremap <F4> :w<CR> :16split term://make run<CR>
    autocmd FileType c,cpp nnoremap <F5> :w<CR> :16split term://make run ARGS=
    autocmd FileType c,cpp nnoremap <F6> :w<CR> :16split term://./%:r<CR>
    autocmd Filetype c,cpp nnoremap <silent><leader>fm :!clang-format -style="{BasedOnStyle: google, IndentWidth: 4}" -i % <CR><CR>
    augroup END

vim.cmd([[
    augroup tex
    autocmd!
    autocmd FileType tex nnoremap <F3> :!setsid zathura %:r.pdf<CR><CR>
    autocmd FileType tex nnoremap <leader>lor a$\lor$
    autocmd FileType tex nnoremap <leader>land a$\land$
    autocmd FileType tex nnoremap <leader>neg a$\neg$
    augroup END ]]
