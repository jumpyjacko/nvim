return {
	"OXY2DEV/markview.nvim",
	lazy = false,
	config = function()
		local presets = require("markview.presets")
		require("markview").setup({
			markdown = {
				headings = {
					enable = true,
					shift_width = 0,

					heading_1 = {
						style = "label",
						sign = "󰌕 ",
						sign_hl = "MarkviewHeading1Sign",

						padding_left = "  ",
						padding_right = "  ",
						icon = "󰼏 ",
						hl = "MarkviewHeading1",
					},
					heading_2 = {
						style = "label",
						sign = "󰌖 ",
						sign_hl = "MarkviewHeading2Sign",

						padding_left = "  ",
						padding_right = "  ",
						icon = "󰎨 ",
						hl = "MarkviewHeading2",
					},
					heading_3 = {
						style = "label",

						padding_left = "  ",
						padding_right = "  ",
						icon = "󰼑 ",
						hl = "MarkviewHeading3",
					},
					heading_4 = {
						style = "label",

						padding_left = "  ",
						padding_right = "  ",
						icon = "󰎲 ",
						hl = "MarkviewHeading4",
					},
					heading_5 = {
						style = "label",

						padding_left = "  ",
						padding_right = "  ",
						icon = "󰼓 ",
						hl = "MarkviewHeading6",
					},
					heading_6 = {
						style = "label",

						padding_left = "  ",
						padding_right = "  ",
						icon = "󰎴 ",
						hl = "MarkviewPalette7",
					},
				},
                list_items = {
                    indent_size = 1,
                    shift_width = 1,
                    marker_minus = {
                        text = "-",
                        hl = "MarkviewPalette1fg",
                    }
                },
				tables = presets.tables.none,
			},
		})
	end,
}
