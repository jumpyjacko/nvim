local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true, nowait = true }
    if opts then
        if opts.desc then
            opts.desc = "keymaps.lua: " .. opts.desc
        end
        options = vim.tbl_extend('force', options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

-- Normal mode mappings
---- Fast Write/Quit
map("n", "<leader>w", "<cmd>w<cr>", { desc = "Write file" })
map("n", "<leader>q", "<cmd>q<cr>", { desc = "Close window" })

---- Find Group
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find File" })
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "List Buffers" })
map("n", "<leader>fi", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "Search in file" })

map("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", { desc = "Code Action" })
map("n", "<leader>ld", "<cmd>Telescope diagnostics bufnr=0<cr>", { desc = "Document Diagnostics" })
map("n", "<leader>lw", "<cmd>Telescope diagnostics<cr>", { desc = "Workspace Diagnostics" })
map("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{async=true}<cr>", { desc = "Format Buffer" })
map("n", "<leader>li", "<cmd>LspInfo<cr>", { desc = "LSP Info" })
map("n", "<leader>lI", "<cmd>LspInstallerInfo<cr>", { desc = "LSP Installer Info" })
map("n", "<leader>ln", "<cmd>lua vim.lsp.diagnostic.goto_next()<cr>", { desc = "Next Diagnostic" })
map("n", "<leader>le", "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", { desc = "Prev Diagnostic" })
map("n", "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>", { desc = "CodeLens Action" })
map("n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<cr>", { desc = "Quick Fix" })
map("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", { desc = "Rename Symbol" })
map("n", "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", { desc = "Document Symbols" })
map("n", "<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", { desc = "Workspace Symbols" })

map("n", "<Tab>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<S-Tab>", "<cmd>bprev<cr>", { desc = "Previous Buffer" })

---- Colemak Bindings
map("n", "h", "h", { desc = "Move left" })
map("n", "n", "v:count == 0 ? 'gj' : 'j'", { desc = "Move down", expr = true, silent = true })
map("n", "e", "v:count == 0 ? 'gk' : 'k'", { desc = "Move up", expr = true, silent = true })
map("n", "i", "l", { desc = "Move right" })

map("n", "l", "b", { desc = "Move to start of word" })
map("n", "L", "B", { desc = "Move to start of word" })
map("n", "u", "e", { desc = "Move to end of word" })
map("n", "U", "E", { desc = "Move to end of word" })
map("n", "y", "w", { desc = "Move to end of word" })
map("n", "Y", "W", { desc = "Move to end of word" })

map("n", "p", "t", { desc = "Move up to char" })
map("n", "P", "T", { desc = "Move up to char (Reversed)" })
map("n", "b", ";", { desc = "Repeat latest f or p" })
map("n", "B", ",", { desc = "Repeat latest f or p (Reversed)" })
map("n", "k", "nzz", { desc = "Repeat latest / or ?", expr = false })
map("n", "K", "Nzz", { desc = "Repeat latest / or ? (Reversed)" })
map("n", "<C-n>", "<C-d>zz", { desc = "Page Down" })
map("n", "<C-e>", "<C-u>zz", { desc = "Page Up" })

map("n", "s", "i", { desc = "Insert mode" })
map("n", "S", "I", { desc = "Insert mode (Start of line)" })
map("n", "t", "a", { desc = "Append mode" })
map("n", "T", "A", { desc = "Append mode (End of line)" })
map("n", "a", "v", { desc = "Visual mode" })
map("n", "A", "V", { desc = "Visual line mode" })
map("n", "<C-a>", "<C-v>", { desc = "Visual block mode" })
map("n", "ga", "gv", { desc = "Visual mode (?)" })

map("n", "x", "x", { desc = "Cut" })
map("n", "c", "y", { desc = "Copy" })
map("n", "v", "p", { desc = "Paste" })
map("n", "X", "dd", { desc = "Cut line" })
map("n", "C", "yy", { desc = "Copy line" })
map("n", "V", "P", { desc = "Paste on current line" })
map("n", "z", "u", { desc = "Undo" })
map("n", "gz", "U", { desc = "Undo (?)" })
map("n", "Z", "<C-R>", { desc = "Redo" })

map("n", "w", "c")
map("n", "W", "C")
map("n", "ww", "cc")

map("n", "<C-W>h", "<C-W>h")
map("n", "<C-W>n", "<C-W>j")
map("n", "<C-W>e", "<C-W>k")
map("n", "<C-W>i", "<C-W>l")

-- Visual mode mappings
map("v", "<Tab>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("v", "<S-Tab>", "<cmd>bprev<cr>", { desc = "Previous Buffer" })

---- Colemak Bindings
map("v", "h", "h", { desc = "Move left" })
map("v", "n", "v:count == 0 ? 'gj' : 'j'", { desc = "Move down", expr = true, silent = true })
map("v", "e", "v:count == 0 ? 'gk' : 'k'", { desc = "Move up", expr = true, silent = true })
map("v", "i", "l", { desc = "Move right" })

map("v", "l", "b", { desc = "Move to start of word" })
map("v", "L", "B", { desc = "Move to start of word" })
map("v", "u", "e", { desc = "Move to end of word" })
map("v", "U", "E", { desc = "Move to end of word" })
map("v", "y", "w", { desc = "Move to end of word" })
map("v", "Y", "W", { desc = "Move to end of word" })

map("v", "p", "t", { desc = "Move up to char" })
map("v", "P", "T", { desc = "Move up to char (Reversed)" })
map("v", "b", ";", { desc = "Repeat latest f or p" })
map("v", "B", ",", { desc = "Repeat latest f or p (Reversed)" })
map("v", "k", "nzz", { desc = "Repeat latest / or ?", expr = false })
map("v", "K", "Nzz", { desc = "Repeat latest / or ? (Reversed)" })

map("v", "x", "x", { desc = "Cut" })
map("v", "c", "y", { desc = "Copy" })
map("v", "v", "p", { desc = "Paste" })
map("v", "X", "dd", { desc = "Cut line" })
map("v", "C", "yy", { desc = "Copy line" })
map("v", "V", "P", { desc = "Paste on current line" })
map("v", "z", "u", { desc = "Undo" })
map("v", "gz", "U", { desc = "Undo (?)" })
map("v", "Z", "<C-R>", { desc = "Redo" })

-- Operator-pending mode mappings
---- Colemak Bindings
map("o", "r", "i", { desc = "Selecting inner" })

-- Insert mode mappings
---- Delete Word
map("i", "<C-BS>", "<C-o>db", { desc = "Delete Word" })
map("i", "<C-Del>", "<C-o>dw", { desc = "Delete Word (Forward)" })

-- Terminal mode mappings
-- Uncomment and add terminal mode mappings if needed

-- Command-line mode mappings
-- Uncomment and add command-line mode mappings if needed
