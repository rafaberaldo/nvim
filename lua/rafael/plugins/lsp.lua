return {
  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim', opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      -- 'folke/neodev.nvim',
    },
    config = function()
      print('oi')
      --  This function gets run when an LSP connects to a particular buffer.
      local on_attach = function(_, bufnr)
        local nmap = function(keys, func, desc)
          if desc then
            desc = 'LSP: ' .. desc
          end

          vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
        end

        local builtin = require('telescope.builtin')

        nmap('K', vim.lsp.buf.hover, 'Hover Info')
        nmap('<F2>', vim.lsp.buf.rename, '[R]e[n]ame')
        nmap('<F3>', vim.lsp.buf.format, '[R]e[n]ame')
        nmap('<F4>', vim.lsp.buf.code_action, '[C]ode [A]ction')
        nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
        nmap('gr', builtin.lsp_references, '[G]oto [R]eferences')
        nmap('gi', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
        nmap('go', vim.lsp.buf.type_definition, '[G]oto Type Definition')
        vim.keymap.set(
          { 'n', 'i' },
          '<C-h>',
          vim.lsp.buf.signature_helper,
          { buffer = bufnr, desc = 'Signature [H]elper' }
        )
      end

      local servers = {
        lua_ls = {
          Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
            diagnostics = {
              globals = { 'vim' },
            },
          },
        },
      }

      -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

      -- Ensure the servers above are installed
      local mason_lspconfig = require('mason-lspconfig')

      mason_lspconfig.setup({
        ensure_installed = vim.tbl_keys(servers),
      })

      mason_lspconfig.setup_handlers({
        function(server_name)
          require('lspconfig')[server_name].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name],
          })
        end,
      })
    end,
  },
}
