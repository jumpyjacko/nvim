local border_style = { " ", " ", " ", " ", " ", " ", " ", " " }

require("neo-tree").setup({
    close_if_last_window = true,
    popup_border_style = border_style,
    default_component_configs = {
        name = {
            trailing_slash = true,
        },
        git_status = {
            symbols = {
                -- Change type
                added = "",
                modified = "",
                deleted = "",
                renamed = "",
                -- Status type
                untracked = "",
                ignored = "",
                unstaged = "",
                staged = "",
                conflict = "",
            },
        },
    },
    window = {
        position = "left",
        width = 30,
        mappings = {
            ["<space>"] = {
                "toggle_node",
                nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use
            },
            ["<2-LeftMouse>"] = "open",
            ["<cr>"] = "open",
            ["o"] = "open",
            ["<esc>"] = "cancel",       -- close preview or floating neo-tree window
            ["<tab>"] = function(state) -- open without losing focus
                state.commands["open"](state)
                vim.cmd("Neotree reveal")
            end,
            ["S"] = "open_split",
            ["s"] = "open_vsplit",
            ["t"] = "open_tabnew",
            ["w"] = "open_with_window_picker",
            ["C"] = "close_node",
            ["z"] = "close_all_nodes",
            ["Z"] = "expand_all_nodes",
            ["e"] = "noop",
            ["a"] = {
                "add",
                -- this command supports BASH style brace expansion ("x{a,b,c}" -> xa,xb,xc). see `:h neo-tree-file-actions` for details
                -- some commands may take optional config options, see `:h neo-tree-mappings` for details
                config = {
                    show_path = "none", -- "none", "relative", "absolute"
                },
            },
            ["A"] = "add_directory", -- also accepts the optional config.show_path option like "add". this also supports BASH style brace expansion.
            ["d"] = "delete",
            ["r"] = "rename",
            ["y"] = "copy_to_clipboard",
            ["x"] = "cut_to_clipboard",
            ["p"] = "paste_from_clipboard",
            ["c"] = "copy", -- takes text input for destination, also accepts the optional config.show_path option like "add":
            ["m"] = "move", -- takes text input for destination, also accepts the optional config.show_path option like "add".
            ["q"] = "close_window",
            ["R"] = "refresh",
            ["?"] = "show_help",
            ["<"] = "prev_source",
            [">"] = "next_source",
            ["i"] = "show_file_details",
        },
    },
    filesystem = {
        hijack_netrw_behavior = "open_current",
        filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = false,
        },
        follow_current_file = {
            enabled = true,
            leave_dirs_open = true,
        },
    },
    event_handlers = {
        {
            event = "neo_tree_window_after_open",
            handler = function(args)
                if args.position == "left" or args.position == "right" then
                    vim.cmd("wincmd =")
                end
            end,
        },
        {
            event = "neo_tree_window_after_close",
            handler = function(args)
                if args.position == "left" or args.position == "right" then
                    vim.cmd("wincmd =")
                end
            end,
        },
    },
})
