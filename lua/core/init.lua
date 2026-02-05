-- Core entrypoint (globals, filetypes, options, keymaps, autocmds)

-- Leader must be set before plugins load.
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Prefer /usr/local/bin in PATH (matches prior init.lua behavior)
vim.env.PATH = vim.env.PATH .. ':/usr/local/bin'

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- disabling netrw (Snacks explorer)
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

-- Faster startup on newer Neovim versions (bytecode cache / loader)
pcall(function()
  vim.loader.enable()
end)

-- Filetype detection tweaks (ported from try/nvim)
vim.filetype.add {
  extension = {
    env = 'dotenv',
  },
  filename = {
    ['.env'] = 'dotenv',
    ['env'] = 'dotenv',
  },
  pattern = {
    ['[jt]sconfig.*.json'] = 'jsonc',
    ['%.env%.[%w_.-]+'] = 'dotenv',
  },
}

require('core.options')
require('core.keymaps')
require('core.autocmds')
require('core.commands')

