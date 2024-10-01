return {
  'rmagatti/auto-session',
  lazy = false,
  enabled = true,

  keys = {
    -- Will use Telescope if installed or a vim.ui.select picker otherwise
    { '<leader>wl', '<cmd>SessionSearch<CR>', desc = 'Session search' },
    { '<leader>wx', '<cmd>SessionSave<CR>', desc = 'Save session' },
    { '<leader>wa', '<cmd>SessionToggleAutoSave<CR>', desc = 'Toggle autosave' },
  },
  ---enables autocomplete for opts
  ---@module "auto-session"
  ---@type AutoSession.Config
  opts = {
    suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
    -- log_level = 'debug',
  },
}
