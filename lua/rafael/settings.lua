-- [[ Setting options ]]
-- See `:help vim.o`

-- Set <space> as the leader key
-- See `:help mapleader`
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Relative line numbers
vim.opt.nu = true
vim.opt.rnu = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

-- Better search feedback
vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.colorcolumn = '100'

-- Scroll offset
vim.opt.scrolloff = 8

-- Set highlight on search
vim.o.hlsearch = false

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

-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
-- vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
-- vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

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

-- [[ Autoformat ]]
vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = { '*.ts', '*.js' },
  command = 'silent! EslintFixAll',
  group = vim.api.nvim_create_augroup('AutoformatESLint', {}),
})
vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = { '*.lua' },
  command = 'silent! !stylua %',
  group = vim.api.nvim_create_augroup('AutoformatLua', {}),
})
vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = { '*.php' },
  command = 'silent! !php-cs-fixer fix %',
  group = vim.api.nvim_create_augroup('AutoformatPhp', {}),
})
