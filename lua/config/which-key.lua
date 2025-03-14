require("which-key").setup({
    preset = "classic",
    icons = {
        breadcrumb = "",
        separator = " > ",
        -- group = "󰍜 ",
        group = "",
    },
    win = {
        no_overlap = true,
        padding = { 1, 4 },
        title = false,
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
        { "<leader>s", group = "Spelling" },
    }
)
