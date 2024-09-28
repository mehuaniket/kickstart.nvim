return {
  'folke/zen-mode.nvim',
  opts = {
    window = {
      width = 120, -- width of the Zen window
      options = {},
    },
    plugins = {
      gitsigns = { enabled = true }, -- enables git signs in zen mode
      tmux = { enabled = true }, -- keeps tmux status bar
      -- Additional plugins you want to keep enabled in Zen mode
    },
    on_open = function()
      vim.cmd [[
			Neotree close
                        set norelativenumber
			Gitsigns toggle_current_line_blame
			autocmd InsertEnter * set norelativenumber nonumber
			autocmd InsertLeave * set norelativenumber nonumber
			]]
    end,
    on_close = function()
      vim.cmd [[
			Neotree reveal
                        set relativenumber
			Gitsigns toggle_current_line_blame
			autocmd InsertEnter * set norelativenumber number
			autocmd InsertLeave * set relativenumber
			]]
    end,
  },
  keys = {
    {
      '<leader>z',
      '<cmd>ZenMode<CR>',
      desc = 'Toggle Zen Mode',
    },
  },
}
