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
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/LuaSnip"
  },
  ["barbar.nvim"] = {
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/barbar.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/cmp_luasnip"
  },
  ["diffview.nvim"] = {
    config = { "\27LJ\1\2‚\6\0\0\a\0'\0_4\0\0\0%\1\1\0>\0\2\0027\0\2\0004\1\0\0%\2\3\0>\1\2\0027\1\4\0013\2\5\0003\3\6\0:\3\a\0023\3\b\0003\4\n\0\16\5\0\0%\6\t\0>\5\2\2:\5\v\4\16\5\0\0%\6\f\0>\5\2\2:\5\r\4\16\5\0\0%\6\14\0>\5\2\2:\5\15\4\16\5\0\0%\6\16\0>\5\2\2:\5\17\4:\4\18\0033\4\20\0\16\5\0\0%\6\19\0>\5\2\2:\5\21\4\16\5\0\0%\6\19\0>\5\2\2:\5\22\4\16\5\0\0%\6\23\0>\5\2\2:\5\24\4\16\5\0\0%\6\23\0>\5\2\2:\5\25\4\16\5\0\0%\6\26\0>\5\2\2:\5\27\4\16\5\0\0%\6\26\0>\5\2\2:\5\28\4\16\5\0\0%\6\26\0>\5\2\2:\5\29\4\16\5\0\0%\6\30\0>\5\2\2:\5\31\4\16\5\0\0%\6 \0>\5\2\2:\5!\4\16\5\0\0%\6\"\0>\5\2\2:\5#\4\16\5\0\0%\6$\0>\5\2\2:\5%\4\16\5\0\0%\6\t\0>\5\2\2:\5\v\4\16\5\0\0%\6\f\0>\5\2\2:\5\r\4\16\5\0\0%\6\14\0>\5\2\2:\5\15\4\16\5\0\0%\6\16\0>\5\2\2:\5\17\4:\4\a\3:\3&\2>\1\2\1G\0\1\0\17key_bindings\6R\18refresh_files\6U\16unstage_all\6S\14stage_all\6-\23toggle_stage_entry\18<2-LeftMouse>\6o\t<cr>\17select_entry\t<up>\6k\15prev_entry\v<down>\6j\1\0\0\15next_entry\tview\14<leader>b\17toggle_files\14<leader>e\16focus_files\f<s-tab>\22select_prev_entry\n<tab>\1\0\0\22select_next_entry\1\0\1\21disable_defaults\1\15file_panel\1\0\1\nwidth\3#\1\0\2\18diff_binaries\1\14use_icons\2\nsetup\rdiffview\22diffview_callback\20diffview.config\frequire\0" },
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/diffview.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/friendly-snippets"
  },
  ["galaxyline.nvim"] = {
    config = { "\27LJ\1\2,\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\17mygalaxyline\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/opt/galaxyline.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\1\2¸\4\0\0\4\0\18\0\0214\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\14\0003\2\4\0003\3\3\0:\3\5\0023\3\6\0:\3\a\0023\3\b\0:\3\t\0023\3\n\0:\3\v\0023\3\f\0:\3\r\2:\2\15\0013\2\16\0:\2\17\1>\0\2\1G\0\1\0\28current_line_blame_opts\1\0\1\ndelay\3\n\nsigns\1\0\0\17changedelete\1\0\4\ttext\6~\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\14topdelete\1\0\4\ttext\6-\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\vdelete\1\0\4\ttext\6-\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\vchange\1\0\4\ttext\6~\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\badd\1\0\0\1\0\4\ttext\6+\nnumhl\18GitSignsAddNr\vlinehl\18GitSignsAddLn\ahl\16GitSignsAdd\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  kommentary = {
    config = { "\27LJ\1\2^\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\25update_commentstring&ts_context_commentstring.internal\frequireë\1\1\0\4\0\n\0\0144\0\0\0007\0\1\0)\1\1\0:\1\2\0004\0\3\0%\1\4\0>\0\2\0027\0\5\0%\1\6\0003\2\a\0001\3\b\0:\3\t\2>\0\3\1G\0\1\0\18hook_function\0\1\0\2\31multi_line_comment_strings\tauto\31single_line_comment_string\tauto\bvue\23configure_language\22kommentary.config\frequire'kommentary_create_default_mappings\6g\bvim\0" },
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/kommentary"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    config = { "\27LJ\1\2ï\1\0\0\4\0\6\0\t4\0\0\0%\1\1\0>\0\2\0027\1\2\0003\2\3\0003\3\4\0:\3\5\2>\1\2\1G\0\1\0\23code_action_prompt\1\0\4\18sign_priority\3\20\17virtual_text\2\tsign\2\venable\1\1\0\6\14hint_sign\bïš\15error_sign\bï—\14warn_sign\bï±\22max_preview_lines\3\20\15infor_sign\bï™\17border_style\nround\18init_lsp_saga\flspsaga\frequire\0" },
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  neogit = {
    config = { "\27LJ\1\2]\0\0\3\0\6\0\t4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0003\2\3\0:\2\5\1>\0\2\1G\0\1\0\17integrations\1\0\0\1\0\1\rdiffview\2\nsetup\vneogit\frequire\0" },
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/neogit"
  },
  ["nightfox.nvim"] = {
    config = { "\27LJ\1\2a\0\0\2\0\a\0\n4\0\0\0007\0\1\0%\1\3\0:\1\2\0004\0\4\0%\1\5\0>\0\2\0027\0\6\0>\0\1\1G\0\1\0\bset\rnightfox\frequire\fpalefox\19nightfox_style\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/opt/nightfox.nvim"
  },
  ["nvcode-color-schemes.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/opt/nvcode-color-schemes.vim"
  },
  ["nvim-autopairs"] = {
    config = { '\27LJ\1\2¾\1\0\0\3\0\b\0\0154\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0003\2\3\0:\2\5\1>\0\2\0014\0\0\0%\1\6\0>\0\2\0027\0\2\0003\1\a\0>\0\2\1G\0\1\0\1\0\3\17map_complete\2\16auto_select\2\vmap_cr\2"nvim-autopairs.completion.cmp\14fast_wrap\1\0\0\1\0\1\fend_key\6e\nsetup\19nvim-autopairs\frequire\0' },
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\1\2›\2\0\0\a\0\v\2+4\0\0\0007\0\1\0007\0\2\0'\1\0\0%\2\3\0>\0\3\2\a\0\4\0T\0\2€)\0\1\0H\0\2\0004\0\5\0004\1\0\0007\1\1\0017\1\6\1'\2\0\0>\1\2\0=\0\0\3\b\1\0\0T\2\20€4\2\0\0007\2\1\0027\2\a\2'\3\0\0\21\4\1\0\16\5\0\0)\6\2\0>\2\5\0028\2\1\2\16\3\2\0007\2\b\2\16\4\1\0\16\5\1\0>\2\4\2\16\3\2\0007\2\t\2%\4\n\0>\2\3\2\n\2\0\0T\2\2€)\2\1\0T\3\1€)\2\2\0H\2\2\0\a%s\nmatch\bsub\23nvim_buf_get_lines\24nvim_win_get_cursor\vunpack\vprompt\fbuftype\24nvim_buf_get_option\bapi\bvim\0\2C\0\1\3\0\4\0\a4\1\0\0%\2\1\0>\1\2\0027\1\2\0017\2\3\0>\1\2\1G\0\1\0\tbody\15lsp_expand\fluasnip\frequireÅ\1\0\1\2\3\5\0\29+\1\0\0007\1\0\1>\1\1\2\15\0\1\0T\2\4€+\1\0\0007\1\1\1>\1\1\1T\1\19€+\1\1\0007\1\2\1>\1\1\2\15\0\1\0T\2\4€+\1\1\0007\1\3\1>\1\1\1T\1\n€+\1\2\0>\1\1\2\15\0\1\0T\2\4€+\1\0\0007\1\4\1>\1\1\1T\1\2€\16\1\0\0>\1\1\1G\0\1\0\3À\2À\1À\rcomplete\19expand_or_jump\23expand_or_jumpable\21select_next_item\fvisibleŽ\1\0\1\3\2\4\0\23+\1\0\0007\1\0\1>\1\1\2\15\0\1\0T\2\4€+\1\0\0007\1\1\1>\1\1\1T\1\r€+\1\1\0007\1\2\1'\2ÿÿ>\1\2\2\15\0\1\0T\2\5€+\1\1\0007\1\3\1'\2ÿÿ>\1\2\1T\1\2€\16\1\0\0>\1\1\1G\0\1\0\3À\2À\tjump\rjumpable\21select_prev_item\fvisible±\6\1\0\n\0.\0U4\0\0\0%\1\1\0>\0\2\0024\1\0\0%\2\2\0>\1\2\0027\1\3\1>\1\1\0011\1\4\0004\2\5\0007\2\6\2%\3\a\0>\2\2\0014\2\0\0%\3\1\0>\2\2\0024\3\0\0%\4\b\0>\3\2\0027\4\t\0033\5\r\0003\6\v\0001\a\n\0:\a\f\6:\6\14\0053\6\17\0007\a\15\0037\a\16\a'\büÿ>\a\2\2:\a\18\0067\a\15\0037\a\16\a'\b\4\0>\a\2\2:\a\19\0067\a\15\0037\a\20\a>\a\1\2:\a\21\0067\a\15\0037\a\22\a>\a\1\2:\a\23\0067\a\15\0037\a\24\a>\a\1\2:\a\25\0067\a\15\0031\b\26\0003\t\27\0>\a\3\2:\a\28\0067\a\15\0031\b\29\0003\t\30\0>\a\3\2:\a\31\6:\6\15\0052\6\6\0003\a \0;\a\1\0063\a!\0;\a\2\0063\a\"\0;\a\3\0063\a#\0;\a\4\0063\a$\0;\a\5\6:\6%\0053\6+\0004\a\0\0%\b&\0>\a\2\0027\a'\a3\b(\0003\t)\0:\t*\b>\a\2\2:\a,\6:\6-\5>\4\2\0010\0\0€G\0\1\0\15formatting\vformat\1\0\0\tmenu\1\0\5\fluasnip\14[LuaSnip]\rnvim_lua\n[Lua]\rnvim_lsp\n[LSP]\vbuffer\r[Buffer]\tpath\v[Path]\1\0\1\14with_text\2\15cmp_format\flspkind\fsources\1\0\1\tname\fluasnip\1\0\1\tname\vbuffer\1\0\1\tname\tpath\1\0\1\tname\rnvim_lua\1\0\1\tname\rnvim_lsp\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\t<CR>\fconfirm\n<C-e>\nclose\14<C-Space>\rcomplete\n<C-f>\n<C-b>\1\0\0\16scroll_docs\fmapping\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\bcmp,highlight! link CmpItemMenu CmpItemKind\bcmd\bvim\0\14lazy_load luasnip.loaders.from_vscode\fluasnip\frequire\0" },
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\1\0027\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/nvim-dap"
  },
  ["nvim-dap-ui"] = {
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/nvim-dap-ui"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\1\2$\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\tlsps\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/nvim-lspinstall"
  },
  ["nvim-spectre"] = {
    config = { "\27LJ\1\0025\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\fspectre\frequire\0" },
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/nvim-spectre"
  },
  ["nvim-toggleterm.lua"] = {
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/nvim-toggleterm.lua"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\1\2‡\4\0\0\t\0\26\00014\0\0\0%\1\1\0>\0\2\0027\0\2\0004\1\0\0%\2\3\0>\1\2\0027\1\4\0013\2\17\0003\3\5\0003\4\14\0002\5\3\0003\6\a\0003\a\6\0:\a\b\6\16\a\0\0%\b\t\0>\a\2\2:\a\n\6;\6\1\0053\6\f\0003\a\v\0:\a\b\6\16\a\0\0%\b\r\0>\a\2\2:\a\n\6;\6\2\5:\5\15\4:\4\16\3:\3\18\2>\1\2\0014\1\19\0007\1\20\0013\2\22\0:\2\21\0014\1\19\0007\1\20\1'\2\1\0:\2\23\0014\1\19\0007\1\20\1'\2\1\0:\2\24\0014\1\19\0007\1\20\1'\2\1\0:\2\25\1G\0\1\0%nvim_tree_highlight_opened_files\24nvim_tree_gitignore\21nvim_tree_git_hl\1\a\0\0\t.git\17node_modules\v.cache\vtarget\a.o\bbin\21nvim_tree_ignore\6g\bvim\tview\1\0\3\18disable_netrw\1\17hijack_netrw\1\19indent_markers\3\1\rmappings\tlist\1\0\0\acd\1\0\0\1\2\0\0\t<CR>\acb\tedit\bkey\1\0\0\1\3\0\0\6h\6l\1\0\1\nwidth\3\27\nsetup\14nvim-tree\23nvim_tree_callback\21nvim-tree.config\frequire\0" },
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\1\2$\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\tmisc\frequire\0" },
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-ts-context-commentstring"] = {
    config = { "\27LJ\1\2…\1\0\0\3\0\6\0\t4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0003\2\3\0:\2\5\1>\0\2\1G\0\1\0\26context_commentstring\1\0\0\1\0\2\19enable_autocmd\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring"
  },
  ["nvim-ts-rainbow"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/opt/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["ron.vim"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/opt/ron.vim"
  },
  ["rust-tools.nvim"] = {
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/rust-tools.nvim"
  },
  ["surround.nvim"] = {
    config = { "\27LJ\1\2h\0\0\2\0\6\0\v4\0\0\0%\1\1\0>\0\2\0027\0\2\0002\1\0\0>\0\2\0014\0\3\0007\0\4\0%\1\1\0:\1\5\0G\0\1\0\28surround_mappings_style\6g\bvim\nsetup\rsurround\frequire\0" },
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/surround.nvim"
  },
  ["symbols-outline.nvim"] = {
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/symbols-outline.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\1\2“\1\0\0\5\0\t\0\0144\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\a\0003\2\5\0004\3\0\0%\4\3\0>\3\2\0027\3\4\3:\3\6\2:\2\b\1>\0\2\1G\0\1\0\rdefaults\1\0\0\16file_sorter\1\0\0\19get_fzy_sorter\22telescope.sorters\nsetup\14telescope\frequire\0" },
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["vim-fireplace"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/opt/vim-fireplace"
  },
  ["vim-lastplace"] = {
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/vim-lastplace"
  },
  vimwiki = {
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/vimwiki"
  },
  ["zephyr-nvim"] = {
    config = { "\27LJ\1\0026\0\0\2\0\3\0\0054\0\0\0007\0\1\0%\1\2\0>\0\2\1G\0\1\0\23colorscheme zephyr\bcmd\bvim\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/opt/zephyr-nvim"
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
-- Config for: neogit
time([[Config for neogit]], true)
try_loadstring("\27LJ\1\2]\0\0\3\0\6\0\t4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0003\2\3\0:\2\5\1>\0\2\1G\0\1\0\17integrations\1\0\0\1\0\1\rdiffview\2\nsetup\vneogit\frequire\0", "config", "neogit")
time([[Config for neogit]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\1\2‡\4\0\0\t\0\26\00014\0\0\0%\1\1\0>\0\2\0027\0\2\0004\1\0\0%\2\3\0>\1\2\0027\1\4\0013\2\17\0003\3\5\0003\4\14\0002\5\3\0003\6\a\0003\a\6\0:\a\b\6\16\a\0\0%\b\t\0>\a\2\2:\a\n\6;\6\1\0053\6\f\0003\a\v\0:\a\b\6\16\a\0\0%\b\r\0>\a\2\2:\a\n\6;\6\2\5:\5\15\4:\4\16\3:\3\18\2>\1\2\0014\1\19\0007\1\20\0013\2\22\0:\2\21\0014\1\19\0007\1\20\1'\2\1\0:\2\23\0014\1\19\0007\1\20\1'\2\1\0:\2\24\0014\1\19\0007\1\20\1'\2\1\0:\2\25\1G\0\1\0%nvim_tree_highlight_opened_files\24nvim_tree_gitignore\21nvim_tree_git_hl\1\a\0\0\t.git\17node_modules\v.cache\vtarget\a.o\bbin\21nvim_tree_ignore\6g\bvim\tview\1\0\3\18disable_netrw\1\17hijack_netrw\1\19indent_markers\3\1\rmappings\tlist\1\0\0\acd\1\0\0\1\2\0\0\t<CR>\acb\tedit\bkey\1\0\0\1\3\0\0\6h\6l\1\0\1\nwidth\3\27\nsetup\14nvim-tree\23nvim_tree_callback\21nvim-tree.config\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: nvim-ts-context-commentstring
time([[Config for nvim-ts-context-commentstring]], true)
try_loadstring("\27LJ\1\2…\1\0\0\3\0\6\0\t4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0003\2\3\0:\2\5\1>\0\2\1G\0\1\0\26context_commentstring\1\0\0\1\0\2\19enable_autocmd\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-ts-context-commentstring")
time([[Config for nvim-ts-context-commentstring]], false)
-- Config for: diffview.nvim
time([[Config for diffview.nvim]], true)
try_loadstring("\27LJ\1\2‚\6\0\0\a\0'\0_4\0\0\0%\1\1\0>\0\2\0027\0\2\0004\1\0\0%\2\3\0>\1\2\0027\1\4\0013\2\5\0003\3\6\0:\3\a\0023\3\b\0003\4\n\0\16\5\0\0%\6\t\0>\5\2\2:\5\v\4\16\5\0\0%\6\f\0>\5\2\2:\5\r\4\16\5\0\0%\6\14\0>\5\2\2:\5\15\4\16\5\0\0%\6\16\0>\5\2\2:\5\17\4:\4\18\0033\4\20\0\16\5\0\0%\6\19\0>\5\2\2:\5\21\4\16\5\0\0%\6\19\0>\5\2\2:\5\22\4\16\5\0\0%\6\23\0>\5\2\2:\5\24\4\16\5\0\0%\6\23\0>\5\2\2:\5\25\4\16\5\0\0%\6\26\0>\5\2\2:\5\27\4\16\5\0\0%\6\26\0>\5\2\2:\5\28\4\16\5\0\0%\6\26\0>\5\2\2:\5\29\4\16\5\0\0%\6\30\0>\5\2\2:\5\31\4\16\5\0\0%\6 \0>\5\2\2:\5!\4\16\5\0\0%\6\"\0>\5\2\2:\5#\4\16\5\0\0%\6$\0>\5\2\2:\5%\4\16\5\0\0%\6\t\0>\5\2\2:\5\v\4\16\5\0\0%\6\f\0>\5\2\2:\5\r\4\16\5\0\0%\6\14\0>\5\2\2:\5\15\4\16\5\0\0%\6\16\0>\5\2\2:\5\17\4:\4\a\3:\3&\2>\1\2\1G\0\1\0\17key_bindings\6R\18refresh_files\6U\16unstage_all\6S\14stage_all\6-\23toggle_stage_entry\18<2-LeftMouse>\6o\t<cr>\17select_entry\t<up>\6k\15prev_entry\v<down>\6j\1\0\0\15next_entry\tview\14<leader>b\17toggle_files\14<leader>e\16focus_files\f<s-tab>\22select_prev_entry\n<tab>\1\0\0\22select_next_entry\1\0\1\21disable_defaults\1\15file_panel\1\0\1\nwidth\3#\1\0\2\18diff_binaries\1\14use_icons\2\nsetup\rdiffview\22diffview_callback\20diffview.config\frequire\0", "config", "diffview.nvim")
time([[Config for diffview.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\1\2›\2\0\0\a\0\v\2+4\0\0\0007\0\1\0007\0\2\0'\1\0\0%\2\3\0>\0\3\2\a\0\4\0T\0\2€)\0\1\0H\0\2\0004\0\5\0004\1\0\0007\1\1\0017\1\6\1'\2\0\0>\1\2\0=\0\0\3\b\1\0\0T\2\20€4\2\0\0007\2\1\0027\2\a\2'\3\0\0\21\4\1\0\16\5\0\0)\6\2\0>\2\5\0028\2\1\2\16\3\2\0007\2\b\2\16\4\1\0\16\5\1\0>\2\4\2\16\3\2\0007\2\t\2%\4\n\0>\2\3\2\n\2\0\0T\2\2€)\2\1\0T\3\1€)\2\2\0H\2\2\0\a%s\nmatch\bsub\23nvim_buf_get_lines\24nvim_win_get_cursor\vunpack\vprompt\fbuftype\24nvim_buf_get_option\bapi\bvim\0\2C\0\1\3\0\4\0\a4\1\0\0%\2\1\0>\1\2\0027\1\2\0017\2\3\0>\1\2\1G\0\1\0\tbody\15lsp_expand\fluasnip\frequireÅ\1\0\1\2\3\5\0\29+\1\0\0007\1\0\1>\1\1\2\15\0\1\0T\2\4€+\1\0\0007\1\1\1>\1\1\1T\1\19€+\1\1\0007\1\2\1>\1\1\2\15\0\1\0T\2\4€+\1\1\0007\1\3\1>\1\1\1T\1\n€+\1\2\0>\1\1\2\15\0\1\0T\2\4€+\1\0\0007\1\4\1>\1\1\1T\1\2€\16\1\0\0>\1\1\1G\0\1\0\3À\2À\1À\rcomplete\19expand_or_jump\23expand_or_jumpable\21select_next_item\fvisibleŽ\1\0\1\3\2\4\0\23+\1\0\0007\1\0\1>\1\1\2\15\0\1\0T\2\4€+\1\0\0007\1\1\1>\1\1\1T\1\r€+\1\1\0007\1\2\1'\2ÿÿ>\1\2\2\15\0\1\0T\2\5€+\1\1\0007\1\3\1'\2ÿÿ>\1\2\1T\1\2€\16\1\0\0>\1\1\1G\0\1\0\3À\2À\tjump\rjumpable\21select_prev_item\fvisible±\6\1\0\n\0.\0U4\0\0\0%\1\1\0>\0\2\0024\1\0\0%\2\2\0>\1\2\0027\1\3\1>\1\1\0011\1\4\0004\2\5\0007\2\6\2%\3\a\0>\2\2\0014\2\0\0%\3\1\0>\2\2\0024\3\0\0%\4\b\0>\3\2\0027\4\t\0033\5\r\0003\6\v\0001\a\n\0:\a\f\6:\6\14\0053\6\17\0007\a\15\0037\a\16\a'\büÿ>\a\2\2:\a\18\0067\a\15\0037\a\16\a'\b\4\0>\a\2\2:\a\19\0067\a\15\0037\a\20\a>\a\1\2:\a\21\0067\a\15\0037\a\22\a>\a\1\2:\a\23\0067\a\15\0037\a\24\a>\a\1\2:\a\25\0067\a\15\0031\b\26\0003\t\27\0>\a\3\2:\a\28\0067\a\15\0031\b\29\0003\t\30\0>\a\3\2:\a\31\6:\6\15\0052\6\6\0003\a \0;\a\1\0063\a!\0;\a\2\0063\a\"\0;\a\3\0063\a#\0;\a\4\0063\a$\0;\a\5\6:\6%\0053\6+\0004\a\0\0%\b&\0>\a\2\0027\a'\a3\b(\0003\t)\0:\t*\b>\a\2\2:\a,\6:\6-\5>\4\2\0010\0\0€G\0\1\0\15formatting\vformat\1\0\0\tmenu\1\0\5\fluasnip\14[LuaSnip]\rnvim_lua\n[Lua]\rnvim_lsp\n[LSP]\vbuffer\r[Buffer]\tpath\v[Path]\1\0\1\14with_text\2\15cmp_format\flspkind\fsources\1\0\1\tname\fluasnip\1\0\1\tname\vbuffer\1\0\1\tname\tpath\1\0\1\tname\rnvim_lua\1\0\1\tname\rnvim_lsp\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\t<CR>\fconfirm\n<C-e>\nclose\14<C-Space>\rcomplete\n<C-f>\n<C-b>\1\0\0\16scroll_docs\fmapping\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\bcmp,highlight! link CmpItemMenu CmpItemKind\bcmd\bvim\0\14lazy_load luasnip.loaders.from_vscode\fluasnip\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
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
-- Config for: nvim-spectre
time([[Config for nvim-spectre]], true)
try_loadstring("\27LJ\1\0025\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\fspectre\frequire\0", "config", "nvim-spectre")
time([[Config for nvim-spectre]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\1\2“\1\0\0\5\0\t\0\0144\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\a\0003\2\5\0004\3\0\0%\4\3\0>\3\2\0027\3\4\3:\3\6\2:\2\b\1>\0\2\1G\0\1\0\rdefaults\1\0\0\16file_sorter\1\0\0\19get_fzy_sorter\22telescope.sorters\nsetup\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring('\27LJ\1\2¾\1\0\0\3\0\b\0\0154\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0003\2\3\0:\2\5\1>\0\2\0014\0\0\0%\1\6\0>\0\2\0027\0\2\0003\1\a\0>\0\2\1G\0\1\0\1\0\3\17map_complete\2\16auto_select\2\vmap_cr\2"nvim-autopairs.completion.cmp\14fast_wrap\1\0\0\1\0\1\fend_key\6e\nsetup\19nvim-autopairs\frequire\0', "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: kommentary
time([[Config for kommentary]], true)
try_loadstring("\27LJ\1\2^\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\25update_commentstring&ts_context_commentstring.internal\frequireë\1\1\0\4\0\n\0\0144\0\0\0007\0\1\0)\1\1\0:\1\2\0004\0\3\0%\1\4\0>\0\2\0027\0\5\0%\1\6\0003\2\a\0001\3\b\0:\3\t\2>\0\3\1G\0\1\0\18hook_function\0\1\0\2\31multi_line_comment_strings\tauto\31single_line_comment_string\tauto\bvue\23configure_language\22kommentary.config\frequire'kommentary_create_default_mappings\6g\bvim\0", "config", "kommentary")
time([[Config for kommentary]], false)
-- Conditional loads
time("Condition for { 'zephyr-nvim', 'galaxyline.nvim', 'nvim-lspconfig' }", true)
if
try_loadstring("\27LJ\1\2\15\0\0\1\0\0\0\2)\0\2\0H\0\2\0\0", "condition", '{ "zephyr-nvim", "galaxyline.nvim", "nvim-lspconfig" }')
then
time("Condition for { 'zephyr-nvim', 'galaxyline.nvim', 'nvim-lspconfig' }", false)
time([[packadd for zephyr-nvim]], true)
		require("packer.load")({"zephyr-nvim"}, {}, _G.packer_plugins)
	time([[packadd for zephyr-nvim]], false)
	-- Config for: zephyr-nvim
	time([[Config for zephyr-nvim]], true)
	try_loadstring("\27LJ\1\0026\0\0\2\0\3\0\0054\0\0\0007\0\1\0%\1\2\0>\0\2\1G\0\1\0\23colorscheme zephyr\bcmd\bvim\0", "config", "zephyr-nvim")
	time([[Config for zephyr-nvim]], false)
	time([[packadd for galaxyline.nvim]], true)
		require("packer.load")({"galaxyline.nvim"}, {}, _G.packer_plugins)
	time([[packadd for galaxyline.nvim]], false)
	-- Config for: galaxyline.nvim
	time([[Config for galaxyline.nvim]], true)
	try_loadstring("\27LJ\1\2,\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\17mygalaxyline\frequire\0", "config", "galaxyline.nvim")
	time([[Config for galaxyline.nvim]], false)
	time([[packadd for nvim-lspconfig]], true)
		require("packer.load")({"nvim-lspconfig"}, {}, _G.packer_plugins)
	time([[packadd for nvim-lspconfig]], false)
	-- Config for: nvim-lspconfig
	time([[Config for nvim-lspconfig]], true)
	try_loadstring("\27LJ\1\2$\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\tlsps\frequire\0", "config", "nvim-lspconfig")
	time([[Config for nvim-lspconfig]], false)
else
time("Condition for { 'zephyr-nvim', 'galaxyline.nvim', 'nvim-lspconfig' }", false)
end
time("Condition for { 'nvcode-color-schemes.vim', 'nightfox.nvim' }", true)
if
try_loadstring("\27LJ\1\2\15\0\0\1\0\0\0\2)\0\1\0H\0\2\0\0", "condition", '{ "nvcode-color-schemes.vim", "nightfox.nvim" }')
then
time("Condition for { 'nvcode-color-schemes.vim', 'nightfox.nvim' }", false)
time([[packadd for nvcode-color-schemes.vim]], true)
		require("packer.load")({"nvcode-color-schemes.vim"}, {}, _G.packer_plugins)
	time([[packadd for nvcode-color-schemes.vim]], false)
	time([[packadd for nightfox.nvim]], true)
		require("packer.load")({"nightfox.nvim"}, {}, _G.packer_plugins)
	time([[packadd for nightfox.nvim]], false)
	-- Config for: nightfox.nvim
	time([[Config for nightfox.nvim]], true)
	try_loadstring("\27LJ\1\2a\0\0\2\0\a\0\n4\0\0\0007\0\1\0%\1\3\0:\1\2\0004\0\4\0%\1\5\0>\0\2\0027\0\6\0>\0\1\1G\0\1\0\bset\rnightfox\frequire\fpalefox\19nightfox_style\6g\bvim\0", "config", "nightfox.nvim")
	time([[Config for nightfox.nvim]], false)
else
time("Condition for { 'nvcode-color-schemes.vim', 'nightfox.nvim' }", false)
end
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
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
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
