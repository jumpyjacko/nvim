require("dashboard").setup({
    config = {
        packages = {
            enable = true,
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
                icon = " ",
                desc = "Lazy ",
                icon_hl = "String",
                group = "String",
                action = "Lazy",
                key = "l",
            },
            {
                icon = " ",
                desc = "Mason ",
                icon_hl = "Function",
                group = "Function",
                action = "Mason",
                key = "m",
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
            action = function(path) vim.cmd('Telescope find_files cwd=' .. path) end,
        },
        mru = {
            limit = 8,
            icon = " ",
            label = "Recents",
            cwd_only = true,
        },
        footer = {
            "",
            "",
            "Editing text 🔥 blazingly fast 🔥 since 2014",
        },
    },
    shortcut_type = "number",
    change_to_vcs_root = true,
})

vim.api.nvim_set_hl(0, "DashboardHeader", { link = "String" })
vim.api.nvim_set_hl(0, "DashboardFooter", { link = "Comment" })
