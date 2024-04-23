require("auto-session").setup({
    log_level = "error",
    auto_session_suppress_dirs = { "~/", "~/Downloads", "~/.config/", "~/.config/nvim/", "~/code" },
    session_lens = {
        prompt_title = "Sessions",
        load_on_setup = true,
        theme_conf = { border = {}, borderchars = { "", "", "", "", "", "", "", "" } },
        previewer = false,
    },
})
