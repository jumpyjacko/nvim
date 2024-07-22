return {
	"max397574/better-escape.nvim",
	dir = "~/.config/nvim/dev/better-escape.nvim",
	event = "InsertEnter",
	opts = {
		timeout = vim.o.timeoutlen,
		default_mappings = true,
		mappings = {
			i = {
				N = {
                    E = "<Esc>",
				},
			},
			t = {
				N = {
					E = "<Esc>",
				},
			},
			s = {
				N = {
					E = "<Esc>",
				},
			},
		},
	},
}
