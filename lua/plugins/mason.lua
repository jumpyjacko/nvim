require("mason").setup {}
require("mason-lspconfig").setup {}
require("null-ls").setup {}
require("mason-null-ls").setup {}

local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("mason-lspconfig").setup_handlers {
    function (server_name)
        require("lspconfig")[server_name].setup{
            capabilities = capabilities
        }
    end,
    ["rust_analyzer"] = function() end,
}
