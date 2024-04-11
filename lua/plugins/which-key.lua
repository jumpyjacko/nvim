require("which-key").setup {
    icons = {
        breadcrumb = "",
        separator = " > ",
        group = "",
    },
    key_labels = {
        ["<space>"] = "SPC",
        ["<cr>"] = "ENT",
        ["<tab>"] = "TAB",
        ["<esc>"] = "ESC",
        ["<bs>"] = "BSPC"
    },
    layout = {
        height = { min = 4, max = 20 },
        width = { min = 20, max = 50},
        spacing = 3,
        align = "left"
    }
}

require("which-key").register({ f = { name = "Telescope" } }, { prefix = "<leader>" })
require("which-key").register({ p = { name = "Packages" } }, { prefix = "<leader>" })
require("which-key").register({ l = { name = "LSP" } }, { prefix = "<leader>" })
require("which-key").register({ t = { name = "TODO" } }, { prefix = "<leader>" })
require("which-key").register({ g = { name = "Git" } }, { prefix = "<leader>" })

