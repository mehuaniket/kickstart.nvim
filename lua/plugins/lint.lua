-- Linting (migrated from lua/kickstart/plugins/lint.lua)
return {
  { -- Linting
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local lint = require 'lint'
      lint.linters_by_ft = {
        go = { 'golangcilint' }, -- Go linter using golangci-lint
        python = { 'pylint' }, -- Python linter using flake8
        terraform = { 'tflint' }, -- Terraform linter using tflint
        markdown = { 'markdownlint' }, -- Markdown linter
      }

      -- Performance/ergonomics improvements (ported from try/nvim)
      local function is_file_too_large(bufnr)
        local max_size = 1024 * 1024 -- 1MB
        local uv = vim.uv or vim.loop
        local ok, stats = pcall(uv.fs_stat, vim.api.nvim_buf_get_name(bufnr))
        return ok and stats and stats.size and stats.size > max_size
      end

      local function should_lint(bufnr)
        bufnr = bufnr or 0

        if vim.b[bufnr].lint_enabled == false then
          return false
        end

        local buftype = vim.bo[bufnr].buftype
        if buftype ~= '' and buftype ~= 'acwrite' then
          return false
        end

        if is_file_too_large(bufnr) then
          return false
        end

        local ft = vim.bo[bufnr].filetype
        local linters = lint.linters_by_ft[ft]
        return linters and #linters > 0
      end

      local debounce_timer = nil
      local function debounce_lint(ms, bufnr)
        if debounce_timer then
          vim.fn.timer_stop(debounce_timer)
        end
        debounce_timer = vim.fn.timer_start(ms or 250, function()
          vim.schedule(function()
            if should_lint(bufnr) and vim.bo[bufnr].filetype ~= 'TelescopePrompt' then
              lint.try_lint()
            end
          end)
        end)
      end

      -- Create autocommand which carries out the actual linting
      -- on the specified events.
      local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
      vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
        group = lint_augroup,
        callback = function(args)
          if not should_lint(args.buf) then
            return
          end

          if args.event == 'BufWritePost' then
            lint.try_lint()
          else
            debounce_lint(100, args.buf)
          end
        end,
      })

      vim.api.nvim_create_autocmd({ 'TextChanged' }, {
        group = lint_augroup,
        callback = function(args)
          if should_lint(args.buf) and vim.bo[args.buf].filetype ~= 'TelescopePrompt' then
            debounce_lint(1000, args.buf)
          end
        end,
      })

      local diagnostics_active = true

      local function toggle_diagnostics()
        if diagnostics_active then
          vim.diagnostic.disable()
          print 'Diagnostics disabled'
        else
          vim.diagnostic.enable()
          print 'Diagnostics enabled'
        end
        diagnostics_active = not diagnostics_active
      end

      vim.keymap.set('n', '<leader>cd', toggle_diagnostics, { desc = 'Toggle Diagnostic' })

      vim.api.nvim_create_user_command('LintToggle', function()
        local bufnr = vim.api.nvim_get_current_buf()
        vim.b[bufnr].lint_enabled = not (vim.b[bufnr].lint_enabled ~= false)
        vim.notify(string.format('Linting %s', vim.b[bufnr].lint_enabled and 'enabled' or 'disabled'), vim.log.levels.INFO)
      end, { desc = 'Toggle linting for current buffer' })
    end,
  },
}

