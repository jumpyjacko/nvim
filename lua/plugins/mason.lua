return {
    "williamboman/mason.nvim",
    event = "BufReadPost",
    cmd = "Mason",
    config = function()
        require("config.mason")
    end,
    dependencies = {
        {
            "nvimtools/none-ls.nvim",
            "neovim/nvim-lspconfig",
            "williamboman/mason-lspconfig.nvim",
            "jay-babu/mason-nvim-dap.nvim",
            "jay-babu/mason-null-ls.nvim",
        },
    },
}
