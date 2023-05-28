-- Install lazy.nvim (package manager)
-- https://github.com/folke/lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Settings (must include leader key, or plugins will map wrong key)
require('rafael.settings')

-- Install plugins
require('lazy').setup('rafael.plugins')

-- Load keymaps
require('rafael.keymaps')
