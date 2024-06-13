return {
    "nvimtools/none-ls.nvim",
    "neovim/nvim-lspconfig",
    event = "BufReadPost",
    config = function()
        require("config.lsp")
    end,

}
