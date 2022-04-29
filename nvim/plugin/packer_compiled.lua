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
local package_path_str = "/home/kwstas/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/kwstas/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/kwstas/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/kwstas/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/kwstas/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
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
  ["Comment.nvim"] = {
    config = { "\27LJ\2\nß\3\0\1\b\0\18\00006\1\0\0'\3\1\0B\1\2\2+\2\0\0009\3\2\0009\4\2\0019\4\3\4\5\3\4\0X\3\aÄ6\3\0\0'\5\4\0B\3\2\0029\3\5\3B\3\1\2\18\2\3\0X\3\16Ä9\3\6\0009\4\6\0019\4\a\4\4\3\4\0X\3\5Ä9\3\6\0009\4\6\0019\4\b\4\5\3\4\0X\3\6Ä6\3\0\0'\5\4\0B\3\2\0029\3\t\3B\3\1\2\18\2\3\0006\3\0\0'\5\n\0B\3\2\0029\3\v\0035\5\14\0009\6\2\0009\a\2\0019\a\f\a\5\6\a\0X\6\2Ä'\6\r\0X\a\1Ä'\6\15\0=\6\16\5=\2\17\5D\3\2\0\rlocation\bkey\16__multiline\1\0\0\14__default\tline\28calculate_commentstring&ts_context_commentstring.internal\30get_visual_start_location\6V\6v\fcmotion\24get_cursor_location#ts_context_commentstring.utils\nblock\nctype\18Comment.utils\frequireñ\1\1\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0023\3\b\0=\3\t\2B\0\2\1K\0\1\0\rpre_hook\0\ropleader\1\0\1\nblock\15<leader>ci\ftoggler\1\0\0\1\0\1\tline\15<leader>cl\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
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
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
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
  ["cmp-tabnine"] = {
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/cmp-tabnine",
    url = "https://github.com/tzachar/cmp-tabnine"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["diffview.nvim"] = {
    config = { "\27LJ\2\nÇ\6\0\0\t\0'\0_6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\1\0\0'\3\3\0B\1\2\0029\1\4\0015\3\5\0005\4\6\0=\4\a\0035\4\b\0005\5\n\0\18\6\0\0'\b\t\0B\6\2\2=\6\v\5\18\6\0\0'\b\f\0B\6\2\2=\6\r\5\18\6\0\0'\b\14\0B\6\2\2=\6\15\5\18\6\0\0'\b\16\0B\6\2\2=\6\17\5=\5\18\0045\5\20\0\18\6\0\0'\b\19\0B\6\2\2=\6\21\5\18\6\0\0'\b\19\0B\6\2\2=\6\22\5\18\6\0\0'\b\23\0B\6\2\2=\6\24\5\18\6\0\0'\b\23\0B\6\2\2=\6\25\5\18\6\0\0'\b\26\0B\6\2\2=\6\27\5\18\6\0\0'\b\26\0B\6\2\2=\6\28\5\18\6\0\0'\b\26\0B\6\2\2=\6\29\5\18\6\0\0'\b\30\0B\6\2\2=\6\31\5\18\6\0\0'\b \0B\6\2\2=\6!\5\18\6\0\0'\b\"\0B\6\2\2=\6#\5\18\6\0\0'\b$\0B\6\2\2=\6%\5\18\6\0\0'\b\t\0B\6\2\2=\6\v\5\18\6\0\0'\b\f\0B\6\2\2=\6\r\5\18\6\0\0'\b\14\0B\6\2\2=\6\15\5\18\6\0\0'\b\16\0B\6\2\2=\6\17\5=\5\a\4=\4&\3B\1\2\1K\0\1\0\17key_bindings\6R\18refresh_files\6U\16unstage_all\6S\14stage_all\6-\23toggle_stage_entry\18<2-LeftMouse>\6o\t<cr>\17select_entry\t<up>\6k\15prev_entry\v<down>\6j\1\0\0\15next_entry\tview\14<leader>b\17toggle_files\14<leader>e\16focus_files\f<s-tab>\22select_prev_entry\n<tab>\1\0\0\22select_next_entry\1\0\1\21disable_defaults\1\15file_panel\1\0\1\nwidth\3#\1\0\2\14use_icons\2\18diff_binaries\1\nsetup\rdiffview\22diffview_callback\20diffview.config\frequire\0" },
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
    cond = { "\27LJ\2\n\15\0\0\1\0\0\0\2+\0\2\0L\0\2\0\0" },
    config = { "\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17mygalaxyline\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/opt/galaxyline.nvim",
    url = "https://github.com/NTBBloodbath/galaxyline.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n∏\4\0\0\5\0\18\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\14\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\3=\3\15\0025\3\16\0=\3\17\2B\0\2\1K\0\1\0\28current_line_blame_opts\1\0\1\ndelay\3\n\nsigns\1\0\0\17changedelete\1\0\4\nnumhl\21GitSignsChangeNr\ahl\19GitSignsChange\ttext\6~\vlinehl\21GitSignsChangeLn\14topdelete\1\0\4\nnumhl\21GitSignsDeleteNr\ahl\19GitSignsDelete\ttext\6-\vlinehl\21GitSignsDeleteLn\vdelete\1\0\4\nnumhl\21GitSignsDeleteNr\ahl\19GitSignsDelete\ttext\6-\vlinehl\21GitSignsDeleteLn\vchange\1\0\4\nnumhl\21GitSignsChangeNr\ahl\19GitSignsChange\ttext\6~\vlinehl\21GitSignsChangeLn\badd\1\0\0\1\0\4\nnumhl\18GitSignsAddNr\ahl\16GitSignsAdd\ttext\6+\vlinehl\18GitSignsAddLn\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["kanagawa.nvim"] = {
    cond = { "\27LJ\2\n\15\0\0\1\0\0\0\2+\0\1\0L\0\2\0\0" },
    config = { "\27LJ\2\n8\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\25colorscheme kanagawa\bcmd\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/opt/kanagawa.nvim",
    url = "https://github.com/rebelot/kanagawa.nvim"
  },
  ["lsp_signature.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18lsp_signature\frequire\0" },
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    config = { "\27LJ\2\nÔ\1\0\0\5\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0005\4\4\0=\4\5\3B\1\2\1K\0\1\0\23code_action_prompt\1\0\4\18sign_priority\3\20\tsign\2\venable\1\17virtual_text\2\1\0\6\14warn_sign\bÔÅ±\15error_sign\bÔÅó\22max_preview_lines\3\20\15infor_sign\bÔÅô\17border_style\nround\14hint_sign\bÔÅö\18init_lsp_saga\flspsaga\frequire\0" },
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/lspsaga.nvim",
    url = "https://github.com/tami5/lspsaga.nvim"
  },
  neogit = {
    config = { "\27LJ\2\n]\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\17integrations\1\0\0\1\0\1\rdiffview\2\nsetup\vneogit\frequire\0" },
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/neogit",
    url = "https://github.com/TimUntersberger/neogit"
  },
  ["nightfox.nvim"] = {
    cond = { "\27LJ\2\n\15\0\0\1\0\0\0\2+\0\1\0L\0\2\0\0" },
    config = { "\27LJ\2\na\0\0\3\0\a\0\n6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\4\0'\2\5\0B\0\2\0029\0\6\0B\0\1\1K\0\1\0\bset\rnightfox\frequire\fpalefox\19nightfox_style\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/opt/nightfox.nvim",
    url = "https://github.com/EdenEast/nightfox.nvim"
  },
  ["nvcode-color-schemes.vim"] = {
    cond = { "\27LJ\2\n\15\0\0\1\0\0\0\2+\0\1\0L\0\2\0\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/opt/nvcode-color-schemes.vim",
    url = "https://github.com/christianchiarulli/nvcode-color-schemes.vim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\nU\0\0\4\0\5\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\2B\0\2\1K\0\1\0\14fast_wrap\1\0\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\nõ\2\0\0\b\0\v\2+6\0\0\0009\0\1\0009\0\2\0)\2\0\0'\3\3\0B\0\3\2\a\0\4\0X\0\2Ä+\0\1\0L\0\2\0006\0\5\0006\2\0\0009\2\1\0029\2\6\2)\4\0\0B\2\2\0A\0\0\3\b\1\0\0X\2\20Ä6\2\0\0009\2\1\0029\2\a\2)\4\0\0\23\5\1\0\18\6\0\0+\a\2\0B\2\5\2:\2\1\2\18\4\2\0009\2\b\2\18\5\1\0\18\6\1\0B\2\4\2\18\4\2\0009\2\t\2'\5\n\0B\2\3\2\n\2\0\0X\2\2Ä+\2\1\0X\3\1Ä+\2\2\0L\2\2\0\a%s\nmatch\bsub\23nvim_buf_get_lines\24nvim_win_get_cursor\vunpack\vprompt\fbuftype\24nvim_buf_get_option\bapi\bvim\0\2C\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequire≈\1\0\1\3\3\5\0\29-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\19Ä-\1\1\0009\1\2\1B\1\1\2\15\0\1\0X\2\4Ä-\1\1\0009\1\3\1B\1\1\1X\1\nÄ-\1\2\0B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\4\1B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\2¿\0¿\1¿\rcomplete\19expand_or_jump\23expand_or_jumpable\21select_next_item\fvisibleé\1\0\1\4\2\4\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\rÄ-\1\1\0009\1\2\1)\3ˇˇB\1\2\2\15\0\1\0X\2\5Ä-\1\1\0009\1\3\1)\3ˇˇB\1\2\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\2¿\0¿\tjump\rjumpable\21select_prev_item\fvisibleﬁ\t\1\0\r\0D\1ä\0016\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\1B\1\1\0016\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\5\0005\4\4\0=\4\6\3B\1\2\0013\1\a\0006\2\0\0'\4\b\0B\2\2\0026\3\0\0'\5\t\0B\3\2\0029\4\n\2\18\6\4\0009\4\v\4'\a\f\0009\b\r\3B\b\1\0A\4\2\0019\4\14\0039\5\14\3\21\5\5\0\22\5\0\5'\6\15\0<\6\5\0049\4\16\0025\6\20\0005\a\18\0003\b\17\0=\b\19\a=\a\21\0065\a\24\0009\b\22\0029\b\23\b)\n¸ˇB\b\2\2=\b\25\a9\b\22\0029\b\23\b)\n\4\0B\b\2\2=\b\26\a9\b\22\0029\b\27\bB\b\1\2=\b\28\a9\b\22\0029\b\29\bB\b\1\2=\b\30\a9\b\22\0029\b\31\b5\n\"\0009\v \0029\v!\v=\v#\nB\b\2\2=\b$\a9\b\22\0023\n%\0005\v&\0B\b\3\2=\b'\a9\b\22\0023\n(\0005\v)\0B\b\3\2=\b*\a=\a\22\0064\a\a\0005\b+\0>\b\1\a5\b,\0>\b\2\a5\b-\0>\b\3\a5\b.\0>\b\4\a5\b/\0>\b\5\a5\b0\0>\b\6\a=\a1\0065\a7\0006\b\0\0'\n2\0B\b\2\0029\b3\b5\n4\0005\v5\0=\v6\nB\b\2\2=\b8\a=\a9\6B\4\2\0019\4\16\0029\4:\4'\6;\0005\a=\0004\b\3\0005\t<\0>\t\1\b=\b1\aB\4\3\0019\4\16\0029\4:\4'\6>\0005\aB\0009\b?\0029\b1\b4\n\3\0005\v@\0>\v\1\n4\v\3\0005\fA\0>\f\1\vB\b\3\2=\b1\a9\b\22\0029\bC\b9\b:\b4\n\0\0B\b\2\2=\b\22\aB\4\3\0012\0\0ÄK\0\1\0\vpreset\1\0\0\1\0\1\tname\fcmdline\1\0\1\tname\tpath\vconfig\6:\1\0\0\1\0\1\tname\vbuffer\6/\fcmdline\15formatting\vformat\1\0\0\tmenu\1\0\6\rnvim_lsp\n[LSP]\fluasnip\14[LuaSnip]\tpath\v[Path]\vbuffer\r[Buffer]\16cmp_tabnine\14[TabNine]\rnvim_lua\n[Lua]\1\0\1\14with_text\2\15cmp_format\flspkind\fsources\1\0\1\tname\vbuffer\1\0\1\tname\tpath\1\0\1\tname\16cmp_tabnine\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lua\1\0\1\tname\rnvim_lsp\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\t<CR>\rbehavior\1\0\1\vselect\2\fReplace\20ConfirmBehavior\fconfirm\n<C-e>\nclose\14<C-Space>\rcomplete\n<C-f>\n<C-b>\1\0\0\16scroll_docs\fmapping\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\vracket\tlisp\20on_confirm_done\17confirm_done\aon\nevent\"nvim-autopairs.completion.cmp\bcmp\0\npaths\1\0\0\1\2\0\0\f./snips\14lazy_load luasnip.loaders.from_vscode\fluasnip\frequire\2\0" },
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0" },
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
    config = { "\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\ndapui\frequire\0" },
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
    cond = { "\27LJ\2\n\15\0\0\1\0\0\0\2+\0\2\0L\0\2\0\0" },
    config = { "\27LJ\2\n$\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\tlsps\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-spectre"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fspectre\frequire\0" },
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/nvim-spectre",
    url = "https://github.com/windwp/nvim-spectre"
  },
  ["nvim-toggleterm.lua"] = {
    config = { "\27LJ\2\nÜ\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\15float_opts\1\0\1\vborder\vcurved\1\0\2\17open_mapping\n<A-d>\14direction\nfloat\nsetup\15toggleterm\frequire\0" },
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/nvim-toggleterm.lua",
    url = "https://github.com/akinsho/nvim-toggleterm.lua"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n¬\4\0\0\v\0\"\00076\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0006\0\0\0009\0\1\0)\1\1\0=\1\4\0006\0\5\0'\2\6\0B\0\2\0029\0\a\0006\1\5\0'\3\b\0B\1\2\0029\1\t\0015\3\n\0005\4\v\0005\5\20\0004\6\3\0005\a\r\0005\b\f\0=\b\14\a\18\b\0\0'\n\15\0B\b\2\2=\b\16\a>\a\1\0065\a\18\0005\b\17\0=\b\14\a\18\b\0\0'\n\19\0B\b\2\2=\b\16\a>\a\2\6=\6\21\5=\5\22\4=\4\23\0035\4\25\0005\5\24\0=\5\26\4=\4\27\0035\4\28\0=\4\29\0035\4\31\0005\5\30\0=\5 \4=\4!\3B\1\2\1K\0\1\0\rrenderer\19indent_markers\1\0\0\1\0\1\venable\2\16diagnostics\1\0\1\venable\2\ffilters\fexclude\1\0\0\1\a\0\0\t.git\17node_modules\v.cache\vtarget\a.o\bbin\tview\rmappings\tlist\1\0\0\acd\1\0\0\1\2\0\0\t<CR>\acb\tedit\bkey\1\0\0\1\3\0\0\6h\6l\1\0\1\nwidth\3\27\1\0\1\15update_cwd\2\nsetup\14nvim-tree\23nvim_tree_callback\21nvim-tree.config\frequire\30nvim_tree_respect_buf_cwd%nvim_tree_highlight_opened_files\21nvim_tree_git_hl\6g\bvim\0" },
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n$\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\tmisc\frequire\0" },
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-ts-context-commentstring"] = {
    config = { "\27LJ\2\nÖ\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\26context_commentstring\1\0\0\1\0\2\venable\2\19enable_autocmd\1\nsetup\28nvim-treesitter.configs\frequire\0" },
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
  ["symbols-outline.nvim"] = {
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/symbols-outline.nvim",
    url = "https://github.com/simrat39/symbols-outline.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\nì\1\0\0\a\0\t\0\0146\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\a\0005\3\5\0006\4\0\0'\6\3\0B\4\2\0029\4\4\4=\4\6\3=\3\b\2B\0\2\1K\0\1\0\rdefaults\1\0\0\16file_sorter\1\0\0\19get_fzy_sorter\22telescope.sorters\nsetup\14telescope\frequire\0" },
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
  zephyrium = {
    cond = { "\27LJ\2\n\15\0\0\1\0\0\0\2+\0\2\0L\0\2\0\0" },
    config = { "\27LJ\2\n9\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\26colorscheme zephyrium\bcmd\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/opt/zephyrium",
    url = "https://github.com/titanzero/zephyrium"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\nU\0\0\4\0\5\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\2B\0\2\1K\0\1\0\14fast_wrap\1\0\0\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\nõ\2\0\0\b\0\v\2+6\0\0\0009\0\1\0009\0\2\0)\2\0\0'\3\3\0B\0\3\2\a\0\4\0X\0\2Ä+\0\1\0L\0\2\0006\0\5\0006\2\0\0009\2\1\0029\2\6\2)\4\0\0B\2\2\0A\0\0\3\b\1\0\0X\2\20Ä6\2\0\0009\2\1\0029\2\a\2)\4\0\0\23\5\1\0\18\6\0\0+\a\2\0B\2\5\2:\2\1\2\18\4\2\0009\2\b\2\18\5\1\0\18\6\1\0B\2\4\2\18\4\2\0009\2\t\2'\5\n\0B\2\3\2\n\2\0\0X\2\2Ä+\2\1\0X\3\1Ä+\2\2\0L\2\2\0\a%s\nmatch\bsub\23nvim_buf_get_lines\24nvim_win_get_cursor\vunpack\vprompt\fbuftype\24nvim_buf_get_option\bapi\bvim\0\2C\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequire≈\1\0\1\3\3\5\0\29-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\19Ä-\1\1\0009\1\2\1B\1\1\2\15\0\1\0X\2\4Ä-\1\1\0009\1\3\1B\1\1\1X\1\nÄ-\1\2\0B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\4\1B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\2¿\0¿\1¿\rcomplete\19expand_or_jump\23expand_or_jumpable\21select_next_item\fvisibleé\1\0\1\4\2\4\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\rÄ-\1\1\0009\1\2\1)\3ˇˇB\1\2\2\15\0\1\0X\2\5Ä-\1\1\0009\1\3\1)\3ˇˇB\1\2\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\2¿\0¿\tjump\rjumpable\21select_prev_item\fvisibleﬁ\t\1\0\r\0D\1ä\0016\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\1B\1\1\0016\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\5\0005\4\4\0=\4\6\3B\1\2\0013\1\a\0006\2\0\0'\4\b\0B\2\2\0026\3\0\0'\5\t\0B\3\2\0029\4\n\2\18\6\4\0009\4\v\4'\a\f\0009\b\r\3B\b\1\0A\4\2\0019\4\14\0039\5\14\3\21\5\5\0\22\5\0\5'\6\15\0<\6\5\0049\4\16\0025\6\20\0005\a\18\0003\b\17\0=\b\19\a=\a\21\0065\a\24\0009\b\22\0029\b\23\b)\n¸ˇB\b\2\2=\b\25\a9\b\22\0029\b\23\b)\n\4\0B\b\2\2=\b\26\a9\b\22\0029\b\27\bB\b\1\2=\b\28\a9\b\22\0029\b\29\bB\b\1\2=\b\30\a9\b\22\0029\b\31\b5\n\"\0009\v \0029\v!\v=\v#\nB\b\2\2=\b$\a9\b\22\0023\n%\0005\v&\0B\b\3\2=\b'\a9\b\22\0023\n(\0005\v)\0B\b\3\2=\b*\a=\a\22\0064\a\a\0005\b+\0>\b\1\a5\b,\0>\b\2\a5\b-\0>\b\3\a5\b.\0>\b\4\a5\b/\0>\b\5\a5\b0\0>\b\6\a=\a1\0065\a7\0006\b\0\0'\n2\0B\b\2\0029\b3\b5\n4\0005\v5\0=\v6\nB\b\2\2=\b8\a=\a9\6B\4\2\0019\4\16\0029\4:\4'\6;\0005\a=\0004\b\3\0005\t<\0>\t\1\b=\b1\aB\4\3\0019\4\16\0029\4:\4'\6>\0005\aB\0009\b?\0029\b1\b4\n\3\0005\v@\0>\v\1\n4\v\3\0005\fA\0>\f\1\vB\b\3\2=\b1\a9\b\22\0029\bC\b9\b:\b4\n\0\0B\b\2\2=\b\22\aB\4\3\0012\0\0ÄK\0\1\0\vpreset\1\0\0\1\0\1\tname\fcmdline\1\0\1\tname\tpath\vconfig\6:\1\0\0\1\0\1\tname\vbuffer\6/\fcmdline\15formatting\vformat\1\0\0\tmenu\1\0\6\rnvim_lsp\n[LSP]\fluasnip\14[LuaSnip]\tpath\v[Path]\vbuffer\r[Buffer]\16cmp_tabnine\14[TabNine]\rnvim_lua\n[Lua]\1\0\1\14with_text\2\15cmp_format\flspkind\fsources\1\0\1\tname\vbuffer\1\0\1\tname\tpath\1\0\1\tname\16cmp_tabnine\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lua\1\0\1\tname\rnvim_lsp\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\t<CR>\rbehavior\1\0\1\vselect\2\fReplace\20ConfirmBehavior\fconfirm\n<C-e>\nclose\14<C-Space>\rcomplete\n<C-f>\n<C-b>\1\0\0\16scroll_docs\fmapping\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\vracket\tlisp\20on_confirm_done\17confirm_done\aon\nevent\"nvim-autopairs.completion.cmp\bcmp\0\npaths\1\0\0\1\2\0\0\f./snips\14lazy_load luasnip.loaders.from_vscode\fluasnip\frequire\2\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: diffview.nvim
time([[Config for diffview.nvim]], true)
try_loadstring("\27LJ\2\nÇ\6\0\0\t\0'\0_6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\1\0\0'\3\3\0B\1\2\0029\1\4\0015\3\5\0005\4\6\0=\4\a\0035\4\b\0005\5\n\0\18\6\0\0'\b\t\0B\6\2\2=\6\v\5\18\6\0\0'\b\f\0B\6\2\2=\6\r\5\18\6\0\0'\b\14\0B\6\2\2=\6\15\5\18\6\0\0'\b\16\0B\6\2\2=\6\17\5=\5\18\0045\5\20\0\18\6\0\0'\b\19\0B\6\2\2=\6\21\5\18\6\0\0'\b\19\0B\6\2\2=\6\22\5\18\6\0\0'\b\23\0B\6\2\2=\6\24\5\18\6\0\0'\b\23\0B\6\2\2=\6\25\5\18\6\0\0'\b\26\0B\6\2\2=\6\27\5\18\6\0\0'\b\26\0B\6\2\2=\6\28\5\18\6\0\0'\b\26\0B\6\2\2=\6\29\5\18\6\0\0'\b\30\0B\6\2\2=\6\31\5\18\6\0\0'\b \0B\6\2\2=\6!\5\18\6\0\0'\b\"\0B\6\2\2=\6#\5\18\6\0\0'\b$\0B\6\2\2=\6%\5\18\6\0\0'\b\t\0B\6\2\2=\6\v\5\18\6\0\0'\b\f\0B\6\2\2=\6\r\5\18\6\0\0'\b\14\0B\6\2\2=\6\15\5\18\6\0\0'\b\16\0B\6\2\2=\6\17\5=\5\a\4=\4&\3B\1\2\1K\0\1\0\17key_bindings\6R\18refresh_files\6U\16unstage_all\6S\14stage_all\6-\23toggle_stage_entry\18<2-LeftMouse>\6o\t<cr>\17select_entry\t<up>\6k\15prev_entry\v<down>\6j\1\0\0\15next_entry\tview\14<leader>b\17toggle_files\14<leader>e\16focus_files\f<s-tab>\22select_prev_entry\n<tab>\1\0\0\22select_next_entry\1\0\1\21disable_defaults\1\15file_panel\1\0\1\nwidth\3#\1\0\2\14use_icons\2\18diff_binaries\1\nsetup\rdiffview\22diffview_callback\20diffview.config\frequire\0", "config", "diffview.nvim")
time([[Config for diffview.nvim]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\nß\3\0\1\b\0\18\00006\1\0\0'\3\1\0B\1\2\2+\2\0\0009\3\2\0009\4\2\0019\4\3\4\5\3\4\0X\3\aÄ6\3\0\0'\5\4\0B\3\2\0029\3\5\3B\3\1\2\18\2\3\0X\3\16Ä9\3\6\0009\4\6\0019\4\a\4\4\3\4\0X\3\5Ä9\3\6\0009\4\6\0019\4\b\4\5\3\4\0X\3\6Ä6\3\0\0'\5\4\0B\3\2\0029\3\t\3B\3\1\2\18\2\3\0006\3\0\0'\5\n\0B\3\2\0029\3\v\0035\5\14\0009\6\2\0009\a\2\0019\a\f\a\5\6\a\0X\6\2Ä'\6\r\0X\a\1Ä'\6\15\0=\6\16\5=\2\17\5D\3\2\0\rlocation\bkey\16__multiline\1\0\0\14__default\tline\28calculate_commentstring&ts_context_commentstring.internal\30get_visual_start_location\6V\6v\fcmotion\24get_cursor_location#ts_context_commentstring.utils\nblock\nctype\18Comment.utils\frequireñ\1\1\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0023\3\b\0=\3\t\2B\0\2\1K\0\1\0\rpre_hook\0\ropleader\1\0\1\nblock\15<leader>ci\ftoggler\1\0\0\1\0\1\tline\15<leader>cl\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: nvim-dap-ui
time([[Config for nvim-dap-ui]], true)
try_loadstring("\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\ndapui\frequire\0", "config", "nvim-dap-ui")
time([[Config for nvim-dap-ui]], false)
-- Config for: neogit
time([[Config for neogit]], true)
try_loadstring("\27LJ\2\n]\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\17integrations\1\0\0\1\0\1\rdiffview\2\nsetup\vneogit\frequire\0", "config", "neogit")
time([[Config for neogit]], false)
-- Config for: nvim-ts-context-commentstring
time([[Config for nvim-ts-context-commentstring]], true)
try_loadstring("\27LJ\2\nÖ\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\26context_commentstring\1\0\0\1\0\2\venable\2\19enable_autocmd\1\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-ts-context-commentstring")
time([[Config for nvim-ts-context-commentstring]], false)
-- Config for: nvim-toggleterm.lua
time([[Config for nvim-toggleterm.lua]], true)
try_loadstring("\27LJ\2\nÜ\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\15float_opts\1\0\1\vborder\vcurved\1\0\2\17open_mapping\n<A-d>\14direction\nfloat\nsetup\15toggleterm\frequire\0", "config", "nvim-toggleterm.lua")
time([[Config for nvim-toggleterm.lua]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\nì\1\0\0\a\0\t\0\0146\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\a\0005\3\5\0006\4\0\0'\6\3\0B\4\2\0029\4\4\4=\4\6\3=\3\b\2B\0\2\1K\0\1\0\rdefaults\1\0\0\16file_sorter\1\0\0\19get_fzy_sorter\22telescope.sorters\nsetup\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: lsp_signature.nvim
time([[Config for lsp_signature.nvim]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18lsp_signature\frequire\0", "config", "lsp_signature.nvim")
time([[Config for lsp_signature.nvim]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n¬\4\0\0\v\0\"\00076\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0006\0\0\0009\0\1\0)\1\1\0=\1\4\0006\0\5\0'\2\6\0B\0\2\0029\0\a\0006\1\5\0'\3\b\0B\1\2\0029\1\t\0015\3\n\0005\4\v\0005\5\20\0004\6\3\0005\a\r\0005\b\f\0=\b\14\a\18\b\0\0'\n\15\0B\b\2\2=\b\16\a>\a\1\0065\a\18\0005\b\17\0=\b\14\a\18\b\0\0'\n\19\0B\b\2\2=\b\16\a>\a\2\6=\6\21\5=\5\22\4=\4\23\0035\4\25\0005\5\24\0=\5\26\4=\4\27\0035\4\28\0=\4\29\0035\4\31\0005\5\30\0=\5 \4=\4!\3B\1\2\1K\0\1\0\rrenderer\19indent_markers\1\0\0\1\0\1\venable\2\16diagnostics\1\0\1\venable\2\ffilters\fexclude\1\0\0\1\a\0\0\t.git\17node_modules\v.cache\vtarget\a.o\bbin\tview\rmappings\tlist\1\0\0\acd\1\0\0\1\2\0\0\t<CR>\acb\tedit\bkey\1\0\0\1\3\0\0\6h\6l\1\0\1\nwidth\3\27\1\0\1\15update_cwd\2\nsetup\14nvim-tree\23nvim_tree_callback\21nvim-tree.config\frequire\30nvim_tree_respect_buf_cwd%nvim_tree_highlight_opened_files\21nvim_tree_git_hl\6g\bvim\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n∏\4\0\0\5\0\18\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\14\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\3=\3\15\0025\3\16\0=\3\17\2B\0\2\1K\0\1\0\28current_line_blame_opts\1\0\1\ndelay\3\n\nsigns\1\0\0\17changedelete\1\0\4\nnumhl\21GitSignsChangeNr\ahl\19GitSignsChange\ttext\6~\vlinehl\21GitSignsChangeLn\14topdelete\1\0\4\nnumhl\21GitSignsDeleteNr\ahl\19GitSignsDelete\ttext\6-\vlinehl\21GitSignsDeleteLn\vdelete\1\0\4\nnumhl\21GitSignsDeleteNr\ahl\19GitSignsDelete\ttext\6-\vlinehl\21GitSignsDeleteLn\vchange\1\0\4\nnumhl\21GitSignsChangeNr\ahl\19GitSignsChange\ttext\6~\vlinehl\21GitSignsChangeLn\badd\1\0\0\1\0\4\nnumhl\18GitSignsAddNr\ahl\16GitSignsAdd\ttext\6+\vlinehl\18GitSignsAddLn\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: nvim-spectre
time([[Config for nvim-spectre]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fspectre\frequire\0", "config", "nvim-spectre")
time([[Config for nvim-spectre]], false)
-- Config for: lspsaga.nvim
time([[Config for lspsaga.nvim]], true)
try_loadstring("\27LJ\2\nÔ\1\0\0\5\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0005\4\4\0=\4\5\3B\1\2\1K\0\1\0\23code_action_prompt\1\0\4\18sign_priority\3\20\tsign\2\venable\1\17virtual_text\2\1\0\6\14warn_sign\bÔÅ±\15error_sign\bÔÅó\22max_preview_lines\3\20\15infor_sign\bÔÅô\17border_style\nround\14hint_sign\bÔÅö\18init_lsp_saga\flspsaga\frequire\0", "config", "lspsaga.nvim")
time([[Config for lspsaga.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n$\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\tmisc\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Conditional loads
time([[Conditional loading of zephyrium]], true)
  require("packer.load")({"zephyrium"}, {}, _G.packer_plugins)
time([[Conditional loading of zephyrium]], false)
time([[Conditional loading of galaxyline.nvim]], true)
  require("packer.load")({"galaxyline.nvim"}, {}, _G.packer_plugins)
time([[Conditional loading of galaxyline.nvim]], false)
time([[Conditional loading of nvim-lspconfig]], true)
  require("packer.load")({"nvim-lspconfig"}, {}, _G.packer_plugins)
time([[Conditional loading of nvim-lspconfig]], false)
time([[Conditional loading of kanagawa.nvim]], true)
  require("packer.load")({"kanagawa.nvim"}, {}, _G.packer_plugins)
time([[Conditional loading of kanagawa.nvim]], false)
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
vim.cmd [[au FileType html ++once lua require("packer.load")({'nvim-ts-rainbow'}, { ft = "html" }, _G.packer_plugins)]]
vim.cmd [[au FileType vue ++once lua require("packer.load")({'nvim-ts-rainbow'}, { ft = "vue" }, _G.packer_plugins)]]
vim.cmd [[au FileType ron ++once lua require("packer.load")({'ron.vim'}, { ft = "ron" }, _G.packer_plugins)]]
vim.cmd [[au FileType clojure ++once lua require("packer.load")({'nvim-ts-rainbow', 'vim-fireplace'}, { ft = "clojure" }, _G.packer_plugins)]]
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
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
