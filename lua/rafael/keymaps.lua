-- [[ Basic Keymaps ]]

-- Modes cheatsheet:
--   normal       = "n",
--   insert       = "i",
--   visual_      = "v",
--   visual block = "x",
--   terminal     = "t",
--   command      = "c",

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Save file
vim.keymap.set({ 'n', 'i', 'v', 'x' }, '<C-s>', function()
  vim.cmd.stopinsert()
  vim.cmd.write()
end)

-- Delete only (no cut)
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>d', '"_d', { desc = 'Delete without overwriting clipboard' })

-- Paste without overwriting clipboard
vim.keymap.set({ 'v', 'x' }, 'p', '"_dP')

-- Copy to system clipboard
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>y', '"+y', { desc = 'Copy to system clipboard' })

-- New line below without leaving normal mode
vim.keymap.set('n', 'O', 'o<Esc>')

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
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Next diagnostic message' })
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open diagnostic message' })

-- Buffers keymaps
vim.keymap.set('n', '<leader>q', vim.cmd.bd, { desc = 'Delete buffer' })
vim.keymap.set('n', ']b', vim.cmd.bnext, { desc = 'Next buffer' })
vim.keymap.set('n', '[b', vim.cmd.bprev, { desc = 'Previous buffer' })

-- Replace text on cursor
vim.keymap.set('n', '<leader>r', [[:%s/\<<C-r><C-w>\>//g<Left><Left>]], { desc = 'Replace text on cursor' })

-- Clear highlight
vim.keymap.set('n', '<leader>c', ':let @/ = ""<CR>', { desc = 'Clear highlight' })

-- Resize splits
vim.keymap.set('n', '<A-kMinus>', ':resize -2<CR>')
vim.keymap.set('n', '<A-kPlus>', ':resize +2<CR>')
vim.keymap.set('n', '<C-kMinus>', ':vertical resize -2<CR>')
vim.keymap.set('n', '<C-kPlus>', ':vertical resize +2<CR>')

-- Leave terminal
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
