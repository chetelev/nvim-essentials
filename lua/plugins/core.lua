return {
	{ "williamboman/mason.nvim", config = true },
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"ts_ls",
					"pyright",
					"html",
					"cssls",
					"jsonls",
					"eslint",
					"tailwindcss",
					"prettier",
				},
			})
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"prettier",
					"eslint_d",
					"stylua",
					"black",
				},
				run_on_start = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local on_attach = function(_, bufnr)
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr })
				vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr })
				vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr })
				vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = bufnr })
			end

			--Enable (broadcasting) snippet capability for completion
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities.textDocument.completion.completionItem.snippetSupport = true

			require("lspconfig").lua_ls.setup({
				on_attach = on_attach,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})

			require("lspconfig").ts_ls.setup({
				on_attach = on_attach,
			})

			require("lspconfig").pyright.setup({
				on_attach = on_attach,
			})

			require("lspconfig").html.setup({
				capabilities = capabilities,
			})

			require("lspconfig").cssls.setup({
				capabilities = capabilities,
			})

			require("lspconfig").jsonls.setup({
				capabilities = capabilities,
			})

			require("lspconfig").eslint.setup({
				on_attach = on_attach,
			})

			require("lspconfig").tailwindcss.setup({
				capabilities = capabilities,
			})
		end,
	},
}
