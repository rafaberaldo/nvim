return {
	{
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
		},
		config = function()
			local lsp = require('lsp-zero').preset({})

			lsp.on_attach(function(client, bufnr)
				lsp.default_keymaps({ buffer = bufnr })
			end)

			lsp.setup()

			local cmp = require('cmp')

			cmp.setup({
				mapping = {
					['<CR>'] = cmp.mapping.confirm({ select = false }),
				}
			})


			vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help)

			-- Auto format on save
			vim.cmd [[autocmd BufWritePre *.php silent! lua vim.cmd("!php-cs-fixer fix %")]]
			vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
		end
	},
}
