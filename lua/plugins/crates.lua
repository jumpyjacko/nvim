return {
    "saecki/crates.nvim",
    tag = "stable",
    event = { "BufRead Cargo.toml" },
    config = function()
        require("crates").setup({
            null_ls = {
                enabled = true,
                name = "crates.nvim",
            },
        })

        local crates = require("crates")
        
        Map("n", "<leader>rt", crates.toggle, { desc = "Toggle crates.nvim" })
        Map("n", "<leader>rr", crates.reload, { desc = "Reload crates.nvim" })
        
        Map("n", "<leader>rf", crates.show_features_popup, { desc = "Show features popup" })
        Map("n", "<leader>rd", crates.show_dependencies_popup, { desc = "Show dependencies popup" })

        Map("n", "<leader>ru", crates.update_crate, { desc = "Update crate" })
        Map("v", "<leader>ru", crates.update_crates, { desc = "Update crates" })
        Map("n", "<leader>ra", crates.update_all_crates, { desc = "Update all crates" })
        Map("n", "<leader>ru", crates.upgrade_crate, { desc = "Upgrade crate" })
        Map("v", "<leader>rU", crates.upgrade_crates, { desc = "Upgrade crates" })
        Map("n", "<leader>rA", crates.upgrade_all_crates, { desc = "Upgrade all crates" })

        Map("n", "<leader>rx", crates.expand_plain_crate_to_inline_table, { desc = "Expand crate to inline table" })
        Map("n", "<leader>rX", crates.extract_crate_into_table, { desc = "Extract crate into table" })
    end,
}
