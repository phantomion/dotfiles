-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/kwstas/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?.lua;/home/kwstas/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?/init.lua;/home/kwstas/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?.lua;/home/kwstas/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/kwstas/.cache/nvim/packer_hererocks/2.0.5/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["barbar.nvim"] = {
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/barbar.nvim",
    url = "https://github.com/romgrk/barbar.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["diffview.nvim"] = {
    config = { "\27LJ\1\2‚\6\0\0\a\0'\0_4\0\0\0%\1\1\0>\0\2\0027\0\2\0004\1\0\0%\2\3\0>\1\2\0027\1\4\0013\2\5\0003\3\6\0:\3\a\0023\3\b\0003\4\n\0\16\5\0\0%\6\t\0>\5\2\2:\5\v\4\16\5\0\0%\6\f\0>\5\2\2:\5\r\4\16\5\0\0%\6\14\0>\5\2\2:\5\15\4\16\5\0\0%\6\16\0>\5\2\2:\5\17\4:\4\18\0033\4\20\0\16\5\0\0%\6\19\0>\5\2\2:\5\21\4\16\5\0\0%\6\19\0>\5\2\2:\5\22\4\16\5\0\0%\6\23\0>\5\2\2:\5\24\4\16\5\0\0%\6\23\0>\5\2\2:\5\25\4\16\5\0\0%\6\26\0>\5\2\2:\5\27\4\16\5\0\0%\6\26\0>\5\2\2:\5\28\4\16\5\0\0%\6\26\0>\5\2\2:\5\29\4\16\5\0\0%\6\30\0>\5\2\2:\5\31\4\16\5\0\0%\6 \0>\5\2\2:\5!\4\16\5\0\0%\6\"\0>\5\2\2:\5#\4\16\5\0\0%\6$\0>\5\2\2:\5%\4\16\5\0\0%\6\t\0>\5\2\2:\5\v\4\16\5\0\0%\6\f\0>\5\2\2:\5\r\4\16\5\0\0%\6\14\0>\5\2\2:\5\15\4\16\5\0\0%\6\16\0>\5\2\2:\5\17\4:\4\a\3:\3&\2>\1\2\1G\0\1\0\17key_bindings\6R\18refresh_files\6U\16unstage_all\6S\14stage_all\6-\23toggle_stage_entry\18<2-LeftMouse>\6o\t<cr>\17select_entry\t<up>\6k\15prev_entry\v<down>\6j\1\0\0\15next_entry\tview\14<leader>b\17toggle_files\14<leader>e\16focus_files\f<s-tab>\22select_prev_entry\n<tab>\1\0\0\22select_next_entry\1\0\1\21disable_defaults\1\15file_panel\1\0\1\nwidth\3#\1\0\2\18diff_binaries\1\14use_icons\2\nsetup\rdiffview\22diffview_callback\20diffview.config\frequire\0" },
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/diffview.nvim",
    url = "https://github.com/sindrets/diffview.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["galaxyline.nvim"] = {
    cond = { "\27LJ\1\2\15\0\0\1\0\0\0\2)\0\2\0H\0\2\0\0" },
    config = { "\27LJ\1\2,\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\17mygalaxyline\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/opt/galaxyline.nvim",
    url = "https://github.com/glepnir/galaxyline.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\1\2¸\4\0\0\4\0\18\0\0214\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\14\0003\2\4\0003\3\3\0:\3\5\0023\3\6\0:\3\a\0023\3\b\0:\3\t\0023\3\n\0:\3\v\0023\3\f\0:\3\r\2:\2\15\0013\2\16\0:\2\17\1>\0\2\1G\0\1\0\28current_line_blame_opts\1\0\1\ndelay\3\n\nsigns\1\0\0\17changedelete\1\0\4\ttext\6~\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\14topdelete\1\0\4\ttext\6-\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\vdelete\1\0\4\ttext\6-\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\vchange\1\0\4\ttext\6~\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\badd\1\0\0\1\0\4\ttext\6+\nnumhl\18GitSignsAddNr\vlinehl\18GitSignsAddLn\ahl\16GitSignsAdd\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  kommentary = {
    config = { "\27LJ\1\2^\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\25update_commentstring&ts_context_commentstring.internal\frequireë\1\1\0\4\0\n\0\0144\0\0\0007\0\1\0)\1\1\0:\1\2\0004\0\3\0%\1\4\0>\0\2\0027\0\5\0%\1\6\0003\2\a\0001\3\b\0:\3\t\2>\0\3\1G\0\1\0\18hook_function\0\1\0\2\31multi_line_comment_strings\tauto\31single_line_comment_string\tauto\bvue\23configure_language\22kommentary.config\frequire'kommentary_create_default_mappings\6g\bvim\0" },
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/kommentary",
    url = "https://github.com/b3nj5m1n/kommentary"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    config = { "\27LJ\1\2ï\1\0\0\4\0\6\0\t4\0\0\0%\1\1\0>\0\2\0027\1\2\0003\2\3\0003\3\4\0:\3\5\2>\1\2\1G\0\1\0\23code_action_prompt\1\0\4\18sign_priority\3\20\17virtual_text\2\tsign\2\venable\1\1\0\6\14hint_sign\bïš\15error_sign\bï—\14warn_sign\bï±\22max_preview_lines\3\20\15infor_sign\bï™\17border_style\nround\18init_lsp_saga\flspsaga\frequire\0" },
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/lspsaga.nvim",
    url = "https://github.com/tami5/lspsaga.nvim"
  },
  neogit = {
    config = { "\27LJ\1\2]\0\0\3\0\6\0\t4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0003\2\3\0:\2\5\1>\0\2\1G\0\1\0\17integrations\1\0\0\1\0\1\rdiffview\2\nsetup\vneogit\frequire\0" },
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/neogit",
    url = "https://github.com/TimUntersberger/neogit"
  },
  ["nightfox.nvim"] = {
    cond = { "\27LJ\1\2\15\0\0\1\0\0\0\2)\0\1\0H\0\2\0\0" },
    config = { "\27LJ\1\2a\0\0\2\0\a\0\n4\0\0\0007\0\1\0%\1\3\0:\1\2\0004\0\4\0%\1\5\0>\0\2\0027\0\6\0>\0\1\1G\0\1\0\bset\rnightfox\frequire\fpalefox\19nightfox_style\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/opt/nightfox.nvim",
    url = "https://github.com/EdenEast/nightfox.nvim"
  },
  ["nvcode-color-schemes.vim"] = {
    cond = { "\27LJ\1\2\15\0\0\1\0\0\0\2)\0\1\0H\0\2\0\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/opt/nvcode-color-schemes.vim",
    url = "https://github.com/christianchiarulli/nvcode-color-schemes.vim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\1\2@\0\0\2\0\3\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0002\1\0\0>\0\2\1G\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\1\2›\2\0\0\a\0\v\2+4\0\0\0007\0\1\0007\0\2\0'\1\0\0%\2\3\0>\0\3\2\a\0\4\0T\0\2€)\0\1\0H\0\2\0004\0\5\0004\1\0\0007\1\1\0017\1\6\1'\2\0\0>\1\2\0=\0\0\3\b\1\0\0T\2\20€4\2\0\0007\2\1\0027\2\a\2'\3\0\0\21\4\1\0\16\5\0\0)\6\2\0>\2\5\0028\2\1\2\16\3\2\0007\2\b\2\16\4\1\0\16\5\1\0>\2\4\2\16\3\2\0007\2\t\2%\4\n\0>\2\3\2\n\2\0\0T\2\2€)\2\1\0T\3\1€)\2\2\0H\2\2\0\a%s\nmatch\bsub\23nvim_buf_get_lines\24nvim_win_get_cursor\vunpack\vprompt\fbuftype\24nvim_buf_get_option\bapi\bvim\0\2C\0\1\3\0\4\0\a4\1\0\0%\2\1\0>\1\2\0027\1\2\0017\2\3\0>\1\2\1G\0\1\0\tbody\15lsp_expand\fluasnip\frequireÅ\1\0\1\2\3\5\0\29+\1\0\0007\1\0\1>\1\1\2\15\0\1\0T\2\4€+\1\0\0007\1\1\1>\1\1\1T\1\19€+\1\1\0007\1\2\1>\1\1\2\15\0\1\0T\2\4€+\1\1\0007\1\3\1>\1\1\1T\1\n€+\1\2\0>\1\1\2\15\0\1\0T\2\4€+\1\0\0007\1\4\1>\1\1\1T\1\2€\16\1\0\0>\1\1\1G\0\1\0\3À\2À\1À\rcomplete\19expand_or_jump\23expand_or_jumpable\21select_next_item\fvisibleŽ\1\0\1\3\2\4\0\23+\1\0\0007\1\0\1>\1\1\2\15\0\1\0T\2\4€+\1\0\0007\1\1\1>\1\1\1T\1\r€+\1\1\0007\1\2\1'\2ÿÿ>\1\2\2\15\0\1\0T\2\5€+\1\1\0007\1\3\1'\2ÿÿ>\1\2\1T\1\2€\16\1\0\0>\1\1\1G\0\1\0\3À\2À\tjump\rjumpable\21select_prev_item\fvisibleþ\a\1\0\v\0009\1i4\0\0\0%\1\1\0>\0\2\0024\1\0\0%\2\2\0>\1\2\0027\1\3\1>\1\1\0011\1\4\0004\2\5\0007\2\6\2%\3\a\0>\2\2\0014\2\0\0%\3\1\0>\2\2\0024\3\0\0%\4\b\0>\3\2\0024\4\0\0%\5\t\0>\4\2\0027\5\n\3\16\6\5\0007\5\v\5%\a\f\0007\b\r\4>\b\1\0=\5\2\0017\5\14\0047\6\14\4\19\6\6\0\20\6\0\6%\a\15\0009\a\6\0057\5\16\0033\6\20\0003\a\18\0001\b\17\0:\b\19\a:\a\21\0063\a\24\0007\b\22\0037\b\23\b'\tüÿ>\b\2\2:\b\25\a7\b\22\0037\b\23\b'\t\4\0>\b\2\2:\b\26\a7\b\22\0037\b\27\b>\b\1\2:\b\28\a7\b\22\0037\b\29\b>\b\1\2:\b\30\a7\b\22\0037\b\31\b3\t\"\0007\n \0037\n!\n:\n#\t>\b\2\2:\b$\a7\b\22\0031\t%\0003\n&\0>\b\3\2:\b'\a7\b\22\0031\t(\0003\n)\0>\b\3\2:\b*\a:\a\22\0062\a\6\0003\b+\0;\b\1\a3\b,\0;\b\2\a3\b-\0;\b\3\a3\b.\0;\b\4\a3\b/\0;\b\5\a:\a0\0063\a6\0004\b\0\0%\t1\0>\b\2\0027\b2\b3\t3\0003\n4\0:\n5\t>\b\2\2:\b7\a:\a8\6>\5\2\0010\0\0€G\0\1\0\15formatting\vformat\1\0\0\tmenu\1\0\5\fluasnip\14[LuaSnip]\rnvim_lua\n[Lua]\rnvim_lsp\n[LSP]\vbuffer\r[Buffer]\tpath\v[Path]\1\0\1\14with_text\2\15cmp_format\flspkind\fsources\1\0\1\tname\fluasnip\1\0\1\tname\vbuffer\1\0\1\tname\tpath\1\0\1\tname\rnvim_lua\1\0\1\tname\rnvim_lsp\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\t<CR>\rbehavior\1\0\1\vselect\2\fReplace\20ConfirmBehavior\fconfirm\n<C-e>\nclose\14<C-Space>\rcomplete\n<C-f>\n<C-b>\1\0\0\16scroll_docs\fmapping\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\vracket\tlisp\20on_confirm_done\17confirm_done\aon\nevent\"nvim-autopairs.completion.cmp\bcmp,highlight! link CmpItemMenu CmpItemKind\bcmd\bvim\0\14lazy_load luasnip.loaders.from_vscode\fluasnip\frequire\2\0" },
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\1\0027\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-ui"] = {
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    cond = { "\27LJ\1\2\15\0\0\1\0\0\0\2)\0\2\0H\0\2\0\0" },
    config = { "\27LJ\1\2$\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\tlsps\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-spectre"] = {
    config = { "\27LJ\1\0025\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\fspectre\frequire\0" },
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/nvim-spectre",
    url = "https://github.com/windwp/nvim-spectre"
  },
  ["nvim-toggleterm.lua"] = {
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/nvim-toggleterm.lua",
    url = "https://github.com/akinsho/nvim-toggleterm.lua"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\1\2ë\3\0\0\t\0\28\00014\0\0\0%\1\1\0>\0\2\0027\0\2\0004\1\0\0%\2\3\0>\1\2\0027\1\4\0013\2\21\0003\3\b\0003\4\6\0003\5\5\0:\5\a\4:\4\t\0033\4\18\0002\5\3\0003\6\v\0003\a\n\0:\a\f\6\16\a\0\0%\b\r\0>\a\2\2:\a\14\6;\6\1\0053\6\16\0003\a\15\0:\a\f\6\16\a\0\0%\b\17\0>\a\2\2:\a\14\6;\6\2\5:\5\19\4:\4\20\3:\3\22\2>\1\2\0014\1\23\0007\1\24\1'\2\1\0:\2\25\0014\1\23\0007\1\24\1'\2\1\0:\2\26\0014\1\23\0007\1\24\1'\2\1\0:\2\27\1G\0\1\0%nvim_tree_highlight_opened_files\24nvim_tree_gitignore\21nvim_tree_git_hl\6g\bvim\tview\1\0\1\19indent_markers\3\1\rmappings\tlist\1\0\0\acd\1\0\0\1\2\0\0\t<CR>\acb\tedit\bkey\1\0\0\1\3\0\0\6h\6l\ffilters\1\0\1\nwidth\3\27\vcustom\1\0\0\1\a\0\0\t.git\17node_modules\v.cache\vtarget\a.o\bbin\nsetup\14nvim-tree\23nvim_tree_callback\21nvim-tree.config\frequire\0" },
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\1\2$\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\tmisc\frequire\0" },
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ts-context-commentstring"] = {
    config = { "\27LJ\1\2…\1\0\0\3\0\6\0\t4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0003\2\3\0:\2\5\1>\0\2\1G\0\1\0\26context_commentstring\1\0\0\1\0\2\19enable_autocmd\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-ts-rainbow"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/opt/nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["ron.vim"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/opt/ron.vim",
    url = "https://github.com/ron-rs/ron.vim"
  },
  ["rust-tools.nvim"] = {
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/rust-tools.nvim",
    url = "https://github.com/simrat39/rust-tools.nvim"
  },
  ["surround.nvim"] = {
    config = { "\27LJ\1\2h\0\0\2\0\6\0\v4\0\0\0%\1\1\0>\0\2\0027\0\2\0002\1\0\0>\0\2\0014\0\3\0007\0\4\0%\1\1\0:\1\5\0G\0\1\0\28surround_mappings_style\6g\bvim\nsetup\rsurround\frequire\0" },
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/surround.nvim",
    url = "https://github.com/blackCauldron7/surround.nvim"
  },
  ["symbols-outline.nvim"] = {
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/symbols-outline.nvim",
    url = "https://github.com/simrat39/symbols-outline.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\1\2“\1\0\0\5\0\t\0\0144\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\a\0003\2\5\0004\3\0\0%\4\3\0>\3\2\0027\3\4\3:\3\6\2:\2\b\1>\0\2\1G\0\1\0\rdefaults\1\0\0\16file_sorter\1\0\0\19get_fzy_sorter\22telescope.sorters\nsetup\14telescope\frequire\0" },
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-lua/telescope.nvim"
  },
  ["vim-fireplace"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/opt/vim-fireplace",
    url = "https://github.com/tpope/vim-fireplace"
  },
  ["vim-lastplace"] = {
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/vim-lastplace",
    url = "https://github.com/farmergreg/vim-lastplace"
  },
  vimwiki = {
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/vimwiki",
    url = "https://github.com/vimwiki/vimwiki"
  },
  ["zephyr-nvim"] = {
    cond = { "\27LJ\1\2\15\0\0\1\0\0\0\2)\0\2\0H\0\2\0\0" },
    config = { "\27LJ\1\0026\0\0\2\0\3\0\0054\0\0\0007\0\1\0%\1\2\0>\0\2\1G\0\1\0\23colorscheme zephyr\bcmd\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/opt/zephyr-nvim",
    url = "https://github.com/glepnir/zephyr-nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: surround.nvim
time([[Config for surround.nvim]], true)
try_loadstring("\27LJ\1\2h\0\0\2\0\6\0\v4\0\0\0%\1\1\0>\0\2\0027\0\2\0002\1\0\0>\0\2\0014\0\3\0007\0\4\0%\1\1\0:\1\5\0G\0\1\0\28surround_mappings_style\6g\bvim\nsetup\rsurround\frequire\0", "config", "surround.nvim")
time([[Config for surround.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\1\2$\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\tmisc\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\1\2›\2\0\0\a\0\v\2+4\0\0\0007\0\1\0007\0\2\0'\1\0\0%\2\3\0>\0\3\2\a\0\4\0T\0\2€)\0\1\0H\0\2\0004\0\5\0004\1\0\0007\1\1\0017\1\6\1'\2\0\0>\1\2\0=\0\0\3\b\1\0\0T\2\20€4\2\0\0007\2\1\0027\2\a\2'\3\0\0\21\4\1\0\16\5\0\0)\6\2\0>\2\5\0028\2\1\2\16\3\2\0007\2\b\2\16\4\1\0\16\5\1\0>\2\4\2\16\3\2\0007\2\t\2%\4\n\0>\2\3\2\n\2\0\0T\2\2€)\2\1\0T\3\1€)\2\2\0H\2\2\0\a%s\nmatch\bsub\23nvim_buf_get_lines\24nvim_win_get_cursor\vunpack\vprompt\fbuftype\24nvim_buf_get_option\bapi\bvim\0\2C\0\1\3\0\4\0\a4\1\0\0%\2\1\0>\1\2\0027\1\2\0017\2\3\0>\1\2\1G\0\1\0\tbody\15lsp_expand\fluasnip\frequireÅ\1\0\1\2\3\5\0\29+\1\0\0007\1\0\1>\1\1\2\15\0\1\0T\2\4€+\1\0\0007\1\1\1>\1\1\1T\1\19€+\1\1\0007\1\2\1>\1\1\2\15\0\1\0T\2\4€+\1\1\0007\1\3\1>\1\1\1T\1\n€+\1\2\0>\1\1\2\15\0\1\0T\2\4€+\1\0\0007\1\4\1>\1\1\1T\1\2€\16\1\0\0>\1\1\1G\0\1\0\3À\2À\1À\rcomplete\19expand_or_jump\23expand_or_jumpable\21select_next_item\fvisibleŽ\1\0\1\3\2\4\0\23+\1\0\0007\1\0\1>\1\1\2\15\0\1\0T\2\4€+\1\0\0007\1\1\1>\1\1\1T\1\r€+\1\1\0007\1\2\1'\2ÿÿ>\1\2\2\15\0\1\0T\2\5€+\1\1\0007\1\3\1'\2ÿÿ>\1\2\1T\1\2€\16\1\0\0>\1\1\1G\0\1\0\3À\2À\tjump\rjumpable\21select_prev_item\fvisibleþ\a\1\0\v\0009\1i4\0\0\0%\1\1\0>\0\2\0024\1\0\0%\2\2\0>\1\2\0027\1\3\1>\1\1\0011\1\4\0004\2\5\0007\2\6\2%\3\a\0>\2\2\0014\2\0\0%\3\1\0>\2\2\0024\3\0\0%\4\b\0>\3\2\0024\4\0\0%\5\t\0>\4\2\0027\5\n\3\16\6\5\0007\5\v\5%\a\f\0007\b\r\4>\b\1\0=\5\2\0017\5\14\0047\6\14\4\19\6\6\0\20\6\0\6%\a\15\0009\a\6\0057\5\16\0033\6\20\0003\a\18\0001\b\17\0:\b\19\a:\a\21\0063\a\24\0007\b\22\0037\b\23\b'\tüÿ>\b\2\2:\b\25\a7\b\22\0037\b\23\b'\t\4\0>\b\2\2:\b\26\a7\b\22\0037\b\27\b>\b\1\2:\b\28\a7\b\22\0037\b\29\b>\b\1\2:\b\30\a7\b\22\0037\b\31\b3\t\"\0007\n \0037\n!\n:\n#\t>\b\2\2:\b$\a7\b\22\0031\t%\0003\n&\0>\b\3\2:\b'\a7\b\22\0031\t(\0003\n)\0>\b\3\2:\b*\a:\a\22\0062\a\6\0003\b+\0;\b\1\a3\b,\0;\b\2\a3\b-\0;\b\3\a3\b.\0;\b\4\a3\b/\0;\b\5\a:\a0\0063\a6\0004\b\0\0%\t1\0>\b\2\0027\b2\b3\t3\0003\n4\0:\n5\t>\b\2\2:\b7\a:\a8\6>\5\2\0010\0\0€G\0\1\0\15formatting\vformat\1\0\0\tmenu\1\0\5\fluasnip\14[LuaSnip]\rnvim_lua\n[Lua]\rnvim_lsp\n[LSP]\vbuffer\r[Buffer]\tpath\v[Path]\1\0\1\14with_text\2\15cmp_format\flspkind\fsources\1\0\1\tname\fluasnip\1\0\1\tname\vbuffer\1\0\1\tname\tpath\1\0\1\tname\rnvim_lua\1\0\1\tname\rnvim_lsp\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\t<CR>\rbehavior\1\0\1\vselect\2\fReplace\20ConfirmBehavior\fconfirm\n<C-e>\nclose\14<C-Space>\rcomplete\n<C-f>\n<C-b>\1\0\0\16scroll_docs\fmapping\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\vracket\tlisp\20on_confirm_done\17confirm_done\aon\nevent\"nvim-autopairs.completion.cmp\bcmp,highlight! link CmpItemMenu CmpItemKind\bcmd\bvim\0\14lazy_load luasnip.loaders.from_vscode\fluasnip\frequire\2\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\1\2ë\3\0\0\t\0\28\00014\0\0\0%\1\1\0>\0\2\0027\0\2\0004\1\0\0%\2\3\0>\1\2\0027\1\4\0013\2\21\0003\3\b\0003\4\6\0003\5\5\0:\5\a\4:\4\t\0033\4\18\0002\5\3\0003\6\v\0003\a\n\0:\a\f\6\16\a\0\0%\b\r\0>\a\2\2:\a\14\6;\6\1\0053\6\16\0003\a\15\0:\a\f\6\16\a\0\0%\b\17\0>\a\2\2:\a\14\6;\6\2\5:\5\19\4:\4\20\3:\3\22\2>\1\2\0014\1\23\0007\1\24\1'\2\1\0:\2\25\0014\1\23\0007\1\24\1'\2\1\0:\2\26\0014\1\23\0007\1\24\1'\2\1\0:\2\27\1G\0\1\0%nvim_tree_highlight_opened_files\24nvim_tree_gitignore\21nvim_tree_git_hl\6g\bvim\tview\1\0\1\19indent_markers\3\1\rmappings\tlist\1\0\0\acd\1\0\0\1\2\0\0\t<CR>\acb\tedit\bkey\1\0\0\1\3\0\0\6h\6l\ffilters\1\0\1\nwidth\3\27\vcustom\1\0\0\1\a\0\0\t.git\17node_modules\v.cache\vtarget\a.o\bbin\nsetup\14nvim-tree\23nvim_tree_callback\21nvim-tree.config\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: nvim-ts-context-commentstring
time([[Config for nvim-ts-context-commentstring]], true)
try_loadstring("\27LJ\1\2…\1\0\0\3\0\6\0\t4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0003\2\3\0:\2\5\1>\0\2\1G\0\1\0\26context_commentstring\1\0\0\1\0\2\19enable_autocmd\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-ts-context-commentstring")
time([[Config for nvim-ts-context-commentstring]], false)
-- Config for: diffview.nvim
time([[Config for diffview.nvim]], true)
try_loadstring("\27LJ\1\2‚\6\0\0\a\0'\0_4\0\0\0%\1\1\0>\0\2\0027\0\2\0004\1\0\0%\2\3\0>\1\2\0027\1\4\0013\2\5\0003\3\6\0:\3\a\0023\3\b\0003\4\n\0\16\5\0\0%\6\t\0>\5\2\2:\5\v\4\16\5\0\0%\6\f\0>\5\2\2:\5\r\4\16\5\0\0%\6\14\0>\5\2\2:\5\15\4\16\5\0\0%\6\16\0>\5\2\2:\5\17\4:\4\18\0033\4\20\0\16\5\0\0%\6\19\0>\5\2\2:\5\21\4\16\5\0\0%\6\19\0>\5\2\2:\5\22\4\16\5\0\0%\6\23\0>\5\2\2:\5\24\4\16\5\0\0%\6\23\0>\5\2\2:\5\25\4\16\5\0\0%\6\26\0>\5\2\2:\5\27\4\16\5\0\0%\6\26\0>\5\2\2:\5\28\4\16\5\0\0%\6\26\0>\5\2\2:\5\29\4\16\5\0\0%\6\30\0>\5\2\2:\5\31\4\16\5\0\0%\6 \0>\5\2\2:\5!\4\16\5\0\0%\6\"\0>\5\2\2:\5#\4\16\5\0\0%\6$\0>\5\2\2:\5%\4\16\5\0\0%\6\t\0>\5\2\2:\5\v\4\16\5\0\0%\6\f\0>\5\2\2:\5\r\4\16\5\0\0%\6\14\0>\5\2\2:\5\15\4\16\5\0\0%\6\16\0>\5\2\2:\5\17\4:\4\a\3:\3&\2>\1\2\1G\0\1\0\17key_bindings\6R\18refresh_files\6U\16unstage_all\6S\14stage_all\6-\23toggle_stage_entry\18<2-LeftMouse>\6o\t<cr>\17select_entry\t<up>\6k\15prev_entry\v<down>\6j\1\0\0\15next_entry\tview\14<leader>b\17toggle_files\14<leader>e\16focus_files\f<s-tab>\22select_prev_entry\n<tab>\1\0\0\22select_next_entry\1\0\1\21disable_defaults\1\15file_panel\1\0\1\nwidth\3#\1\0\2\18diff_binaries\1\14use_icons\2\nsetup\rdiffview\22diffview_callback\20diffview.config\frequire\0", "config", "diffview.nvim")
time([[Config for diffview.nvim]], false)
-- Config for: nvim-spectre
time([[Config for nvim-spectre]], true)
try_loadstring("\27LJ\1\0025\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\fspectre\frequire\0", "config", "nvim-spectre")
time([[Config for nvim-spectre]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\1\0027\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\1\2¸\4\0\0\4\0\18\0\0214\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\14\0003\2\4\0003\3\3\0:\3\5\0023\3\6\0:\3\a\0023\3\b\0:\3\t\0023\3\n\0:\3\v\0023\3\f\0:\3\r\2:\2\15\0013\2\16\0:\2\17\1>\0\2\1G\0\1\0\28current_line_blame_opts\1\0\1\ndelay\3\n\nsigns\1\0\0\17changedelete\1\0\4\ttext\6~\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\14topdelete\1\0\4\ttext\6-\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\vdelete\1\0\4\ttext\6-\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\vchange\1\0\4\ttext\6~\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\badd\1\0\0\1\0\4\ttext\6+\nnumhl\18GitSignsAddNr\vlinehl\18GitSignsAddLn\ahl\16GitSignsAdd\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: lspsaga.nvim
time([[Config for lspsaga.nvim]], true)
try_loadstring("\27LJ\1\2ï\1\0\0\4\0\6\0\t4\0\0\0%\1\1\0>\0\2\0027\1\2\0003\2\3\0003\3\4\0:\3\5\2>\1\2\1G\0\1\0\23code_action_prompt\1\0\4\18sign_priority\3\20\17virtual_text\2\tsign\2\venable\1\1\0\6\14hint_sign\bïš\15error_sign\bï—\14warn_sign\bï±\22max_preview_lines\3\20\15infor_sign\bï™\17border_style\nround\18init_lsp_saga\flspsaga\frequire\0", "config", "lspsaga.nvim")
time([[Config for lspsaga.nvim]], false)
-- Config for: kommentary
time([[Config for kommentary]], true)
try_loadstring("\27LJ\1\2^\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\25update_commentstring&ts_context_commentstring.internal\frequireë\1\1\0\4\0\n\0\0144\0\0\0007\0\1\0)\1\1\0:\1\2\0004\0\3\0%\1\4\0>\0\2\0027\0\5\0%\1\6\0003\2\a\0001\3\b\0:\3\t\2>\0\3\1G\0\1\0\18hook_function\0\1\0\2\31multi_line_comment_strings\tauto\31single_line_comment_string\tauto\bvue\23configure_language\22kommentary.config\frequire'kommentary_create_default_mappings\6g\bvim\0", "config", "kommentary")
time([[Config for kommentary]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\1\2“\1\0\0\5\0\t\0\0144\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\a\0003\2\5\0004\3\0\0%\4\3\0>\3\2\0027\3\4\3:\3\6\2:\2\b\1>\0\2\1G\0\1\0\rdefaults\1\0\0\16file_sorter\1\0\0\19get_fzy_sorter\22telescope.sorters\nsetup\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\1\2@\0\0\2\0\3\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0002\1\0\0>\0\2\1G\0\1\0\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: neogit
time([[Config for neogit]], true)
try_loadstring("\27LJ\1\2]\0\0\3\0\6\0\t4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0003\2\3\0:\2\5\1>\0\2\1G\0\1\0\17integrations\1\0\0\1\0\1\rdiffview\2\nsetup\vneogit\frequire\0", "config", "neogit")
time([[Config for neogit]], false)
-- Conditional loads
time([[Conditional loading of zephyr-nvim]], true)
  require("packer.load")({"zephyr-nvim"}, {}, _G.packer_plugins)
time([[Conditional loading of zephyr-nvim]], false)
time([[Conditional loading of galaxyline.nvim]], true)
  require("packer.load")({"galaxyline.nvim"}, {}, _G.packer_plugins)
time([[Conditional loading of galaxyline.nvim]], false)
time([[Conditional loading of nvim-lspconfig]], true)
  require("packer.load")({"nvim-lspconfig"}, {}, _G.packer_plugins)
time([[Conditional loading of nvim-lspconfig]], false)
time([[Conditional loading of nvcode-color-schemes.vim]], true)
  require("packer.load")({"nvcode-color-schemes.vim"}, {}, _G.packer_plugins)
time([[Conditional loading of nvcode-color-schemes.vim]], false)
time([[Conditional loading of nightfox.nvim]], true)
  require("packer.load")({"nightfox.nvim"}, {}, _G.packer_plugins)
time([[Conditional loading of nightfox.nvim]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType ron ++once lua require("packer.load")({'ron.vim'}, { ft = "ron" }, _G.packer_plugins)]]
vim.cmd [[au FileType clojure ++once lua require("packer.load")({'vim-fireplace', 'nvim-ts-rainbow'}, { ft = "clojure" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/kwstas/.local/share/nvim/site/pack/packer/opt/ron.vim/ftdetect/ron.vim]], true)
vim.cmd [[source /home/kwstas/.local/share/nvim/site/pack/packer/opt/ron.vim/ftdetect/ron.vim]]
time([[Sourcing ftdetect script at: /home/kwstas/.local/share/nvim/site/pack/packer/opt/ron.vim/ftdetect/ron.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
