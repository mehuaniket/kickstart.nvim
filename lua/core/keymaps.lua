-- Core keymaps (migrated from init.lua)

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- ════════════════════════════════════════════════════════════════════════════
-- Essential Operations
-- ════════════════════════════════════════════════════════════════════════════

-- Save
vim.keymap.set('n', '<C-s>', '<cmd>w<cr>', { desc = 'Save File' })
vim.keymap.set({ 'i', 'x' }, '<C-s>', '<Esc><cmd>w<cr>', { desc = 'Save File' })

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Quick escape from insert mode
vim.keymap.set('i', 'jj', '<Esc>', { desc = 'Exit Insert' })
vim.keymap.set('i', 'jk', '<Esc>', { desc = 'Exit Insert' })

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- ════════════════════════════════════════════════════════════════════════════
-- Window Navigation
-- ════════════════════════════════════════════════════════════════════════════

-- Keybinds to make split navigation easier.
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- ════════════════════════════════════════════════════════════════════════════
-- Better Navigation
-- ════════════════════════════════════════════════════════════════════════════

-- Start/End of line (easier than ^ and $)
vim.keymap.set({ 'n', 'x', 'o' }, 'H', '^', { desc = 'Start of Line' })
vim.keymap.set({ 'n', 'x', 'o' }, 'L', 'g_', { desc = 'End of Line' })

-- Keep search results centered
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Next Match (centered)' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Prev Match (centered)' })
vim.keymap.set('n', '*', '*zzzv', { desc = 'Search Word (centered)' })
vim.keymap.set('n', '#', '#zzzv', { desc = 'Search Word Back (centered)' })

-- Buffer navigation
vim.keymap.set('n', '[b', '<cmd>bprevious<cr>', { desc = 'Prev Buffer' })
vim.keymap.set('n', ']b', '<cmd>bnext<cr>', { desc = 'Next Buffer' })

-- ════════════════════════════════════════════════════════════════════════════
-- Better Editing
-- ════════════════════════════════════════════════════════════════════════════

-- Visual line movement (move lines up/down)
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move Lines Down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move Lines Up' })

-- Better indenting (stay in visual mode)
vim.keymap.set('v', '<', '<gv', { desc = 'Indent Left' })
vim.keymap.set('v', '>', '>gv', { desc = 'Indent Right' })

-- Paste over selection without yanking
vim.keymap.set('v', 'p', '"_dP', { desc = 'Paste (no yank)' })

-- ════════════════════════════════════════════════════════════════════════════
-- Terminal Mode
-- ════════════════════════════════════════════════════════════════════════════

-- Exit terminal mode in the builtin terminal
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Terminal window navigation
vim.keymap.set('t', '<C-h>', '<cmd>wincmd h<cr>', { desc = 'Go Left' })
vim.keymap.set('t', '<C-j>', '<cmd>wincmd j<cr>', { desc = 'Go Down' })
vim.keymap.set('t', '<C-k>', '<cmd>wincmd k<cr>', { desc = 'Go Up' })
vim.keymap.set('t', '<C-l>', '<cmd>wincmd l<cr>', { desc = 'Go Right' })

-- ════════════════════════════════════════════════════════════════════════════
-- Training Wheels (Disable arrow keys)
-- ════════════════════════════════════════════════════════════════════════════

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!"<CR>')

