--- autocmds.lua - Autocommands
--
-- Author:  NTBBloodbath <bloodbathalchemist@protonmail.com>
-- URL:     https://github.com/NTBBloodbath/nvim
-- License: GPLv3
--
--- Code:

local function preserve_position()
	if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
		vim.cmd("normal! g'\"")
	end
end

local function create_directory_on_save()
	local fpath = vim.fn.expand("<afile>")
	local dir = vim.fn.fnamemodify(fpath, ":p:h")

	if vim.fn.isdirectory(dir) ~= 1 then
		vim.fn.mkdir(dir, "p")
	end
end

local au = vim.api.nvim_create_autocmd

-- Markdown -> no cmp, spellcheck
au("FileType", {
  pattern = "markdown",
  callback = function()
    -- Turn on spell checking and set the language.
    vim.opt_local.spell = true
    vim.opt_local.spelllang = "en_au"

    -- Disable built-in completion functions.
    -- This unsets any omni or custom completion that may be set for the buffer.
    vim.opt_local.omnifunc = nil
    vim.opt_local.completefunc = nil
  end,
})

-- Typst -> no cmp, spellcheck
au("FileType", {
  pattern = "typst",
  callback = function()
    -- Turn on spell checking and set the language.
    vim.opt_local.spell = true
    vim.opt_local.spelllang = "en_au"

    -- Disable built-in completion functions.
    -- This unsets any omni or custom completion that may be set for the buffer.
    vim.opt_local.omnifunc = nil
    vim.opt_local.completefunc = nil
  end,
})

-- Enable built-in tree-sitter parsers
au("FileType", {
	pattern = { "c", "lua", "vim", "help" },
	callback = function(args)
		if args.match == "help" then
			args.match = "vimdoc"
		end
		vim.treesitter.start(args.buf, args.match)
	end,
})

-- Autosave
-- au({ "InsertLeave", "FocusLost" }, {
--   pattern = "<buffer>",
--   command = "silent! write",
-- })

-- Update file on external changes
au("FocusGained", {
	pattern = "<buffer>",
	command = "checktime",
})

-- Align windows when resizing Neovim
au("VimResized", {
	pattern = "*",
	command = "wincmd =",
})

-- Format on save
-- au("BufWritePre", {
--   pattern = "<buffer>",
--   command = "silent! Format"
-- })

-- Auto cd to current buffer path  NOTE: Consider enabling this for neorg files
-- au("BufEnter", {
--   pattern = "*",
--   command = "silent! lcd %:p:h",
-- })

-- Automatically create directory when saving a file in case it does not exist
au("BufWritePre", {
	pattern = "*",
	callback = function()
		create_directory_on_save()
	end,
})

-- Preserve last editing position
au("BufReadPost", {
	pattern = "*",
	callback = function()
		preserve_position()
	end,
})

-- We do not like automatic comments on <cr> here, get lost
au("BufEnter", {
	pattern = "*",
	callback = function()
		vim.opt.formatoptions:remove({ "c", "r", "o" })
	end,
})

-- Quickly exit help pages
au("FileType", {
	pattern = "help",
	callback = function()
		vim.keymap.set("n", "q", "<cmd>q<cr>", {
			silent = true,
			buffer = true,
		})
	end,
})

-- Disable numbering, folding and signcolumn in Man pages and terminal buffers
-- local function disable_ui_settings()
--   local opts = {
--     number = false,
--     relativenumber = false,
--     signcolumn = "no",
--     foldcolumn = "0",
--     foldlevel = 999,
--   }
--   for opt, val in pairs(opts) do
--     vim.opt_local[opt] = val
--   end
-- end

-- local function start_term_mode()
--   disable_ui_settings()
--   vim.cmd("startinsert!")
-- end

-- au({ "BufEnter", "BufWinEnter" }, {
--   pattern = "man://*",
--   callback = disable_ui_settings,
-- })

-- au("TermOpen", {
--   pattern = "term://*",
--   callback = start_term_mode,
-- })

--- autocmds.lua ends here
