require("gitsigns").setup({
	signs = {
		add = { text = "┃" },
		change = { text = "┃" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
		untracked = { text = "┆" },
	},
	signcolumn = true,
})

vim.api.nvim_set_hl(0, "DiffAdd", { link = "String" })
vim.api.nvim_set_hl(0, "DiffChange", { link = "Type" })
vim.api.nvim_set_hl(0, "DiffDelete", { link = "Constant" })
