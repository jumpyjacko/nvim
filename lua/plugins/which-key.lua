require("which-key").setup({
	icons = {
		breadcrumb = "",
		separator = " > ",
		group = "",
	},
	key_labels = {
		["<space>"] = "SPC",
		["<cr>"] = "ENT",
		["<tab>"] = "TAB",
		["<esc>"] = "ESC",
		["<bs>"] = "BSPC",
	},
	layout = {
		height = { min = 4, max = 20 },
		width = { min = 20, max = 50 },
		spacing = 3,
		align = "left",
	},
})

require("which-key").register({
  ["<leader>"] = {
    f = { name = "Telescope" },
    p = { name = "Packages" },
    l = { name = "LSP" },
    t = { name = "TODO" },
    g = { name = "Git" },
  },
})
