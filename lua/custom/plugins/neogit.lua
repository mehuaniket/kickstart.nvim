return {
  -- Neogit plugin from neogitorg
  {
    'neogitorg/neogit',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      local neogit = require 'neogit'

      neogit.setup {
        -- Add specific Neogit configuration options here
        integrations = {
          diffview = true, -- Enable integration with diffview.nvim if you use it
        },
      }

      -- Key mappings for common Neogit actions
      vim.keymap.set('n', '<leader>g', function()
        neogit.open()
      end, { noremap = true, silent = true, desc = 'Open Neogit' })

      vim.keymap.set('n', '<leader>gs', function()
        neogit.open { 'status' }
      end, { noremap = true, silent = true, desc = 'Open Neogit Status' })

      vim.keymap.set('n', '<leader>gc', function()
        neogit.open { 'commit' }
      end, { noremap = true, silent = true, desc = 'Commit Changes in Neogit' })

      vim.keymap.set('n', '<leader>gp', function()
        neogit.open { 'push' }
      end, { noremap = true, silent = true, desc = 'Push Changes with Neogit' })

      vim.keymap.set('n', '<leader>gl', function()
        neogit.open { 'log' }
      end, { noremap = true, silent = true, desc = 'View Git Log in Neogit' })

      vim.keymap.set('n', '<leader>gf', function()
        neogit.open { 'fetch' }
      end, { noremap = true, silent = true, desc = 'Fetch Changes with Neogit' })

      vim.keymap.set('n', '<leader>gr', function()
        neogit.open { 'rebase' }
      end, { noremap = true, silent = true, desc = 'Rebase with Neogit' })

      vim.keymap.set('n', '<leader>gd', function()
        neogit.open { 'diff' }
      end, { noremap = true, silent = true, desc = 'View Diff in Neogit' })
    end,
  },

  -- Optional: Diffview plugin for enhanced diffs with Neogit
  {
    'sindrets/diffview.nvim',
    requires = 'nvim-lua/plenary.nvim',
  },
}
