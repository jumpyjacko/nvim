return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    cmd = "Telescope",
    config = function()
        require("config.telescope")
    end,
    dependencies = { "nvim-lua/plenary.nvim" },
}
