vim.lsp.set_log_level("off")

local border = {
    {"", "FloatBorder"},
    {"", "FloatBorder"},
    {"", "FloatBorder"},
    {" ", "FloatBorder"},
    {"", "FloatBorder"},
    {"", "FloatBorder"},
    {"", "FloatBorder"},
    {" ", "FloatBorder"},
}

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = opts.border or border
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

require("null-ls").setup({})
