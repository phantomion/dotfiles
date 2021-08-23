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
  ["barbar.nvim"] = {
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/barbar.nvim"
  },
  ["diffview.nvim"] = {
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
    config = { "\27LJ\1\2¨\4\0\0\4\0\16\0\0194\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\14\0003\2\4\0003\3\3\0:\3\5\0023\3\6\0:\3\a\0023\3\b\0:\3\t\0023\3\n\0:\3\v\0023\3\f\0:\3\r\2:\2\15\1>\0\2\1G\0\1\0\nsigns\1\0\1\29current_line_blame_delay\3\n\17changedelete\1\0\4\ttext\6~\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\14topdelete\1\0\4\ttext\6-\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\vdelete\1\0\4\ttext\6-\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\vchange\1\0\4\ttext\6~\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\badd\1\0\0\1\0\4\ttext\6+\nnumhl\18GitSignsAddNr\vlinehl\18GitSignsAddLn\ahl\16GitSignsAdd\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  kommentary = {
    config = { "\27LJ\1\2^\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\25update_commentstring&ts_context_commentstring.internal\frequireë\1\1\0\4\0\n\0\0144\0\0\0007\0\1\0)\1\1\0:\1\2\0004\0\3\0%\1\4\0>\0\2\0027\0\5\0%\1\6\0003\2\a\0001\3\b\0:\3\t\2>\0\3\1G\0\1\0\18hook_function\0\1\0\2\31multi_line_comment_strings\tauto\31single_line_comment_string\tauto\bvue\23configure_language\22kommentary.config\frequire'kommentary_create_default_mappings\6g\bvim\0" },
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/kommentary"
  },
  ["lsp_extensions.nvim"] = {
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/lsp_extensions.nvim"
  },
  ["lspsaga.nvim"] = {
    config = { "\27LJ\1\2È\1\0\0\4\0\6\0\t4\0\0\0%\1\1\0>\0\2\0027\1\2\0003\2\3\0003\3\4\0:\3\5\2>\1\2\1G\0\1\0\23code_action_prompt\1\0\4\18sign_priority\3\20\17virtual_text\2\tsign\2\venable\1\1\0\4\14hint_sign\bïš\15error_sign\bï—\14warn_sign\bï±\15infor_sign\bï™\18init_lsp_saga\flspsaga\frequire\0" },
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
    config = { "\27LJ\1\2³\1\0\0\3\0\b\0\0154\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0003\2\3\0:\2\5\1>\0\2\0014\0\0\0%\1\6\0>\0\2\0027\0\2\0003\1\a\0>\0\2\1G\0\1\0\1\0\2\17map_complete\2\vmap_cr\2$nvim-autopairs.completion.compe\14fast_wrap\1\0\0\1\0\1\fend_key\6e\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\1\0027\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-compe"] = {
    config = { "\27LJ\1\2¹\2\0\0\3\0\6\0\t4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0003\2\4\0:\2\5\1>\0\2\1G\0\1\0\vsource\1\0\a\tomni\1\rnvim_lua\2\rnvim_lsp\2\vbuffer\2\nvsnip\2\tcalc\2\tpath\2\1\0\f\17autocomplete\2\19source_timeout\3È\1\fenabled\2\ndebug\1\14preselect\venable\19max_abbr_width\3è\a\21incomplete_delay\3\3\19max_menu_width\3À„=\19max_kind_width\3è\a\15min_length\3\1\18throttle_time\3P\18documentation\2\nsetup\ncompe\frequire\0" },
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/nvim-compe"
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
  ["nvim-lsputils"] = {
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/nvim-lsputils"
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
    config = { "\27LJ\1\2–\2\0\0\2\0\t\0\0254\0\0\0007\0\1\0'\1\27\0:\1\2\0004\0\0\0007\0\1\0'\1\1\0:\1\3\0004\0\0\0007\0\1\0003\1\5\0:\1\4\0004\0\0\0007\0\1\0'\1\1\0:\1\6\0004\0\0\0007\0\1\0'\1\0\0:\1\a\0004\0\0\0007\0\1\0'\1\0\0:\1\b\0G\0\1\0\27nvim_tree_hijack_netrw\28nvim_tree_disable_netrw\21nvim_tree_git_hl\1\a\0\0\t.git\17node_modules\v.cache\vtarget\a.o\bbin\21nvim_tree_ignore\29nvim_tree_indent_markers\20nvim_tree_width\6g\bvim\0" },
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
  popfix = {
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/popfix"
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
  ["vim-vsnip"] = {
    config = { "\27LJ\1\2b\0\0\3\0\6\0\t4\0\0\0007\0\1\0004\1\0\0007\1\3\0017\1\4\1%\2\5\0>\1\2\2:\1\2\0G\0\1\0\25~/.config/nvim/vsnip\vexpand\afn\22vsnip_snippet_dir\6g\bvim\0" },
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  },
  ["vim-vsnip-integ"] = {
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/vim-vsnip-integ"
  },
  vimwiki = {
    loaded = true,
    path = "/home/kwstas/.local/share/nvim/site/pack/packer/start/vimwiki"
  },
  ["zephyr-nvim"] = {
    config = { "\27LJ\1\2&\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\vzephyr\frequire\0" },
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
-- Config for: vim-vsnip
time([[Config for vim-vsnip]], true)
try_loadstring("\27LJ\1\2b\0\0\3\0\6\0\t4\0\0\0007\0\1\0004\1\0\0007\1\3\0017\1\4\1%\2\5\0>\1\2\2:\1\2\0G\0\1\0\25~/.config/nvim/vsnip\vexpand\afn\22vsnip_snippet_dir\6g\bvim\0", "config", "vim-vsnip")
time([[Config for vim-vsnip]], false)
-- Config for: nvim-ts-context-commentstring
time([[Config for nvim-ts-context-commentstring]], true)
try_loadstring("\27LJ\1\2…\1\0\0\3\0\6\0\t4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0003\2\3\0:\2\5\1>\0\2\1G\0\1\0\26context_commentstring\1\0\0\1\0\2\19enable_autocmd\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-ts-context-commentstring")
time([[Config for nvim-ts-context-commentstring]], false)
-- Config for: nvim-compe
time([[Config for nvim-compe]], true)
try_loadstring("\27LJ\1\2¹\2\0\0\3\0\6\0\t4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0003\2\4\0:\2\5\1>\0\2\1G\0\1\0\vsource\1\0\a\tomni\1\rnvim_lua\2\rnvim_lsp\2\vbuffer\2\nvsnip\2\tcalc\2\tpath\2\1\0\f\17autocomplete\2\19source_timeout\3È\1\fenabled\2\ndebug\1\14preselect\venable\19max_abbr_width\3è\a\21incomplete_delay\3\3\19max_menu_width\3À„=\19max_kind_width\3è\a\15min_length\3\1\18throttle_time\3P\18documentation\2\nsetup\ncompe\frequire\0", "config", "nvim-compe")
time([[Config for nvim-compe]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\1\2–\2\0\0\2\0\t\0\0254\0\0\0007\0\1\0'\1\27\0:\1\2\0004\0\0\0007\0\1\0'\1\1\0:\1\3\0004\0\0\0007\0\1\0003\1\5\0:\1\4\0004\0\0\0007\0\1\0'\1\1\0:\1\6\0004\0\0\0007\0\1\0'\1\0\0:\1\a\0004\0\0\0007\0\1\0'\1\0\0:\1\b\0G\0\1\0\27nvim_tree_hijack_netrw\28nvim_tree_disable_netrw\21nvim_tree_git_hl\1\a\0\0\t.git\17node_modules\v.cache\vtarget\a.o\bbin\21nvim_tree_ignore\29nvim_tree_indent_markers\20nvim_tree_width\6g\bvim\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\1\0027\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\1\2¨\4\0\0\4\0\16\0\0194\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\14\0003\2\4\0003\3\3\0:\3\5\0023\3\6\0:\3\a\0023\3\b\0:\3\t\0023\3\n\0:\3\v\0023\3\f\0:\3\r\2:\2\15\1>\0\2\1G\0\1\0\nsigns\1\0\1\29current_line_blame_delay\3\n\17changedelete\1\0\4\ttext\6~\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\14topdelete\1\0\4\ttext\6-\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\vdelete\1\0\4\ttext\6-\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\vchange\1\0\4\ttext\6~\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\badd\1\0\0\1\0\4\ttext\6+\nnumhl\18GitSignsAddNr\vlinehl\18GitSignsAddLn\ahl\16GitSignsAdd\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: lspsaga.nvim
time([[Config for lspsaga.nvim]], true)
try_loadstring("\27LJ\1\2È\1\0\0\4\0\6\0\t4\0\0\0%\1\1\0>\0\2\0027\1\2\0003\2\3\0003\3\4\0:\3\5\2>\1\2\1G\0\1\0\23code_action_prompt\1\0\4\18sign_priority\3\20\17virtual_text\2\tsign\2\venable\1\1\0\4\14hint_sign\bïš\15error_sign\bï—\14warn_sign\bï±\15infor_sign\bï™\18init_lsp_saga\flspsaga\frequire\0", "config", "lspsaga.nvim")
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
try_loadstring("\27LJ\1\2³\1\0\0\3\0\b\0\0154\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0003\2\3\0:\2\5\1>\0\2\0014\0\0\0%\1\6\0>\0\2\0027\0\2\0003\1\a\0>\0\2\1G\0\1\0\1\0\2\17map_complete\2\vmap_cr\2$nvim-autopairs.completion.compe\14fast_wrap\1\0\0\1\0\1\fend_key\6e\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: kommentary
time([[Config for kommentary]], true)
try_loadstring("\27LJ\1\2^\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\25update_commentstring&ts_context_commentstring.internal\frequireë\1\1\0\4\0\n\0\0144\0\0\0007\0\1\0)\1\1\0:\1\2\0004\0\3\0%\1\4\0>\0\2\0027\0\5\0%\1\6\0003\2\a\0001\3\b\0:\3\t\2>\0\3\1G\0\1\0\18hook_function\0\1\0\2\31multi_line_comment_strings\tauto\31single_line_comment_string\tauto\bvue\23configure_language\22kommentary.config\frequire'kommentary_create_default_mappings\6g\bvim\0", "config", "kommentary")
time([[Config for kommentary]], false)
-- Conditional loads
time("Condition for { 'zephyr-nvim', 'nvim-lspconfig', 'galaxyline.nvim' }", true)
if
try_loadstring("\27LJ\1\2\15\0\0\1\0\0\0\2)\0\2\0H\0\2\0\0", "condition", '{ "zephyr-nvim", "nvim-lspconfig", "galaxyline.nvim" }')
then
time("Condition for { 'zephyr-nvim', 'nvim-lspconfig', 'galaxyline.nvim' }", false)
time([[packadd for zephyr-nvim]], true)
		vim.cmd [[packadd zephyr-nvim]]
	time([[packadd for zephyr-nvim]], false)
	-- Config for: zephyr-nvim
	time([[Config for zephyr-nvim]], true)
	try_loadstring("\27LJ\1\2&\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\vzephyr\frequire\0", "config", "zephyr-nvim")
	time([[Config for zephyr-nvim]], false)
	time([[packadd for nvim-lspconfig]], true)
		vim.cmd [[packadd nvim-lspconfig]]
	time([[packadd for nvim-lspconfig]], false)
	-- Config for: nvim-lspconfig
	time([[Config for nvim-lspconfig]], true)
	try_loadstring("\27LJ\1\2$\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\tlsps\frequire\0", "config", "nvim-lspconfig")
	time([[Config for nvim-lspconfig]], false)
	time([[packadd for galaxyline.nvim]], true)
		vim.cmd [[packadd galaxyline.nvim]]
	time([[packadd for galaxyline.nvim]], false)
	-- Config for: galaxyline.nvim
	time([[Config for galaxyline.nvim]], true)
	try_loadstring("\27LJ\1\2,\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\17mygalaxyline\frequire\0", "config", "galaxyline.nvim")
	time([[Config for galaxyline.nvim]], false)
else
time("Condition for { 'zephyr-nvim', 'nvim-lspconfig', 'galaxyline.nvim' }", false)
end
time("Condition for { 'nvcode-color-schemes.vim', 'nightfox.nvim' }", true)
if
try_loadstring("\27LJ\1\2\15\0\0\1\0\0\0\2)\0\1\0H\0\2\0\0", "condition", '{ "nvcode-color-schemes.vim", "nightfox.nvim" }')
then
time("Condition for { 'nvcode-color-schemes.vim', 'nightfox.nvim' }", false)
time([[packadd for nvcode-color-schemes.vim]], true)
		vim.cmd [[packadd nvcode-color-schemes.vim]]
	time([[packadd for nvcode-color-schemes.vim]], false)
	time([[packadd for nightfox.nvim]], true)
		vim.cmd [[packadd nightfox.nvim]]
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
