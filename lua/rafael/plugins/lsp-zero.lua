return {
  {
    -- Language Server Protocol
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      {
        'williamboman/mason.nvim',
        build = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'L3MON4D3/LuaSnip' },
      { 'folke/neodev.nvim', opts = {} },
    },
    config = function()
      local lsp = require('lsp-zero').preset({})

      lsp.on_attach(function(client, bufnr)
        lsp.default_keymaps({ buffer = bufnr })
        vim.keymap.set({ 'n', 'i', 'v' }, '<C-h>', vim.lsp.buf.signature_help, { buffer = true })

        lsp.buffer_autoformat()
      end)

      lsp.setup()

      local cmp = require('cmp')

      cmp.setup({
        mapping = {
          ['<CR>'] = cmp.mapping.confirm({ select = false }),
          ['<C-Space>'] = cmp.mapping.complete(),
        },
      })

      vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help)
    end,
  },
}
