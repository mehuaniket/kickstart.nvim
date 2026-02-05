-- User commands (migrated from init.lua)

--- [[ formatter commands ]]
-- Disable formatting for a particular buffer or globally
vim.api.nvim_create_user_command('FormatDisable', function(args)
  if args.bang then
    -- FormatDisable! disables formatting for this buffer only
    vim.b.disable_autoformat = true
  else
    -- FormatDisable disables formatting globally
    vim.g.disable_autoformat = true
  end
end, {
  desc = 'Disable autoformat-on-save',
  bang = true,
})

-- Re-enable formatting for the current buffer or globally
vim.api.nvim_create_user_command('FormatEnable', function()
  vim.b.disable_autoformat = false
  vim.g.disable_autoformat = false
end, {
  desc = 'Re-enable autoformat-on-save',
})

