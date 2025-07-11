require("mason").setup({})
require("mason-lspconfig").setup({
    ensure_installed = { "clangd", "lua_ls", "marksman", "basedpyright", "ts_ls" },
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require("lspconfig");
lspconfig.lua_ls.setup({
    capabilities = capabilities,
    settings = {
        Lua = {
            workspace = {
                library = {
                    "${3rd}/love2d/library",
                },
            },
        },
    },
})
lspconfig.clangd.setup({
    cmd = {
        "clangd",
        "--fallback-style=webkit",
    },
})

vim.g.rustaceanvim = {
    server = {
        on_attach = function(client, bufnr)
            vim.lsp.handlers["textDocument/publishDiagnostics"] =
                vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
                    update_in_insert = true,
                    virtual_text = false,
                    signs = false,
                    underline = true,
                })
        end,
        default_settings = {
            ["rust_analyzer"] = {
                ["completion.enableSnippets"] = true,
                ["cargo"] = {
                    ["clippyPreference"] = "on",
                },
                ["check.command"] = "clippy",
            },
        },
    },
}

vim.api.nvim_set_hl(0, "MasonHighlight", { link = "Function" })
vim.api.nvim_set_hl(0, "MasonHighlightBlockBold", { link = "CmpItemKindMethod" })
vim.api.nvim_set_hl(0, "MasonHeader", { link = "CmpItemKindMethod" })

require("mason-null-ls").setup({
    ensure_installed = { "stylua", "black" },
    automatic_installtion = false,
    handlers = {},
})

require("null-ls").setup({
    autostart = true,
})
