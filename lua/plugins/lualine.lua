return {
  {
    'nvim-lualine/lualine.nvim',
    opts = function()
      require('lualine').setup {
        options = {
          theme = 'catppuccin', -- Use the Catppuccin theme for lualine
          component_separators = '',
          section_separators = { left = '', right = '' },
          disabled_filetypes = { 'neo-tree', statusline = {}, winbar = {} },
        },
        sections = {
          lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
          lualine_b = { 'filename', 'branch', 'diff' },
          lualine_c = {
            '%=', --[[ add your center components here if needed ]]
          },
          lualine_x = { 'diagnostics', 'encoding' },
          lualine_y = { 'filetype', 'progress' },
          lualine_z = {
            { 'location', separator = { right = '' }, left_padding = 2 },
          },
        },
        inactive_sections = {
          lualine_a = { 'filename' },
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = { 'location' },
        },
        tabline = {},
        extensions = {},
      }
    end,
  },
}

