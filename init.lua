-- Neovim config (refactored into lua/core and lua/plugins)

-- Core (leader/options/keymaps/autocmds/commands) must load before plugins.
require('core')

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- Bootstrap tree-sitter-cli if cargo is available (needed for treesitter to compile parsers)
if vim.fn.executable 'tree-sitter' == 0 and vim.fn.executable 'cargo' == 1 then
  vim.notify('Installing tree-sitter-cli via cargo...', vim.log.levels.INFO)
  vim.fn.jobstart({ 'cargo', 'install', '--locked', 'tree-sitter-cli' }, {
    on_exit = function(_, code)
      if code == 0 then
        vim.notify('tree-sitter-cli installed successfully!', vim.log.levels.INFO)
      else
        vim.notify('Failed to install tree-sitter-cli', vim.log.levels.WARN)
      end
    end,
  })
end

-- [[ Configure and install plugins ]]
-- All plugin specs now live under `lua/plugins/*.lua`.
require('lazy').setup({
  { import = 'plugins' },
}, {
  install = {
    missing = true, -- Auto-install missing plugins on startup
    colorscheme = { 'habamax' },
  },
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    enabled = true,
    notify = false,
  },
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
  performance = {
    rtp = {
      disabled_plugins = {
        'gzip',
        'tarPlugin',
        'tohtml',
        'tutor',
        'zipPlugin',
      },
    },
  },
})

-- vim: ts=2 sts=2 sw=2 et

