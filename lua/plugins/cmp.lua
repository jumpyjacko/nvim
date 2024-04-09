local cmp = require("cmp")

cmp.setup({
	sources = {
		{ name = "nvim_lsp", keyword_length = 1 },
		{ name = "luasnip", keyword_length = 1 },
		{ name = "buffer", keyword_length = 1 },
        { name = "path", keyword_length = 1 },
	},
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
	mapping = cmp.mapping.preset.insert({
		["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<C-l>"] = cmp.mapping.complete(),
		["<Esc>"] = cmp.mapping.abort(),
	}),
})
