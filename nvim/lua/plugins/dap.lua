require("dapui").setup()
vim.api.nvim_set_keymap('n', '<leader>dc', ":lua require'dap'.continue()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>ss', ":lua require'dap'.step_over()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>si', ":lua require'dap'.step_into()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>so', ":lua require'dap'.step_out()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>db', ":lua require'dap'.toggle_breakpoint()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>dB', ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>lp', ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>dr', ":lua require'dap'.repl.toggle()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>dl', ":lua require'dap'.run_last()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>du', ":lua require'dapui'.toggle()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>ds', ":lua require'dap'.terminate()<CR>", {noremap = true, silent = true})

vim.g.dap_virtual_text = true

local dap = require('dap')
dap.adapters.lldb = {
    type = 'executable',
    command = '/usr/bin/lldb-vscode', -- adjust as needed
    name = "lldb"
}

dap.configurations.cpp = {
    {
        name = "Launch",
        type = "lldb",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = true,
        args = function()
            return vim.fn.input('Args: ')
        end,

        runInTerminal = false,
    },
}

dap.adapters.delve = {
  type = 'server',
  port = '${port}',
  executable = {
    command = 'dlv',
    args = {'dap', '-l', '127.0.0.1:${port}'},
  }
}

-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
dap.configurations.go = {
  {
    type = "delve",
    name = "Debug",
    request = "launch",
    program = "${file}"
  },
  {
    type = "delve",
    name = "Debug test", -- configuration for debugging test files
    request = "launch",
    mode = "test",
    program = "${file}"
  },
  -- works with go.mod packages and sub packages
  {
    type = "delve",
    name = "Debug test (go.mod)",
    request = "launch",
    mode = "test",
    program = "./${relativeFileDirname}"
  }
}
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
