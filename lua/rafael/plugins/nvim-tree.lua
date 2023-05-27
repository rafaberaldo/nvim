return {
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      -- disable netrw
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      vim.keymap.set('n', '<leader>f', vim.cmd.NvimTreeFocus)

      require('nvim-tree').setup({
        renderer = {
          icons = {
            glyphs = {
              git = {
                unstaged = '',
                staged = 'S',
                unmerged = '',
                renamed = '➜',
                untracked = 'U',
                deleted = '',
                ignored = '◌',
              },
            },
          },
        },
        diagnostics = {
          enable = true,
          show_on_dirs = true,
          icons = {
            hint = '',
            info = '',
            warning = '',
            error = '',
          },
        },
        actions = {
          open_file = {
            quit_on_open = true,
          },
        },
        view = {
          side = 'right',
          width = 60,
        },
      })
    end,
  },
}
