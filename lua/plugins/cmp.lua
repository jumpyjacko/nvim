local cmp = require("cmp")

cmp.setup {
    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
    },
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    preselect = "item",
    completion = {
        completeopt = "menu,menuone,noinsert"
    },
    mapping = {
        ["<cr>"] = cmp.mapping.confirm({ select = true }),
        ["<esc>"] = cmp.mapping.close(),
    }
}
