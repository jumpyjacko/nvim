require("which-key").setup({
    icons = {
        breadcrumb = "",
        separator = " > ",
        group = "󰍜 ",
    },
    layout = {
        -- height = { min = 4, max = 20 },
        -- width = { min = 20, max = 50 },
        -- spacing = 3,
        align = "left",
    },
    show_help = false,
})

require("which-key").add(
    {
        { "<leader>f", group = "Telescope" },
        { "<leader>g", group = "Git" },
        { "<leader>l", group = "LSP" },
        { "<leader>p", group = "Packages" },
        { "<leader>r", group = "Rust Crates" },
        { "<leader>t", group = "TODO" },
    }
)
