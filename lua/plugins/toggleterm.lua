require("toggleterm").setup()

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({
	cmd = "lazygit",
	dir = "git_dir",
	direction = "float",
	float_opts = {
		border = "shadow",
	},
})

function _lazygit_toggle()
	lazygit:toggle()
end
