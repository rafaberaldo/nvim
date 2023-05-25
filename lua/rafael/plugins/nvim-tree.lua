return {
  {
    'nvim-tree/nvim-tree.lua',
    requires = 'nvim-tree/nvim-web-devicons',
    config = function()
      -- disable netrw
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      vim.keymap.set("n", "<leader>f", vim.cmd.NvimTreeFocus)

      require("nvim-tree").setup({
        actions = {
          open_file = {
            quit_on_open = true,
          },
        },
        view = {
          side = "right",
          width = 80
        }
      })
    end
  }
}
