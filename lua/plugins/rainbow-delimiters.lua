require("rainbow-delimiters.setup").setup({ -- NOTE: I can't get this to work for every file type
    query = {
        [''] = "rainbow-delimiters",
        lua = "rainbow-blocks",
    },
    highlight = {
        "RainbowDelimiterViolet",
        "RainbowDelimiterBlue",
        "RainbowDelimiterYellow",
        "RainbowDelimiterCyan",
        "RainbowDelimiterRed",
    },
})

vim.api.nvim_set_hl(0, "RainbowDelimiterViolet", { link = "Conditional" })
vim.api.nvim_set_hl(0, "RainbowDelimiterBlue", { link = "DiagnosticInfo" })
vim.api.nvim_set_hl(0, "RainbowDelimiterYellow", { link = "Type" })
vim.api.nvim_set_hl(0, "RainbowDelimiterCyan", { link = "Delimiter" })
vim.api.nvim_set_hl(0, "RainbowDelimiterRed", { link = "DiagnosticError" })
