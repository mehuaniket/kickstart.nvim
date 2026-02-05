-- Editor: navigation + small utilities (ported from try/nvim)
return {
  -- Flash (quick navigation)
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    ---@type Flash.Config
    opts = {},
    keys = {
      { 's', mode = { 'n', 'x', 'o' }, function() require('flash').jump() end, desc = 'Flash' },
      { 'S', mode = { 'n', 'x', 'o' }, function() require('flash').treesitter() end, desc = 'Flash Treesitter' },
      { 'r', mode = 'o', function() require('flash').remote() end, desc = 'Remote Flash' },
      { 'R', mode = { 'o', 'x' }, function() require('flash').treesitter_search() end, desc = 'Treesitter Search' },
      { '<c-s>', mode = { 'c' }, function() require('flash').toggle() end, desc = 'Toggle Flash Search' },
    },
  },

  -- Mini Icons (required for proper icons in snacks and which-key)
  {
    'echasnovski/mini.icons',
    lazy = true,
    init = function()
      package.preload['nvim-web-devicons'] = function()
        require('mini.icons').mock_nvim_web_devicons()
        return package.loaded['nvim-web-devicons']
      end
    end,
    opts = {},
  },

  -- Persistence (session management)
  {
    'folke/persistence.nvim',
    event = 'BufReadPre',
    opts = {
      need = 0, -- always save
      branch = true, -- single session per directory (not per git branch)
    },
    config = function(_, opts)
      require('persistence').setup(opts)

      -- Close special buffers before saving (prevents blank windows on restore)
      vim.api.nvim_create_autocmd('User', {
        pattern = 'PersistenceSavePre',
        callback = function()
          -- Close all windows showing special buffers first
          for _, win in ipairs(vim.api.nvim_list_wins()) do
            local buf = vim.api.nvim_win_get_buf(win)
            if vim.api.nvim_buf_is_valid(buf) then
              local buftype = vim.bo[buf].buftype
              local filetype = vim.bo[buf].filetype
              local bufname = vim.api.nvim_buf_get_name(buf)
              -- Close window if buffer is special (non-file buffer)
              if buftype ~= '' or filetype:match('^snacks_') or bufname == '' then
                pcall(vim.api.nvim_win_close, win, true)
              end
            end
          end
          
          -- Then delete the special buffers
          for _, buf in ipairs(vim.api.nvim_list_bufs()) do
            if vim.api.nvim_buf_is_valid(buf) then
              local buftype = vim.bo[buf].buftype
              local filetype = vim.bo[buf].filetype
              -- Delete non-file buffers
              if buftype ~= '' or filetype:match('^snacks_') then
                pcall(vim.api.nvim_buf_delete, buf, { force = true })
              end
            end
          end
        end,
      })
    end,
    keys = {
      { '<leader>wl', function() require('persistence').load() end, desc = 'Restore session' },
      { '<leader>wL', function() require('persistence').load { last = true } end, desc = 'Restore last session' },
      { '<leader>ws', function() require('persistence').select() end, desc = 'Select session' },
      { '<leader>wd', function() require('persistence').stop() end, desc = 'Stop saving session' },
    },
  },
}
