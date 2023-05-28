return {
  {
    -- Git diff view similar to VSCode
    'sindrets/diffview.nvim',
    dependencies = 'nvim-web-devicons',
    config = function()
      vim.keymap.set('n', '<leader>gg', vim.cmd.DiffviewOpen)
      vim.keymap.set('n', '<leader>gq', vim.cmd.DiffviewClose)
    end,
  },
}
