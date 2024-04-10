local rocks_config = {
    rocks_path = "/home/jackson/.local/share/nvim/rocks",
    luarocks_binary = "/home/jackson/.local/share/nvim/rocks/bin/luarocks",
}

vim.g.rocks_nvim = rocks_config

local luarocks_path = {
    vim.fs.joinpath(rocks_config.rocks_path, "share", "lua", "5.1", "?.lua"),
    vim.fs.joinpath(rocks_config.rocks_path, "share", "lua", "5.1", "?", "init.lua"),
}
package.path = package.path .. ";" .. table.concat(luarocks_path, ";")

local luarocks_cpath = {
    vim.fs.joinpath(rocks_config.rocks_path, "lib", "lua", "5.1", "?.so"),
    vim.fs.joinpath(rocks_config.rocks_path, "lib64", "lua", "5.1", "?.so"),
}
package.cpath = package.cpath .. ";" .. table.concat(luarocks_cpath, ";")

vim.opt.runtimepath:append(vim.fs.joinpath(rocks_config.rocks_path, "lib", "luarocks", "rocks-5.1", "*", "*"))

-- ??
vim.loader.enable()

-- Force colourscheme to load early?
require("rocks").packadd("mini.base16")

-- Key Mappings
vim.g.mapleader = " "
require("mappings")

-- General Vi/m Options
vim.wo.number = true
vim.opt.showmode = false
vim.wo.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.bo.softtabstop = 2
vim.o.timeoutlen = 200
vim.o.clipboard = "unnamedplus"
vim.wo.fillchars = "eob: "

-- Completion???
vim.opt.completeopt = {'menuone', 'noselect', 'noinsert'}
vim.opt.shortmess = vim.opt.shortmess + { c = true}
vim.api.nvim_set_option('updatetime', 300)

-- Fixing the god awful float background colours
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#3B4252", fg = "#5E81AC" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#3B4252" })
vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "#1d1f21" })
vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "#1d1f21" })
