-- Disable built-ins (yoinked from NTBBloodbath)
local builtins = {
    "tar",
    "zip",
    "gzip",
    "tarPlugin",
    "zipPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
}
local providers = {
    "perl",
    "node",
    "ruby",
    "python",
    "python3",
}

for _, builtin in ipairs(builtins) do
    vim.g["loaded_" .. builtin] = 1
end

for _, provider in ipairs(providers) do
    vim.g["loaded_" .. provider .. "_provider"] = 0
end

-- General Vi/m Options
vim.wo.number = true
vim.wo.relativenumber = true
vim.opt.showmode = false
vim.opt.wrap = false
vim.o.timeoutlen = 200
vim.o.clipboard = "unnamedplus"

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.bo.softtabstop = 2
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.termguicolors = true
vim.opt.lazyredraw = true

vim.opt.smoothscroll = true
vim.opt.mousescroll = { "hor:1", "ver:1" }

vim.opt.fillchars = {
    eob = " ",
}

-- Completion
vim.opt.completeopt = { "menuone", "noselect", "noinsert" }
vim.opt.shortmess = vim.opt.shortmess + { c = true }
vim.opt.updatetime = 200

-- Fixing the god awful float background colours
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#3B4252", fg = "#5E81AC" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#3B4252" })
vim.api.nvim_set_hl(0, "TelescopeNormal", {})
vim.api.nvim_set_hl(0, "TelescopeBorder", {})

-- Better Diagnostic Signs
vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })
