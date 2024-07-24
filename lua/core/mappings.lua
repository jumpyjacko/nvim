function Map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true, nowait = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

-- Normal mode mappings
---- Fast Write/Quit
Map("n", "<leader>w", "<cmd>w<cr>", { desc = "Write file" })
Map("n", "<leader>q", "<cmd>q<cr>", { desc = "Close window" })

---- Telescope
Map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find File" })
Map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "List Buffers" })
Map("n", "<leader>fi", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "Search in file" })
Map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live Grep" })
Map("n", "<leader>ft", "<cmd>Telescope todo-comments<cr>", { desc = "List all TODOs" })

---- Package Mangement
Map("n", "<leader>pm", "<cmd>Mason<cr>", { desc = "Open Mason" })
Map("n", "<leader>pl", "<cmd>Lazy<cr>", { desc = "Open Lazy" })
Map("n", "<leader>pu", "<cmd>Lazy update<cr>", { desc = "Update Lazy packages" })

---- LSP Actions
Map("n", "?", "<cmd>lua vim.lsp.buf.hover()<cr>", { desc = "Hover symbol details" })
Map("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", { desc = "Code Action" })
Map("n", "<leader>ld", "<cmd>Telescope diagnostics bufnr=0<cr>", { desc = "Document Diagnostics" })
Map("n", "<leader>lw", "<cmd>Telescope diagnostics<cr>", { desc = "Workspace Diagnostics" })
Map("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{async=true}<cr>", { desc = "Format Buffer" })
Map("n", "<leader>li", "<cmd>LspInfo<cr>", { desc = "LSP Info" })
Map("n", "<leader>lI", "<cmd>LspInstallerInfo<cr>", { desc = "LSP Installer Info" })
Map("n", "<leader>ln", "<cmd>lua vim.lsp.diagnostic.goto_next()<cr>", { desc = "Next Diagnostic" })
Map("n", "<leader>le", "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", { desc = "Prev Diagnostic" })
Map("n", "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>", { desc = "CodeLens Action" })
Map("n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<cr>", { desc = "Quick Fix" })
Map("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", { desc = "Rename Symbol" })
Map("n", "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", { desc = "Document Symbols" })
Map("n", "<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", { desc = "Workspace Symbols" })

Map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", { desc = "Declaration of current symbol"})
Map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", { desc = "Show the definition of current symbol"})
Map("n", "gI", "<cmd>lua vim.lsp.buf.implementation()<cr>", { desc = "Show the definition of current symbol"})
Map("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", { desc = "Show the definition of current symbol"})

---- Git Actions
Map("n", "<leader>gg", "<cmd>lua _lazygit_toggle()<cr>", { desc = "Open LazyGit" })
Map("n", "<leader>gs", "<cmd>Gitsigns stage_hunk<cr>", { desc = "Stage hunk" })
Map("n", "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>", { desc = "Reset hunk" })
Map("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>", { desc = "Preview hunk"})
Map("n", "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<cr>", { desc = "Undo stage hunk" })
Map("n", "<leader>gS", "<cmd>Gitsigns stage_buffer<cr>", { desc = "Stage buffer" })
Map("n", "<leader>gR", "<cmd>Gitsigns reset_buffer<cr>", { desc = "Reset buffer" })
Map("n", "<leader>gb", "<cmd>Gitsigns blame_line<cr>", { desc = "View blame"})
Map("n", "<leader>gd", "<cmd>Gitsigns diffthis<cr>", { desc = "View diff" })

---- File Tree
Map("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Open File Tree" })
Map("n", "<leader>o", "<cmd>Neotree focus<cr>", { desc = "Focus File Tree" })

---- Buffer Stuff
Map("n", "<Tab>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
Map("n", "<S-Tab>", "<cmd>bprev<cr>", { desc = "Previous Buffer" })
Map("v", "<Tab>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
Map("v", "<S-Tab>", "<cmd>bprev<cr>", { desc = "Previous Buffer" })

Map("n", "<leader>c", "<cmd>bp | bd #<cr>", { desc = "Close Buffer" })

---- Colemak Bindings
Map("n", "h", "h", { desc = "Move left" })
Map("n", "n", "v:count == 0 ? 'gj' : 'j'", { desc = "Move down", expr = true, silent = true })
Map("n", "e", "v:count == 0 ? 'gk' : 'k'", { desc = "Move up", expr = true, silent = true })
Map("n", "i", "l", { desc = "Move right" })

Map("n", "l", "b", { desc = "Move to start of word" })
Map("n", "L", "B", { desc = "Move to start of word" })
Map("n", "u", "e", { desc = "Move to end of word" })
Map("n", "U", "E", { desc = "Move to end of word" })
Map("n", "y", "w", { desc = "Move to end of word" })
Map("n", "Y", "W", { desc = "Move to end of word" })

Map("n", "p", "t", { desc = "Move up to char" })
Map("n", "P", "T", { desc = "Move up to char (Reversed)" })
Map("n", "b", ";", { desc = "Repeat latest f or p" })
Map("n", "B", ",", { desc = "Repeat latest f or p (Reversed)" })
Map("n", "k", "nzz", { desc = "Repeat latest / or ?", expr = false })
Map("n", "K", "Nzz", { desc = "Repeat latest / or ? (Reversed)" })
Map("n", "<C-n>", "<C-d>zz", { desc = "Page Down" })
Map("n", "<C-e>", "<C-u>zz", { desc = "Page Up" })

Map("n", "s", "i", { desc = "Insert mode" })
Map("n", "S", "I", { desc = "Insert mode (Start of line)" })
Map("n", "t", "a", { desc = "Append mode" })
Map("n", "T", "A", { desc = "Append mode (End of line)" })
Map("n", "a", "v", { desc = "Visual mode" })
Map("n", "A", "V", { desc = "Visual line mode" })
Map("n", "<C-a>", "<C-v>", { desc = "Visual block mode" })
Map("n", "ga", "gv", { desc = "Visual mode (?)" })

Map("n", "x", "x", { desc = "Cut" })
Map("n", "c", "y", { desc = "Copy" })
Map("n", "v", "p", { desc = "Paste" })
Map("n", "X", "dd", { desc = "Cut line" })
Map("n", "C", "yy", { desc = "Copy line" })
Map("n", "V", "P", { desc = "Paste on current line" })
Map("n", "z", "u", { desc = "Undo" })
Map("n", "Z", "<C-R>", { desc = "Redo" })

Map("n", "w", "c")
Map("n", "W", "C")
Map("n", "ww", "cc")

Map("n", "<C-W>h", "<C-W>h")
Map("n", "<C-W>n", "<C-W>j")
Map("n", "<C-W>e", "<C-W>k")
Map("n", "<C-W>i", "<C-W>l")

-- Visual mode mappings
---- Colemak Bindings
Map("v", "h", "h", { desc = "Move left" })
Map("v", "n", "v:count == 0 ? 'gj' : 'j'", { desc = "Move down", expr = true, silent = true })
Map("v", "e", "v:count == 0 ? 'gk' : 'k'", { desc = "Move up", expr = true, silent = true })
Map("v", "i", "l", { desc = "Move right" })

Map("v", "l", "b", { desc = "Move to start of word" })
Map("v", "L", "B", { desc = "Move to start of word" })
Map("v", "u", "e", { desc = "Move to end of word" })
Map("v", "U", "E", { desc = "Move to end of word" })
Map("v", "y", "w", { desc = "Move to end of word" })
Map("v", "Y", "W", { desc = "Move to end of word" })

Map("v", "p", "t", { desc = "Move up to char" })
Map("v", "P", "T", { desc = "Move up to char (Reversed)" })
Map("v", "b", ";", { desc = "Repeat latest f or p" })
Map("v", "B", ",", { desc = "Repeat latest f or p (Reversed)" })
Map("v", "k", "nzz", { desc = "Repeat latest / or ?", expr = false })
Map("v", "K", "Nzz", { desc = "Repeat latest / or ? (Reversed)" })

Map("v", "x", "x", { desc = "Cut" })
Map("v", "c", "y", { desc = "Copy" })
Map("v", "v", "p", { desc = "Paste" })
Map("v", "X", "dd", { desc = "Cut line" })
Map("v", "C", "yy", { desc = "Copy line" })
Map("v", "V", "P", { desc = "Paste on current line" })
Map("v", "z", "u", { desc = "Undo" })
Map("v", "Z", "<C-R>", { desc = "Redo" })

Map("v", "gz", "U", { desc = "Capitalize Selection" })

-- Operator-pending mode mappings
---- Colemak Bindings
Map("o", "r", "i", { desc = "Selecting inner" })

-- Insert mode mappings
---- Delete Word
Map("i", "<C-BS>", "<C-o>db", { desc = "Delete Word" })
Map("i", "<C-Del>", "<C-o>dw", { desc = "Delete Word (Forward)" })

-- Terminal mode mappings
-- Uncomment and add terminal mode mappings if needed

-- Command-line mode mappings
-- Uncomment and add command-line mode mappings if needed

