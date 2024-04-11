require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = { "clangd", "lua_ls", "marksman", "pyright", "tsserver", "rust_analyzer", "zls" },
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("mason-lspconfig").setup_handlers({
	function(server_name)
		require("lspconfig")[server_name].setup({
			capabilities = capabilities,
			on_attach = function(client, bufnr)
				-- Disable displaying LSP diagnostics in the gutter
				vim.lsp.handlers["textDocument/publishDiagnostics"] =
					vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
						update_in_insert = false, -- Disable updating diagnostics during insert mode
						virtual_text = true, -- Disable virtual text (inline messages)
						signs = false, -- Enable signs (e.g., error signs in the gutter)
						underline = false, -- Disable underline for diagnostics
					})
			end,
		})
	end,
	["rust_analyzer"] = function() end,
})

require("null-ls").setup({})
require("mason-null-ls").setup({
	ensure_installed = { "stylua" },
	automatic_installtion = false,
	handlers = {},
})
