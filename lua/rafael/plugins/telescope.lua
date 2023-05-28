return {
  {
    -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require('telescope.builtin')

      vim.keymap.set('n', '<C-p>', builtin.find_files, {})
      vim.keymap.set('n', '<C-f>', builtin.live_grep, {})
      vim.keymap.set('n', '<leader><BS>', builtin.buffers, {})
      vim.keymap.set('n', '<leader>gb', builtin.git_branches, {})
    end,
  },
}
