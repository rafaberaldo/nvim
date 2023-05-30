-- Must set leader key before loading plugins
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('lazy').setup('rafael.plugins')
require('rafael.settings')
require('rafael.keymaps')
