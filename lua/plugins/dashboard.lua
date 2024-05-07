require("dashboard").setup({
    config = {
        packages = {
            enable = false,
        },
        header = {
            " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
            " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
            " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
            " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
            " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
            " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
            "",
            "",
        },
        shortcut = {
            {
                icon = " ",
                desc = "Files ",
                icon_hl = "Constant",
                group = "Constant",
                action = "Telescope find_files",
                key = "f",
            },
            {
                icon = " ",
                desc = "Sessions ",
                icon_hl = "String",
                group = "String",
                action = "Telescope session-lens",
                key = "s",
            },
            {
                icon = " ",
                desc = "Mason ",
                icon_hl = "Function",
                group = "Function",
                action = "Mason",
                key = "p",
            },
            {
                icon = "󰈆 ",
                desc = "Quit ",
                icon_hl = "Conditional",
                group = "Conditional",
                action = "quit",
                key = "q",
            },
        },
        project = {
            enable = true,
            limit = 4,
            icon = "󰘬 ",
            label = "Projects",
            action = "Telescope find_files cwd=",
        },
        mru = {
            limit = 8,
            icon = " ",
            label = "Recents",
            cwd_only = false,
        },
        footer = {
            "",
            "",
            "",
            "",
            "",
            "Editing text 🔥 blazingly fast 🔥 since 2014",
        },
    },
    shortcut_type = "number",
})

vim.api.nvim_set_hl(0, "DashboardHeader", { link = "String" })
vim.api.nvim_set_hl(0, "DashboardFooter", { link = "Comment" })
vim.api.nvim_set_hl(0, "DashboardProjectTitle", { link = "Comment"})
vim.api.nvim_set_hl(0, "DashboardProjectTitleIcon", { link = "Comment"})
vim.api.nvim_set_hl(0, "DashboardMruTitle", { link = "Comment"})
vim.api.nvim_set_hl(0, "DashboardMruIcon", { link = "Comment"})
