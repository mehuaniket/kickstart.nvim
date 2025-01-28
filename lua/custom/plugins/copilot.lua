return {
  -- Add other plugins here

  -- Add copilot.vim
  {
    'github/copilot.vim',
    event = 'InsertEnter',
    config = function()
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_filetypes = {
        ['*'] = true,
      }
      vim.api.nvim_set_keymap('i', '<C-C>', 'copilot#Accept("<CR>")', { silent = true, expr = true })
    end,
  },
}
