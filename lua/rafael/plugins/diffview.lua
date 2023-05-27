return {
  {
    'sindrets/diffview.nvim',
    requires = 'nvim-web-devicons',
    config = function()
      vim.keymap.set('n', '<leader>gg', vim.cmd.DiffviewOpen)
      vim.keymap.set('n', '<leader>gq', vim.cmd.DiffviewClose)
    end,
  },
}
