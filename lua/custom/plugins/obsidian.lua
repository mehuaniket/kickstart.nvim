return {
  'epwalsh/obsidian.nvim',
  version = '*', -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = 'markdown',
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  event = {
    -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    -- refer to `:h file-pattern` for more examples
    'BufReadPre ~/vaults/*.md',
  },
  dependencies = {
    -- Required.
    'nvim-lua/plenary.nvim',

    -- see below for full list of optional dependencies 👇
  },
  opts = {
    workspaces = {
      {
        name = 'personal',
        path = '~/vaults/personal',
      },
      { name = 'work', path = '~/vaults/work', overrides = { notes_subdir = 'notes' } },
    },

    -- key mappings for Obsidian commands
    vim.keymap.set('n', '<leader>oo', ':ObsidianOpen<CR>', { desc = 'Open Obsidian' }),
    vim.keymap.set('n', '<leader>ol', ':ObsidianFollowLink<CR>', { desc = 'Follow link' }),
    vim.keymap.set('n', '<leader>on', ':ObsidianNewNote<CR>', { desc = 'Create new note' }),
    vim.keymap.set('n', '<leader>od', ':ObsidianToday<CR>', { desc = "Open today's daily note" }),
    vim.keymap.set('n', '<leader>ob', ':ObsidianBacklinks<CR>', { desc = 'Open backlinks' }),
  },
}
