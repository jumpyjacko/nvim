return {
    "saecki/crates.nvim",
    tag = "stable",
    event = { "BufRead Cargo.toml" },
    config = function()
        require('crates').setup({
            null_ls = {
                enabled = true,
                name = "crates.nvim",
            },
        })
    end,
}
