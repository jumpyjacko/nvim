return {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPost",
    config = function()
        require("config.gitsigns")
    end,
}
