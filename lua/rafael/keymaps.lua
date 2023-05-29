-- [[ Basic Keymaps ]]

-- Modes cheatsheet:
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Save file
vim.keymap.set({ 'n', 'i', 'v', 'x' }, '<C-s>', function()
  vim.cmd.stopinsert()
  vim.cmd.write()
end)

-- Delete only (no cut)
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>d', '"_d')

-- Paste without overwriting clipboard
vim.keymap.set({ 'v', 'x' }, 'p', '"_dP')

-- New line below without leaving normal mode
vim.keymap.set('n', '<leader>o', 'o<Esc>')

-- Move lines
vim.keymap.set('v', '<A-Up>', ":m '<-2<CR>gv=gv")
vim.keymap.set('v', '<A-Down>', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv")

-- Backspace to alternate last buffer
vim.keymap.set('n', '<BS>', '<C-6>')

-- Home key to first non-blank character
vim.keymap.set({ 'n', 'v', 'x' }, '<Home>', '^')
vim.keymap.set('i', '<Home>', '<C-o>^')

-- Better page up/down
vim.keymap.set('n', '<PageUp>', '<C-u>zz')
vim.keymap.set('n', '<PageDown>', '<C-d>zz')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>t', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Buffers keymaps
vim.keymap.set('n', '<leader>q', vim.cmd.bd, { desc = 'Delete buffer' })
vim.keymap.set('n', '<leader>bn', vim.cmd.bnext, { desc = 'Next buffer' })
vim.keymap.set('n', '<leader>bN', vim.cmd.bprev, { desc = 'Previous buffer' })

-- Find selected
-- vim.keymap.set('v', '<leader>s', 'y/<C-r><C-w>')

-- Resize splits
vim.keymap.set('n', '<A-kMinus>', ':resize -2<CR>')
vim.keymap.set('n', '<A-kPlus>', ':resize +2<CR>')
vim.keymap.set('n', '<C-kMinus>', ':vertical resize -2<CR>')
vim.keymap.set('n', '<C-kPlus>', ':vertical resize +2<CR>')

-- Leave terminal
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
