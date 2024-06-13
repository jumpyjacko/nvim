require("mason").setup({})
require("mason-lspconfig").setup({
    ensure_installed = { "clangd", "lua_ls", "marksman", "pyright", "tsserver", "zls" },
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()
require("mason-lspconfig").setup_handlers({
    function(server_name)
        require("lspconfig")[server_name].setup({
            capabilities = capabilities,
            on_attach = function(client, bufnr)
                vim.lsp.handlers["textDocument/publishDiagnostics"] =
                    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
                        update_in_insert = true,
                        virtual_text = false,
                        signs = false,
                        underline = true,
                    })
            end,
        })
    end,
    ["rust_analyzer"] = function() end,
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
	ensure_installed = { "stylua" },
	automatic_installtion = false,
	handlers = {},
})
