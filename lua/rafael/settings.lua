-- [[ Setting options ]]
-- See `:help vim.o`

-- Set <space> as the leader key
-- See `:help mapleader`
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.nu = true -- line numbers
vim.opt.rnu = true -- relative line numbers

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true -- tabs to spaces

vim.opt.smartindent = true

-- force all horizontal splits to go below current window
vim.opt.splitbelow = true

-- force all vertical splits to go to the right of current window
vim.opt.splitright = true

vim.opt.showtabline = 0 -- always show tabs
vim.opt.cmdheight = 1 -- more space for displaying messages

vim.opt.wrap = false

-- Better search feedback
vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.colorcolumn = '100'

-- Scroll offset
vim.opt.scrolloff = 8

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
-- vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- if a file is being edited by another program
-- (or was written to file while editing with another program), it is not allowed to be edited
vim.opt.writebackup = false
vim.opt.backup = false -- do not creates a backup file

-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Save file
vim.keymap.set({ 'n', 'i', 'v' }, '<C-s>', function()
  vim.cmd.stopinsert()
  vim.cmd.write()
end)

-- Move lines
vim.keymap.set('v', '<A-Up>', ":m '<-2<CR>gv=gv")
vim.keymap.set('v', '<A-Down>', ":m '>+1<CR>gv=gv")

-- Backspace to alternate last buffer
vim.keymap.set('n', '<BS>', '<C-6>')

-- Home key to first non-blank character
vim.keymap.set({ 'n', 'v' }, '<Home>', '^')
vim.keymap.set('i', '<Home>', '<C-o>^')

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
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
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- [[ Autoformat ]]
-- vim.api.nvim_create_autocmd('BufWritePost', {
--   pattern = { '*.ts', '*.js' },
--   command = 'silent! EslintFixAll',
--   group = vim.api.nvim_create_augroup('AutoformatESLint', {}),
-- })
-- vim.api.nvim_create_autocmd('BufWritePost', {
--   pattern = { '*.lua' },
--   command = 'silent! !stylua %',
--   group = vim.api.nvim_create_augroup('AutoformatLua', {}),
-- })
-- vim.api.nvim_create_autocmd('BufWritePost', {
--   pattern = { '*.php' },
--   command = 'silent! !php-cs-fixer fix %',
--   group = vim.api.nvim_create_augroup('AutoformatPhp', {}),
-- })
