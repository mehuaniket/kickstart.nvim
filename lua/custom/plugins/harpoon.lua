-- Define the plugin setup for harpoon
return {
  'ThePrimeagen/harpoon',
  config = function()
    -- Import the harpoon modules
    local mark = require 'harpoon.mark'
    local ui = require 'harpoon.ui'

    -- Map keys for Harpoon functionality
    vim.api.nvim_set_keymap('n', '<leader>x', ":lua require('harpoon.mark').add_file()<CR>", { desc = 'Mark Harpoon file', noremap = true, silent = true })
    vim.api.nvim_set_keymap(
      'n',
      '<leader>l',
      ":lua require('harpoon.ui').toggle_quick_menu()<CR>",
      { desc = 'Harpoon Window List', noremap = true, silent = true }
    )

    -- -- Optional: map to jump to Harpoon files (1, 2, 3, 4, etc.)
    -- vim.api.nvim_set_keymap('n', '<leader>1', ":lua require('harpoon.ui').nav_file(1)<CR>", { desc = 'Tab 1', noremap = true, silent = true })
    -- vim.api.nvim_set_keymap('n', '<leader>2', ":lua require('harpoon.ui').nav_file(2)<CR>", { desc = 'Tab 2', noremap = true, silent = true })
    -- vim.api.nvim_set_keymap('n', '<leader>3', ":lua require('harpoon.ui').nav_file(3)<CR>", { desc = 'Tab 3', noremap = true, silent = true })
    -- vim.api.nvim_set_keymap('n', '<leader>4', ":lua require('harpoon.ui').nav_file(4)<CR>", { desc = 'Tab 4', noremap = true, silent = true })
  end,
}
