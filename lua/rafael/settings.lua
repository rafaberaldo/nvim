-- [[ Setting options ]]

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.nu = true -- line numbers
vim.opt.rnu = true -- relative line numbers
vim.opt.cursorline = true -- highlight current line

vim.opt.tabstop = 4 -- number of spaces of the tab character
vim.opt.softtabstop = 4 -- number of spaces a <Tab> jumps while editing
vim.opt.shiftwidth = 4 -- size of an indent
vim.opt.expandtab = true -- tabs to spaces
vim.opt.autoindent = true -- autoindent new lines
vim.opt.smartindent = true -- smart auto indenting
vim.opt.breakindent = true -- indent wrapped lines

vim.opt.splitbelow = true -- force all horizontal splits to go below current window
vim.opt.splitright = true -- force all vertical splits to go to the right of current window
vim.opt.showtabline = 0 -- always show tabs
vim.opt.cmdheight = 1 -- more space for displaying messages
vim.opt.wrap = false -- word wrap
vim.opt.colorcolumn = '100' -- line length marker
vim.opt.termguicolors = true -- enable 24-bit RGB colors
vim.opt.scrolloff = 8 -- scroll offset
vim.opt.mouse = 'a' -- enable mouse mode
vim.opt.undofile = true -- persistent undo

vim.opt.ignorecase = true -- ignore case letters when searching
vim.opt.smartcase = true -- ignore case only if search pattern is all lowercase
vim.opt.hlsearch = true -- highlight search results
vim.opt.incsearch = true -- better search feedback

vim.opt.updatetime = 250 -- update interval (default 4000)
vim.opt.timeout = true
vim.opt.timeoutlen = 300 -- time to wait for a mapped sequence to complete (default 1000)
vim.opt.writebackup = false -- do not creates a backup file
vim.opt.backup = false -- do not creates a backup file

vim.wo.signcolumn = 'yes' -- always show sign column

vim.opt.completeopt = 'menuone,noselect' -- completion options
