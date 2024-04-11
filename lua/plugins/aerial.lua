require("aerial").setup({
    on_attach = function (bufnr)
        vim.keymap.set("n", "{", "<cmd>AerialPrev<cr>", { buffer = bufnr })
        vim.keymap.set("n", "}", "<cmd>AerialNext<cr>", { buffer = bufnr })
    end,
})