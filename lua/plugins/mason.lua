require("mason").setup {}
require("mason-lspconfig").setup {
    ensure_installed = { "clangd", "lua_ls", "marksman", "pyright", "tsserver", "rust_analyzer", "zls" }
}

local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("mason-lspconfig").setup_handlers {
    function(server_name)
        require("lspconfig")[server_name].setup({
            capabilities = capabilities
        })
    end,
    ["rust_analyzer"] = function() end,
}

require("null-ls").setup {}
require("mason-null-ls").setup {
    ensure_installed = { "stylua" },
    automatic_installtion = false,
    handlers = {}
}
