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

local colours = {
	bg = vim.fn.synIDattr(vim.fn.hlID("Folded"), "bg"),
	green = vim.fn.synIDattr(vim.fn.hlID("DiagnosticOk"), "fg"),
	orange = vim.fn.synIDattr(vim.fn.hlID("Tag"), "fg"),
	red = vim.fn.synIDattr(vim.fn.hlID("Constant"), "fg"),
}

vim.api.nvim_set_hl(0, "DiffAdd", { bg = colours.bg, fg = colours.green })
vim.api.nvim_set_hl(0, "DiffChange", { bg = colours.bg, fg = colours.orange })
vim.api.nvim_set_hl(0, "DiffDelete", { bg = colours.bg, fg = colours.red })
vim.api.nvim_set_hl(0, "SignColumn", { bg = colours.bg })
