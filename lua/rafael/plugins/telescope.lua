return {
  -- Fuzzy Finder (files, lsp, etc)
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local builtin = require('telescope.builtin')

    vim.keymap.set('n', '<C-p>', function()
      vim.fn.system('git rev-parse --is-inside-work-tree')
      if vim.v.shell_error == 0 then
        builtin.git_files()
      else
        builtin.find_files()
      end
    end)
    vim.keymap.set('n', '<C-f>', builtin.live_grep)
    vim.keymap.set('n', '<leader><BS>', builtin.buffers)
    vim.keymap.set('n', '<leader>gb', builtin.git_branches)
  end,
}
