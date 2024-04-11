require("options")
require("mappings")
require("rocks-setup")

vim.cmd("colorscheme modified_ocean")

-- Removing colour of vertical splits
vim.api.nvim_set_hl(0, "VertSplit", {})
vim.api.nvim_set_hl(0, "WinSeparator", {})
vim.cmd([[set fillchars=vert:\ ]])
