require("better_escape").setup {
    mapping = { "NE" },
    timeout = vim.o.timeoutlen,
    clear_empty_lines = false,
    keys = "<Esc>",
}
