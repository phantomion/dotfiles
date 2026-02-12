if vim.g.vscode then
    -- VSCode extension
    require('plugins')
    require('vim_settings')
    require('mappings')
    require('autocommands')
else
    local impatient_ok, impatient = pcall(require, "impatient")
    if impatient_ok then impatient.enable_profile() end
    require('vim_settings')
    require('mappings')
    require('plugins')
    require('autocommands')
end

