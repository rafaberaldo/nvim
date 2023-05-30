return {
  -- Adds git releated signs to the gutter, as well as utilities for managing changes
  'lewis6991/gitsigns.nvim',
  opts = {
    signs = {
      add = { text = '|' },
      change = { text = '|' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
      untracked = { text = '┆' },
    },
    on_attach = function(bufnr)
      local gs = require('gitsigns')
      vim.keymap.set('n', '[h', gs.prev_hunk, { buffer = bufnr, desc = 'Previous hunk' })
      vim.keymap.set('n', ']h', gs.next_hunk, { buffer = bufnr, desc = 'Next hunk' })
      vim.keymap.set('n', '<leader>ph', gs.preview_hunk, { buffer = bufnr, desc = 'Preview hunk' })
    end,
  },
}
