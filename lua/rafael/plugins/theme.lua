return {
  -- {
  --   'navarasu/onedark.nvim',
  --   priority = 1000,
  --   config = function()
  --     require('onedark').setup({
  --       style = 'darker',
  --     })
  --     vim.cmd.colorscheme('onedark')
  --   end,
  -- },
  {
    'rebelot/kanagawa.nvim',
    priority = 1000,
    config = function()
      require('kanagawa').setup({
        keywordStyle = { italic = false },
      })
      vim.cmd.colorscheme('kanagawa')
    end,
  },
  -- {
  --   'rose-pine/neovim',
  --   priority = 1000,
  --   config = function()
  --     require('rose-pine').setup({
  --       variant = 'moon',
  --       disable_italics = true,
  --     })
  --     vim.cmd.colorscheme('rose-pine')
  --   end,
  -- },
  -- {
  --   'folke/tokyonight.nvim',
  --   priority = 1000,
  --   config = function()
  --     require('tokyonight').setup({
  --       style = 'night',
  --       styles = {
  --         keywords = { italic = false },
  --       },
  --     })
  --     vim.cmd.colorscheme('tokyonight')
  --   end,
  -- },
}
