vim.g.mapleader = " "

vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.swapfile = false
vim.o.timeoutlen = 150
vim.o.signcolumn = "yes"
vim.o.clipboard = "unnamedplus"
vim.o.termguicolors = true

vim.pack.add({
    { src = "https://github.com/stevearc/oil.nvim" },
    { src = "https://github.com/echasnovski/mini.pick" },
    { src = "https://github.com/lewis6991/gitsigns.nvim" },
    { src = "https://github.com/windwp/nvim-autopairs" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
    {
        src = "https://github.com/Saghen/blink.cmp",
        version = vim.version.range('v1.*'),
    },
    { src = "https://github.com/dgox16/oldworld.nvim" },
})

vim.cmd("colorscheme oldworld")

-- Remove Background
vim.api.nvim_set_hl(0, "StatusLine", { fg = "white", bg = "NONE" })
vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE" })
vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
vim.api.nvim_set_hl(0, "LineNr", { link = "Comment" })
vim.api.nvim_set_hl(0, "CursorLineNr", { link = "Comment" })

-- Setup Plugins
require "mini.pick".setup()
require "nvim-autopairs".setup()
require "mason".setup()
require "mason-lspconfig".setup()
require "oil".setup({
    columns = { "icon" },
    view_options = { show_hidden = true },
})
require "blink.cmp".setup({
    completion = {
        documentation = { auto_show = true },
        menu = {
            draw = {
                treesitter = { 'lsp' },
                padding = { 0, 1 },
                components = {
                    kind_icon = {
                        text = function(ctx)
                            return ' ' .. ctx.kind_icon .. ctx.icon_gap .. ' '
                        end,
                    }
                }
            }
        }
    },
    signature = { enabled = true },
    keymap = {
        preset = 'default',
        ['<Tab>'] = { 'select_next', 'fallback' },
        ['<S-Tab>'] = { 'select_prev', 'fallback' },
        ['<CR>'] = { 'accept', 'fallback' },
        ['<Esc>'] = { 'cancel', 'fallback' },
    }
})

-- Mappings
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')

vim.keymap.set({ 'n', 'v', 'x' }, '<leader>y', '"+y<CR>')
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>d', '"+d<CR>')

vim.keymap.set("i", "NE", "<Esc>", { noremap = true, silent = true })

vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)
vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action)
vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename)
vim.keymap.set('n', '<leader>ld', vim.diagnostic.open_float)
vim.keymap.set('n', '?', vim.lsp.buf.hover)

vim.keymap.set('n', '<leader>ff', ":Pick files<CR>")
vim.keymap.set('n', '<leader>fh', ":Pick help<CR>")
vim.keymap.set('n', '<leader>fg', ":Pick grep_live<CR>")
vim.keymap.set('n', '<leader>fb', ":Pick buffers<CR>")
vim.keymap.set('n', '<leader>e', ':Oil<CR>')

vim.keymap.set('n', '<leader>gs', ':Gitsigns stage_hunk<CR>')
vim.keymap.set('n', '<leader>gr', ':Gitsigns reset_hunk<CR>')

vim.api.nvim_set_hl(0, "MiniPickBorder", { bg = "NONE", fg = "NONE" })
vim.api.nvim_set_hl(0, "MiniPickBorderBusy", { bg = "NONE", fg = "NONE" })
vim.api.nvim_set_hl(0, "MiniPickNormal", { bg = "NONE" })
vim.api.nvim_set_hl(0, "MiniPickPreviewLine", { bg = "NONE" })

-- Autocommands
local function preserve_position()
    if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
        vim.cmd("normal! g'\"")
    end
end

vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = "*",
    callback = function()
        preserve_position()
    end,
})

vim.api.nvim_create_autocmd("VimResized", {
    pattern = "*",
    command = "wincmd =",
})

vim.api.nvim_create_autocmd("FocusGained", {
    pattern = "<buffer>",
    command = "checktime",
})

-- blink.cmp completion highlights
vim.api.nvim_set_hl(0, "BlinkCmpMenu", { fg = "#ACA1CF", bg = "NONE", italic = true })

-- Kind groups
vim.api.nvim_set_hl(0, "BlinkCmpAbbrDeprecated", { fg = "#8b8693", bg = "NONE", strikethrough = true })

vim.api.nvim_set_hl(0, "BlinkCmpKindField", { fg = "#ffffff", bg = "#EA83A5" })
vim.api.nvim_set_hl(0, "BlinkCmpKindProperty", { fg = "#ffffff", bg = "#EA83A5" })
vim.api.nvim_set_hl(0, "BlinkCmpKindEvent", { fg = "#ffffff", bg = "#EA83A5" })

vim.api.nvim_set_hl(0, "BlinkCmpKindText", { fg = "#ffffff", bg = "#90B99F" })
vim.api.nvim_set_hl(0, "BlinkCmpKindEnum", { fg = "#ffffff", bg = "#90B99F" })
vim.api.nvim_set_hl(0, "BlinkCmpKindKeyword", { fg = "#ffffff", bg = "#90B99F" })

vim.api.nvim_set_hl(0, "BlinkCmpKindConstant", { fg = "#ffffff", bg = "#E6B99D" })
vim.api.nvim_set_hl(0, "BlinkCmpKindConstructor", { fg = "#ffffff", bg = "#E6B99D" })
vim.api.nvim_set_hl(0, "BlinkCmpKindReference", { fg = "#ffffff", bg = "#E6B99D" })

vim.api.nvim_set_hl(0, "BlinkCmpKindFunction", { fg = "#ffffff", bg = "#ACA1CF" })
vim.api.nvim_set_hl(0, "BlinkCmpKindStruct", { fg = "#ffffff", bg = "#ACA1CF" })
vim.api.nvim_set_hl(0, "BlinkCmpKindClass", { fg = "#ffffff", bg = "#ACA1CF" })
vim.api.nvim_set_hl(0, "BlinkCmpKindModule", { fg = "#ffffff", bg = "#ACA1CF" })
vim.api.nvim_set_hl(0, "BlinkCmpKindOperator", { fg = "#ffffff", bg = "#ACA1CF" })

vim.api.nvim_set_hl(0, "BlinkCmpKindVariable", { fg = "#ffffff", bg = "#3c3c3f" })
vim.api.nvim_set_hl(0, "BlinkCmpKindFile", { fg = "#ffffff", bg = "#3c3c3f" })

vim.api.nvim_set_hl(0, "BlinkCmpKindUnit", { fg = "#ffffff", bg = "#F5A191" })
vim.api.nvim_set_hl(0, "BlinkCmpKindSnippet", { fg = "#ffffff", bg = "#F5A191" })
vim.api.nvim_set_hl(0, "BlinkCmpKindFolder", { fg = "#ffffff", bg = "#F5A191" })

vim.api.nvim_set_hl(0, "BlinkCmpKindMethod", { fg = "#ffffff", bg = "#92A2D5" })
vim.api.nvim_set_hl(0, "BlinkCmpKindValue", { fg = "#ffffff", bg = "#92A2D5" })
vim.api.nvim_set_hl(0, "BlinkCmpKindEnumMember", { fg = "#ffffff", bg = "#92A2D5" })

vim.api.nvim_set_hl(0, "BlinkCmpKindInterface", { fg = "#ffffff", bg = "#85B5BA" })
vim.api.nvim_set_hl(0, "BlinkCmpKindColor", { fg = "#ffffff", bg = "#85B5BA" })
vim.api.nvim_set_hl(0, "BlinkCmpKindTypeParameter", { fg = "#ffffff", bg = "#85B5BA" })

-- Status Line
vim.api.nvim_set_hl(0, "StlAccent", { fg = "#90B99F" })
vim.api.nvim_set_hl(0, "StlNormal", { fg = "#92A2D5" })
vim.api.nvim_set_hl(0, "StlInsert", { fg = "#90B99F" })
vim.api.nvim_set_hl(0, "StlVisual", { fg = "#ACA1CF" })
vim.api.nvim_set_hl(0, "StlReplace", { fg = "#EA83A5" })
vim.api.nvim_set_hl(0, "StlCommand", { fg = "#E6B99D" })

local function git_branch()
    local handle = io.popen("git rev-parse --abbrev-ref HEAD 2>/dev/null")
    if not handle then return "" end
    local branch = handle:read("*l")
    handle:close()
    if branch and branch ~= "" then
        return "%#StlAccent#" .. " " .. branch .. "%*"
    else
        return ""
    end
end

local function lsp_servers()
    local bufnr = vim.api.nvim_get_current_buf()
    local clients = vim.lsp.get_clients({ bufnr = bufnr })
    if #clients == 0 then return "" end
    local names = {}
    for _, client in pairs(clients) do
        table.insert(names, client.name)
    end
    return "%#StlAccent#" .. table.concat(names, ", ") .. "%*   "
end

local function mode_indicator()
    local mode_map = {
        n = { "NORMAL", "StlNormal" },
        i = { "INSERT", "StlInsert" },
        v = { "VISUAL", "StlVisual" },
        V = { "V-LINE", "StlVisual" },
        ["\22"] = { "V-BLOCK", "StlVisual" },
        c = { "COMMAND", "StlCommand" },
        R = { "REPLACE", "StlReplace" },
    }

    local mode = vim.api.nvim_get_mode().mode
    local label, group = unpack(mode_map[mode] or { "OTHER", ""})

    return "%#" .. group .. "#" .. "▎ " .. label .. " %* "
end

local function statusline()
    return table.concat {
        mode_indicator(),
        "%f %m %r",
        git_branch(),

        "%=",
        lsp_servers(),
        "Ln %l, Col %c [%p%%]"
    }
end

_G.statusline = statusline

vim.o.statusline = "%!v:lua.statusline()"
vim.o.showmode = false
