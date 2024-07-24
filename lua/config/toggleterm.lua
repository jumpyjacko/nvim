require("toggleterm").setup({
    open_mapping = [[<F7>]],
    shade_terminals = false,
    start_in_insert = true,
    insert_mappings = true,
    terminal_mappings = true,
    direction = "float",
    float_opts = {
        border = "single",
    },
})

local Terminal = require("toggleterm.terminal").Terminal

local lazygit = Terminal:new({
    -- display_name = "Lazygit",
	cmd = "lazygit",
	dir = "git_dir",
	direction = "float",
	float_opts = {
		border = "none",
	},
})

function _lazygit_toggle()
	lazygit:toggle()
end
