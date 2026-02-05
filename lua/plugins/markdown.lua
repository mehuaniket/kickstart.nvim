return {
  'iamcco/markdown-preview.nvim',
  cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
  build = 'cd app && npm install',
  init = function()
    vim.g.mkdp_filetypes = { 'markdown' }
    vim.g.mkdp_auto_close = 1
    vim.g.mkdp_theme = 'dark'
    -- Enable mermaid diagrams, math (katex), and other features
    vim.g.mkdp_preview_options = {
      mermaid = { theme = 'dark' },
      katex = {},
      disable_sync_scroll = 0,
      sync_scroll_type = 'middle',
      hide_yaml_meta = 1,
      sequence_diagrams = {},
      flowchart_diagrams = {},
    }
  end,
  ft = { 'markdown' },
  keys = {
    { '<leader>mp', '<cmd>MarkdownPreviewToggle<cr>', desc = 'Markdown Preview', ft = 'markdown' },
  },
}

